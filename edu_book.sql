/*
 Navicat Premium Data Transfer

 Source Server         : yinan
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : edu_book

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 23/05/2022 16:27:34
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
  `debt` int NULL DEFAULT NULL COMMENT '欠款',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_account
-- ----------------------------
INSERT INTO `edu_account` VALUES (1, 'Librarian', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2021-07-07 20:46:08', '2022-05-23 16:16:01', 0, NULL);
INSERT INTO `edu_account` VALUES (2, 'User', '6512bd43d9caa6e02c990b0a82652dca', 1, 4, '2022-04-12 23:59:00', '2022-05-07 22:44:16', 0, NULL);
INSERT INTO `edu_account` VALUES (8, 'User2', 'b6d767d2f8ed5d21a44b0e5886680cb9', 0, 4, '2022-04-13 19:22:18', '2022-04-13 23:57:56', 0, NULL);
INSERT INTO `edu_account` VALUES (9, 'test', '202cb962ac59075b964b07152d234b70', 1, 4, '2022-04-14 09:20:14', '2022-04-14 09:20:37', 0, NULL);
INSERT INTO `edu_account` VALUES (10, '123', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '2022-04-19 01:10:53', '2022-04-26 23:59:20', 0, NULL);
INSERT INTO `edu_account` VALUES (11, 'hua', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, '2022-04-23 00:53:36', '2022-04-27 00:27:18', 0, NULL);
INSERT INTO `edu_account` VALUES (12, 'huahua', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, '2022-04-24 10:41:57', '2022-04-30 18:14:28', 0, NULL);
INSERT INTO `edu_account` VALUES (13, 'wyn', 'e10adc3949ba59abbe56e057f20f883e', 1, 4, '2022-05-22 15:43:02', '2022-05-23 16:18:25', 0, '1234@qq.com');

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
) ENGINE = InnoDB AUTO_INCREMENT = 409 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号登录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_account_login
-- ----------------------------
INSERT INTO `edu_account_login` VALUES (370, '1650999032598', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1650995068000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-27 02:50:33');
INSERT INTO `edu_account_login` VALUES (371, '1650999680832', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":1,\"id\":12,\"lastLoginTime\":1650994989000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-27 03:01:21');
INSERT INTO `edu_account_login` VALUES (372, '1650999752447', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1650995077000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-27 03:02:32');
INSERT INTO `edu_account_login` VALUES (373, '1651000000895', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":0,\"id\":12,\"lastLoginTime\":1650999681000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-27 03:06:41');
INSERT INTO `edu_account_login` VALUES (374, '1651000192306', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1650999752000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-27 03:09:52');
INSERT INTO `edu_account_login` VALUES (375, '1651000642832', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":1,\"id\":12,\"lastLoginTime\":1651000001000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-27 03:17:23');
INSERT INTO `edu_account_login` VALUES (376, '1651000847537', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":3,\"id\":2,\"lastLoginTime\":1651000192000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-27 03:20:48');
INSERT INTO `edu_account_login` VALUES (377, '1651312920298', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1650999033000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-30 18:02:00');
INSERT INTO `edu_account_login` VALUES (378, '1651313417361', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651312920000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-30 18:10:17');
INSERT INTO `edu_account_login` VALUES (379, '1651313487141', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":0,\"id\":12,\"lastLoginTime\":1651000643000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-30 18:11:27');
INSERT INTO `edu_account_login` VALUES (380, '1651313530301', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":10,\"id\":2,\"lastLoginTime\":1651000848000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-30 18:12:10');
INSERT INTO `edu_account_login` VALUES (381, '1651313616630', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":0,\"id\":12,\"lastLoginTime\":1651313487000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-30 18:13:37');
INSERT INTO `edu_account_login` VALUES (382, '1651313667752', 'huahua', '{\"accountType\":4,\"createTime\":1650768117000,\"debt\":0,\"id\":12,\"lastLoginTime\":1651313617000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"huahua\"}', '2022-04-30 18:14:28');
INSERT INTO `edu_account_login` VALUES (383, '1651319236628', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651313417000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-04-30 19:47:17');
INSERT INTO `edu_account_login` VALUES (384, '1651319931819', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651313530000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-04-30 19:58:52');
INSERT INTO `edu_account_login` VALUES (385, '1651843405826', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651319237000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-06 21:23:26');
INSERT INTO `edu_account_login` VALUES (386, '1651849488582', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651843406000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-06 23:04:49');
INSERT INTO `edu_account_login` VALUES (387, '1651849819717', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651849489000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-06 23:10:20');
INSERT INTO `edu_account_login` VALUES (388, '1651854930666', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651849820000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 00:35:31');
INSERT INTO `edu_account_login` VALUES (389, '1651923958960', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651319932000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 19:45:59');
INSERT INTO `edu_account_login` VALUES (390, '1651929059808', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651854931000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 21:11:00');
INSERT INTO `edu_account_login` VALUES (391, '1651929626282', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651923959000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 21:20:26');
INSERT INTO `edu_account_login` VALUES (392, '1651931787527', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651929060000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 21:56:28');
INSERT INTO `edu_account_login` VALUES (393, '1651932967094', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651929626000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 22:16:07');
INSERT INTO `edu_account_login` VALUES (394, '1651932979927', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651931788000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 22:16:20');
INSERT INTO `edu_account_login` VALUES (395, '1651933038269', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651932967000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 22:17:18');
INSERT INTO `edu_account_login` VALUES (396, '1651933961569', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651932980000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 22:32:42');
INSERT INTO `edu_account_login` VALUES (397, '1651934299432', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651933038000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 22:38:19');
INSERT INTO `edu_account_login` VALUES (398, '1651934332332', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651933962000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 22:38:52');
INSERT INTO `edu_account_login` VALUES (399, '1651934461701', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651934299000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 22:41:02');
INSERT INTO `edu_account_login` VALUES (400, '1651934485392', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651934332000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 22:41:25');
INSERT INTO `edu_account_login` VALUES (401, '1651934621844', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651934462000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 22:43:42');
INSERT INTO `edu_account_login` VALUES (402, '1651934655629', 'User', '{\"accountType\":4,\"createTime\":1649779140000,\"debt\":0,\"id\":2,\"lastLoginTime\":1651934622000,\"password\":\"6512bd43d9caa6e02c990b0a82652dca\",\"status\":1,\"username\":\"User\"}', '2022-05-07 22:44:16');
INSERT INTO `edu_account_login` VALUES (403, '1651934681891', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651934485000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-07 22:44:42');
INSERT INTO `edu_account_login` VALUES (404, '1653205345077', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1651934682000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-22 15:42:25');
INSERT INTO `edu_account_login` VALUES (405, '1653205409835', 'wyn', '{\"accountType\":4,\"createTime\":1653205382000,\"debt\":0,\"email\":\"123@qq.com\",\"id\":13,\"lastLoginTime\":1653205382000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"wyn\"}', '2022-05-22 15:43:30');
INSERT INTO `edu_account_login` VALUES (406, '1653212328157', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1653205345000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-22 17:38:48');
INSERT INTO `edu_account_login` VALUES (407, '1653212369127', 'wyn', '{\"accountType\":4,\"createTime\":1653205382000,\"debt\":0,\"email\":\"123@qq.com\",\"id\":13,\"lastLoginTime\":1653205410000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"wyn\"}', '2022-05-22 17:39:29');
INSERT INTO `edu_account_login` VALUES (408, '1653212451938', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1653212328000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-22 17:40:52');
INSERT INTO `edu_account_login` VALUES (409, '1653212466026', 'wyn', '{\"accountType\":4,\"createTime\":1653205382000,\"debt\":0,\"email\":\"123@qq.com\",\"id\":13,\"lastLoginTime\":1653212369000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"wyn\"}', '2022-05-22 17:41:06');
INSERT INTO `edu_account_login` VALUES (410, '1653293513538', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1653212452000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-23 16:11:54');
INSERT INTO `edu_account_login` VALUES (411, '1653293761161', 'Librarian', '{\"accountType\":1,\"createTime\":1625661968000,\"debt\":0,\"id\":1,\"lastLoginTime\":1653293514000,\"password\":\"21232f297a57a5a743894a0e4a801fc3\",\"status\":1,\"username\":\"Librarian\"}', '2022-05-23 16:16:01');
INSERT INTO `edu_account_login` VALUES (412, '1653293905358', 'wyn', '{\"accountType\":4,\"createTime\":1653205382000,\"debt\":0,\"email\":\"123@qq.com\",\"id\":13,\"lastLoginTime\":1653212466000,\"password\":\"e10adc3949ba59abbe56e057f20f883e\",\"status\":1,\"username\":\"wyn\"}', '2022-05-23 16:18:25');

-- ----------------------------
-- Table structure for edu_account_menu
-- ----------------------------
DROP TABLE IF EXISTS `edu_account_menu`;
CREATE TABLE `edu_account_menu`  (
  `account_type` tinyint UNSIGNED NOT NULL COMMENT '账户类型 1：管理端 2：普通账户',
  `menu` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '菜单',
  PRIMARY KEY (`account_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账号表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_account_menu
-- ----------------------------
INSERT INTO `edu_account_menu` VALUES (1, '[\r\n    {\r\n      \"id\":1000,\r\n      \"name\":\"BOOK\",\r\n      \"iconClass\":\"el-icon-tickets\",\r\n      \"children\":[\r\n        {\r\n          \"id\": 100001,\r\n          \"name\": \"Book List\",\r\n          \"path\": \"/books\"\r\n        },\r\n	{\r\n          \"id\": 100004,\r\n          \"name\": \"History\",\r\n          \"path\": \"/borrowBookHistory\"\r\n        },\r\n              {\r\n          \"id\": 100003,\r\n          \"name\": \"Borrow List\",\r\n          \"path\": \"/borrowBookList\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n      \"id\":2000,\r\n      \"name\":\"ACCOUNT\",\r\n      \"iconClass\":\"el-icon-s-check\",\r\n      \"children\":[\r\n        {\r\n          \"id\":200001,\r\n          \"name\":\"Account List\",\r\n          \"path\":\"/accounts\"\r\n        }\r\n      ]\r\n    },\r\n{\r\n        \"id\":3000,\r\n        \"name\":\"DASHBOARD\",\r\n        \"iconClass\":\"el-icon-menu\",\r\n        \"children\":[\r\n        {\r\n          \"id\":300001,\r\n          \"name\":\" Library Dashboard\",\r\n          \"path\":\"/libraryDashboard\"\r\n        }\r\n      ]\r\n    }\r\n  ]');
INSERT INTO `edu_account_menu` VALUES (4, '[\r\n    {\r\n      \"id\":1000,\r\n      \"name\":\"BOOK\",\r\n      \"iconClass\":\"el-icon-tickets\",\r\n      \"children\":[\r\n        {\r\n          \"id\": 100001,\r\n          \"name\": \"Book List\",\r\n          \"path\": \"/books\"\r\n        },\r\n	    {\r\n          \"id\": 100002,\r\n          \"name\": \"Borrow Book\",\r\n          \"path\": \"/borrowBook\"\r\n        },\r\n	    {\r\n          \"id\": 100003,\r\n          \"name\": \"Borrow List\",\r\n          \"path\": \"/borrowBookList\"\r\n        }\r\n      ]\r\n    },\r\n    {\r\n        \"id\":2000,\r\n        \"name\":\"DASHBOARD\",\r\n        \"iconClass\":\"el-icon-menu\",\r\n        \"children\":[\r\n        {\r\n          \"id\":200001,\r\n          \"name\":\" Book Dashboard\",\r\n          \"path\":\"/bookDashboard\"\r\n        }\r\n      ]\r\n    }\r\n  ]');

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
  `floor` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '楼层\r\n',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `publisher` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `status` int NULL DEFAULT NULL COMMENT '状态：0：未借出 1：已借出',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图书描述',
  `delete_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志 0：未删除 1：已删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `address` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图书表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_book
-- ----------------------------
INSERT INTO `edu_book` VALUES (34, '9780451159274', 'IT', 'Stephen King', 'B区', '2F', '名著', 'New American Library', 5, 'Derry: A small city in Maine, place as hauntingly familiar as your own hometown, only in Derry the haunting is real...\r\n\r\nThey were seven teenagers when they first stumbled upon the horror. Now they are grown-up men and women who have gone out into the big world to gain success and happiness. But none of them can withstand the force that has drawn them back to Derry to face the nightmare without an end, and the evil without a name...\r\n--back cover', 0, '2022-05-07 21:14:25', 5);
INSERT INTO `edu_book` VALUES (35, '9780450032202', 'The Shining', 'Stephen King', 'A区', '1F', '古典', 'New English Library', 10, NULL, 0, '2022-05-07 21:16:16', 11);

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
  `kind` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借书信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_borrow_book
-- ----------------------------
INSERT INTO `edu_borrow_book` VALUES (100, '9780450032202', 'User', '2022-05-07 22:43:50', '2022-05-17 22:43:50', '2022-05-07 22:43:51', 1, '2022-05-07 22:45:05', 0);
INSERT INTO `edu_borrow_book` VALUES (101, '9780451159274', 'User', '2022-05-07 22:43:55', '2022-05-17 22:43:55', '2022-05-07 22:43:56', 1, '2022-05-07 22:44:51', 0);
INSERT INTO `edu_borrow_book` VALUES (102, '9780450032202', 'wyn', '2022-05-22 15:43:40', '2022-05-22 19:43:40', '2022-05-22 15:43:40', 1, '2022-05-22 16:03:41', 1);
INSERT INTO `edu_borrow_book` VALUES (103, '9780451159274', 'wyn', '2022-05-22 15:43:52', '2022-05-22 19:43:52', '2022-05-22 15:43:53', 1, '2022-05-22 16:03:41', 1);
INSERT INTO `edu_borrow_book` VALUES (104, '9780450032202', 'wyn', '2022-05-22 16:03:40', '2022-06-01 16:03:40', '2022-05-22 16:03:41', 1, '2022-05-22 17:38:56', 0);
INSERT INTO `edu_borrow_book` VALUES (105, '9780450032202', 'wyn', '2022-05-22 16:03:40', '2022-06-01 16:03:40', '2022-05-22 16:03:41', 1, '2022-05-22 17:38:54', 0);
INSERT INTO `edu_borrow_book` VALUES (106, '9780450032202', 'wyn', '2022-05-22 17:39:44', '2022-05-22 21:39:44', '2022-05-22 17:39:45', 1, '2022-05-22 17:39:57', 1);
INSERT INTO `edu_borrow_book` VALUES (107, '9780451159274', 'wyn', '2022-05-22 17:39:49', '2022-05-22 21:39:49', '2022-05-22 17:39:50', 1, '2022-05-22 17:39:57', 1);
INSERT INTO `edu_borrow_book` VALUES (108, '9780450032202', 'wyn', '2022-05-22 17:39:56', '2022-06-01 17:39:56', '2022-05-22 17:39:57', 1, '2022-05-23 16:12:31', 0);
INSERT INTO `edu_borrow_book` VALUES (109, '9780450032202', 'wyn', '2022-05-22 17:39:56', '2022-06-01 17:39:56', '2022-05-22 17:39:57', 1, '2022-05-23 16:12:29', 0);

-- ----------------------------
-- Table structure for edu_copy
-- ----------------------------
DROP TABLE IF EXISTS `edu_copy`;
CREATE TABLE `edu_copy`  (
  `book_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `book_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_copy
-- ----------------------------
INSERT INTO `edu_copy` VALUES ('97804500322021', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('978045003220210', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322022', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322023', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322024', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322025', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322026', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322027', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322028', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804500322029', '9780450032202', '0', '');
INSERT INTO `edu_copy` VALUES ('97804511592741', '9780451159274', '0', '');
INSERT INTO `edu_copy` VALUES ('97804511592742', '9780451159274', '0', '');
INSERT INTO `edu_copy` VALUES ('97804511592743', '9780451159274', '0', '');
INSERT INTO `edu_copy` VALUES ('97804511592744', '9780451159274', '0', '');
INSERT INTO `edu_copy` VALUES ('97804511592745', '9780451159274', '0', '');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `edu_parameter` VALUES (11, 'library_name', '11111', '11111', 0, '2022-05-23 16:12:49');
INSERT INTO `edu_parameter` VALUES (12, 'book_type', 'wer', 'wer', 0, '2022-05-23 16:13:32');

SET FOREIGN_KEY_CHECKS = 1;
