/*
Navicat MySQL Data Transfer

Source Server         : ����
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
  `FBM_ID` varchar(36) NOT NULL default '' COMMENT '�˵�ID',
  `FBM_NAME` varchar(24) default NULL COMMENT '�˵�����',
  `FBM_TITLE` varchar(24) default NULL COMMENT '�˵�����',
  `FBM_ACTION` varchar(128) default NULL COMMENT '�˵�����',
  `FBM_STATUS` int(11) default NULL COMMENT '�˵�״̬',
  `FBM_LEVEL` int(11) default NULL COMMENT '�˵��ȼ�',
  `FBM_PARENTID` varchar(36) default NULL COMMENT '��һ���˵�',
  `FBM_SEQ` int(11) default NULL COMMENT '����',
  `FBM_TYPE` int(1) default NULL COMMENT '�˵�����',
  PRIMARY KEY  (`FBM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_menus
-- ----------------------------
INSERT INTO `yh_system_menus` VALUES ('23', '�˵�����', null, null, '1', '1', '16', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('16', 'ϵͳ����', null, '#', '1', '0', '', '9', '1');
INSERT INTO `yh_system_menus` VALUES ('26', '��ɫ����', null, null, '1', '1', '16', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('25', '�˵�����', null, '/master/system/menu!AllMenus.action', '1', '2', '23', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('30', '��ɫ����', null, '/master/system/role!listRoles.action', '1', '2', '26', '0', '1');

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
  `R_DefaultStatus` int(1) default '0' COMMENT '��ɫĬ�ϣ�����ɫ���ڶ����ʱ��ע���û�Ĭ�ϵĽ�ɫȨ��',
  PRIMARY KEY  (`R_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_roles
-- ----------------------------
INSERT INTO `yh_system_roles` VALUES ('b05f9a5d-10c7-466f-833a-3ab9928fefad', '��������Ա', null, '16', '0', null, '1', '0');

-- ----------------------------
-- Table structure for `yh_system_users`
-- ----------------------------
DROP TABLE IF EXISTS `yh_system_users`;
CREATE TABLE `yh_system_users` (
  `U_ID` varchar(36) NOT NULL COMMENT '�û�ID',
  `U_NAME` varchar(50) NOT NULL COMMENT '�û��ǳ�',
  `U_LOGINNAME` varchar(36) NOT NULL,
  `U_PASSWORD` varchar(128) NOT NULL COMMENT '�û�����',
  `U_FACEIMAGE` varchar(255) default NULL COMMENT '�û�ͷ��',
  `U_TYPE` int(1) NOT NULL default '0' COMMENT '�û����ͣ�0Ϊ��ͨ�û� 1Ϊ��ҵ�û�',
  `U_RULEID` varchar(36) NOT NULL COMMENT '�û���ɫID',
  `U_Tid` varchar(36) default NULL COMMENT '�������ID��Ŀǰ��Ҫ��������ҵʹ��',
  `U_lASTIME` datetime default NULL,
  `U_NOWTIME` datetime default NULL,
  PRIMARY KEY  (`U_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_users
-- ----------------------------
INSERT INTO `yh_system_users` VALUES ('9507c1e6-f974-4891-9f3c-30910a733d6b', '����Ա', 'admin', '8f54eee04c13e5e09204f259bfa126fa6d2aeee87447918bdc8a6b9d6e13750b', null, '0', 'b05f9a5d-10c7-466f-833a-3ab9928fefad', null, '2015-03-02 21:53:39', '2015-03-02 21:57:52');

-- ----------------------------
-- Table structure for `yh_system_users_info`
-- ----------------------------
DROP TABLE IF EXISTS `yh_system_users_info`;
CREATE TABLE `yh_system_users_info` (
  `U_ID` varchar(36) NOT NULL default '',
  `U_SEX` int(1) default '0' COMMENT '1=�У�2=Ů',
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
   CDNY                 VARCHAR(16) COMMENT '�Բ�/�������/�Ѳ�(��������)/�Ѳ�(��������)/��̥',
   TW                   VARCHAR(16) COMMENT '����/����/����/�˹�����',
   JCY                  VARCHAR(32) COMMENT 'ֱ��/��ͪ/����/����',
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
   FQLX                 VARCHAR(16) COMMENT '��Ȼ����
            �˹�����',
   FXFS                 VARCHAR(16) COMMENT '�˹�
            �Ʋ���',
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
   KZQZT                CHAR(1) COMMENT '0������
            1��ֹͣ
            �ȵ�',
   SFTY                 CHAR(1) COMMENT '0������
            1��ͣ��',
   LJXX                 VARCHAR(128) COMMENT '�����ϴ���״̬��ؼ������������Ϣ��
            ������Ϣ��Ҫ�ٴ�ȷ��',
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
   TSLX                 VARCHAR(16) COMMENT '������ʾ �˶����½���ʾ',
   TSMS                 VARCHAR(128),
   SFFQ                 CHAR(1) COMMENT '0��δ����
            1���ѷ���',
   JCR                  VARCHAR(16),
   JCSJ                 DATETIME,
   JCJG                 VARCHAR(128),
   ZJPZSJ               DATETIME,
   SFPZ                 CHAR(1) COMMENT '0��δ����
            1��������',
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
   FSQN                 CHAR(1) COMMENT '1��
            0��',
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
   JCLX                 VARCHAR(16) COMMENT '����
            ����',
   JCJG                 VARCHAR(64) COMMENT '�˹�
            �Ʋ���',
   JCY                  VARCHAR(32),
   JCFS                 VARCHAR(16) COMMENT 'ֱ��/��ͪ/����/����',
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
   TSLX                 VARCHAR(8) COMMENT '����������ʾ���������ʱ����ʾ���˶����½���ʾ����̥��ʾ��',
   TSNR                 VARCHAR(128) COMMENT '4��	������ʾ��Ϣ(ţֻ��š�ţ�ᡢ���������������⣺�Ƿ��顪����ˡ����ʱ�䡾ѡ��ȷ�Ϸ���󣬸��ݷ�������ʱ�������������ʱ�䲢��ʾ�������8-12Сʱ����ʱ����ѡ������֣��Ƿ����֡������ˡ�����ʱ��)
            �˶����½���ʾ��Ϣ(ţֻ��š�ţ�ᡢ����������������ʱ�䡢�����)
            ',
   SFTS                 CHAR(1) COMMENT '0��δ��ʾ
            1������ʾ',
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
   SCBZ                 CHAR(1) COMMENT '0��δɾ��
            1����ɾ��',
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
