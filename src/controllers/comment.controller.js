import { getCommentByImageIdServices, postRecordCommentServices } from "../services/comment.services.js";
import { getCurrentDateTime } from "../utils/getCurrentDateTime.js";
import { sendResponse } from "../utils/sendResponse.js";

const getCommentByImageId = async (req, res) => {
    try {
        const { imageId } = req.params;
        const listComment = await getCommentByImageIdServices(imageId);
        if (listComment) {
            sendResponse(res, 200, "list comment", listComment);
        } else {
            sendResponse(res, 404, "Not Found!");
        }

    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

const postRecordComment = async (req, res) => {
    try {
        const { userId, imageId, content } = req.body;
        const formattedDate = getCurrentDateTime();
        const newComment = {
            user_id: userId,
            image_id: imageId,
            content: content,
            date_comment: formattedDate
        };
        await postRecordCommentServices(newComment);
        sendResponse(res, 201, "record comment successful!");
    } catch (error) {
        console.log(error);
        sendResponse(res, 500, error);
    }
}

export {
    getCommentByImageId,
    postRecordComment,
}