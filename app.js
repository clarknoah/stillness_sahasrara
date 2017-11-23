const express = require('express')
var reload = require('reload');
var routes = require('./routes');
var neo4j = require('neo4j-driver').v1;

const app = express()
var driver = neo4j.driver("bolt://localhost",neo4j.auth.basic("neo4j","stillness"));

app.get('/', (req, res) => res.send('Hello World!'));



app.get('/getConceptList', function(req, res){
  var requestVars = {
    concept_label: 'Concept',
    qualia_field_name: 'label_name'
  };
  var session = driver.session();
  session
    .run( 'MATCH (c:'+requestVars.concept_label+')' +
          'RETURN id(c) as id ,c.'+requestVars.qualia_field_name + ' as display_value')
    .then(function(result){
      session.close();
      var returnList = [];
  console.log(result.records[0]._fieldLookup);
      for(record in result.records){
        console.log(record);
        var listItem = {
          concept_id:result.records[record]._fieldLookup.id,
          label_name:requestVars.concept_label,
          display_value: result.records[record]._fieldLookup.display_value
        };
        returnList.push(listItem);
      }

      console.log(returnList);
              res.send(returnList);
    })
    .catch(function(err){
      console.log(err);
    });
});

app.get('/getConceptQualiaList', function(req, res){
  var requestVars = {
    concept_label: 'Concept',
    qualia_field_name: 'label_name'
  };
  var session = driver.session();
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

app.get('/getConceptForm', function(req,res){

})

app.get('/submitFormPayload', function(req,res){

})

reload(app);

app.listen(3000, () => console.log('Example app listening on port 3000!'));
