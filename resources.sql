/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : resources

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/01/2019 11:29:21
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
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `SEARCH_ADMINISTRATORS`(`name`, `password`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of administrators
-- ----------------------------
INSERT INTO `administrators` VALUES (1, 163056, '邓占勇', '123456', '2019-01-16 09:32:07', '2019-01-16 09:32:07');

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
INSERT INTO `classifies` VALUES (2, 253625, 'Vue 生态（PC 端）', '可结合VUE进行开发', '2019-01-18 03:27:37', '2019-01-18 03:27:37');
INSERT INTO `classifies` VALUES (3, 536248, '项目工程', '用于构建项目', '2019-01-22 01:26:04', '2019-01-22 01:26:04');
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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of elements
-- ----------------------------
INSERT INTO `elements` VALUES (1, 'VUE', 'VUE是一个MVVM框架', 'https://vue.docschina.org/', 'https://github.com/docschina/vuejs.org', 1, '2019-01-16 09:41:55', '2019-01-23 03:00:30', 'http://www.xmwweb.cn/php/file/upload/vue.png');
INSERT INTO `elements` VALUES (8, 'Angalar', 'Angalar是一款优秀的前端框架，常用于大型项目', 'https://angular.cn/', NULL, 1, '2019-01-18 03:25:34', '2019-01-23 03:05:46', 'http://www.xmwweb.cn/php/file/upload/angalar.jpg');
INSERT INTO `elements` VALUES (12, 'React', '未填写', 'https://react.docschina.org/', 'https://github.com/discountry/react', 1, '2019-01-22 01:43:31', '2019-01-23 09:16:06', 'http://www.xmwweb.cn/php/file/upload/react.jpg');
INSERT INTO `elements` VALUES (35, 'webpack', '', 'https://webpack.docschina.org/', '', 3, '2019-01-25 14:41:08', '2019-01-25 15:14:56', 'http://www.xmwweb.cn/php/file/upload/webpack.png');
INSERT INTO `elements` VALUES (38, '335', '', '3313', '', 1, '2019-01-25 15:17:12', '2019-01-25 15:17:12', 'http://www.xmwweb.cn/php/file/upload/webpack.png');

SET FOREIGN_KEY_CHECKS = 1;
