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

export {
    getDetailImageByImageIdServices,
    getListImageServices,
}