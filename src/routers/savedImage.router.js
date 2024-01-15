import express from "express";
import { authTokenMiddleware } from "../middlewares/auth.middleware.js";
import { checkUserId } from "../middlewares/checkUserId.middleware.js";
import { getCheckUserSavedImage, getListSavedImageByUserId } from "../controllers/savedImage.controller.js";

const savedImageRouter = express.Router();

savedImageRouter.get("/get-check-user-saved-image", authTokenMiddleware, checkUserId, getCheckUserSavedImage);
savedImageRouter.get("/get-list-saved-image-by-userId", authTokenMiddleware, checkUserId, getListSavedImageByUserId);

export default savedImageRouter;