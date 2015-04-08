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


DROP TABLE IF EXISTS CDDJB;

DROP TABLE IF EXISTS FQDJB;

DROP TABLE IF EXISTS FQJBXX;

DROP TABLE IF EXISTS FQKZQXX;

DROP TABLE IF EXISTS FQTSXX;

DROP TABLE IF EXISTS GTCNDJB;

DROP TABLE IF EXISTS JBDJB;

DROP TABLE IF EXISTS JSXXB;

DROP TABLE IF EXISTS LCDJB;

DROP TABLE IF EXISTS NCJBXXB;

DROP TABLE IF EXISTS NZJBXX;

DROP TABLE IF EXISTS NZLCDJB;

DROP TABLE IF EXISTS NZZSDJB;

DROP TABLE IF EXISTS PZDJB;

DROP TABLE IF EXISTS RSJCDJB;

DROP TABLE IF EXISTS XTCL;

DROP TABLE IF EXISTS XXTSGL;

DROP TABLE IF EXISTS YGXXB;

DROP TABLE IF EXISTS YYJLB;

/*==============================================================*/
/* Table: CDDJB                                                 */
/*==============================================================*/
CREATE TABLE CDDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   CDSJ                 DATETIME,
   CDLX                 VARCHAR(16),
   CDNY                 VARCHAR(16) COMMENT '自产/轻度助产/难产(产道正常)/难产(产道拉伤)/碎胎',
   TW                   VARCHAR(16) COMMENT '正常/坐生/倒产/人工矫正',
   JCY                  VARCHAR(32) COMMENT '直肠/孕酮/超声/其他',
   TESL                 NUMERIC(2,0),
   JBQ                  VARCHAR(16),
   XZR                  VARCHAR(32),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: FQDJB                                                 */
/*==============================================================*/
CREATE TABLE FQDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   FQSJ                 DATETIME,
   FQLX                 VARCHAR(16) COMMENT '自然发情
            人工催情',
   FXFS                 VARCHAR(16) COMMENT '人工
            计步器',
   FXR                  VARCHAR(32),
   SHY                  VARCHAR(32),
   SFPZ                 CHAR(1),
   WPYY                 VARCHAR(128),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: FQJBXX                                                */
/*==============================================================*/
CREATE TABLE FQJBXX
(
   XH                   NUMERIC(16,0) NOT NULL,
   JBQBH                VARCHAR(32),
   NCBH                 VARCHAR(16),
   KZQBH                VARCHAR(128),
   KSSJ                 DATETIME,
   JSSJ                 DATETIME,
   LJXX                 NUMERIC(8,0),
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);

/*==============================================================*/
/* Table: FQKZQXX                                               */
/*==============================================================*/
CREATE TABLE FQKZQXX
(
   XH                   NUMERIC(16,0) NOT NULL,
   KZQBH                VARCHAR(128),
   NCBH                 VARCHAR(16),
   KZQZT                CHAR(1) COMMENT '0：正常
            1：停止
            等等',
   SFTY                 CHAR(1) COMMENT '0：正常
            1：停用',
   LJXX                 VARCHAR(128) COMMENT '数据上传和状态监控及管理的连接信息。
            更多信息需要再次确认',
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);

/*==============================================================*/
/* Table: FQTSXX                                                */
/*==============================================================*/
CREATE TABLE FQTSXX
(
   XH                   NUMERIC(16,0) NOT NULL,
   JBQBH                VARCHAR(16),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   NSBH                 VARCHAR(16),
   TSLX                 VARCHAR(16) COMMENT '发情提示 运动量下降提示',
   TSMS                 VARCHAR(128),
   SFFQ                 CHAR(1) COMMENT '0：未发情
            1：已发情',
   JCR                  VARCHAR(16),
   JCSJ                 DATETIME,
   JCJG                 VARCHAR(128),
   ZJPZSJ               DATETIME,
   SFPZ                 CHAR(1) COMMENT '0：未配种
            1：已配种',
   PZR                  VARCHAR(16),
   PZSJ                 DATETIME,
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);

/*==============================================================*/
/* Table: GTCNDJB                                               */
/*==============================================================*/
CREATE TABLE GTCNDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   JNRQ                 DATETIME,
   BC                   VARCHAR(16),
   CL                   NUMERIC(10,0),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: JBDJB                                                 */
/*==============================================================*/
CREATE TABLE JBDJB
(
   XH                   NUMERIC(16,0) NOT NULL,
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   FBRQ                 DATETIME,
   JBZL                 VARCHAR(16),
   JBMC                 VARCHAR(16),
   ZYZZ                 VARCHAR(16),
   FBYY                 VARCHAR(16),
   YZCD                 VARCHAR(16),
   CZQK                 VARCHAR(32),
   FSQN                 CHAR(1) COMMENT '1是
            0否',
   YYRQ                 DATETIME,
   YFLJ                 NUMERIC(10,2),
   YYCS                 NUMERIC(3,0),
   JSXYRQ               DATETIME,
   SYS                  VARCHAR(32),
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);

/*==============================================================*/
/* Table: JSXXB                                                 */
/*==============================================================*/
CREATE TABLE JSXXB
(
   XH                   NUMERIC(16,0) NOT NULL,
   NCBH                 VARCHAR(16),
   JSBH                 VARCHAR(16),
   JSMC                 VARCHAR(64),
   JSLB                 VARCHAR(16),
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);

/*==============================================================*/
/* Table: LCDJB                                                 */
/*==============================================================*/
CREATE TABLE LCDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   LCRQ                 DATETIME,
   LCYY                 VARCHAR(16),
   TELX                 VARCHAR(16),
   FXR                  VARCHAR(32),
   FXFS                 VARCHAR(16),
   HSR                  VARCHAR(32),
   LCZR                 VARCHAR(32),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: NCJBXXB                                               */
/*==============================================================*/
CREATE TABLE NCJBXXB
(
   NCBH                 VARCHAR(16) NOT NULL,
   NCMC                 VARCHAR(128),
   NCXZ                 VARCHAR(16),
   NCDZ                 VARCHAR(128),
   SSQY                 VARCHAR(128),
   SNQY                 VARCHAR(128),
   FZR                  VARCHAR(16),
   FZRDH                VARCHAR(16),
   LXR                  VARCHAR(16),
   LXRDH                VARCHAR(16),
   PZY                  VARCHAR(16),
   FQXTSYBZ             CHAR(1),
   KSSYSJ               DATETIME,
   TZSYSJ               DATETIME,
   PZYDH                VARCHAR(16),
   LXYX                 VARCHAR(64),
   KDDZ                 VARCHAR(128),
   BZ                   VARCHAR(128),
   PRIMARY KEY (NCBH)
);

/*==============================================================*/
/* Table: NZJBXX                                                */
/*==============================================================*/
CREATE TABLE NZJBXX
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   EBBH                 VARCHAR(16),
   JBQBH                VARCHAR(16),
   CSRQ                 DATETIME,
   XB                   CHAR(1),
   LB                   CHAR(2),
   RQLX                 CHAR(2),
   YL                   NUMERIC(3,0),
   CSZ                  NUMERIC(10,0),
   JS                   VARCHAR(16),
   PZ                   VARCHAR(16),
   MS                   VARCHAR(16),
   TC                   NUMERIC(3,0),
   CDRQ                 DATETIME,
   FQH                  VARCHAR(16),
   MQH                  VARCHAR(16),
   MRZT                 CHAR(2),
   FZZT                 CHAR(2),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: NZLCDJB                                               */
/*==============================================================*/
CREATE TABLE NZLCDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   PZ                   VARCHAR(16),
   JS                   VARCHAR(16),
   NL                   VARCHAR(16),
   LQRQ                 DATETIME,
   LQLX                 VARCHAR(16),
   LQTZ                 NUMERIC(10,0),
   LQYY                 VARCHAR(128),
   QX                   VARCHAR(128),
   JSR                  VARCHAR(32),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: NZZSDJB                                               */
/*==============================================================*/
CREATE TABLE NZZSDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   ZSRQ                 DATETIME,
   ZCJS                 VARCHAR(16),
   ZRJS                 VARCHAR(16),
   JSR                  VARCHAR(32),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: PZDJB                                                 */
/*==============================================================*/
CREATE TABLE PZDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   PZSJ                 DATETIME,
   DJBH                 VARCHAR(16),
   DJLX                 VARCHAR(16),
   PZY                  VARCHAR(32),
   FQSJ                 DATETIME,
   FQLX                 VARCHAR(16),
   FXFS                 VARCHAR(32),
   FXR                  VARCHAR(32),
   SL                   NUMERIC(8,0),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: RSJCDJB                                               */
/*==============================================================*/
CREATE TABLE RSJCDJB
(
   XH                   NUMERIC(16,0),
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   JCRQ                 DATETIME,
   JCLX                 VARCHAR(16) COMMENT '初检
            复检',
   JCJG                 VARCHAR(64) COMMENT '人工
            计步器',
   JCY                  VARCHAR(32),
   JCFS                 VARCHAR(16) COMMENT '直肠/孕酮/超声/其他',
   TSZT                 VARCHAR(16),
   NZXB                 CHAR(1),
   BZ                   VARCHAR(128)
);

/*==============================================================*/
/* Table: XTCL                                                  */
/*==============================================================*/
CREATE TABLE XTCL
(
   DMID                 VARCHAR(16) NOT NULL,
   DMLB                 VARCHAR(64),
   DMBH                 VARCHAR(64),
   DMMC                 VARCHAR(64),
   SRDM                 VARCHAR(64),
   DMMS                 VARCHAR(64),
   BZ                   VARCHAR(128),
   PRIMARY KEY (DMID)
);

/*==============================================================*/
/* Table: XXTSGL                                                */
/*==============================================================*/
CREATE TABLE XXTSGL
(
   XH                   NUMERIC(32,0) NOT NULL,
   NCBH                 VARCHAR(16),
   SJHM                 VARCHAR(16),
   TSLX                 VARCHAR(8) COMMENT '包括发情提示、最佳配种时间提示、运动量下降提示、定胎提示等',
   TSNR                 VARCHAR(128) COMMENT '4、	发情提示信息(牛只编号、牛舍、发情描述、发情检测：是否发情—检测人—检测时间【选择确认发情后，根据发情描述时间推算最佳配种时间并提示。发情后8-12小时配种时间最佳】、配种：是否配种—配种人—配种时间)
            运动量下降提示信息(牛只编号、牛舍、描述、检测结果、检测时间、检测人)
            ',
   SFTS                 CHAR(1) COMMENT '0：未提示
            1：已提示',
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);

/*==============================================================*/
/* Table: YGXXB                                                 */
/*==============================================================*/
CREATE TABLE YGXXB
(
   XH                   NUMERIC(16,0) NOT NULL,
   NCBH                 VARCHAR(16),
   YGBH                 VARCHAR(16),
   YGMC                 VARCHAR(32),
   ZJHM                 VARCHAR(32),
   LXDH                 VARCHAR(32),
   LXDZ                 VARCHAR(128),
   YGLB                 CHAR(1),
   SCBZ                 CHAR(1) COMMENT '0：未删除
            1：已删除',
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);

/*==============================================================*/
/* Table: YYJLB                                                 */
/*==============================================================*/
CREATE TABLE YYJLB
(
   XH                   NUMERIC(16,0) NOT NULL,
   NCBH                 VARCHAR(16),
   NZBH                 VARCHAR(16),
   YYCS                 NUMERIC(3,0),
   YYRQ                 DATETIME,
   YYSY                 VARCHAR(32),
   YYFF                 VARCHAR(32),
   YPMC                 VARCHAR(64),
   YPGG                 VARCHAR(16),
   YPDW                 VARCHAR(16),
   YPDJ                 NUMERIC(10,2),
   YPSL                 NUMERIC(3,0),
   YPFY                 NUMERIC(10,2),
   XYQ                  VARCHAR(16),
   BZ                   VARCHAR(128),
   PRIMARY KEY (XH)
);
