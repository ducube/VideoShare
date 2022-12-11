/*
Navicat MySQL Data Transfer

Source Server         : zybstart
Source Server Version : 80030
Source Host           : localhost:3306
Source Database       : deginvideo01

Target Server Type    : MYSQL
Target Server Version : 80030
File Encoding         : 65001

Date: 2022-09-26 23:28:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `a_id` bigint NOT NULL AUTO_INCREMENT COMMENT '后台管理主键',
  `a_username` varchar(22) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '管理员用户名',
  `a_password` varchar(22) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'toor');

-- ----------------------------
-- Table structure for t_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection` (
  `collection_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `video_id` bigint NOT NULL,
  PRIMARY KEY (`collection_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_collection
-- ----------------------------
INSERT INTO `t_collection` VALUES ('1', '1', '2');
INSERT INTO `t_collection` VALUES ('2', '1', '3');
INSERT INTO `t_collection` VALUES ('3', '1', '4');
INSERT INTO `t_collection` VALUES ('4', '12', '4');
INSERT INTO `t_collection` VALUES ('5', '1', '9');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `video_id` bigint DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  `comment_info` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('141', '1', '30', '2022-09-23 22:08:02', 'sdadas', null);
INSERT INTO `t_comment` VALUES ('142', '1', '29', '2022-09-26 13:52:18', 'sd as', null);
INSERT INTO `t_comment` VALUES ('143', '1', '29', '2022-09-26 13:53:24', 'sdasd ', '142');
INSERT INTO `t_comment` VALUES ('144', '1', '29', '2022-09-26 13:53:29', 'dada ', '142');
INSERT INTO `t_comment` VALUES ('145', '1', '29', '2022-09-26 14:11:23', 'gggg  das ', null);
INSERT INTO `t_comment` VALUES ('146', '1', '30', '2022-09-26 14:12:50', '真好看', null);
INSERT INTO `t_comment` VALUES ('147', '1', '26', '2022-09-26 14:15:46', '防擦撒打发', null);
INSERT INTO `t_comment` VALUES ('148', '1', '26', '2022-09-26 14:15:59', '反反复复烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦反反复复烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦烦方法', null);
INSERT INTO `t_comment` VALUES ('149', '1', '26', '2022-09-26 14:16:18', '可爱捏', '148');
INSERT INTO `t_comment` VALUES ('150', '1', '30', '2022-09-26 14:23:30', 'dasdas', '139');
INSERT INTO `t_comment` VALUES ('151', '1', '29', '2022-09-26 14:29:45', '很好看', null);
INSERT INTO `t_comment` VALUES ('152', '1', '29', '2022-09-26 14:29:58', '你说的对', '151');
INSERT INTO `t_comment` VALUES ('153', '1', '30', '2022-09-26 14:32:23', '发放', null);
INSERT INTO `t_comment` VALUES ('154', '14', '34', '2022-09-26 15:42:16', '只因门第一', null);
INSERT INTO `t_comment` VALUES ('155', '14', '34', '2022-09-26 15:42:54', '嘛时候成为只因门第一？', null);
INSERT INTO `t_comment` VALUES ('156', '14', '34', '2022-09-26 15:43:05', '就在今天，就在今天', '155');
INSERT INTO `t_comment` VALUES ('157', '15', '37', '2022-09-26 16:30:57', '可以的', null);
INSERT INTO `t_comment` VALUES ('158', '17', '40', '2022-09-26 18:38:24', 'dna到动了', null);

-- ----------------------------
-- Table structure for t_commentedstar
-- ----------------------------
DROP TABLE IF EXISTS `t_commentedstar`;
CREATE TABLE `t_commentedstar` (
  `commentedstar_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `video_id` bigint DEFAULT NULL,
  `star_num` bigint DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`commentedstar_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_commentedstar
-- ----------------------------
INSERT INTO `t_commentedstar` VALUES ('1', '1', '1', '3', '2021-04-30 19:39:23');
INSERT INTO `t_commentedstar` VALUES ('2', '1', '4', '2', '2022-03-14 20:27:48');
INSERT INTO `t_commentedstar` VALUES ('3', '12', '17', '3', '2022-03-17 15:11:14');
INSERT INTO `t_commentedstar` VALUES ('4', '12', '4', '4', '2022-03-17 15:50:45');

-- ----------------------------
-- Table structure for t_focus
-- ----------------------------
DROP TABLE IF EXISTS `t_focus`;
CREATE TABLE `t_focus` (
  `focus_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `focused_id` bigint DEFAULT NULL,
  PRIMARY KEY (`focus_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_focus
-- ----------------------------
INSERT INTO `t_focus` VALUES ('1', '1', '2');
INSERT INTO `t_focus` VALUES ('2', '1', '3');
INSERT INTO `t_focus` VALUES ('3', '1', '4');
INSERT INTO `t_focus` VALUES ('4', '3', '1');
INSERT INTO `t_focus` VALUES ('5', '12', '2');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `msg_id` bigint NOT NULL AUTO_INCREMENT,
  `msg_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `msg_context` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `msg_send_date` datetime DEFAULT NULL,
  `msg_send_user_id` bigint DEFAULT NULL,
  `msg_receive_user_id` bigint DEFAULT NULL,
  `msg_state_id` bigint DEFAULT NULL,
  `msgtype_id` bigint DEFAULT NULL,
  PRIMARY KEY (`msg_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_msgtype
-- ----------------------------
DROP TABLE IF EXISTS `t_msgtype`;
CREATE TABLE `t_msgtype` (
  `msgtype_id` bigint NOT NULL AUTO_INCREMENT,
  `msgtype_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`msgtype_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_msgtype
-- ----------------------------
INSERT INTO `t_msgtype` VALUES ('1', 'PrivateMsg');
INSERT INTO `t_msgtype` VALUES ('2', 'SystemMsg');
INSERT INTO `t_msgtype` VALUES ('3', 'SuportNotice');
INSERT INTO `t_msgtype` VALUES ('4', 'EvaluateNotice');
INSERT INTO `t_msgtype` VALUES ('5', 'CollectionNotice');

-- ----------------------------
-- Table structure for t_predict
-- ----------------------------
DROP TABLE IF EXISTS `t_predict`;
CREATE TABLE `t_predict` (
  `pre_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `video_id` bigint DEFAULT NULL,
  `pre_star` float(255,2) DEFAULT NULL,
  PRIMARY KEY (`pre_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_predict
-- ----------------------------
INSERT INTO `t_predict` VALUES ('1', '1', '1', '2.58');
INSERT INTO `t_predict` VALUES ('2', '1', '2', '4.00');
INSERT INTO `t_predict` VALUES ('3', '1', '3', '2.34');
INSERT INTO `t_predict` VALUES ('4', '1', '4', '0.88');
INSERT INTO `t_predict` VALUES ('5', '1', '5', '3.44');
INSERT INTO `t_predict` VALUES ('6', '1', '6', '2.68');
INSERT INTO `t_predict` VALUES ('7', '1', '7', '3.03');
INSERT INTO `t_predict` VALUES ('8', '1', '8', '3.22');
INSERT INTO `t_predict` VALUES ('9', '1', '9', '3.80');
INSERT INTO `t_predict` VALUES ('10', '1', '10', '2.21');
INSERT INTO `t_predict` VALUES ('11', '1', '11', '1.20');
INSERT INTO `t_predict` VALUES ('12', '1', '12', '1.40');
INSERT INTO `t_predict` VALUES ('34', '1', '34', '2.68');
INSERT INTO `t_predict` VALUES ('35', '1', '35', '3.03');
INSERT INTO `t_predict` VALUES ('36', '1', '36', '3.22');
INSERT INTO `t_predict` VALUES ('37', '1', '37', '3.80');
INSERT INTO `t_predict` VALUES ('38', '1', '38', '2.21');
INSERT INTO `t_predict` VALUES ('40', '1', '40', '5.50');
INSERT INTO `t_predict` VALUES ('41', '1', '41', '1.54');
INSERT INTO `t_predict` VALUES ('42', '1', '42', '1.67');
INSERT INTO `t_predict` VALUES ('43', '1', '43', '1.81');
INSERT INTO `t_predict` VALUES ('44', '1', '44', '3.60');
INSERT INTO `t_predict` VALUES ('45', '1', '45', '2.65');
INSERT INTO `t_predict` VALUES ('46', '1', '46', '2.64');
INSERT INTO `t_predict` VALUES ('47', '1', '47', '2.60');
INSERT INTO `t_predict` VALUES ('48', '1', '48', '1.60');
INSERT INTO `t_predict` VALUES ('49', '1', '49', '2.80');
INSERT INTO `t_predict` VALUES ('50', '1', '50', '5.10');

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record` (
  `record_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `video_id` bigint DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_record
-- ----------------------------
INSERT INTO `t_record` VALUES ('25', '12', '4');
INSERT INTO `t_record` VALUES ('26', '12', '17');
INSERT INTO `t_record` VALUES ('27', '12', '19');
INSERT INTO `t_record` VALUES ('28', '13', '30');
INSERT INTO `t_record` VALUES ('29', '13', '19');
INSERT INTO `t_record` VALUES ('30', '13', '31');
INSERT INTO `t_record` VALUES ('31', '1', '30');
INSERT INTO `t_record` VALUES ('32', '1', '9');
INSERT INTO `t_record` VALUES ('33', '1', '19');
INSERT INTO `t_record` VALUES ('34', '1', '28');
INSERT INTO `t_record` VALUES ('35', '1', '29');
INSERT INTO `t_record` VALUES ('36', '1', '26');
INSERT INTO `t_record` VALUES ('37', '14', '34');
INSERT INTO `t_record` VALUES ('38', '14', '35');
INSERT INTO `t_record` VALUES ('39', '14', '36');
INSERT INTO `t_record` VALUES ('40', '15', '38');
INSERT INTO `t_record` VALUES ('41', '15', '37');
INSERT INTO `t_record` VALUES ('42', '15', '36');
INSERT INTO `t_record` VALUES ('43', '15', '35');
INSERT INTO `t_record` VALUES ('44', '15', '34');
INSERT INTO `t_record` VALUES ('45', '17', '42');
INSERT INTO `t_record` VALUES ('46', '17', '40');
INSERT INTO `t_record` VALUES ('47', '16', '40');
INSERT INTO `t_record` VALUES ('48', '16', '34');
INSERT INTO `t_record` VALUES ('49', '1', '41');
INSERT INTO `t_record` VALUES ('50', '1', '43');
INSERT INTO `t_record` VALUES ('51', '1', '46');
INSERT INTO `t_record` VALUES ('52', '1', '49');
INSERT INTO `t_record` VALUES ('53', '1', '34');
INSERT INTO `t_record` VALUES ('54', '1', '42');
INSERT INTO `t_record` VALUES ('55', '1', '50');
INSERT INTO `t_record` VALUES ('56', '1', '48');
INSERT INTO `t_record` VALUES ('57', '1', '40');
INSERT INTO `t_record` VALUES ('58', '1', '38');
INSERT INTO `t_record` VALUES ('59', '1', '35');
INSERT INTO `t_record` VALUES ('60', '1', '37');
INSERT INTO `t_record` VALUES ('61', '1', '44');

-- ----------------------------
-- Table structure for t_state
-- ----------------------------
DROP TABLE IF EXISTS `t_state`;
CREATE TABLE `t_state` (
  `state_id` bigint NOT NULL AUTO_INCREMENT,
  `state_name` varchar(22) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`state_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_state
-- ----------------------------
INSERT INTO `t_state` VALUES ('1', '认证中');
INSERT INTO `t_state` VALUES ('2', '已认证');
INSERT INTO `t_state` VALUES ('3', '认证失败');
INSERT INTO `t_state` VALUES ('4', '已上架');
INSERT INTO `t_state` VALUES ('5', '已下架');
INSERT INTO `t_state` VALUES ('6', '未读');
INSERT INTO `t_state` VALUES ('7', '已读');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_age` int DEFAULT NULL,
  `user_sex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `encrypted_problem` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '密保问题',
  `password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fan_num` int(11) unsigned zerofill DEFAULT NULL COMMENT '粉丝数量',
  `user_tel` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `level` int DEFAULT '0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '你说的对', '11', '男', 'springboot', '123456', '00000000000', '15566666626', '2021-04-17 15:17:10', '/user/getIcon/icon1.jpg', '1', '4');
INSERT INTO `t_user` VALUES ('2', '无名', '11', '女', '西游记', '123456', '00000000000', '15566663000', '2021-04-23 16:49:52', '/user/getIcon/icon2.png', '1', '2');
INSERT INTO `t_user` VALUES ('3', '小周', '18', '女', '水浒传', '123456', '00000000000', '15566663001', '2021-04-24 16:32:18', '/user/getIcon/icon3.png', '2', '0');
INSERT INTO `t_user` VALUES ('14', '悠悠球琛总', '25', '男', '111111', '111111', '00000000000', '13859620001', '2022-09-26 15:16:04', '/user/getIcon/icon14.JPG', '1', '2');
INSERT INTO `t_user` VALUES ('15', '小X文', '26', '男', '111111', '111111', '00000000000', '13859620002', '2022-09-26 16:20:59', '/user/getIcon/icon15.JPG', '1', '2');
INSERT INTO `t_user` VALUES ('16', '我要上厕所', '24', '男', '111111', '111111', '00000000000', '13859620003', '2022-09-26 17:19:48', '/user/getIcon/icon16.gtimg.com_newsapp_bt_0_13983157315_1000.jpg&refer=http __inews.gtimg.webp', '1', '1');
INSERT INTO `t_user` VALUES ('17', '你说的对！', '24', '男', '111111', '111111', '00000000000', '13859620004', '2022-09-26 17:22:33', '/user/getIcon/icon17.JPG', '1', '1');

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video` (
  `video_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `video_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `video_info` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `video_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `thunmbnail_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '缩略图',
  `video_state_id` bigint DEFAULT NULL,
  `view_num` int DEFAULT NULL,
  `pp_num` int DEFAULT NULL,
  `video_type_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `level` int DEFAULT '0',
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_video
-- ----------------------------
INSERT INTO `t_video` VALUES ('34', '坤 坤 挑 战 元 甲', '万中无一的练武奇坤。武学宗师蔡徐坤，打遍天下无敌手。', '2022-09-26 15:36:09', '/static/video/20220926153605.坤  坤  挑  战  元  甲(Av473024019,P1).mp4', '/video/getVideoImage/坤 坤 挑 战 元 甲.jpg', '4', '8', '0', '2', '14', '0');
INSERT INTO `t_video` VALUES ('35', '练习时长2个半小时的女ikun', '大家好，这是练习时长2个半小时的女ikun', '2022-09-26 15:51:15', '/static/video/20220926155110.大家好，这是练习时长2个半小时的女ikun(Av301303646,P1).mp4', '/video/getVideoImage/大家好，这是练习时长2个半小时的女ikun.jpg', '4', '11', '0', '3', '14', '0');
INSERT INTO `t_video` VALUES ('36', '【蔡徐坤】仙剑鸡侠传', '背景：《仙剑鸡侠传》讲述了蔡州城篮球当的小伙计鸡天和蔡门大小姐鲲鲲受到两人篮球的彼此吸引，她们二人“热闹而又尴尬”地相识了，成了一对篮球冤家。其实鲲鲲和鸡天正是彼此的有缘人，而他们都有来历不凡，身藏鸡世的秘密，随着鲲鲲家族的剧变，二人阴差阳错地步入了找寻“鸡王”的血雨腥风之中，并结识了徐鲲卿、紫球和律师葵等，等待他们的是更加惊险的前程和重大的责任。', '2022-09-26 15:55:08', '/static/video/20220926155500.【蔡徐坤】仙剑奇侠传(Av86208216,P1).mp4', '/video/getVideoImage/【蔡徐坤】仙剑鸡侠传.jpg', '4', '3', '0', '1', '14', '0');
INSERT INTO `t_video` VALUES ('37', '鸡你太美，但是猫咪版', '喵', '2022-09-26 16:08:01', '/static/video/鸡你太美，但是猫咪版.mp4', '/video/getVideoImage/鸡你太美，但是猫咪版.jpg', '4', '14', '0', '8', '14', '0');
INSERT INTO `t_video` VALUES ('38', '带你一秒沉沦这山水墨染的中国风', '这可能就是外国人做不出来的文化吧 别眨眼 带你一秒沉沦这山水墨染的中国风', '2022-09-26 16:24:17', '/static/video/20220926162414.mp4', '/video/getVideoImage/这山水墨染的中国风.jpg', '4', '5', '0', '8', '15', '0');
INSERT INTO `t_video` VALUES ('40', '100部动漫角色联手拯救世界', '为什么要低下头，重复一遍，为什么要低下头，因为不够强大，没有舍去的觉悟。我知道不会有任何人对我有希望，如果是英雄的话，就应该毫不犹豫的尽全力守护应该拯救的事物。不然的话，就无法守护任何东西,杀了人就会被人杀，我会死吗？应该会。憎恨会将这两者紧密相连\r\n感受痛楚吧！思考痛楚吧！接受痛楚吧！知晓痛楚吧！', '2022-09-27 15:56:30', '/static/video/100部动漫角色联手拯救世界，此生无悔入二次元.mp4', '/video/getVideoImage/100部动漫角色联手拯救世界40.jpg', '4', '49', '50', '8', '17', '0');
INSERT INTO `t_video` VALUES ('41', '前方高能！动漫混剪！', '时1145141919秒，爆肝810年，极限画质的巅峰，炸坏了五台电脑，6324部番剧衔接，都在为这一刻准备，感受混剪的魅力，全程史诗级无缝转场，极致的踩点，你们看着爽就行，前方高能，一秒燃爆，全世界将为之颤抖，压抑到极限的瞬间爆发，准备好颅内高潮吧，请带好耳机享受，1919秒后花里胡哨拉镜，中华5000年文化全部都被浓缩在这一个视频里，50秒后禁止眨眼！', '2022-09-27 15:56:30', '/static/video/前方高能！只需10s！我将从你手中抢走硬币！.mp4', '/video/getVideoImage/前方高能！只需10s！我将从你手中抢走硬币！41.jpg', '4', '11', '0', '8', '17', '0');
INSERT INTO `t_video` VALUES ('42', '【神兵小将】东方大小姐和南宫大少爷的反派生涯2.0', '时隔三年我终于重置出来了反派生涯20！因为想试试点新花样和不一样的感觉，这次东方大小姐是人狠声甜的港风美女', '2022-09-27 15:56:30', '/static/video/【神兵小将】东方大小姐和南宫大少爷的反派生涯.mp4', '/video/getVideoImage/【神兵小将】东方大小姐和南宫大少爷的反派生涯42.jpg', '4', '11', '0', '8', '17', '0');
INSERT INTO `t_video` VALUES ('43', '国漫可不仅仅是《耍把戏》', '“牺牲好人救坏人，这是什么道理”——《妙先生》“想死的人活了下去，想活的人死了。”——《夏日幽灵》“你所浪费的今天，是昨天已死之人苦苦哀求的明天。\r\n你所耽误的现在，是将来永远得不到的曾经。”——唐晓翼', '2022-09-27 15:56:30', '/static/video/国漫可不仅仅是耍把戏.mp4', '/video/getVideoImage/国漫可不仅仅是《耍把戏》43.jpg', '4', '9', '0', '8', '17', '0');
INSERT INTO `t_video` VALUES ('44', '这TM才叫拔刀！！！', '时隔三年我终于重置出来了反派生涯20！因为想试试点新花样和不一样的感觉，这次东方大小姐是人狠声甜的港风美女。', '2022-09-27 15:56:30', '/static/video/这TM才叫拔刀！！！.mp4', '/video/getVideoImage/这TM才叫拔刀！！！44.jpg', '4', '10', '0', '8', '17', '0');
INSERT INTO `t_video` VALUES ('45', '前方高能，带好耳机，感受第四次忍界大战！！！', '“这才是真正的火影！这才是真正的忍界巅峰战力！', '2022-09-27 15:56:30', '/static/video/前方高能，带好耳机，感受第四次忍界大战！！！.mp4', '/video/getVideoImage/前方高能，带好耳机，感受第四次忍界大战！！！45.jpg', '4', '2', '0', '8', '17', '0');
INSERT INTO `t_video` VALUES ('46', '【火影】这才是忍者世界的巅峰战力！46', '这才是真正的火影！这才是真正的忍界巅峰战力！', '2022-09-27 15:56:30', '/static/video/【火影】这才是忍者世界的巅峰战力！.mp4', '/video/getVideoImage/【火影】这才是忍者世界的巅峰战力！46.jpg', '4', '5', '0', '8', '17', '0');
INSERT INTO `t_video` VALUES ('47', '你那能叫领域展开？', '咒术回战：反派们为了封印五条悟踏上了征途', '2022-09-27 15:56:30', '/static/video/你那能叫领域展开？.mp4', '/video/getVideoImage/你那能叫领域展开？47.jpg', '4', '2', '0', '8', '16', '0');
INSERT INTO `t_video` VALUES ('48', '【国际金奖】桃花源记', '皮影难画，也难演。“当我老去，我也甚至开始怀疑自己，是否真的到过那片桃花源，还是黄粱一梦？”', '2022-09-27 15:56:30', '/static/video/【国际金奖】桃花源记.mp4', '/video/getVideoImage/【国际金奖】桃花源记48.jpg', '4', '9', '0', '8', '16', '0');
INSERT INTO `t_video` VALUES ('49', '懒羊羊：“你TM也配叫国漫最强战力？”', '懒羊羊:“嗨，同志！您知道青青草原在哪吗？我在地图上找不到它了”.村长：这里就是青青草原。。。不，草皮已经被打没了，从新种吧', '2022-09-27 15:56:30', '/static/video/懒羊羊你TM也配叫国漫最强战力？.mp4', '/video/getVideoImage/懒羊羊：“你TM也配叫国漫最强战力？”49.jpg', '4', '4', '0', '8', '16', '0');
INSERT INTO `t_video` VALUES ('50', '【一人之下_王也】你败过吗？', '月下遛鸟张楚岚不摇碧莲张处男， 机智一批冯宝宝 。一念之插张灵玉 ，冰清玉洁夏禾姐 。西装暴徒陆老爷， 凡夫俗子张之维 。良师益友徐老四， 一夜五百贾正亮 。一贫如洗王道长，不听八卦诸葛青。事后无情风沙燕。', '2022-09-27 15:56:30', '/static/video/（一人之下_王也）你败过吗？.mp4', '/video/getVideoImage/【一人之下_王也】你败过吗？50.jpg', '4', '8', '0', '8', '16', '0');

-- ----------------------------
-- Table structure for t_videotype
-- ----------------------------
DROP TABLE IF EXISTS `t_videotype`;
CREATE TABLE `t_videotype` (
  `videotype_id` bigint NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`videotype_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_videotype
-- ----------------------------
INSERT INTO `t_videotype` VALUES ('1', '冒险');
INSERT INTO `t_videotype` VALUES ('2', '战斗');
INSERT INTO `t_videotype` VALUES ('3', '搞笑');
INSERT INTO `t_videotype` VALUES ('4', '科幻');
INSERT INTO `t_videotype` VALUES ('5', '校园');
INSERT INTO `t_videotype` VALUES ('6', '悬疑');
INSERT INTO `t_videotype` VALUES ('7', '竞技');
INSERT INTO `t_videotype` VALUES ('8', '娱乐');
INSERT INTO `t_videotype` VALUES ('9', '科技数码');
INSERT INTO `t_videotype` VALUES ('10', '体育');
INSERT INTO `t_videotype` VALUES ('12', '国漫');
INSERT INTO `t_videotype` VALUES ('14', 'test0101');

-- ----------------------------
-- Table structure for t_vote
-- ----------------------------
DROP TABLE IF EXISTS `t_vote`;
CREATE TABLE `t_vote` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vote_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `option_a` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `option_b` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `option_c` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `option_d` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_vote
-- ----------------------------
INSERT INTO `t_vote` VALUES ('1', '你最喜欢的漫画', '樱桃小丸子', '马丁的早晨', '哆啦A梦', '', '2022-03-24 05:53:03', '2022-03-22 12:43:27');
INSERT INTO `t_vote` VALUES ('2', '222', 'a', 'b', 'c', 'd', '2022-03-24 05:53:03', '2022-03-22 12:43:27');
INSERT INTO `t_vote` VALUES ('5', 'test111', '1', '2', '3', '4', '2022-09-21 00:00:00', '2022-09-20 21:09:44');
INSERT INTO `t_vote` VALUES ('6', '以下你最期待的动漫', '春物第三季英配带字幕', '游戏人生第二季', '一人之下第六季', '游戏人生第三季', '2022-09-24 00:00:00', '2022-09-23 22:16:22');

-- ----------------------------
-- Table structure for t_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `t_vote_log`;
CREATE TABLE `t_vote_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vote_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `vote_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of t_vote_log
-- ----------------------------
INSERT INTO `t_vote_log` VALUES ('45', '1', '12', 'B', '2022-03-22 20:26:50');
INSERT INTO `t_vote_log` VALUES ('47', '2', '12', 'C', '2022-03-23 19:26:30');
INSERT INTO `t_vote_log` VALUES ('48', '5', '1', 'A', '2022-09-20 21:11:44');
INSERT INTO `t_vote_log` VALUES ('49', '2', '1', 'B', '2022-09-20 21:12:48');
INSERT INTO `t_vote_log` VALUES ('50', '1', '1', 'C', '2022-09-20 21:12:54');
