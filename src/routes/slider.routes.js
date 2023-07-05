import { Router} from "express";
import { methods as firebase} from "./../utils/firebase";
import { methods as slider} from "./../controllers/slider.controller";
const router = Router();

router.get("/",slider.getSlider);
router.put("/imagen/:id",slider.upload,firebase.sliderImagen,slider.updateImagen);
router.post("/",slider.save);

export default router;