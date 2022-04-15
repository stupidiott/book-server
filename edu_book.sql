/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : edu_book

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 15/04/2022 18:07:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_account
-- ----------------------------
DROP TABLE IF EXISTS `edu_account`;
CREATE TABLE `edu_account`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0：无效 1：有效',
  `account_type` tinyint(1) NULL DEFAULT 0 COMMENT '账号类型 1：管理端 2：班主任  3：校领导',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_account
-- ----------------------------
INSERT INTO `edu_account` VALUES (1, 'Librarian', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2021-07-07 20:46:08', '2022-04-14 09:16:33');
INSERT INTO `edu_account` VALUES (2, 'User', '6512bd43d9caa6e02c990b0a82652dca', 1, 4, '2022-04-12 23:59:00', '2022-04-14 09:05:06');
INSERT INTO `edu_account` VALUES (8, 'User2', 'b6d767d2f8ed5d21a44b0e5886680cb9', 0, 4, '2022-04-13 19:22:18', '2022-04-13 23:57:56');
INSERT INTO `edu_account` VALUES (9, 'test', '202cb962ac59075b964b07152d234b70', 1, 4, '2022-04-14 09:20:14', '2022-04-14 09:20:37');

-- ----------------------------
-- Table structure for edu_account_login
-- ----------------------------
DROP TABLE IF EXISTS `edu_account_login`;
CREATE TABLE `edu_account_login`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录token',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户信息表',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 323 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号登录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_account_login
-- ----------------------------
INSERT INTO `edu_account_login` VALUES (312, '1649871742279', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649871647000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 01:42:22');
INSERT INTO `edu_account_login` VALUES (313, '1649897082176', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649871742000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 08:44:42');
INSERT INTO `edu_account_login` VALUES (314, '1649897105644', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"id\":2,\"lastLoginTime\":1649871385000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-14 08:45:06');
INSERT INTO `edu_account_login` VALUES (315, '1649897318377', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649897082000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 08:48:38');
INSERT INTO `edu_account_login` VALUES (316, '1649897886302', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649897318000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 08:58:06');
INSERT INTO `edu_account_login` VALUES (317, '1649898263448', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649897886000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 09:04:23');
INSERT INTO `edu_account_login` VALUES (318, '1649898306480', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"id\":2,\"lastLoginTime\":1649897106000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-14 09:05:06');
INSERT INTO `edu_account_login` VALUES (319, '1649898515349', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649898263000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 09:08:35');
INSERT INTO `edu_account_login` VALUES (320, '1649898703391', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649898515000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 09:11:43');
INSERT INTO `edu_account_login` VALUES (321, '1649898992770', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649898703000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-14 09:16:33');
INSERT INTO `edu_account_login` VALUES (322, '1649899237371', 'test', '{\"accountType\":4,\"createTime\":1649899214000,\"id\":9,\"lastLoginTime\":1649899214000,\"password\":\"202cb962ac59075b964b07152d234b70\",\"status\":1,\"username\":\"test\"}', '2022-04-14 09:20:37');

-- ----------------------------
-- Table structure for edu_account_menu
-- ----------------------------
DROP TABLE IF EXISTS `edu_account_menu`;
CREATE TABLE `edu_account_menu`  (
  `account_type` tinyint UNSIGNED NOT NULL COMMENT '账户类型 1：管理端 2：普通账户',
  `menu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单',
  PRIMARY KEY (`account_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_account_menu
-- ----------------------------
INSERT INTO `edu_account_menu` VALUES (1, '[\r\n    {\r\n      \"id\":1000,\r\n      \"name\":\"BOOK\",\r\n      \"iconClass\":\"el-icon-tickets\",\r\n      \"children\":[\r\n        {\r\n          \"id\": 100001,\r\n          \"name\": \"Book List\",\r\n          \"path\": \"/books\"\r\n        },\r\n	{\r\n          \"id\": 100004,\r\n          \"name\": \"History\",\r\n          \"path\": \"/borrowBookHistory\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n      \"id\":2000,\r\n      \"name\":\"ACCOUNT\",\r\n      \"iconClass\":\"el-icon-s-check\",\r\n      \"children\":[\r\n        {\r\n          \"id\":200001,\r\n          \"name\":\"Account List\",\r\n          \"path\":\"/accounts\"\r\n        }\r\n      ]\r\n    }\r\n  ]');
INSERT INTO `edu_account_menu` VALUES (4, '[\r\n    {\r\n      \"id\":1000,\r\n      \"name\":\"BOOK\",\r\n      \"iconClass\":\"el-icon-tickets\",\r\n      \"children\":[\r\n        {\r\n          \"id\": 100001,\r\n          \"name\": \"Book List\",\r\n          \"path\": \"/books\"\r\n        },\r\n	{\r\n          \"id\": 100002,\r\n          \"name\": \"Borrow Book\",\r\n          \"path\": \"/borrowBook\"\r\n        },\r\n	{\r\n          \"id\": 100003,\r\n          \"name\": \"Borrow List\",\r\n          \"path\": \"/borrowBookList\"\r\n        }\r\n      ]\r\n    }\r\n  ]');

-- ----------------------------
-- Table structure for edu_book
-- ----------------------------
DROP TABLE IF EXISTS `edu_book`;
CREATE TABLE `edu_book`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `book_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书编号',
  `book_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `library` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书管',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `publisher` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `status` int NULL DEFAULT NULL COMMENT '状态：0：未借出 1：已借出',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书描述',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_book_no`(`book_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_book
-- ----------------------------
INSERT INTO `edu_book` VALUES (1, '10001', '水浒传', '施耐庵', '南馆', '历史文献', '中国人民大学出版社', 5, '这是一本好书2,这是一本好书2,这是一本好书2,这是一本好书2,', 0, '2021-12-26 21:54:37');
INSERT INTO `edu_book` VALUES (2, '10002', '西游记', '罗贯中', '东馆', '名著', '北京大学出版社', 5, '古典名著', 0, '2022-01-07 22:17:45');
INSERT INTO `edu_book` VALUES (3, '10003', '三国演义', '罗贯中', '东馆', '名著', '清华大学出版社', 5, '好啊好啊！', 0, '2022-01-12 18:38:33');
INSERT INTO `edu_book` VALUES (7, '10008', 'Java', '11', '东馆', '名著', '11', 0, 'Java ', 0, '2022-04-14 09:19:05');

-- ----------------------------
-- Table structure for edu_borrow_book
-- ----------------------------
DROP TABLE IF EXISTS `edu_borrow_book`;
CREATE TABLE `edu_borrow_book`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `book_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书编号',
  `borrow_identity_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借书人身份证号',
  `start_time` datetime NULL DEFAULT NULL COMMENT '借书时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '到期时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志：0：未删除 1：已删除',
  `return_time` datetime NULL DEFAULT NULL COMMENT '还书时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借书信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_borrow_book
-- ----------------------------
INSERT INTO `edu_borrow_book` VALUES (61, '10003', 'test', '2022-04-14 00:00:00', '2022-04-15 00:00:00', '2022-04-14 09:23:32', 1, '2022-04-14 09:23:47');

-- ----------------------------
-- Table structure for edu_parameter
-- ----------------------------
DROP TABLE IF EXISTS `edu_parameter`;
CREATE TABLE `edu_parameter`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parameter_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `parameter_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `parameter_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_parameter
-- ----------------------------
INSERT INTO `edu_parameter` VALUES (1, 'library_name', '东馆', '东馆', 0, '2021-09-21 18:38:24');
INSERT INTO `edu_parameter` VALUES (2, 'library_name', '南馆', '南馆', 0, '2021-09-21 18:38:33');
INSERT INTO `edu_parameter` VALUES (3, 'book_type', '名著', '名著', 0, '2022-01-07 21:48:18');
INSERT INTO `edu_parameter` VALUES (4, 'book_type', '古典', '古典', 0, '2022-01-07 21:48:19');
INSERT INTO `edu_parameter` VALUES (5, 'book_type', '历史文献', '历史文献', 0, '2022-01-07 21:48:28');

SET FOREIGN_KEY_CHECKS = 1;
