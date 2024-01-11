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

export {
    signUp,
    signIn,
}