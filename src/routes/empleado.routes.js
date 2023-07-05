import { Router} from "express";
import { methods as firebase} from "./../utils/firebase";
import { methods as empleado} from "./../controllers/empleado.controller";

const router = Router();

router.get("/",empleado.getEmpleados);
router.post("/imagen/:id",empleado.upload,firebase.empleadoImagen,empleado.update);
router.post("/",empleado.upload,firebase.empleadoImagen,empleado.save);

export default router;