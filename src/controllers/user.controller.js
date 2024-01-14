import { sendResponse } from "../utils/sendResponse.js";

const getDetailUser = (req, res) => {
    try {
        const { email, full_name, age, avatar, introduce, link_user_info, user_name } = req.user;
        const user = {
            email,
            full_name,
            age,
            avatar,
            introduce,
            link_user_info,
            user_name
        };
        sendResponse(res, 200, "detail user", user);
    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}

export {
    getDetailUser,
}