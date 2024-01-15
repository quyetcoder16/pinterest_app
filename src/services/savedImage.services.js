import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient();

const deleteSaveImagesByImageIdServices = async (imageId) => {
    await prisma.savedImages.deleteMany({
        where: {
            image_id: +imageId
        }
    })
}

const getCheckUserSavedImageServices = async (userId, imageId) => {
    const savedImage = await prisma.savedImages.findFirst({
        where: {
            user_id: userId,
            image_id: imageId
        }
    });
    if (savedImage) {
        return savedImage;
    } else {
        return false;
    }
}

const getListSavedImageByUserIdService = async (userId) => {
    const listSavedImage = await prisma.savedImages.findMany({
        where: {
            user_id: +userId
        },
        include: {
            images: {
                select: {
                    url: true,
                    image_name: true,
                    commenting_right: true,
                    description: true,
                    title: true,
                    link_web_datail: true
                }
            }
        }
    });

    if (listSavedImage) {
        return listSavedImage;
    } else {
        return false;
    }
}

export {
    deleteSaveImagesByImageIdServices,
    getCheckUserSavedImageServices,
    getListSavedImageByUserIdService,
}