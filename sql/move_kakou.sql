/*
Navicat MariaDB Data Transfer

Source Server         : localhost_mariadb
Source Server Version : 50545
Source Host           : 127.0.0.1:3306
Source Database       : move_kakou

Target Server Type    : MariaDB
Target Server Version : 50545
File Encoding         : 65001

Date: 2016-03-21 17:16:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car_info
-- ----------------------------
DROP TABLE IF EXISTS `car_info`;
CREATE TABLE `car_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) DEFAULT NULL COMMENT '唯一标识',
  `date_upload` datetime NOT NULL DEFAULT '2015-01-01 00:00:00' COMMENT '上传日期',
  `date_created` datetime NOT NULL DEFAULT '2015-01-01 00:00:00' COMMENT '创建时间',
  `hphm` varchar(16) NOT NULL DEFAULT '' COMMENT '车牌号码',
  `wc` varchar(255) NOT NULL COMMENT '坐标',
  `place_name` varchar(255) DEFAULT '' COMMENT '地点名称',
  `img_path` varchar(255) NOT NULL DEFAULT '' COMMENT '图片路径',
  `banned` tinyint(3) NOT NULL DEFAULT '0' COMMENT '禁用',
  PRIMARY KEY (`id`),
  KEY `idx_date` (`date_created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car_info
-- ----------------------------
INSERT INTO `car_info` VALUES ('1', null, '2015-01-01 00:00:00', '2015-12-25 12:17:26', '粤L12345', '[345.123,456,345]', '', '20140203S.jpg', '0');
INSERT INTO `car_info` VALUES ('2', null, '2015-01-01 00:00:00', '2015-12-25 12:18:04', '粤L12345', '[345.123,456,345]', '', '20140203\\23.jpg', '0');
INSERT INTO `car_info` VALUES ('3', null, '2015-01-01 00:00:00', '2015-12-25 13:46:54', '', '[]', '', 'imgs\\20151225\\134654642000.jpg', '0');
INSERT INTO `car_info` VALUES ('4', null, '2015-01-01 00:00:00', '2015-12-25 13:50:31', '', '[]', '', 'imgs\\20151225\\135031105000.jpg', '0');
INSERT INTO `car_info` VALUES ('5', null, '2015-01-01 00:00:00', '2015-12-25 13:51:17', '', '[]', '', 'imgs\\20151225\\135117909000.jpg', '0');
INSERT INTO `car_info` VALUES ('6', null, '2015-01-01 00:00:00', '2015-12-25 14:08:29', '', '[123.4565, 23.74]', '', 'imgs\\20151225\\140829732000.jpg', '0');
INSERT INTO `car_info` VALUES ('7', null, '2015-01-01 00:00:00', '2015-12-25 14:09:27', '', '[123.4565, 23.74]', '', 'imgs\\20151225\\140927055000.jpg', '0');
INSERT INTO `car_info` VALUES ('8', null, '2015-01-01 00:00:00', '2016-01-01 00:24:04', '', '[123.4565, 23.74]', '', 'imgs\\20160101\\002404168000.jpg', '0');
INSERT INTO `car_info` VALUES ('9', null, '2016-01-20 19:54:23', '2016-01-20 19:54:23', '', '[123.4565, 23.74]', '', 'imgs\\20160120\\195423500000.jpg', '0');
INSERT INTO `car_info` VALUES ('10', null, '2016-01-20 19:55:31', '2016-01-20 19:55:31', '', '[123.4565, 23.74]', '', 'imgs\\20160120\\195531083000.jpg', '0');
INSERT INTO `car_info` VALUES ('11', null, '2016-01-20 19:56:09', '2016-01-20 19:56:09', '', '[123.4565, 23.74]', '', 'imgs\\20160120\\195609273000.jpg', '0');
INSERT INTO `car_info` VALUES ('12', null, '2016-01-20 19:59:22', '2016-01-20 19:59:22', '粤L12345', '[345.123,456,345]', '', '20140203\\23.jpg', '0');
INSERT INTO `car_info` VALUES ('13', null, '2016-01-20 19:59:54', '2016-01-20 19:59:54', '粤L12345', '[345.123,456,345]', '', '20140203\\23.jpg', '0');
INSERT INTO `car_info` VALUES ('14', null, '2016-01-20 20:01:07', '2015-01-02 12:34:56', '粤L12345', '[345.123,456,345]', '', '20140203\\23.jpg', '0');
INSERT INTO `car_info` VALUES ('15', null, '2016-01-20 20:02:51', '2015-01-02 12:34:56', '', '[123.4565, 23.74]', '', 'imgs\\20160120\\200251450000.jpg', '0');
INSERT INTO `car_info` VALUES ('16', null, '2016-01-20 20:09:59', '2015-01-02 12:34:56', '', '[123.4565, 23.74]', '', 'imgs\\20160120\\200959239000.jpg', '0');
INSERT INTO `car_info` VALUES ('17', null, '2016-01-20 20:10:48', '2015-01-02 12:34:56', '', '[123.4565, 23.74]', '', 'imgs\\20160120\\201048992000.jpg', '0');

-- ----------------------------
-- Table structure for scope
-- ----------------------------
DROP TABLE IF EXISTS `scope`;
CREATE TABLE `scope` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '权限名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scope
-- ----------------------------
INSERT INTO `scope` VALUES ('1', 'all');
INSERT INTO `scope` VALUES ('2', 'user_get');
INSERT INTO `scope` VALUES ('3', 'user_post');
INSERT INTO `scope` VALUES ('4', 'user_put');
INSERT INTO `scope` VALUES ('5', 'user_delete');
INSERT INTO `scope` VALUES ('6', 'token_get');
INSERT INTO `scope` VALUES ('7', 'scope_get');
INSERT INTO `scope` VALUES ('8', 'gdvehicle_get');
INSERT INTO `scope` VALUES ('9', 'hzhbc_get');

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `banned` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of temp
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `username` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码hash',
  `scope` varchar(255) NOT NULL COMMENT '权限范围',
  `date_created` datetime NOT NULL DEFAULT '2014-01-01 00:00:00' COMMENT '创建时间',
  `date_modified` datetime NOT NULL DEFAULT '2014-01-01 00:00:00' COMMENT '修改时间',
  `banned` tinyint(4) NOT NULL DEFAULT '0' COMMENT '禁用',
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`(8))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '$5$rounds=123456$wGy6UHgr4x0D333e$u7PpQJpVjcv.j1XZh51wrj8w1..W60ED9kbkeni2sd.', 'all', '2015-08-24 05:30:49', '2015-08-24 05:30:49', '0');
INSERT INTO `users` VALUES ('2', 'fire', '$5$rounds=123456$MJc1YkabSfvJsHeH$ZdG6HZPR.hiqo3aCgCO./oQ1.mU4qrmRGnHUAdVMkF/', '', '2015-08-24 05:30:49', '2015-08-24 05:30:49', '0');
INSERT INTO `users` VALUES ('3', 'fire2', '$5$rounds=123456$kxJfnHnfW0CZySqD$QEX1wrqvA84.pTgNXPorxJo45oZTQqfT.zOQHnRO1n/', '', '2015-08-24 05:30:49', '2015-08-24 05:30:49', '1');
INSERT INTO `users` VALUES ('4', 'fire3', '$5$rounds=123456$fA3AD11UKV05yJ9v$2ZGNyETYWLR8.uZ1lE0x33YaFq4NeIEBiGPcylP7QK1', 'scope_get,user_get', '2015-08-24 05:30:49', '2015-08-29 04:21:08', '0');
INSERT INTO `users` VALUES ('5', 'fire4', '$5$rounds=123456$a8s1TffV8UI6VrAl$YYmB7lXqupMD43OHinL8HavGdXKYYIQmV5.eU3lSOW2', '', '2015-08-24 05:30:49', '2015-08-24 05:30:49', '0');
INSERT INTO `users` VALUES ('6', 'admin2', 'password', 'jack', '2015-08-28 14:54:07', '2015-08-28 14:54:07', '1');
INSERT INTO `users` VALUES ('7', 'admin3', 'password', 'jack', '2015-08-28 15:26:08', '2015-08-28 15:26:08', '1');
INSERT INTO `users` VALUES ('8', 'fire7', '$5$rounds=123456$XrDDd1fkWte8gQ4h$CFxdwUJx2pN5yeCBqZx2OU/F5ldBZfW4rZrV9/3H6/A', '', '2015-08-28 16:26:18', '2015-08-28 16:26:18', '0');
INSERT INTO `users` VALUES ('9', 'fire8', '$5$rounds=123456$yiMIVidEWSU9XJqE$huLHO5i5sEMYl2W5D528MfLJ5.FTb/vOlWQsqISHIL4', '', '2015-08-28 16:27:26', '2015-08-28 16:27:26', '0');
INSERT INTO `users` VALUES ('10', 'fire9', '$5$rounds=123456$fio3jN8nAG6lkUQg$vxqA8/RHwmgQlU9tX1ISCVEvSDnUXDg9GNMLwfDdKY3', '', '2015-08-28 21:38:57', '2015-08-28 21:38:57', '0');
INSERT INTO `users` VALUES ('11', 'fire10', '$5$rounds=123456$nhI1/orsa3Gx0..y$NnwwgAz7EEnNs5.aemWH3MVywA/RW4F5kFKVUDFQSLD', '', '2015-08-28 21:50:31', '2015-08-28 21:50:31', '0');
INSERT INTO `users` VALUES ('12', 'fire11', '$5$rounds=123456$0sxmP5UUkm5bxw2q$m0OBb0Zk5bqNfTT6LgBP1DC66604OHQL.vLhBsBlA60', '', '2015-08-28 21:52:22', '2015-08-28 21:52:22', '0');
INSERT INTO `users` VALUES ('13', 'fire12', '$5$rounds=123456$xvMsfcIyFkOhkZZP$y07Joasmmy6vUhtwG53hUEWOVxJhAmnR/lpBu5Zb.l9', '', '2015-08-28 21:53:32', '2015-08-28 21:53:32', '0');
INSERT INTO `users` VALUES ('14', 'fire13', '$5$rounds=123456$WMUrz6NS1ZmEhpt5$N.Y4oQUN5ENGOl/gNU6Ud1.EZNEPCrfw9wN.0LPnJw5', '', '2015-08-28 21:54:08', '2015-08-28 21:54:08', '0');
INSERT INTO `users` VALUES ('15', 'fire14', '$5$rounds=123456$BTAJ9h/x0yj/RH5u$9lnFU2/kYTRKjk/pZxYxFezewcj4lDwKuRcwvLI.tuB', '', '2015-08-28 21:54:56', '2015-08-28 21:54:56', '0');
INSERT INTO `users` VALUES ('16', 'fire15', '$5$rounds=123456$DfxcVbPC1yLIHuhG$Y.LegqVkWq5XXm/vOiRH3n9J2rGuRe3pAF.l3EW4XZB', '', '2015-08-28 21:56:26', '2015-08-28 21:56:26', '0');
INSERT INTO `users` VALUES ('17', 'fire16', '$5$rounds=123456$oYXMJ0ZZGccV2uS2$blVNh.RmpZ/dWBJdFavHA4Xjn1p0uFU3dECIk9TCi49', '', '2015-08-28 21:57:44', '2015-08-28 21:57:44', '0');
INSERT INTO `users` VALUES ('18', 'fire17', '$5$rounds=123456$dOsZtZZ1t1Yv/M0t$a9jB3sD2my.SMSF5G7.QzFymksMcGeCozYhCmEufUn1', '', '2015-08-28 21:58:45', '2015-08-28 21:58:45', '0');
INSERT INTO `users` VALUES ('19', 'fire18', '$5$rounds=123456$7NYe/1.JN8Vld7Au$EAVUtkFyOmzurmDL4WmneLspxIuspjtgwwZ1vVMDNZC', '', '2015-08-28 21:59:49', '2015-08-28 21:59:49', '0');
INSERT INTO `users` VALUES ('20', 'fire19', '$5$rounds=123456$2ghmLoqsQ43/4jYl$tTdVzq/iACaO6k5aSfno7uQeyQ.oVeb47t9ItEneC59', 'vehicle', '2015-08-28 22:01:19', '2015-08-28 22:01:19', '0');
INSERT INTO `users` VALUES ('21', 'fire20', '$5$rounds=123456$t8QvPkJT.jxvqYd6$NPZ4zQHLHE1XU73VnvqiOXLuBwHqhtdez0lNFAztJBB', 'scope_get', '2015-08-29 04:02:13', '2015-08-29 04:02:13', '0');
INSERT INTO `users` VALUES ('22', 'admin3', 'password', 'user_get', '2015-08-29 14:31:54', '2015-08-29 14:31:54', '0');
INSERT INTO `users` VALUES ('23', 'test1', '$5$rounds=123456$QqIatfxAzegwruHQ$bsxtIuA8Wy4jwmfl8kJxinW3tnH1l25TqzGTXPOTK8.', 'scope_get,hzhbc_get', '2015-08-31 00:25:37', '2015-08-31 00:25:37', '0');
INSERT INTO `users` VALUES ('24', 'test2', '$5$rounds=123456$Wtpor4jwuT0RRJNY$geZ31x7wJAYQ1DQ/YLdpOwTiyrIyHAVFVJqWZg4sHr8', 'all', '2015-08-31 00:26:04', '2015-08-31 00:26:04', '0');
