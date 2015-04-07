/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : yhfwk

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-03-02 21:59:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `yh_system_menus`
-- ----------------------------
DROP TABLE IF EXISTS `yh_system_menus`;
CREATE TABLE `yh_system_menus` (
  `FBM_ID` varchar(36) NOT NULL default '' COMMENT '菜单ID',
  `FBM_NAME` varchar(24) default NULL COMMENT '菜单名称',
  `FBM_TITLE` varchar(24) default NULL COMMENT '菜单标题',
  `FBM_ACTION` varchar(128) default NULL COMMENT '菜单链接',
  `FBM_STATUS` int(11) default NULL COMMENT '菜单状态',
  `FBM_LEVEL` int(11) default NULL COMMENT '菜单等级',
  `FBM_PARENTID` varchar(36) default NULL COMMENT '上一级菜单',
  `FBM_SEQ` int(11) default NULL COMMENT '排序',
  `FBM_TYPE` int(1) default NULL COMMENT '菜单类型',
  PRIMARY KEY  (`FBM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_menus
-- ----------------------------
INSERT INTO `yh_system_menus` VALUES ('23', '菜单管理', null, null, '1', '1', '16', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('16', '系统管理', null, '#', '1', '0', '', '9', '1');
INSERT INTO `yh_system_menus` VALUES ('26', '角色管理', null, null, '1', '1', '16', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('25', '菜单管理', null, '/master/system/menu!AllMenus.action', '1', '2', '23', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('30', '角色管理', null, '/master/system/role!listRoles.action', '1', '2', '26', '0', '1');

-- ----------------------------
-- Table structure for `yh_system_roles`
-- ----------------------------
DROP TABLE IF EXISTS `yh_system_roles`;
CREATE TABLE `yh_system_roles` (
  `R_ID` varchar(36) NOT NULL default '',
  `R_Name` varchar(36) default NULL,
  `R_ICO` varchar(36) default NULL,
  `R_MIDS` text,
  `R_STATUS` int(1) default NULL,
  `R_REMARK` text,
  `R_TypeID` int(1) default NULL,
  `R_DefaultStatus` int(1) default '0' COMMENT '角色默认，当角色存在多个的时候注册用户默认的角色权限',
  PRIMARY KEY  (`R_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_roles
-- ----------------------------
INSERT INTO `yh_system_roles` VALUES ('b05f9a5d-10c7-466f-833a-3ab9928fefad', '超级管理员', null, '16', '0', null, '1', '0');

-- ----------------------------
-- Table structure for `yh_system_users`
-- ----------------------------
DROP TABLE IF EXISTS `yh_system_users`;
CREATE TABLE `yh_system_users` (
  `U_ID` varchar(36) NOT NULL COMMENT '用户ID',
  `U_NAME` varchar(50) NOT NULL COMMENT '用户昵称',
  `U_LOGINNAME` varchar(36) NOT NULL,
  `U_PASSWORD` varchar(128) NOT NULL COMMENT '用户密码',
  `U_FACEIMAGE` varchar(255) default NULL COMMENT '用户头像',
  `U_TYPE` int(1) NOT NULL default '0' COMMENT '用户类型，0为普通用户 1为企业用户',
  `U_RULEID` varchar(36) NOT NULL COMMENT '用户角色ID',
  `U_Tid` varchar(36) default NULL COMMENT '主体外键ID，目前主要做关联企业使用',
  `U_lASTIME` datetime default NULL,
  `U_NOWTIME` datetime default NULL,
  PRIMARY KEY  (`U_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_users
-- ----------------------------
INSERT INTO `yh_system_users` VALUES ('9507c1e6-f974-4891-9f3c-30910a733d6b', '管理员', 'admin', '8f54eee04c13e5e09204f259bfa126fa6d2aeee87447918bdc8a6b9d6e13750b', null, '0', 'b05f9a5d-10c7-466f-833a-3ab9928fefad', null, '2015-03-02 21:53:39', '2015-03-02 21:57:52');

-- ----------------------------
-- Table structure for `yh_system_users_info`
-- ----------------------------
DROP TABLE IF EXISTS `yh_system_users_info`;
CREATE TABLE `yh_system_users_info` (
  `U_ID` varchar(36) NOT NULL default '',
  `U_SEX` int(1) default '0' COMMENT '1=男，2=女',
  `U_PHONENUM` varchar(20) default NULL,
  `U_IDNAME` varchar(20) default NULL,
  `U_IDNUM` varchar(20) default NULL,
  `U_DISTRICTID` varchar(10) default NULL,
  `U_EMAIL` varchar(100) default NULL,
  `U_INTEGRITY` double NOT NULL default '0',
  PRIMARY KEY  (`U_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_users_info
-- ----------------------------
