import { json } from 'express';
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
        var {email,password,rol} = req.body;

        const salt = await bcrypt.genSalt(10);
        password = await bcrypt.hash(password, salt);
        const connection = await getConnection();
        const result = await connection.query("INSERT INTO `tbl_usuario` (`usuario_email`, `usuario_password`, `usuario_rol`) VALUES (?, ?, ?); ",[email,password,rol]);
        if(result){
            const payload = {email: email.email,role: rol};
            
            const token = jwt.sign(payload, SECRET_KEY);
            res.json({email,rol,token});
        }
    }catch(err){
        console.log(err);
        res.status(500).send(err.message);
    }
};
const login = async(req, res) =>{
    try{
        const {email,password} = req.body;
        const connection = await getConnection();
        const result = await connection.query("Select usuario_email as email, usuario_password as password"
        +", usuario_rol as rol from tbl_usuario where usuario_email = '"+email+"';");
        if(!result){
            res.status(401).send('Email o contraseña incorrecta');
            return;
        }
        console.log(password);
        const isMatch = await bcrypt.compare(password, result[0].password);
        if(!isMatch){
            res.status(401).send('Email o contraseña incorrecta');
        }else{
            const user = {"Email": result[0].email,"Rol": result[0].rol};
            const payload = {user};
            
            const token = jwt.sign(payload, SECRET_KEY);
            res.json({user, token});
        }
    }catch(err){
        console.log(err);
        res.status(500).send("login: Hubo un error: " + err);
    }
}


export const methods = {
    signUp,getUser,login
}
