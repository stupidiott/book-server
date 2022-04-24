/*
 Navicat Premium Data Transfer

 Source Server         : 花花
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : edu_book

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 24/04/2022 14:49:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_account
-- ----------------------------
DROP TABLE IF EXISTS `edu_account`;
CREATE TABLE `edu_account`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0：无效 1：有效',
  `account_type` tinyint(1) NULL DEFAULT 0 COMMENT '账号类型 1：管理端 2：班主任  3：校领导',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `debt` int(0) NULL DEFAULT NULL COMMENT '欠款',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_account
-- ----------------------------
INSERT INTO `edu_account` VALUES (1, 'Librarian', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2021-07-07 20:46:08', '2022-04-24 14:30:19', 0);
INSERT INTO `edu_account` VALUES (2, 'User', '6512bd43d9caa6e02c990b0a82652dca', 1, 4, '2022-04-12 23:59:00', '2022-04-22 22:32:23', 0);
INSERT INTO `edu_account` VALUES (8, 'User2', 'b6d767d2f8ed5d21a44b0e5886680cb9', 0, 4, '2022-04-13 19:22:18', '2022-04-13 23:57:56', 0);
INSERT INTO `edu_account` VALUES (9, 'test', '202cb962ac59075b964b07152d234b70', 1, 4, '2022-04-14 09:20:14', '2022-04-14 09:20:37', 0);
INSERT INTO `edu_account` VALUES (10, '123', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '2022-04-19 01:10:53', '2022-04-19 01:11:02', 0);
INSERT INTO `edu_account` VALUES (11, 'hua', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, '2022-04-23 00:53:36', '2022-04-24 14:35:50', 0);
INSERT INTO `edu_account` VALUES (12, 'huahua', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, '2022-04-24 10:41:57', '2022-04-24 14:40:26', 1);

-- ----------------------------
-- Table structure for edu_account_login
-- ----------------------------
DROP TABLE IF EXISTS `edu_account_login`;
CREATE TABLE `edu_account_login`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录token',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '用户信息表',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 337 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号登录表' ROW_FORMAT = Dynamic;

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
INSERT INTO `edu_account_login` VALUES (323, '1650277229869', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1649898993000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-18 18:20:30');
INSERT INTO `edu_account_login` VALUES (324, '1650283722478', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"id\":2,\"lastLoginTime\":1649898306000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-18 20:08:42');
INSERT INTO `edu_account_login` VALUES (325, '1650300848736', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650277230000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-19 00:54:09');
INSERT INTO `edu_account_login` VALUES (326, '1650301862266', '123', '{\"accountType\":1,\"createTime\":1650301853000,\"id\":10,\"lastLoginTime\":1650301853000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"123\"}', '2022-04-19 01:11:02');
INSERT INTO `edu_account_login` VALUES (327, '1650301896914', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650300849000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-19 01:11:37');
INSERT INTO `edu_account_login` VALUES (328, '1650302201582', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"id\":2,\"lastLoginTime\":1650283722000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-19 01:16:42');
INSERT INTO `edu_account_login` VALUES (329, '1650305253234', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650301897000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-19 02:07:33');
INSERT INTO `edu_account_login` VALUES (330, '1650637942848', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"id\":2,\"lastLoginTime\":1650302202000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-22 22:32:23');
INSERT INTO `edu_account_login` VALUES (331, '1650646073115', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650305253000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-23 00:47:53');
INSERT INTO `edu_account_login` VALUES (332, '1650646393182', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650646073000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-23 00:53:13');
INSERT INTO `edu_account_login` VALUES (333, '1650646426635', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"id\":11,\"lastLoginTime\":1650646416000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-23 00:53:47');
INSERT INTO `edu_account_login` VALUES (334, '1650711910496', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650646393000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-23 19:05:11');
INSERT INTO `edu_account_login` VALUES (335, '1650712778011', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"id\":11,\"lastLoginTime\":1650646427000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-23 19:19:38');
INSERT INTO `edu_account_login` VALUES (336, '1650712876351', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"id\":11,\"lastLoginTime\":1650712778000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-23 19:21:16');
INSERT INTO `edu_account_login` VALUES (337, '1650713551441', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650711911000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-23 19:32:31');
INSERT INTO `edu_account_login` VALUES (338, '1650731397078', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"id\":11,\"lastLoginTime\":1650712876000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-24 00:29:57');
INSERT INTO `edu_account_login` VALUES (339, '1650731626425', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650713551000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-24 00:33:46');
INSERT INTO `edu_account_login` VALUES (340, '1650731722619', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"id\":11,\"lastLoginTime\":1650731397000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-24 00:35:23');
INSERT INTO `edu_account_login` VALUES (341, '1650732151024', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650731626000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-24 00:42:31');
INSERT INTO `edu_account_login` VALUES (342, '1650734781577', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"id\":11,\"lastLoginTime\":1650731723000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-24 01:26:22');
INSERT INTO `edu_account_login` VALUES (343, '1650766186193', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"id\":1,\"lastLoginTime\":1650732151000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-24 10:09:46');
INSERT INTO `edu_account_login` VALUES (344, '1650769098790', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":1,\"id\":12,\"lastLoginTime\":1650768117000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-24 10:58:19');
INSERT INTO `edu_account_login` VALUES (345, '1650774716732', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"debt\":0,\"id\":11,\"lastLoginTime\":1650734782000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-24 12:31:57');
INSERT INTO `edu_account_login` VALUES (346, '1650781367175', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1650766186000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-24 14:22:47');
INSERT INTO `edu_account_login` VALUES (347, '1650781503130', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"debt\":0,\"id\":11,\"lastLoginTime\":1650774717000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-24 14:25:03');
INSERT INTO `edu_account_login` VALUES (348, '1650781617222', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1650781367000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-24 14:26:57');
INSERT INTO `edu_account_login` VALUES (349, '1650781652733', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"debt\":0,\"id\":11,\"lastLoginTime\":1650781503000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-24 14:27:33');
INSERT INTO `edu_account_login` VALUES (350, '1650781741394', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":1,\"id\":12,\"lastLoginTime\":1650769099000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-24 14:29:01');
INSERT INTO `edu_account_login` VALUES (351, '1650781819269', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1650781617000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-24 14:30:19');
INSERT INTO `edu_account_login` VALUES (352, '1650782150270', 'hua', '{\"accountType\":4,\"createTime\":1650646416000,\"debt\":0,\"id\":11,\"lastLoginTime\":1650781653000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"hua\"}', '2022-04-24 14:35:50');
INSERT INTO `edu_account_login` VALUES (353, '1650782425660', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":1,\"id\":12,\"lastLoginTime\":1650781741000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-24 14:40:26');

-- ----------------------------
-- Table structure for edu_account_menu
-- ----------------------------
DROP TABLE IF EXISTS `edu_account_menu`;
CREATE TABLE `edu_account_menu`  (
  `account_type` tinyint(0) UNSIGNED NOT NULL COMMENT '账户类型 1：管理端 2：普通账户',
  `menu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单',
  PRIMARY KEY (`account_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_account_menu
-- ----------------------------
INSERT INTO `edu_account_menu` VALUES (1, '[\r\n    {\r\n      \"id\":1000,\r\n      \"name\":\"BOOK\",\r\n      \"iconClass\":\"el-icon-tickets\",\r\n      \"children\":[\r\n        {\r\n          \"id\": 100001,\r\n          \"name\": \"Book List\",\r\n          \"path\": \"/books\"\r\n        },\r\n	{\r\n          \"id\": 100004,\r\n          \"name\": \"History\",\r\n          \"path\": \"/borrowBookHistory\"\r\n        },\r\n              {\r\n          \"id\": 100003,\r\n          \"name\": \"Borrow List\",\r\n          \"path\": \"/borrowBookList\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n      \"id\":2000,\r\n      \"name\":\"ACCOUNT\",\r\n      \"iconClass\":\"el-icon-s-check\",\r\n      \"children\":[\r\n        {\r\n          \"id\":200001,\r\n          \"name\":\"Account List\",\r\n          \"path\":\"/accounts\"\r\n        }\r\n      ]\r\n    }\r\n  ]');
INSERT INTO `edu_account_menu` VALUES (4, '[\r\n    {\r\n      \"id\":1000,\r\n      \"name\":\"BOOK\",\r\n      \"iconClass\":\"el-icon-tickets\",\r\n      \"children\":[\r\n        {\r\n          \"id\": 100001,\r\n          \"name\": \"Book List\",\r\n          \"path\": \"/books\"\r\n        },\r\n	{\r\n          \"id\": 100002,\r\n          \"name\": \"Borrow Book\",\r\n          \"path\": \"/borrowBook\"\r\n        },\r\n	{\r\n          \"id\": 100003,\r\n          \"name\": \"Borrow List\",\r\n          \"path\": \"/borrowBookList\"\r\n        }\r\n      ]\r\n    }\r\n  ]');

-- ----------------------------
-- Table structure for edu_book
-- ----------------------------
DROP TABLE IF EXISTS `edu_book`;
CREATE TABLE `edu_book`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `book_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书编号',
  `book_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书名称',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `library` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书管',
  `floor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层\r\n',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `publisher` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `status` int(0) NULL DEFAULT NULL COMMENT '状态：0：未借出 1：已借出',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书描述',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `address` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_book_no`(`book_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_book
-- ----------------------------
INSERT INTO `edu_book` VALUES (1, '10001', '水浒传', '施耐庵', 'A区', '1F', '历史文献', '中国人民大学出版社', 5, '这是一本好书2,这是一本好书2,这是一本好书2,这是一本好书2,', 0, '2021-12-26 21:54:37', 111);
INSERT INTO `edu_book` VALUES (2, '10002', '西游记', '罗贯中', 'D区', '2F', '名著', '北京大学出版社', 5, '古典名著', 0, '2022-01-07 22:17:45', 222);
INSERT INTO `edu_book` VALUES (3, '10003', '三国演义', '罗贯中', 'B区', '3F', '名著', '清华大学出版社', 1, '好啊好啊！', 0, '2022-01-12 18:38:33', 333);
INSERT INTO `edu_book` VALUES (7, '10008', 'Java', '11', 'C区', '1F', '名著', '11', 1, 'Java ', 0, '2022-04-14 09:19:05', 444);
INSERT INTO `edu_book` VALUES (15, '11', '1', '11', 'A区', '1F', '古典', '11', 1, '111', 0, '2022-04-22 21:30:45', 112);
INSERT INTO `edu_book` VALUES (16, '1111', '3', '3', 'B区', '2F', '名著', '212', 22, '321', 0, '2022-04-22 21:33:36', 3);
INSERT INTO `edu_book` VALUES (17, '999', '999', '999', 'B区', '1F', '名著', '99', 97, '99', 0, '2022-04-22 21:52:06', 99);

-- ----------------------------
-- Table structure for edu_borrow_book
-- ----------------------------
DROP TABLE IF EXISTS `edu_borrow_book`;
CREATE TABLE `edu_borrow_book`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `book_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书编号',
  `borrow_identity_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '借书人身份证号',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '借书时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志：0：未删除 1：已删除',
  `return_time` datetime(0) NULL DEFAULT NULL COMMENT '还书时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借书信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_borrow_book
-- ----------------------------
INSERT INTO `edu_borrow_book` VALUES (79, '999', 'hua', '2022-04-24 00:00:00', '2022-05-04 00:00:00', '2022-04-24 14:26:48', 1, '2022-04-24 14:27:03');
INSERT INTO `edu_borrow_book` VALUES (80, '999', 'hua', '2022-04-24 00:00:00', '2022-05-04 00:00:00', '2022-04-24 14:35:58', 0, NULL);
INSERT INTO `edu_borrow_book` VALUES (81, '10003', 'hua', '2022-04-24 00:00:00', '2022-05-04 00:00:00', '2022-04-24 14:36:18', 0, NULL);

-- ----------------------------
-- Table structure for edu_parameter
-- ----------------------------
DROP TABLE IF EXISTS `edu_parameter`;
CREATE TABLE `edu_parameter`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parameter_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数类型',
  `parameter_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数名',
  `parameter_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of edu_parameter
-- ----------------------------
INSERT INTO `edu_parameter` VALUES (1, 'library_name', 'A区', 'A区', 0, '2021-09-21 18:38:24');
INSERT INTO `edu_parameter` VALUES (2, 'library_name', 'B区', 'B区', 0, '2021-09-21 18:38:33');
INSERT INTO `edu_parameter` VALUES (3, 'book_type', '名著', '名著', 0, '2022-01-07 21:48:18');
INSERT INTO `edu_parameter` VALUES (4, 'book_type', '古典', '古典', 0, '2022-01-07 21:48:19');
INSERT INTO `edu_parameter` VALUES (5, 'book_type', '历史文献', '历史文献', 0, '2022-01-07 21:48:28');
INSERT INTO `edu_parameter` VALUES (6, 'floor_num', '1F', '1F', 0, '2022-04-22 19:48:05');
INSERT INTO `edu_parameter` VALUES (7, 'floor_num', '2F', '2F', 0, '2022-04-22 19:48:16');
INSERT INTO `edu_parameter` VALUES (8, 'floor_num', '3F', '3F', 0, '2022-04-22 19:48:35');
INSERT INTO `edu_parameter` VALUES (9, 'library_name', 'C区', 'C区', 0, '2021-09-21 18:38:33');
INSERT INTO `edu_parameter` VALUES (10, 'library_name', 'D区', 'D区', 0, '2021-09-21 18:38:33');

SET FOREIGN_KEY_CHECKS = 1;
