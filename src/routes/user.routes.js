import { Router} from "express";
import { methods as auth} from "./../utils/auth";
const router = Router();

router.get("/",auth.signUp);

export default router;
