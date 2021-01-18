import * as express from 'express';
import { FormController } from '../../controllers';

const app = express();

app.post('/', FormController.getInstance().saveForm);

export { app as FormRouter };