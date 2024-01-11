/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `date_comment` date DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `commenting_right` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `savedImages` (
  `savedImage_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `image_id` int DEFAULT NULL,
  `data_saved` date DEFAULT NULL,
  PRIMARY KEY (`savedImage_id`),
  KEY `user_id` (`user_id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `savedImages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `savedImages_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(1, 1, 1, '2024-01-11', 'Great shot!');
INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(2, 2, 2, '2024-01-10', 'Love the city lights!');
INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(3, 3, 3, '2024-01-09', 'The snowy mountains look amazing.');
INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(4, 4, 4, '2024-01-08', 'Wish I could be at that beach right now.'),
(5, 5, 5, '2024-01-07', 'The forest is so peaceful.'),
(6, 6, 6, '2024-01-06', 'Interesting street art!'),
(7, 7, 7, '2024-01-05', 'The desert is so vast and beautiful.'),
(8, 8, 8, '2024-01-04', 'The city lights are mesmerizing.'),
(9, 9, 9, '2024-01-03', 'The countryside looks so serene.'),
(10, 10, 10, '2024-01-02', 'This abstract art is thought-provoking.');

INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`) VALUES
(1, 'Image 1', 'https://example.com/image1.jpg', 1, 'Beautiful sunset', 1);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`) VALUES
(2, 'Image 2', 'https://example.com/image2.jpg', 1, 'City skyline', 2);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`) VALUES
(3, 'Image 3', 'https://example.com/image3.jpg', 0, 'Snowy mountains', 3);
INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`) VALUES
(4, 'Image 4', 'https://example.com/image4.jpg', 1, 'Beach paradise', 4),
(5, 'Image 5', 'https://example.com/image5.jpg', 1, 'Lush green forest', 5),
(6, 'Image 6', 'https://example.com/image6.jpg', 0, 'Urban street art', 6),
(7, 'Image 7', 'https://example.com/image7.jpg', 1, 'Desert dunes', 7),
(8, 'Image 8', 'https://example.com/image8.jpg', 0, 'Vibrant city lights', 8),
(9, 'Image 9', 'https://example.com/image9.jpg', 1, 'Countryside landscape', 9),
(10, 'Image 10', 'https://example.com/image10.jpg', 0, 'Abstract art', 10),
(11, 'Image 11', 'https://example.com/image11.jpg', 1, 'Mountain lake', 11),
(12, 'Image 12', 'https://example.com/image12.jpg', 1, 'Colorful flowers', 12),
(13, 'Image 13', 'https://example.com/image13.jpg', 0, 'Ancient ruins', 13),
(14, 'Image 14', 'https://example.com/image14.jpg', 1, 'Foggy morning', 14),
(15, 'Image 15', 'https://example.com/image15.jpg', 1, 'Historical architecture', 15);

INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(1, 1, 1, '2024-01-11');
INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(2, 2, 2, '2024-01-10');
INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(3, 3, 3, '2024-01-09');
INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(4, 4, 4, '2024-01-08'),
(5, 5, 5, '2024-01-07'),
(6, 6, 6, '2024-01-06'),
(7, 7, 7, '2024-01-05'),
(8, 8, 8, '2024-01-04'),
(9, 9, 9, '2024-01-03'),
(10, 10, 10, '2024-01-02');

INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`) VALUES
(1, 'user1@example.com', 'password1', 'John Doe', 25, 'https://example.com/avatar1.jpg');
INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`) VALUES
(2, 'user2@example.com', 'password2', 'Jane Smith', 30, 'https://example.com/avatar2.jpg');
INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`) VALUES
(3, 'user3@example.com', 'password3', 'Bob Johnson', 22, 'https://example.com/avatar3.jpg');
INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`) VALUES
(4, 'user4@example.com', 'password4', 'Alice Brown', 28, 'https://example.com/avatar4.jpg'),
(5, 'user5@example.com', 'password5', 'Charlie White', 35, 'https://example.com/avatar5.jpg'),
(6, 'user6@example.com', 'password6', 'Diana Black', 27, 'https://example.com/avatar6.jpg'),
(7, 'user7@example.com', 'password7', 'Evan Green', 32, 'https://example.com/avatar7.jpg'),
(8, 'user8@example.com', 'password8', 'Fiona Grey', 24, 'https://example.com/avatar8.jpg'),
(9, 'user9@example.com', 'password9', 'George Red', 29, 'https://example.com/avatar9.jpg'),
(10, 'user10@example.com', 'password10', 'Helen Blue', 31, 'https://example.com/avatar10.jpg'),
(11, 'user11@example.com', 'password11', 'Ian Purple', 26, 'https://example.com/avatar11.jpg'),
(12, 'user12@example.com', 'password12', 'Jenny Orange', 33, 'https://example.com/avatar12.jpg'),
(13, 'user13@example.com', 'password13', 'Kevin Yellow', 23, 'https://example.com/avatar13.jpg'),
(14, 'user14@example.com', 'password14', 'Linda Pink', 27, 'https://example.com/avatar14.jpg'),
(15, 'user15@example.com', 'password15', 'Mike Brown', 30, 'https://example.com/avatar15.jpg'),
(16, 'user16@example.com', 'password16', 'Nancy Grey', 28, 'https://example.com/avatar16.jpg'),
(17, 'user17@example.com', 'password17', 'Oscar Black', 26, 'https://example.com/avatar17.jpg'),
(18, 'user18@example.com', 'password18', 'Pamela Green', 29, 'https://example.com/avatar18.jpg'),
(19, 'user19@example.com', 'password19', 'Quincy White', 34, 'https://example.com/avatar19.jpg'),
(20, 'user20@example.com', 'password20', 'Rachel Red', 25, 'https://example.com/avatar20.jpg');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;