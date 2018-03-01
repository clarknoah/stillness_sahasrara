
const express = require('express')
var reload = require('reload');
var routes = require('./routes');
var models = require('./models');
var db = require('./neo4j/dbUtils');
var model = require('./startup/qualiaFields')
var utils = require('./utils');
var moment = require('moment');
var bodyParser = require('body-parser');
var extracted = require('./extract');
var _ = require('lodash');
var path = require('path');
const app = express();
var https = require('https');
var fs = require('fs');
var passport = require('passport-facebook');


var options = {
   //ca: [fs.readFileSync(PATH_TO_BUNDLE_CERT_1), fs.readFileSync(PATH_TO_BUNDLE_CERT_2)],
   cert: fs.readFileSync(__dirname+"/dev_certs/iam_dev.crt"),
   key: fs.readFileSync(__dirname+"/dev_certs/iam_dev.pem")
 };

app.use(express.static(__dirname + '/dist'))

models.qualiaForms.loadForms();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

var currentUser = {
  label:"Atman",
  first_name:"Noah",
  last_name:"Clark",
  id:175
};




app.get('/updateCentralDogma', (req, res) => {
  model.getCentralDogmaLabels();
  res.send('updated');
});


app.post('/getConceptList', function(req, res){
  var requestVars = req.body;
  var session = db.getSession();
  session
    .run(
      `MATCH (n:${requestVars.concept_label})
      RETURN collect({${requestVars.qualia_field_name}:n.${requestVars.qualia_field_name}, id:ID(n),label:'${requestVars.concept_label}'}) as conceptList`)

    .then(function(result){
      session.close();
      var returnList = [];

    res.send(result.records[0]._fields[0]);
    })
    .catch(function(err){
      console.log(err);
    });
});

app.post('/getConceptQualiaList', function(req, res){
  var requestVars = req.body;
    var session = db.getSession();
  session
    .run( 'MATCH (c:'+requestVars.concept_label+')-[]->(q:Qualia)' +
          'WHERE (c).label_name="'+requestVars.concept_label+'" ' +
          'RETURN collect(properties(q)) as qualiaProperties')
    .then(function(result){
      session.close();
        var concept = {};
      concept.properties = result.records[0]._fields[0]


  //console.log(JSON.stringify(result.records[0]._fields[0]));
    })
    .catch(function(err){
      console.log(err);
    });
});

app.post('/getNewConceptForm',function(req,res){
      var conceptLabel = req.body.conceptLabel;
      var conceptForm = _.cloneDeep(model.conceptForms[conceptLabel]);
      res.send(conceptForm);
    })

submitPayload = function(payload){
  var session = db.getSession();
  session
    .run(db.compileDatabaseQuery(payload))
    .then(function(result){
      session.close();
    //  console.log(result);
    })
    .catch(function(err){
      console.log(err);
    })

}

app.post('/submitFormPayload', function(req,res){
  var session = db.getSession();
  session
    .run(db.compileDatabaseQuery(req.body))
    .then(function(result){
      session.close();
    //  console.log(result);
      res.send(result)
    })
    .catch(function(err){
      console.log(err);
    })

})

assignFollowedBy = function(){

  var session = db.getSession();

  session
    .run(`MATCH (experience)<-[:perceived]-(n:Meditation_Instance)-[:instance_of]->(b:Meditation_Type)
    RETURN DISTINCT ID(n), collect({time_on_timer: experience.time_on_timer, exp_id:ID(experience)})`)
    .then(function(results){
      var createArray = [];
      var matchArray = [];
      var whereArray = [];
      for(var i in results.records){
        var record = results.records[i];

        for(var index in record._fields[1]){
          record._fields[1][index].time_on_timer = record._fields[1][index].time_on_timer.low;
          record._fields[1][index].exp_id = record._fields[1][index].exp_id.low;
        }
      record._fields[1] =  record._fields[1].sort(function(a,b){
                  return a.time_on_timer - b.time_on_timer;
                });
      //  console.log(record._fields[1]);
        if(record._fields[1].length > 1){
          for(var setIndex = 1; setIndex < record._fields[1].length;  setIndex ++){
            firstExp = record._fields[1][setIndex-1];
            matchArray.push(`(var_${firstExp.exp_id}:Experience)`);
            whereArray.push(`ID(var_${firstExp.exp_id})=${firstExp.exp_id}`);
            secondExp=  record._fields[1][setIndex];
            matchArray.push(`(var_${secondExp.exp_id}:Experience)`);
            whereArray.push(`ID(var_${secondExp.exp_id})=${secondExp.exp_id}`);
            createStatement = `(var_${firstExp.exp_id})-[:followed_by]->(var_${secondExp.exp_id})`;
            createArray.push(createStatement);
          }
        }

      }
      matchArray = _.uniq(matchArray);
      whereArray = _.uniq(whereArray);
      createArray = _.uniq(createArray);
      var finalQuery = `
        MATCH ${matchArray.join(",")}
        WHERE ${whereArray.join(" AND \n ")}
        CREATE ${createArray.join(", \n ")}
      `;

    })
}


app.post('/mockSubmitFormPayload', function(req,res){
  console.log(db.compileDatabaseQuery(req.body));
});

app.post('/getCentralDogmaConceptQualias', function(req,res){
  var session = db.getSession();
  session
      .run(`MATCH (n)-[:approved_qualia]->(q:Qualia)
      WHERE ID(n)=${req.body.id}
      RETURN collect(distinct {id:ID(q),display_name:q.display_name})`)
      .then(function(results){
        session.close();
        var returnArray = results.records[0]._fields[0];
        res.send(returnArray);
      })
      .catch(function(err){
        console.log(err);
      }
      )
})

app.post('/getExistingConceptForm',function(req,res){

    let templateConcept =   _.cloneDeep(model.conceptForms[req.body.conceptLabel]);

      var session = db.getSession();

      session
        .run(db.compileEntanglementRetrivalQuery(
              req.body.id,
              templateConcept.entanglements))
        .then(function(result){
            session.close();
            var concept = result.records[0]._fields[0];
            result.records[0]._fields.splice(0,1);
            entanglements = result.records[0]._fields;
            for(var i in entanglements){
              var entanglement = entanglements[i];
              if(entanglement.display_name !== null){
                templateConcept.entanglements[i]
                .current_value = entanglement[0].concept_id.low;
                templateConcept.entanglements[i]
                .entanglement_id = entanglement[0].entanglement_id.low;
                templateConcept.entanglements[i]
                .current_display_name = entanglement[0].display_name;
              }
            }
            for(var qualiaKey in concept.properties){
              var qualiaIndex = utils.findElementIndex(
                templateConcept.qualias,
                qualiaKey
              );

            if(templateConcept.qualias[qualiaIndex]!==undefined){
               templateConcept
               .qualias[qualiaIndex]
               .current_value = concept.properties[qualiaKey];
             }
            }



            templateConcept.id = concept.identity.low;
            res.send(templateConcept);
        }
        )

    })


app.post('/login',function(req,res){
  console.log("Logging into Stillness!");
  var user = req.body;

  var response = {
    loginSuccess:null,
    message:null,
    currentAtman:null
  };

  var session = db.getSession();
  session
    .run(`MATCH (user:Atman)
    WHERE
    user.username = '${user.username}' AND
    user.password = '${user.password}'
    RETURN user`)
    .then(function(result){
      session.close();
        if(result.records.length > 0 ){
          var atman = result.records[0]._fields[0];
          currentUser = atman;
          response.loginSuccess = true;
          response.message = "Login Successful!";
          response.currentAtman = atman;
          res.send(response);
        }else{
          response.loginSuccess = false;
          response.message = 'Either user does not exist, or password is incorrect.';
          res.send(response);
        }


        res.send(result);
    })
})

app.get('/logout',function(req,res){
  console.log(currentUser);
  var name = currentUser.properties.username;
  console.log("Logging out of Stillness!");
  currentUser = null;
  var response = {
    logoutSuccess:true,
    message:`${name} has successfully logged out`,
    currentAtman:null
  };
  res.send(response);
})



app.get('/testurl', (req, res) => {
  res.send("Hello World");
});


app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist/index.html'));
});

reload(app);
var server = https.createServer(options, app);

server.listen(3000, () => console.log('Example app listening on port 3000!'));
