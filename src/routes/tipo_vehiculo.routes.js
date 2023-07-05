import { Router} from "express";
import { methods as tipo} from "./../controllers/tipo_vehiculo.controller";

const router = Router();

router.get("/",tipo.getTipoVehiculo);

export default router;