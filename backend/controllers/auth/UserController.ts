import { Logger } from "../../common";
import { UserDBController } from "../../database";
import { IUser } from "../../models";
import * as bcrypt from "bcryptjs";
import * as jwt from "jsonwebtoken";

export class UserController {
    private static instance: UserController;
    private log: Logger;

    private constructor() {
        this.log = new Logger();
    }

    public userLogin(req:any, res:any, next:any) {
        let fetchedUser: IUser;

        UserDBController.getInstance().userLogin(req.body.email)
        .then((user:any) => {
            if (!user) {
                return res.status(401).json({
                    message: "Email doesn't exist"
                });
            }
            fetchedUser = user;
            return bcrypt.compare(req.body.password, user.password);
        })
        .then((result: any) => {
            if (!result) {
                return res.status(401).json({
                    message: "Incorrect Password"
                });
            }

            const token = jwt.sign({
                email: fetchedUser.email,
                userId: fetchedUser.id
            }, process.env.JWT_KEY,
            {
                expiresIn: "1h"
            });

            res.status(200).json({
                message: "Auth successfull",
                token,
                expiresIn: 3600,
                userId: fetchedUser.id
            });
        })
        .catch((err: any) => {
            console.log(err);
            return res.status(401).json({
                message: "Auth failed"
            });
        });
    }
    public createUser(req:any, res:any, next:any) {
        bcrypt.hash(req.body.password, 10)
        .then(hash => {
            const newUser: IUser = {
                type: req.body.type,
                name: req.body.name,
                lastname: req.body.lastname,
                birthdate: new Date(req.body.birthdate),
                username: req.body.username,
                email: req.body.email,
                password: hash
            }
            return UserDBController.getInstance().createUser(newUser);
        })
        .then(rs => {
            res.status(401).json({
                message: "User created successfully"
            });
        })
        .catch(err => {
            res.status(401).json({
                message: "Can't create user"
            });
        });
    }

    public static getInstance() : UserController {
        if (!this.instance) {
            this.instance = new UserController();
        }
        return this.instance;
    }
}