import { resolve } from 'path';


export const CONFIG = {
  EXCLUDE_REGEX: /node_modules/,
  JS_REGEX: /\.js$|\.jsx$|\.es6$|\.babel$/,
  JS_MAIN_ENTRY: 'index.jsx',
  OUTPUT_DIR: 'dist',
  PUBLIC_DIR: 'public',
  SRC_DIR: 'src',
  SERVER_PATH: 'server',
  SERVER_FILE: 'server.js'
};

export const clean = arr => arr.filter(i => i !== false);

export default {
  module: {
    loaders: [
      {
        test: CONFIG.JS_REGEX,
        exclude: CONFIG.EXCLUDE_REGEX,
        loader: 'eslint-loader',
        enforce: 'pre',
      },
      {
        test: /\.json$/,
        exclude: CONFIG.EXCLUDE_REGEX,
        loader: 'json-loader',
      },
      {
        test: /\.md$/,
        exclude: CONFIG.EXCLUDE_REGEX,
        loader: 'raw-loader',
      },
      {
        test: CONFIG.JS_REGEX,
        exclude: CONFIG.EXCLUDE_REGEX,
        loader: 'babel-loader',
      },
    ],
  },
  resolve: {
    extensions: ['.js', '.json', '.jsx'],
    modules: [resolve('./'), 'node_modules'],
  },
};
