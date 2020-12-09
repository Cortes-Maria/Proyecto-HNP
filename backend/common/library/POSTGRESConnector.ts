import { Logger } from "../logger/logger";
import { Client } from 'pg';

export class POSTGRESConnector {

    private static instance: POSTGRESConnector;
    private log: Logger;
    private client: Client;

    constructor () {
        this.log = new Logger();
        this.client = new Client({
            connectionString: process.env.POSTGRES_URI,
            ssl: { rejectUnauthorized: false},
        });
    }

    public getNewConnection() {
        this.client.connect();
        return this.client;
    }

    public static getInstance() : POSTGRESConnector {
        if (!this.instance){
            this.instance = new POSTGRESConnector();
        }
        return this.instance;
    }
}