const express = require('express');

const app = express();
app.use(express.json());

app.get('/inicioServidor', (req, res) => {
    res.send('El servidor funciona correctamente');
});

app.listen(3000, ()=>{
    console.log('<h1>El servidor se ha iniciado en el puerto 3000</h1>');
});