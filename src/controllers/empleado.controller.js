const multer = require('multer');
const Multer = multer({
    storage: multer.memoryStorage(),
    limits: 1024 * 1024
});

const save = async(req,res) => {
    const {firebaseUrl,token} = req.file;
    res.send({firebaseUrl,token});
};

export const methods = {
    save,Multer
}