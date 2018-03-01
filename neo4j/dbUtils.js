"use strict";

var conf = require('../config');
var neo4j = require('neo4j-driver').v1;
var utils = require('../utils.js');

var driver = neo4j.driver(conf.neo4j_local,neo4j.auth.basic(
  conf.user_local,conf.password_local));


exports.getSession = function () {
  return driver.session();
  };

exports.setCurrentValue= function (qualia){
  var current_value = null;
  if(qualia.default_value!=="null"){
    current_value = qualia.default_value;
    return current_value;
  }
  return null;
}

exports.generateLoadVariables = function (variableArray, entanglementArray){
  var matchStatement = "MATCH ";
  var whereStatement = "WHERE ";
  var collectionOfVariables = [];
  var collectionOfWhereStatements = [];

  for(var index in variableArray){
    var concept = variableArray[index];
    var formattedVariable = `(${concept.key})`;
    var formattedWhereStatement = `ID(${concept.key})=${concept.id}`
    collectionOfVariables.push(formattedVariable);
    collectionOfWhereStatements.push(formattedWhereStatement);
  }

  for(var index in entanglementArray){
    var concept = entanglementArray[index];
    var formattedVariable = `()-[${concept.key}]->()`;
    var formattedWhereStatement = `ID(${concept.key})=${concept.id}`
    collectionOfVariables.push(formattedVariable);
    collectionOfWhereStatements.push(formattedWhereStatement);
  }
  var generatedMatchStatement = matchStatement + collectionOfVariables.toString() + ' \n ';
  var generatedWhereStatement = whereStatement + collectionOfWhereStatements.join(' AND ');

  if(variableArray.length > 0){
    return generatedMatchStatement + generatedWhereStatement;
  }else{
    return "";
  }

}

exports.generateConceptQualiaQuery = function (conceptLabel){
  return `MATCH (n:${conceptLabel})-[:approved_qualia]->(q:Qualia)
          RETURN DISTINCT collect({
          db_name:q.db_name,
          eq_type: "qualia",
          data_type: q.data_type,
          current_value: null,
          default_value: q.default_value,
          updated_value: null,
          placeholder: q.display_name})`;

}

exports.generateCreateConcepts = function (createArray){
  var collectionOfCreateStatements = [];

  for(var index in createArray){
    var create = createArray[index];
    var formattedCreateStatement = `CREATE (${create.key}:${create.label} ${utils.stringify(create.qualias)}) \n`;
    collectionOfCreateStatements.push(formattedCreateStatement);
  }
  if(createArray.length > 0){
    return collectionOfCreateStatements.join("");
  }else{
    return "";
  }

}

exports.generateSetQualias = function(setQualiasArray){
  var collectionOfSetQualias = [];
  for(var index in setQualiasArray){
    var set = setQualiasArray[index];
    var formattedStatement =
    `SET ${set.concept_variable}.${set.db_key} = ${
      exports.determineIfQuotesAreNeeded(set)}`;
      collectionOfSetQualias.push(formattedStatement);
  }

  if(collectionOfSetQualias.length > 0){
    return collectionOfSetQualias.join("");
  }else{
    return "";
  }
}

exports.determineIfQuotesAreNeeded = function(value){
  if(value.data_type==="text" || value.data_type === "date" || value.data_type === "text_select"){
    return `"${value.new_value}"`;
  }else{
    return value.new_value;
  }
}

exports.generateDeleteEntanglements = function(entanglementsArray){
  var collectionOfEntanglements = [];

  for(var index in entanglementsArray){
    var del = entanglementsArray[index];

    var formattedEntanglementStatement = `DELETE ${del.key} \n`;
    collectionOfEntanglements.push(formattedEntanglementStatement);
  }
  if(entanglementsArray.length > 0){
    return collectionOfEntanglements.join("");
  }else{
    return "";
  }
}

exports.generateEntanglements= function (entanglementsArray){
  var collectionOfEntanglements = [];

  for(var index in entanglementsArray){
    var create = entanglementsArray[index];
    var formattedEntanglementStatement = `CREATE (${create.source_key})-[:${create.db_name}]->(${create.target_key}) \n`;
    collectionOfEntanglements.push(formattedEntanglementStatement);
  }
  if(entanglementsArray.length > 0){
    return collectionOfEntanglements.join("");
  }else{
    return "";
  }

}

exports.generateGuid = function(){
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return 'var_'+ s4() + s4() + '_' + s4() + '_' + s4() + '_' +
    s4() + '_' + s4() + s4() + s4();
}

exports.generateEntanglement

exports.compileEntanglementRetrivalQuery = function(conceptId, entanglements){
  var matchStatements = ['(concept)'];
  var whereStatements = [];
  var returnStatements = ['concept as concept'];

  for(var i in entanglements){
    var entanglement = entanglements[i];
    entanglement.guid = exports.generateGuid();

    if(entanglement.creator==="source")
    {
      var matchStatement = `(concept)-[${entanglement.guid}:${entanglement.db_type}]->(sc_${entanglement.guid})`;
      var returnStatement = `collect({
        display_name:sc_${entanglement.guid}.display_name,
        concept_id:ID(sc_${entanglement.guid}),
        entanglement_id:ID(${entanglement.guid})
      }) as ${entanglement.db_type}`;
      matchStatements.push(matchStatement);
      returnStatements.push(returnStatement);
    }
    else if(entanglement.creator==="target")
    {
      var matchStatement = `(tc_${entanglement.guid})-[${entanglement.guid}:${entanglement.db_type}]->(concept)`;
      var returnStatement = `collect({
        display_name:tc_${entanglement.guid}.display_name,
        concept_id:ID(tc_${entanglement.guid}),
        entanglement_id:ID(${entanglement.guid})
      }) as ${entanglement.db_type}`;
      matchStatements.push(matchStatement);
      returnStatements.push(returnStatement);
    }
  }
  var fullQuery = `OPTIONAL MATCH
  ${matchStatements.join(', \n ')}
  WHERE ID(concept)=${conceptId}
  RETURN ${returnStatements.join(',')}`;

  return fullQuery;

}

exports.generateArchiveConcepts = function(archiveArray){
  var removeStatements = [];
  var setStatements = [];
  for(var index in archiveArray){
    var archive = archiveArray[index];
    var removeStatement = `REMOVE ${archive.variable}:${archive.label} \n `;
    var setStatement = `SET ${archive.variable}:Archived_${archive.label} \n `;
    removeStatements.push(removeStatement);
    setStatements.push(setStatement);
  }
  var finArray = removeStatements.concat(setStatements);
  if(archiveArray.length > 0){
    return finArray.join("");
  }else{
    return "";
  }
}

exports.compileDatabaseQuery = function (query){

  var formattedQuery = `${exports.generateLoadVariables(query.load_variables, query.load_entanglement_variables)}
    ${exports.generateDeleteEntanglements(query.delete_entanglements)}
    ${exports.generateCreateConcepts(query.create_concepts)}
    ${exports.generateEntanglements(query.create_entanglements)}
    ${exports.generateArchiveConcepts(query.archive_concepts)}
    ${exports.generateSetQualias(query.set_qualias)}`;
  return formattedQuery;
}
