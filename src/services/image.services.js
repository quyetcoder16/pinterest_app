import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient();

const getDetailImageByImageIdServices = async (imageId) => {
    const image = await prisma.images.findFirst({
        where: {
            image_id: +imageId
        }
    });
    if (image) {
        return image;
    } else {
        return false;
    }
}

const getListImageServices = async (page, size) => {
    const index = (Number(page) - 1) * (Number(size));
    const listImage = await prisma.images.findMany({
        take: +size,
        skip: index
    });
    if (listImage) {
        return listImage;
    } else {
        return false;
    }
}

const getListImageByNameServices = async (name) => {
    const listImage = await prisma.images.findMany({
        where: {
            image_name: {
                contains: name
            }
        }
    });
    if (listImage) {
        return listImage;
    } else {
        return false;
    }
}

const getListImageCreatedByUserIdServices = async (userId) => {
    const listImageCreateByUser = await prisma.images.findMany({
        where: {
            user_id: +userId
        }
    });
    if (listImageCreateByUser) {
        return listImageCreateByUser;
    } else {
        return false;
    }
}

const deleteImageByImageIdServices = async (imageId) => {
    await prisma.images.delete({
        where: {
            image_id: +imageId
        }
    });
}

export {
    getDetailImageByImageIdServices,
    getListImageServices,
    getListImageByNameServices,
    getListImageCreatedByUserIdServices,
    deleteImageByImageIdServices,
}