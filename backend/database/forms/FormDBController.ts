import { promises } from "fs";
import { Logger } from "../../common";
import { POSTGRESConnector } from "../../common"
import { IUser } from "../../models";

export class FormDBController {
    private static instance: FormDBController;
    private log: Logger;

    private constructor() {
        this.log = new Logger();
    }

    public createFrom(pIdentifier:string) {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            db
            .query()
            .then()
            .catch();
        });
    }

    public createFromType(pUser:IUser) {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            db
            .query()
            .then()
            .catch(); 
        }); 
    }

    public createQuestion() {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            db
            .query()
            .then()
            .catch(); 
        });
    }

    public saveBooleanAnswer() {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            db
            .query()
            .then()
            .catch(); 
        });
    }

    public static getInstance() : FormDBController {
        if (!this.instance) {
            this.instance = new FormDBController();
        }
        return this.instance;
    }
}