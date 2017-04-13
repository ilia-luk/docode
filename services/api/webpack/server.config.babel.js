import { resolve } from 'path';
import CleanWebpackPlugin from 'clean-webpack-plugin';
import webpackNodeExternals from 'webpack-node-externals';
import sharedConfig, { clean, CONFIG } from './shared.config.babel';
import { ISDEV } from '../core/config';


export default {
  ...sharedConfig,
  target: 'node',
  devtool: 'eval',
  externals: [webpackNodeExternals()],
  entry: {
    server: [
      'babel-register',
      'babel-polyfill',
      resolve(__dirname, '..', CONFIG.SERVER_PATH, CONFIG.SERVER_FILE),
    ],
  },
  output: {
    path: resolve(__dirname, '..', CONFIG.OUTPUT_DIR),
    filename: '[name].js',
    libraryTarget: 'commonjs2',
    publicPath: '/assets/',
    pathinfo: true,
  },
  node: {
    console: true,
    global: true,
    process: true,
    Buffer: true,
    __filaname: true,
    __dirname: true,
    fs: true,
    path: true,
  },
  plugins: clean([
    !ISDEV && new CleanWebpackPlugin(['dist'], { root: process.cwd(), verbose: true }),
  ]),
};

