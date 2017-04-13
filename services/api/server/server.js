import chalk from 'chalk';
import express from 'express';
import path from 'path';
import { MongoClient, Logger, } from 'mongodb';
import { ISDEV, SERVER_PORT, MONGO_PORT, MONGO_URL, } from '../core/config';


const logger = chalk.reset.blue;
const server = express();

const initServer = async () => {
  console.log(logger('Starting server...'));
  try {
    const db = await MongoClient.connect(MONGO_URL);

    if (ISDEV) {
      Logger.setLevel('debug');
      Logger.filter('class', ['Cursor']);
      Logger.setCurrentLogger((msg, { date, pid }) => (
        console.log({
          type: 'QUERY',
          pid,
          msg: msg.split('"query":')[1].split('},')[0],
          time: new Date(date).toUTCString(),
        })
      ));
    }

    server.use('/', (req, res) => {
      res.sendFile(path.join(__dirname, '..', 'index.html'));
    });

    server.listen(SERVER_PORT, () => {
      console.log(logger(`MongoDB connected on PORT: ${MONGO_PORT}`));
      console.log(logger(`MongoDB connected on URL: ${MONGO_URL}`));
      console.log(logger(`Node Server is listening on http://localhost:${SERVER_PORT}`));
    });

  } catch (e) { console.log(e); }
};

export default initServer;
