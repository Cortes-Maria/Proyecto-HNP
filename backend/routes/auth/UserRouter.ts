import * as express from 'express';
import { UserController } from '../../controllers';
import routes from '../routes';

const app = express();

app.post('/login', UserController.getInstance().userLogin);
app.post('/signup', UserController.getInstance().createUser);

export { app as UserRouter };