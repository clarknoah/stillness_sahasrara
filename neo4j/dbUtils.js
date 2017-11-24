"use strict";
var conf = require('../config');
var neo4j = require('neo4j-driver').v1;
var driver = neo4j.driver(conf.neo4j_local,neo4j.auth.basic(
  conf.user_local,conf.password_local));

exports.getSession = function () {
  return driver.session();
  };

exports.formatQualias = function(unformatted_qualias){
  var formatted_qualias = [];
  for(var key in unformatted_qualias){
    //unformatted_qualias[key].current_value = setCurrentValue(unformatted_qualias[key]);
  //  unformatted_qualias[key].updated_value = setCurrentValue(unformatted_qualias[key]);
  }
  return formatted_qualias;
};

exports.setCurrentValue= function (qualia){
  var current_value = null;
  if(qualia.default_value!=="null"){
    current_value = qualia.default_value;
    return current_value;
  }
  return null;
}
