/*
 Navicat Premium Data Transfer

 Source Server         : MySQL Server
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : java4

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 17/10/2018 02:49:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `status` int(10) unsigned DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CART_USER` (`user_id`),
  CONSTRAINT `FK_CART_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` VALUES (17, '2018-10-17', 1, 7);
COMMIT;

-- ----------------------------
-- Table structure for cart_detail
-- ----------------------------
DROP TABLE IF EXISTS `cart_detail`;
CREATE TABLE `cart_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_quantity` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CARTDETAIL_CART` (`cart_id`),
  KEY `FK_CARTDETAIL_PRODUCT` (`product_id`),
  CONSTRAINT `FK_CARTDETAIL_CART` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CARTDETAIL_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_detail
-- ----------------------------
BEGIN;
INSERT INTO `cart_detail` VALUES (37, 3, 1, 17);
INSERT INTO `cart_detail` VALUES (38, 3, 5, 17);
INSERT INTO `cart_detail` VALUES (39, 1, 4, 17);
COMMIT;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort_order` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `SFFK_CHILD_PARENT` (`parent_id`),
  CONSTRAINT `SFFK_CHILD_PARENT` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
BEGIN;
INSERT INTO `category` VALUES (1, 'Thời trang nam', 1, NULL);
INSERT INTO `category` VALUES (2, 'Quần áo nam', 1, 1);
INSERT INTO `category` VALUES (3, 'Giày dép nam', 2, 1);
INSERT INTO `category` VALUES (4, 'Đồng hồ nam', 3, 1);
INSERT INTO `category` VALUES (5, 'Túi xách - bóp ví nam', 4, 1);
INSERT INTO `category` VALUES (6, 'Thắt lưng - dây nịt nam', 5, 1);
INSERT INTO `category` VALUES (7, 'Phụ kiện nam', 6, 1);
INSERT INTO `category` VALUES (9, 'Thời trang nữ', 2, NULL);
INSERT INTO `category` VALUES (10, 'Quần áo nữ', 1, 9);
INSERT INTO `category` VALUES (11, 'Đồng hồ nữ', 2, 9);
INSERT INTO `category` VALUES (12, 'Giày dép nữ', 3, 9);
INSERT INTO `category` VALUES (13, 'Túi xách - bóp ví nữ', 4, 9);
INSERT INTO `category` VALUES (14, 'Đồ trang sức nữ', 5, 9);
INSERT INTO `category` VALUES (15, 'Phụ kiện nữ', 6, 9);
COMMIT;

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `status` int(10) unsigned DEFAULT '0',
  `cart_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_INVOICE_CART` (`cart_id`),
  KEY `FK_INVOICE_USER` (`user_id`),
  CONSTRAINT `FK_INVOICE_CART` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_INVOICE_USER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice
-- ----------------------------
BEGIN;
INSERT INTO `invoice` VALUES (11, '2018-10-17', 0, 17, 7);
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PRODUCT_CATEGORY` (`category_id`),
  CONSTRAINT `FK_PRODUCT_CATEGORY` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, 'Áo sơ mi dài tay caro Akuba', 310000, 35, 'Áo sơ mi dài tay caro Akuba 794: Chất liệu cotton mềm mại, thoáng mát, thấm hút mồ hôi tốt, độ bền cao cho bạn yên tâm trong quá trình sử dung. Thiết kế bẻ, tay dài cùng sọc caro nổi bật cho bạn luôn thời trang và trẻ trung năng động', '1.jpg', 2);
INSERT INTO `product` VALUES (2, 'Áo khoác nam Onymax nam tính', 299000, 20, 'Áo khoác nam Onymax nam tính: Chất liệu vải thun da cá bền, đẹp, thấm hút tốt, không hầm bí khi mặc, đem lại cảm giác thoáng mát cho người mặc. Thiết kế cổ đứng, có nón mang lại cho phái mạnh sự năng động, trẻ trung', '2.jpg', 2);
INSERT INTO `product` VALUES (3, 'Dép quai ngang nam tính', 250000, 30, 'Dép quai ngang nam tính: Chất liệu cao su bền, chắc chắn, đế giày được thiết kế chống trơn trượt hiệu quả, giúp bạn nam thoải mái di chuyển mọi địa hình. Thiết kế quai ngang đơn giản cho chàng thoải mái sử dụng trong mọi hoàn cảnh', '3.jpg', 3);
INSERT INTO `product` VALUES (4, 'Giày da cao cấp Gia Vi ', 650000, 25, 'Giày da cao cấp Gia Vi VN940: Chất liệu da bò cùng đế cao su bền đẹp chắc chắn cho bạn yên tâm trong quá trinh sử dụng. Thiết kế mũi nhọn sang trọng, thời trang và đầu phong cách làm toát lên vẻ nam tính và lịch lãm cho bạn.', '4.jpg', 3);
INSERT INTO `product` VALUES (5, 'Áo khoác dù nữ form rộng cá tính', 200000, 40, 'Áo khoác dù nữ form rộng cá tính: Chất liệu dù bền, dễ giặt mang lại cảm giác thoáng mát, thích hợp sử dụng suốt mọi mùa trong năm. Thiết kế phong cách, năng động mang đến vẻ ngoài cá tính, trẻ trung cho phái nữ', '5.jpg', 10);
INSERT INTO `product` VALUES (6, 'Áo sơ mi nữ bèo cột nơ ren', 159000, 20, 'Áo sơ mi nữ bèo cột nơ ren: Chất liệu cát giấy mát mẻ, đem lại cảm giác thông thoáng và thoải mái cho người mặc. Thiết kế cổ bẻ tay bèo điệu đà cho nàng thêm nữ tính khi diện', '6.jpg', 10);
INSERT INTO `product` VALUES (7, 'Balo nữ nhiều ngăn đa năng', 209000, 30, 'Balo nữ nhiều ngăn đa năng CNT: Chất liệu da Pu bền đẹp, chắc chắn khi mang cho bạn yên tâm khi sử dụng. Thiết kế mang phong cách thời trang, phù hợp với sở thích của nhiều bạn gái, cho bạn thêm thời trang, trẻ trung, năng động', '7.jpg', 13);
INSERT INTO `product` VALUES (8, 'Combo túi và ví nữ đính chuôi sành điệu ', 189000, 50, 'Combo túi và ví nữ đính chuôi sành điệu: Chất liệu da PU chắc chắn, thời trang, bền màu theo thời gian, cho bạn yên tâm khi sử dụng. Thiết kế thời trang với kiểu dáng trơn đơn giản, tạo nét cá tính riêng của bạn', '8.jpg', 13);
INSERT INTO `product` VALUES (16, 'Đồng hồ nam dây bấm lỗ cá tính', 319000, 40, 'Đồng hồ nam dây bấm lỗ cá tính: Chất liệu dây nhựa, bền đẹp, chắc chắn, dẻo dễ mang vào và tháo ra cho bạn luôn thoải mái nhất. Thiết kế vô cùng sáng tạo, mặt vuông lạ mắt sẽ là một phụ kiện thời trang tuyệt vời dành cho các anh chàng phái mạnh\r\n', '9.jpg', 4);
INSERT INTO `product` VALUES (17, 'Đồng hồ nam Sapphire lịch lãm', 450000, 50, 'Đồng hồ nam Sapphire lịch lãm GIA BẢO DM738SWB: Chất liệu mặt đồng hồ làm bằng kính sapphire glass nguyên khối chống trầy xước. Thiết kế đơn giản, tinh tế, mang đến phong cách đầy sang trọng, lịch lãm\r\n', '10.jpg', 4);
INSERT INTO `product` VALUES (18, 'Nhẫn kết hoa pha lê nữ tính', 320000, 20, 'Nhẫn kết hoa pha lê nữ tínhi: Chất liệu pha lê và đồng xi vàng đẹp mắt, bền màu đem lại yên tâm cho phái đẹp khi sử dụng, có thể phối với nhiều item khác nhau.Thiết kế tinh tế mang đến vẻ sang trọng, nổi bật cho phái nữ khi xuất hiện\r\n', '11.jpg', 14);
INSERT INTO `product` VALUES (19, 'Vòng tay nữ Pan Light Blue cá tính', 200000, 40, 'Vòng tay nữ Pan Light Blue cá tính: Chất liệu hợp kim pha bạc bền đẹp, an toàn với da tay. Thiết kế các hạt trang trí gồm nhiều hình dạng khác nhau, được chạm khắc đẹp mắt, đầy sinh động và cuốn hút, cho bạn tự tin khoe cá tính.\r\n', '12.jpg', 14);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'Quản trị viên');
INSERT INTO `role` VALUES (2, 'Khách hàng');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`),
  KEY `FK_USER_ROLE` (`role_id`),
  CONSTRAINT `FK_USER_ROLE` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', 'admin', 'Võ Thành Tài', 'thanhtai@gmail.com', '0981242314', 'Tân Phú', 1);
INSERT INTO `user` VALUES (7, 'customer', 'customer', 'Trần Hải My', 'mymap@gmail.com', '0932938178', 'Không biết', 2);
INSERT INTO `user` VALUES (16, 'kimlong', 'kimlong', 'Nguyễn Kim Long', 'kimlong@gmail.com', '01298131231', 'Tp HCM', 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
