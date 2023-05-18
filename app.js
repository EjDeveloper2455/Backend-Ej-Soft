const express = require('express');

const app = express();
app.use(express.json());

app.get('/inicioServidor', (req, res) => {
    res.send('<h1>El servidor funciona correctamente</h1>');
});

app.listen(8080, ()=>{
    console.log('El servidor se ha iniciado en el puerto 8080');
});