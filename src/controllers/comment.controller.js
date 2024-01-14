import { getCommentByImageIdServices, postRecordCommentServices } from "../services/comment.services.js";
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
        const currentDate = new Date();
        const year = currentDate.getFullYear();
        const month = String(currentDate.getMonth() + 1).padStart(2, '0');
        const day = String(currentDate.getDate()).padStart(2, '0');
        const formattedDate = `${year}-${month}-${day}`;
        const newComment = {
            user_id: userId,
            image_id: imageId,
            content: content,
            date_comment: "2024-01-15"
        };
        console.log(newComment);
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