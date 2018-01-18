
const express = require('express')
var reload = require('reload');
var routes = require('./routes');
var models = require('./models');
var db = require('./neo4j/dbUtils');
var model = require('./startup/qualiaFields')
var utils = require('./utils');
var moment = require('moment');
var bodyParser = require('body-parser');
const app = express();

models.qualiaForms.loadForms();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

var currentUser = {
  label:"Atman",
  first_name:"Noah",
  last_name:"Clark",
  id:175
};


app.get('/', (req, res) => res.send('Hello World!'));


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
      var conceptForm = model.conceptForms[conceptLabel];
      res.send(conceptForm);
    })



app.post('/submitFormPayload', function(req,res){
  var session = db.getSession();
  console.log(req.body);
  console.log(db.compileDatabaseQuery(req.body));
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
      console.log(req.body);
      var session = db.getSession();
      session
        .run(`MATCH (n) WHERE ID(n)=${req.body.id} RETURN n`)
        .then(function(result){
            session.close();
            console.log(result.records[0]);
            var concept = result.records[0]._fields[0];
            var templateConcept = model.conceptForms[concept.labels[0]];
            console.log(templateConcept);
            for(var qualiaKey in concept.properties){
              console.log(qualiaKey);
              var qualiaIndex = utils.findElementIndex(
                templateConcept.qualias,
                qualiaKey
              );
              console.log(qualiaIndex);

             templateConcept.qualias[qualiaIndex]
             .current_value = concept.properties[qualiaKey];
            }
            templateConcept.id = concept.identity.low;
            res.send(templateConcept);
        }
        )

    })





















reload(app);

app.listen(3000, () => console.log('Example app listening on port 3000!'));
