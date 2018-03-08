var neoHost;
var password = 'stillness';
var env = process.env.NODE_ENV;
console.log(env);
if(env==='dev'){
  neoHost = '0.0.0.0';
  password = 'stillness';
}else if(env === 'test' || env === 'prod'){
  neoHost = 'neo4j';
}else{
  neoHost = 'neo4j';
}
console.log(neoHost);
const serverConfig = {
  //neo4j_local:"bolt://0.0.0.0",
  neo4j_local:"bolt://"+neoHost+':7687',
  user_local:"neo4j",
  password_local:password
};

module.exports = serverConfig;
