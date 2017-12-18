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

exports.generateLoadVariables = function (variableArray){
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

exports.compileDatabaseQuery = function (query){
  var formattedQuery = `${exports.generateLoadVariables(query.load_variables)}
    ${exports.generateCreateConcepts(query.create_concepts)}
    ${exports.generateEntanglements(query.create_entanglements)}`;
  return formattedQuery;
}
