import { Logger } from "../../common";
import { FormDBController } from "../../database";
import { IUser } from "../../models";

export class FormController {
    private static instance: FormController;
    private log: Logger;

    private constructor() {
        this.log = new Logger();
    }

    public saveForm(req:any, res:any, next:any) {
        res.status(200).json({
            "hola":"mundo"
        });
    }

    public static getInstance() : FormController {
        if (!this.instance) {
            this.instance = new FormController();
        }
        return this.instance;
    }
}