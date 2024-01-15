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

export {
    getDetailImageByImageIdServices,
}