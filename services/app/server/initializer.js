require('babel-register');
require('babel-polyfill');

process.env.NODE_ENV = 'development';

const compiler = require('./compiler');
const server = require('./server');

compiler().run(server);
