import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient();

const getUserByEmailServices = async (email) => {
    const user = await prisma.users.findFirst({
        where: {
            email
        }
    });
    if (user) {
        return user;
    } else {
        return false;
    }
}

const createUserServices = async (newUser) => {
    await prisma.users.create({
        data: newUser
    });
}

export {
    getUserByEmailServices,
    createUserServices,
}