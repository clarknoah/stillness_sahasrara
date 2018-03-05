var neoHost;
var env = process.env.NODE_ENV;
if(env==='dev'){
  neoHost = '0.0.0.0';
}else if(env === 'test' || env === 'prod'){
  neoHost = 'neo4j';
}else{
  console.log("There is a major error, Neo4j Environment cannot be determined, shutting app server down.");
  process.exit();
}

const serverConfig = {
  //neo4j_local:"bolt://0.0.0.0",
  neo4j_local:"bolt://"+neoHost,
  user_local:"neo4j",
  password_local:"stillness"
};

module.exports = serverConfig;
