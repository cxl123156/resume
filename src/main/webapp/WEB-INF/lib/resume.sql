/*
Navicat MariaDB Data Transfer

Source Server         : CentOS
Source Server Version : 50544
Source Host           : 192.168.253.128:3306
Source Database       : resume

Target Server Type    : MariaDB
Target Server Version : 50544
File Encoding         : 65001

Date: 2016-03-07 16:55:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for T_COMMENT
-- ----------------------------
DROP TABLE IF EXISTS `T_COMMENT`;
CREATE TABLE `T_COMMENT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL,
  `commentTime` datetime NOT NULL,
  `userId` int(11) NOT NULL,
  `commentUserName` varchar(50) DEFAULT NULL,
  `contactMethod` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `userId` (`userId`),
  CONSTRAINT `T_COMMENT_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `T_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='留言';

-- ----------------------------
-- Records of T_COMMENT
-- ----------------------------
INSERT INTO `T_COMMENT` VALUES ('1', 'hello world !', '2016-02-19 20:45:43', '1', 'chen', '110');
INSERT INTO `T_COMMENT` VALUES ('2', 'hello world !!', '2016-02-19 20:50:48', '1', 'chen', '15913369186');
INSERT INTO `T_COMMENT` VALUES ('3', '老妈来了！', '2016-02-19 21:00:17', '1', '老妈', '13199608268');
INSERT INTO `T_COMMENT` VALUES ('4', 'test', '2016-02-28 20:41:17', '1', 'test', 'test');
INSERT INTO `T_COMMENT` VALUES ('5', 'test1', '2016-02-28 20:47:22', '1', 'test1', 'test1');
INSERT INTO `T_COMMENT` VALUES ('6', 'test2', '2016-02-28 20:50:28', '1', 'test2', 'test2');
INSERT INTO `T_COMMENT` VALUES ('7', 'test3', '2016-02-28 20:52:21', '1', 'test3', 'test3');
INSERT INTO `T_COMMENT` VALUES ('8', 'test6', '2016-02-28 21:05:04', '1', 'test6', 'test6');
INSERT INTO `T_COMMENT` VALUES ('9', 'test', '2016-03-06 17:00:01', '1', 'chen', '15913369186');

-- ----------------------------
-- Table structure for T_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `T_GROUP`;
CREATE TABLE `T_GROUP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `groupName` (`groupName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限组';

-- ----------------------------
-- Records of T_GROUP
-- ----------------------------
INSERT INTO `T_GROUP` VALUES ('1', 'admin');
INSERT INTO `T_GROUP` VALUES ('3', 'anonymous ');
INSERT INTO `T_GROUP` VALUES ('2', 'user');

-- ----------------------------
-- Table structure for T_RESUME
-- ----------------------------
DROP TABLE IF EXISTS `T_RESUME`;
CREATE TABLE `T_RESUME` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `workExp` text COMMENT '工作经验\r\n数据格式：\r\ncorpName=""@*@time=""@*@job=""@*@descrip="";',
  `eduExp` varchar(255) DEFAULT NULL COMMENT '教育经历\r\n数据格式：\r\nschool=""@*@major=""@*@degree=""@*@startTime=""@*@endTime=""@*@majorDescrip="";',
  `reward` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '获奖\r\n数据格式:\r\nrewardName=""@*@time=""@*@type="";',
  `certificates` varchar(255) DEFAULT NULL COMMENT '证书\r\n数据格式：\r\nname=""@*@time=“”@*@score=“”；',
  `introduction` varchar(255) DEFAULT NULL COMMENT '简介',
  `projExp` text COMMENT '项目经验\r\n数据格式：\r\nname=""@*@tool=""@*@time=""@*@duty=""@*@descrip="";',
  `inSchoolActive` varchar(255) DEFAULT NULL COMMENT '校内活动\r\n数据格式:\r\nname=""@*@duty=""@*@time=""@*@descript="";',
  `resumeName` varchar(20) NOT NULL,
  `sourcePhoto` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL COMMENT '技能数据格式\r\nskillName=""@*@proficiency="";',
  `foreignLanguage` varchar(255) DEFAULT NULL COMMENT '外语水平数据格式：\r\nforeignLanguageName=""@*@time=""@*@describe="";',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `id` (`id`) USING BTREE,
  CONSTRAINT `T_RESUME_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `T_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='简历';

-- ----------------------------
-- Records of T_RESUME
-- ----------------------------
INSERT INTO `T_RESUME` VALUES ('1', '1', 'company=祥富塑料包装有限公司@*@startTime=2015-09-08@*@endTime=2015-12-31@*@job=网络管理员@*@duty=负责公司电脑、监控、打印机以及服务器的维护。以及其他同事日常工作中电脑相关问题的解答。;company=广东全通教育股份有限公司@*@startTime=2015-05-01@*@endTime=2015-07-08@*@job=Java开发@*@duty=负责公司贵州校讯通项目bug的修复，页面维护以及新需求的开发。项目有前端和后端两个系统，前端主要使用ssm框架，后端主要通过servlet实现。;', 'schoolName=电子科技大学中山学院@*@startTime=2011-09-01@*@endTime=2015-06-30@*@degree=本科@*@major=网络工程@*@majorReview=网络工程;', 'reward=三等奖学金@*@rewardTime=2015-12-01;', 'certification=CCNA@*@getTime=2013-09-17;', '工作半年，换了一次工作。这次换工作的经历让我找到了自己的方向，在学校学过java，也干过java方面工作，工作经验虽然不多，但自己平时也做过些小项目，今后希望从事java方向。', 'projName=简历管理系统@*@startTime=2015-12-01@*@endTime=2015-12-31@*@environment=java7，SSM，MySql@*@projDescribe=实现了对个人简历的添加，修改，删除等功能。使用了spring security进行权限的管理。;projName=BBS论坛@*@startTime=2015-03-09@*@endTime=2015-04-30@*@environment=java7，SSH，MySql@*@projDescribe=该项目为毕业设计前端实现了用户注册、登录、注销、发帖、回复及用户删除自己发表的帖子和回复内容的功能。后端实现了分区、板块、帖子、用户的删除和修改功能以及管理员用户的添加和修改删除。;', 'activeName=网络维护@*@startTime=2011-10-10@*@endTime=2014-06-20@*@describe=主要负责上门解决学生宿舍网络的问题。;', 'JavaEE', '/upload/chen/chenPhoto.jpg', '/upload/chen/chenPhotoCrop.jpg', 'skillName=Java@*@proficiency=70;skillName=Javascript@*@proficiency=60;skillName=CCNA@*@proficiency=75;skillName=HTML/CSS@*@proficiency=75;', 'foreignLanguage=CET4@*@getTime=2012-12-22@*@describe=CET4 分数:443;');
INSERT INTO `T_RESUME` VALUES ('2', '1', null, null, null, null, null, null, null, '默认简历', null, null, null, null);
INSERT INTO `T_RESUME` VALUES ('3', '1', null, null, null, null, null, null, null, '默认简历', null, null, null, null);
INSERT INTO `T_RESUME` VALUES ('4', '1', null, null, null, null, null, null, null, '默认简历', null, null, null, null);
INSERT INTO `T_RESUME` VALUES ('5', '1', null, null, null, null, null, null, null, '默认简历', null, null, null, null);
INSERT INTO `T_RESUME` VALUES ('6', '1', null, null, null, null, null, null, null, '默认简历', null, null, null, null);
INSERT INTO `T_RESUME` VALUES ('7', '1', null, null, null, null, null, null, null, '默认简历', null, null, null, null);

-- ----------------------------
-- Table structure for T_ROLE
-- ----------------------------
DROP TABLE IF EXISTS `T_ROLE`;
CREATE TABLE `T_ROLE` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `descpt` varchar(255) NOT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `role` (`role`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of T_ROLE
-- ----------------------------
INSERT INTO `T_ROLE` VALUES ('1', 'ROLE_ADMIN', '管理员', 'admin');
INSERT INTO `T_ROLE` VALUES ('2', 'ROLE_USER', '普通用户', 'user');
INSERT INTO `T_ROLE` VALUES ('3', 'ROLE_ANONYMOUS', '游客', 'anonymous ');

-- ----------------------------
-- Table structure for T_ROLE_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `T_ROLE_GROUP`;
CREATE TABLE `T_ROLE_GROUP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `T_ROLE_GROUP_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `T_ROLE` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `T_ROLE_GROUP_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `T_GROUP` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限组对应权限';

-- ----------------------------
-- Records of T_ROLE_GROUP
-- ----------------------------
INSERT INTO `T_ROLE_GROUP` VALUES ('1', '1', '1');
INSERT INTO `T_ROLE_GROUP` VALUES ('2', '2', '2');
INSERT INTO `T_ROLE_GROUP` VALUES ('3', '3', '3');

-- ----------------------------
-- Table structure for T_USER
-- ----------------------------
DROP TABLE IF EXISTS `T_USER`;
CREATE TABLE `T_USER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `enabled` int(1) NOT NULL DEFAULT '1' COMMENT '1:enable，0:disable',
  `email` varchar(255) NOT NULL,
  `age` varchar(2) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  `nativePlace` varchar(20) NOT NULL COMMENT '籍贯',
  `phone` varchar(20) NOT NULL,
  `webSite` varchar(50) DEFAULT NULL,
  `realName` varchar(10) NOT NULL,
  `college` varchar(20) NOT NULL,
  `major` varchar(20) NOT NULL,
  `degree` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of T_USER
-- ----------------------------
INSERT INTO `T_USER` VALUES ('1', 'chen', '123156', '1', 'chen9294@hotmail.com', '24', '1992-09-04 00:00:00', '黑龙江', '15913369186', 'chenxl.com', '陈香林', '电子科技大学中山学院', '网络工程', '本科');
INSERT INTO `T_USER` VALUES ('2', 'user', 'user', '1', 'user@user.user', '', '', '', '', null, '', '', '', '');
INSERT INTO `T_USER` VALUES ('3', 'lshlmy', '123456', '1', 'lshlmy@126.com', '24', '2015-12-10 11:14:23', '', '13392333814', 'lshlmy.com', '', '', '', '');
INSERT INTO `T_USER` VALUES ('4', '123', '123456', '1', '123@123.com', '43', '2015-12-10 11:22:00', '', '13309888876', '', '', '', '', '');
INSERT INTO `T_USER` VALUES ('8', '22', '123456', '1', 'cxl123156@gmail.com', '23', '2015-12-10 11:39:39', '', '', '', '', '', '', '');
INSERT INTO `T_USER` VALUES ('10', 'hahaha', '123456', '1', 'chen@chen.com', '', '', '', '6263634355', '', '', '', '', '');
INSERT INTO `T_USER` VALUES ('11', '1', '123123', '1', 'chen9294@hotmail.com', '', '', '', '15913369186', '', '', '', '', '');
INSERT INTO `T_USER` VALUES ('12', '2', '222222', '1', 'chen9294@hotmail.com', '22', '', '', '15913369186', '', '', '', '', '');
INSERT INTO `T_USER` VALUES ('13', '3', '3333333', '1', 'chen9294@hotmail.com', '2', '2015-12-29 00:00:00', '', '15913369186', '', '', '', '', '');
INSERT INTO `T_USER` VALUES ('14', '4', '444444', '1', 'chen9294@hotmail.com', '32', '2015-12-02 00:00:00', '', '15913369186', 'chenxl.com', '', '', '', '');
INSERT INTO `T_USER` VALUES ('15', '5', '555555', '1', 'chen9294@hotmail.com', '23', '1992-09-04 00:00:00', '黑龙江', '15913369186', 'chenxl.com', '', '', '', '');
INSERT INTO `T_USER` VALUES ('16', '6', '666666', '1', 'chen9294@hotmail.com', '24', '2015-12-30 00:00:00', '广东省', '15913369186', 'sss', '', '', '', '');
INSERT INTO `T_USER` VALUES ('17', 'guest', 'guest123', '1', 'guest@guest.guest', '0', '', '', '', null, 'guest', '', '', '');

-- ----------------------------
-- Table structure for T_USER_GROUP
-- ----------------------------
DROP TABLE IF EXISTS `T_USER_GROUP`;
CREATE TABLE `T_USER_GROUP` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `T_USER_GROUP_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `T_USER` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `T_USER_GROUP_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `T_GROUP` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户所属权限组';

-- ----------------------------
-- Records of T_USER_GROUP
-- ----------------------------
INSERT INTO `T_USER_GROUP` VALUES ('1', '1', '1');
INSERT INTO `T_USER_GROUP` VALUES ('2', '2', '2');
INSERT INTO `T_USER_GROUP` VALUES ('4', '3', '3');
INSERT INTO `T_USER_GROUP` VALUES ('5', '17', '2');
