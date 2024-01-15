import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient();

const getCommentByImageIdServices = async (imageId) => {
    const listComment = await prisma.comments.findMany({
        where: {
            image_id: +imageId
        }
    });
    if (listComment) {
        return listComment;
    } else {
        return false;
    }
}

const postRecordCommentServices = async (newComment) => {
    await prisma.comments.create({
        data: newComment
    });
}

export {
    getCommentByImageIdServices,
    postRecordCommentServices,
}