import express from 'express';
import morgan from 'morgan';
import userRoutes from './routes/user.routes';


const app = express();
//app.use(express.json());

app.set('port',8080);

//Middlewares
app.use(morgan('dev'));

//Rutes
app.use(userRoutes);


export default app;