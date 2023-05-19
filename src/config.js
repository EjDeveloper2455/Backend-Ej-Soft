import {config} from 'dotenv'

config();

export default {
    host: process.env.HOST || "localhost",
    database: process.env.DATABASE || "bd_ej_soft",
    user: process.env.USER || "root",
    password: process.env.PASSWORD || "Katty-123"
}