import { v2 as cloudinary } from 'cloudinary';
import { CloudinaryStorage } from 'multer-storage-cloudinary';
import multer from 'multer';
import dotenv from 'dotenv';
dotenv.config();

cloudinary.config({
    cloud_name: process.env.CLOUDINARY_NAME,
    api_key: process.env.CLOUDINARY_KEY,
    api_secret: process.env.CLOUDINARY_SECRET
});

const storage = new CloudinaryStorage({
    cloudinary,
    allowedFormats: ['jpg', 'png'],
    filename: (req, file, cb) => {
        cb(null, file.originalname);
    }
});

const deleteImageCloud = (fileName) => {
    try {
        cloudinary.uploader.destroy(fileName);
    } catch (error) {
        console.log(error);
    }
}

const cloud = multer({ storage });
export default cloud;
export {
    deleteImageCloud,
}