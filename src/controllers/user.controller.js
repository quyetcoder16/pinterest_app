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
        res.status(200).send(user);
    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}

export {
    getDetailUser,
}