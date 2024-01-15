import { getListImageServices } from "../services/image.services.js";
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

export {
    getListImage,
}