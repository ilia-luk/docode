var mongo = require('mongodb');

const connectToDBAndInitServer = async () => {
  const db = await mongo.MongoClient.connect('mongodb://modify:dontgiveintothehate@mongo:27017/domusnetworkDemoDb');
  console.log(db);
}

connectToDBAndInitServer();
 
