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
            // db
            // .query()
            // .then()
            // .catch();
        });
    }

    public createFromType(pUser:IUser) {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            // db
            // .query()
            // .then()
            // .catch(); 
        }); 
    }

    public createQuestion() {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            // db
            // .query()
            // .then()
            // .catch(); 
        });
    }

    public saveBooleanAnswer(pUserId:number, pQuestionId:number, pAnswer:boolean) {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            db
            .query('CALL SP_SaveBooleanAnswer($1, $2, $3)',
            [pUserId, pQuestionId, pAnswer])
            .then(rs => {
                console.log(rs);
                switch(rs.rows[0].status) { 
                    // Answer saved correctly
                    case 1: {
                       resolve({
                           code: '1',
                           message: 'Answer saved correctly'
                       });
                       break; 
                    }
                    // User with given id doesn't exist.
                    case -1: { 
                       reject({
                           code: '-1',
                           message: 'User with given id doesn\'t exist.'
                       });
                       break; 
                    } 
                    // Question with given id doesn't exist
                    case -2: {
                        reject({
                            code: '-2',
                            message: 'Question with given id doesn\'t exist'
                        });
                        break;
                    }
                    // Answer type doesn't exist
                    case -3: {
                        reject({
                            code: '-3',
                            message: 'Answer type doesn\'t exist'
                        });
                        break;
                    }
                    default: { 
                       reject({
                           code: '-11',
                           message: 'Unknown error'
                       });
                       break; 
                    } 
                 } 
            })
            .catch(err => {
                console.log(err);
                reject({
                    code: '-11',
                    message: 'Unknown error'
                });
            }); 
        });
    }

    public static getInstance() : FormDBController {
        if (!this.instance) {
            this.instance = new FormDBController();
        }
        return this.instance;
    }
}