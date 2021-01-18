import * as express from 'express';
import { Logger } from '../common';
import { UserRouter, FormRouter } from "./";
import * as bodyParser from 'body-parser';

class Routes {

    public express: express.Application;
    public logger: Logger;

    constructor() {
        this.express = express();
        this.logger = new Logger();
        this.middleware();
        this.routes();
    }

    private middleware(): void {
        this.express.use(bodyParser.json());
        this.express.use(bodyParser.urlencoded({ extended: false }));
    }

    private routes(): void {
        this.express.use('/user', UserRouter);
        this.express.use('/forms', FormRouter);
    }
}

export default new Routes().express;

