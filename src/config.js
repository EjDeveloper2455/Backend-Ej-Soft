import {config} from 'dotenv'

config();
console.log(process.env.HOST+" - "+process.env.DATABASE+" - "+process.env.USER+" - "+process.env.PASSWORD);
export default {
    host: process.env.HOST || "localhost",
    database: process.env.DATABASE || "bd_ej_soft",
    user: process.env.USER || "root",
    password: process.env.PASSWORD || "Katty-123"
}