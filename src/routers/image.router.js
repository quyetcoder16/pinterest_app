import express from "express";
import { deleteImageByImageId, getDetailImageByImageId, getListImage, getListImageByName, getListImageCreatedByUserId } from "../controllers/image.controller.js";
import { authTokenMiddleware } from "../middlewares/auth.middleware.js";
import { checkUserId } from "../middlewares/checkUserId.middleware.js";

const imageRouter = express.Router();

imageRouter.get("/get-list-image/:page/:size", getListImage);
imageRouter.get("/get-list-image-by-name", getListImageByName);
imageRouter.get("/get-detail-image-by-imageId/:imageId", getDetailImageByImageId);
imageRouter.get("/get-list-image-created-by-userId", authTokenMiddleware, checkUserId, getListImageCreatedByUserId);
imageRouter.delete("/delete-image-by-imageId",authTokenMiddleware,checkUserId,deleteImageByImageId);


export default imageRouter;