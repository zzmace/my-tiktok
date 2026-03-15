/*
Navicat MySQL Data Transfer

Source Server         : lucky-journey
Source Server Version : 50740
Source Host           : 101.35.228.84:3306
Source Database       : lucky-journey

Target Server Type    : MYSQL
Target Server Version : 50740
File Encoding         : 65001

Date: 2023-11-07 22:00:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for captcha
-- ----------------------------
DROP TABLE IF EXISTS `captcha`;
CREATE TABLE `captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_key` varchar(255) DEFAULT NULL,
  `format` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for favorites
-- ----------------------------
DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of favorites
-- ----------------------------
INSERT INTO `favorites` VALUES ('4', '默认收藏夹', 'dawdawd', '1', '0', '2023-11-02 00:16:02', '2023-11-02 00:49:13');

-- ----------------------------
-- Table structure for favorites_video
-- ----------------------------
DROP TABLE IF EXISTS `favorites_video`;
CREATE TABLE `favorites_video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `favorites_id` bigint(20) NOT NULL,
  `video_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_f_id_v_id_u_id` (`favorites_id`,`video_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `follow_id` bigint(20) NOT NULL,
  `gmt_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_user_id_follow_id` (`user_id`,`follow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `p_id` bigint(11) DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_menu` tinyint(2) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '1',
  `state` tinyint(4) DEFAULT '0',
  `is_deleted` tinyint(4) DEFAULT '0',
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '0', null, null, 'fa fa-align-justify', '业务管理', '-1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('3', '1', '', '', 'fa fa-user', '用户管理', '-1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('4', '3', '', 'page/user-table.html', 'fa fa-user-o', '用户', '0', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('32', '0', '', '', 'fa fa-gears', '系统设置', '-1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('73', '32', '', '', 'fa fa-shield', '权限管理', '-1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('74', '73', 'permission:list', 'page/permission.html', 'fa fa-shield', '权限', '0', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('75', '74', 'permission:add', '', 'fa fa-save', '添加权限', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('76', '74', 'permission:update', '', 'fa fa-gear', '修改权限', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('77', '74', 'permission:delete', '', 'fa fa-remove', '删除权限', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('78', '74', 'permission:treeSelect', '', 'fa fa-list', '树形下拉选择框', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('79', '74', 'permission:treeList', '', 'fa fa-tree', '树形', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('80', '73', 'role:list', 'page/role.html', 'fa fa-user-circle', '角色管理', '0', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('81', '80', 'role:add', '', 'fa fa-save', '添加角色', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('82', '80', 'role:update', '', 'fa fa-gear', '修改角色', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('84', '80', 'role:delete', '', 'fa fa-remove', '删除角色', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('85', '80', 'role:authority', '', 'fa fa-user-secret', '分配权限', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('86', '80', 'role:getPermission', '', 'fa fa-info', '获取角色权限', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('87', '89', 'role:getRole', '', 'fa fa-info', '获取用户角色', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('88', '89', 'role:initRole', '', 'fa fa-user-o', '获取角色', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('89', '73', 'user:list', 'page/user-role.html', 'fa fa-user-o', '分配角色', '0', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('91', '89', 'user:assignRole', '', 'fa fa-info', '分配用户角色', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('92', '4', 'user:update', '', 'fa fa-gear', '编辑用户', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('93', '4', 'user:delete', '', 'fa fa-remove', '删除用户', '1', '_self', '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('109', '4', 'admin:user:list', '', 'fa fa-500px', '用户列表', '1', null, '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('110', '4', 'admin:user:page', '', 'fa fa-500px', '用户角色信息', '1', null, '5', '0', '0', null, null);
INSERT INTO `permission` VALUES ('111', '1', '', '', 'fa fa-file-video-o', '视频', '-1', null, '2', '0', '0', '2023-10-29 13:02:31', '2023-10-29 13:03:45');
INSERT INTO `permission` VALUES ('112', '111', 'admin:video:page', 'page/video/video.html', 'fa fa-file-video-o', '视频', '0', null, '2', '0', '0', '2023-10-29 13:03:35', '2023-10-29 13:13:55');
INSERT INTO `permission` VALUES ('113', '112', 'admin:video:delete', '', 'fa fa-remove', '删除视频', '1', null, '1', '0', '0', '2023-10-29 13:04:29', '2023-10-29 13:04:29');
INSERT INTO `permission` VALUES ('114', '112', 'admin:video:get', '', 'fa fa-info', '获取视频', '1', null, '1', '0', '0', '2023-10-29 13:04:46', '2023-10-29 13:04:46');
INSERT INTO `permission` VALUES ('115', '1', '', 'page/video/type.html', 'fa fa-align-center', '分类', '-1', null, '1', '0', '0', '2023-11-03 22:03:36', '2023-11-03 22:03:36');
INSERT INTO `permission` VALUES ('116', '115', 'admin:type:get', '', 'fa ', '查看分类详情', '1', null, '1', '0', '0', '2023-11-03 22:04:04', '2023-11-03 22:04:04');
INSERT INTO `permission` VALUES ('118', '115', 'admin:type:add', '', 'fa ', '添加分类', '1', null, '1', '0', '0', '2023-11-03 22:04:41', '2023-11-03 22:04:41');
INSERT INTO `permission` VALUES ('119', '115', 'admin:type:update', '', 'fa ', '修改分类', '1', null, '1', '0', '0', '2023-11-03 22:04:53', '2023-11-03 22:04:53');
INSERT INTO `permission` VALUES ('120', '115', 'admin:type:delete', '', 'fa ', '删除分类', '1', null, '1', '0', '0', '2023-11-03 22:05:04', '2023-11-03 22:05:04');
INSERT INTO `permission` VALUES ('121', '115', 'admin:type:page', '', 'fa fa-align-center', '分页查询分类', '1', null, '1', '0', '0', '2023-11-03 22:09:25', '2023-11-03 22:09:25');
INSERT INTO `permission` VALUES ('122', '32', '', 'page/setting.html', 'fa fa-cog', '系统配置', '-1', null, '1', '0', '0', '2023-11-04 19:24:45', '2023-11-04 19:57:46');
INSERT INTO `permission` VALUES ('123', '122', 'admin:setting:update', '', 'fa ', '修改配置', '1', null, '1', '0', '0', '2023-11-04 19:58:00', '2023-11-04 19:58:00');
INSERT INTO `permission` VALUES ('124', '122', 'admin:setting:get', '', 'fa ', '获取配置', '1', null, '1', '0', '0', '2023-11-04 19:58:16', '2023-11-04 19:58:16');
INSERT INTO `permission` VALUES ('125', '112', 'admin:video:violations', '', 'fa ', '下架视频', '1', null, '1', '0', '0', '2023-11-06 19:56:50', '2023-11-06 19:56:50');
INSERT INTO `permission` VALUES ('126', '32', 'admin:video:statistics', '', 'fa ', '首页', '1', null, '1', '0', '0', '2023-11-07 13:36:33', '2023-11-07 13:36:33');



-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;


-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', null);
INSERT INTO `role` VALUES ('16', '审核员', '');


-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(11) DEFAULT NULL,
  `role_id` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1513 DEFAULT CHARSET=utf8mb4;


-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1467', '1', '16');
INSERT INTO `role_permission` VALUES ('1468', '111', '16');
INSERT INTO `role_permission` VALUES ('1469', '112', '16');
INSERT INTO `role_permission` VALUES ('1470', '113', '16');
INSERT INTO `role_permission` VALUES ('1471', '114', '16');
INSERT INTO `role_permission` VALUES ('1472', '125', '16');
INSERT INTO `role_permission` VALUES ('1473', '1', '1');
INSERT INTO `role_permission` VALUES ('1474', '3', '1');
INSERT INTO `role_permission` VALUES ('1475', '4', '1');
INSERT INTO `role_permission` VALUES ('1476', '92', '1');
INSERT INTO `role_permission` VALUES ('1477', '93', '1');
INSERT INTO `role_permission` VALUES ('1478', '109', '1');
INSERT INTO `role_permission` VALUES ('1479', '110', '1');
INSERT INTO `role_permission` VALUES ('1480', '111', '1');
INSERT INTO `role_permission` VALUES ('1481', '112', '1');
INSERT INTO `role_permission` VALUES ('1482', '113', '1');
INSERT INTO `role_permission` VALUES ('1483', '114', '1');
INSERT INTO `role_permission` VALUES ('1484', '125', '1');
INSERT INTO `role_permission` VALUES ('1485', '115', '1');
INSERT INTO `role_permission` VALUES ('1486', '116', '1');
INSERT INTO `role_permission` VALUES ('1487', '118', '1');
INSERT INTO `role_permission` VALUES ('1488', '119', '1');
INSERT INTO `role_permission` VALUES ('1489', '120', '1');
INSERT INTO `role_permission` VALUES ('1490', '121', '1');
INSERT INTO `role_permission` VALUES ('1491', '32', '1');
INSERT INTO `role_permission` VALUES ('1492', '73', '1');
INSERT INTO `role_permission` VALUES ('1493', '74', '1');
INSERT INTO `role_permission` VALUES ('1494', '75', '1');
INSERT INTO `role_permission` VALUES ('1495', '76', '1');
INSERT INTO `role_permission` VALUES ('1496', '77', '1');
INSERT INTO `role_permission` VALUES ('1497', '78', '1');
INSERT INTO `role_permission` VALUES ('1498', '79', '1');
INSERT INTO `role_permission` VALUES ('1499', '80', '1');
INSERT INTO `role_permission` VALUES ('1500', '81', '1');
INSERT INTO `role_permission` VALUES ('1501', '82', '1');
INSERT INTO `role_permission` VALUES ('1502', '84', '1');
INSERT INTO `role_permission` VALUES ('1503', '85', '1');
INSERT INTO `role_permission` VALUES ('1504', '86', '1');
INSERT INTO `role_permission` VALUES ('1505', '89', '1');
INSERT INTO `role_permission` VALUES ('1506', '87', '1');
INSERT INTO `role_permission` VALUES ('1507', '88', '1');
INSERT INTO `role_permission` VALUES ('1508', '91', '1');
INSERT INTO `role_permission` VALUES ('1509', '122', '1');
INSERT INTO `role_permission` VALUES ('1510', '123', '1');
INSERT INTO `role_permission` VALUES ('1511', '124', '1');
INSERT INTO `role_permission` VALUES ('1512', '126', '1');


-- ----------------------------
-- Table structure for sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting` (
  `id` int(11) NOT NULL,
  `audit_policy` longtext,
  `hot_limit` double NOT NULL DEFAULT '1000',
  `audit_open` tinyint(4) DEFAULT '0' COMMENT '审核开关,0为关，1为开',
  `allow_ip` varchar(255) DEFAULT NULL,
  `auth` tinyint(4) DEFAULT '1' COMMENT '回源鉴权开关,0关闭，1开启,默认为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `sys_setting` VALUES ('1', '{\"successScore\":{\"minPulp\":\"0.1\",\"maxPulp\":\"0.9999\",\"minTerror\":\"0.1\",\"maxTerror\":\"0.9999\",\"minPolitician\":\"0.1\",\"maxPolitician\":\"0.9999\",\"auditStatus\":\"0\"},\"manualScore\":{\"minPulp\":\"0\",\"maxPulp\":\"0\",\"minTerror\":\"0\",\"maxTerror\":\"0\",\"minPolitician\":\"0\",\"maxPolitician\":\"0\",\"auditStatus\":\"3\"},\"passScore\":{\"minPulp\":\"0\",\"maxPulp\":\"0\",\"minTerror\":\"0\",\"maxTerror\":\"0\",\"minPolitician\":\"0\",\"maxPolitician\":\"0\",\"auditStatus\":\"2\"}}', '500', '1', 'http://127.0.0.1:5378/,http://luckjourney.liuscraft.top/', '1');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `open` tinyint(1) DEFAULT '0',
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `label_names` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `nick_name` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT '',
  `sex` tinyint(1) DEFAULT '1',
  `avatar` varchar(255) DEFAULT '',
  `default_favorites_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT '0',
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;


-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin@xhyovo.cn', 'admin', '123456', '没啥描述', '0', '', '4', null, null, '2023-11-07 17:16:51');


-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(255) DEFAULT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('329', '16', '3');

-- ----------------------------
-- Table structure for user_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `user_subscribe`;
CREATE TABLE `user_subscribe` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1721890281139326984 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for video
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `yv` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL COMMENT '类别id',
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公开/私密，0：公开，1：私密，默认为0',
  `cover` varchar(255) DEFAULT NULL,
  `audit_status` int(11) NOT NULL,
  `msg` varchar(255) DEFAULT NULL,
  `audit_queue_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '审核队列状态',
  `start_count` bigint(20) DEFAULT '0',
  `share_count` bigint(20) DEFAULT '0',
  `history_count` bigint(20) DEFAULT '0',
  `favorites_count` bigint(20) DEFAULT '0',
  `label_names` varchar(255) DEFAULT NULL,
  `video_type` varchar(20) DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '逻辑删除，0：未删除，1：删除，默认为0',
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4817 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for video_share
-- ----------------------------
DROP TABLE IF EXISTS `video_share`;
CREATE TABLE `video_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `video_id` bigint(20) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_video_id_ip` (`video_id`,`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for video_star
-- ----------------------------
DROP TABLE IF EXISTS `video_star`;
CREATE TABLE `video_star` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `video_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_video_id_user_id` (`video_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for video_type
-- ----------------------------
DROP TABLE IF EXISTS `video_type`;
CREATE TABLE `video_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `video_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `gmt_created` datetime DEFAULT NULL,
  `gmt_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
