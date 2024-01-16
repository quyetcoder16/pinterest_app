import cloud from "../configs/cloudinary.config.js";
import { deleteCommentByImageIdServices } from "../services/comment.services.js";
import { deleteImageByImageIdServices, getDetailImageByImageIdServices, getListImageByNameServices, getListImageCreatedByUserIdServices, getListImageServices } from "../services/image.services.js";
import { deleteSaveImagesByImageIdServices } from "../services/savedImage.services.js";
import { getUserByUserIdServices } from "../services/user.services.js";
import { sendResponse } from "../utils/sendResponse.js"

const getListImage = async (req, res) => {
    try {
        const { page, size } = req.params;
        const listImage = await getListImageServices(page, size);
        if (listImage) {
            sendResponse(res, 200, "list image", listImage);
        } else {
            sendResponse(res, 404, "Not Found!");
        }
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

const getListImageByName = async (req, res) => {
    try {
        const { name } = req.query;
        const listImage = await getListImageByNameServices(name);
        if (listImage) {
            sendResponse(res, 200, "list image by name", listImage);
        } else {
            sendResponse(res, 404, "can't found image");
        }
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

const getDetailImageByImageId = async (req, res) => {
    try {
        const { imageId } = req.params;
        const image = await getDetailImageByImageIdServices(imageId);
        if (image) {
            const { user_id, email, full_name, avatar, age } = await getUserByUserIdServices(image.user_id);
            const imageDetail = {
                image,
                user: {
                    user_id,
                    email,
                    full_name,
                    avatar,
                    age
                }
            };
            sendResponse(res, 200, "Image detail", imageDetail);
        } else {
            sendResponse(res, 404, "can't found image!");
        }
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

const getListImageCreatedByUserId = async (req, res) => {
    try {
        const { userId } = req.body;
        const listImageCreated = await getListImageCreatedByUserIdServices(userId);
        if (listImageCreated) {
            sendResponse(res, 200, "list image created", listImageCreated);
        } else {
            sendResponse(res, 404, "image not found!");
        }
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

const deleteImageByImageId = async (req, res) => {
    try {
        const { userId, imageId } = req.body;
        const image = await getDetailImageByImageIdServices(imageId);
        if (image.user_id == userId) {
            await deleteCommentByImageIdServices(imageId);
            await deleteSaveImagesByImageIdServices(imageId);
            await deleteImageByImageIdServices(imageId);
            sendResponse(res, 200, "delete image successful");
        } else {
            sendResponse(res, 401, "user can't delete image");
        }
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

const createImage = async (req, res) => {
    try {
        const { title, description, userId, linkWebDetail } = req.body;
        // console.log(req);
        // res.json(req);
        console.log(req.body.userId);
        res.send(req.file);
        // cloud.single("fileImage")((req, res, err) => {
        //     if (err) {
        //       return res.status(400).json({ error: err.message });
        //     }


        //     const imageUrl = req.file.path;


        //     res.json({ imageUrl });
        //   });
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

export {
    getListImage,
    getListImageByName,
    getDetailImageByImageId,
    getListImageCreatedByUserId,
    deleteImageByImageId,
    createImage,
}