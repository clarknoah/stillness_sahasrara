'use strict'
var db = require('../neo4j/dbUtils');
var utils = require('../utils');
var Type = require('type-of-is');

exports.conceptForms = {};

exports.getCentralDogmaQualias = function() {
  var session = db.getSession();
  session.run(`MATCH (q:Concept{label_name:'Qualia'})-[:approved_qualia]->(qq:Qualia)
      RETURN DISTINCT collect(qq)`).then(function(result) {
    session.close();
  }).catch(function(err) {
    console.log(err);
  })
}

exports.getCentralDogmaLabels = function() {
  var session = db.getSession();
  session.run(`MATCH (c:Concept)
  RETURN DISTINCT collect(c.label_name)`).then(function(result) {
    session.close();
    assignLabels(result.records[0]._fields[0]);
  }).catch(function(err) {
    console.log(err);
  })
}

exports.getConceptQualias = function(conceptLabel) {
  var session = db.getSession();
  session.run(`MATCH (q:Concept{label_name:'${conceptLabel}'})-[:approved_qualia]->(qq:Qualia)
      RETURN DISTINCT collect(qq)`)
      .then(function(result) {
    session.close();
    //console.log(result.records[0]._fields[0]);
    exports.conceptForms[conceptLabel].qualias = parseQualiasIntoArray(result.records[0]._fields[0]);
    if(conceptLabel==='Concept'){
        //  console.log(exports.conceptForms[conceptLabel]);
        //  console.log(typeof(exports.conceptForms[conceptLabel].qualias[0].current_value));
    }

  }).catch(function(err) {
    console.log(err);
  })
}

exports.getTargetConceptEntanglements = function(conceptLabel,creator){
  var session = db.getSession();
  session.run(
    `MATCH (source:Concept)<-[:source_concept]-(e:Entanglement)-[:target_concept]->(target:Concept {label_name:'${conceptLabel}'})
    WHERE e.creator = 'target'
    RETURN collect({
    db_type:e.db_type,
    mandatory_field:e.mandatory_field,
    display_name:e.display_name,
    cardinality:e.cardinality,
    creator:e.creator,
    is_editable:e.is_editable,
    source_concept:source.label_name,
    target_concept:target.label_name,
    target_key:null,
    source_key:null})`)
    .then(function(result){
      session.close();
      if(result.records[0]._fields[0].length>0){
        for(var i in result.records[0]._fields[0]){
          var entanglement = result.records[0]._fields[0][i];
          exports.conceptForms[conceptLabel].entanglements.push(entanglement);
        }
      }
    })
    .catch(function(err){
      console.log(err);
    })
}
exports.getSourceConceptEntanglements = function(conceptLabel,creator){
  var session = db.getSession();
  session.run(
    `MATCH (source:Concept {label_name:'${conceptLabel}'})<-[:source_concept]-(e:Entanglement)-[:target_concept]->(target:Concept)
    WHERE e.creator = 'source'
    RETURN collect({
    db_type:e.db_type,
    mandatory_field:e.mandatory_field,
    cardinality:e.cardinality,
    creator:e.creator,
    is_editable:e.is_editable,
    display_name:e.display_name,
    source_concept:source.label_name,
    target_concept:target.label_name,
    target_key:null,
    source_key:null})`)
    .then(function(result){
      session.close();
      if(result.records[0]._fields[0].length>0){
        for(var i in result.records[0]._fields[0]){
          var entanglement = result.records[0]._fields[0][i];

          exports.conceptForms[conceptLabel].entanglements.push(entanglement);
        }
      }
    })
    .catch(function(err){
      console.log(err);
    })
}

function parseQualiasIntoArray(results){
  var qualias = [];
  for(var i in results){
    var qualia = results[i].properties;
    qualia = flattenQualiaNumbers(qualia);
    qualia = addClientVariablesToQualia(qualia);
    qualias.push(qualia);
  }
  return qualias;
}

function flattenQualiaNumbers(qualia){
  for(var key in qualia){
    if(Type.string(qualia[key]) === 'Integer'){
      qualia[key] = qualia[key].low;
    }
  }
  return qualia;
}

function addClientVariablesToQualia(qualia){
  if('default_value' in qualia){
    if(qualia.default_value!=='null' || null){
      qualia.current_value = qualia.default_value;
    }else{
      qualia.current_value = null;
      qualia.updated_value = null;
    }
  }
  qualia.control =  null;
  return qualia;
}

exports.getQualiaField = function() {
  qualiaField = {
    qualias: {
      db_key: {
        db_key: 'db_key',
        display_name: 'Qualia Database Key',
        is_editable: true,
        mandatory_field: true,
        has_multiple_values: false,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 1,
        data_type: 'text',
        default_value: 'null'
      },
      display_name: {
        db_key: 'display_name',
        display_name: 'Display Name',
        is_editable: true,
        mandatory_field: true,
        has_multiple_values: false,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 2,
        data_type: 'text',
        default_value: 'null'
      },
      is_edittable: {
        db_key: 'is_edittable',
        display_name: 'Edittable?',
        is_editable: true,
        mandatory_field: true,
        has_multiple_values: false,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 3,
        data_type: 'boolean',
        default_value: true
      },
      mandatory_field: {
        db_key: 'mandatory_field',
        display_name: 'Mandatory Field?',
        is_editable: true,
        mandatory_field: true,
        has_multiple_values: false,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 4,
        data_type: 'boolean',
        default_value: false
      },
      has_multiple_values: {
        db_key: 'has_multiple_values',
        display_name: 'Multiple Values?',
        is_editable: true,
        mandatory_field: true,
        has_multiple_values: false,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 5,
        data_type: 'boolean',
        default_value: false
      },
      select_options: {
        db_key: 'select_options',
        display_name: 'Select Options',
        is_editable: true,
        mandatory_field: false,
        has_multiple_values: true,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 6,
        data_type: 'text',
        default_value: ['null']
      },
      field_order: {
        db_key: 'field_order',
        display_name: 'Field Order',
        is_editable: true,
        mandatory_field: true,
        has_multiple_values: false,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 7,
        data_type: 'number',
        default_value: 9999
      },
      data_type: {
        db_key: 'data_type',
        display_name: 'Data Type',
        is_editable: true,
        mandatory_field: true,
        has_multiple_values: true,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [
          'text',
          'textarea',
          'number',
          'date',
          'boolean',
          'text-array'
        ],
        field_order: 8,
        data_type: 'text',
        default_value: 'text'
      },
      default_value: {
        db_key: 'default_value',
        display_name: 'Default Value',
        is_editable: true,
        mandatory_field: false,
        has_multiple_values: false,
        hint: '',
        placeholder: '',
        eq_type: 'qualia',
        select_options: [],
        field_order: 9,
        data_type: 'text',
        default_value: 'null'
      }

    }

  };
}



function assignLabels(labels){
  exports.labels = labels;
  for(var i in exports.labels){
    var label = exports.labels[i];
    exports.conceptForms[label] = {
      label_name:label,
      key:null,
      qualias:[],
      entanglements:[]
    };
  }
  for(var conceptLabel in exports.conceptForms){
    exports.getConceptQualias(conceptLabel);
   exports.getTargetConceptEntanglements(conceptLabel);
   exports.getSourceConceptEntanglements(conceptLabel);
  }
  //console.log(exports.conceptForms);
}

exports.getConceptForm = function(conceptLabel){
  var conceptForm = exports.conceptForms[conceptLabel];

}

exports.getCentralDogmaLabels();
