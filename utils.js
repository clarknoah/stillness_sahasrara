'use strict'

exports.stringify = function(obj_from_json){
    if(typeof obj_from_json !== "object" || Array.isArray(obj_from_json)){
        // not an object, stringify using native function
        return JSON.stringify(obj_from_json);
    }
    // Implements recursive object serialization according to JSON spec
    // but without quotes around the keys.
    let props = Object
        .keys(obj_from_json)
        .map(key => `${key}:${exports.stringify(obj_from_json[key])}`)
        .join(",");
    return `{${props}}`;
}

exports.findElementIndex = function(array, key){
  for(var x in array){
    if(array[x]['db_key'] === key){
      return x;
    }
  }
}
