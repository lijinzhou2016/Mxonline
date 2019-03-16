/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : mxonline

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 03/16/2019 19:05:09 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_group`
-- ----------------------------
BEGIN;
INSERT INTO `auth_group` VALUES ('12', '超级管理员');
COMMIT;

-- ----------------------------
--  Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_group_permissions`
-- ----------------------------
BEGIN;
INSERT INTO `auth_group_permissions` VALUES ('1', '12', '1'), ('2', '12', '2'), ('3', '12', '3'), ('4', '12', '4'), ('5', '12', '5'), ('6', '12', '6'), ('7', '12', '7'), ('8', '12', '8'), ('9', '12', '9'), ('10', '12', '10'), ('11', '12', '11'), ('12', '12', '12'), ('13', '12', '13'), ('14', '12', '14'), ('15', '12', '15'), ('16', '12', '16'), ('17', '12', '17'), ('18', '12', '18'), ('19', '12', '19'), ('20', '12', '20'), ('21', '12', '21'), ('22', '12', '22'), ('23', '12', '23'), ('24', '12', '24'), ('25', '12', '25'), ('26', '12', '26'), ('27', '12', '27'), ('28', '12', '28'), ('29', '12', '29'), ('30', '12', '30'), ('31', '12', '31'), ('32', '12', '32'), ('33', '12', '33'), ('34', '12', '34'), ('35', '12', '35'), ('36', '12', '36'), ('37', '12', '37'), ('38', '12', '38'), ('39', '12', '39'), ('40', '12', '40'), ('41', '12', '41'), ('42', '12', '42'), ('43', '12', '43'), ('44', '12', '44'), ('45', '12', '45'), ('46', '12', '46'), ('47', '12', '47'), ('48', '12', '48'), ('49', '12', '49'), ('50', '12', '50'), ('51', '12', '51'), ('52', '12', '52'), ('53', '12', '53'), ('54', '12', '54'), ('55', '12', '55'), ('56', '12', '56'), ('57', '12', '57'), ('58', '12', '58'), ('59', '12', '59'), ('60', '12', '60'), ('61', '12', '61'), ('62', '12', '62'), ('63', '12', '63'), ('64', '12', '64'), ('65', '12', '65'), ('66', '12', '66'), ('67', '12', '67'), ('68', '12', '68'), ('69', '12', '69'), ('70', '12', '70'), ('71', '12', '71'), ('72', '12', '72'), ('73', '12', '73'), ('74', '12', '74'), ('75', '12', '75'), ('76', '12', '76'), ('77', '12', '77'), ('78', '12', '78'), ('79', '12', '79'), ('80', '12', '80'), ('81', '12', '81'), ('82', '12', '82'), ('83', '12', '83'), ('84', '12', '84'), ('85', '12', '85'), ('86', '12', '86'), ('87', '12', '87'), ('88', '12', '88'), ('89', '12', '89'), ('90', '12', '90'), ('91', '12', '91'), ('92', '12', '92'), ('93', '12', '93'), ('94', '12', '94'), ('95', '12', '95'), ('96', '12', '96'), ('97', '12', '97'), ('98', '12', '98'), ('99', '12', '99'), ('100', '12', '100');
COMMIT;

-- ----------------------------
--  Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth_permission`
-- ----------------------------
BEGIN;
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry'), ('2', 'Can change log entry', '1', 'change_logentry'), ('3', 'Can delete log entry', '1', 'delete_logentry'), ('4', 'Can add permission', '2', 'add_permission'), ('5', 'Can change permission', '2', 'change_permission'), ('6', 'Can delete permission', '2', 'delete_permission'), ('7', 'Can add group', '3', 'add_group'), ('8', 'Can change group', '3', 'change_group'), ('9', 'Can delete group', '3', 'delete_group'), ('10', 'Can add content type', '4', 'add_contenttype'), ('11', 'Can change content type', '4', 'change_contenttype'), ('12', 'Can delete content type', '4', 'delete_contenttype'), ('13', 'Can add session', '5', 'add_session'), ('14', 'Can change session', '5', 'change_session'), ('15', 'Can delete session', '5', 'delete_session'), ('16', 'Can add 用户信息', '6', 'add_userprofile'), ('17', 'Can change 用户信息', '6', 'change_userprofile'), ('18', 'Can delete 用户信息', '6', 'delete_userprofile'), ('19', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord'), ('20', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord'), ('21', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord'), ('22', 'Can add 轮播图', '8', 'add_banner'), ('23', 'Can change 轮播图', '8', 'change_banner'), ('24', 'Can delete 轮播图', '8', 'delete_banner'), ('25', 'Can add 课程', '9', 'add_course'), ('26', 'Can change 课程', '9', 'change_course'), ('27', 'Can delete 课程', '9', 'delete_course'), ('28', 'Can add 章节', '10', 'add_lesson'), ('29', 'Can change 章节', '10', 'change_lesson'), ('30', 'Can delete 章节', '10', 'delete_lesson'), ('31', 'Can add 视频', '11', 'add_video'), ('32', 'Can change 视频', '11', 'change_video'), ('33', 'Can delete 视频', '11', 'delete_video'), ('34', 'Can add 资源', '12', 'add_courseresource'), ('35', 'Can change 资源', '12', 'change_courseresource'), ('36', 'Can delete 资源', '12', 'delete_courseresource'), ('37', 'Can add 城市', '13', 'add_citydict'), ('38', 'Can change 城市', '13', 'change_citydict'), ('39', 'Can delete 城市', '13', 'delete_citydict'), ('40', 'Can add 课程机构', '14', 'add_courseorg'), ('41', 'Can change 课程机构', '14', 'change_courseorg'), ('42', 'Can delete 课程机构', '14', 'delete_courseorg'), ('43', 'Can add 教师', '15', 'add_teacher'), ('44', 'Can change 教师', '15', 'change_teacher'), ('45', 'Can delete 教师', '15', 'delete_teacher'), ('46', 'Can add 用户咨询', '16', 'add_userask'), ('47', 'Can change 用户咨询', '16', 'change_userask'), ('48', 'Can delete 用户咨询', '16', 'delete_userask'), ('49', 'Can add 用户评论', '17', 'add_coursecomments'), ('50', 'Can change 用户评论', '17', 'change_coursecomments'), ('51', 'Can delete 用户评论', '17', 'delete_coursecomments'), ('52', 'Can add 用户收藏', '18', 'add_userfavorite'), ('53', 'Can change 用户收藏', '18', 'change_userfavorite'), ('54', 'Can delete 用户收藏', '18', 'delete_userfavorite'), ('55', 'Can add 用户消息', '19', 'add_usermessage'), ('56', 'Can change 用户消息', '19', 'change_usermessage'), ('57', 'Can delete 用户消息', '19', 'delete_usermessage'), ('58', 'Can add 用户课程', '20', 'add_usercourse'), ('59', 'Can change 用户课程', '20', 'change_usercourse'), ('60', 'Can delete 用户课程', '20', 'delete_usercourse'), ('61', 'Can view log entry', '1', 'view_logentry'), ('62', 'Can view group', '3', 'view_group'), ('63', 'Can view permission', '2', 'view_permission'), ('64', 'Can view content type', '4', 'view_contenttype'), ('65', 'Can view 课程', '9', 'view_course'), ('66', 'Can view 资源', '12', 'view_courseresource'), ('67', 'Can view 章节', '10', 'view_lesson'), ('68', 'Can view 视频', '11', 'view_video'), ('69', 'Can view 用户评论', '17', 'view_coursecomments'), ('70', 'Can view 用户咨询', '16', 'view_userask'), ('71', 'Can view 用户课程', '20', 'view_usercourse'), ('72', 'Can view 用户收藏', '18', 'view_userfavorite'), ('73', 'Can view 用户消息', '19', 'view_usermessage'), ('74', 'Can view 城市', '13', 'view_citydict'), ('75', 'Can view 课程机构', '14', 'view_courseorg'), ('76', 'Can view 教师', '15', 'view_teacher'), ('77', 'Can view session', '5', 'view_session'), ('78', 'Can view 轮播图', '8', 'view_banner'), ('79', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord'), ('80', 'Can view 用户信息', '6', 'view_userprofile'), ('81', 'Can add Bookmark', '21', 'add_bookmark'), ('82', 'Can change Bookmark', '21', 'change_bookmark'), ('83', 'Can delete Bookmark', '21', 'delete_bookmark'), ('84', 'Can add User Setting', '22', 'add_usersettings'), ('85', 'Can change User Setting', '22', 'change_usersettings'), ('86', 'Can delete User Setting', '22', 'delete_usersettings'), ('87', 'Can add User Widget', '23', 'add_userwidget'), ('88', 'Can change User Widget', '23', 'change_userwidget'), ('89', 'Can delete User Widget', '23', 'delete_userwidget'), ('90', 'Can view Bookmark', '21', 'view_bookmark'), ('91', 'Can view User Setting', '22', 'view_usersettings'), ('92', 'Can view User Widget', '23', 'view_userwidget'), ('93', 'Can add log entry', '24', 'add_log'), ('94', 'Can change log entry', '24', 'change_log'), ('95', 'Can delete log entry', '24', 'delete_log'), ('96', 'Can view log entry', '24', 'view_log'), ('97', 'Can add captcha store', '25', 'add_captchastore'), ('98', 'Can change captcha store', '25', 'change_captchastore'), ('99', 'Can delete captcha store', '25', 'delete_captchastore'), ('100', 'Can view captcha store', '25', 'view_captchastore'), ('101', 'Can add 轮播课程', '9', 'add_bannercourse'), ('102', 'Can change 轮播课程', '9', 'change_bannercourse'), ('103', 'Can delete 轮播课程', '9', 'delete_bannercourse'), ('104', 'Can view 轮播课程', '26', 'view_bannercourse');
COMMIT;

-- ----------------------------
--  Table structure for `captcha_captchastore`
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `captcha_captchastore`
-- ----------------------------
BEGIN;
INSERT INTO `captcha_captchastore` VALUES ('9', 'CAOA', 'caoa', 'ec1d8704d8d65c7cd9ecf674af2a2f184803a35b', '2019-03-16 15:23:31.965168'), ('10', 'ZFAT', 'zfat', 'c6f39e3596e5d8cc4c5a22028e070b12e6a3a936', '2019-03-16 15:27:58.890838'), ('11', 'YRCR', 'yrcr', '6638190734aafe8d21a7f046a239d13be78f5a2a', '2019-03-16 15:28:04.917218'), ('12', 'VWZO', 'vwzo', '3dc5060a8803182f1508e152b5e41f59ee72b7e1', '2019-03-16 06:03:30.095074');
COMMIT;

-- ----------------------------
--  Table structure for `courses_course`
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `course_org_id` int(11),
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11),
  `teacher_tell` varchar(300),
  `you_need_know` varchar(300),
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `courses_course`
-- ----------------------------
BEGIN;
INSERT INTO `courses_course` VALUES ('1', 'Python入门', 'Python入门', 'Python入门Python入门Python入门', 'cj', '0', '8', '1', 'courses/2019/02/540e57300001d6d906000338-240-135_MSIqfvw.jpg', '32', '2019-02-05 10:22:30.414927', '2019-03-16 05:58:24.521998', '1', '后端开发', 'python', '1', '可以使用python简单编程', '了解计算机', '1'), ('2', 'MySQL入门', '简单的MySQL入门', '简单的MySQL入门简单的MySQL入门简单的MySQL入门', 'cj', '0', '2', '0', 'courses/2019/02/mysql.jpg', '5', '2019-02-09 19:57:33.965351', '2019-03-16 16:54:22.332635', '1', '后端开发', '', null, null, null, '1'), ('3', 'JAVA入门第一季', '简单的java入门', '简单的java入门简单的java入门简单的java入门', 'cj', '0', '0', '0', 'courses/2019/02/57035ff200014b8a06000338-240-135_0nFiBSI.jpg', '1', '2019-02-09 19:58:48.713494', '2019-02-27 23:06:36.418624', '4', '后端开发', '', null, null, null, '0'), ('4', 'Python错误与异常', 'Python错误与异常', 'Python错误与异常Python错误与异常Python错误与异常', 'zj', '0', '0', '0', 'courses/2019/02/python错误和异常.jpg', '2', '2019-02-09 20:00:13.836790', '2019-03-16 16:43:02.826224', '8', '后端开发', '', null, null, null, '0'), ('5', 'Python面向对象', 'Python面向对象', 'Python面向对象Python面向对象Python面向对象', 'zj', '0', '3', '1', 'courses/2019/02/python面向对象.jpg', '24', '2019-02-09 20:01:01.984127', '2019-03-16 05:56:10.147760', '8', '后端开发', 'python', null, null, null, '0'), ('6', 'Python文件处理', 'Python文件处理', '<p>&nbsp; &nbsp; Python文件处理Python文件处理Python文件处理</p>', 'gj', '0', '1', '0', 'courses/2019/02/python文件处理.jpg', '21', '2019-02-09 20:02:01.450688', '2019-03-16 16:55:44.817462', '3', '后端开发', 'python', null, '', '', '0'), ('7', 'vue入门', 'vue简单入门', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p class=\"small-title\" style=\"margin-top: 0px; margin-bottom: 7px; padding: 0px; font-size: 18px; color: rgb(13, 194, 128); line-height: 24px;\">Vue起步</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px;\"><span style=\"color: rgb(0, 0, 0);\"><strong>学习方法介绍</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px;\"><span style=\"color: rgb(0, 0, 0);\"><strong>使用Vue编写Hello World</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px;\"><span style=\"color: rgb(0, 0, 0);\"><strong>使用Vue开发TodoList</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px;\"><span style=\"color: rgb(0, 0, 0);\"><strong>MVVM设计模式</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px;\"><span style=\"color: rgb(0, 0, 0);\"><strong>前端组件化</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px;\"><span style=\"color: rgb(0, 0, 0);\"><strong>组件化思维修改TodoList</strong></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 24px;\"><span style=\"color: rgb(0, 0, 0);\"><strong>简单的父子组件传值</strong></span></p></li></ul>', 'cj', '0', '1', '2', 'courses/2019/03/5ac3142b000166ec09360316.jpg', '11', '2019-03-16 16:42:14.729155', '2019-03-16 06:01:59.669641', '4', '后端开发', 'vue', '3', '', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `courses_courseresource`
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `courses_courseresource`
-- ----------------------------
BEGIN;
INSERT INTO `courses_courseresource` VALUES ('1', 'python学习路线', 'course/resource/2019/02/Python学习路线.xmind', '2019-02-12 22:13:50.610565', '2019-02-12 22:13:50.610592', '1');
COMMIT;

-- ----------------------------
--  Table structure for `courses_lesson`
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `courses_lesson`
-- ----------------------------
BEGIN;
INSERT INTO `courses_lesson` VALUES ('1', '第一张 基本概念', '2019-02-12 21:50:37.988100', '2019-02-12 21:50:37.988198', '1'), ('2', '第二章 基本语法', '2019-02-12 21:50:48.813817', '2019-02-12 21:50:48.813847', '1'), ('3', '第三章 类和对象', '2019-02-12 21:51:21.894386', '2019-02-12 21:51:21.894421', '1'), ('4', '第一章入门', '2019-03-16 16:42:14.732207', '2019-03-16 16:42:14.732236', '7'), ('5', '第二章 基础', '2019-03-16 16:42:14.732872', '2019-03-16 16:42:14.732894', '7');
COMMIT;

-- ----------------------------
--  Table structure for `courses_video`
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `video_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `courses_video`
-- ----------------------------
BEGIN;
INSERT INTO `courses_video` VALUES ('1', '1-1 helloworld', '2019-02-12 21:52:53.625952', '2019-02-16 15:31:10.323177', '1', '/media/video/ttt.mp4', '0'), ('2', '1-2 if-else', '2019-02-12 21:53:41.379489', '2019-02-12 21:53:41.379533', '1', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_content_type`
-- ----------------------------
BEGIN;
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry'), ('3', 'auth', 'group'), ('2', 'auth', 'permission'), ('25', 'captcha', 'captchastore'), ('4', 'contenttypes', 'contenttype'), ('26', 'courses', 'bannercourse'), ('9', 'courses', 'course'), ('12', 'courses', 'courseresource'), ('10', 'courses', 'lesson'), ('11', 'courses', 'video'), ('17', 'operation', 'coursecomments'), ('16', 'operation', 'userask'), ('20', 'operation', 'usercourse'), ('18', 'operation', 'userfavorite'), ('19', 'operation', 'usermessage'), ('13', 'organization', 'citydict'), ('14', 'organization', 'courseorg'), ('15', 'organization', 'teacher'), ('5', 'sessions', 'session'), ('8', 'users', 'banner'), ('7', 'users', 'emailverifyrecord'), ('6', 'users', 'userprofile'), ('21', 'xadmin', 'bookmark'), ('24', 'xadmin', 'log'), ('22', 'xadmin', 'usersettings'), ('23', 'xadmin', 'userwidget');
COMMIT;

-- ----------------------------
--  Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `django_session`
-- ----------------------------
BEGIN;
INSERT INTO `django_session` VALUES ('78irwkpggla0mgi02a8twylowlho1mcr', 'MThjZTM2MGZhNTJhY2RiMTdhZjRhMjAwMTQ2YWRjNWZhNDY2NzllMjp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzN2YwOWNlMTI2MTRhMzExYzdjODAwY2Q5MWYxNTE2N2EyMjUyZDdkIn0=', '2019-03-30 06:00:22.080196'), ('7x51o6eoav3io80wu1zyyf82uelkpdss', 'MWM5NGI2MzYxMzE3M2IyNzhhYzMyNzg4MjU2OGM2YTQyYzNhY2M0Mzp7Il9hdXRoX3VzZXJfaGFzaCI6IjRjNjU0NjU4NWQxMTZkNWNlNjE0MjlmMmY3MTA1YzQ4ZDFkOWJmOWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjMifQ==', '2019-01-25 23:26:57.150810'), ('ciloe662masu1etvizsxfa1ej47hxew1', 'NzllZDA0YjYyOGUyYTViYmJhNGU0MjAzZDEyOWMyYWZiYTFhOWI1ODp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzY2MyNGIxNGY0MDE5MWQ2NmMwMzAwOGZiYzJhMDgzZGJjMTk1MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2019-01-10 23:48:31.569071'), ('la6k54apqgit9ey53nawa1so9o1ka3uy', 'ODE3YmQ3NDVjZTI0NDdmYjQ5YTFiMmRjMDg2NTNjZWM4ZDM1NTAyOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJvcmdhbml6YXRpb24iLCJjb3Vyc2VvcmciXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjAzY2MyNGIxNGY0MDE5MWQ2NmMwMzAwOGZiYzJhMDgzZGJjMTk1MWMiLCJfYXV0aF91c2VyX2lkIjoiMiJ9', '2019-02-17 22:47:13.473658'), ('rzcq5vxp1aruqf6b8saglcjkajyuzmf2', 'NjkyNzMzZTdlZTQwNDU0ZjI1NjkzZTgwY2NmYWRkNTg1ZTdiNGNjMzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiTElTVF9RVUVSWSI6W1siYXV0aCIsInBlcm1pc3Npb24iXSwiIl0sIl9hdXRoX3VzZXJfaGFzaCI6IjAzY2MyNGIxNGY0MDE5MWQ2NmMwMzAwOGZiYzJhMDgzZGJjMTk1MWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIn0=', '2019-02-17 14:45:01.463981');
COMMIT;

-- ----------------------------
--  Table structure for `operation_coursecomments`
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `operation_userask`
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `operation_usercourse`
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `operation_usercourse`
-- ----------------------------
BEGIN;
INSERT INTO `operation_usercourse` VALUES ('6', '', '2019-03-16 16:50:55.566896', '2019-03-16 16:50:55.566980', '7', '11'), ('7', '', '2019-03-16 05:56:07.957521', '2019-03-16 05:56:07.957552', '5', '11'), ('8', '', '2019-03-16 05:58:24.528277', '2019-03-16 05:58:24.528307', '1', '11');
COMMIT;

-- ----------------------------
--  Table structure for `operation_userfavorite`
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `operation_userfavorite`
-- ----------------------------
BEGIN;
INSERT INTO `operation_userfavorite` VALUES ('20', '5', '1', '2019-03-16 16:37:11.850156', '2019-03-16 16:37:11.850186', '11'), ('21', '7', '1', '2019-03-16 16:50:39.984196', '2019-03-16 16:50:39.984250', '11'), ('22', '7', '1', '2019-03-16 06:01:59.673998', '2019-03-16 06:01:59.674034', '12'), ('23', '4', '2', '2019-03-16 06:02:01.314032', '2019-03-16 06:02:01.314060', '12'), ('24', '6', '2', '2019-03-16 06:02:38.586658', '2019-03-16 06:02:38.586695', '12'), ('25', '1', '3', '2019-03-16 06:02:57.648863', '2019-03-16 06:02:57.648913', '12');
COMMIT;

-- ----------------------------
--  Table structure for `operation_usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `operation_usermessage`
-- ----------------------------
BEGIN;
INSERT INTO `operation_usermessage` VALUES ('4', '12', '欢迎 414820128@qq.com 注册暮雪在线网', '1', '2019-03-16 05:59:00.505528', '2019-03-16 06:01:33.617101');
COMMIT;

-- ----------------------------
--  Table structure for `organization_citydict`
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `organization_citydict`
-- ----------------------------
BEGIN;
INSERT INTO `organization_citydict` VALUES ('1', '北京市', '北京，简称“京”，是中华人民共和国省级行政区、首都、直辖市，是全国的政治、文化中心。北京地处中国华北地区，中心位于东经116°20′、北纬39°56′，东与天津毗连，其余均与河北相邻，北京市总面积16410.54平方千米', '2019-01-31 14:26:00.337607', '2019-01-31 14:26:00.337650'), ('2', '上海市', '上海，简称“沪”或“申”，是中国共产党的诞生地，是中华人民共和国省级行政区、直辖市，全国的科技、贸易、信息、金融和航运中心。', '2019-01-31 14:29:09.911203', '2019-01-31 14:29:09.911251'), ('3', '深圳市', '深圳，简称“深”，别称“鹏城”，是中国四大一线城市之一，广东省省辖市、计划单列市、副省级市、国家区域中心城市、超大城市，国务院定位的全国经济中心城市和国际化城市、国家创新型城市、国际科技产业创新中心、全球海洋中心城市、国际性综合交通枢纽，中国三大全国性金融中心之一。', '2019-01-31 14:31:32.503013', '2019-01-31 14:31:32.503067'), ('4', '广州市', '广州，简称穗，别称羊城、花城，是广东省省会、副省级市、国家中心城市、超大城市、国际大都市、国际商贸中心、国际综合交通枢纽、国家综合性门户城市，首批沿海开放城市，是南部战区司令部驻地。', '2019-01-31 14:32:05.603024', '2019-01-31 14:32:05.603132'), ('5', '天津市', '天津，简称津，是中华人民共和国省级行政区、直辖市，地处中国华北地区，东临渤海，西靠首都北京和河北，北部和南部与河北接壤，天津界于东经116 °43′-118°4′、北纬38°34′-40°15′之间。天津市总面积11916.85平方千米。', '2019-01-31 14:32:41.529420', '2019-01-31 14:32:41.529453'), ('6', '南京市', '南京，简称“宁”，古称金陵、建康，是江苏省会、副省级市、南京都市圈核心城市，国务院批复确定的中国东部地区重要的中心城市、全国重要的科研教育基地和综合交通枢纽 [1]  。全市下辖11个区，总面积6587km²，2017年建成区面积1398.69km²，常住人口833.5万人，城镇人口685.89万人，城镇化率82.3%，是长三角及华东唯一的特大城市。', '2019-01-31 20:26:16.164933', '2019-01-31 20:26:16.164997'), ('7', '杭州市', '杭州，简称“杭”，浙江省省会、副省级市、长江三角洲城市群中心城市、环杭州湾大湾区核心城市、杭州都市圈核心城市 [1]  、沪嘉杭G60科创走廊中心城市 [2]  、国际重要的电子商务中心 [3]  ，位于中国东南沿海、浙江省北部、钱塘江下游、京杭大运河南端，是浙江省的政治、经济、文化、教育、交通和金融中心。', '2019-01-31 20:48:32.516541', '2019-01-31 20:48:32.516592'), ('8', '厦门市', '美丽的城市哈哈哈哈', '2019-03-16 15:25:50.334303', '2019-03-16 15:26:01.890663'), ('9', '苏州市', '苏州，古称吴，简称为苏，又称姑苏、平江等，是国家历史文化名城和风景旅游城市，国家高新技术产业基地，长江三角洲城市群重要的中心城市之一 [1]  、G60科创走廊中心城市、扬子江城市群的重要组成部分，有“人间天堂”的美誉。', '2019-03-16 15:29:20.363925', '2019-03-16 15:29:20.363973');
COMMIT;

-- ----------------------------
--  Table structure for `organization_courseorg`
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10),
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `organization_courseorg`
-- ----------------------------
BEGIN;
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '50', '1', 'org/2019/01/imooc_Gn1sRjp.png', '北京市海淀区西三环北路甲2号院中关村', '2019-01-31 19:56:37.382242', '2019-03-16 05:58:20.077645', '1', 'pxjg', '0', '0', '知名机构'), ('2', '北京大学', '北京大学（Peking University），简称“北大”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、京港大学联盟、亚洲大学联盟、东亚研究型大学协会、国际研究型大学联盟、环太平洋大学联盟、东亚四大学', '2', '0', 'org/2019/01/bjdx.jpg', '北京市海淀区颐和园路5号', '2019-01-31 20:21:51.947299', '2019-02-28 00:10:39.838618', '1', 'gx', '0', '0', ' 知名高校'), ('3', '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、东亚研究型大学协会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉', '0', '0', 'org/2019/01/qhdx-logo.png', '北京市海淀区清华园1号', '2019-01-31 20:24:12.710093', '2019-01-31 20:24:12.710138', '1', 'gx', '0', '0', ' 知名高校'), ('4', '南京大学', '南京大学（Nanjing University），简称“南大”，是中华人民共和国教育部直属、中央直管副部级建制的综合性全国重点大学，是历史悠久、声誉卓著的百年名校。位列首批国家“双一流“世界一流大学A类建设高校、”211工程“、”985工程”，入选“珠峰计划”、“111计划”、“2011计划”、“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“卓越法律人才教育培养计划”，是九校联盟、中国大学', '0', '1', 'org/2019/01/njdx.jpg', '江苏省南京市鼓楼区汉口路22号', '2019-01-31 20:25:45.204591', '2019-03-16 06:02:01.310308', '6', 'gx', '0', '0', ' 知名高校'), ('5', '极客学院', '极客学院 [1]  是中国android开发在线学习平台，汇集了几十名国内顶尖的有多年项目和实战经验的Android开发授课大师，精心制作了上千个高质量视频教程，涵盖了Android开发学习的基础入门、中级进阶，高级提升、项目实战开发等专业的android开发课程。', '0', '0', 'org/2019/01/logo.png', '深圳珠海', '2019-01-31 20:36:02.160710', '2019-01-31 20:37:23.263784', '3', 'pxjg', '0', '0', null), ('6', '麦子学院', '麦子学院，国内第一家在美国建立商务中心的IT在线教育机构，目前已与美国知名教育公司取得合作，未来将源源不断向国内输出大量高质量教育资源', '4', '1', 'org/2019/01/麦子.jpg', '天津', '2019-01-31 20:38:03.097194', '2019-03-16 06:02:38.583140', '5', 'pxjg', '0', '0', null), ('7', '51CTO学院', '51CTO学院（又名51学院）是2013年由51CTO重磅推出的IT在线教育平台。51CTO学院汇集各类IT精品视频课程，致力于打造顶尖IT培训讲师、网络技术精品培训课程、培训自测题三位一体的网络教育特色，是国内最完善、最专业的IT在线教育平台。', '0', '0', 'org/2019/01/51.jpg', '广州某街道', '2019-01-31 20:46:33.029861', '2019-01-31 20:47:41.342580', '4', 'gr', '0', '0', null), ('8', '阿里学院', '阿里学院是阿里巴巴公司于2004年9月10日在其五周年庆典之际，宣布创办成立企业学院，这是中国互联网第一家企业学院。', '0', '1', 'org/2019/01/阿里.jpg', '杭州某地', '2019-01-31 20:48:41.364621', '2019-03-16 15:17:21.600793', '7', 'pxjg', '0', '0', null), ('9', 'mooc学院', 'MOOC学院是果壳网旗下的一个讨论MOOC（大型开放式网络课程）课程的学习社区。MOOC学院收录了主流的三大课程提供商Coursera、Udacity、edX的所有课程，并将大部分课程的课程简介翻译成中文。用户可以在MOOC学院给上过的MOOC课程点评打分，在学习的过程中和同学讨论课程问题，记录自己的上课笔记。', '0', '0', 'org/2019/01/mooc.jpg', '深圳某地', '2019-01-31 20:51:36.121475', '2019-01-31 20:51:36.121523', '3', 'gr', '0', '0', null), ('10', 'CSDN学院', 'CSDN学院是CSDN最新推出的一个面向软件开发者的IT技术职业培训平台，旨在提供优质的IT课程，创造更为方便、快捷的学习方式。自2015年1月发布至今，CSDN学院已拥有了500000+学习用户，签约了400+IT资深讲师，上线了500+优质实战课程。', '0', '0', 'org/2019/01/csdn.jpg', '南京江宁莱茵达路', '2019-01-31 20:53:23.424124', '2019-01-31 20:53:23.424149', '6', 'pxjg', '0', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `organization_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100),
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `organization_teacher`
-- ----------------------------
BEGIN;
INSERT INTO `organization_teacher` VALUES ('1', '张三', '5', '苏宁', '技术总监', '幽默', '8', '2', '2019-02-05 09:43:22.064782', '2019-03-16 06:02:57.643257', '1', 'teacher/2019/02/aobama_iZoy5Wk.png', '18'), ('2', '李四', '6', '北大', '博士生导师', '风趣', '0', '0', '2019-02-05 09:43:52.343785', '2019-02-05 22:05:07.590881', '2', 'teacher/2019/02/aobama.png', '18'), ('3', '王二', '10', '小米', '总裁', '霸气', '0', '0', '2019-03-16 16:39:24.339147', '2019-03-16 16:39:24.339183', '1', 'teacher/2019/03/default_middile_1.png', '18');
COMMIT;

-- ----------------------------
--  Table structure for `users_banner`
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users_banner`
-- ----------------------------
BEGIN;
INSERT INTO `users_banner` VALUES ('2', '渔书', 'banner/2019/03/5ab89afd00016ea009360316.jpg', 'https://coding.imooc.com/class/194.html', '100', '2019-03-16 15:13:46.705080', '2019-03-16 15:33:19.737706'), ('3', 'sringcloud微服务', 'banner/2019/03/5ac4a7940001a9aa09360316.jpg', 'https://coding.imooc.com/class/187.html', '101', '2019-03-16 15:14:53.363780', '2019-03-16 15:35:30.021449'), ('4', 'vue2.0', 'banner/2019/03/5ac3142b000166ec09360316.jpg', 'https://coding.imooc.com/class/203.html', '102', '2019-03-16 15:15:33.488781', '2019-03-16 15:34:16.134866');
COMMIT;

-- ----------------------------
--  Table structure for `users_emailverifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(20) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users_emailverifyrecord`
-- ----------------------------
BEGIN;
INSERT INTO `users_emailverifyrecord` VALUES ('13', 'JFU1', '1494570764@qq.com', 'update_email', '2019-02-17 22:28:20.190923'), ('16', '0ks89ticmOg2zlHe', 'qqqq@163.com', 'register', '2019-02-18 01:58:19.921558'), ('17', 'PwLB87oy6l0cKbSr', '414820128@qq.com', 'register', '2019-03-16 05:58:57.454263');
COMMIT;

-- ----------------------------
--  Table structure for `users_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users_userprofile`
-- ----------------------------
BEGIN;
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$hBJyBrWpnkIC$RtZdIRx35yO6nQ8lNft+d9YVO2XTnZIVheOf7i4/7V4=', '2019-01-10 22:17:00.000000', '1', 'admin', '', '', 'admin@qq.com', '1', '1', '2019-01-09 15:17:00.000000', 'admin', '2019-02-23', 'male', 'jiangsu nanjing', '', 'image/2019/02/aobama_maTw6bZ.png', '2019-01-09 15:17:33.200038', '2019-02-23 16:08:06.581987'), ('11', 'pbkdf2_sha256$24000$BnfJpntO1Otm$gBYO7xyKSnuTcQIdNHd1KMxVY7D++sCztBVEU2kKJEo=', '2019-03-16 16:52:45.275937', '1', 'lijinzhou', '', '', 'lijinzhou@qq.com', '1', '1', '2019-03-16 15:54:51.400074', 'HelloWorld', '2000-03-16', 'male', '江苏省南京市', '1377097666', 'image/2019/03/aobama_0QihdKe.png', '2019-03-16 15:54:51.504646', '2019-03-16 16:18:42.253025'), ('12', 'pbkdf2_sha256$100000$yIV0RV9cDD4v$0oWHB6BiBwIabHM3oMqGFNOOqJPv7dZ2vuSCkgRslGg=', '2019-03-16 06:00:22.078163', '0', '414820128@qq.com', '', '', '414820128@qq.com', '0', '1', '2019-03-16 05:58:57.338401', '小李', '2019-03-16', 'male', '南京江宁', '1377097666', 'image/2019/03/aobama_0QihdKe_E9nSerp.png', '2019-03-16 05:58:57.450877', '2019-03-16 06:01:27.715843');
COMMIT;

-- ----------------------------
--  Table structure for `users_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `users_userprofile_groups`
-- ----------------------------
BEGIN;
INSERT INTO `users_userprofile_groups` VALUES ('1', '1', '12');
COMMIT;

-- ----------------------------
--  Table structure for `users_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xadmin_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `xadmin_log`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `xadmin_log`
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_log` VALUES ('84', '2019-03-16 16:39:24.339993', '127.0.0.1', '3', '王二', 'create', '已添加。', '15', '11'), ('85', '2019-03-16 16:42:14.729954', '127.0.0.1', '7', 'vue入门', 'create', '已添加。', '9', '11'), ('86', '2019-03-16 16:50:07.766611', '127.0.0.1', '7', 'vue入门', 'change', '已修改 course_org 。', '9', '11'), ('87', '2019-03-16 16:53:23.152816', '127.0.0.1', '7', 'vue入门', 'change', '已修改 is_banner 。', '9', '11'), ('88', '2019-03-16 16:55:11.918646', '127.0.0.1', '6', 'Python文件处理', 'change', '已修改 is_banner 和 detail 。', '9', '11'), ('89', '2019-03-16 16:55:44.819490', '127.0.0.1', '6', 'Python文件处理', 'change', '已修改 is_banner 。', '26', '11');
COMMIT;

-- ----------------------------
--  Table structure for `xadmin_usersettings`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `xadmin_usersettings`
-- ----------------------------
BEGIN;
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1'), ('3', 'dashboard:home:pos', '', '11');
COMMIT;

-- ----------------------------
--  Table structure for `xadmin_userwidget`
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
