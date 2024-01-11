import express from "express";
import { authTokenMiddleware } from "../middlewares/auth.middleware.js";
import { getDetailUser } from "../controllers/user.controller.js";


const userRouter = express.Router();

userRouter.get("/get-detail-user", authTokenMiddleware, getDetailUser);

export default userRouter;