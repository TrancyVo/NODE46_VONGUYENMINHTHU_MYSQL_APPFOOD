-- -------------------------------------------------------------
-- TablePlus 6.2.0(576)
--
-- https://tableplus.com/
--
-- Database: baitap_restaurant
-- Generation Time: 2024-12-05 22:37:05.8010
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `codes` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `rate_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `description`, `type_id`) VALUES
(1, 'Phở Bò', 'pho_bo.jpg', 50, 'Phở bò truyền thống với nước dùng đậm đà', 1),
(2, 'Bánh Mì Thịt Nướng', 'banh_mi_thit_nuong.jpg', 25, 'Bánh mì Việt Nam với thịt nướng thơm ngon', 2),
(3, 'Bánh Xèo Tôm Thịt', 'banh_xeo.jpg', 40, 'Bánh xèo miền Tây với nhân tôm thịt', 2),
(4, 'Cơm Tấm Sườn', 'com_tam_suon.jpg', 35, 'Cơm tấm sườn non nướng hấp dẫn', 2),
(5, 'Bún Chả Hà Nội', 'bun_cha.jpg', 45, 'Bún chả đặc sản Hà Nội', 2),
(6, 'Bánh Cuốn Nóng', 'banh_cuon.jpg', 30, 'Bánh cuốn nóng mềm mịn với nước chấm', 2),
(7, 'Bún Bò Huế', 'bun_bo_hue.jpg', 55, 'Bún bò Huế đậm đà hương vị miền Trung', 1),
(8, 'Gỏi Cuốn', 'goi_cuon.jpg', 20, 'Gỏi cuốn tôm thịt tươi ngon', 2),
(9, 'Nem Nướng', 'nem_nuong.jpg', 30, 'Nem nướng Ninh Hòa đặc sản miền Trung', 2),
(10, 'Lẩu Cua Đồng', 'lau_cua_dong.jpg', 120, 'Lẩu cua đồng thơm ngon, đậm đà', 1);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Món nước'),
(2, 'Món khô');

INSERT INTO `like_res` (`like_res_id`, `user_id`, `res_id`, `date_like`) VALUES
(1, 1, 1, '2024-12-01 08:30:00'),
(2, 1, 2, '2024-12-01 09:00:00'),
(3, 1, 3, '2024-12-02 10:15:00'),
(4, 2, 4, '2024-12-02 11:00:00'),
(5, 2, 5, '2024-12-03 12:45:00'),
(6, 3, 1, '2024-12-03 13:30:00'),
(7, 3, 2, '2024-12-04 14:00:00'),
(8, 3, 3, '2024-12-04 14:30:00'),
(9, 3, 5, '2024-12-05 15:00:00'),
(10, 4, 2, '2024-12-05 15:45:00'),
(11, 4, 3, '2024-12-05 15:50:00'),
(12, 4, 4, '2024-12-05 15:55:00'),
(13, 4, 5, '2024-12-05 15:59:00'),
(14, 4, 1, '2024-12-06 15:59:00'),
(15, 5, 5, '2024-12-07 15:55:00');

INSERT INTO `order` (`order_id`, `user_id`, `food_id`, `amount`, `codes`, `arr_sub_id`) VALUES
(1, 1, 2, 3, NULL, '1,2'),
(2, 1, 3, 3, NULL, '4,2'),
(3, 1, 4, 3, NULL, '5,2'),
(4, 1, 5, 3, NULL, '6,2'),
(5, 2, 2, 3, NULL, '7,2'),
(6, 3, 2, 3, NULL, '8,2'),
(7, 3, 3, 3, NULL, '1,2'),
(8, 4, 4, 3, NULL, '1,2'),
(9, 5, 2, 3, NULL, '2,3'),
(10, 5, 7, 3, NULL, '2,8'),
(11, 5, 8, 3, NULL, '2,9');

INSERT INTO `rate_res` (`rate_res_id`, `user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 1, 1, 5, '2024-12-01 12:30:00'),
(2, 2, 2, 4, '2024-12-01 14:00:00'),
(3, 3, 3, 3, '2024-12-02 13:45:00'),
(4, 4, 4, 5, '2024-12-02 15:00:00'),
(5, 5, 5, 4, '2024-12-03 16:00:00'),
(6, 4, 1, 5, '2024-12-03 17:30:00'),
(7, 3, 2, 3, '2024-12-04 12:00:00'),
(8, 2, 3, 4, '2024-12-04 13:15:00'),
(9, 1, 4, 5, '2024-12-05 14:30:00'),
(10, 5, 5, 3, '2024-12-05 15:45:00');

INSERT INTO `restaurant` (`res_id`, `res_name`, `image`, `description`) VALUES
(1, 'Phở 24', 'pho24_image.jpg', 'Nhà hàng chuyên về phở truyền thống Việt Nam với hương vị đậm đà, hấp dẫn.'),
(2, 'Cơm Tấm Sài Gòn', 'comtam_image.jpg', 'Quán chuyên cơm tấm, mang đậm phong cách ẩm thực miền Nam Việt Nam.'),
(3, 'Bún Chả Hà Nội', 'bunchahanoi_image.jpg', 'Nhà hàng bún chả nổi tiếng, tái hiện hương vị đặc trưng của Hà Nội.'),
(4, 'Nem Nướng Ninh Hòa', 'nemnuong_image.jpg', 'Đặc sản nem nướng Ninh Hòa ngon miệng, không thể bỏ qua.'),
(5, 'Bánh Xèo Miền Tây', 'banhxeo_image.jpg', 'Nhà hàng bánh xèo miền Tây nổi tiếng với bánh vàng giòn, hương vị khó quên.');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Thêm Thịt Bò', 15, 1),
(2, 'Thêm Thịt Nướng', 15, 2),
(3, 'Thêm Tôm Thịt', 15, 3),
(4, 'Thêm Sườn', 15, 4),
(5, 'Thêm Chả Giò', 10, 5),
(6, 'Thêm Chả lụa', 5, 6),
(7, 'Thêm Giò Heo', 20, 7),
(8, 'Thêm Tôm', 15, 8),
(9, 'Thêm Nem Chua', 10, 9),
(10, 'Thêm Đậu Phụ', 8, 10);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `pass_word`) VALUES
(1, 'Nguyễn Văn A', 'anguyen@gmail.com', '1234'),
(2, 'Nguyễn Văn B', 'bnguyen@gmail.com', '1234'),
(3, 'Nguyễn Văn C', 'cnguyen@gmail.com', '1234'),
(4, 'Nguyễn Văn D', 'dnguyen@gmail.com', '1234'),
(5, 'Nguyễn Văn E', 'enguyen@gmail.com', '1234'),
(6, 'Nguyễn Văn F', 'fnguyen@gmail.com', '1234');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;