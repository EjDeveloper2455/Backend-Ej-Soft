import { Router} from "express";
import { methods as auth} from "./../utils/auth";
const router = Router();

router.get("/",auth.getUser);
router.post("/",auth.signUp);
router.post("/login",auth.login);
export default router;
