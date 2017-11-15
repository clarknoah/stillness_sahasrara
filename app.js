const express = require('express')
var neo4j = require('neo4j-driver').v1;

const app = express()

app.get('/', (req, res) => res.send('Hello World!'));

app.get('/getConceptList', function(req, res){

  var driver = neo4j.driver("bolt://localhost",neo4j.auth.basic("neo4j","stillness"));
  var session = driver.session();
  session
    .run('MATCH (c:Concept) RETURN c.label_name')
    .then(function(result){
      console.log(result.records[0]);
      var bob = result.records[0];
      console.log(bob);
              res.send(bob);
    })
    .catch(function(err){
      console.log(err);
    });
});


app.listen(3000, () => console.log('Example app listening on port 3000!'));
