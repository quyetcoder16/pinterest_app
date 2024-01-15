import express from "express";
import { getListImage } from "../controllers/image.controller.js";

const imageRouter = express.Router();

imageRouter.get("/get-list-image/:page/:size", getListImage);

export default imageRouter;