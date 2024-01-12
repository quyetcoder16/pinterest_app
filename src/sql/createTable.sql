
use pinterest_app;

CREATE TABLE users(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR(255),
	password VARCHAR(255),
	full_name VARCHAR(255),
	age INT,
	avatar VARCHAR(255)
);

INSERT INTO users (email, password, full_name, age, avatar)
VALUES 
('user1@example.com', 'password1', 'John Doe', 25, 'https://example.com/avatar1.jpg'),
('user2@example.com', 'password2', 'Jane Smith', 30, 'https://example.com/avatar2.jpg'),
('user3@example.com', 'password3', 'Bob Johnson', 22, 'https://example.com/avatar3.jpg'),
('user4@example.com', 'password4', 'Alice Brown', 28, 'https://example.com/avatar4.jpg'),
('user5@example.com', 'password5', 'Charlie White', 35, 'https://example.com/avatar5.jpg'),
('user6@example.com', 'password6', 'Diana Black', 27, 'https://example.com/avatar6.jpg'),
('user7@example.com', 'password7', 'Evan Green', 32, 'https://example.com/avatar7.jpg'),
('user8@example.com', 'password8', 'Fiona Grey', 24, 'https://example.com/avatar8.jpg'),
('user9@example.com', 'password9', 'George Red', 29, 'https://example.com/avatar9.jpg'),
('user10@example.com', 'password10', 'Helen Blue', 31, 'https://example.com/avatar10.jpg'),
('user11@example.com', 'password11', 'Ian Purple', 26, 'https://example.com/avatar11.jpg'),
('user12@example.com', 'password12', 'Jenny Orange', 33, 'https://example.com/avatar12.jpg'),
('user13@example.com', 'password13', 'Kevin Yellow', 23, 'https://example.com/avatar13.jpg'),
('user14@example.com', 'password14', 'Linda Pink', 27, 'https://example.com/avatar14.jpg'),
('user15@example.com', 'password15', 'Mike Brown', 30, 'https://example.com/avatar15.jpg'),
('user16@example.com', 'password16', 'Nancy Grey', 28, 'https://example.com/avatar16.jpg'),
('user17@example.com', 'password17', 'Oscar Black', 26, 'https://example.com/avatar17.jpg'),
('user18@example.com', 'password18', 'Pamela Green', 29, 'https://example.com/avatar18.jpg'),
('user19@example.com', 'password19', 'Quincy White', 34, 'https://example.com/avatar19.jpg'),
('user20@example.com', 'password20', 'Rachel Red', 25, 'https://example.com/avatar20.jpg');



CREATE TABLE images(
	image_id INT PRIMARY KEY AUTO_INCREMENT,
	image_name VARCHAR(255),
	url VARCHAR(255),
	commenting_right BOOLEAN,
	description VARCHAR(255),
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id)
);

INSERT INTO images (image_name, url, commenting_right, description, user_id)
VALUES 
('Image 1', 'https://example.com/image1.jpg', true, 'Beautiful sunset', 1),
('Image 2', 'https://example.com/image2.jpg', true, 'City skyline', 2),
('Image 3', 'https://example.com/image3.jpg', false, 'Snowy mountains', 3),
('Image 4', 'https://example.com/image4.jpg', true, 'Beach paradise', 4),
('Image 5', 'https://example.com/image5.jpg', true, 'Lush green forest', 5),
('Image 6', 'https://example.com/image6.jpg', false, 'Urban street art', 6),
('Image 7', 'https://example.com/image7.jpg', true, 'Desert dunes', 7),
('Image 8', 'https://example.com/image8.jpg', false, 'Vibrant city lights', 8),
('Image 9', 'https://example.com/image9.jpg', true, 'Countryside landscape', 9),
('Image 10', 'https://example.com/image10.jpg', false, 'Abstract art', 10),
('Image 11', 'https://example.com/image11.jpg', true, 'Mountain lake', 11),
('Image 12', 'https://example.com/image12.jpg', true, 'Colorful flowers', 12),
('Image 13', 'https://example.com/image13.jpg', false, 'Ancient ruins', 13),
('Image 14', 'https://example.com/image14.jpg', true, 'Foggy morning', 14),
('Image 15', 'https://example.com/image15.jpg', true, 'Historical architecture', 15);


CREATE TABLE comments(
	comment_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	image_id INT,
	FOREIGN KEY(image_id) REFERENCES images(image_id),
	date_comment DATE,
	content VARCHAR(255)
);

INSERT INTO comments (user_id, image_id, date_comment, content)
VALUES 
(1, 1, '2024-01-11', 'Great shot!'),
(2, 2, '2024-01-10', 'Love the city lights!'),
(3, 3, '2024-01-09', 'The snowy mountains look amazing.'),
(4, 4, '2024-01-08', 'Wish I could be at that beach right now.'),
(5, 5, '2024-01-07', 'The forest is so peaceful.'),
(6, 6, '2024-01-06', 'Interesting street art!'),
(7, 7, '2024-01-05', 'The desert is so vast and beautiful.'),
(8, 8, '2024-01-04', 'The city lights are mesmerizing.'),
(9, 9, '2024-01-03', 'The countryside looks so serene.'),
(10, 10, '2024-01-02', 'This abstract art is thought-provoking.');



CREATE TABLE savedImages(
	savedImage_id INT PRIMARY KEY AUTO_INCREMENT,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES users(user_id),
	image_id INT,
	FOREIGN KEY(image_id) REFERENCES images(image_id),
	data_saved DATE
);

INSERT INTO savedImages (user_id, image_id, data_saved)
VALUES 
(1, 1, '2024-01-11'),
(2, 2, '2024-01-10'),
(3, 3, '2024-01-09'),
(4, 4, '2024-01-08'),
(5, 5, '2024-01-07'),
(6, 6, '2024-01-06'),
(7, 7, '2024-01-05'),
(8, 8, '2024-01-04'),
(9, 9, '2024-01-03'),
(10, 10, '2024-01-02');
