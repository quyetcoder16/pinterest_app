import { checkToken } from "../configs/jwt.config.js";
import { getUserByEmailServices } from "../services/user.services.js";

const authTokenMiddleware = async (req, res, next) => {
    try {
        const { token } = req.headers;
        if (token) {
            const tokenVerify = checkToken(token);
            // res.send(tokenVerify);
            if (tokenVerify.statusCode === 401) {
                res.status(401).send("token invalid!");
            } else {
                const { email } = tokenVerify.data;
                const user = await getUserByEmailServices(email);
                if (user) {
                    req.user = user;
                    req.user_id = user.user_id;
                    next();
                } else {
                    res.status(401).send("token invalid!");
                }
            }
        } else {
            res.status(404).send("token not found!");
        }

    } catch (error) {
        res.status(500).send(error);
        console.log(error);
    }
}

export {
    authTokenMiddleware,
}
