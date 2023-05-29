import { Router} from "express";
import { methods as firebase} from "./../utils/firebase";
import { methods as empleado} from "./../controllers/empleado.controller";
const multer = require('multer');
const Multer = multer({
    storage: multer.memoryStorage(),
    limits: 1024 * 1024
});
const router = Router();

router.post("/imagen/:id",Multer.single('imagen'),firebase.empleadoImagen,empleado.save);

export default router;