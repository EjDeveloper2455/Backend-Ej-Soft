
var admin = require("firebase-admin");
var serviceAccount = require("./keys/firebase-filestorage-key.json");
const jwt = require('jsonwebtoken');

const BUCKET = "gs://project-ej-1471f.appspot.com";
const SECRET_KEY = 'EjSOFTFASTCARFILES';


admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: BUCKET
});

const bucket = admin.storage().bucket();

const empleadoImagen = (req,res,next) =>{
    uploadFile(req,res,next,"imagenes/empleados/");
}

//Funcion para subir una imagen
function uploadFile(req,res,next,path){
    if(!req.file){
        console.log('Fallo al guardar la imagen',req.file);
        res.status(401).send("Fallo al guardar la imagen");
    }else {
        const {id} = req.params;
        const imagen = req.file;
        const nombreImagen = id+'.'+imagen.originalname.split('.').pop();

        const file = bucket.file(path+nombreImagen);

        const stream = file.createWriteStream({
            metadata: {
                contentType: imagen.mimetype
            }
        });
        
        stream.on('error',(error) => {
            console.log(error);
        });
        stream.on('finish', async () => {
            await file.makePublic();
            const payload = {

            'date': Date.now(),
            'directoryUrl': 'https://storage.googleapis.com/'+file.metadata.bucket,
            'directory': "imagenes/empleados/"+nombreImagen,
            'bucketUrl': file.metadata.bucket,
            'fileName': nombreImagen
            };
            const token = jwt.sign(payload, SECRET_KEY);
            req.file.firebaseUrl = 'https://storage.googleapis.com/'+file.metadata.bucket+'/'+file.metadata.name+'?token='+token;
            req.file.token = token;
            next();
            

            
        });
        stream.end(imagen.buffer);

    }
} 

export const methods = {
    empleadoImagen
}
