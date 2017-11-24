var db = require("../neo4j/dbUtils.js");

exports.getConceptForm = function(req, res){
  var requestVars = {
    concept_label: 'Concept',
    qualia_field_name: 'label_name'
  };
  var session = db.getSession(session);
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
}
