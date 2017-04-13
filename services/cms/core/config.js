const { NODE_ENV } = process.env;
const ISDEV = NODE_ENV === 'development';
const ISPROD = NODE_ENV === 'production';
const ISTEST = NODE_ENV === 'test';

const BASE_CONFIG = {
  NODE_ENV,
  ISDEV,
  ISPROD,
  ISTEST,
  SERVER_NAME: 'Node web',
  SERVER_PORT: 7000,
  MONGO_USER: 'modify',
  MONGO_PASSWORD: 'dontgiveintothehate',
  MONGO_PORT: 27017,
  MONGO_DB_NAME: 'domusnetworkDemoDb',
};

const MONGO_CONFIG = {
  DEV_PATH: `mongodb://${BASE_CONFIG.MONGO_USER}:${BASE_CONFIG.MONGO_PASSWORD}@mongo:${BASE_CONFIG.MONGO_PORT}/${BASE_CONFIG.MONGO_DB_NAME}`,
  PROD_PATH: 'MongoLab key goes here...',
};

const ENV_CONFIG = {
  test: { MONGO_URL: MONGO_CONFIG.DEV_PATH, },
  development: { MONGO_URL: MONGO_CONFIG.DEV_PATH, },
  production: { MONGO_URL: MONGO_CONFIG.PROD_PATH, },
};


export default {
  ...BASE_CONFIG,
  ...ENV_CONFIG[NODE_ENV],
};
