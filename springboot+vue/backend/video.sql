/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : video

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 28/03/2022 18:58:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `a_id` bigint(22) NOT NULL AUTO_INCREMENT COMMENT '后台管理主键',
  `a_username` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员用户名',
  `a_password` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'toor');

-- ----------------------------
-- Table structure for t_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection`  (
  `collection_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NOT NULL,
  `video_id` bigint(11) NOT NULL,
  PRIMARY KEY (`collection_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_collection
-- ----------------------------
INSERT INTO `t_collection` VALUES (1, 1, 2);
INSERT INTO `t_collection` VALUES (2, 1, 3);
INSERT INTO `t_collection` VALUES (3, 1, 4);
INSERT INTO `t_collection` VALUES (4, 12, 4);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `video_id` bigint(11) NULL DEFAULT NULL,
  `comment_date` datetime(0) NULL DEFAULT NULL,
  `comment_info` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (109, 12, 4, '2022-03-23 21:30:56', 'haokan', NULL);
INSERT INTO `t_comment` VALUES (110, 12, 4, '2022-03-23 21:31:04', '确实好看', NULL);
INSERT INTO `t_comment` VALUES (111, 12, 4, '2022-03-23 21:35:40', '3344', NULL);
INSERT INTO `t_comment` VALUES (116, 12, 4, '2022-03-23 21:54:54', '22', NULL);
INSERT INTO `t_comment` VALUES (117, 12, 4, '2022-03-23 21:54:57', '333', 109);
INSERT INTO `t_comment` VALUES (118, 12, 4, '2022-03-23 21:55:02', '45方法', 109);
INSERT INTO `t_comment` VALUES (119, 12, 4, '2022-03-23 21:55:08', '融入', 109);
INSERT INTO `t_comment` VALUES (130, 12, 4, '2022-03-23 22:03:27', '问问', 109);
INSERT INTO `t_comment` VALUES (131, 12, 4, '2022-03-23 22:03:31', '222', 111);
INSERT INTO `t_comment` VALUES (132, 12, 4, '2022-03-23 22:03:33', '22', 116);
INSERT INTO `t_comment` VALUES (133, 12, 4, '2022-03-23 22:03:35', '33', 116);
INSERT INTO `t_comment` VALUES (134, 12, 4, '2022-03-23 22:03:37', '3334', 111);
INSERT INTO `t_comment` VALUES (135, 12, 4, '2022-03-23 22:03:43', '为', NULL);
INSERT INTO `t_comment` VALUES (136, 12, 4, '2022-03-23 22:03:44', '对方答复', NULL);
INSERT INTO `t_comment` VALUES (137, 12, 4, '2022-03-23 22:03:54', '时代大厦', 136);
INSERT INTO `t_comment` VALUES (138, 13, 30, '2022-03-28 16:12:24', '11', NULL);
INSERT INTO `t_comment` VALUES (139, 13, 30, '2022-03-28 16:12:26', '22', NULL);

-- ----------------------------
-- Table structure for t_commentedstar
-- ----------------------------
DROP TABLE IF EXISTS `t_commentedstar`;
CREATE TABLE `t_commentedstar`  (
  `commentedstar_id` bigint(22) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(22) NULL DEFAULT NULL,
  `video_id` bigint(22) NULL DEFAULT NULL,
  `star_num` bigint(22) NULL DEFAULT NULL,
  `comment_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`commentedstar_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_commentedstar
-- ----------------------------
INSERT INTO `t_commentedstar` VALUES (1, 1, 1, 3, '2021-04-30 19:39:23');
INSERT INTO `t_commentedstar` VALUES (2, 1, 4, 2, '2022-03-14 20:27:48');
INSERT INTO `t_commentedstar` VALUES (3, 12, 17, 3, '2022-03-17 15:11:14');
INSERT INTO `t_commentedstar` VALUES (4, 12, 4, 4, '2022-03-17 15:50:45');

-- ----------------------------
-- Table structure for t_focus
-- ----------------------------
DROP TABLE IF EXISTS `t_focus`;
CREATE TABLE `t_focus`  (
  `focus_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `focused_id` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`focus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_focus
-- ----------------------------
INSERT INTO `t_focus` VALUES (1, 1, 2);
INSERT INTO `t_focus` VALUES (2, 1, 3);
INSERT INTO `t_focus` VALUES (3, 1, 4);
INSERT INTO `t_focus` VALUES (4, 3, 1);
INSERT INTO `t_focus` VALUES (5, 12, 2);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `msg_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `msg_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_context` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg_send_date` datetime(0) NULL DEFAULT NULL,
  `msg_send_user_id` bigint(11) NULL DEFAULT NULL,
  `msg_receive_user_id` bigint(11) NULL DEFAULT NULL,
  `msg_state_id` bigint(11) NULL DEFAULT NULL,
  `msgtype_id` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, '点赞提醒', '你好! 你的视频《霸王别姬》的视频获得用户【请填入你的昵称】的一枚点赞', '2021-04-30 18:52:42', NULL, 1, 6, 3);
INSERT INTO `t_message` VALUES (2, '点赞提醒', '你好! 你的视频《霸王别姬》的视频获得用户【请填入你的昵称】的一枚点赞', '2021-04-30 18:58:40', NULL, 1, 6, 3);
INSERT INTO `t_message` VALUES (3, '收藏提醒', '你好！你的主题为《霸王别姬》的视频,被用户【yourname】的收藏', '2021-05-04 18:23:22', NULL, 1, 7, 5);
INSERT INTO `t_message` VALUES (4, '系统提醒', '你好！你的主题为《我不是药神》的视频因违反规定已被下架', '2021-05-24 13:12:00', NULL, 2, 6, 2);
INSERT INTO `t_message` VALUES (5, '系统提醒', '你好！你的主题为《我不是药神》的视频审核通过', '2021-05-25 15:27:07', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (6, '系统提醒', '你好！你的主题为《霸王别姬》的视频因违反规定已被下架', '2021-05-25 15:27:11', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (7, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 16:47:25', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (8, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:47:30', NULL, 1, 7, 2);
INSERT INTO `t_message` VALUES (9, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:48:35', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (10, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:49:08', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (11, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:52:09', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (12, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:53:13', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (13, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:53:15', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (14, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:53:16', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (15, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:53:16', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (16, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:53:16', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (17, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:53:17', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (18, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:53:17', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (19, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:54:29', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (20, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 16:59:35', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (21, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 17:01:49', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (22, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 17:01:53', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (23, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 17:05:32', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (24, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 17:05:36', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (25, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 17:07:05', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (26, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 17:07:09', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (27, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 17:33:47', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (28, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 17:33:50', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (29, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 17:40:38', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (30, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 17:40:42', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (31, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 17:43:01', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (32, '系统提醒', '你好！你的主题为《无间道》的视频审核失败', '2021-05-26 17:43:06', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (33, '系统提醒', '你好！你的主题为《无间道》的视频因违反规定已被下架', '2021-05-26 17:47:00', NULL, 1, 7, 2);
INSERT INTO `t_message` VALUES (35, 'Hello', 'Hello，你视频真好看', '2021-05-31 18:09:28', 1, 2, 6, 1);
INSERT INTO `t_message` VALUES (36, '你好', '我对你的视频很敢兴趣', '2021-06-02 14:09:29', 1, 1, 6, 1);
INSERT INTO `t_message` VALUES (37, '系统提醒', '你好！你的主题为《肖生克的救赎》的视频因违反规定已被下架', '2021-06-08 11:03:05', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (38, '系统提醒', '你好！你的主题为《肖生克的救赎》的视频审核失败', '2021-06-08 11:03:12', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (39, '点赞提醒', '你好! 你的视频《霸王别姬》的视频获得用户【yourname】的一枚点赞', '2021-06-08 14:05:15', NULL, 1, 6, NULL);
INSERT INTO `t_message` VALUES (40, '系统提醒', '你好！你的主题为《肖生克的救赎》的视频审核通过', '2021-06-08 14:20:07', NULL, 1, 6, 2);
INSERT INTO `t_message` VALUES (41, '点评提醒', '你好！你的主题为《你好,李焕英》的视频获得用户【请填入你的昵称】的2星点评', '2022-03-14 20:27:48', NULL, 2, 6, 4);
INSERT INTO `t_message` VALUES (42, '收藏提醒', '你好！你的主题为《你好,李焕英》的视频,被用户【jianqian】的收藏', '2022-03-14 20:28:14', NULL, 2, 6, 5);
INSERT INTO `t_message` VALUES (43, '点赞提醒', '你好! 你的视频《你好,李焕英》的视频获得用户【jianqian】的一枚点赞', '2022-03-14 20:28:15', NULL, 2, 6, NULL);
INSERT INTO `t_message` VALUES (44, '系统提醒', '你好！你的主题为《我让最想被拥抱的男人给威胁了》的视频已上架', '2022-03-17 15:03:54', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (45, '系统提醒', '你好！你的主题为《等级测试》的视频已上架', '2022-03-17 15:03:57', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (46, '系统提醒', '你好！你的主题为《你好,李焕英》的视频因违反规定已被下架', '2022-03-17 15:04:08', NULL, 2, 6, 2);
INSERT INTO `t_message` VALUES (47, '系统提醒', '你好！你的主题为《美食总动员》的视频因违反规定已被下架', '2022-03-17 15:04:09', NULL, 3, 6, 2);
INSERT INTO `t_message` VALUES (48, '系统提醒', '你好！你的主题为《等级测试》的视频因违反规定已被下架', '2022-03-17 15:04:11', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (49, '系统提醒', '你好！你的主题为《你好,李焕英》的视频已上架', '2022-03-17 15:04:16', NULL, 2, 6, 2);
INSERT INTO `t_message` VALUES (50, '系统提醒', '你好！你的主题为《美食总动员》的视频已上架', '2022-03-17 15:04:16', NULL, 3, 6, 2);
INSERT INTO `t_message` VALUES (51, '系统提醒', '你好！你的主题为《等级测试》的视频已上架', '2022-03-17 15:04:17', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (52, '系统提醒', '你好！你的主题为《等级测试》的视频因违反规定已被下架', '2022-03-17 15:04:43', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (53, '系统提醒', '你好！你的主题为《等级测试》的视频已上架', '2022-03-17 15:08:55', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (54, '点评提醒', '你好！你的主题为《我让最想被拥抱的男人给威胁了》的视频获得用户【张大炮1】的3星点评', '2022-03-17 15:11:14', NULL, 12, 6, 4);
INSERT INTO `t_message` VALUES (55, '点评提醒', '你好！你的主题为《你好,李焕英》的视频获得用户【请填入你的昵称】的4星点评', '2022-03-17 15:50:45', NULL, 2, 6, 4);
INSERT INTO `t_message` VALUES (56, '收藏提醒', '你好！你的主题为《你好,李焕英》的视频,被用户【张大炮1】的收藏', '2022-03-19 20:16:19', NULL, 2, 6, 5);
INSERT INTO `t_message` VALUES (57, '系统提醒', '你好！你的主题为《你好,李焕英》的视频因违反规定已被下架', '2022-03-23 12:07:37', NULL, 2, 6, 2);
INSERT INTO `t_message` VALUES (58, '系统提醒', '你好！你的主题为《你好,李焕英》的视频已上架', '2022-03-23 12:07:38', NULL, 2, 6, 2);
INSERT INTO `t_message` VALUES (59, '系统提醒', '你好！你的主题为《《镇魂街第二季 北落师门篇（上）》第一集 故人归来》的视频已上架', '2022-03-28 15:58:58', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (60, '系统提醒', '你好！你的主题为《【独家】《镇魂街第二季 北落师门篇（上）》第二集 慷慨悲歌》的视频已上架', '2022-03-28 15:59:32', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (61, '系统提醒', '你好！你的主题为《《镇魂街 第二季》第3集 鱼游釜中》的视频已上架', '2022-03-28 15:59:33', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (62, '系统提醒', '你好！你的主题为《我真的没用咩？第1集 Super Star【4月国创》的视频已上架', '2022-03-28 15:59:33', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (63, '系统提醒', '你好！你的主题为《我真的没用咩？第2集 吴大志的秘密【4月国创】》的视频已上架', '2022-03-28 15:59:34', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (64, '系统提醒', '你好！你的主题为《两不疑 第1集 帝后落水身体互换》的视频已上架', '2022-03-28 15:59:34', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (65, '系统提醒', '你好！你的主题为《两不疑 第2集 徐钰叹做皇帝好难》的视频已上架', '2022-03-28 15:59:36', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (66, '系统提醒', '你好！你的主题为《李林克的小馆儿 第1集 烤肋排时记得刷些蜂蜜》的视频已上架', '2022-03-28 15:59:37', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (67, '系统提醒', '你好！你的主题为《李林克的小馆儿 第2集 小鹿的雪菜带鱼》的视频已上架', '2022-03-28 15:59:37', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (68, '系统提醒', '你好！你的主题为《忧国的莫里亚蒂 第2部分 正式PV&番宣CM》的视频已上架', '2022-03-28 15:59:38', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (69, '系统提醒', '你好！你的主题为《风灵玉秀-夜探》的视频已上架', '2022-03-28 15:59:38', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (70, '系统提醒', '你好！你的主题为《长剑风云 第1集 灾变之后》的视频已上架', '2022-03-28 15:59:40', NULL, 12, 6, 2);
INSERT INTO `t_message` VALUES (71, '系统提醒', '你好！你的主题为《长剑风云 第2集 想开卡车》的视频已上架', '2022-03-28 15:59:40', NULL, 12, 6, 2);

-- ----------------------------
-- Table structure for t_msgtype
-- ----------------------------
DROP TABLE IF EXISTS `t_msgtype`;
CREATE TABLE `t_msgtype`  (
  `msgtype_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `msgtype_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`msgtype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_msgtype
-- ----------------------------
INSERT INTO `t_msgtype` VALUES (1, 'PrivateMsg');
INSERT INTO `t_msgtype` VALUES (2, 'SystemMsg');
INSERT INTO `t_msgtype` VALUES (3, 'SuportNotice');
INSERT INTO `t_msgtype` VALUES (4, 'EvaluateNotice');
INSERT INTO `t_msgtype` VALUES (5, 'CollectionNotice');

-- ----------------------------
-- Table structure for t_predict
-- ----------------------------
DROP TABLE IF EXISTS `t_predict`;
CREATE TABLE `t_predict`  (
  `pre_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `video_id` bigint(11) NULL DEFAULT NULL,
  `pre_star` float(255, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`pre_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_predict
-- ----------------------------
INSERT INTO `t_predict` VALUES (1, 1, 1, 2.58);
INSERT INTO `t_predict` VALUES (2, 1, 2, 4.00);
INSERT INTO `t_predict` VALUES (3, 1, 3, 2.34);
INSERT INTO `t_predict` VALUES (4, 1, 4, 0.88);
INSERT INTO `t_predict` VALUES (5, 1, 5, 3.44);
INSERT INTO `t_predict` VALUES (6, 1, 6, 2.68);
INSERT INTO `t_predict` VALUES (7, 1, 7, 3.03);
INSERT INTO `t_predict` VALUES (8, 1, 8, 3.22);
INSERT INTO `t_predict` VALUES (9, 1, 9, 3.80);
INSERT INTO `t_predict` VALUES (10, 1, 10, 2.21);
INSERT INTO `t_predict` VALUES (11, 1, 11, 1.20);
INSERT INTO `t_predict` VALUES (12, 1, 12, 1.40);

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record`  (
  `record_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `video_id` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_record
-- ----------------------------
INSERT INTO `t_record` VALUES (25, 12, 4);
INSERT INTO `t_record` VALUES (26, 12, 17);
INSERT INTO `t_record` VALUES (27, 12, 19);
INSERT INTO `t_record` VALUES (28, 13, 30);
INSERT INTO `t_record` VALUES (29, 13, 19);
INSERT INTO `t_record` VALUES (30, 13, 31);

-- ----------------------------
-- Table structure for t_state
-- ----------------------------
DROP TABLE IF EXISTS `t_state`;
CREATE TABLE `t_state`  (
  `state_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(22) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_state
-- ----------------------------
INSERT INTO `t_state` VALUES (1, '认证中');
INSERT INTO `t_state` VALUES (2, '已认证');
INSERT INTO `t_state` VALUES (3, '认证失败');
INSERT INTO `t_state` VALUES (4, '已上架');
INSERT INTO `t_state` VALUES (5, '已下架');
INSERT INTO `t_state` VALUES (6, '未读');
INSERT INTO `t_state` VALUES (7, '已读');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_age` int(11) NULL DEFAULT NULL,
  `user_sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `encrypted_problem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密保问题',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fan_num` int(11) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '粉丝数量',
  `user_tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `register_date` datetime(0) NULL DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state_id` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'jianqian', 11, '男', 'springboot', '123456', 00000000000, '15566666626', '2021-04-17 15:17:10', '/user/getIcon/icon1.jpg', 1, 0);
INSERT INTO `t_user` VALUES (2, '请填入你的昵称', 11, '女', '西游记', '123456', 00000000000, '15566663000', '2021-04-23 16:49:52', '/user/getIcon/icon2.png', 1, 2);
INSERT INTO `t_user` VALUES (3, '小周', 18, '女', '水浒传', '123456', 00000000000, '15566663001', '2021-04-24 16:32:18', '/user/getIcon/icon3.png', 2, 0);
INSERT INTO `t_user` VALUES (4, '小明', 18, '男', '红楼梦', '123456', 00000000000, '12234567891', '2021-05-28 23:47:29', '/user/getIcon/icon1.png', 2, 0);
INSERT INTO `t_user` VALUES (5, '小红', 22, '女', '活着', '123456', 00000000000, '15566661234', '2021-05-19 18:12:57', '/user/getIcon/icon1.jpg', 1, 0);
INSERT INTO `t_user` VALUES (8, '小艾', 13, '男', 'Java', '123456', 00000000000, '12345678915', '2021-05-28 23:52:58', NULL, 1, 0);
INSERT INTO `t_user` VALUES (9, '小台', 16, '女', 'C++', '123456', 00000000000, '12345678999', '2021-05-28 23:55:06', NULL, 1, 0);
INSERT INTO `t_user` VALUES (12, '张大炮1', 12, '男', '', '123456', 00000000000, '18800000000', '2022-03-17 10:29:06', '/user/getIcon/icon12.jpg', 1, 2);
INSERT INTO `t_user` VALUES (13, '利达', 18, '男', '', '123456', 00000000000, '17700000000', '2022-03-28 16:00:04', '/user/getIcon/icon13.jpg', 1, 2);

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video`  (
  `video_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `video_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `video_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `edit_date` datetime(0) NULL DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `thunmbnail_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `video_state_id` bigint(11) NULL DEFAULT NULL,
  `view_num` int(11) NULL DEFAULT NULL,
  `pp_num` int(11) NULL DEFAULT NULL,
  `video_type_id` bigint(11) NULL DEFAULT NULL,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES (9, '美食总动员', '小老鼠雷米在嗅觉方面有着无与伦比的天赋，不想过与垃圾堆为伴的生活，心怀成为五星大厨的梦想。', '2021-05-27 13:40:57', 'https://www.bilibili.com/video/BV1T44y1T7nc?share_source=copy_web', '/video/getVideoImage/video9.png', 4, 4, 0, 4, 3, 1);
INSERT INTO `t_video` VALUES (10, '音乐', '高中生健治有一天突发奇想，邀请伙伴太田和朝仓一起组乐队，但是三个人都对乐器一窍不通。他们的乐队是一把贝斯，再来一把贝斯，还有鼓，配置十分独特。当他们弹奏出第一个音符，立刻被一种前所未有的感觉淹没了，音乐震撼了他们。', '2021-05-27 13:46:55', '<iframe src=\"//player.bilibili.com/player.html?aid=979821126&bvid=BV1T44y1T7nc&cid=550342399&page=1\" scrolling=\"no\" border=\"0\" frameborder=\"no\" framespacing=\"0\" allowfullscreen=\"true\"> </iframe>', '/video/getVideoImage/video10.png', 4, 2, 0, 5, 3, 4);
INSERT INTO `t_video` VALUES (17, '我让最想被拥抱的男人给威胁了', '【2021年10月9日】剧场版动画《我让最想被拥抱的男人给威胁了。~西班牙篇~》上映决定PV', '2022-03-17 12:13:20', '/static/video/20220317142426.mp4', '/video/getVideoImage/cat.jpg', 4, 13, 0, 1, 12, 3);
INSERT INTO `t_video` VALUES (19, '你好,李焕英', '2001年的某一天，刚刚考上大学的贾晓玲（贾玲 饰）经历了人生中的一次大起大落。一心想要成为母亲骄傲的她却因母亲突遭严重意外，而悲痛万分。在贾晓玲情绪崩溃的状态下，竟意外的回到了1981年，并与年轻的母亲李焕英（张小斐 饰）相遇，二人形影不离，宛如闺蜜。与此同时，也结识了一群天真善良的好朋友。晓玲以为来到了这片“广阔天地”，她可以凭借自己超前的思维，让母亲“大有作为”，但结果却让晓玲感到意外......', '2021-04-28 19:04:55', '/static/video/nhlhy.mp4', '/video/getVideoImage/video4.png', 4, 961, 2, 1, 2, 1);
INSERT INTO `t_video` VALUES (20, '《镇魂街第二季 北落师门篇（上）》第一集 故人归来', '曹焱兵遇到北落师门，英雄相惜', '2022-03-28 15:45:00', '', '/video/getVideoImage/80840748_cover.jpg', 4, 0, 0, 1, 12, 0);
INSERT INTO `t_video` VALUES (21, '【独家】《镇魂街第二季 北落师门篇（上）》第二集 慷慨悲歌', '趁曹北大战，南御夫展开阴谋。', '2022-03-28 15:48:01', '', '/video/getVideoImage/290612332_cover.png', 4, 0, 0, 1, 12, 0);
INSERT INTO `t_video` VALUES (22, '《镇魂街 第二季》第3集 鱼游釜中', '水儿被抓，生死关头北落极限救援', '2022-03-28 15:48:30', '', '/video/getVideoImage/332548931_cover.jpg', 4, 0, 0, 1, 12, 0);
INSERT INTO `t_video` VALUES (23, '我真的没用咩？第1集 Super Star【4月国创', '第一集就出人命？玩这么大？', '2022-03-28 15:49:10', '', '/video/getVideoImage/887519056_cover.jpg', 4, 0, 0, 1, 12, 0);
INSERT INTO `t_video` VALUES (24, '我真的没用咩？第2集 吴大志的秘密【4月国创】', '朋友的秘密你别猜', '2022-03-28 15:49:37', '', '/video/getVideoImage/375211308_cover.jpg', 4, 0, 0, 3, 12, 0);
INSERT INTO `t_video` VALUES (25, '两不疑 第1集 帝后落水身体互换', '皇后徐钰错手和皇帝萧锦昀一起落水，醒来身体互换', '2022-03-28 15:50:47', '', '/video/getVideoImage/630175496_cover.jpg', 4, 0, 0, 3, 12, 0);
INSERT INTO `t_video` VALUES (26, '两不疑 第2集 徐钰叹做皇帝好难', '徐钰装皇帝上朝被群臣围攻，萧锦昀进后宫被太后刁难', '2022-03-28 15:51:24', '', '/video/getVideoImage/375360101_cover.jpg', 4, 0, 0, 3, 12, 0);
INSERT INTO `t_video` VALUES (27, '李林克的小馆儿 第1集 烤肋排时记得刷些蜂蜜', '老板的一天，从蜜汁烤肋排开始~', '2022-03-28 15:52:42', '', '/video/getVideoImage/760336431_cover.jpg', 4, 0, 0, 12, 12, 0);
INSERT INTO `t_video` VALUES (28, '李林克的小馆儿 第2集 小鹿的雪菜带鱼', '在李林克的开导下，小鹿摆正了心态面对父母。', '2022-03-28 15:53:04', '', '/video/getVideoImage/972134132_cover.jpg', 4, 0, 0, 12, 12, 0);
INSERT INTO `t_video` VALUES (29, '忧国的莫里亚蒂 第2部分 正式PV&番宣CM', '', '2022-03-28 15:54:36', '', '/video/getVideoImage/9483211_cover.jpg', 4, 0, 0, 6, 12, 0);
INSERT INTO `t_video` VALUES (30, '风灵玉秀-夜探', '江湖传言，飞贼风铃儿身边忽然多了一个神秘的白发少女，出手凌厉，不少黑道高手都在她手底下吃了亏。人们议论纷纷，这个少女究竟是谁，她一身武功又到底是从何而来，对于正道门派是福是祸。不过风铃儿和那白发少女—白钰袖倒并不在乎别人对她们的看法，依旧逍遥的游历江湖。殊不知一个巨大的阴谋正在她们背后酝酿...', '2022-03-28 15:55:17', '', '/video/getVideoImage/886335092_cover.jpg', 4, 2, 0, 2, 12, 0);
INSERT INTO `t_video` VALUES (31, '长剑风云 第1集 灾变之后', '开着卡车哼着歌，然后被陷害入狱了，就挺突然的', '2022-03-28 15:56:30', '', '/video/getVideoImage/246316520_cover.jpg', 4, 2, 0, 6, 12, 0);

-- ----------------------------
-- Table structure for t_videotype
-- ----------------------------
DROP TABLE IF EXISTS `t_videotype`;
CREATE TABLE `t_videotype`  (
  `videotype_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`videotype_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_videotype
-- ----------------------------
INSERT INTO `t_videotype` VALUES (1, '冒险');
INSERT INTO `t_videotype` VALUES (2, '战斗');
INSERT INTO `t_videotype` VALUES (3, '搞笑');
INSERT INTO `t_videotype` VALUES (4, '科幻');
INSERT INTO `t_videotype` VALUES (5, '校园');
INSERT INTO `t_videotype` VALUES (6, '悬疑');
INSERT INTO `t_videotype` VALUES (7, '竞技');
INSERT INTO `t_videotype` VALUES (8, '娱乐');
INSERT INTO `t_videotype` VALUES (9, '科技数码');
INSERT INTO `t_videotype` VALUES (10, '体育');
INSERT INTO `t_videotype` VALUES (12, '国漫');

-- ----------------------------
-- Table structure for t_vote
-- ----------------------------
DROP TABLE IF EXISTS `t_vote`;
CREATE TABLE `t_vote`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_vote
-- ----------------------------
INSERT INTO `t_vote` VALUES (1, '你最喜欢的漫画', '樱桃小丸子', '马丁的早晨', '哆啦A梦', '', '2022-03-24 05:53:03', '2022-03-22 12:43:27');
INSERT INTO `t_vote` VALUES (2, '222', 'a', 'b', 'c', 'd', '2022-03-24 05:53:03', '2022-03-22 12:43:27');

-- ----------------------------
-- Table structure for t_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `t_vote_log`;
CREATE TABLE `t_vote_log`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `vote_id` bigint(11) NULL DEFAULT NULL,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vote_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_vote_log
-- ----------------------------
INSERT INTO `t_vote_log` VALUES (45, 1, 12, 'B', '2022-03-22 20:26:50');
INSERT INTO `t_vote_log` VALUES (47, 2, 12, 'C', '2022-03-23 19:26:30');

SET FOREIGN_KEY_CHECKS = 1;
