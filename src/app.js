import express from 'express';
import morgan from 'morgan';
import userRoutes from './routes/user.routes';


const app = express();


app.set('port',8080);

//Middlewares
app.use(morgan('dev'));
app.use(express.json());
//Rutes
app.use("/api/user/",userRoutes);


export default app;