/*
Navicat MySQL Data Transfer

Source Server         : 测试
Source Server Version : 50087
Source Host           : localhost:3308
Source Database       : yhfwk

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-04-09 11:57:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cddjb`
-- ----------------------------
DROP TABLE IF EXISTS `cddjb`;
CREATE TABLE `cddjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) default NULL,
  `NZBH` varchar(36) default NULL,
  `CDSJ` datetime default NULL,
  `CDLX` varchar(16) default NULL,
  `CDNY` varchar(16) default NULL COMMENT '自产/轻度助产/难产(产道正常)/难产(产道拉伤)/碎胎',
  `TW` varchar(16) default NULL COMMENT '正常/坐生/倒产/人工矫正',
  `JCY` varchar(32) default NULL COMMENT '直肠/孕酮/超声/其他',
  `TESL` int(2) default NULL,
  `JBQ` varchar(16) default NULL,
  `XZR` varchar(32) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cddjb
-- ----------------------------

-- ----------------------------
-- Table structure for `fqdjb`
-- ----------------------------
DROP TABLE IF EXISTS `fqdjb`;
CREATE TABLE `fqdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) default NULL,
  `NZBH` varchar(36) default NULL,
  `FQSJ` datetime default NULL,
  `FQLX` varchar(16) default NULL COMMENT '自然发情\r\n            人工催情',
  `FXFS` varchar(16) default NULL COMMENT '人工\r\n            计步器',
  `FXR` varchar(32) default NULL,
  `SHY` varchar(32) default NULL,
  `SFPZ` int(1) default '0',
  `WPYY` varchar(128) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fqdjb
-- ----------------------------

-- ----------------------------
-- Table structure for `fqjbxx`
-- ----------------------------
DROP TABLE IF EXISTS `fqjbxx`;
CREATE TABLE `fqjbxx` (
  `XH` varchar(36) NOT NULL,
  `JBQBH` varchar(36) NOT NULL,
  `NCBH` varchar(36) NOT NULL,
  `KZQBH` varchar(36) NOT NULL,
  `KSSJ` datetime default NULL,
  `JSSJ` datetime default NULL,
  `LJXX` decimal(8,0) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fqjbxx
-- ----------------------------

-- ----------------------------
-- Table structure for `fqkzqxx`
-- ----------------------------
DROP TABLE IF EXISTS `fqkzqxx`;
CREATE TABLE `fqkzqxx` (
  `XH` varchar(36) NOT NULL,
  `KZQBH` varchar(128) default NULL,
  `NCBH` varchar(36) default NULL,
  `KZQZT` int(1) default NULL COMMENT '0：正常\r\n            1：停止\r\n            等等',
  `SFTY` int(1) default NULL COMMENT '0：正常\r\n            1：停用',
  `LJXX` varchar(128) default NULL COMMENT '数据上传和状态监控及管理的连接信息。\r\n            更多信息需要再次确认',
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fqkzqxx
-- ----------------------------

-- ----------------------------
-- Table structure for `fqtsxx`
-- ----------------------------
DROP TABLE IF EXISTS `fqtsxx`;
CREATE TABLE `fqtsxx` (
  `XH` varchar(36) NOT NULL,
  `JBQBH` varchar(16) default NULL,
  `NCBH` varchar(16) default NULL,
  `NZBH` varchar(16) default NULL,
  `NSBH` varchar(16) default NULL,
  `TSLX` varchar(16) default NULL COMMENT '发情提示 运动量下降提示',
  `TSMS` varchar(128) default NULL,
  `SFFQ` int(1) default '0' COMMENT '0：未发情\r\n            1：已发情',
  `JCR` varchar(16) default NULL,
  `JCSJ` datetime default NULL,
  `JCJG` varchar(128) default NULL,
  `ZJPZSJ` datetime default NULL,
  `SFPZ` int(1) default NULL COMMENT '0：未配种\r\n            1：已配种',
  `PZR` varchar(16) default NULL,
  `PZSJ` datetime default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fqtsxx
-- ----------------------------

-- ----------------------------
-- Table structure for `gtcndjb`
-- ----------------------------
DROP TABLE IF EXISTS `gtcndjb`;
CREATE TABLE `gtcndjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(16) default NULL,
  `NZBH` varchar(16) default NULL,
  `JNRQ` datetime default NULL,
  `BC` varchar(16) default NULL,
  `CL` decimal(10,0) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gtcndjb
-- ----------------------------

-- ----------------------------
-- Table structure for `jbdjb`
-- ----------------------------
DROP TABLE IF EXISTS `jbdjb`;
CREATE TABLE `jbdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(16) default NULL,
  `NZBH` varchar(16) default NULL,
  `FBRQ` datetime default NULL,
  `JBZL` varchar(16) default NULL,
  `JBMC` varchar(16) default NULL,
  `ZYZZ` varchar(16) default NULL,
  `FBYY` varchar(16) default NULL,
  `YZCD` varchar(16) default NULL,
  `CZQK` varchar(32) default NULL,
  `FSQN` char(1) default NULL COMMENT '1是\r\n            0否',
  `YYRQ` datetime default NULL,
  `YFLJ` decimal(10,2) default NULL,
  `YYCS` decimal(3,0) default NULL,
  `JSXYRQ` datetime default NULL,
  `SYS` varchar(32) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbdjb
-- ----------------------------

-- ----------------------------
-- Table structure for `jsxxb`
-- ----------------------------
DROP TABLE IF EXISTS `jsxxb`;
CREATE TABLE `jsxxb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) NOT NULL,
  `JSBH` varchar(16) NOT NULL,
  `JSMC` varchar(64) default NULL,
  `JSLB` varchar(16) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jsxxb
-- ----------------------------

-- ----------------------------
-- Table structure for `lcdjb`
-- ----------------------------
DROP TABLE IF EXISTS `lcdjb`;
CREATE TABLE `lcdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) default NULL,
  `NZBH` varchar(36) default NULL,
  `LCRQ` datetime default NULL,
  `LCYY` varchar(16) default NULL,
  `TELX` varchar(16) default NULL,
  `FXR` varchar(32) default NULL,
  `FXFS` varchar(16) default NULL,
  `HSR` varchar(32) default NULL,
  `LCZR` varchar(32) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lcdjb
-- ----------------------------

-- ----------------------------
-- Table structure for `ncjbxxb`
-- ----------------------------
DROP TABLE IF EXISTS `ncjbxxb`;
CREATE TABLE `ncjbxxb` (
  `NCBH` varchar(36) NOT NULL,
  `NCMC` varchar(128) default NULL,
  `NCXZ` varchar(16) default NULL,
  `NCDZ` varchar(128) default NULL,
  `SSQY` varchar(128) default NULL,
  `SNQY` varchar(128) default NULL,
  `FZR` varchar(16) default NULL,
  `FZRDH` varchar(16) default NULL,
  `LXR` varchar(16) default NULL,
  `LXRDH` varchar(16) default NULL,
  `PZY` varchar(16) default NULL,
  `FQXTSYBZ` char(1) default NULL,
  `KSSYSJ` datetime default NULL,
  `TZSYSJ` datetime default NULL,
  `PZYDH` varchar(16) default NULL,
  `LXYX` varchar(64) default NULL,
  `KDDZ` varchar(128) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`NCBH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ncjbxxb
-- ----------------------------

-- ----------------------------
-- Table structure for `nzjbxx`
-- ----------------------------
DROP TABLE IF EXISTS `nzjbxx`;
CREATE TABLE `nzjbxx` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) NOT NULL,
  `NZBH` varchar(16) NOT NULL,
  `EBBH` varchar(16) NOT NULL,
  `JBQBH` varchar(16) default NULL,
  `CSRQ` datetime default NULL,
  `XB` int(1) NOT NULL default '0',
  `LB` varchar(5) default NULL,
  `RQLX` char(2) default NULL,
  `YL` decimal(3,2) default NULL,
  `CSZ` decimal(10,2) default NULL,
  `JS` varchar(36) NOT NULL,
  `PZ` varchar(16) default NULL,
  `MS` varchar(16) default NULL,
  `TC` decimal(3,0) default NULL,
  `CDRQ` datetime default NULL,
  `FQH` varchar(36) default NULL,
  `MQH` varchar(36) default NULL,
  `MRZT` char(2) default NULL,
  `FZZT` char(2) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nzjbxx
-- ----------------------------

-- ----------------------------
-- Table structure for `nzlcdjb`
-- ----------------------------
DROP TABLE IF EXISTS `nzlcdjb`;
CREATE TABLE `nzlcdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) default NULL,
  `NZBH` varchar(36) default NULL,
  `PZ` varchar(16) default NULL,
  `JS` varchar(36) default NULL,
  `NL` varchar(16) default NULL,
  `LQRQ` datetime default NULL,
  `LQLX` varchar(16) default NULL,
  `LQTZ` decimal(10,0) default NULL,
  `LQYY` varchar(128) default NULL,
  `QX` varchar(128) default NULL,
  `JSR` varchar(32) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nzlcdjb
-- ----------------------------

-- ----------------------------
-- Table structure for `nzzsdjb`
-- ----------------------------
DROP TABLE IF EXISTS `nzzsdjb`;
CREATE TABLE `nzzsdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) NOT NULL,
  `NZBH` varchar(16) NOT NULL,
  `ZSRQ` datetime NOT NULL,
  `ZCJS` varchar(36) NOT NULL,
  `ZRJS` varchar(36) NOT NULL,
  `JSR` varchar(32) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nzzsdjb
-- ----------------------------

-- ----------------------------
-- Table structure for `pzdjb`
-- ----------------------------
DROP TABLE IF EXISTS `pzdjb`;
CREATE TABLE `pzdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) default NULL,
  `NZBH` varchar(36) default NULL,
  `PZSJ` datetime default NULL,
  `DJBH` varchar(16) default NULL,
  `DJLX` varchar(16) default NULL,
  `PZY` varchar(32) default NULL,
  `FQSJ` datetime default NULL,
  `FQLX` varchar(16) default NULL,
  `FXFS` varchar(32) default NULL,
  `FXR` varchar(32) default NULL,
  `SL` decimal(8,0) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pzdjb
-- ----------------------------

-- ----------------------------
-- Table structure for `rsjcdjb`
-- ----------------------------
DROP TABLE IF EXISTS `rsjcdjb`;
CREATE TABLE `rsjcdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) default NULL,
  `NZBH` varchar(36) default NULL,
  `JCRQ` datetime default NULL,
  `JCLX` varchar(16) default NULL COMMENT '初检\r\n            复检',
  `JCJG` varchar(64) default NULL COMMENT '人工\r\n            计步器',
  `JCY` varchar(32) default NULL,
  `JCFS` varchar(16) default NULL COMMENT '直肠/孕酮/超声/其他',
  `TSZT` varchar(16) default NULL,
  `NZXB` int(1) default '2' COMMENT '0母1公2未确认',
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rsjcdjb
-- ----------------------------

-- ----------------------------
-- Table structure for `xtcl`
-- ----------------------------
DROP TABLE IF EXISTS `xtcl`;
CREATE TABLE `xtcl` (
  `DMID` varchar(36) NOT NULL,
  `DMLB` varchar(64) default NULL,
  `DMBH` varchar(64) default NULL,
  `DMMC` varchar(64) default NULL,
  `SRDM` varchar(64) default NULL,
  `DMMS` varchar(64) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`DMID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xtcl
-- ----------------------------

-- ----------------------------
-- Table structure for `xxtsgl`
-- ----------------------------
DROP TABLE IF EXISTS `xxtsgl`;
CREATE TABLE `xxtsgl` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) default NULL,
  `SJHM` varchar(16) default NULL,
  `TSLX` varchar(8) default NULL COMMENT '包括发情提示、最佳配种时间提示、运动量下降提示、定胎提示等',
  `TSNR` varchar(128) default NULL COMMENT '4、	发情提示信息(牛只编号、牛舍、发情描述、发情检测：是否发情—检测人—检测时间【选择确认发情后，根据发情描述时间推算最佳配种时间并提示。发情后8-12小时配种时间最佳】、配种：是否配种—配种人—配种时间)\r\n            运动量下降提示信息(牛只编号、牛舍、描述、检测结果、检测时间、检测人)\r\n            ',
  `SFTS` int(1) default '0' COMMENT '0：未提示\r\n            1：已提示',
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xxtsgl
-- ----------------------------

-- ----------------------------
-- Table structure for `ygxxb`
-- ----------------------------
DROP TABLE IF EXISTS `ygxxb`;
CREATE TABLE `ygxxb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(16) default NULL,
  `YGBH` varchar(16) default NULL,
  `YGMC` varchar(32) default NULL,
  `ZJHM` varchar(32) default NULL,
  `LXDH` varchar(32) default NULL,
  `LXDZ` varchar(128) default NULL,
  `YGLB` char(1) default NULL,
  `SCBZ` int(1) NOT NULL default '0' COMMENT '0：未删除\r\n            1：已删除',
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ygxxb
-- ----------------------------

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
INSERT INTO `yh_system_menus` VALUES ('16', '系统管理', null, '#', '1', '0', '', '100', '1');
INSERT INTO `yh_system_menus` VALUES ('26', '角色管理', null, null, '1', '1', '16', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('25', '菜单管理', null, '/master/system/menu!AllMenus.action', '1', '2', '23', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('30', '角色管理', null, '/master/system/role!listRoles.action', '1', '2', '26', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('7f5f3ec0-7120-4a35-86ff-022d1a08d7b3', '基础数据', null, '#', '1', '0', '', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('ada29240-f710-4b5f-b1e4-769bd5216ac8', '牧场管理', null, '#', '1', '1', '7f5f3ec0-7120-4a35-86ff-022d1a08d7b3', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('f6d14b1b-f915-4c1a-aa14-c5e772ebff2b', '牧场信息', null, '/admin/pages/ncgl/index.jsp', '1', '2', 'ada29240-f710-4b5f-b1e4-769bd5216ac8', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('ee9abbe4-98a1-4daa-9a32-168d44d44875', '牛只管理', null, '#', '1', '0', '', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('7fdd1f2a-f0ea-48ef-a622-353a7f20aff8', '牛只管理', null, '#', '1', '1', 'ee9abbe4-98a1-4daa-9a32-168d44d44875', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('03cfe1fc-2215-477d-8c52-028185a518b8', '牛只基本信息', null, '/admin/pages/nopage.jsp', '1', '2', '7fdd1f2a-f0ea-48ef-a622-353a7f20aff8', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('2124e606-2184-4d92-af67-fee9e292fe57', '牛只转舍记录', null, '/admin/pages/nopage.jsp', '1', '2', '7fdd1f2a-f0ea-48ef-a622-353a7f20aff8', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('dfc0b7c9-753b-4699-bc31-955a2b5ab754', '牛只离场记录', null, '/admin/pages/nopage.jsp', '1', '2', '7fdd1f2a-f0ea-48ef-a622-353a7f20aff8', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('6c85bfb9-87bc-4314-aede-04050c1e14eb', '发情管理', null, '#', '1', '0', '', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('1db91c40-1bac-4a21-a51d-93ca9313abf5', '发情管理', null, '#', '1', '1', '6c85bfb9-87bc-4314-aede-04050c1e14eb', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('775f12d4-7398-47cc-99d3-a3f5252a2cde', '发情信息管理', null, '/admin/pages/nopage.jsp', '1', '2', '1db91c40-1bac-4a21-a51d-93ca9313abf5', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('664e9af6-44d1-40f7-a90c-593c0df30be2', '繁殖管理', null, '#', '1', '0', '', '3', '1');
INSERT INTO `yh_system_menus` VALUES ('344b6e6f-b9f2-404f-a9f6-e7bdfefa9709', '繁殖管理', null, '#', '1', '1', '664e9af6-44d1-40f7-a90c-593c0df30be2', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('363f04b6-998b-4ff6-b9a7-eda518000d2b', '发情登记', null, '/admin/pages/nopage.jsp', '1', '2', '344b6e6f-b9f2-404f-a9f6-e7bdfefa9709', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('f5ccef47-db94-4586-93bd-9b1386a7a1b5', '配种登记', null, '/admin/pages/nopage.jsp', '1', '2', '344b6e6f-b9f2-404f-a9f6-e7bdfefa9709', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('2e112434-6820-4edb-9c05-850db98ba8a1', '妊检登记', null, '/admin/pages/nopage.jsp', '1', '2', '344b6e6f-b9f2-404f-a9f6-e7bdfefa9709', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('48afcc5c-e687-4daf-9c4a-69860f801881', '产犊登记', null, '/admin/pages/nopage.jsp', '1', '2', '344b6e6f-b9f2-404f-a9f6-e7bdfefa9709', '3', '1');
INSERT INTO `yh_system_menus` VALUES ('e764ad0b-6c22-42bc-96a8-98a9a526eb5a', '流产登记', null, '/admin/pages/nopage.jsp', '1', '2', '344b6e6f-b9f2-404f-a9f6-e7bdfefa9709', '4', '1');
INSERT INTO `yh_system_menus` VALUES ('489b6e7f-fbc6-4280-ba38-594f08ae69a4', '产奶管理', null, '#', '1', '0', '', '4', '1');
INSERT INTO `yh_system_menus` VALUES ('4c5ca112-e24f-4922-b495-0192cf819cb7', '产奶管理', null, '#', '1', '1', '489b6e7f-fbc6-4280-ba38-594f08ae69a4', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('5b2e72d9-1b7e-4649-95f1-e4c83f74ffe0', '个体产奶登记', null, '/admin/pages/nopage.jsp', '1', '2', '4c5ca112-e24f-4922-b495-0192cf819cb7', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('855a0784-8f59-4c76-a711-331fdce82c01', '兽医保健', null, '#', '1', '0', '', '5', '1');
INSERT INTO `yh_system_menus` VALUES ('ccd14723-924c-4bc3-b06d-fc5ca0e3fb39', '疾病管理', null, '#', '1', '1', '855a0784-8f59-4c76-a711-331fdce82c01', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('baa7a720-08f7-47d8-9fa9-bd152a96b9cd', '疾病登记', null, '/admin/pages/nopage.jsp', '1', '2', 'ccd14723-924c-4bc3-b06d-fc5ca0e3fb39', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('ae30a5d6-e7ce-402b-8389-b1cf825b60fb', '圈舍管理', null, '#', '1', '1', '7f5f3ec0-7120-4a35-86ff-022d1a08d7b3', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('550df218-7f5b-4651-80a7-8fcdbe17a981', '圈舍信息', null, '/admin/pages/nopage.jsp', '1', '2', 'ae30a5d6-e7ce-402b-8389-b1cf825b60fb', '0', '1');

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
INSERT INTO `yh_system_roles` VALUES ('b05f9a5d-10c7-466f-833a-3ab9928fefad', '超级管理员', null, '7f5f3ec0-7120-4a35-86ff-022d1a08d7b3,ee9abbe4-98a1-4daa-9a32-168d44d44875,6c85bfb9-87bc-4314-aede-04050c1e14eb,664e9af6-44d1-40f7-a90c-593c0df30be2,489b6e7f-fbc6-4280-ba38-594f08ae69a4,855a0784-8f59-4c76-a711-331fdce82c01,16', '0', null, '1', '0');

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
INSERT INTO `yh_system_users` VALUES ('9507c1e6-f974-4891-9f3c-30910a733d6b', '管理员', 'admin', '8f54eee04c13e5e09204f259bfa126fa6d2aeee87447918bdc8a6b9d6e13750b', null, '0', 'b05f9a5d-10c7-466f-833a-3ab9928fefad', null, '2015-04-09 11:15:19', '2015-04-09 11:32:59');

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

-- ----------------------------
-- Table structure for `yyjlb`
-- ----------------------------
DROP TABLE IF EXISTS `yyjlb`;
CREATE TABLE `yyjlb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(16) default NULL,
  `NZBH` varchar(16) default NULL,
  `YYCS` decimal(3,0) default NULL,
  `YYRQ` datetime default NULL,
  `YYSY` varchar(32) default NULL,
  `YYFF` varchar(32) default NULL,
  `YPMC` varchar(64) default NULL,
  `YPGG` varchar(16) default NULL,
  `YPDW` varchar(16) default NULL,
  `YPDJ` decimal(10,2) default NULL,
  `YPSL` decimal(3,0) default NULL,
  `YPFY` decimal(10,2) default NULL,
  `XYQ` varchar(16) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yyjlb
-- ----------------------------
