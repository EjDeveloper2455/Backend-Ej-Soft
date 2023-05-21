import {getConnection} from '../database/database'
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const SECRET_KEY = 'EjSOFTFASTCAR';

const getUser = async (req,res) =>{
    try{
        const connection = await getConnection();
        const result = await connection.query("Select * from tbl_usuario");
        res.json(result);
    }catch(err){
        res.status(500).send(err.message);
    }
};

const signUp = async (req,res) =>{
    try{
        const {email,password,rol} = req.body;
        const salt = await bcrypt.genSalt(10);
        password = await bcrypt.hash(password, salt);
        //const result = await connection.query("Select * from tbl_usuario");
        res.json(req.body);
    }catch(err){
        res.status(500).send(err.message);
    }
};
const login = async(req, res) =>{
    try{
        const {email,password} = req.body;
        const result = await connection.query("Select usuario_email as email, usuario_password as password"
        +", usuario_rol as rol from tbl_usuario where usuario_email = "+email+" and usuario_password = "+password+";");
        //console.log(user.email+" - "+user.password);
        /*if(!result){
            res.status(401).send('Email o contraseña incorrecta');
            return;
        }*/
        //const isMatch = await bcrypt.compare(password, result.password);
        if(!result){
            res.status(401).send('Email o contraseña incorrecta');
        }else{
            const payload = {email: result.email,role: result.rol};
            const token = jwt.sign(payload, SECRET_KEY);
            res.json({user, token});
        }
    }catch(err){
        console.log(err);
        res.status(500).send("login: Hubo un error: " + err);
    }
}


export const methods = {
    signUp,getUser
}