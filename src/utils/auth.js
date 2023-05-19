import {getConnection} from '../database/database'
const signUp = async (req,res) =>{
    const connection = await getConnection();
    const result = await connection.query("Select * from tbl_usuario");
    console.log(result);
    res.json(result);
};

export const methods = {
    signUp
}