import { getCheckUserSavedImageServices, getListSavedImageByUserIdService } from "../services/savedImage.services.js";
import { sendResponse } from "../utils/sendResponse.js";

const getCheckUserSavedImage = async (req, res) => {
    try {
        const { userId, imageId } = req.body;
        const savedImage = await getCheckUserSavedImageServices(userId, imageId);
        if (savedImage) {
            sendResponse(res, 200, "image have saved!", true);
        } else {
            sendResponse(res, 200, "image haven't saved!", false);
        }
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

const getListSavedImageByUserId = async (req, res) => {
    try {
        const { userId } = req.body;
        const listSavedImage = await getListSavedImageByUserIdService(userId);
        if (listSavedImage) {
            sendResponse(res, 200, "list saved image", listSavedImage);
        } else {
            sendResponse(res, 404, "Not found!");
        }
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

export {
    getCheckUserSavedImage,
    getListSavedImageByUserId,
}