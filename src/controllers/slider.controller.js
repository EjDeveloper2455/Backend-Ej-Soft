import {getConnection} from '../database/database'

const getSlider = async (req,res) =>{
    try{
        const connection = await getConnection();
        const result = await connection.query("Select * from tbl_slider where slider_estado = 'Activo' order by slider_orden asc");
        res.json(result);
    }catch(err){
        res.status(500).send(err.message);
    }
};

const multer = require('multer');
const Multer = multer({
    storage: multer.memoryStorage(),
    limits: 1024 * 1024
});

const upload = Multer.single('imagen');

const save = async(req,res) => {
    try{
        const {texto,prioridad} = req.body;
        const connection = await getConnection();
        const result = await connection.query("INSERT INTO `tbl_slider` (`slider_texto`, `slider_orden`) VALUES (?, ?); ",[texto,prioridad]);
        if(result){
            res.send({"mensaje":"Se ha guardado exitosamente","Data":result});
        }
    }catch(err){
        console.log(err);
        res.status(500).send(err.message);
    }
};
const updateImagen = async(req,res) => {
    const {firebaseUrl,token} = req.file;
    const {id} = req.params;

    try{
        const {texto,prioridad} = req.body;
        const connection = await getConnection();
        const result = await connection.query("UPDATE `tbl_slider` SET `slider_ruta_imagen` = ? WHERE (`slider_id` = ?);",[firebaseUrl,id]);
        if(result){
            res.send({"mensaje":"Se ha guardado exitosamente","Data":result});
        }
    }catch(err){
        console.log(err);
        res.status(500).send(err.message);
    }
    res.send({firebaseUrl,token});

    
};

export const methods = {
    getSlider,save,upload,updateImagen
}