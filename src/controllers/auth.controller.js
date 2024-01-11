import bcrypt from "bcrypt";
import { createUserServices, getUserByEmailServices } from "../services/user.services.js";
import { createToken } from "../configs/jwt.config.js";

const signUp = async (req, res) => {
    try {
        const { email, password, full_name, age } = req.body;
        if (email == "") {
            res.status(400).send("email error!");
            return;
        }
        const user = await getUserByEmailServices(email);
        if (user) {
            res.status(400).send("email exist!");
        } else {
            const hashPass = bcrypt.hashSync(password, 10);
            let newUser = {
                email,
                password: hashPass,
                full_name,
                age
            }
            await createUserServices(newUser);
            res.status(201).send("sign up successful!");
        }
    } catch (error) {
        res.status(500).send(error);
        console.log(error);
    }
}

const signIn = async (req, res) => {
    try {
        const { email, password } = req.body;
        const user = await getUserByEmailServices(email);
        if (!user) {
            res.status(404).send("Email not found!");
        } else {
            let checkPass = bcrypt.compareSync(password, user.password);
            if (checkPass) {
                const token = createToken({
                    email
                });
                res.status(200).send(token);
            } else {
                res.status(400).send("password error!");
            }
        }
    } catch (error) {
        res.status(500).send(error);
        console.log(error);
    }
}

const loginWithFacebook = async (req, res) => {
    try {
        const { email, name, picture, userID } = req.body;
        let user = await getUserByEmailServices(email);
        if (!user) {
            const newUser = {
                email,
                full_name: name,
                avatar: picture.data.url
            };
            await createUserServices(newUser);
            user = await getUserByEmailServices(email);
            const token = createToken({
                email: user.email
            });
            res.status(201).send(token);
        } else {
            const token = createToken({
                email: user.email
            });
            res.status(200).send(token);
        }
    } catch (error) {
        console.log(error);
        res.status(500).send(error);
    }
}

export {
    signUp,
    signIn,
    loginWithFacebook,
}