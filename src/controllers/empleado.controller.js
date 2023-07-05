import {getConnection} from '../database/database'

const multer = require('multer');
const Multer = multer({
    storage: multer.memoryStorage(),
    limits: 1024 * 1024
});

const upload = Multer.single('imagen');

const getEmpleados = async(req,res) =>{
    try {
        const connection = await getConnection();
        const result = await connection.query("SELECT * from tbl_empleado;");
        res.json(result);
    } catch (error) {
        console.log(error);
        res.send(error);
    }
}

const save = async(req,res) => {
    const {firebaseUrl,token} = req.file;
    res.send({firebaseUrl,token});
};

const update = async(req,res) => {
    const {firebaseUrl,token} = req.file;
    res.send({firebaseUrl,token});
};

export const methods = {
    save,Multer,upload,update,getEmpleados
}