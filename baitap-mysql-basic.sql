-- NODE 46
-- BÀI TẬP RESTAURANT 

CREATE DATABASE baitap_restaurant
USE baitap_restaurant


-- TB: user
CREATE TABLE users (
 user_id INT PRIMARY KEY AUTO_INCREMENT,
 full_name VARCHAR(255),
 email VARCHAR(255),
 pass_word VARCHAR(255)
 ) 
INSERT INTO users (full_name, email, pass_word ) VALUES
("Nguyễn Văn A", "anguyen@gmail.com", '1234'),
("Nguyễn Văn B", "bnguyen@gmail.com", '1234'),
("Nguyễn Văn C", "cnguyen@gmail.com", '1234'),
("Nguyễn Văn D", "dnguyen@gmail.com", '1234'),
("Nguyễn Văn E", "enguyen@gmail.com", '1234')
INSERT INTO users (full_name, email, pass_word ) VALUES
("Nguyễn Văn F", "fnguyen@gmail.com", '1234')


-- TB: restaurant
CREATE TABLE `restaurant`(
 res_id INT PRIMARY KEY AUTO_INCREMENT,
 res_name VARCHAR(255),
 image VARCHAR(255),
 description VARCHAR(255)
)
INSERT INTO restaurant (res_name, image, description ) VALUES
('Phở 24', 'pho24_image.jpg', 'Nhà hàng chuyên về phở truyền thống Việt Nam với hương vị đậm đà, hấp dẫn.'),
('Cơm Tấm Sài Gòn', 'comtam_image.jpg', 'Quán chuyên cơm tấm, mang đậm phong cách ẩm thực miền Nam Việt Nam.'),
('Bún Chả Hà Nội', 'bunchahanoi_image.jpg', 'Nhà hàng bún chả nổi tiếng, tái hiện hương vị đặc trưng của Hà Nội.'),
('Nem Nướng Ninh Hòa', 'nemnuong_image.jpg', 'Đặc sản nem nướng Ninh Hòa ngon miệng, không thể bỏ qua.'),
('Bánh Xèo Miền Tây', 'banhxeo_image.jpg', 'Nhà hàng bánh xèo miền Tây nổi tiếng với bánh vàng giòn, hương vị khó quên.')

-- TB: like_res
CREATE TABLE `like_res`(
like_res_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT,
res_id INT,
date_like DATETIME,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
) 
INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2024-12-01 08:30:00'),
(1, 2, '2024-12-01 09:00:00'),
(1, 3, '2024-12-02 10:15:00'),
(2, 4, '2024-12-02 11:00:00'),
(2, 5, '2024-12-03 12:45:00'),
(3, 1, '2024-12-03 13:30:00'),
(3, 2, '2024-12-04 14:00:00'),
(3, 3, '2024-12-04 14:30:00'),
(3, 5, '2024-12-05 15:00:00'),
(4, 2, '2024-12-05 15:45:00'),
(4, 3, '2024-12-05 15:50:00'),
(4, 4, '2024-12-05 15:55:00'),
(4, 5, '2024-12-05 15:59:00'),
(4, 1, '2024-12-06 15:59:00'),
(5, 5, '2024-12-07 15:55:00')

-- C1: TOP 5 USER CÓ LƯỢT LIKE NHÀ HÀNG NHIỀU NHẤT
SELECT like_res.user_id, users.user_id, users.full_name, users.email, users.pass_word, COUNT(like_res.user_id) AS 'SỐ LƯỢT LIKE NHÀ HÀNG'
FROM like_res
INNER JOIN users ON like_res.user_id = users.user_id
GROUP BY like_res.user_id
ORDER BY `SỐ LƯỢT LIKE NHÀ HÀNG` DESC
LIMIT 5
-- C2: TOP 2 NHÀ HÀNG CÓ LƯỢT LIKE NHIỀU NHẤT
SELECT like_res.res_id, restaurant.res_id, restaurant.res_name, restaurant.image, restaurant.description, COUNT(like_res.res_id) AS 'SÔ LƯỢT LIKE CỦA MỖI NHÀ HÀNG'
FROM like_res
INNER JOIN restaurant ON like_res.res_id = restaurant.res_id
GROUP by like_res.res_id
ORDER BY `SÔ LƯỢT LIKE CỦA MỖI NHÀ HÀNG` DESC
LIMIT 2


-- TB: rate_res
CREATE TABLE `rate_res`(
rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT, -- FK tb user
res_id INT, -- FK tb restaurant
amount INT,
date_rate DATETIME,
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
)
INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2024-12-01 12:30:00'),
(2, 2, 4, '2024-12-01 14:00:00'),
(3, 3, 3, '2024-12-02 13:45:00'),
(4, 4, 5, '2024-12-02 15:00:00'),
(5, 5, 4, '2024-12-03 16:00:00'),
(4, 1, 5, '2024-12-03 17:30:00'),
(3, 2, 3, '2024-12-04 12:00:00'),
(2, 3, 4, '2024-12-04 13:15:00'),
(1, 4, 5, '2024-12-05 14:30:00'),
(5, 5, 3, '2024-12-05 15:45:00')


-- TB: food_type
CREATE TABLE `food_type`(
 type_id INT PRIMARY KEY AUTO_INCREMENT,
 type_name VARCHAR(255)
)
INSERT INTO food_type (type_name) VALUES 
('Món nước'), ('Món khô')

-- TB: food
CREATE TABLE `food`(
food_id INT PRIMARY KEY AUTO_INCREMENT,
food_name VARCHAR(255),
image VARCHAR(255),
price FLOAT,
description VARCHAR(255),
type_id INT, -- FK tb food_type
FOREIGN KEY (type_id) REFERENCES food_type(type_id)
)
INSERT INTO food (food_name, image, price, description, type_id) VALUES
('Phở Bò', 'pho_bo.jpg', 50.0, 'Phở bò truyền thống với nước dùng đậm đà', 1),
('Bánh Mì Thịt Nướng', 'banh_mi_thit_nuong.jpg', 25.0, 'Bánh mì Việt Nam với thịt nướng thơm ngon', 2),
('Bánh Xèo Tôm Thịt', 'banh_xeo.jpg', 40.0, 'Bánh xèo miền Tây với nhân tôm thịt', 2),
('Cơm Tấm Sườn', 'com_tam_suon.jpg', 35.0, 'Cơm tấm sườn non nướng hấp dẫn', 2),
('Bún Chả Hà Nội', 'bun_cha.jpg', 45.0, 'Bún chả đặc sản Hà Nội', 2),
('Bánh Cuốn Nóng', 'banh_cuon.jpg', 30.0, 'Bánh cuốn nóng mềm mịn với nước chấm', 2),
('Bún Bò Huế', 'bun_bo_hue.jpg', 55.0, 'Bún bò Huế đậm đà hương vị miền Trung', 1),
('Gỏi Cuốn', 'goi_cuon.jpg', 20.0, 'Gỏi cuốn tôm thịt tươi ngon', 2),
('Nem Nướng', 'nem_nuong.jpg', 30.0, 'Nem nướng Ninh Hòa đặc sản miền Trung', 2),
('Lẩu Cua Đồng', 'lau_cua_dong.jpg', 120.0, 'Lẩu cua đồng thơm ngon, đậm đà', 1);

-- TB: sub_food
CREATE TABLE `sub_food`(
sub_id INT PRIMARY KEY AUTO_INCREMENT,
sub_name VARCHAR(255),
sub_price FLOAT,
food_id INT, -- FK tb food
FOREIGN KEY (food_id) REFERENCES food(food_id)
)
INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Thêm Thịt Bò', 15.0, 1),
('Thêm Thịt Nướng', 15.0, 2),
('Thêm Tôm Thịt', 15.0, 3),
('Thêm Sườn', 15.0, 4),
('Thêm Chả Giò', 10.0, 5),
('Thêm Chả lụa', 5.0, 6),
('Thêm Giò Heo', 20.0, 7),
('Thêm Tôm', 15.0, 8),
('Thêm Nem Chua', 10.0, 9),
('Thêm Đậu Phụ', 8.0, 10);

-- TB: order
CREATE TABLE `order` (
order_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT, -- FK tb user
food_id INT, -- FK tb food
amount INT,
codes VARCHAR(255),
arr_sub_id VARCHAR(255),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (food_id) REFERENCES food(food_id)
)
INSERT INTO `order` (user_id, food_id, amount, codes, arr_sub_id) VALUES
(1, 2, 3, NULL, '1,2'),
(1, 3, 3, NULL, '4,2'),
(1, 4, 3, NULL, '5,2'),
(1, 5, 3, NULL, '6,2'),
(2, 2, 3, NULL, '7,2'),
(3, 2, 3, NULL, '8,2'),
(3, 3, 3, NULL, '1,2'),
(4, 4, 3, NULL, '1,2'),
(5, 2, 3, NULL, '2,3'),
(5, 7, 3, NULL, '2,8'),
(5, 8, 3, NULL, '2,9')

-- C3: TOP 1 USER CÓ LƯỢT ĐẶT HÀNG NHIỀU NHẤT
SELECT `order`.user_id, users.user_id, users.full_name, users.email, users.pass_word, COUNT(`order`.user_id) AS 'SỐ LẦN ĐẶT HÀNG'
FROM `order`
INNER JOIN users ON `order`.user_id = users.user_id
GROUP BY `order`.user_id
ORDER BY `SỐ LẦN ĐẶT HÀNG` DESC
LIMIT 1

SELECT users.full_name AS 'USER KHÔNG ĐẶT HÀNG'
FROM `order`
RIGHT JOIN users ON `order`.user_id = users.user_id
WHERE `order`.user_id IS NULL

SELECT users.full_name AS 'USER KHÔNG LIKE'
FROM like_res
RIGHT JOIN users ON like_res.user_id = users.user_id
WHERE like_res.user_id IS NULL

SELECT users.full_name AS 'USER KHÔNG ĐÁNH GIÁ'
FROM rate_res
RIGHT JOIN users ON rate_res.user_id = users.user_id
WHERE rate_res.user_id IS NULL
