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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image_name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `commenting_right` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link_web_datail` varchar(255) DEFAULT NULL,
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
  `introduce` varchar(255) DEFAULT NULL,
  `link_user_info` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(1, 1, 1, '2022-01-01', 'Amazing shot!');
INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(2, 2, 1, '2022-01-02', 'I love the colors in this picture.');
INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(3, 3, 2, '2022-01-03', 'The city lights are mesmerizing.');
INSERT INTO `comments` (`comment_id`, `user_id`, `image_id`, `date_comment`, `content`) VALUES
(4, 4, 3, '2022-01-04', 'What a cute puppy!'),
(5, 5, 4, '2022-01-05', 'This abstract artwork is mind-blowing.'),
(6, 6, 5, '2022-01-06', 'The sunrise by the ocean is breathtaking.'),
(7, 7, 6, '2022-01-07', 'Great use of black and white in this photo.'),
(8, 8, 7, '2022-01-08', 'Aww, those kittens are adorable!'),
(9, 9, 8, '2022-01-09', 'The eagle looks majestic in flight.'),
(10, 10, 9, '2022-01-10', 'The rolling hills are so peaceful.'),
(11, 11, 10, '2022-01-11', 'Modern architecture at its finest.'),
(12, 12, 11, '2022-01-12', 'Those desserts look delicious!');

INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`, `title`, `link_web_datail`) VALUES
(1, 'Sunset Over the Mountains', 'https://example.com/sunset_mountains.jpg', 1, 'A breathtaking sunset over the mountain range.', 1, 'Mountain Sunset', 'https://example.com/mountain_sunset');
INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`, `title`, `link_web_datail`) VALUES
(2, 'City Skyline at Night', 'https://example.com/city_skyline_night.jpg', 0, 'The city skyline illuminated by city lights at night.', 2, 'City Night Lights', 'https://example.com/city_night_lights');
INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`, `title`, `link_web_datail`) VALUES
(3, 'Playful Puppy in the Garden', 'https://example.com/playful_puppy.jpg', 1, 'An adorable puppy playing in a vibrant garden.', 3, 'Garden Pup', 'https://example.com/garden_pup');
INSERT INTO `images` (`image_id`, `image_name`, `url`, `commenting_right`, `description`, `user_id`, `title`, `link_web_datail`) VALUES
(4, 'Colorful Abstract Artwork', 'https://example.com/colorful_abstract.jpg', 1, 'Vibrant and abstract artwork with a splash of colors.', 4, 'Abstract Colors', 'https://example.com/abstract_colors'),
(5, 'Ocean Sunrise', 'https://example.com/ocean_sunrise.jpg', 0, 'A breathtaking sunrise over the calm ocean waters.', 5, 'Sunrise Serenity', 'https://example.com/sunrise_serenity'),
(6, 'Urban Noir Street Photography', 'https://example.com/urban_noir.jpg', 1, 'Classic black and white street photography in an urban setting.', 6, 'Urban Noir', 'https://example.com/urban_noir_detail'),
(7, 'Cute Kittens Cuddling', 'https://example.com/cute_kittens.jpg', 0, 'Two adorable kittens cuddling together in a cozy spot.', 7, 'Cozy Kittens', 'https://example.com/cozy_kittens_detail'),
(8, 'Majestic Eagle Soaring', 'https://example.com/majestic_eagle.jpg', 1, 'A majestic eagle soaring through the vast sky.', 8, 'Sky Majesty', 'https://example.com/sky_majesty'),
(9, 'Rolling Hills Landscape', 'https://example.com/rolling_hills.jpg', 1, 'A picturesque landscape with rolling hills and greenery.', 9, 'Rolling Hills Beauty', 'https://example.com/rolling_hills_beauty'),
(10, 'Modern Architecture in City', 'https://example.com/modern_architecture.jpg', 0, 'Modern architectural marvels in a bustling city.', 10, 'Urban Marvels', 'https://example.com/urban_marvels'),
(11, 'Delicious Homemade Desserts', 'https://example.com/homemade_desserts.jpg', 1, 'A tempting display of delicious homemade desserts.', 11, 'Sweet Delights', 'https://example.com/sweet_delights'),
(12, 'Playful Dolphins in Clear Waters', 'https://example.com/playful_dolphins.jpg', 0, 'Playful dolphins swimming in crystal-clear waters.', 12, 'Dolphin Playtime', 'https://example.com/dolphin_playtime'),
(13, 'Abstract Sculpture in Museum', 'https://example.com/abstract_sculpture.jpg', 1, 'An intriguing abstract sculpture in a contemporary art museum.', 13, 'Sculpture Exploration', 'https://example.com/sculpture_exploration'),
(14, 'Enchanting Forest in Autumn', 'https://example.com/forest_autumn.jpg', 1, 'An enchanting forest adorned with vibrant autumn colors.', 14, 'Autumn Fantasy', 'https://example.com/autumn_fantasy'),
(15, 'Vintage Car Exhibition', 'https://example.com/vintage_car_exhibition.jpg', 0, 'Classic automobiles showcased at a vintage car exhibition.', 15, 'Vintage Classics', 'https://example.com/vintage_classics');

INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(1, 1, 1, '2022-01-01');
INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(2, 2, 3, '2022-01-02');
INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(3, 3, 5, '2022-01-03');
INSERT INTO `savedImages` (`savedImage_id`, `user_id`, `image_id`, `data_saved`) VALUES
(4, 4, 7, '2022-01-04'),
(5, 5, 9, '2022-01-05'),
(6, 6, 11, '2022-01-06'),
(7, 7, 13, '2022-01-07'),
(8, 8, 15, '2022-01-08'),
(9, 9, 2, '2022-01-09'),
(10, 10, 4, '2022-01-10');

INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`, `introduce`, `link_user_info`, `user_name`) VALUES
(1, 'john.doe@example.com', 'hashed_password1', 'John Doe', 25, 'avatar1.jpg', 'Hello, I am John!', 'https://example.com/johndoe', 'johndoe');
INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`, `introduce`, `link_user_info`, `user_name`) VALUES
(2, 'jane.smith@example.com', 'hashed_password2', 'Jane Smith', 30, 'avatar2.jpg', 'Nice to meet you!', 'https://example.com/janesmith', 'janesmith');
INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`, `introduce`, `link_user_info`, `user_name`) VALUES
(3, 'bob.johnson@example.com', 'hashed_password3', 'Bob Johnson', 22, 'avatar3.jpg', 'I love programming.', 'https://example.com/bobjohnson', 'bobjohnson');
INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `age`, `avatar`, `introduce`, `link_user_info`, `user_name`) VALUES
(4, 'alice.williams@example.com', 'hashed_password4', 'Alice Williams', 28, 'avatar4.jpg', 'Software engineer and photographer.', 'https://example.com/alicewilliams', 'alicewilliams'),
(5, 'charlie.brown@example.com', 'hashed_password5', 'Charlie Brown', 35, 'avatar5.jpg', 'Coffee lover and adventurer.', 'https://example.com/charliebrown', 'charliebrown'),
(6, 'emma.davis@example.com', 'hashed_password6', 'Emma Davis', 29, 'avatar6.jpg', 'Exploring the world, one city at a time.', 'https://example.com/emmadavis', 'emmadavis'),
(7, 'david.wilson@example.com', 'hashed_password7', 'David Wilson', 27, 'avatar7.jpg', 'Passionate about technology and innovation.', 'https://example.com/davidwilson', 'davidwilson'),
(8, 'grace.miller@example.com', 'hashed_password8', 'Grace Miller', 32, 'avatar8.jpg', 'Yoga enthusiast and nature lover.', 'https://example.com/gracemiller', 'gracemiller'),
(9, 'james.lee@example.com', 'hashed_password9', 'James Lee', 26, 'avatar9.jpg', 'Web developer by day, gamer by night.', 'https://example.com/jameslee', 'jameslee'),
(10, 'olivia.white@example.com', 'hashed_password10', 'Olivia White', 31, 'avatar10.jpg', 'Bookworm and aspiring writer.', 'https://example.com/oliviawhite', 'oliviawhite'),
(11, 'michael.taylor@example.com', 'hashed_password11', 'Michael Taylor', 23, 'avatar11.jpg', 'Fitness freak and nutrition advocate.', 'https://example.com/michaeltaylor', 'michaeltaylor'),
(12, 'sophia.martin@example.com', 'hashed_password12', 'Sophia Martin', 33, 'avatar12.jpg', 'Art lover and creative soul.', 'https://example.com/sophiamartin', 'sophiamartin'),
(13, 'william.anderson@example.com', 'hashed_password13', 'William Anderson', 30, 'avatar13.jpg', 'Traveling and exploring new cultures.', 'https://example.com/williamanderson', 'williamanderson'),
(14, 'emily.harris@example.com', 'hashed_password14', 'Emily Harris', 28, 'avatar14.jpg', 'Graphic designer with a passion for color.', 'https://example.com/emilyharris', 'emilyharris'),
(15, 'daniel.moore@example.com', 'hashed_password15', 'Daniel Moore', 34, 'avatar15.jpg', 'Tech geek and aspiring entrepreneur.', 'https://example.com/danielmoore', 'danielmoore'),
(16, 'quyet@gmail.com', '$2b$10$Nuuk..3GmAu3RgWKkTDKUefzquCIkiJukS0pUevWSZD9GBxxoJU6G', 'duong xuan quyet', 12, NULL, NULL, NULL, NULL),
(17, 'quyet1@gmail.com', '$2b$10$SxnH8z45VVWJVTM8fz..WuqhdQ9hkmdzCe/R/wpmuYGAE1qLNc8IK', 'duong xuan quyet', 12, NULL, NULL, NULL, NULL);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;