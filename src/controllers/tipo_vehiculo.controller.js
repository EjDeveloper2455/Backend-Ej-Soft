import {getConnection} from '../database/database'

const getTipoVehiculo = async(req,res) =>{
    try {
        const connection = await getConnection();
        const result = await connection.query("SELECT tipo_vehiculo_id as id, tipo_vehiculo_descripcion as nombre FROM tbl_tipo_vehiculo;");
        res.json(result);
    } catch (error) {
        console.log(error);
        res.send(error);
    }
}

export const methods = {
    getTipoVehiculo
}