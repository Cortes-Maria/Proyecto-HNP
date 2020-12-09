import App from './app';
import * as  http from 'http'
import { Logger } from './common'

const port = 5000;
const logger = new Logger();

App.set('port', process.env.PORT as any | 5000);
const server = http.createServer(App);
server.listen(port);

server.on('listening', () => {
    const addr = server.address();
    const bind = (typeof addr === 'string') ? `pipe ${addr}` : `port ${addr.port}`;
    logger.info(`Listening on ${bind}`)
 });

module.exports = App;