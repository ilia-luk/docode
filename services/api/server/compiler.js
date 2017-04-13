import chalk from 'chalk';
import webpack from 'webpack';
import webpackServerConfig from '../webpack/server.config.babel';


const logger = chalk.reset.blue;

const webpackCompiler = () => {
  console.log(logger('Compiling server...'));
  return webpack(webpackServerConfig);
};


export default webpackCompiler;