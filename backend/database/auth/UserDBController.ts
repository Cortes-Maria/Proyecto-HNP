import { promises } from "fs";
import { Logger } from "../../common";
import { POSTGRESConnector } from "../../common"
import { IUser } from "../../models";

export class UserDBController {
    private static instance: UserDBController;
    private log: Logger;

    private constructor() {
        this.log = new Logger();
    }

    public userLogin(pIdentifier:string) {
        const db = POSTGRESConnector.getInstance().getNewConnection();
        return new Promise((resolve, reject) => {
            const pass = '';
            const status = 0;
            db.query('CALL sp_getpassword($1, $2, $3)', [pIdentifier, pass, status])
            .then(rs => {
                if (rs.rows[0].status === 1) {
                    const user: IUser = {
                        email: pIdentifier,
                        password: rs.rows[0].outpassword
                    }
                    resolve(user);
                } else {
                    reject(null);
                }
            })
            .catch(err => {
                console.log(err);
                reject(null);
            });
        });
    }

    public createUser(pUser:IUser) {
        const db = POSTGRESConnector.getInstance().getNewConnection();

        return new Promise((resolve, reject) => {
            const res = 0;
            db.query('CALL sp_createuser($1, $2, $3, $4, $5, $6, $7, $8)',[pUser.type, pUser.name, pUser.lastname, pUser.birthdate, pUser.username, pUser.email, pUser.password, res])
            .then(rs => {
                if (rs.rows[0].status === 1) {
                    resolve({message:"okay"});
                } else {
                    reject(null);
                }
                db.end();
            })
            .catch(err => {
                reject(null);
            });
        });
    }

    public static getInstance() : UserDBController {
        if (!this.instance) {
            this.instance = new UserDBController();
        }
        return this.instance;
    }
}