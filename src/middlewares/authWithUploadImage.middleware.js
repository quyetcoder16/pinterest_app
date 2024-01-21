import { deleteImageCloud } from "../configs/cloudinary.config.js";
import { checkToken } from "../configs/jwt.config.js";
import { getUserByEmailServices } from "../services/user.services.js";
import { sendResponse } from "../utils/sendResponse.js";


const authTokenWithUploadImage = async (req, res, next) => {
    const { filename } = req.file;
    try {
        const { token } = req.headers;
        if (token) {
            const tokenVerify = checkToken(token);
            if (tokenVerify.statusCode === 401) {
                deleteImageCloud(filename);
                sendResponse(res, 401, "token invalid!");
            } else {
                const { email } = tokenVerify.data;
                const user = await getUserByEmailServices(email);
                if (user) {
                    req.user = user;
                    req.user_id = user.user_id;
                    next();
                } else {
                    deleteImageCloud(filename);
                    sendResponse(res, 401, "token invalid!");
                }
            }
        } else {
            deleteImageCloud(filename);
            sendResponse(res, 404, "token not found!");
        }

    } catch (error) {
        sendResponse(res, 500, error);
    }
}

export {
    authTokenWithUploadImage,
}
