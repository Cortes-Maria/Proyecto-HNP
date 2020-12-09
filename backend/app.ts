import * as express from 'express';
import * as bodyParser from 'body-parser';
import Routes from './routes/routes'
import { Logger } from './common';

class App {

    public express: express.Application;
    private log: Logger;
    private db : any;

    constructor() {
        this.log = new Logger();
        this.express = express();
        this.middleware();
        this.httpHeaders();
        this.routes();
    }

    // Configure Express middleware.
    private middleware(): void {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    }

    private routes(): void {
        this.express.use('/api', Routes);

        this.express.use('*', (req,res,next) => {
            res.send("Invalid request");
        });
    }

    private httpHeaders() {
        this.express.use((req, res, next) => {
            res.setHeader('Access-Control-Allow-Origin','*');
            res.setHeader('Access-Control-Allow-Headers',
            'Origin, X-Requested-With, Content-Type, Accept, Authorization');
            res.setHeader('Access-Control-Allow-Methods',
            'GET, POST, PATCH, DELETE, OPTIONS, PUT');
            next();
        });
    }
}

export default new App().express;