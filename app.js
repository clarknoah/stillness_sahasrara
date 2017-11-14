const express = require('express')
var neo4j = require('neo4j-driver').v1;

const app = express()

app.get('/', (req, res) => res.send('Hello World!'));

app.get('/getConceptList', (req, res) => {

  var driver = neo4j.driver("bolt://localhost",neo4j.auth.basic("neo4j","stillness"));
  var session = driver.session();
  session
    .run('MATCH (c:Concept) RETURN c.label_name')
    .subscribe({
      onNext: function(record, res){
      //  console.log(record);
        console.log(record.get('c.label_name'));
        var bob = record.get('c.label_name');
        console.log(bob);
          res.send(bob);
      },
      onCompleted: function(){
        driver.close();
        }

    })
});


app.listen(3000, () => console.log('Example app listening on port 3000!'));
