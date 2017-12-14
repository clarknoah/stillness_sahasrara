const express = require('express')
var reload = require('reload');
var routes = require('./routes');
var db = require('./neo4j/dbUtils');
var moment = require('moment');
var bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

var currentUser = {
  label:"Atman",
  first_name:"Noah",
  last_name:"Clark",
  id:175
};



function getNeo4jTimestamp(){
  return 'timestamp()';
}

function stringify(obj_from_json){
    if(typeof obj_from_json !== "object" || Array.isArray(obj_from_json)){
        // not an object, stringify using native function
        return JSON.stringify(obj_from_json);
    }
    // Implements recursive object serialization according to JSON spec
    // but without quotes around the keys.
    let props = Object
        .keys(obj_from_json)
        .map(key => `${key}:${stringify(obj_from_json[key])}`)
        .join(",");
    return `{${props}}`;
}

function generateLoadVariables(variableArray){
  matchStatement = "MATCH ";
  whereStatement = "WHERE ";
  collectionOfVariables = [];
  collectionOfWhereStatements = [];

  for(index in variableArray){
    var concept = variableArray[index];
    formattedVariable = `(${concept.key})`;
    formattedWhereStatement = `ID(${concept.key})=${concept.id}`
    collectionOfVariables.push(formattedVariable);
    collectionOfWhereStatements.push(formattedWhereStatement);
  }
  generatedMatchStatement = matchStatement + collectionOfVariables.toString() + ' \n ';
  generatedWhereStatement = whereStatement + collectionOfWhereStatements.join(' AND ');

  if(variableArray.length > 0){
    return generatedMatchStatement + generatedWhereStatement;
  }else{
    return "";
  }

}

function generateCreateConcepts(createArray){
  collectionOfCreateStatements = [];

  for(index in createArray){
    create = createArray[index];
    formattedCreateStatement = `CREATE (${create.key}:${create.label} ${stringify(create.qualias)}) \n`;
    collectionOfCreateStatements.push(formattedCreateStatement);
  }
  if(createArray.length > 0){
    return collectionOfCreateStatements.join("");
  }else{
    return "";
  }

}

function generateEntanglements(entanglementsArray){
  collectionOfEntanglements = [];

  for(index in entanglementsArray){
    create = entanglementsArray[index];
    formattedEntanglementStatement = `CREATE (${create.source_key})-[:${create.db_name}]->(${create.target_key}) \n`;
    collectionOfEntanglements.push(formattedEntanglementStatement);
  }
  if(entanglementsArray.length > 0){
    return collectionOfEntanglements.join("");
  }else{
    return "";
  }

}

function compileDatabaseQuery(query){
  formattedQuery = `${generateLoadVariables(query.load_variables)}
    ${generateCreateConcepts(query.create_concepts)}
    ${generateEntanglements(query.create_entanglements)}`;
  return formattedQuery;
}

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
  console.log(result.records[0]._fields);
    //  for(record in result.records){
    //    console.log(record);
    //    var listItem = {
    //      concept_id:result.records[record]._fieldLookup.id,
    //      label_name:requestVars.concept_label,
    //      display_value: result.records[record]._fieldLookup.display_value
    //    };
    //    returnList.push(listItem);
    //  }

    //  console.log(returnList);
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

  console.log(concept.properties);
  //console.log(JSON.stringify(result.records[0]._fields[0]));
    })
    .catch(function(err){
      console.log(err);
    });
});

app.get('/getConceptForm',function(req,res){
  var requestVars = {
    concept_label: 'Concept',
    qualia_field_name: 'label_name'
  };
  var session = db.getSession(session);
  session
    .run( 'MATCH (c:'+requestVars.concept_label+')-[:accepted_qualia]->(q:Qualia)' +
          'WHERE (c).label_name="'+requestVars.concept_label+'" ' +
          'RETURN collect(properties(q)) as qualiaProperties')
    .then(function(result){
      var unformatted_qualias = result.records[0]._fields[0];
        var concept = {
          concept_label: requestVars.concept_label,
          qualias:[]
        };

      var formatted_qualias = db.formatQualias(unformatted_qualias);
      concept.qualia.push(formatted_qualias);

    })
    .catch(function(err){
      console.log(err);
    });
})

app.post('/submitFormPayload', function(req,res){
  var session = db.getSession();
  console.log(compileDatabaseQuery(req.body));
  session
    .run(compileDatabaseQuery(req.body))
    .then(function(result){
      session.close();
    //  console.log(result);
      res.send(result);
    })
    .catch(function(err){
      console.log(err);
    })

})

app.post('/mockSubmitFormPayload', function(req,res){
  console.log(compileDatabaseQuery(req.body));
});


reload(app);

app.listen(3000, () => console.log('Example app listening on port 3000!'));
