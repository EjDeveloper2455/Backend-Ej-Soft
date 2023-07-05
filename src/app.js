import express from 'express';
import morgan from 'morgan';
import userRoutes from './routes/user.routes';
import empleadoRoutes from './routes/empleado.routes';
import tipoVehiculoRoutes from './routes/tipo_vehiculo.routes';
import sliderRoutes from './routes/slider.routes';

const app = express();


app.set('port',8080);

//Middlewares
app.use(morgan('dev'));
app.use(express.json());
//Rutes
app.use("/api/user/",userRoutes);
app.use("/api/empleado/",empleadoRoutes);
app.use("/api/tipoVehiculo/",tipoVehiculoRoutes);
app.use("/api/slider/",sliderRoutes);
app.get("/api/confirm/",(req,res)=>{
    res.send("El servidor esta corriendo");
});


export default app;