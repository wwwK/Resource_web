/*
 Navicat Premium Data Transfer

 Source Server         : 新建
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : resources

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 12/02/2019 16:39:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for administrators
-- ----------------------------
DROP TABLE IF EXISTS `administrators`;
CREATE TABLE `administrators`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `SEARCH_ADMINISTRATORS`(`name`, `password`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of administrators
-- ----------------------------
INSERT INTO `administrators` VALUES (1, 163056, '邓占勇', '18883245188', '123456', '2019-01-16 09:32:07', '2019-02-09 10:27:36');
INSERT INTO `administrators` VALUES (2, 2, '测试用户', '18716565374', '666666', '2019-02-09 11:13:17', '2019-02-09 11:13:17');

-- ----------------------------
-- Table structure for browserrecord
-- ----------------------------
DROP TABLE IF EXISTS `browserrecord`;
CREATE TABLE `browserrecord`  (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `CodeName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UA` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 186 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of browserrecord
-- ----------------------------
INSERT INTO `browserrecord` VALUES (10, '2019-02-01 16:28:38', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (9, '2019-02-01 16:26:59', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0');
INSERT INTO `browserrecord` VALUES (8, '2019-02-01 16:26:04', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (11, '2019-02-01 16:29:04', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0');
INSERT INTO `browserrecord` VALUES (12, '2019-02-01 16:29:04', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (13, '2019-02-01 16:29:09', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (14, '2019-02-01 16:30:07', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0');
INSERT INTO `browserrecord` VALUES (15, '2019-02-01 16:35:10', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (16, '2019-02-01 16:35:22', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (17, '2019-02-01 16:44:14', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (18, '2019-02-01 16:55:43', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (19, '2019-02-01 16:58:43', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (20, '2019-02-01 17:00:05', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (21, '2019-02-01 17:00:07', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (22, '2019-02-01 20:57:53', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (23, '2019-02-01 20:58:28', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (24, '2019-02-02 17:05:06', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (25, '2019-02-02 17:11:23', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (26, '2019-02-02 17:12:17', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (27, '2019-02-02 17:13:28', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (28, '2019-02-02 17:13:45', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (29, '2019-02-02 17:21:27', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (30, '2019-02-02 17:24:35', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (31, '2019-02-02 23:42:34', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (32, '2019-02-02 23:43:17', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (33, '2019-02-02 23:52:23', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (34, '2019-02-02 23:52:36', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (35, '2019-02-02 23:54:21', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (36, '2019-02-03 00:01:37', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (37, '2019-02-03 00:02:17', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (38, '2019-02-03 00:03:07', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (39, '2019-02-03 00:03:46', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (40, '2019-02-03 00:06:28', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (41, '2019-02-03 00:08:15', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (42, '2019-02-03 00:09:52', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (43, '2019-02-03 00:11:23', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (44, '2019-02-03 00:11:35', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (45, '2019-02-03 00:12:03', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (46, '2019-02-03 00:12:22', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (47, '2019-02-03 00:12:46', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (48, '2019-02-03 12:05:29', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (49, '2019-02-03 12:33:11', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (50, '2019-02-03 12:40:38', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0');
INSERT INTO `browserrecord` VALUES (51, '2019-02-03 12:40:47', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.87 Safari/537.36 QQBrowser/9.2.5583.400');
INSERT INTO `browserrecord` VALUES (52, '2019-02-03 12:41:35', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (53, '2019-02-03 12:41:52', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (54, '2019-02-03 13:09:15', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (55, '2019-02-03 13:23:57', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (56, '2019-02-03 13:34:21', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (57, '2019-02-04 14:29:07', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (58, '2019-02-04 14:30:10', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (59, '2019-02-04 14:30:33', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (60, '2019-02-04 14:30:35', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (61, '2019-02-04 14:30:38', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (62, '2019-02-04 14:32:32', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (63, '2019-02-04 14:33:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (64, '2019-02-04 14:35:45', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (65, '2019-02-04 14:39:23', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (66, '2019-02-04 14:54:15', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (67, '2019-02-04 14:59:58', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (68, '2019-02-06 10:16:44', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (69, '2019-02-06 10:18:02', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (70, '2019-02-06 10:18:18', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (71, '2019-02-06 10:18:21', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (72, '2019-02-06 10:18:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (73, '2019-02-06 10:56:51', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (74, '2019-02-06 10:59:23', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (75, '2019-02-06 11:01:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (76, '2019-02-06 11:01:33', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (77, '2019-02-09 09:34:51', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (78, '2019-02-09 09:44:29', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (79, '2019-02-09 09:45:05', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (80, '2019-02-09 09:49:32', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (81, '2019-02-09 10:01:15', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (82, '2019-02-09 10:01:55', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (83, '2019-02-09 10:02:11', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (84, '2019-02-09 10:04:03', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (85, '2019-02-09 10:16:29', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (86, '2019-02-09 10:18:37', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (87, '2019-02-09 10:18:43', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (88, '2019-02-09 10:20:53', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (89, '2019-02-09 10:22:36', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (90, '2019-02-09 10:34:44', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (91, '2019-02-09 10:40:38', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (92, '2019-02-09 10:42:59', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (93, '2019-02-09 11:08:33', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (94, '2019-02-09 11:15:47', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (95, '2019-02-09 11:18:32', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (96, '2019-02-09 11:26:08', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (97, '2019-02-09 11:26:43', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (98, '2019-02-09 11:35:23', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (99, '2019-02-09 11:36:06', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (100, '2019-02-09 11:41:59', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (101, '2019-02-09 11:43:11', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (102, '2019-02-09 11:45:39', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (103, '2019-02-09 11:47:03', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (104, '2019-02-09 11:53:17', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (105, '2019-02-09 11:54:16', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (106, '2019-02-09 12:00:28', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (107, '2019-02-09 12:14:11', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (108, '2019-02-09 12:19:42', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (109, '2019-02-11 09:49:25', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (110, '2019-02-11 09:50:38', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (111, '2019-02-11 09:58:26', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (112, '2019-02-11 10:02:40', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (113, '2019-02-11 10:16:33', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (114, '2019-02-11 10:29:27', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (115, '2019-02-11 10:31:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (116, '2019-02-11 10:34:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (117, '2019-02-11 11:08:08', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (118, '2019-02-11 11:09:32', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (119, '2019-02-11 15:04:49', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (120, '2019-02-11 15:06:19', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (121, '2019-02-11 15:07:16', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (122, '2019-02-11 15:07:19', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (123, '2019-02-11 15:35:09', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (124, '2019-02-11 15:36:46', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (125, '2019-02-11 15:42:22', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (126, '2019-02-11 15:45:37', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (127, '2019-02-11 15:51:07', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (128, '2019-02-11 15:51:16', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (129, '2019-02-11 15:51:33', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (130, '2019-02-11 15:51:53', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (131, '2019-02-11 16:11:02', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (132, '2019-02-11 16:11:41', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (133, '2019-02-11 16:12:55', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (134, '2019-02-11 16:13:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (135, '2019-02-11 16:14:38', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (136, '2019-02-11 16:15:04', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (137, '2019-02-11 16:15:38', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (138, '2019-02-11 16:17:02', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (139, '2019-02-11 16:22:17', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (140, '2019-02-11 16:23:19', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (141, '2019-02-11 16:24:43', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (142, '2019-02-11 16:25:29', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (143, '2019-02-11 16:25:36', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (144, '2019-02-11 16:27:32', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (145, '2019-02-11 16:44:57', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (146, '2019-02-11 16:46:06', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (147, '2019-02-11 16:49:48', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (148, '2019-02-11 16:51:01', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (149, '2019-02-11 16:55:06', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (150, '2019-02-11 16:55:39', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (151, '2019-02-11 16:57:44', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (152, '2019-02-11 17:03:59', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (153, '2019-02-11 17:07:30', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (154, '2019-02-11 17:07:53', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (155, '2019-02-11 17:08:06', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (156, '2019-02-11 17:10:13', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (157, '2019-02-11 17:11:06', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (158, '2019-02-11 17:12:02', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (159, '2019-02-11 17:19:26', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (160, '2019-02-12 09:16:56', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (161, '2019-02-12 09:25:36', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (162, '2019-02-12 09:26:47', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (163, '2019-02-12 09:32:21', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (164, '2019-02-12 09:41:37', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (165, '2019-02-12 09:42:21', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (166, '2019-02-12 09:44:13', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (167, '2019-02-12 09:46:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (168, '2019-02-12 09:46:54', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (169, '2019-02-12 09:49:57', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (170, '2019-02-12 09:58:18', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (171, '2019-02-12 10:40:24', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (172, '2019-02-12 10:43:15', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (173, '2019-02-12 10:47:25', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (174, '2019-02-12 10:48:04', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (175, '2019-02-12 10:51:50', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (176, '2019-02-12 10:52:55', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (177, '2019-02-12 10:54:04', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (178, '2019-02-12 11:02:13', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (179, '2019-02-12 11:07:47', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (180, '2019-02-12 11:17:18', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (181, '2019-02-12 15:01:33', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (182, '2019-02-12 15:04:40', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (183, '2019-02-12 15:10:33', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (184, '2019-02-12 15:17:04', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');
INSERT INTO `browserrecord` VALUES (185, '2019-02-12 16:38:26', 'Mozilla', 'Netscape', 'Win32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36');

-- ----------------------------
-- Table structure for classifies
-- ----------------------------
DROP TABLE IF EXISTS `classifies`;
CREATE TABLE `classifies`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NULL DEFAULT NULL,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `u_name`(`type_name`) USING BTREE,
  UNIQUE INDEX `u_number`(`number`) USING BTREE,
  FULLTEXT INDEX `SEARCH_CLASSIFIES`(`type_name`, `type_desc`)
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classifies
-- ----------------------------
INSERT INTO `classifies` VALUES (1, 2015326, '前端框架', '暂无秒描述', '2019-01-16 09:39:07', '2019-01-16 09:39:07');
INSERT INTO `classifies` VALUES (2, 253625, 'Vue 生态（PC 端）', '可结合VUE进行开发', '2019-01-18 03:27:37', '2019-01-30 08:59:31');
INSERT INTO `classifies` VALUES (3, 536248, '项目工程', '用于构建项目', '2019-01-22 01:26:04', '2019-01-30 15:45:21');
INSERT INTO `classifies` VALUES (34, 142785, '语言标准', '无描述', '2019-01-25 11:16:54', '2019-01-25 11:16:54');
INSERT INTO `classifies` VALUES (35, 854125, '编程规范', '无描述', '2019-01-25 11:17:04', '2019-01-25 11:17:04');
INSERT INTO `classifies` VALUES (36, 963256, '模板', '无描述', '2019-01-25 11:17:14', '2019-01-25 11:17:14');
INSERT INTO `classifies` VALUES (37, 963151, '状态管理', '无描述', '2019-01-25 11:17:24', '2019-01-25 11:17:24');
INSERT INTO `classifies` VALUES (39, 965236, 'Vue 生态（移动端）', '无描述', '2019-01-25 11:18:27', '2019-01-25 11:18:27');
INSERT INTO `classifies` VALUES (40, 854126, 'React生态', '无描述', '2019-01-25 11:18:45', '2019-01-25 11:18:45');
INSERT INTO `classifies` VALUES (41, 963265, 'Angalar生态', '无描述', '2019-01-25 11:18:57', '2019-01-25 11:18:57');
INSERT INTO `classifies` VALUES (42, 845263, 'Node.js生态', '无描述', '2019-01-25 11:19:08', '2019-01-25 11:19:08');
INSERT INTO `classifies` VALUES (43, 874596, '学习手册', '无描述', '2019-01-25 11:19:25', '2019-01-25 11:19:25');
INSERT INTO `classifies` VALUES (44, 523625, '视频', '无描述', '2019-01-25 11:19:45', '2019-01-25 11:19:45');
INSERT INTO `classifies` VALUES (45, 523627, '可视化', '无描述', '2019-01-25 11:20:00', '2019-01-25 11:20:00');
INSERT INTO `classifies` VALUES (46, 569521, 'CSS生态', '无描述', '2019-01-25 11:20:12', '2019-01-25 11:20:12');
INSERT INTO `classifies` VALUES (47, 752635, '测试相关', '无描述', '2019-01-25 11:21:14', '2019-01-25 11:21:14');
INSERT INTO `classifies` VALUES (48, 874524, '机器学习', '无描述', '2019-01-25 11:21:23', '2019-01-25 11:21:23');
INSERT INTO `classifies` VALUES (49, 963264, '周刊', '无描述', '2019-01-25 11:21:35', '2019-01-25 11:21:35');
INSERT INTO `classifies` VALUES (50, 745285, 'utils工具', '无描述', '2019-01-25 11:21:51', '2019-01-25 11:21:51');
INSERT INTO `classifies` VALUES (51, 854127, '翻译工具', '无描述', '2019-01-25 11:22:09', '2019-01-25 11:22:09');

-- ----------------------------
-- Table structure for elements
-- ----------------------------
DROP TABLE IF EXISTS `elements`;
CREATE TABLE `elements`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `github` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `SEARCH_ELEMENTS`(`title`, `desc`, `website`, `github`)
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of elements
-- ----------------------------
INSERT INTO `elements` VALUES (1, 'VUE', '渐进式 JavaScript 框架', 'https://vue.docschina.org/', 'https://github.com/docschina/vuejs.org', 1, '2019-01-16 09:41:55', '2019-01-29 11:08:27', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (8, 'Angalar', '一套框架多种平台', 'https://angular.cn/', '', 1, '2019-01-18 03:25:34', '2019-01-29 11:08:19', 'http://www.xmwweb.cn/php/file/upload/angalar.jpg');
INSERT INTO `elements` VALUES (12, 'React', '创建大型的 JavaScript 应用程序', 'https://react.docschina.org/', 'https://github.com/discountry/react', 1, '2019-01-22 01:43:31', '2019-01-29 11:08:09', 'http://www.xmwweb.cn/php/file/upload/react.jpg');
INSERT INTO `elements` VALUES (35, 'webpack', '用于现代 JavaScript 应用程序的静态模块打包工具', 'https://webpack.docschina.org/', '', 3, '2019-01-25 14:41:08', '2019-01-29 11:07:57', 'http://www.xmwweb.cn/php/file/upload/webpack.png');
INSERT INTO `elements` VALUES (39, 'grunt', 'JavaScript 世界的构建工具', 'https://grunt.docschina.org/', '', 3, '2019-01-29 10:58:08', '2019-01-29 10:58:08', 'http://www.xmwweb.cn/php/file/upload/grunt.jpg');
INSERT INTO `elements` VALUES (40, 'Babel', '一个编译工具，让你可以项目中直接使用下一代 JavaScript', 'https://babel.docschina.org/', '', 3, '2019-01-29 11:00:11', '2019-01-30 10:24:48', 'http://www.xmwweb.cn/php/file/upload/u=1814837557,2224582926&fm=26&gp=0.jpg');
INSERT INTO `elements` VALUES (41, 'Rollup', '新一代 JavaScript 模块打包器', 'https://rollup.docschina.org/', '', 3, '2019-01-29 11:00:47', '2019-01-30 16:00:16', 'http://www.xmwweb.cn/php/file/upload/u=2692644386,2476642133&fm=26&gp=0.jpg');
INSERT INTO `elements` VALUES (42, ' TypeScript', 'JavaScript 超集', 'https://zhongsp.gitbooks.io/typescript-handbook/', '', 3, '2019-01-29 11:01:46', '2019-01-29 11:07:12', 'http://www.xmwweb.cn/php/file/upload/u=16458510,433421126&fm=26&gp=0.jpg');
INSERT INTO `elements` VALUES (43, 'Gulp', '基于流的自动化构建工具', 'https://www.gulpjs.com.cn/', '', 3, '2019-01-29 11:06:48', '2019-01-30 15:59:39', 'http://www.xmwweb.cn/php/file/upload/u=2861542262,1070036820&fm=26&gp=0.jpg');
INSERT INTO `elements` VALUES (45, 'Node.js', '基于 V8 引擎的 JS 运行环境', 'http://nodejs.cn/', '', 34, '2019-01-30 08:57:47', '2019-01-30 08:57:47', 'http://www.xmwweb.cn/php/file/upload/u=3405831482,1977746283&fm=26&gp=0.jpg');
INSERT INTO `elements` VALUES (46, 'Element UI', '饿了么 - 基于 Vue 的组件库', 'http://element-cn.eleme.io/#/', '', 2, '2019-01-31 10:20:38', '2019-01-31 10:30:09', 'http://www.xmwweb.cn/php/file/upload/elementUI.png');
INSERT INTO `elements` VALUES (47, 'iView UI', 'TalkingData - 基于 Vue 的组件', 'https://www.iviewui.com/', '', 2, '2019-01-31 10:26:09', '2019-01-31 10:26:44', 'http://www.xmwweb.cn/php/file/upload/iView UI.png');
INSERT INTO `elements` VALUES (48, 'Vue UI Framework', 'Vue 官方 UI 组件', 'https://vuejs.github.io/ui/', '', 2, '2019-01-31 10:27:33', '2019-01-31 10:27:33', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (49, 'Vuetify', '基于 Vue 的 Material 组件库', 'https://vuetifyjs.com/zh-Hans/', '', 2, '2019-01-31 10:30:46', '2019-01-31 10:30:46', 'http://www.xmwweb.cn/php/file/upload/Vuetify.png');
INSERT INTO `elements` VALUES (50, 'vue-beauty', 'Ant Design 的 Vue 实现', 'https://fe-driver.github.io/vue-beauty', '', 2, '2019-01-31 10:31:18', '2019-01-31 10:31:18', 'http://www.xmwweb.cn/php/file/upload/vue-beauty.png');
INSERT INTO `elements` VALUES (51, 'Muse-UI', '基于 Vue 和 Material Design 的 UI 组件库', 'http://www.muse-ui.org/', '', 2, '2019-01-31 10:31:45', '2019-01-31 10:31:45', 'http://www.xmwweb.cn/php/file/upload/Muse-UI.png');
INSERT INTO `elements` VALUES (52, 'HeyUI', '一个基于 Vue 的高质量 UI 组件库', 'https://www.heyui.top/', '', 2, '2019-01-31 10:32:22', '2019-01-31 15:40:10', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (53, 'Element Admin', '基于 Vue 的内容管理系统(CMS)', 'http://panjiachen.github.io/vue-element-admin/#/', '', 2, '2019-01-31 10:33:41', '2019-01-31 10:33:41', 'http://www.xmwweb.cn/php/file/upload/elementUI.png');
INSERT INTO `elements` VALUES (54, 'iView Admin', 'TalkingData - 基于 Vue 的内容管理系统(CMS)', 'https://iview.github.io/iview-admin/', '', 2, '2019-01-31 10:34:11', '2019-01-31 10:34:11', 'http://www.xmwweb.cn/php/file/upload/iView UI.png');
INSERT INTO `elements` VALUES (55, 'vue-ssr', 'Vue 官方提供的服务器端渲染(SSR)指南', 'https://ssr.vuejs.org/zh/', '', 2, '2019-01-31 10:34:44', '2019-01-31 10:34:44', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (56, 'vue-loader', 'vue-loader 可以将 Vue 单文件组件转换为 JavaScript 模块的 ...', 'https://vue-loader.vuejs.org/zh/', '', 2, '2019-01-31 10:35:19', '2019-01-31 10:35:19', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (57, 'webpack template', '针对大型 Vue 项目的 webpack 样例(boilerplate)', 'https://vuejs-templates.github.io/webpack/', '', 2, '2019-01-31 10:36:15', '2019-01-31 10:36:15', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (58, 'Vue 企业级样例', '通过 Vue CLI 3 创建出来，为全新的 Vue SPA 项目所设计，...', 'https://github.com/chrisvfritz/vue-enterprise-boilerplate', '', 2, '2019-01-31 10:36:49', '2019-01-31 10:36:49', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (59, 'VuePress', '由 Vue 提供支持的静态站点生成器', 'https://vuepress.docschina.org/', '', 2, '2019-01-31 10:37:15', '2019-01-31 10:37:15', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (60, 'vue-router', 'vue-router 是 Vue 官方提供的 router', 'https://router.vuejs.org/zh/', '', 2, '2019-01-31 10:37:38', '2019-01-31 10:37:38', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (61, 'vue-rx', 'vue-rx 帮助用户在 Vue 应用程序中实现简单的 RxJS 绑定', 'https://github.com/vuejs/vue-rx/blob/master/README-CN.md', '', 2, '2019-01-31 10:38:16', '2019-01-31 10:38:16', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (62, 'vue-cli', 'vue-cli 帮助用户快速开发 Vue 的脚手架(scaffold)', 'https://cli.vuejs.org/zh/', '', 2, '2019-01-31 10:38:46', '2019-01-31 15:40:00', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (63, 'Nuxt.js', 'Vue.js 元框架，用于快速创建复杂、', 'https://zh.nuxtjs.org/', '', 2, '2019-01-31 10:39:27', '2019-01-31 10:39:27', 'http://www.xmwweb.cn/php/file/upload/Nuxt.js.png');
INSERT INTO `elements` VALUES (64, 'San', '百度 - 灵活易用的 JavaScript 组件框架，兼容到 IE6', 'https://baidu.github.io/san/', '', 2, '2019-01-31 10:40:21', '2019-01-31 11:14:59', 'http://www.xmwweb.cn/php/file/upload/San1.png');
INSERT INTO `elements` VALUES (65, 'Polymer', '一个现代的 JavaScript 工具库', 'https://polymer-zh.cn/', '', 1, '2019-01-31 10:46:30', '2019-01-31 10:46:30', 'http://www.xmwweb.cn/php/file/upload/Polymer.png');
INSERT INTO `elements` VALUES (66, 'RxJS', 'RxJS 是 Reactive Extensions 的 JavaScript 实现，可以通过...', 'http://cn.rx.js.org/', '', 1, '2019-01-31 10:47:27', '2019-01-31 10:47:27', 'http://www.xmwweb.cn/php/file/upload/RxJS.png');
INSERT INTO `elements` VALUES (67, 'Cycle.js', '函数式和响应式的 JavaScript 框架', 'http://cyclejs.cn/', '', 1, '2019-01-31 10:47:56', '2019-01-31 10:47:56', 'http://www.xmwweb.cn/php/file/upload/Cycle.js.png');
INSERT INTO `elements` VALUES (68, 'Parcel', '零配置打包工具', 'https://parceljs.docschina.org/', '', 3, '2019-01-31 10:51:48', '2019-01-31 10:51:48', 'http://www.xmwweb.cn/php/file/upload/Parcel.png');
INSERT INTO `elements` VALUES (69, 'Lerna', '用于管理有多个包的 JavaScript 项目的工具', 'https://lernajs.io/', '', 3, '2019-01-31 10:54:33', '2019-01-31 10:54:33', 'http://www.xmwweb.cn/php/file/upload/Lerna.png');
INSERT INTO `elements` VALUES (70, 'OpenAPI', 'OpenAPI 规范为 RESTful API 定义了一个与语言无关的标准...', 'https://swagger.io/docs/specification/about/', '', 34, '2019-01-31 10:56:07', '2019-01-31 10:56:07', 'http://www.xmwweb.cn/php/file/upload/OpenAPI.png');
INSERT INTO `elements` VALUES (71, 'MDN', '提供 Web 技术文档，学习 Web 开发的最佳实践\n\n', 'https://developer.mozilla.org/zh-CN/docs/Web', '', 34, '2019-01-31 10:57:37', '2019-01-31 10:57:37', 'http://www.xmwweb.cn/php/file/upload/MDN.png');
INSERT INTO `elements` VALUES (72, 'ECMAScript', 'ECMAScript 2018 标准', 'https://ecma262.docschina.org/', '', 34, '2019-01-31 10:58:41', '2019-01-31 10:58:41', 'http://www.xmwweb.cn/php/file/upload/ECMAScript.png');
INSERT INTO `elements` VALUES (73, 'GraphQL', '一种用于 API 的查询语言', 'http://graphql.cn/', '', 34, '2019-01-31 10:59:10', '2019-01-31 10:59:10', 'http://www.xmwweb.cn/php/file/upload/GraphQL.png');
INSERT INTO `elements` VALUES (74, 'JSON Schema', 'JSON Schema 是一个词汇表，可以验证、注释和操作 JSON...', 'http://json-schema.org/', '', 34, '2019-01-31 10:59:47', '2019-01-31 10:59:47', 'http://www.xmwweb.cn/php/file/upload/JSON Schema.png');
INSERT INTO `elements` VALUES (75, 'ESLint', '可组装的、用于 JavaScript 和 JSX 的代码检查工具', 'https://cn.eslint.org/', '', 35, '2019-01-31 11:04:10', '2019-01-31 15:40:23', 'http://www.xmwweb.cn/php/file/upload/ESLint.png');
INSERT INTO `elements` VALUES (76, 'StyleLint', '强大的现代 CSS 检测工具，帮助样式表遵循一致的约定和避...', 'https://stylelint.io/', '', 35, '2019-01-31 11:04:42', '2019-01-31 11:04:42', 'http://www.xmwweb.cn/php/file/upload/StyleLint.png');
INSERT INTO `elements` VALUES (77, 'Standard JS', 'JavaScript 风格指南、检查工具和格式化工具', 'https://standardjs.com/', '', 35, '2019-01-31 11:05:08', '2019-01-31 11:05:08', 'http://www.xmwweb.cn/php/file/upload/Standard JS.png');
INSERT INTO `elements` VALUES (78, 'Vue 风格指南', 'Vue 代码的风格指南', 'https://vue.docschina.org/v2/style-guide/', '', 35, '2019-01-31 11:05:38', '2019-01-31 11:05:38', 'http://www.xmwweb.cn/php/file/upload/Vue 风格指南.png');
INSERT INTO `elements` VALUES (79, 'Mobx', '简单、可扩展的状态管理', 'https://cn.mobx.js.org/', '', 37, '2019-01-31 11:07:18', '2019-01-31 11:07:18', 'http://www.xmwweb.cn/php/file/upload/Mobx.png');
INSERT INTO `elements` VALUES (80, 'Vuex', 'vuex 是 Vue 官方提供的状态管理工具', 'https://vuex.vuejs.org/zh/guide/', '', 37, '2019-01-31 11:08:18', '2019-01-31 11:08:18', 'http://www.xmwweb.cn/php/file/upload/Vuex.png');
INSERT INTO `elements` VALUES (81, 'Redux', 'JavaScript 状态容器，提供可预测化的状态管理', 'https://cn.redux.js.org/', '', 37, '2019-01-31 11:09:07', '2019-01-31 11:09:07', 'http://www.xmwweb.cn/php/file/upload/Redux.png');
INSERT INTO `elements` VALUES (82, 'Rematch', 'Rematch 是没有 boilerplate 的 Redux 最佳实践', 'https://rematch.gitbook.io/', '', 37, '2019-01-31 11:09:40', '2019-01-31 11:09:40', 'http://www.xmwweb.cn/php/file/upload/Rematch.png');
INSERT INTO `elements` VALUES (84, 'Sass', 'Sass 是 CSS 的一个扩展，它使 CSS 的使用起来更加优雅和强...', 'https://sass-guidelin.es/zh/', '', 46, '2019-01-31 11:33:44', '2019-01-31 11:33:44', 'http://www.xmwweb.cn/php/file/upload/Sass.png');
INSERT INTO `elements` VALUES (85, 'Stylus', '富有表现力、动态、健壮的 CSS', 'https://www.zhangxinxu.com/jq/stylus/', '', 46, '2019-01-31 11:34:23', '2019-01-31 11:34:23', 'http://www.xmwweb.cn/php/file/upload/Stylus.png');
INSERT INTO `elements` VALUES (86, 'Less', 'Less 是 CSS 预处理语言，使 CSS 更易维护和扩展', 'http://lesscss.cn/', '', 46, '2019-01-31 11:37:48', '2019-01-31 11:37:48', 'http://www.xmwweb.cn/php/file/upload/Less.png');
INSERT INTO `elements` VALUES (87, 'PostCSS', '通过 JavaScript 来转换 CSS，并且提供强大的插件生态系统', 'http://postcss.docschina.org/', '', 46, '2019-01-31 11:38:26', '2019-01-31 11:38:26', 'http://www.xmwweb.cn/php/file/upload/PostCSS.png');
INSERT INTO `elements` VALUES (88, 'Lavas', '百度 - 基于 Vue 的 PWA 解决方案', 'https://lavas.baidu.com/', '', 39, '2019-01-31 15:04:55', '2019-01-31 15:04:55', 'http://www.xmwweb.cn/php/file/upload/Lavas.png');
INSERT INTO `elements` VALUES (89, 'Mint UI', '饿了么 - 基于 Vue 的组件库', 'http://mint-ui.github.io/', '', 39, '2019-01-31 15:05:21', '2019-01-31 15:05:21', 'http://www.xmwweb.cn/php/file/upload/Mint UI.png');
INSERT INTO `elements` VALUES (90, 'Vant', '有赞 - 移动端 Vue 组件库', 'https://www.youzanyun.com/zanui/vant', '', 39, '2019-01-31 15:05:54', '2019-01-31 15:05:54', 'http://www.xmwweb.cn/php/file/upload/vant-2e036e.png');
INSERT INTO `elements` VALUES (91, 'Cube UI', '滴滴 - 基于 Vue 实现的精致移动端组件库', 'https://didi.github.io/cube-ui/#/zh-CN', '', 39, '2019-01-31 15:06:38', '2019-01-31 15:06:38', 'http://www.xmwweb.cn/php/file/upload/cube-c9f7f1.png');
INSERT INTO `elements` VALUES (92, 'Mand Mobile', '滴滴 - 面向金融场景的 Vue 移动端组件库', 'https://didi.github.io/mand-mobile/', '', 39, '2019-01-31 15:07:08', '2019-01-31 15:07:08', 'http://www.xmwweb.cn/php/file/upload/download.png');
INSERT INTO `elements` VALUES (93, 'Mand Mobile Palette', '滴滴 - 可视化 Mand Mobile 主题编辑器', 'https://mand-mobile.github.io/palette/#/home', '', 39, '2019-01-31 15:08:07', '2019-01-31 15:08:07', 'http://www.xmwweb.cn/php/file/upload/download.png');
INSERT INTO `elements` VALUES (94, 'VUX', '基于 Vue 的移动端组件库', 'https://vux.li/', '', 39, '2019-01-31 15:08:37', '2019-01-31 15:08:37', 'http://www.xmwweb.cn/php/file/upload/vux-79cbb9.png');
INSERT INTO `elements` VALUES (95, 'YDUI', '基于 Vue 的移动端 & 微信 UI 组件库', 'http://vue.ydui.org/', '', 39, '2019-01-31 15:09:15', '2019-01-31 15:09:15', 'http://www.xmwweb.cn/php/file/upload/ydui-392682.png');
INSERT INTO `elements` VALUES (96, 'mpvue', '美团 - 基于 Vue 的小程序开发框架，从底层支持 Vue 语法和...', 'http://mpvue.com', '', 39, '2019-01-31 15:09:50', '2019-01-31 15:09:50', 'http://www.xmwweb.cn/php/file/upload/mpvue-0aaccd.png');
INSERT INTO `elements` VALUES (97, 'Weex', '阿里巴巴 - 基于 Vue 的移动端跨平台 UI', 'https://weex.apache.org/', '', 39, '2019-01-31 15:11:23', '2019-01-31 15:11:23', 'http://www.xmwweb.cn/php/file/upload/OR8GCN0`[}X~{JK`TG84`]D.png');
INSERT INTO `elements` VALUES (98, 'RxJS 5 基本原理', '本书是 RxJS 的初中级书，适用于任何想要入门 RxJS 的开发者', 'https://rxjs-cn.github.io/rxjs5-ultimate-cn/', '', 43, '2019-01-31 15:32:11', '2019-01-31 15:32:11', 'http://www.xmwweb.cn/php/file/upload/rxjs-4b9b55.png');
INSERT INTO `elements` VALUES (99, '学习 RxJS 操作符', '通过每个操作符的清晰示例及解释来进行 RxJS 的学习', 'https://rxjs-cn.github.io/learn-rxjs-operators/', '', 43, '2019-01-31 15:32:37', '2019-01-31 15:32:37', 'http://www.xmwweb.cn/php/file/upload/rxjs-4b9b55.png');
INSERT INTO `elements` VALUES (100, 'Threejs', 'JavaScript 3d 库', 'https://threejs.docschina.org/', '', 45, '2019-01-31 15:34:08', '2019-01-31 15:34:08', 'http://www.xmwweb.cn/php/file/upload/threejs-6c6680.png');
INSERT INTO `elements` VALUES (101, 'ECharts', '百度 - 使用 JavaScript 实现的开源可视化库', 'http://echarts.baidu.com/', '', 45, '2019-01-31 15:34:35', '2019-01-31 15:34:35', 'http://www.xmwweb.cn/php/file/upload/echarts-904a59.png');
INSERT INTO `elements` VALUES (102, 'SpriteJS', '360 - 跨平台的轻量级 2D 渲染对象模型', 'http://spritejs.org/', '', 45, '2019-01-31 15:35:14', '2019-01-31 15:35:14', 'http://www.xmwweb.cn/php/file/upload/spritejs-0ab41a.png');
INSERT INTO `elements` VALUES (103, 'Vue Native', 'Vue Native is a framework to build cross platform native mobile apps using JavaScript', 'https://vue-native.io/', '', 39, '2019-02-11 15:08:14', '2019-02-11 15:08:45', 'http://www.xmwweb.cn/php/file/upload/logo.png');

-- ----------------------------
-- Table structure for landingrecord
-- ----------------------------
DROP TABLE IF EXISTS `landingrecord`;
CREATE TABLE `landingrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `landingMode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `loadingTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `verCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of landingrecord
-- ----------------------------
INSERT INTO `landingrecord` VALUES (18, '测试用户', '18716565374', '账号密码登陆', '2019-02-11 09:52:26', NULL);
INSERT INTO `landingrecord` VALUES (19, '测试用户', '18716565374', '短信验证码登陆', '2019-02-11 09:54:11', NULL);
INSERT INTO `landingrecord` VALUES (17, '邓占勇', '18883245188', '账号密码登陆', '2019-02-11 09:50:49', NULL);
INSERT INTO `landingrecord` VALUES (20, '邓占勇', '18883245188', '账号密码登陆', '2019-02-11 09:58:39', '无');
INSERT INTO `landingrecord` VALUES (21, '测试用户', '18716565374', '账号密码', '2019-02-11 09:59:24', '无');
INSERT INTO `landingrecord` VALUES (22, '测试用户', '18716565374', '账号密码', '2019-02-11 09:59:55', '无');
INSERT INTO `landingrecord` VALUES (23, '邓占勇', '18883245188', '账号密码', '2019-02-11 10:00:14', '无');
INSERT INTO `landingrecord` VALUES (24, '测试用户', '18716565374', '短信验证码', '2019-02-11 10:00:48', '772394');
INSERT INTO `landingrecord` VALUES (25, '邓占勇', '18883245188', '账号密码', '2019-02-11 15:06:40', '无');
INSERT INTO `landingrecord` VALUES (26, '测试用户', '18716565374', '短信验证码', '2019-02-11 15:37:11', '199780');
INSERT INTO `landingrecord` VALUES (27, '邓占勇', '18883245188', '短信验证码', '2019-02-11 15:42:50', '762921');
INSERT INTO `landingrecord` VALUES (28, '测试用户', '18716565374', '短信验证码', '2019-02-11 15:46:10', '816192');
INSERT INTO `landingrecord` VALUES (29, '邓占勇', '18883245188', '短信验证码', '2019-02-11 15:47:04', '265814');
INSERT INTO `landingrecord` VALUES (30, '测试用户', '18716565374', '账号密码', '2019-02-11 15:52:51', '无');
INSERT INTO `landingrecord` VALUES (31, '邓占勇', '18883245188', '账号密码', '2019-02-11 16:46:16', '无');
INSERT INTO `landingrecord` VALUES (32, '邓占勇', '18883245188', '账号密码', '2019-02-11 17:17:01', '无');
INSERT INTO `landingrecord` VALUES (33, '测试用户', '18716565374', '账号密码', '2019-02-11 17:19:44', '无');
INSERT INTO `landingrecord` VALUES (34, '邓占勇', '18883245188', '短信验证码', '2019-02-12 09:38:57', '865097');
INSERT INTO `landingrecord` VALUES (35, '邓占勇', '18883245188', '短信验证码', '2019-02-12 09:47:28', '732795');
INSERT INTO `landingrecord` VALUES (36, '测试用户', '18716565374', '账号密码', '2019-02-12 09:50:11', '无');
INSERT INTO `landingrecord` VALUES (37, '测试用户', '18716565374', '账号密码', '2019-02-12 10:02:04', '无');
INSERT INTO `landingrecord` VALUES (38, '邓占勇', '18883245188', '短信验证码', '2019-02-12 15:05:26', '404921');

SET FOREIGN_KEY_CHECKS = 1;
