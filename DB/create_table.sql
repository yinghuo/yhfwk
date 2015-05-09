/*
Navicat MySQL Data Transfer

Source Server         : 测试
Source Server Version : 50087
Source Host           : localhost:3308
Source Database       : yhfwk

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-05-09 14:26:37
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
  `JCY` varchar(36) default NULL COMMENT '直肠/孕酮/超声/其他',
  `TESL` int(2) default NULL,
  `JBQ` varchar(16) default NULL,
  `XZR` varchar(36) default NULL,
  `BZ` varchar(128) default NULL,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cddjb
-- ----------------------------

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `code` varchar(6) NOT NULL,
  `region` int(11) default '0',
  `name` varchar(30) NOT NULL,
  `parent_code` varchar(6) NOT NULL,
  `x_location` int(11) default '0',
  `y_location` int(11) default '0',
  `level` int(1) NOT NULL default '0',
  `type` int(1) default '0',
  `show` int(1) default '0',
  `remark` varchar(100) default NULL,
  `cityId` int(6) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('130185', '0', '鹿泉市', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231225', '0', '明水县', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140622', '0', '应县', '140600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231202', '0', '北林区', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150801', '0', '市辖区', '150800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140421', '0', '长治县', '140400', null, null, '3', '0', '0', null, '356');
INSERT INTO `district` VALUES ('320282', '0', '宜兴市', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230604', '0', '让胡路区', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320405', '0', '戚墅堰区', '320400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131122', '0', '武邑县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210503', '0', '溪湖区', '210500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321081', '0', '仪征市', '321000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130623', '0', '涞水县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220523', '0', '辉南县', '220500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141027', '0', '浮山县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150501', '0', '市辖区', '150500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150430', '0', '敖汉旗', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130323', '0', '抚宁县', '130300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320923', '0', '阜宁县', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150601', '0', '市辖区', '150600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150781', '0', '满洲里市', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150701', '0', '市辖区', '150700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130733', '0', '崇礼县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110000', '1', '北京市', '000000', '0', '0', '1', '1', '0', null, '131');
INSERT INTO `district` VALUES ('320803', '0', '淮安区', '320800', null, null, '3', '0', '0', null, '162');
INSERT INTO `district` VALUES ('141034', '0', '汾西县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140601', '0', '市辖区', '140600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320303', '0', '云龙区', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320829', '0', '洪泽县', '320800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211121', '0', '大洼县', '211100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230781', '0', '铁力市', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211005', '0', '弓长岭区', '211000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210105', '0', '皇姑区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130927', '0', '南皮县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150525', '0', '奈曼旗', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120106', '0', '红桥区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141000', '0', '临汾市', '140000', null, null, '2', '0', '0', null, '368');
INSERT INTO `district` VALUES ('310117', '0', '松江区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130435', '0', '曲周县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150825', '0', '乌拉特后旗', '150800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210603', '0', '振兴区', '210600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110116', '0', '怀柔区', '110100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140222', '0', '天镇县', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140000', '1', '山西省', '000000', null, null, '1', '0', '0', null, '10');
INSERT INTO `district` VALUES ('150822', '0', '磴口县', '150800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222400', '0', '延边朝鲜族自治州', '220000', null, null, '2', '0', '0', null, '54');
INSERT INTO `district` VALUES ('320705', '0', '新浦区', '320700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150428', '0', '喀喇沁旗', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230421', '0', '萝北县', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140400', '0', '长治市', '140000', null, null, '2', '0', '0', null, '356');
INSERT INTO `district` VALUES ('220800', '0', '白城市', '220000', null, null, '2', '0', '0', null, '51');
INSERT INTO `district` VALUES ('130638', '0', '雄县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210900', '0', '阜新市', '210000', null, null, '2', '0', '0', null, '59');
INSERT INTO `district` VALUES ('140321', '0', '平定县', '140300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130824', '0', '滦平县', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220302', '0', '铁西区', '220300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150925', '0', '凉城县', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210700', '0', '锦州市', '210000', null, null, '2', '0', '0', null, '166');
INSERT INTO `district` VALUES ('210302', '0', '铁东区', '210300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230183', '0', '尚志市', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230223', '0', '依安县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320505', '0', '虎丘区', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130984', '0', '河间市', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130425', '0', '大名县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140221', '0', '阳高县', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220000', '7', '吉林省', '000000', null, null, '1', '0', '0', null, '9');
INSERT INTO `district` VALUES ('210903', '0', '新邱区', '210900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141130', '0', '交口县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321201', '0', '市辖区', '321200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130730', '0', '怀来县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220382', '0', '双辽市', '220300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140901', '0', '市辖区', '140900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('120112', '0', '津南区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('232700', '0', '大兴安岭地区', '230000', null, null, '2', '0', '0', null, '38');
INSERT INTO `district` VALUES ('231100', '0', '黑河市', '230000', null, null, '2', '0', '0', null, '39');
INSERT INTO `district` VALUES ('130724', '0', '沽源县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230302', '0', '鸡冠区', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152530', '0', '正蓝旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230104', '0', '道外区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320509', '0', '吴江区', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231223', '0', '青冈县', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222402', '0', '图们市', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150702', '0', '海拉尔区', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140426', '0', '黎城县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150423', '0', '巴林右旗', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230706', '0', '翠峦区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131125', '0', '安平县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230523', '0', '宝清县', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220581', '0', '梅河口市', '220500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130633', '0', '易县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130635', '0', '蠡县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140201', '0', '市辖区', '140200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150422', '0', '巴林左旗', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230000', '7', '黑龙江省', '000000', null, null, '1', '0', '0', null, '2');
INSERT INTO `district` VALUES ('210702', '0', '古塔区', '210700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230622', '0', '肇源县', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130406', '0', '峰峰矿区', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220284', '0', '磐石市', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220300', '0', '四平市', '220000', null, null, '2', '0', '0', null, '56');
INSERT INTO `district` VALUES ('140924', '0', '繁峙县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320301', '0', '市辖区', '320300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('211101', '0', '市辖区', '211100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('231025', '0', '林口县', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130626', '0', '定兴县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130129', '0', '赞皇县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320830', '0', '盱眙县', '320800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210404', '0', '望花区', '210400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320106', '0', '鼓楼区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220203', '0', '龙潭区', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220681', '0', '临江市', '220600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231000', '0', '牡丹江市', '230000', null, null, '2', '0', '0', null, '49');
INSERT INTO `district` VALUES ('130530', '0', '新河县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140181', '0', '古交市', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130634', '0', '曲阳县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230206', '0', '富拉尔基区', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150303', '0', '海南区', '150300', null, null, '3', '0', '0', null, '21');
INSERT INTO `district` VALUES ('150204', '0', '青山区', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140702', '0', '榆次区', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140721', '0', '榆社县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211282', '0', '开原市', '211200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130302', '0', '海港区', '130300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131022', '0', '固安县', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152502', '0', '锡林浩特市', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130925', '0', '盐山县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210811', '0', '老边区', '210800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310110', '0', '杨浦区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230709', '0', '金山屯区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140881', '0', '永济市', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230605', '0', '红岗区', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152202', '0', '阿尔山市', '152200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152525', '0', '东乌珠穆沁旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231001', '0', '市辖区', '231000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('321204', '0', '姜堰区', '321200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150581', '0', '霍林郭勒市', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140823', '0', '闻喜县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321000', '0', '扬州市', '320000', null, null, '2', '0', '0', null, '346');
INSERT INTO `district` VALUES ('210905', '0', '清河门区', '210900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230102', '0', '道里区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110229', '0', '延庆县', '110200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130183', '0', '晋州市', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230524', '0', '饶河县', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130700', '0', '张家口市', '130000', null, null, '2', '0', '0', null, '264');
INSERT INTO `district` VALUES ('230207', '0', '碾子山区', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140624', '0', '怀仁县', '140600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150426', '0', '翁牛特旗', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321002', '0', '广陵区', '321000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130207', '0', '丰南区', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140301', '0', '市辖区', '140300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320621', '0', '海安县', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222426', '0', '安图县', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130128', '0', '深泽县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231083', '0', '海林市', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130502', '0', '桥东区', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140100', '0', '太原市', '140000', null, null, '2', '0', '0', null, '176');
INSERT INTO `district` VALUES ('220702', '0', '宁江区', '220700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210522', '0', '桓仁满族自治县', '210500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141033', '0', '蒲县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220721', '0', '前郭尔罗斯蒙古族自治县', '220700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130723', '0', '康保县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150000', '1', '内蒙古自治区', '000000', null, null, '1', '0', '0', null, '22');
INSERT INTO `district` VALUES ('230305', '0', '梨树区', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130629', '0', '容城县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220524', '0', '柳河县', '220500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230704', '0', '友好区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150401', '0', '市辖区', '150400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320100', '0', '南京市', '320000', null, null, '2', '0', '0', null, '315');
INSERT INTO `district` VALUES ('150301', '0', '市辖区', '150300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140827', '0', '垣曲县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210201', '0', '市辖区', '210200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230903', '0', '桃山区', '230900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130130', '0', '无极县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('232722', '0', '塔河县', '232700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210727', '0', '义县', '210700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130133', '0', '赵县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130303', '0', '山海关区', '130300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120110', '0', '东丽区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130223', '0', '滦县', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211324', '0', '喀喇沁左翼蒙古族自治县', '211300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320305', '0', '贾汪区', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211200', '0', '铁岭市', '210000', null, null, '2', '0', '0', null, '60');
INSERT INTO `district` VALUES ('140729', '0', '灵石县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140826', '0', '绛县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152526', '0', '西乌珠穆沁旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131081', '0', '霸州市', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320200', '0', '无锡市', '320000', null, null, '2', '0', '0', null, '317');
INSERT INTO `district` VALUES ('220182', '0', '榆树市', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220301', '0', '市辖区', '220300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230203', '0', '建华区', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230124', '0', '方正县', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220802', '0', '洮北区', '220800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150823', '0', '乌拉特前旗', '150800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211011', '0', '太子河区', '211000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150727', '0', '新巴尔虎右旗', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131128', '0', '阜城县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('232721', '0', '呼玛县', '232700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220201', '0', '市辖区', '220200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('220500', '0', '通化市', '220000', null, null, '2', '0', '0', null, '165');
INSERT INTO `district` VALUES ('130108', '0', '裕华区', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120114', '0', '武清区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130200', '0', '唐山市', '130000', null, null, '2', '0', '0', null, '265');
INSERT INTO `district` VALUES ('320205', '0', '锡山区', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230406', '0', '东山区', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222403', '0', '敦化市', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320681', '0', '启东市', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230125', '0', '宾县', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141032', '0', '永和县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211400', '0', '葫芦岛市', '210000', null, null, '2', '0', '0', null, '319');
INSERT INTO `district` VALUES ('220723', '0', '乾安县', '220700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150723', '0', '鄂伦春自治旗', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141102', '0', '离石区', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320204', '0', '北塘区', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140110', '0', '晋源区', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140226', '0', '左云县', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320507', '0', '相城区', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230225', '0', '甘南县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231101', '0', '市辖区', '231100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('220623', '0', '长白朝鲜族自治县', '220600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231200', '0', '绥化市', '230000', null, null, '2', '0', '0', null, '44');
INSERT INTO `district` VALUES ('130300', '0', '秦皇岛市', '130000', null, null, '2', '0', '0', null, '148');
INSERT INTO `district` VALUES ('230710', '0', '五营区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210781', '0', '凌海市', '210700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131127', '0', '景县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230805', '0', '东风区', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130523', '0', '内丘县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140701', '0', '市辖区', '140700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('321084', '0', '高邮市', '321000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230624', '0', '杜尔伯特蒙古族自治县', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150302', '0', '海勃湾区', '150300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230229', '0', '克山县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140802', '0', '盐湖区', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230109', '0', '松北区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231182', '0', '五大连池市', '231100', null, null, '3', '0', '0', null, '167');
INSERT INTO `district` VALUES ('320623', '0', '如东县', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130521', '0', '邢台县', '130500', null, null, '3', '0', '0', null, '266');
INSERT INTO `district` VALUES ('140200', '0', '大同市', '140000', null, null, '2', '0', '0', null, '355');
INSERT INTO `district` VALUES ('320924', '0', '射阳县', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220700', '0', '松原市', '220000', null, null, '2', '0', '0', null, '52');
INSERT INTO `district` VALUES ('150623', '0', '鄂托克前旗', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210703', '0', '凌河区', '210700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320500', '0', '苏州市', '320000', null, null, '2', '0', '0', null, '224');
INSERT INTO `district` VALUES ('150203', '0', '昆都仑区', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130209', '0', '曹妃甸区', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231005', '0', '西安区', '231000', null, null, '3', '0', '0', null, '233');
INSERT INTO `district` VALUES ('310200', '0', '县', '310000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('131182', '0', '深州市', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150725', '0', '陈巴尔虎旗', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310000', '2', '上海市', '000000', null, null, '1', '1', '0', null, '289');
INSERT INTO `district` VALUES ('140727', '0', '祁县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231224', '0', '庆安县', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130432', '0', '广平县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141029', '0', '乡宁县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130503', '0', '桥西区', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130902', '0', '新华区', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150802', '0', '临河区', '150800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140700', '0', '晋中市', '140000', null, null, '2', '0', '0', null, '238');
INSERT INTO `district` VALUES ('130801', '0', '市辖区', '130800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('310115', '0', '浦东新区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130725', '0', '尚义县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320382', '0', '邳州市', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230407', '0', '兴山区', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210701', '0', '市辖区', '210700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('231024', '0', '东宁县', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150526', '0', '扎鲁特旗', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211421', '0', '绥中县', '211400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222401', '0', '延吉市', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140212', '0', '新荣区', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220602', '0', '浑江区', '220600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210212', '0', '旅顺口区', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231085', '0', '穆棱市', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230703', '0', '南岔区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131101', '0', '市辖区', '131100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140801', '0', '市辖区', '140800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230301', '0', '市辖区', '230300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320601', '0', '市辖区', '320600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150205', '0', '石拐区', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150105', '0', '赛罕区', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231081', '0', '绥芬河市', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211201', '0', '市辖区', '211200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320800', '0', '淮安市', '320000', null, null, '2', '0', '0', null, '162');
INSERT INTO `district` VALUES ('140101', '0', '市辖区', '140100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130321', '0', '青龙满族自治县', '130300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230522', '0', '友谊县', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230901', '0', '市辖区', '230900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140800', '0', '运城市', '140000', null, null, '2', '0', '0', null, '328');
INSERT INTO `district` VALUES ('130601', '0', '市辖区', '130600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('211021', '0', '辽阳县', '211000', null, null, '3', '0', '0', null, '351');
INSERT INTO `district` VALUES ('141121', '0', '文水县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320723', '0', '灌云县', '320700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130125', '0', '行唐县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320201', '0', '市辖区', '320200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320281', '0', '江阴市', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140524', '0', '陵川县', '140500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130804', '0', '鹰手营子矿区', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210122', '0', '辽中县', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130124', '0', '栾城县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150625', '0', '杭锦旗', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310114', '0', '嘉定区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120223', '0', '静海县', '120200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120200', '0', '县', '120000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('230227', '0', '富裕县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110100', '0', '市辖区', '110000', '0', '0', '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('230803', '0', '向阳区', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220323', '0', '伊通满族自治县', '220300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150927', '0', '察哈尔右翼中旗', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140224', '0', '灵丘县', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210922', '0', '彰武县', '210900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130604', '0', '南市区', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130529', '0', '巨鹿县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210204', '0', '沙河口区', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220112', '0', '双阳区', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130681', '0', '涿州市', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320585', '0', '太仓市', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130402', '0', '邯山区', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130722', '0', '张北县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130924', '0', '海兴县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321102', '0', '京口区', '321100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130803', '0', '双滦区', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150782', '0', '牙克石市', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211103', '0', '兴隆台区', '211100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130928', '0', '吴桥县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320105', '0', '建邺区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131000', '0', '廊坊市', '130000', null, null, '2', '0', '0', null, '191');
INSERT INTO `district` VALUES ('141024', '0', '洪洞县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110111', '0', '房山区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210203', '0', '西岗区', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230401', '0', '市辖区', '230400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('321023', '0', '宝应县', '321000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130922', '0', '青县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310100', '0', '市辖区', '310000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('140107', '0', '杏花岭区', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130726', '0', '蔚县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140825', '0', '新绛县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230600', '0', '大庆市', '230000', null, null, '2', '0', '0', null, '50');
INSERT INTO `district` VALUES ('220881', '0', '洮南市', '220800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310107', '0', '普陀区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211401', '0', '市辖区', '211400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140223', '0', '广灵县', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231282', '0', '肇东市', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231004', '0', '爱民区', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320202', '0', '崇安区', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220601', '0', '市辖区', '220600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('152501', '0', '二连浩特市', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210901', '0', '市辖区', '210900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('220221', '0', '永吉县', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210902', '0', '海州区', '210900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230902', '0', '新兴区', '230900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130522', '0', '临城县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130101', '0', '市辖区', '130100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140581', '0', '高平市', '140500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140202', '0', '城区', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220521', '0', '通化县', '220500', null, null, '3', '0', '0', null, '165');
INSERT INTO `district` VALUES ('130637', '0', '博野县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130433', '0', '馆陶县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320981', '0', '东台市', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130123', '0', '正定县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131181', '0', '冀州市', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211000', '0', '辽阳市', '210000', null, null, '2', '0', '0', null, '351');
INSERT INTO `district` VALUES ('120100', '0', '市辖区', '120000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('130184', '0', '新乐市', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140425', '0', '平顺县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320802', '0', '清河区', '320800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231281', '0', '安达市', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320722', '0', '东海县', '320700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210112', '0', '东陵区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321112', '0', '丹徒区', '321100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140900', '0', '忻州市', '140000', null, null, '2', '0', '0', null, '367');
INSERT INTO `district` VALUES ('150521', '0', '科尔沁左翼中旗', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320206', '0', '惠山区', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220400', '0', '辽源市', '220000', null, null, '2', '0', '0', null, '183');
INSERT INTO `district` VALUES ('320826', '0', '涟水县', '320800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210323', '0', '岫岩满族自治县', '210300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211202', '0', '银州区', '211200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130621', '0', '满城县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152224', '0', '突泉县', '152200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321100', '0', '镇江市', '320000', null, null, '2', '0', '0', null, '160');
INSERT INTO `district` VALUES ('230303', '0', '恒山区', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230103', '0', '南岗区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220202', '0', '昌邑区', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320902', '0', '亭湖区', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152531', '0', '多伦县', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130900', '0', '沧州市', '130000', null, null, '2', '0', '0', null, '149');
INSERT INTO `district` VALUES ('220183', '0', '德惠市', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231283', '0', '海伦市', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120105', '0', '河北区', '120100', null, null, '3', '0', '0', null, '25');
INSERT INTO `district` VALUES ('230506', '0', '宝山区', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130102', '0', '长安区', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231003', '0', '阳明区', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152201', '0', '乌兰浩特市', '152200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210804', '0', '鲅鱼圈区', '210800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130532', '0', '平乡县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130527', '0', '南和县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310105', '0', '长宁区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140227', '0', '大同县', '140200', null, null, '3', '0', '0', null, '355');
INSERT INTO `district` VALUES ('140303', '0', '矿区', '140300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230501', '0', '市辖区', '230500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('310108', '0', '闸北区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230502', '0', '尖山区', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130403', '0', '丛台区', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220622', '0', '靖宇县', '220600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150922', '0', '化德县', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320900', '0', '盐城市', '320000', null, null, '2', '0', '0', null, '223');
INSERT INTO `district` VALUES ('210682', '0', '凤城市', '210600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220106', '0', '绿园区', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210282', '0', '普兰店市', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230904', '0', '茄子河区', '230900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211322', '0', '建平县', '211300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130421', '0', '邯郸县', '130400', null, null, '3', '0', '0', null, '151');
INSERT INTO `district` VALUES ('310113', '0', '宝山区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130628', '0', '高阳县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110107', '0', '石景山区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140725', '0', '寿阳县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140929', '0', '岢岚县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230404', '0', '南山区', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320506', '0', '吴中区', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140302', '0', '城区', '140300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120113', '0', '北辰区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110114', '0', '昌平区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140105', '0', '小店区', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220104', '0', '朝阳区', '220100', null, null, '3', '0', '0', null, '280');
INSERT INTO `district` VALUES ('150627', '0', '伊金霍洛旗', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230321', '0', '鸡东县', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210681', '0', '东港市', '210600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152523', '0', '苏尼特左旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150206', '0', '白云鄂博矿区', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140931', '0', '保德县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152500', '0', '锡林郭勒盟', '150000', null, null, '2', '0', '0', null, '63');
INSERT INTO `district` VALUES ('150421', '0', '阿鲁科尔沁旗', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230382', '0', '密山市', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220722', '0', '长岭县', '220700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230230', '0', '克东县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141126', '0', '石楼县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211281', '0', '调兵山市', '211200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321283', '0', '泰兴市', '321200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150523', '0', '开鲁县', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150522', '0', '科尔沁左翼后旗', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120103', '0', '河西区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321001', '0', '市辖区', '321000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230381', '0', '虎林市', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230707', '0', '新青区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150200', '0', '包头市', '150000', null, null, '2', '0', '0', null, '229');
INSERT INTO `district` VALUES ('210400', '0', '抚顺市', '210000', null, null, '2', '0', '0', null, '184');
INSERT INTO `district` VALUES ('210111', '0', '苏家屯区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130528', '0', '宁晋县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130501', '0', '市辖区', '130500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320113', '0', '栖霞区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130429', '0', '永年县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230202', '0', '龙沙区', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220605', '0', '江源区', '220600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130903', '0', '运河区', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321101', '0', '市辖区', '321100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('211204', '0', '清河区', '211200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130526', '0', '任县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120115', '0', '宝坻区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130431', '0', '鸡泽县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150800', '0', '巴彦淖尔市', '150000', null, null, '2', '0', '0', null, '169');
INSERT INTO `district` VALUES ('210281', '0', '瓦房店市', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211321', '0', '朝阳县', '211300', null, null, '3', '0', '0', null, '280');
INSERT INTO `district` VALUES ('131100', '0', '衡水市', '130000', null, null, '2', '0', '0', null, '208');
INSERT INTO `district` VALUES ('320401', '0', '市辖区', '320400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320482', '0', '金坛市', '320400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140726', '0', '太谷县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130203', '0', '路北区', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231181', '0', '北安市', '231100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140829', '0', '平陆县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210301', '0', '市辖区', '210300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150100', '0', '呼和浩特市', '150000', null, null, '2', '0', '0', null, '321');
INSERT INTO `district` VALUES ('130923', '0', '东光县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150223', '0', '达尔罕茂明安联合旗', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120104', '0', '南开区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320583', '0', '昆山市', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130823', '0', '平泉县', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140923', '0', '代县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211402', '0', '连山区', '211400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110117', '0', '平谷区', '110100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220401', '0', '市辖区', '220400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150929', '0', '四子王旗', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130631', '0', '望都县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230602', '0', '萨尔图区', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130828', '0', '围场满族蒙古族自治县', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310104', '0', '徐汇区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130131', '0', '平山县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141123', '0', '兴县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320481', '0', '溧阳市', '320400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220822', '0', '通榆县', '220800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231226', '0', '绥棱县', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130428', '0', '肥乡县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310101', '0', '黄浦区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150201', '0', '市辖区', '150200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230822', '0', '桦南县', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140722', '0', '左权县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231102', '0', '爱辉区', '231100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140926', '0', '静乐县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130181', '0', '辛集市', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210303', '0', '铁西区', '210300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130534', '0', '清河县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321181', '0', '丹阳市', '321100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211422', '0', '建昌县', '211400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120225', '0', '蓟县', '120200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150402', '0', '红山区', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150703', '0', '扎赉诺尔区', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220181', '0', '九台市', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230184', '0', '五常市', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210403', '0', '东洲区', '210400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321200', '0', '泰州市', '320000', null, null, '2', '0', '0', null, '276');
INSERT INTO `district` VALUES ('150502', '0', '科尔沁区', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230601', '0', '市辖区', '230600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230716', '0', '上甘岭区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130622', '0', '清苑县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130525', '0', '隆尧县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141122', '0', '交城县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210602', '0', '元宝区', '210600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140600', '0', '朔州市', '140000', null, null, '2', '0', '0', null, '237');
INSERT INTO `district` VALUES ('140921', '0', '定襄县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152921', '0', '阿拉善左旗', '152900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321282', '0', '靖江市', '321200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230702', '0', '伊春区', '230700', null, null, '3', '0', '0', null, '40');
INSERT INTO `district` VALUES ('220283', '0', '舒兰市', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210124', '0', '法库县', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220204', '0', '船营区', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130105', '0', '新华区', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230722', '0', '嘉荫县', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210101', '0', '市辖区', '210100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320211', '0', '滨湖区', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140821', '0', '临猗县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210283', '0', '庄河市', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150104', '0', '玉泉区', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220103', '0', '宽城区', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210300', '0', '鞍山市', '210000', null, null, '2', '0', '0', null, '320');
INSERT INTO `district` VALUES ('150123', '0', '和林格尔县', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210502', '0', '平山区', '210500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130825', '0', '隆化县', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210102', '0', '和平区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150981', '0', '丰镇市', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220303', '0', '铁东区', '220300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130721', '0', '宣化县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130127', '0', '高邑县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150403', '0', '元宝山区', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130104', '0', '桥西区', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140927', '0', '神池县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320400', '0', '常州市', '320000', null, null, '2', '0', '0', null, '348');
INSERT INTO `district` VALUES ('130324', '0', '卢龙县', '130300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210213', '0', '金州区', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230304', '0', '滴道区', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110102', '0', '西城区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210106', '0', '铁西区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110106', '0', '丰台区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130301', '0', '市辖区', '130300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130322', '0', '昌黎县', '130300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210423', '0', '清原满族自治县', '210400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120102', '0', '河东区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320703', '0', '连云区', '320700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130603', '0', '北市区', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152923', '0', '额济纳旗', '152900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220102', '0', '南关区', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130624', '0', '阜平县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130500', '0', '邢台市', '130000', null, null, '2', '0', '0', null, '266');
INSERT INTO `district` VALUES ('131028', '0', '大厂回族自治县', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130427', '0', '磁县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210881', '0', '盖州市', '210800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230126', '0', '巴彦县', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130627', '0', '唐县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150122', '0', '托克托县', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220211', '0', '丰满区', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211001', '0', '市辖区', '211000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('220621', '0', '抚松县', '220600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152200', '0', '兴安盟', '150000', null, null, '2', '0', '0', null, '62');
INSERT INTO `district` VALUES ('130404', '0', '复兴区', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130224', '0', '滦南县', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220801', '0', '市辖区', '220800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130682', '0', '定州市', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130630', '0', '涞源县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230400', '0', '鹤岗市', '230000', null, null, '2', '0', '0', null, '43');
INSERT INTO `district` VALUES ('230712', '0', '汤旺河区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140122', '0', '阳曲县', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152529', '0', '正镶白旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150624', '0', '鄂托克旗', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230221', '0', '龙江县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130600', '0', '保定市', '130000', null, null, '2', '0', '0', null, '307');
INSERT INTO `district` VALUES ('321003', '0', '邗江区', '321000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320203', '0', '南长区', '320200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220502', '0', '东昌区', '220500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310112', '0', '闵行区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150425', '0', '克什克腾旗', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210311', '0', '千山区', '210300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231123', '0', '逊克县', '231100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230108', '0', '平房区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320831', '0', '金湖县', '320800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150207', '0', '九原区', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320322', '0', '沛县', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131024', '0', '香河县', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220701', '0', '市辖区', '220700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('211122', '0', '盘山县', '211100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210000', '7', '辽宁省', '000000', null, null, '1', '0', '0', null, '19');
INSERT INTO `district` VALUES ('210726', '0', '黑山县', '210700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231121', '0', '嫩江县', '231100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140724', '0', '昔阳县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210200', '0', '大连市', '210000', null, null, '2', '0', '0', null, '167');
INSERT INTO `district` VALUES ('320321', '0', '丰县', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230705', '0', '西林区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150926', '0', '察哈尔右翼前旗', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230811', '0', '郊区', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210113', '0', '沈北新区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230708', '0', '美溪区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141125', '0', '柳林县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130533', '0', '威县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210211', '0', '甘井子区', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141022', '0', '翼城县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210501', '0', '市辖区', '210500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('210500', '0', '本溪市', '210000', null, null, '2', '0', '0', null, '227');
INSERT INTO `district` VALUES ('140621', '0', '山阴县', '140600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130701', '0', '市辖区', '130700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('231222', '0', '兰西县', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140121', '0', '清徐县', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110113', '0', '顺义区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140431', '0', '沁源县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131025', '0', '大城县', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130705', '0', '宣化区', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152528', '0', '镶黄旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150700', '0', '呼伦贝尔市', '150000', null, null, '2', '0', '0', null, '61');
INSERT INTO `district` VALUES ('321203', '0', '高港区', '321200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230826', '0', '桦川县', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230882', '0', '富锦市', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130121', '0', '井陉县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320411', '0', '新北区', '320400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220402', '0', '龙山区', '220400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230112', '0', '阿城区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120116', '0', '滨海新区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220122', '0', '农安县', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230804', '0', '前进区', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140424', '0', '屯留县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141082', '0', '霍州市', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320117', '0', '溧水区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320903', '0', '盐都区', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230921', '0', '勃利县', '230900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211301', '0', '市辖区', '211300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('231002', '0', '东安区', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150783', '0', '扎兰屯市', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120000', '1', '天津市', '000000', null, null, '1', '1', '0', null, '332');
INSERT INTO `district` VALUES ('320381', '0', '新沂市', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150900', '0', '乌兰察布市', '150000', null, null, '2', '0', '0', null, '168');
INSERT INTO `district` VALUES ('152527', '0', '太仆寺旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210103', '0', '沈河区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152222', '0', '科尔沁右翼中旗', '152200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152221', '0', '科尔沁右翼前旗', '152200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230129', '0', '延寿县', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140981', '0', '原平市', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210381', '0', '海城市', '210300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310106', '0', '静安区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320701', '0', '市辖区', '320700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140203', '0', '矿区', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150824', '0', '乌拉特中旗', '150800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211221', '0', '铁岭县', '211200', null, null, '3', '0', '0', null, '60');
INSERT INTO `district` VALUES ('150724', '0', '鄂温克族自治旗', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320684', '0', '海门市', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211302', '0', '双塔区', '211300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140225', '0', '浑源县', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140123', '0', '娄烦县', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140429', '0', '武乡县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140930', '0', '河曲县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140300', '0', '阳泉市', '140000', null, null, '2', '0', '0', null, '357');
INSERT INTO `district` VALUES ('320501', '0', '市辖区', '320500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('210411', '0', '顺城区', '210400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130423', '0', '临漳县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210601', '0', '市辖区', '210600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320804', '0', '淮阴区', '320800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131026', '0', '文安县', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210181', '0', '新民市', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230701', '0', '市辖区', '230700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150821', '0', '五原县', '150800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141021', '0', '曲沃县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320111', '0', '浦口区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220200', '0', '吉林市', '220000', null, null, '2', '0', '0', null, '55');
INSERT INTO `district` VALUES ('320600', '0', '南通市', '320000', null, null, '2', '0', '0', null, '161');
INSERT INTO `district` VALUES ('130683', '0', '安国市', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130802', '0', '双桥区', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141124', '0', '临县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320612', '0', '通州区', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211102', '0', '双台子区', '211100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320682', '0', '如皋市', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140922', '0', '五台县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211100', '0', '盘锦市', '210000', null, null, '2', '0', '0', null, '228');
INSERT INTO `district` VALUES ('120111', '0', '西青区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320721', '0', '赣榆县', '320700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220403', '0', '西安区', '220400', null, null, '3', '0', '0', null, '233');
INSERT INTO `district` VALUES ('141129', '0', '中阳县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130727', '0', '阳原县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110115', '0', '大兴区', '110100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231221', '0', '望奎县', '231200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120221', '0', '宁河县', '120200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130926', '0', '肃宁县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130706', '0', '下花园区', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130430', '0', '邱县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220282', '0', '桦甸市', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140211', '0', '南郊区', '140200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320312', '0', '铜山区', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150124', '0', '清水河县', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130000', '1', '河北省', '000000', null, null, '1', '0', '0', null, '25');
INSERT INTO `district` VALUES ('150404', '0', '松山区', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230800', '0', '佳木斯市', '230000', null, null, '2', '0', '0', null, '42');
INSERT INTO `district` VALUES ('230711', '0', '乌马河区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110108', '0', '海淀区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140723', '0', '和顺县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130983', '0', '黄骅市', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130401', '0', '市辖区', '130400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('231084', '0', '宁安市', '231000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130182', '0', '藁城市', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231124', '0', '孙吴县', '231100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320706', '0', '海州区', '320700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141023', '0', '襄汾县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150826', '0', '杭锦后旗', '150800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222406', '0', '和龙市', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220781', '0', '扶余市', '220700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130126', '0', '灵寿县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140401', '0', '市辖区', '140400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140603', '0', '平鲁区', '140600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320101', '0', '市辖区', '320100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320611', '0', '港闸区', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230100', '0', '哈尔滨市', '230000', null, null, '2', '0', '0', null, '48');
INSERT INTO `district` VALUES ('140522', '0', '阳城县', '140500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140322', '0', '盂县', '140300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140728', '0', '平遥县', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150424', '0', '林西县', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210402', '0', '新抚区', '210400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140411', '0', '郊区', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150902', '0', '集宁区', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140828', '0', '夏县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130827', '0', '宽城满族自治县', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150722', '0', '莫力达瓦达斡尔族自治旗', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130930', '0', '孟村回族自治县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130132', '0', '元氏县', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321183', '0', '句容市', '321100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230500', '0', '双鸭山市', '230000', null, null, '2', '0', '0', null, '45');
INSERT INTO `district` VALUES ('220503', '0', '二道江区', '220500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150121', '0', '土默特左旗', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141001', '0', '市辖区', '141000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230505', '0', '四方台区', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220600', '0', '白山市', '220000', null, null, '2', '0', '0', null, '57');
INSERT INTO `district` VALUES ('152900', '0', '阿拉善盟', '150000', null, null, '2', '0', '0', null, '230');
INSERT INTO `district` VALUES ('140623', '0', '右玉县', '140600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210421', '0', '抚顺县', '210400', null, null, '3', '0', '0', null, '184');
INSERT INTO `district` VALUES ('131003', '0', '广阳区', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211381', '0', '北票市', '211300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210802', '0', '站前区', '210800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230300', '0', '鸡西市', '230000', null, null, '2', '0', '0', null, '46');
INSERT INTO `district` VALUES ('222424', '0', '汪清县', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230128', '0', '通河县', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220422', '0', '东辽县', '220400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320412', '0', '武进区', '320400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230521', '0', '集贤县', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210921', '0', '阜新蒙古族自治县', '210900', null, null, '3', '0', '0', null, '59');
INSERT INTO `district` VALUES ('140108', '0', '尖草坪区', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131126', '0', '故城县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130728', '0', '怀安县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150901', '0', '市辖区', '150900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130702', '0', '桥东区', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210100', '0', '沈阳市', '210000', null, null, '2', '0', '0', null, '58');
INSERT INTO `district` VALUES ('211382', '0', '凌源市', '211300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310109', '0', '虹口区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130531', '0', '广宗县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150304', '0', '乌达区', '150300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141030', '0', '大宁县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210504', '0', '明山区', '210500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210422', '0', '新宾满族自治县', '210400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131002', '0', '安次区', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130208', '0', '丰润区', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150923', '0', '商都县', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150626', '0', '乌审旗', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321111', '0', '润州区', '321100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('231201', '0', '市辖区', '231200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('211003', '0', '文圣区', '211000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130732', '0', '赤城县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310118', '0', '青浦区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320602', '0', '崇川区', '320600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141081', '0', '侯马市', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320324', '0', '睢宁县', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130227', '0', '迁西县', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230623', '0', '林甸县', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230101', '0', '市辖区', '230100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150102', '0', '新城区', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211404', '0', '南票区', '211400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110105', '0', '朝阳区', '110100', null, '0', '3', '0', '0', null, '280');
INSERT INTO `district` VALUES ('320581', '0', '常熟市', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140430', '0', '沁县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230111', '0', '呼兰区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320801', '0', '市辖区', '320800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('210505', '0', '南芬区', '210500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110109', '0', '门头沟区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141025', '0', '古县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130729', '0', '万全县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140824', '0', '稷山县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150222', '0', '固阳县', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320982', '0', '大丰市', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230123', '0', '依兰县', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320302', '0', '鼓楼区', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210803', '0', '西市区', '210800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141127', '0', '岚县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150500', '0', '通辽市', '150000', null, null, '2', '0', '0', null, '64');
INSERT INTO `district` VALUES ('230715', '0', '红星区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140882', '0', '河津市', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230881', '0', '同江市', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320811', '0', '清浦区', '320800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131082', '0', '三河市', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140402', '0', '城区', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220381', '0', '公主岭市', '220300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230205', '0', '昂昂溪区', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130581', '0', '南宫市', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211481', '0', '兴城市', '211400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131102', '0', '桃城区', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140106', '0', '迎泽区', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141028', '0', '吉县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210114', '0', '于洪区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140830', '0', '芮城县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210604', '0', '振安区', '210600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220582', '0', '集安市', '220500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320508', '0', '姑苏区', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152524', '0', '苏尼特右旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140423', '0', '襄垣县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130400', '0', '邯郸市', '130000', null, null, '2', '0', '0', null, '151');
INSERT INTO `district` VALUES ('320582', '0', '张家港市', '320500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130201', '0', '市辖区', '130200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130800', '0', '承德市', '130000', null, null, '2', '0', '0', null, '207');
INSERT INTO `district` VALUES ('150400', '0', '赤峰市', '150000', null, null, '2', '0', '0', null, '297');
INSERT INTO `district` VALUES ('230182', '0', '双城市', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140902', '0', '忻府区', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210521', '0', '本溪满族自治县', '210500', null, null, '3', '0', '0', null, '227');
INSERT INTO `district` VALUES ('220882', '0', '大安市', '220800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320115', '0', '江宁区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220421', '0', '东丰县', '220400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220105', '0', '二道区', '220100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230127', '0', '木兰县', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230281', '0', '讷河市', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141101', '0', '市辖区', '141100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('211004', '0', '宏伟区', '211000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150524', '0', '库伦旗', '150500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211224', '0', '昌图县', '211200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210782', '0', '北镇市', '210700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130434', '0', '魏县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130582', '0', '沙河市', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320104', '0', '秦淮区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220101', '0', '市辖区', '220100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('141181', '0', '孝义市', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140427', '0', '壶关县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130901', '0', '市辖区', '130900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('210600', '0', '丹东市', '210000', null, null, '2', '0', '0', null, '282');
INSERT INTO `district` VALUES ('130602', '0', '新市区', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130283', '0', '迁安市', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141182', '0', '汾阳市', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230603', '0', '龙凤区', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152522', '0', '阿巴嘎旗', '152500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130103', '0', '桥东区', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230422', '0', '绥滨县', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140109', '0', '万柏林区', '140100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131023', '0', '永清县', '131000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110101', '0', '东城区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140928', '0', '五寨县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230801', '0', '市辖区', '230800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('140481', '0', '潞城市', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130426', '0', '涉县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150429', '0', '宁城县', '150400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('232723', '0', '漠河县', '232700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152922', '0', '阿拉善右旗', '152900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131121', '0', '枣强县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150622', '0', '准格尔旗', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230405', '0', '兴安区', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130304', '0', '北戴河区', '130300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320901', '0', '市辖区', '320900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130625', '0', '徐水县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320724', '0', '灌南县', '320700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130929', '0', '献县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210321', '0', '台安县', '210300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140525', '0', '泽州县', '140500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230700', '0', '伊春市', '230000', null, null, '2', '0', '0', null, '40');
INSERT INTO `district` VALUES ('230201', '0', '市辖区', '230200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130524', '0', '柏乡县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130731', '0', '涿鹿县', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211303', '0', '龙城区', '211300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210401', '0', '市辖区', '210400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('131123', '0', '武强县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230828', '0', '汤原县', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130826', '0', '丰宁满族自治县', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130982', '0', '任丘市', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130107', '0', '井陉矿区', '130100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230402', '0', '向阳区', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130821', '0', '承德县', '130800', null, null, '3', '0', '0', null, '207');
INSERT INTO `district` VALUES ('130481', '0', '武安市', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130703', '0', '桥西区', '130700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321182', '0', '扬中市', '321100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131001', '0', '市辖区', '131000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150602', '0', '东胜区', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320922', '0', '滨海县', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150726', '0', '新巴尔虎左旗', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130204', '0', '古冶区', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230833', '0', '抚远县', '230800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310120', '0', '奉贤区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210801', '0', '市辖区', '210800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('130229', '0', '玉田县', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130981', '0', '泊头市', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210224', '0', '长海县', '210200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130202', '0', '路南区', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130632', '0', '安新县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320118', '0', '高淳区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210800', '0', '营口市', '210000', null, null, '2', '0', '0', null, '281');
INSERT INTO `district` VALUES ('210882', '0', '大石桥市', '210800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230306', '0', '城子河区', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210904', '0', '太平区', '210900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150221', '0', '土默特右旗', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210304', '0', '立山区', '210300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220322', '0', '梨树县', '220300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210123', '0', '康平县', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320404', '0', '钟楼区', '320400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130636', '0', '顺平县', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230307', '0', '麻山区', '230300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210202', '0', '中山区', '210200', null, null, '3', '0', '0', null, '187');
INSERT INTO `district` VALUES ('150600', '0', '鄂尔多斯市', '150000', null, null, '2', '0', '0', null, '283');
INSERT INTO `district` VALUES ('140925', '0', '宁武县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320921', '0', '响水县', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150300', '0', '乌海市', '150000', null, null, '2', '0', '0', null, '123');
INSERT INTO `district` VALUES ('130535', '0', '临西县', '130500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320311', '0', '泉山区', '320300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230403', '0', '工农区', '230400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130921', '0', '沧县', '130900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140311', '0', '郊区', '140300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321202', '0', '海陵区', '321200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140428', '0', '长子县', '140400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110228', '0', '密云县', '110200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140781', '0', '介休市', '140700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230606', '0', '大同区', '230600', null, null, '3', '0', '0', null, '355');
INSERT INTO `district` VALUES ('211081', '0', '灯塔市', '211000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230621', '0', '肇州县', '230600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140602', '0', '朔城区', '140600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220501', '0', '市辖区', '220500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('150921', '0', '卓资县', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150125', '0', '武川县', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230714', '0', '乌伊岭区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150621', '0', '达拉特旗', '150600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320114', '0', '雨花台区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230713', '0', '带岭区', '230700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211300', '0', '朝阳市', '210000', null, null, '2', '0', '0', null, '280');
INSERT INTO `district` VALUES ('230208', '0', '梅里斯达斡尔族区', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('131124', '0', '饶阳县', '131100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230231', '0', '拜泉县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230503', '0', '岭东区', '230500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130684', '0', '高碑店市', '130600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130822', '0', '兴隆县', '130800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230224', '0', '泰来县', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230200', '0', '齐齐哈尔市', '230000', null, null, '2', '0', '0', null, '41');
INSERT INTO `district` VALUES ('110112', '0', '通州区', '110100', null, '0', '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211002', '0', '白塔区', '211000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150721', '0', '阿荣旗', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141031', '0', '隰县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141100', '0', '吕梁市', '140000', null, null, '2', '0', '0', null, '327');
INSERT INTO `district` VALUES ('320102', '0', '玄武区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210104', '0', '大东区', '210100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210911', '0', '细河区', '210900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140502', '0', '城区', '140500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320925', '0', '建湖县', '320900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320116', '0', '六合区', '320100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130205', '0', '开平区', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211403', '0', '龙港区', '211400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130424', '0', '成安县', '130400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150924', '0', '兴和县', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220281', '0', '蛟河市', '220200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230204', '0', '铁锋区', '230200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('230110', '0', '香坊区', '230100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140822', '0', '万荣县', '140800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141002', '0', '尧都区', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320700', '0', '连云港市', '320000', null, null, '2', '0', '0', null, '347');
INSERT INTO `district` VALUES ('150103', '0', '回民区', '150100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('152223', '0', '扎赉特旗', '152200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150202', '0', '东河区', '150200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150928', '0', '察哈尔右翼后旗', '150900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('211223', '0', '西丰县', '211200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('120101', '0', '和平区', '120100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310230', '0', '崇明县', '310200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321012', '0', '江都区', '321000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140501', '0', '市辖区', '140500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('320000', '2', '江苏省', '000000', null, null, '1', '0', '0', null, '18');
INSERT INTO `district` VALUES ('320300', '0', '徐州市', '320000', null, null, '2', '0', '0', null, '316');
INSERT INTO `district` VALUES ('150785', '0', '根河市', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130100', '0', '石家庄市', '130000', null, null, '2', '0', '0', null, '150');
INSERT INTO `district` VALUES ('220100', '0', '长春市', '220000', null, null, '2', '0', '0', null, '53');
INSERT INTO `district` VALUES ('321281', '0', '兴化市', '321200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130225', '0', '乐亭县', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('141128', '0', '方山县', '141100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('110200', '0', '县', '110000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('140521', '0', '沁水县', '140500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('150101', '0', '市辖区', '150100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('230900', '0', '七台河市', '230000', null, null, '2', '0', '0', null, '47');
INSERT INTO `district` VALUES ('150784', '0', '额尔古纳市', '150700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210624', '0', '宽甸满族自治县', '210600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222405', '0', '龙井市', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('210711', '0', '太和区', '210700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('130281', '0', '遵化市', '130200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140932', '0', '偏关县', '140900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('310116', '0', '金山区', '310100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('220821', '0', '镇赉县', '220800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('140500', '0', '晋城市', '140000', null, null, '2', '0', '0', null, '290');
INSERT INTO `district` VALUES ('141026', '0', '安泽县', '141000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('222404', '0', '珲春市', '222400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('320402', '0', '天宁区', '320400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330503', '0', '南浔区', '330500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330300', '0', '温州市', '330000', null, null, '2', '0', '0', null, '178');
INSERT INTO `district` VALUES ('350505', '0', '泉港区', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371101', '0', '市辖区', '371100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340506', '0', '博望区', '340500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360728', '0', '定南县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360501', '0', '市辖区', '360500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371302', '0', '兰山区', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420804', '0', '掇刀区', '420800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422825', '0', '宣恩县', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410600', '0', '鹤壁市', '410000', null, null, '2', '0', '0', null, '215');
INSERT INTO `district` VALUES ('350427', '0', '沙县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341181', '0', '天长市', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370124', '0', '平阴县', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340225', '0', '无为县', '340200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371321', '0', '沂南县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371700', '0', '菏泽市', '370000', null, null, '2', '0', '0', null, '353');
INSERT INTO `district` VALUES ('410883', '0', '孟州市', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330921', '0', '岱山县', '330900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330103', '0', '下城区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350925', '0', '周宁县', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411121', '0', '舞阳县', '411100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341122', '0', '来安县', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340825', '0', '太湖县', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350502', '0', '鲤城区', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340801', '0', '市辖区', '340800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('330127', '0', '淳安县', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360924', '0', '宜丰县', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331004', '0', '路桥区', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411423', '0', '宁陵县', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411328', '0', '唐河县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360827', '0', '遂川县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370103', '0', '市中区', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350701', '0', '市辖区', '350700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('361181', '0', '德兴市', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371482', '0', '禹城市', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411727', '0', '汝南县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350626', '0', '东山县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411601', '0', '市辖区', '411600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411081', '0', '禹州市', '411000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360100', '0', '南昌市', '360000', null, null, '2', '0', '0', null, '163');
INSERT INTO `district` VALUES ('420201', '0', '市辖区', '420200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370101', '0', '市辖区', '370100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('360823', '0', '峡江县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350623', '0', '漳浦县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341881', '0', '宁国市', '341800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360104', '0', '青云谱区', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340303', '0', '蚌山区', '340300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340101', '0', '市辖区', '340100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371201', '0', '市辖区', '371200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350923', '0', '屏南县', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411523', '0', '新县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331001', '0', '市辖区', '331000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('330324', '0', '永嘉县', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410203', '0', '顺河回族区', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360323', '0', '芦溪县', '360300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410327', '0', '宜阳县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371311', '0', '罗庄区', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410603', '0', '山城区', '410600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421223', '0', '崇阳县', '421200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341523', '0', '舒城县', '341500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331123', '0', '遂昌县', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411729', '0', '新蔡县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340200', '0', '芜湖市', '340000', null, null, '2', '0', '0', null, '129');
INSERT INTO `district` VALUES ('330825', '0', '龙游县', '330800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360121', '0', '南昌县', '360100', null, null, '3', '0', '0', null, '163');
INSERT INTO `district` VALUES ('350181', '0', '福清市', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421121', '0', '团风县', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371521', '0', '阳谷县', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370500', '0', '东营市', '370000', null, null, '2', '0', '0', null, '174');
INSERT INTO `district` VALUES ('341203', '0', '颍东区', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360103', '0', '西湖区', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360735', '0', '石城县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422827', '0', '来凤县', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411421', '0', '民权县', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410882', '0', '沁阳市', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330205', '0', '江北区', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421201', '0', '市辖区', '421200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350901', '0', '市辖区', '350900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420581', '0', '宜都市', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341721', '0', '东至县', '341700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350582', '0', '晋江市', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371524', '0', '东阿县', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360921', '0', '奉新县', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422828', '0', '鹤峰县', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350401', '0', '市辖区', '350400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371427', '0', '夏津县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420106', '0', '武昌区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410183', '0', '新密市', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411521', '0', '罗山县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340000', '2', '安徽省', '000000', null, null, '1', '0', '0', null, '23');
INSERT INTO `district` VALUES ('410782', '0', '辉县市', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340304', '0', '禹会区', '340300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410802', '0', '解放区', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410205', '0', '禹王台区', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361002', '0', '临川区', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420822', '0', '沙洋县', '420800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360426', '0', '德安县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330382', '0', '乐清市', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411103', '0', '郾城区', '411100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420204', '0', '下陆区', '420200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421224', '0', '通山县', '421200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410224', '0', '开封县', '410200', null, null, '3', '0', '0', null, '210');
INSERT INTO `district` VALUES ('410302', '0', '老城区', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350627', '0', '南靖县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410505', '0', '殷都区', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340403', '0', '田家庵区', '340400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360105', '0', '湾里区', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341802', '0', '宣州区', '341800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430101', '0', '市辖区', '430100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('341101', '0', '市辖区', '341100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370982', '0', '新泰市', '370900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420506', '0', '夷陵区', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340301', '0', '市辖区', '340300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350823', '0', '上杭县', '350800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411728', '0', '遂平县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350182', '0', '长乐市', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410303', '0', '西工区', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421125', '0', '浠水县', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411621', '0', '扶沟县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350601', '0', '市辖区', '350600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370921', '0', '宁阳县', '370900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350824', '0', '武平县', '350800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330381', '0', '瑞安市', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350602', '0', '芗城区', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360923', '0', '上高县', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350400', '0', '三明市', '350000', null, null, '2', '0', '0', null, '254');
INSERT INTO `district` VALUES ('360123', '0', '安义县', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370783', '0', '寿光市', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330801', '0', '市辖区', '330800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371082', '0', '荣成市', '371000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370282', '0', '即墨市', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371726', '0', '鄄城县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430202', '0', '荷塘区', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341202', '0', '颍州区', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370113', '0', '长清区', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371121', '0', '五莲县', '371100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371200', '0', '莱芜市', '370000', null, null, '2', '0', '0', null, '124');
INSERT INTO `district` VALUES ('370682', '0', '莱阳市', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341200', '0', '阜阳市', '340000', null, null, '2', '0', '0', null, '128');
INSERT INTO `district` VALUES ('360322', '0', '上栗县', '360300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420921', '0', '孝昌县', '420900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411325', '0', '内乡县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350102', '0', '鼓楼区', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370481', '0', '滕州市', '370400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420505', '0', '猇亭区', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410927', '0', '台前县', '410900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411425', '0', '虞城县', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360301', '0', '市辖区', '360300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350429', '0', '泰宁县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331125', '0', '云和县', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411122', '0', '临颍县', '411100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341301', '0', '市辖区', '341300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411100', '0', '漯河市', '410000', null, null, '2', '0', '0', null, '344');
INSERT INTO `district` VALUES ('341503', '0', '裕安区', '341500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331126', '0', '庆元县', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370102', '0', '历下区', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410304', '0', '瀍河回族区', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361122', '0', '广丰县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360925', '0', '靖安县', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370283', '0', '平度市', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331000', '0', '台州市', '330000', null, null, '2', '0', '0', null, '244');
INSERT INTO `district` VALUES ('341323', '0', '灵璧县', '341300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420321', '0', '郧县', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340181', '0', '巢湖市', '340100', null, null, '3', '0', '0', null, '251');
INSERT INTO `district` VALUES ('410201', '0', '市辖区', '410200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371523', '0', '茌平县', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410902', '0', '华龙区', '410900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420107', '0', '青山区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371203', '0', '钢城区', '371200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331100', '0', '丽水市', '330000', null, null, '2', '0', '0', null, '292');
INSERT INTO `district` VALUES ('410704', '0', '凤泉区', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420200', '0', '黄石市', '420000', null, null, '2', '0', '0', null, '311');
INSERT INTO `district` VALUES ('330424', '0', '海盐县', '330400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350128', '0', '平潭县', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420683', '0', '枣阳市', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340201', '0', '市辖区', '340200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('360800', '0', '吉安市', '360000', null, null, '2', '0', '0', null, '318');
INSERT INTO `district` VALUES ('330702', '0', '婺城区', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430111', '0', '雨花区', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421127', '0', '黄梅县', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410602', '0', '鹤山区', '410600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410700', '0', '新乡市', '410000', null, null, '2', '0', '0', null, '152');
INSERT INTO `district` VALUES ('331102', '0', '莲都区', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411324', '0', '镇平县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350203', '0', '思明区', '350200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('419001', '0', '济源市', '419000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('350981', '0', '福安市', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420626', '0', '保康县', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350301', '0', '市辖区', '350300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410306', '0', '吉利区', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330902', '0', '定海区', '330900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370521', '0', '垦利县', '370500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330421', '0', '嘉善县', '330400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420606', '0', '樊城区', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360881', '0', '井冈山市', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341621', '0', '涡阳县', '341600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341282', '0', '界首市', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360700', '0', '赣州市', '360000', null, null, '2', '0', '0', null, '365');
INSERT INTO `district` VALUES ('370900', '0', '泰安市', '370000', null, null, '2', '0', '0', null, '325');
INSERT INTO `district` VALUES ('350201', '0', '市辖区', '350200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('360502', '0', '渝水区', '360500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340602', '0', '杜集区', '340600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420114', '0', '蔡甸区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370212', '0', '崂山区', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330700', '0', '金华市', '330000', null, null, '2', '0', '0', null, '333');
INSERT INTO `district` VALUES ('410100', '0', '郑州市', '410000', null, null, '2', '0', '0', null, '268');
INSERT INTO `district` VALUES ('340800', '0', '安庆市', '340000', null, null, '2', '0', '0', null, '130');
INSERT INTO `district` VALUES ('421002', '0', '沙市区', '421000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360481', '0', '瑞昌市', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340823', '0', '枞阳县', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420113', '0', '汉南区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420821', '0', '京山县', '420800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370802', '0', '市中区', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330206', '0', '北仑区', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350628', '0', '平和县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340523', '0', '和县', '340500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410721', '0', '新乡县', '410700', null, null, '3', '0', '0', null, '152');
INSERT INTO `district` VALUES ('360424', '0', '修水县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410501', '0', '市辖区', '410500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370613', '0', '莱山区', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350625', '0', '长泰县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420600', '0', '襄阳市', '420000', null, null, '2', '0', '0', null, '156');
INSERT INTO `district` VALUES ('330781', '0', '兰溪市', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420982', '0', '安陆市', '420900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410523', '0', '汤阴县', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420700', '0', '鄂州市', '420000', null, null, '2', '0', '0', null, '122');
INSERT INTO `district` VALUES ('341126', '0', '凤阳县', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350784', '0', '建阳市', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341124', '0', '全椒县', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411201', '0', '市辖区', '411200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350322', '0', '仙游县', '350300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410726', '0', '延津县', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410204', '0', '鼓楼区', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370301', '0', '市辖区', '370300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('360622', '0', '余江县', '360600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371401', '0', '市辖区', '371400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370686', '0', '栖霞市', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350782', '0', '武夷山市', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361101', '0', '市辖区', '361100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350123', '0', '罗源县', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371428', '0', '武城县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410727', '0', '封丘县', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411300', '0', '南阳市', '410000', null, null, '2', '0', '0', null, '309');
INSERT INTO `district` VALUES ('370112', '0', '历城区', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360403', '0', '浔阳区', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360482', '0', '共青城市', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341500', '0', '六安市', '340000', null, null, '2', '0', '0', null, '298');
INSERT INTO `district` VALUES ('370302', '0', '淄川区', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360724', '0', '上犹县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330101', '0', '市辖区', '330100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('360830', '0', '永新县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350700', '0', '南平市', '350000', null, null, '2', '0', '0', null, '133');
INSERT INTO `district` VALUES ('411282', '0', '灵宝市', '411200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371081', '0', '文登市', '371000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420115', '0', '江夏区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330481', '0', '海宁市', '330400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350526', '0', '德化县', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430203', '0', '芦淞区', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341226', '0', '颍上县', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350725', '0', '政和县', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360300', '0', '萍乡市', '360000', null, null, '2', '0', '0', null, '350');
INSERT INTO `district` VALUES ('341182', '0', '明光市', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370685', '0', '招远市', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411224', '0', '卢氏县', '411200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360802', '0', '吉州区', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371723', '0', '成武县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350402', '0', '梅列区', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410821', '0', '修武县', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371525', '0', '冠县', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('429021', '0', '神农架林区', '429000', null, null, '3', '0', '0', null, '2734');
INSERT INTO `district` VALUES ('420607', '0', '襄州区', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360731', '0', '于都县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350702', '0', '延平区', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330624', '0', '新昌县', '330600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350205', '0', '海沧区', '350200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411002', '0', '魏都区', '411000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340111', '0', '包河区', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350822', '0', '永定县', '350800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411330', '0', '桐柏县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410105', '0', '金水区', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350521', '0', '惠安县', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410103', '0', '二七区', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341524', '0', '金寨县', '341500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360726', '0', '安远县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370211', '0', '黄岛区', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341723', '0', '青阳县', '341700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360681', '0', '贵溪市', '360600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340600', '0', '淮北市', '340000', null, null, '2', '0', '0', null, '253');
INSERT INTO `district` VALUES ('330824', '0', '开化县', '330800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410482', '0', '汝州市', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371100', '0', '日照市', '370000', null, null, '2', '0', '0', null, '173');
INSERT INTO `district` VALUES ('411426', '0', '夏邑县', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370702', '0', '潍城区', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420922', '0', '大悟县', '420900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371423', '0', '庆云县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421100', '0', '黄冈市', '420000', null, null, '2', '0', '0', null, '271');
INSERT INTO `district` VALUES ('341225', '0', '阜南县', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370104', '0', '槐荫区', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360302', '0', '安源区', '360300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330502', '0', '吴兴区', '330500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330681', '0', '诸暨市', '330600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350103', '0', '台江区', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330000', '2', '浙江省', '000000', null, null, '1', '0', '0', null, '29');
INSERT INTO `district` VALUES ('421381', '0', '广水市', '421300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350825', '0', '连城县', '350800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370826', '0', '微山县', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360500', '0', '新余市', '360000', null, null, '2', '0', '0', null, '164');
INSERT INTO `district` VALUES ('370126', '0', '商河县', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410601', '0', '市辖区', '410600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420583', '0', '枝江市', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341525', '0', '霍山县', '341500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350500', '0', '泉州市', '350000', null, null, '2', '0', '0', null, '134');
INSERT INTO `district` VALUES ('370612', '0', '牟平区', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420923', '0', '云梦县', '420900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411500', '0', '信阳市', '410000', null, null, '2', '0', '0', null, '214');
INSERT INTO `district` VALUES ('341004', '0', '徽州区', '341000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330102', '0', '上城区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370600', '0', '烟台市', '370000', null, null, '2', '0', '0', null, '326');
INSERT INTO `district` VALUES ('321311', '0', '宿豫区', '321300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361123', '0', '玉山县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410901', '0', '市辖区', '410900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('421024', '0', '江陵县', '421000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370827', '0', '鱼台县', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341521', '0', '寿县', '341500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360902', '0', '袁州区', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340321', '0', '怀远县', '340300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321300', '0', '宿迁市', '320000', null, null, '2', '0', '0', null, '277');
INSERT INTO `district` VALUES ('420203', '0', '西塞山区', '420200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420117', '0', '新洲区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410811', '0', '山阳区', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370687', '0', '海阳市', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371202', '0', '莱城区', '371200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421124', '0', '英山县', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371702', '0', '牡丹区', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411302', '0', '宛城区', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340222', '0', '繁昌县', '340200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410724', '0', '获嘉县', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410502', '0', '文峰区', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370830', '0', '汶上县', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341321', '0', '砀山县', '341300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370400', '0', '枣庄市', '370000', null, null, '2', '0', '0', null, '172');
INSERT INTO `district` VALUES ('420601', '0', '市辖区', '420600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411625', '0', '郸城县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370181', '0', '章丘市', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430121', '0', '长沙县', '430100', null, null, '3', '0', '0', null, '158');
INSERT INTO `district` VALUES ('330302', '0', '鹿城区', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371426', '0', '平原县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370214', '0', '城阳区', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361100', '0', '上饶市', '360000', null, null, '2', '0', '0', null, '364');
INSERT INTO `district` VALUES ('411623', '0', '商水县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330301', '0', '市辖区', '330300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('429000', '0', '省直辖县级行政区划', '420000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('410522', '0', '安阳县', '410500', null, null, '3', '0', '0', null, '267');
INSERT INTO `district` VALUES ('350723', '0', '光泽县', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422800', '0', '恩施土家族苗族自治州', '420000', null, null, '2', '0', '0', null, '373');
INSERT INTO `district` VALUES ('370784', '0', '安丘市', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370704', '0', '坊子区', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340203', '0', '弋江区', '340200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411702', '0', '驿城区', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420111', '0', '洪山区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371622', '0', '阳信县', '371600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331101', '0', '市辖区', '331100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370401', '0', '市辖区', '370400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('429004', '0', '仙桃市', '429000', null, null, '3', '0', '0', null, '1713');
INSERT INTO `district` VALUES ('411481', '0', '永城市', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361026', '0', '宜黄县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330212', '0', '鄞州区', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321301', '0', '市辖区', '321300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('330203', '0', '海曙区', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420504', '0', '点军区', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420602', '0', '襄城区', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430100', '0', '长沙市', '430000', null, null, '2', '0', '0', null, '158');
INSERT INTO `district` VALUES ('420500', '0', '宜昌市', '420000', null, null, '2', '0', '0', null, '270');
INSERT INTO `district` VALUES ('371725', '0', '郓城县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361001', '0', '市辖区', '361000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340824', '0', '潜山县', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350900', '0', '宁德市', '350000', null, null, '2', '0', '0', null, '192');
INSERT INTO `district` VALUES ('361021', '0', '南城县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341823', '0', '泾县', '341800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361023', '0', '南丰县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410923', '0', '南乐县', '410900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411422', '0', '睢县', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330226', '0', '宁海县', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411528', '0', '息县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350212', '0', '同安区', '350200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330900', '0', '舟山市', '330000', null, null, '2', '0', '0', null, '245');
INSERT INTO `district` VALUES ('341324', '0', '泗县', '341300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410404', '0', '石龙区', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370203', '0', '市北区', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340124', '0', '庐江县', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410402', '0', '新华区', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360821', '0', '吉安县', '360800', null, null, '3', '0', '0', null, '318');
INSERT INTO `district` VALUES ('411503', '0', '平桥区', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370202', '0', '市南区', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350524', '0', '安溪县', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341501', '0', '市辖区', '341500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420625', '0', '谷城县', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420100', '0', '武汉市', '420000', null, null, '2', '0', '0', null, '218');
INSERT INTO `district` VALUES ('360122', '0', '新建县', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360601', '0', '市辖区', '360600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410381', '0', '偃师市', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350303', '0', '涵江区', '350300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340822', '0', '怀宁县', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420881', '0', '钟祥市', '420800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410222', '0', '通许县', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411602', '0', '川汇区', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350902', '0', '蕉城区', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410928', '0', '濮阳县', '410900', null, null, '3', '0', '0', null, '209');
INSERT INTO `district` VALUES ('370781', '0', '青州市', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330600', '0', '绍兴市', '330000', null, null, '2', '0', '0', null, '293');
INSERT INTO `district` VALUES ('360822', '0', '吉水县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331082', '0', '临海市', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410527', '0', '内黄县', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330200', '0', '宁波市', '330000', null, null, '2', '0', '0', null, '180');
INSERT INTO `district` VALUES ('420202', '0', '黄石港区', '420200', null, null, '3', '0', '0', null, '311');
INSERT INTO `district` VALUES ('411403', '0', '睢阳区', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341221', '0', '临泉县', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('429005', '0', '潜江市', '429000', null, null, '3', '0', '0', null, '1293');
INSERT INTO `district` VALUES ('350922', '0', '古田县', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360281', '0', '乐平市', '360200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321324', '0', '泗洪县', '321300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330211', '0', '镇海区', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370200', '0', '青岛市', '370000', null, null, '2', '0', '0', null, '236');
INSERT INTO `district` VALUES ('330683', '0', '嵊州市', '330600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371122', '0', '莒县', '371100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371323', '0', '沂水县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420105', '0', '汉阳区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411627', '0', '太康县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370125', '0', '济阳县', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350583', '0', '南安市', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330225', '0', '象山县', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411402', '0', '梁园区', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350525', '0', '永春县', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411424', '0', '柘城县', '411400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330328', '0', '文成县', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361025', '0', '乐安县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411401', '0', '市辖区', '411400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370883', '0', '邹城市', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350629', '0', '华安县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330322', '0', '洞头县', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350101', '0', '市辖区', '350100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410621', '0', '浚县', '410600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410803', '0', '中站区', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411326', '0', '淅川县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421003', '0', '荆州区', '421000', null, null, '3', '0', '0', null, '157');
INSERT INTO `district` VALUES ('330903', '0', '普陀区', '330900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370201', '0', '市辖区', '370200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420701', '0', '市辖区', '420700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371481', '0', '乐陵市', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421182', '0', '武穴市', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340503', '0', '花山区', '340500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410185', '0', '登封市', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410400', '0', '平顶山市', '410000', null, null, '2', '0', '0', null, '213');
INSERT INTO `district` VALUES ('411501', '0', '市辖区', '411500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371312', '0', '河东区', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430204', '0', '石峰区', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371721', '0', '曹县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360727', '0', '龙南县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421081', '0', '石首市', '421000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360729', '0', '全南县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370100', '0', '济南市', '370000', null, null, '2', '0', '0', null, '288');
INSERT INTO `district` VALUES ('371724', '0', '巨野县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420901', '0', '市辖区', '420900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('429006', '0', '天门市', '429000', null, null, '3', '0', '0', null, '2654');
INSERT INTO `district` VALUES ('371103', '0', '岚山区', '371100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410702', '0', '红旗区', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360429', '0', '湖口县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330483', '0', '桐乡市', '330400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361125', '0', '横峰县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350403', '0', '三元区', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331124', '0', '松阳县', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330482', '0', '平湖市', '330400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371722', '0', '单县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420684', '0', '宜城市', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410804', '0', '马村区', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421101', '0', '市辖区', '421100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350503', '0', '丰泽区', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370281', '0', '胶州市', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411000', '0', '许昌市', '410000', null, null, '2', '0', '0', null, '155');
INSERT INTO `district` VALUES ('341022', '0', '休宁县', '341000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360900', '0', '宜春市', '360000', null, null, '2', '0', '0', null, '278');
INSERT INTO `district` VALUES ('340604', '0', '烈山区', '340600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420800', '0', '荆门市', '420000', null, null, '2', '0', '0', null, '217');
INSERT INTO `district` VALUES ('360824', '0', '新干县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410800', '0', '焦作市', '410000', null, null, '2', '0', '0', null, '211');
INSERT INTO `district` VALUES ('411624', '0', '沈丘县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341100', '0', '滁州市', '340000', null, null, '2', '0', '0', null, '189');
INSERT INTO `district` VALUES ('360926', '0', '铜鼓县', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350122', '0', '连江县', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330104', '0', '江干区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371425', '0', '齐河县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411701', '0', '市辖区', '411700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371329', '0', '临沭县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360428', '0', '都昌县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410526', '0', '滑县', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360101', '0', '市辖区', '360100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410401', '0', '市辖区', '410400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('421221', '0', '嘉鱼县', '421200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421301', '0', '市辖区', '421300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411527', '0', '淮滨县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360401', '0', '市辖区', '360400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370832', '0', '梁山县', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410221', '0', '杞县', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370881', '0', '曲阜市', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410711', '0', '牧野区', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371602', '0', '滨城区', '371600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340701', '0', '市辖区', '340700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371502', '0', '东昌府区', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420527', '0', '秭归县', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422822', '0', '建始县', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410223', '0', '尉氏县', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341103', '0', '南谯区', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370705', '0', '奎文区', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341600', '0', '亳州市', '340000', null, null, '2', '0', '0', null, '188');
INSERT INTO `district` VALUES ('370323', '0', '沂源县', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411082', '0', '长葛市', '411000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350802', '0', '新罗区', '350800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350603', '0', '龙文区', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370684', '0', '蓬莱市', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350206', '0', '湖里区', '350200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330500', '0', '湖州市', '330000', null, null, '2', '0', '0', null, '294');
INSERT INTO `district` VALUES ('340121', '0', '长丰县', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371402', '0', '德城区', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360721', '0', '赣县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411400', '0', '商丘市', '410000', null, null, '2', '0', '0', null, '154');
INSERT INTO `district` VALUES ('370306', '0', '周村区', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341602', '0', '谯城区', '341600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341701', '0', '市辖区', '341700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430201', '0', '市辖区', '430200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420302', '0', '茅箭区', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350800', '0', '龙岩市', '350000', null, null, '2', '0', '0', null, '193');
INSERT INTO `district` VALUES ('350121', '0', '闽侯县', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340828', '0', '岳西县', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340700', '0', '铜陵市', '340000', null, null, '2', '0', '0', null, '337');
INSERT INTO `district` VALUES ('340221', '0', '芜湖县', '340200', null, null, '3', '0', '0', null, '129');
INSERT INTO `district` VALUES ('370983', '0', '肥城市', '370900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360982', '0', '樟树市', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360430', '0', '彭泽县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350721', '0', '顺昌县', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371701', '0', '市辖区', '371700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340123', '0', '肥西县', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330108', '0', '滨江区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411322', '0', '方城县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341003', '0', '黄山区', '341000', null, null, '3', '0', '0', null, '252');
INSERT INTO `district` VALUES ('411323', '0', '西峡县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370503', '0', '河口区', '370500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360521', '0', '分宜县', '360500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371083', '0', '乳山市', '371000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330922', '0', '嵊泗县', '330900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411023', '0', '许昌县', '411000', null, null, '3', '0', '0', null, '155');
INSERT INTO `district` VALUES ('330621', '0', '绍兴县', '330600', null, null, '3', '0', '0', null, '293');
INSERT INTO `district` VALUES ('370911', '0', '岱岳区', '370900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411222', '0', '陕县', '411200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330304', '0', '瓯海区', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330822', '0', '常山县', '330800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330106', '0', '西湖区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371601', '0', '市辖区', '371600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370700', '0', '潍坊市', '370000', null, null, '2', '0', '0', null, '287');
INSERT INTO `district` VALUES ('410184', '0', '新郑市', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420281', '0', '大冶市', '420200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421102', '0', '黄州区', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421303', '0', '曾都区', '421300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350921', '0', '霞浦县', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410328', '0', '洛宁县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370681', '0', '龙口市', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371522', '0', '莘县', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411526', '0', '潢川县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330411', '0', '秀洲区', '330400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420702', '0', '梁子湖区', '420700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340323', '0', '固镇县', '340300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340405', '0', '八公山区', '340400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330523', '0', '安吉县', '330500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350305', '0', '秀屿区', '350300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330703', '0', '金东区', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340202', '0', '镜湖区', '340200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411522', '0', '光山县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411102', '0', '源汇区', '411100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361130', '0', '婺源县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350481', '0', '永安市', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341623', '0', '利辛县', '341600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340603', '0', '相山区', '340600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410311', '0', '洛龙区', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410181', '0', '巩义市', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421126', '0', '蕲春县', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341722', '0', '石台县', '341700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371727', '0', '定陶县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410611', '0', '淇滨区', '410600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421222', '0', '通城县', '421200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361121', '0', '上饶县', '361100', null, null, '3', '0', '0', null, '364');
INSERT INTO `district` VALUES ('371327', '0', '莒南县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360983', '0', '高安市', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411281', '0', '义马市', '411200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411723', '0', '平舆县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411001', '0', '市辖区', '411000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('341023', '0', '黟县', '341000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430112', '0', '望城区', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411221', '0', '渑池县', '411200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371621', '0', '惠民县', '371600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331127', '0', '景宁畲族自治县', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370611', '0', '福山区', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411600', '0', '周口市', '410000', null, null, '2', '0', '0', null, '308');
INSERT INTO `district` VALUES ('331003', '0', '黄岩区', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430181', '0', '浏阳市', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410102', '0', '中原区', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361000', '0', '抚州市', '360000', null, null, '2', '0', '0', null, '226');
INSERT INTO `district` VALUES ('430103', '0', '天心区', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411524', '0', '商城县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410725', '0', '原阳县', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370800', '0', '济宁市', '370000', null, null, '2', '0', '0', null, '286');
INSERT INTO `district` VALUES ('331122', '0', '缙云县', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350213', '0', '翔安区', '350200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330602', '0', '越城区', '330600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420116', '0', '黄陂区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411726', '0', '泌阳县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360402', '0', '庐山区', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330283', '0', '奉化市', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422802', '0', '利川市', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360203', '0', '珠山区', '360200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420501', '0', '市辖区', '420500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340311', '0', '淮上区', '340300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330122', '0', '桐庐县', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420528', '0', '长阳土家族自治县', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360825', '0', '永丰县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330110', '0', '余杭区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330282', '0', '慈溪市', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350681', '0', '龙海市', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371000', '0', '威海市', '370000', null, null, '2', '0', '0', null, '175');
INSERT INTO `district` VALUES ('410182', '0', '荥阳市', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420503', '0', '伍家岗区', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410324', '0', '栾川县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360124', '0', '进贤县', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371328', '0', '蒙阴县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360723', '0', '大余县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370300', '0', '淄博市', '370000', null, null, '2', '0', '0', null, '354');
INSERT INTO `district` VALUES ('411681', '0', '项城市', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420525', '0', '远安县', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410728', '0', '长垣县', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410325', '0', '嵩县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361030', '0', '广昌县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411721', '0', '西平县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340601', '0', '市辖区', '340600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('330501', '0', '市辖区', '330500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('330201', '0', '市辖区', '330200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('331081', '0', '温岭市', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421281', '0', '赤壁市', '421200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350504', '0', '洛江区', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350924', '0', '寿宁县', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360722', '0', '信丰县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361128', '0', '鄱阳县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370829', '0', '嘉祥县', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410622', '0', '淇县', '410600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421300', '0', '随州市', '420000', null, null, '2', '0', '0', null, '371');
INSERT INTO `district` VALUES ('411329', '0', '新野县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360826', '0', '泰和县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411104', '0', '召陵区', '411100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420529', '0', '五峰土家族自治县', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340302', '0', '龙子湖区', '340300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410411', '0', '湛河区', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350424', '0', '宁化县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420301', '0', '市辖区', '420300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('361126', '0', '弋阳县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350527', '0', '金门县', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330783', '0', '东阳市', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371102', '0', '东港区', '371100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371422', '0', '宁津县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330105', '0', '拱墅区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350302', '0', '城厢区', '350300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330303', '0', '龙湾区', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350200', '0', '厦门市', '350000', null, null, '2', '0', '0', null, '194');
INSERT INTO `district` VALUES ('330800', '0', '衢州市', '330000', null, null, '2', '0', '0', null, '243');
INSERT INTO `district` VALUES ('361024', '0', '崇仁县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371424', '0', '临邑县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350783', '0', '建瓯市', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370725', '0', '昌乐县', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360102', '0', '东湖区', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360701', '0', '市辖区', '360700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340322', '0', '五河县', '340300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330601', '0', '市辖区', '330600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340802', '0', '迎江区', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321322', '0', '沭阳县', '321300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340406', '0', '潘集区', '340400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422823', '0', '巴东县', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340122', '0', '肥东县', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370601', '0', '市辖区', '370600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430200', '0', '株洲市', '430000', null, null, '2', '0', '0', null, '222');
INSERT INTO `district` VALUES ('420323', '0', '竹山县', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421083', '0', '洪湖市', '421000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330802', '0', '柯城区', '330800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360781', '0', '瑞金市', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420303', '0', '张湾区', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410305', '0', '涧西区', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331121', '0', '青田县', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360734', '0', '寻乌县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341300', '0', '宿州市', '340000', null, null, '2', '0', '0', null, '370');
INSERT INTO `district` VALUES ('330782', '0', '义乌市', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420104', '0', '硚口区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370321', '0', '桓台县', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410326', '0', '汝阳县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341800', '0', '宣城市', '340000', null, null, '2', '0', '0', null, '190');
INSERT INTO `district` VALUES ('370634', '0', '长岛县', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411200', '0', '三门峡市', '410000', null, null, '2', '0', '0', null, '212');
INSERT INTO `district` VALUES ('420381', '0', '丹江口市', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410421', '0', '宝丰县', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370501', '0', '市辖区', '370500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370304', '0', '博山区', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330402', '0', '南湖区', '330400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411202', '0', '湖滨区', '411200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371581', '0', '临清市', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371322', '0', '郯城县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421122', '0', '红安县', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360313', '0', '湘东区', '360300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371325', '0', '费县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330881', '0', '江山市', '330800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410801', '0', '市辖区', '410800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411628', '0', '鹿邑县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420682', '0', '老河口市', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411724', '0', '正阳县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411301', '0', '市辖区', '411300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340500', '0', '马鞍山市', '340000', null, null, '2', '0', '0', null, '358');
INSERT INTO `district` VALUES ('350624', '0', '诏安县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361027', '0', '金溪县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410825', '0', '温县', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370285', '0', '莱西市', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330803', '0', '衢江区', '330800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370901', '0', '市辖区', '370900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('419000', '0', '省直辖县级行政区划', '410000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('330109', '0', '萧山区', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340711', '0', '郊区', '340700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370406', '0', '山亭区', '370400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330723', '0', '武义县', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421023', '0', '监利县', '421000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341622', '0', '蒙城县', '341600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420300', '0', '十堰市', '420000', null, null, '2', '0', '0', null, '216');
INSERT INTO `district` VALUES ('410301', '0', '市辖区', '410300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420703', '0', '华容区', '420700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371421', '0', '陵县', '371400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360981', '0', '丰城市', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350100', '0', '福州市', '350000', null, null, '2', '0', '0', null, '300');
INSERT INTO `district` VALUES ('370303', '0', '张店区', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361029', '0', '东乡县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341821', '0', '郎溪县', '341800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410106', '0', '上街区', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410503', '0', '北关区', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370828', '0', '金乡县', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361102', '0', '信州区', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421001', '0', '市辖区', '421000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411303', '0', '卧龙区', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350104', '0', '仓山区', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410823', '0', '武陟县', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340504', '0', '雨山区', '340500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370000', '2', '山东省', '000000', null, null, '1', '0', '0', null, '8');
INSERT INTO `district` VALUES ('420900', '0', '孝感市', '420000', null, null, '2', '0', '0', null, '310');
INSERT INTO `district` VALUES ('420526', '0', '兴山县', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370782', '0', '诸城市', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360222', '0', '浮梁县', '360200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411626', '0', '淮阳县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420502', '0', '西陵区', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350781', '0', '邵武市', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361022', '0', '黎川县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360828', '0', '万安县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341824', '0', '绩溪县', '341800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350430', '0', '建宁县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370523', '0', '广饶县', '370500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360427', '0', '星子县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421000', '0', '荆州市', '420000', null, null, '2', '0', '0', null, '157');
INSERT INTO `district` VALUES ('360600', '0', '鹰潭市', '360000', null, null, '2', '0', '0', null, '279');
INSERT INTO `district` VALUES ('350124', '0', '闽清县', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411024', '0', '鄢陵县', '411000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422826', '0', '咸丰县', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410225', '0', '兰考县', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360829', '0', '安福县', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341021', '0', '歙县', '341000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341822', '0', '广德县', '341800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430000', '3', '湖南省', '000000', null, null, '1', '0', '0', null, '26');
INSERT INTO `district` VALUES ('410506', '0', '龙安区', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410581', '0', '林州市', '410500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411327', '0', '社旗县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350304', '0', '荔城区', '350300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('321302', '0', '宿城区', '321300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340103', '0', '庐阳区', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421022', '0', '公安县', '421000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371001', '0', '市辖区', '371000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410425', '0', '郏县', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370703', '0', '寒亭区', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350501', '0', '市辖区', '350500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('360801', '0', '市辖区', '360800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410322', '0', '孟津县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420205', '0', '铁山区', '420200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410202', '0', '龙亭区', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420624', '0', '南漳县', '420600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371728', '0', '东明县', '371700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330726', '0', '浦江县', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341001', '0', '市辖区', '341000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420101', '0', '市辖区', '420100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410422', '0', '叶县', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430104', '0', '岳麓区', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370923', '0', '东平县', '370900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350425', '0', '大田县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331024', '0', '仙居县', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340300', '0', '蚌埠市', '340000', null, null, '2', '0', '0', null, '126');
INSERT INTO `district` VALUES ('330522', '0', '长兴县', '330500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371501', '0', '市辖区', '371500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371623', '0', '无棣县', '371600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410000', '3', '河南省', '000000', null, null, '1', '0', '0', null, '30');
INSERT INTO `district` VALUES ('350600', '0', '漳州市', '350000', null, null, '2', '0', '0', null, '255');
INSERT INTO `district` VALUES ('340881', '0', '桐城市', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411725', '0', '确山县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360602', '0', '月湖区', '360600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370402', '0', '市中区', '370400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360901', '0', '市辖区', '360900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410329', '0', '伊川县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371624', '0', '沾化县', '371600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361129', '0', '万年县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410781', '0', '卫辉市', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360202', '0', '昌江区', '360200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340100', '0', '合肥市', '340000', null, null, '2', '0', '0', null, '127');
INSERT INTO `district` VALUES ('350421', '0', '明溪县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350125', '0', '永泰县', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340703', '0', '狮子山区', '340700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330281', '0', '余姚市', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340104', '0', '蜀山区', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330183', '0', '富阳市', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410423', '0', '鲁山县', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370602', '0', '芝罘区', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360400', '0', '九江市', '360000', null, null, '2', '0', '0', null, '349');
INSERT INTO `district` VALUES ('330204', '0', '江东区', '330200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411622', '0', '西华县', '411600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410200', '0', '开封市', '410000', null, null, '2', '0', '0', null, '210');
INSERT INTO `district` VALUES ('430124', '0', '宁乡县', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371300', '0', '临沂市', '370000', null, null, '2', '0', '0', null, '234');
INSERT INTO `district` VALUES ('341801', '0', '市辖区', '341800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370785', '0', '高密市', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410108', '0', '惠济区', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350111', '0', '晋安区', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350881', '0', '漳平市', '350800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411700', '0', '驻马店市', '410000', null, null, '2', '0', '0', null, '269');
INSERT INTO `district` VALUES ('340400', '0', '淮南市', '340000', null, null, '2', '0', '0', null, '250');
INSERT INTO `district` VALUES ('350722', '0', '浦城县', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430102', '0', '芙蓉区', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360803', '0', '青原区', '360800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420704', '0', '鄂城区', '420700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341222', '0', '太和县', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410101', '0', '市辖区', '410100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430105', '0', '开福区', '430100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340404', '0', '谢家集区', '340400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410922', '0', '清丰县', '410900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341322', '0', '萧县', '341300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340521', '0', '当涂县', '340500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331023', '0', '天台县', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340402', '0', '大通区', '340400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420112', '0', '东西湖区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360733', '0', '会昌县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330521', '0', '德清县', '330500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370105', '0', '天桥区', '370100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420802', '0', '东宝区', '420800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371625', '0', '博兴县', '371600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411502', '0', '浉河区', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330682', '0', '上虞市', '330600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371301', '0', '市辖区', '371300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350581', '0', '石狮市', '350500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370801', '0', '市辖区', '370800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('341002', '0', '屯溪区', '341000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350105', '0', '马尾区', '350100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410104', '0', '管城回族区', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330327', '0', '苍南县', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410822', '0', '博爱县', '410800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331181', '0', '龙泉市', '331100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370404', '0', '峄城区', '370400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350426', '0', '尤溪县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330329', '0', '泰顺县', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350423', '0', '清流县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370786', '0', '昌邑市', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420000', '3', '湖北省', '000000', null, null, '1', '0', '0', null, '15');
INSERT INTO `district` VALUES ('410900', '0', '濮阳市', '410000', null, null, '2', '0', '0', null, '209');
INSERT INTO `district` VALUES ('341302', '0', '埇桥区', '341300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360725', '0', '崇义县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330401', '0', '市辖区', '330400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411101', '0', '市辖区', '411100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410926', '0', '范县', '410900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340102', '0', '瑶海区', '340100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340207', '0', '鸠江区', '340200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410300', '0', '洛阳市', '410000', null, null, '2', '0', '0', null, '153');
INSERT INTO `district` VALUES ('340223', '0', '南陵县', '340200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370305', '0', '临淄区', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341700', '0', '池州市', '340000', null, null, '2', '0', '0', null, '299');
INSERT INTO `district` VALUES ('371500', '0', '聊城市', '370000', null, null, '2', '0', '0', null, '366');
INSERT INTO `district` VALUES ('421321', '0', '随县', '421300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350724', '0', '松溪县', '350700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420324', '0', '竹溪县', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371526', '0', '高唐县', '371500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420582', '0', '当阳市', '420500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340522', '0', '含山县', '340500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421181', '0', '麻城市', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350300', '0', '莆田市', '350000', null, null, '2', '0', '0', null, '195');
INSERT INTO `district` VALUES ('350622', '0', '云霄县', '350600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360200', '0', '景德镇市', '360000', null, null, '2', '0', '0', null, '225');
INSERT INTO `district` VALUES ('321323', '0', '泗阳县', '321300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340501', '0', '市辖区', '340500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('350982', '0', '福鼎市', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330784', '0', '永康市', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360421', '0', '九江县', '360400', null, null, '3', '0', '0', null, '349');
INSERT INTO `district` VALUES ('361028', '0', '资溪县', '361000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360201', '0', '市辖区', '360200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420102', '0', '江岸区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421200', '0', '咸宁市', '420000', null, null, '2', '0', '0', null, '362');
INSERT INTO `district` VALUES ('360000', '2', '江西省', '000000', null, null, '1', '0', '0', null, '31');
INSERT INTO `district` VALUES ('341601', '0', '市辖区', '341600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411722', '0', '上蔡县', '411700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350211', '0', '集美区', '350200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421202', '0', '咸安区', '421200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360111', '0', '青山湖区', '360100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371600', '0', '滨州市', '370000', null, null, '2', '0', '0', null, '235');
INSERT INTO `district` VALUES ('361124', '0', '铅山县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410481', '0', '舞钢市', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340826', '0', '宿松县', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340803', '0', '大观区', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411381', '0', '邓州市', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370831', '0', '泗水县', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410403', '0', '卫东区', '410400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360782', '0', '南康市', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370405', '0', '台儿庄区', '370400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370882', '0', '兖州市', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371326', '0', '平邑县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420981', '0', '应城市', '420900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370322', '0', '高青县', '370300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340401', '0', '市辖区', '340400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('411525', '0', '固始县', '411500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341201', '0', '市辖区', '341200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('371324', '0', '苍山县', '371300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410323', '0', '新安县', '410300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370902', '0', '泰山区', '370900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341522', '0', '霍邱县', '341500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371002', '0', '环翠区', '371000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360922', '0', '万载县', '360900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330182', '0', '建德市', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360702', '0', '章贡区', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330185', '0', '临安市', '330100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370522', '0', '利津县', '370500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331021', '0', '玉环县', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330400', '0', '嘉兴市', '330000', null, null, '2', '0', '0', null, '334');
INSERT INTO `district` VALUES ('340702', '0', '铜官山区', '340700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410122', '0', '中牟县', '410100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331002', '0', '椒江区', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371400', '0', '德州市', '370000', null, null, '2', '0', '0', null, '372');
INSERT INTO `district` VALUES ('421123', '0', '罗田县', '421100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411321', '0', '南召县', '411300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340421', '0', '凤台县', '340400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360732', '0', '兴国县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341024', '0', '祁门县', '341000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350428', '0', '将乐县', '350400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370724', '0', '临朐县', '370700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370213', '0', '李沧区', '370200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('422801', '0', '恩施市', '422800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420902', '0', '孝南区', '420900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410500', '0', '安阳市', '410000', null, null, '2', '0', '0', null, '267');
INSERT INTO `district` VALUES ('340721', '0', '铜陵县', '340700', null, null, '3', '0', '0', null, '337');
INSERT INTO `district` VALUES ('330901', '0', '市辖区', '330900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('340811', '0', '宜秀区', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350821', '0', '长汀县', '350800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341825', '0', '旌德县', '341800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370502', '0', '东营区', '370500', null, null, '3', '0', '0', null, '174');
INSERT INTO `district` VALUES ('350926', '0', '柘荣县', '350900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360423', '0', '武宁县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330701', '0', '市辖区', '330700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('370811', '0', '任城区', '370800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341125', '0', '定远县', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341204', '0', '颍泉区', '341200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('360321', '0', '莲花县', '360300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341102', '0', '琅琊区', '341100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341502', '0', '金安区', '341500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330326', '0', '平阳县', '330300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370701', '0', '市辖区', '370700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('410211', '0', '金明区', '410200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370683', '0', '莱州市', '370600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('421087', '0', '松滋市', '421000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340621', '0', '濉溪县', '340600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('370403', '0', '薛城区', '370400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330727', '0', '磐安县', '330700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('330100', '0', '杭州市', '330000', null, null, '2', '0', '0', null, '179');
INSERT INTO `district` VALUES ('420801', '0', '市辖区', '420800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('420222', '0', '阳新县', '420200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420322', '0', '郧西县', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350000', '2', '福建省', '000000', null, null, '1', '0', '0', null, '16');
INSERT INTO `district` VALUES ('360730', '0', '宁都县', '360700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('411025', '0', '襄城县', '411000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341702', '0', '贵池区', '341700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('361127', '0', '余干县', '361100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('350801', '0', '市辖区', '350800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('360425', '0', '永修县', '360400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340827', '0', '望江县', '340800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('341000', '0', '黄山市', '340000', null, null, '2', '0', '0', null, '252');
INSERT INTO `district` VALUES ('420103', '0', '江汉区', '420100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410703', '0', '卫滨区', '410700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('331022', '0', '三门县', '331000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420984', '0', '汉川市', '420900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('420325', '0', '房县', '420300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('340208', '0', '三山区', '340200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('371626', '0', '邹平县', '371600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('410701', '0', '市辖区', '410700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('513223', '0', '茂县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430523', '0', '邵阳县', '430500', null, null, '3', '0', '0', null, '273');
INSERT INTO `district` VALUES ('530625', '0', '永善县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513332', '0', '石渠县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431201', '0', '市辖区', '431200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('542121', '0', '昌都县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520323', '0', '绥阳县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441322', '0', '博罗县', '441300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510923', '0', '大英县', '510900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530630', '0', '水富县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433127', '0', '永顺县', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451102', '0', '八步区', '451100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520627', '0', '沿河土家族自治县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441701', '0', '市辖区', '441700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('431223', '0', '辰溪县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469006', '0', '万宁市', '469000', null, null, '3', '0', '0', null, '1216');
INSERT INTO `district` VALUES ('510132', '0', '新津县', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441800', '0', '清远市', '440000', null, null, '2', '0', '0', null, '197');
INSERT INTO `district` VALUES ('451200', '0', '河池市', '450000', null, null, '2', '0', '0', null, '143');
INSERT INTO `district` VALUES ('510800', '0', '广元市', '510000', null, null, '2', '0', '0', null, '329');
INSERT INTO `district` VALUES ('513323', '0', '丹巴县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530700', '0', '丽江市', '530000', null, null, '2', '0', '0', null, '114');
INSERT INTO `district` VALUES ('450502', '0', '海城区', '450500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450621', '0', '上思县', '450600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469023', '0', '澄迈县', '469000', null, null, '3', '0', '0', null, '2757');
INSERT INTO `district` VALUES ('511381', '0', '阆中市', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430423', '0', '衡山县', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530922', '0', '云县', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430703', '0', '鼎城区', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445102', '0', '湘桥区', '445100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451300', '0', '来宾市', '450000', null, null, '2', '0', '0', null, '202');
INSERT INTO `district` VALUES ('511101', '0', '市辖区', '511100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('510801', '0', '市辖区', '510800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('440282', '0', '南雄市', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450900', '0', '玉林市', '450000', null, null, '2', '0', '0', null, '361');
INSERT INTO `district` VALUES ('440882', '0', '雷州市', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430902', '0', '资阳区', '430900', null, null, '3', '0', '0', null, '242');
INSERT INTO `district` VALUES ('510121', '0', '金堂县', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441500', '0', '汕尾市', '440000', null, null, '2', '0', '0', null, '339');
INSERT INTO `district` VALUES ('450332', '0', '恭城瑶族自治县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430923', '0', '安化县', '430900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510131', '0', '蒲江县', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532523', '0', '屏边苗族自治县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510704', '0', '游仙区', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450804', '0', '覃塘区', '450800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510821', '0', '旺苍县', '510800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450103', '0', '青秀区', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510603', '0', '旌阳区', '510600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450127', '0', '横县', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469021', '0', '定安县', '469000', null, null, '3', '0', '0', null, '1214');
INSERT INTO `district` VALUES ('510725', '0', '梓潼县', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450722', '0', '浦北县', '450700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532922', '0', '漾濞彝族自治县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530622', '0', '巧家县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440704', '0', '江海区', '440700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450521', '0', '合浦县', '450500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530723', '0', '华坪县', '530700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511700', '0', '达州市', '510000', null, null, '2', '0', '0', null, '369');
INSERT INTO `district` VALUES ('532327', '0', '永仁县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530823', '0', '景东彝族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440222', '0', '始兴县', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440501', '0', '市辖区', '440500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('441302', '0', '惠城区', '441300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522601', '0', '凯里市', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520401', '0', '市辖区', '520400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450702', '0', '钦南区', '450700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431123', '0', '双牌县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445103', '0', '潮安区', '445100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522623', '0', '施秉县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451227', '0', '巴马瑶族自治县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532624', '0', '麻栗坡县', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520328', '0', '湄潭县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532900', '0', '大理白族自治州', '530000', null, null, '2', '0', '0', null, '111');
INSERT INTO `district` VALUES ('445101', '0', '市辖区', '445100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('513436', '0', '美姑县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530628', '0', '彝良县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510400', '0', '攀枝花市', '510000', null, null, '2', '0', '0', null, '81');
INSERT INTO `district` VALUES ('520423', '0', '镇宁布依族苗族自治县', '520400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510724', '0', '安县', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430521', '0', '邵东县', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530827', '0', '孟连傣族拉祜族佤族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511304', '0', '嘉陵区', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445122', '0', '饶平县', '445100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441202', '0', '端州区', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510822', '0', '青川县', '510800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431101', '0', '市辖区', '431100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('510811', '0', '元坝区', '510800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433123', '0', '凤凰县', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440515', '0', '澄海区', '440500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510500', '0', '泸州市', '510000', null, null, '2', '0', '0', null, '331');
INSERT INTO `district` VALUES ('441882', '0', '连州市', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513335', '0', '巴塘县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533323', '0', '福贡县', '533300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530426', '0', '峨山彝族自治县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530902', '0', '临翔区', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460323', '0', '中沙群岛的岛礁及其海域', '460300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513328', '0', '甘孜县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445202', '0', '榕城区', '445200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510322', '0', '富顺县', '510300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511421', '0', '仁寿县', '511400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532928', '0', '永平县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532525', '0', '石屏县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431000', '0', '郴州市', '430000', null, null, '2', '0', '0', null, '275');
INSERT INTO `district` VALUES ('451027', '0', '凌云县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430800', '0', '张家界市', '430000', null, null, '2', '0', '0', null, '312');
INSERT INTO `district` VALUES ('440115', '0', '南沙区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441702', '0', '江城区', '441700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460300', '0', '三沙市', '460000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('430581', '0', '武冈市', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445203', '0', '揭东区', '445200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522727', '0', '平塘县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530828', '0', '澜沧拉祜族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440105', '0', '海珠区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450226', '0', '三江侗族自治县', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430211', '0', '天元区', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451401', '0', '市辖区', '451400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('513432', '0', '喜德县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530900', '0', '临沧市', '530000', null, null, '2', '0', '0', null, '110');
INSERT INTO `district` VALUES ('532622', '0', '砚山县', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430281', '0', '醴陵市', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530126', '0', '石林彝族自治县', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430901', '0', '市辖区', '430900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450325', '0', '兴安县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511528', '0', '兴文县', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431126', '0', '宁远县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500242', '0', '酉阳土家族苗族自治县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440500', '0', '汕头市', '440000', null, null, '2', '0', '0', null, '303');
INSERT INTO `district` VALUES ('510901', '0', '市辖区', '510900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450125', '0', '上林县', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469003', '0', '儋州市', '469000', null, null, '3', '0', '0', null, '1215');
INSERT INTO `district` VALUES ('440112', '0', '黄埔区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445200', '0', '揭阳市', '440000', null, null, '2', '0', '0', null, '259');
INSERT INTO `district` VALUES ('451023', '0', '平果县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522625', '0', '镇远县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431003', '0', '苏仙区', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430525', '0', '洞口县', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510700', '0', '绵阳市', '510000', null, null, '2', '0', '0', null, '240');
INSERT INTO `district` VALUES ('512002', '0', '雁江区', '512000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530401', '0', '市辖区', '530400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430406', '0', '雁峰区', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440604', '0', '禅城区', '440600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511600', '0', '广安市', '510000', null, null, '2', '0', '0', null, '241');
INSERT INTO `district` VALUES ('532930', '0', '洱源县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440100', '0', '广州市', '440000', null, null, '2', '0', '0', null, '257');
INSERT INTO `district` VALUES ('530113', '0', '东川区', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520321', '0', '遵义县', '520300', null, null, '3', '0', '0', null, '262');
INSERT INTO `district` VALUES ('511422', '0', '彭山县', '511400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530322', '0', '陆良县', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450801', '0', '市辖区', '450800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('511922', '0', '南江县', '511900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440804', '0', '坡头区', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500229', '0', '城口县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530721', '0', '玉龙纳西族自治县', '530700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440703', '0', '蓬江区', '440700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532932', '0', '鹤庆县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431081', '0', '资兴市', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430382', '0', '韶山市', '430300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451321', '0', '忻城县', '451300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500113', '0', '巴南区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530112', '0', '西山区', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513422', '0', '木里藏族自治县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520101', '0', '市辖区', '520100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('451101', '0', '市辖区', '451100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('513221', '0', '汶川县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520201', '0', '钟山区', '520200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445201', '0', '市辖区', '445200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('500101', '0', '万州区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431122', '0', '东安县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511401', '0', '市辖区', '511400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('511901', '0', '市辖区', '511900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('522700', '0', '黔南布依族苗族自治州', '520000', null, null, '2', '0', '0', null, '306');
INSERT INTO `district` VALUES ('530324', '0', '罗平县', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431022', '0', '宜章县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440402', '0', '香洲区', '440400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('512021', '0', '安岳县', '512000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510781', '0', '江油市', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510115', '0', '温江区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441723', '0', '阳东县', '441700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532527', '0', '泸西县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440801', '0', '市辖区', '440800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('520628', '0', '松桃苗族自治县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510922', '0', '射洪县', '510900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441323', '0', '惠东县', '441300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520500', '0', '毕节市', '520000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('513437', '0', '雷波县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522622', '0', '黄平县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441423', '0', '丰顺县', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522628', '0', '锦屏县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513427', '0', '宁南县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430524', '0', '隆回县', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520115', '0', '观山湖区', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522728', '0', '罗甸县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511702', '0', '通川区', '511700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511402', '0', '东坡区', '511400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542123', '0', '贡觉县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440607', '0', '三水区', '440600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510403', '0', '西区', '510400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451222', '0', '天峨县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430224', '0', '茶陵县', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530925', '0', '双江拉祜族佤族布朗族傣族自治县', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532529', '0', '红河县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450501', '0', '市辖区', '450500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450331', '0', '荔浦县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511100', '0', '乐山市', '510000', null, null, '2', '0', '0', null, '79');
INSERT INTO `district` VALUES ('450302', '0', '秀峰区', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520502', '0', '七星关区', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520602', '0', '碧江区', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510900', '0', '遂宁市', '510000', null, null, '2', '0', '0', null, '330');
INSERT INTO `district` VALUES ('445323', '0', '云安县', '445300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510301', '0', '市辖区', '510300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450100', '0', '南宁市', '450000', null, null, '2', '0', '0', null, '261');
INSERT INTO `district` VALUES ('510107', '0', '武侯区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500109', '0', '北碚区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510904', '0', '安居区', '510900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510112', '0', '龙泉驿区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520622', '0', '玉屏侗族自治县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530125', '0', '宜良县', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450803', '0', '港南区', '450800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540126', '0', '达孜县', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511824', '0', '石棉县', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513224', '0', '松潘县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445381', '0', '罗定市', '445300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430725', '0', '桃源县', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532532', '0', '河口瑶族自治县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511123', '0', '犍为县', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511302', '0', '顺庆区', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431302', '0', '娄星区', '431300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450700', '0', '钦州市', '450000', null, null, '2', '0', '0', null, '145');
INSERT INTO `district` VALUES ('511111', '0', '沙湾区', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430601', '0', '市辖区', '430600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('460321', '0', '西沙群岛', '460300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520325', '0', '道真仡佬族苗族自治县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500227', '0', '璧山县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441226', '0', '德庆县', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522635', '0', '麻江县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510183', '0', '邛崃市', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530901', '0', '市辖区', '530900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('441303', '0', '惠阳区', '441300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441203', '0', '鼎湖区', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431200', '0', '怀化市', '430000', null, null, '2', '0', '0', null, '363');
INSERT INTO `district` VALUES ('520425', '0', '紫云苗族布依族自治县', '520400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441803', '0', '清新区', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511603', '0', '前锋区', '511600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430922', '0', '桃江县', '430900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450124', '0', '马山县', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430822', '0', '桑植县', '430800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530927', '0', '沧源佤族自治县', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522326', '0', '望谟县', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511503', '0', '南溪区', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513429', '0', '布拖县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522630', '0', '台江县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511303', '0', '高坪区', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520121', '0', '开阳县', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451201', '0', '市辖区', '451200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('522324', '0', '晴隆县', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431021', '0', '桂阳县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511822', '0', '荥经县', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440923', '0', '电白县', '440900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530824', '0', '景谷傣族彝族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522629', '0', '剑河县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530325', '0', '富源县', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460322', '0', '南沙群岛', '460300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511521', '0', '宜宾县', '511500', null, null, '3', '0', '0', null, '186');
INSERT INTO `district` VALUES ('511126', '0', '夹江县', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440304', '0', '福田区', '440300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450481', '0', '岑溪市', '450400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450321', '0', '阳朔县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451021', '0', '田阳县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511723', '0', '开江县', '511700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510726', '0', '北川羌族自治县', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469000', '0', '省直辖县级行政区划', '460000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('520327', '0', '凤冈县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511725', '0', '渠县', '511700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530300', '0', '曲靖市', '530000', null, null, '2', '0', '0', null, '249');
INSERT INTO `district` VALUES ('513435', '0', '甘洛县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532501', '0', '个旧市', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469025', '0', '白沙黎族自治县', '469000', null, null, '3', '0', '0', null, '2359');
INSERT INTO `district` VALUES ('522633', '0', '从江县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431382', '0', '涟源市', '431300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500107', '0', '九龙坡区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440507', '0', '龙湖区', '440500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530128', '0', '禄劝彝族苗族自治县', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532626', '0', '丘北县', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430223', '0', '攸县', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430821', '0', '慈利县', '430800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513336', '0', '乡城县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451122', '0', '钟山县', '451100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513225', '0', '九寨沟县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440116', '0', '萝岗区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522725', '0', '瓮安县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430981', '0', '沅江市', '430900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522722', '0', '荔波县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430802', '0', '永定区', '430800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440783', '0', '开平市', '440700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511112', '0', '五通桥区', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532328', '0', '元谋县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469027', '0', '乐东黎族自治县', '469000', null, null, '3', '0', '0', null, '2032');
INSERT INTO `district` VALUES ('445302', '0', '云城区', '445300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451402', '0', '江州区', '451400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451228', '0', '都安瑶族自治县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520326', '0', '务川仡佬族苗族自治县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431121', '0', '祁阳县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510903', '0', '船山区', '510900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441225', '0', '封开县', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513425', '0', '会理县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431300', '0', '娄底市', '430000', null, null, '2', '0', '0', null, '221');
INSERT INTO `district` VALUES ('460108', '0', '美兰区', '460100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500232', '0', '武隆县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510402', '0', '东区', '510400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510101', '0', '市辖区', '510100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('511902', '0', '巴州区', '511900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430421', '0', '衡阳县', '430400', null, null, '3', '0', '0', null, '159');
INSERT INTO `district` VALUES ('431281', '0', '洪江市', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450326', '0', '永福县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430422', '0', '衡南县', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430412', '0', '南岳区', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441201', '0', '市辖区', '441200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('510124', '0', '郫县', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460101', '0', '市辖区', '460100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430301', '0', '市辖区', '430300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('532924', '0', '宾川县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440981', '0', '高州市', '440900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511102', '0', '市中区', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430528', '0', '新宁县', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469005', '0', '文昌市', '469000', null, null, '3', '0', '0', null, '2758');
INSERT INTO `district` VALUES ('450601', '0', '市辖区', '450600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('520601', '0', '市辖区', '520600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('511800', '0', '雅安市', '510000', null, null, '2', '0', '0', null, '76');
INSERT INTO `district` VALUES ('513326', '0', '道孚县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500110', '0', '綦江区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460100', '0', '海口市', '460000', null, null, '2', '0', '0', null, '125');
INSERT INTO `district` VALUES ('450303', '0', '叠彩区', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520221', '0', '水城县', '520200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510421', '0', '米易县', '510400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440800', '0', '湛江市', '440000', null, null, '2', '0', '0', null, '198');
INSERT INTO `district` VALUES ('510401', '0', '市辖区', '510400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450329', '0', '资源县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441502', '0', '城区', '441500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520625', '0', '印江土家族苗族自治县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440301', '0', '市辖区', '440300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('500241', '0', '秀山土家族苗族自治县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440802', '0', '赤坎区', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441622', '0', '龙川县', '441600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520300', '0', '遵义市', '520000', null, null, '2', '0', '0', null, '262');
INSERT INTO `district` VALUES ('450300', '0', '桂林市', '450000', null, null, '2', '0', '0', null, '142');
INSERT INTO `district` VALUES ('522729', '0', '长顺县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511825', '0', '天全县', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533422', '0', '德钦县', '533400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431225', '0', '会同县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500104', '0', '大渡口区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530400', '0', '玉溪市', '530000', null, null, '2', '0', '0', null, '106');
INSERT INTO `district` VALUES ('510129', '0', '大邑县', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450903', '0', '福绵区', '450900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441600', '0', '河源市', '440000', null, null, '2', '0', '0', null, '200');
INSERT INTO `district` VALUES ('530114', '0', '呈贡区', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511724', '0', '大竹县', '511700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440103', '0', '荔湾区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522627', '0', '天柱县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445281', '0', '普宁市', '445200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511681', '0', '华蓥市', '511600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513401', '0', '西昌市', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430602', '0', '岳阳楼区', '430600', null, null, '3', '0', '0', null, '220');
INSERT INTO `district` VALUES ('451481', '0', '凭祥市', '451400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450503', '0', '银海区', '450500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430781', '0', '津市市', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511622', '0', '武胜县', '511600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450126', '0', '宾阳县', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510727', '0', '平武县', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430903', '0', '赫山区', '430900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520402', '0', '西秀区', '520400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522322', '0', '兴仁县', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441700', '0', '阳江市', '440000', null, null, '2', '0', '0', null, '199');
INSERT INTO `district` VALUES ('513430', '0', '金阳县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513433', '0', '冕宁县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500108', '0', '南岸区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520623', '0', '石阡县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440600', '0', '佛山市', '440000', null, null, '2', '0', '0', null, '138');
INSERT INTO `district` VALUES ('430723', '0', '澧县', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532503', '0', '蒙自市', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450923', '0', '博白县', '450900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511502', '0', '翠屏区', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430482', '0', '常宁市', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513426', '0', '会东县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451025', '0', '靖西县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440811', '0', '麻章区', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513423', '0', '盐源县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511301', '0', '市辖区', '511300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('533423', '0', '维西傈僳族自治县', '533400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533122', '0', '梁河县', '533100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450602', '0', '港口区', '450600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522636', '0', '丹寨县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513334', '0', '理塘县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450512', '0', '铁山港区', '450500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530427', '0', '新平彝族傣族自治县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532931', '0', '剑川县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430522', '0', '新邵县', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431028', '0', '安仁县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532500', '0', '红河哈尼族彝族自治州', '530000', null, null, '2', '0', '0', null, '107');
INSERT INTO `district` VALUES ('530323', '0', '师宗县', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451202', '0', '金城江区', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450101', '0', '市辖区', '450100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430527', '0', '绥宁县', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431321', '0', '双峰县', '431300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530103', '0', '盘龙区', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522301', '0', '兴义市', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431002', '0', '北湖区', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469029', '0', '保亭黎族苗族自治县', '469000', null, null, '3', '0', '0', null, '1217');
INSERT INTO `district` VALUES ('440606', '0', '顺德区', '440600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513434', '0', '越西县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450922', '0', '陆川县', '450900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530522', '0', '腾冲县', '530500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450305', '0', '七星区', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450102', '0', '兴宁区', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469001', '0', '五指山市', '469000', null, null, '3', '0', '0', null, '1644');
INSERT INTO `district` VALUES ('430529', '0', '城步苗族自治县', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520123', '0', '修文县', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510303', '0', '贡井区', '510300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540121', '0', '林周县', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511025', '0', '资中县', '511000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533400', '0', '迪庆藏族自治州', '530000', null, null, '2', '0', '0', null, '115');
INSERT INTO `district` VALUES ('500238', '0', '巫溪县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441481', '0', '兴宁市', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511002', '0', '市中区', '511000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441224', '0', '怀集县', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530521', '0', '施甸县', '530500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451425', '0', '天等县', '451400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532823', '0', '勐腊县', '532800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513338', '0', '得荣县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530100', '0', '昆明市', '530000', null, null, '2', '0', '0', null, '104');
INSERT INTO `district` VALUES ('513327', '0', '炉霍县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500224', '0', '铜梁县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451024', '0', '德保县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450802', '0', '港北区', '450800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510824', '0', '苍溪县', '510800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441426', '0', '平远县', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520111', '0', '花溪区', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510601', '0', '市辖区', '510600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430722', '0', '汉寿县', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430424', '0', '衡东县', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520203', '0', '六枝特区', '520200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451424', '0', '大新县', '451400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441421', '0', '梅县', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510122', '0', '双流县', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500117', '0', '合川区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522723', '0', '贵定县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440205', '0', '曲江区', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510504', '0', '龙马潭区', '510500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520624', '0', '思南县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450224', '0', '融安县', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510600', '0', '德阳市', '510000', null, null, '2', '0', '0', null, '74');
INSERT INTO `district` VALUES ('510681', '0', '广汉市', '510600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430600', '0', '岳阳市', '430000', null, null, '2', '0', '0', null, '220');
INSERT INTO `district` VALUES ('441300', '0', '惠州市', '440000', null, null, '2', '0', '0', null, '301');
INSERT INTO `district` VALUES ('530428', '0', '元江哈尼族彝族傣族自治县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520382', '0', '仁怀市', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530500', '0', '保山市', '530000', null, null, '2', '0', '0', null, '112');
INSERT INTO `district` VALUES ('530101', '0', '市辖区', '530100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('530722', '0', '永胜县', '530700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441623', '0', '连平县', '441600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510300', '0', '自贡市', '510000', null, null, '2', '0', '0', null, '78');
INSERT INTO `district` VALUES ('430407', '0', '石鼓区', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430426', '0', '祁东县', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440183', '0', '增城市', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532625', '0', '马关县', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530821', '0', '宁洱哈尼族彝族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511001', '0', '市辖区', '511000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('522300', '0', '黔西南布依族苗族自治州', '520000', null, null, '2', '0', '0', null, '343');
INSERT INTO `district` VALUES ('441401', '0', '市辖区', '441400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430623', '0', '华容县', '430600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530822', '0', '墨江哈尼族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522732', '0', '三都水族自治县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511024', '0', '威远县', '511000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445222', '0', '揭西县', '445200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511011', '0', '东兴区', '511000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510823', '0', '剑阁县', '510800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500116', '0', '江津区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530627', '0', '镇雄县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533124', '0', '陇川县', '533100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532801', '0', '景洪市', '532800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445322', '0', '郁南县', '445300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513431', '0', '昭觉县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511921', '0', '通江县', '511900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451028', '0', '乐业县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433125', '0', '保靖县', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530600', '0', '昭通市', '530000', null, null, '2', '0', '0', null, '336');
INSERT INTO `district` VALUES ('451322', '0', '象州县', '451300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469024', '0', '临高县', '469000', null, null, '3', '0', '0', null, '2033');
INSERT INTO `district` VALUES ('500111', '0', '大足区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441801', '0', '市辖区', '441800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('513226', '0', '金川县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532502', '0', '开远市', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451223', '0', '凤山县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513222', '0', '理县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522327', '0', '册亨县', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520329', '0', '余庆县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431103', '0', '冷水滩区', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532329', '0', '武定县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530425', '0', '易门县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440201', '0', '市辖区', '440200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('451400', '0', '崇左市', '450000', null, null, '2', '0', '0', null, '144');
INSERT INTO `district` VALUES ('520424', '0', '关岭布依族苗族自治县', '520400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500237', '0', '巫山县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520102', '0', '南明区', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431025', '0', '临武县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430801', '0', '市辖区', '430800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('520525', '0', '纳雍县', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510182', '0', '彭州市', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440983', '0', '信宜市', '440900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520522', '0', '黔西县', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450800', '0', '贵港市', '450000', null, null, '2', '0', '0', null, '341');
INSERT INTO `district` VALUES ('520000', '4', '贵州省', '000000', null, null, '1', '0', '0', null, '24');
INSERT INTO `district` VALUES ('511425', '0', '青神县', '511400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532301', '0', '楚雄市', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451029', '0', '田林县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440106', '0', '天河区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532331', '0', '禄丰县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500233', '0', '忠县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440104', '0', '越秀区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520626', '0', '德江县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450200', '0', '柳州市', '450000', null, null, '2', '0', '0', null, '305');
INSERT INTO `district` VALUES ('450204', '0', '柳南区', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450105', '0', '江南区', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440825', '0', '徐闻县', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511623', '0', '邻水县', '511600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530422', '0', '澄江县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530702', '0', '古城区', '530700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441402', '0', '梅江区', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511802', '0', '雨城区', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513227', '0', '小金县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511132', '0', '峨边彝族自治县', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510525', '0', '古蔺县', '510500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533103', '0', '芒市', '533100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500223', '0', '潼南县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510502', '0', '江阳区', '510500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440400', '0', '珠海市', '440000', null, null, '2', '0', '0', null, '140');
INSERT INTO `district` VALUES ('450324', '0', '全州县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522731', '0', '惠水县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500103', '0', '渝中区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460107', '0', '琼山区', '460100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511324', '0', '仪陇县', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500000', '4', '重庆市', '000000', null, null, '1', '0', '0', null, '132');
INSERT INTO `district` VALUES ('532925', '0', '弥渡县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450107', '0', '西乡塘区', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441284', '0', '四会市', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511129', '0', '沐川县', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450109', '0', '邕宁区', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513233', '0', '红原县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511803', '0', '名山区', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441826', '0', '连南瑶族自治县', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430501', '0', '市辖区', '430500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('520421', '0', '平坝县', '520400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460201', '0', '市辖区', '460200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('530924', '0', '镇康县', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500118', '0', '永川区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510311', '0', '沿滩区', '510300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530601', '0', '市辖区', '530600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('441301', '0', '市辖区', '441300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('530624', '0', '大关县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511923', '0', '平昌县', '511900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469007', '0', '东方市', '469000', null, null, '3', '0', '0', null, '2634');
INSERT INTO `district` VALUES ('520527', '0', '赫章县', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440232', '0', '乳源瑶族自治县', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520621', '0', '江口县', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440224', '0', '仁化县', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440303', '0', '罗湖区', '440300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530800', '0', '普洱市', '530000', null, null, '2', '0', '0', null, '108');
INSERT INTO `district` VALUES ('513400', '0', '凉山彝族自治州', '510000', null, null, '2', '0', '0', null, '80');
INSERT INTO `district` VALUES ('540122', '0', '当雄县', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('512001', '0', '市辖区', '512000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430381', '0', '湘乡市', '430300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450225', '0', '融水苗族自治县', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450123', '0', '隆安县', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440902', '0', '茂南区', '440900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530102', '0', '五华区', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431301', '0', '市辖区', '431300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450327', '0', '灌阳县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460106', '0', '龙华区', '460100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440233', '0', '新丰县', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520523', '0', '金沙县', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500200', '0', '县', '500000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('532300', '0', '楚雄彝族自治州', '530000', null, null, '2', '0', '0', null, '105');
INSERT INTO `district` VALUES ('450681', '0', '东兴市', '450600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511529', '0', '屏山县', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433122', '0', '泸溪县', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440308', '0', '盐田区', '440300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510521', '0', '泸县', '510500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440881', '0', '廉江市', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430900', '0', '益阳市', '430000', null, null, '2', '0', '0', null, '272');
INSERT INTO `district` VALUES ('431127', '0', '蓝山县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532929', '0', '云龙县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433126', '0', '古丈县', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441625', '0', '东源县', '441600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451221', '0', '南丹县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430702', '0', '武陵区', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530802', '0', '思茅区', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511113', '0', '金口河区', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540124', '0', '曲水县', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430603', '0', '云溪区', '430600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440523', '0', '南澳县', '440500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469030', '0', '琼中黎族苗族自治县', '469000', null, null, '3', '0', '0', null, '2031');
INSERT INTO `district` VALUES ('430721', '0', '安乡县', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522600', '0', '黔东南苗族侗族自治州', '520000', null, null, '2', '0', '0', null, '342');
INSERT INTO `district` VALUES ('522624', '0', '三穗县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451421', '0', '扶绥县', '451400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513229', '0', '马尔康县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430700', '0', '常德市', '430000', null, null, '2', '0', '0', null, '219');
INSERT INTO `district` VALUES ('511526', '0', '珙县', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510683', '0', '绵竹市', '510600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520524', '0', '织金县', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532530', '0', '金平苗族瑶族傣族自治县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520330', '0', '习水县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532623', '0', '西畴县', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532326', '0', '大姚县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520100', '0', '贵阳市', '520000', null, null, '2', '0', '0', null, '146');
INSERT INTO `district` VALUES ('441721', '0', '阳西县', '441700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441521', '0', '海丰县', '441500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530921', '0', '凤庆县', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440901', '0', '市辖区', '440900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430300', '0', '湘潭市', '430000', null, null, '2', '0', '0', null, '313');
INSERT INTO `district` VALUES ('431024', '0', '嘉禾县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511903', '0', '恩阳区', '511900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469026', '0', '昌江黎族自治县', '469000', null, null, '3', '0', '0', null, '1642');
INSERT INTO `district` VALUES ('513300', '0', '甘孜藏族自治州', '510000', null, null, '2', '0', '0', null, '73');
INSERT INTO `district` VALUES ('513324', '0', '九龙县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511400', '0', '眉山市', '510000', null, null, '2', '0', '0', null, '77');
INSERT INTO `district` VALUES ('532822', '0', '勐海县', '532800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511500', '0', '宜宾市', '510000', null, null, '2', '0', '0', null, '186');
INSERT INTO `district` VALUES ('430921', '0', '南县', '430900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511826', '0', '芦山县', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540101', '0', '市辖区', '540100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('510802', '0', '利州区', '510800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445300', '0', '云浮市', '440000', null, null, '2', '0', '0', null, '258');
INSERT INTO `district` VALUES ('450221', '0', '柳江县', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530328', '0', '沾益县', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520400', '0', '安顺市', '520000', null, null, '2', '0', '0', null, '263');
INSERT INTO `district` VALUES ('532926', '0', '南涧彝族自治县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510302', '0', '自流井区', '510300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451001', '0', '市辖区', '451000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('510682', '0', '什邡市', '510600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430408', '0', '蒸湘区', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530602', '0', '昭阳区', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450203', '0', '鱼峰区', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451000', '0', '百色市', '450000', null, null, '2', '0', '0', null, '203');
INSERT INTO `district` VALUES ('532627', '0', '广南县', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500115', '0', '长寿区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532528', '0', '元阳县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532901', '0', '大理市', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451324', '0', '金秀瑶族自治县', '451300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431229', '0', '靖州苗族侗族自治县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513331', '0', '白玉县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451226', '0', '环江毛南族自治县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451381', '0', '合山市', '451300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513231', '0', '阿坝县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530825', '0', '镇沅彝族哈尼族拉祜族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542122', '0', '江达县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431129', '0', '江华瑶族自治县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440403', '0', '斗门区', '440400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469022', '0', '屯昌县', '469000', null, null, '3', '0', '0', null, '1641');
INSERT INTO `district` VALUES ('511602', '0', '广安区', '511600', null, null, '3', '0', '0', null, '241');
INSERT INTO `district` VALUES ('431221', '0', '中方县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431128', '0', '新田县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510106', '0', '金牛区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431227', '0', '新晃侗族自治县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431027', '0', '桂东县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450202', '0', '城中区', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440784', '0', '鹤山市', '440700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520302', '0', '红花岗区', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522631', '0', '黎平县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441581', '0', '陆丰市', '441500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430400', '0', '衡阳市', '430000', null, null, '2', '0', '0', null, '159');
INSERT INTO `district` VALUES ('440229', '0', '翁源县', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440700', '0', '江门市', '440000', null, null, '2', '0', '0', null, '302');
INSERT INTO `district` VALUES ('440306', '0', '宝安区', '440300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469028', '0', '陵水黎族自治县', '469000', null, null, '3', '0', '0', null, '1643');
INSERT INTO `district` VALUES ('530402', '0', '红塔区', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450423', '0', '蒙山县', '450400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540127', '0', '墨竹工卡县', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530181', '0', '安宁市', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433124', '0', '花垣县', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430304', '0', '岳塘区', '430300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511300', '0', '南充市', '510000', null, null, '2', '0', '0', null, '291');
INSERT INTO `district` VALUES ('500234', '0', '开县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451423', '0', '龙州县', '451400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513424', '0', '德昌县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430321', '0', '湘潭县', '430300', null, null, '3', '0', '0', null, '313');
INSERT INTO `district` VALUES ('530523', '0', '龙陵县', '530500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440701', '0', '市辖区', '440700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450328', '0', '龙胜各族自治县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513232', '0', '若尔盖县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540000', '4', '西藏自治区', '000000', null, null, '1', '0', '0', null, '13');
INSERT INTO `district` VALUES ('451030', '0', '西林县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441601', '0', '市辖区', '441600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('511701', '0', '市辖区', '511700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('532628', '0', '富宁县', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440401', '0', '市辖区', '440400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('511525', '0', '高县', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440803', '0', '霞山区', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530421', '0', '江川县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('512022', '0', '乐至县', '512000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540100', '0', '拉萨市', '540000', null, null, '2', '0', '0', null, '100');
INSERT INTO `district` VALUES ('430225', '0', '炎陵县', '430200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510411', '0', '仁和区', '510400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520112', '0', '乌当区', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532325', '0', '姚安县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530124', '0', '富民县', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440184', '0', '从化市', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520603', '0', '万山区', '520600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540125', '0', '堆龙德庆县', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450222', '0', '柳城县', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511325', '0', '西充县', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440513', '0', '潮阳区', '440500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530629', '0', '威信县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533324', '0', '贡山独龙族怒族自治县', '533300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430502', '0', '双清区', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451229', '0', '大化瑶族自治县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520113', '0', '白云区', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441802', '0', '清城区', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440608', '0', '高明区', '440600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441602', '0', '源城区', '441600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431202', '0', '鹤城区', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522634', '0', '雷山县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440883', '0', '吴川市', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520301', '0', '市辖区', '520300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('451301', '0', '市辖区', '451300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('441823', '0', '阳山县', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532531', '0', '绿春县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451323', '0', '武宣县', '451300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441821', '0', '佛冈县', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520521', '0', '大方县', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430621', '0', '岳阳县', '430600', null, null, '3', '0', '0', null, '220');
INSERT INTO `district` VALUES ('522730', '0', '龙里县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510921', '0', '蓬溪县', '510900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451225', '0', '罗城仫佬族自治县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532927', '0', '巍山彝族回族自治县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430405', '0', '珠晖区', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450108', '0', '良庆区', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530829', '0', '西盟佤族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445100', '0', '潮州市', '440000', null, null, '2', '0', '0', null, '201');
INSERT INTO `district` VALUES ('510524', '0', '叙永县', '510500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451281', '0', '宜州市', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510105', '0', '青羊区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441825', '0', '连山壮族瑶族自治县', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441200', '0', '肇庆市', '440000', null, null, '2', '0', '0', null, '338');
INSERT INTO `district` VALUES ('500105', '0', '江北区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440404', '0', '金湾区', '440400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430811', '0', '武陵源区', '430800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450701', '0', '市辖区', '450700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450924', '0', '兴业县', '450900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440705', '0', '新会区', '440700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510422', '0', '盐边县', '510400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530502', '0', '隆阳区', '530500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511823', '0', '汉源县', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520103', '0', '云岩区', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530626', '0', '绥江县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510304', '0', '大安区', '510300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430626', '0', '平江县', '430600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530926', '0', '耿马傣族佤族自治县', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440113', '0', '番禺区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510113', '0', '青白江区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522632', '0', '榕江县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431224', '0', '溆浦县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430682', '0', '临湘市', '430600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431322', '0', '新化县', '431300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530321', '0', '马龙县', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430701', '0', '市辖区', '430700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('511028', '0', '隆昌县', '511000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431226', '0', '麻阳苗族自治县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451224', '0', '东兰县', '451200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530623', '0', '盐津县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511321', '0', '南部县', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520322', '0', '桐梓县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500112', '0', '渝北区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450405', '0', '长洲区', '450400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440982', '0', '化州市', '440900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500100', '0', '市辖区', '500000', null, null, '2', '0', '1', null, null);
INSERT INTO `district` VALUES ('460000', '3', '海南省', '000000', null, null, '1', '0', '0', null, '21');
INSERT INTO `district` VALUES ('510623', '0', '中江县', '510600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450330', '0', '平乐县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450323', '0', '灵川县', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511181', '0', '峨眉山市', '511100', null, null, '3', '0', '0', null, '77');
INSERT INTO `district` VALUES ('513329', '0', '新龙县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433130', '0', '龙山县', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440900', '0', '茂名市', '440000', null, null, '2', '0', '0', null, '139');
INSERT INTO `district` VALUES ('533421', '0', '香格里拉县', '533400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450881', '0', '桂平市', '450800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511523', '0', '江安县', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500230', '0', '丰都县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513428', '0', '普格县', '513400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440114', '0', '花都区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451302', '0', '兴宾区', '451300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520122', '0', '息烽县', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450311', '0', '雁山区', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513322', '0', '泸定县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532923', '0', '祥云县', '532900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532504', '0', '弥勒市', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520600', '0', '铜仁市', '520000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('433101', '0', '吉首市', '433100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510321', '0', '荣县', '510300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511527', '0', '筠连县', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451022', '0', '田东县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441624', '0', '和平县', '441600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430624', '0', '湘阴县', '430600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513200', '0', '阿坝藏族羌族自治州', '510000', null, null, '2', '0', '0', null, '185');
INSERT INTO `district` VALUES ('532524', '0', '建水县', '532500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430481', '0', '耒阳市', '430400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441621', '0', '紫金县', '441600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513337', '0', '稻城县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440203', '0', '武江区', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441427', '0', '蕉岭县', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510184', '0', '崇州市', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511000', '0', '内江市', '510000', null, null, '2', '0', '0', null, '248');
INSERT INTO `district` VALUES ('440512', '0', '濠江区', '440500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530381', '0', '宣威市', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440101', '0', '市辖区', '440100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('532322', '0', '双柏县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440111', '0', '白云区', '440100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511133', '0', '马边彝族自治县', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445301', '0', '市辖区', '445300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('533325', '0', '兰坪白族普米族自治县', '533300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445224', '0', '惠来县', '445200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450421', '0', '苍梧县', '450400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511781', '0', '万源市', '511700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450422', '0', '藤县', '450400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530122', '0', '晋宁县', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533300', '0', '怒江傈僳族自治州', '530000', null, null, '2', '0', '0', null, '113');
INSERT INTO `district` VALUES ('451031', '0', '隆林各族自治县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530424', '0', '华宁县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441424', '0', '五华县', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450205', '0', '柳北区', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530621', '0', '鲁甸县', '530600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451002', '0', '右江区', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530923', '0', '永德县', '530900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520200', '0', '六盘水市', '520000', null, null, '2', '0', '0', null, '147');
INSERT INTO `district` VALUES ('511827', '0', '宝兴县', '511800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530302', '0', '麒麟区', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522726', '0', '独山县', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530826', '0', '江城哈尼族彝族自治县', '530800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441781', '0', '阳春市', '441700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430511', '0', '北塔区', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520181', '0', '清镇市', '520100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440605', '0', '南海区', '440600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431102', '0', '零陵区', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510812', '0', '朝天区', '510800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431100', '0', '永州市', '430000', null, null, '2', '0', '0', null, '314');
INSERT INTO `district` VALUES ('451026', '0', '那坡县', '451000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513325', '0', '雅江县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522702', '0', '福泉市', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522325', '0', '贞丰县', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430611', '0', '君山区', '430600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441223', '0', '广宁县', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522323', '0', '普安县', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440823', '0', '遂溪县', '440800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500236', '0', '奉节县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('469002', '0', '琼海市', '469000', null, null, '3', '0', '0', null, '2358');
INSERT INTO `district` VALUES ('450400', '0', '梧州市', '450000', null, null, '2', '0', '0', null, '304');
INSERT INTO `district` VALUES ('451123', '0', '富川瑶族自治县', '451100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430302', '0', '雨湖区', '430300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441523', '0', '陆河县', '441500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450122', '0', '武鸣县', '450100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450981', '0', '北流市', '450900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440601', '0', '市辖区', '440600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('530501', '0', '市辖区', '530500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('522701', '0', '都匀市', '522700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440781', '0', '台山市', '440700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450921', '0', '容县', '450900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511323', '0', '蓬安县', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511124', '0', '井研县', '511100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440305', '0', '南山区', '440300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431230', '0', '通道侗族自治县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450000', '3', '广西壮族自治区', '000000', null, null, '1', '0', '0', null, '17');
INSERT INTO `district` VALUES ('450406', '0', '龙圩区', '450400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500114', '0', '黔江区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530524', '0', '昌宁县', '530500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440300', '0', '深圳市', '440000', null, null, '2', '0', '0', null, '340');
INSERT INTO `district` VALUES ('511424', '0', '丹棱县', '511400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431228', '0', '芷江侗族自治县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500231', '0', '垫江县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430500', '0', '邵阳市', '430000', null, null, '2', '0', '0', null, '273');
INSERT INTO `district` VALUES ('430221', '0', '株洲县', '430200', null, null, '3', '0', '0', null, '222');
INSERT INTO `district` VALUES ('430724', '0', '临澧县', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440903', '0', '茂港区', '440900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450401', '0', '市辖区', '450400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('440281', '0', '乐昌市', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520526', '0', '威宁彝族回族苗族自治县', '520500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530129', '0', '寻甸回族彝族自治县', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511322', '0', '营山县', '511300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510703', '0', '涪城区', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450603', '0', '防城区', '450600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450703', '0', '钦北区', '450700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530111', '0', '官渡区', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511524', '0', '长宁县', '511500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('451121', '0', '昭平县', '451100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513321', '0', '康定县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431222', '0', '沅陵县', '431200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440511', '0', '金平区', '440500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520422', '0', '普定县', '520400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530724', '0', '宁蒗彝族自治县', '530700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460105', '0', '秀英区', '460100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('460200', '0', '三亚市', '460000', null, null, '2', '0', '0', null, '121');
INSERT INTO `district` VALUES ('511801', '0', '市辖区', '511800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('520501', '0', '市辖区', '520500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('510522', '0', '合江县', '510500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510501', '0', '市辖区', '510500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450500', '0', '北海市', '450000', null, null, '2', '0', '0', null, '295');
INSERT INTO `district` VALUES ('530701', '0', '市辖区', '530700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('532601', '0', '文山市', '532600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450312', '0', '临桂区', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('445321', '0', '新兴县', '445300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513333', '0', '色达县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('522626', '0', '岑巩县', '522600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533102', '0', '瑞丽市', '533100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513230', '0', '壤塘县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510104', '0', '锦江区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511722', '0', '宣汉县', '511700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530423', '0', '通海县', '530400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532323', '0', '牟定县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540123', '0', '尼木县', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('442000', '0', '中山市', '440000', null, null, '2', '0', '0', null, '187');
INSERT INTO `district` VALUES ('500235', '0', '云阳县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('540102', '0', '城关区', '540100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511601', '0', '市辖区', '511600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450223', '0', '鹿寨县', '450200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500102', '0', '涪陵区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510100', '0', '成都市', '510000', null, null, '2', '0', '0', null, '75');
INSERT INTO `district` VALUES ('451100', '0', '贺州市', '450000', null, null, '2', '0', '0', null, '260');
INSERT INTO `district` VALUES ('500243', '0', '彭水苗族土家族自治县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440514', '0', '潮南区', '440500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431124', '0', '道县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('433100', '0', '湘西土家族苗族自治州', '430000', null, null, '2', '0', '0', null, '274');
INSERT INTO `district` VALUES ('450821', '0', '平南县', '450800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441324', '0', '龙门县', '441300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431001', '0', '市辖区', '431000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('500106', '0', '沙坪坝区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532600', '0', '文山壮族苗族自治州', '530000', null, null, '2', '0', '0', null, '177');
INSERT INTO `district` VALUES ('511703', '0', '达川区', '511700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441422', '0', '大埔县', '441400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440000', '3', '广东省', '000000', null, null, '1', '0', '0', null, '7');
INSERT INTO `district` VALUES ('520324', '0', '正安县', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450201', '0', '市辖区', '450200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('431026', '0', '汝城县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431023', '0', '永兴县', '431000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510723', '0', '盐亭县', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511900', '0', '巴中市', '510000', null, null, '2', '0', '0', null, '239');
INSERT INTO `district` VALUES ('530127', '0', '嵩明县', '530100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440307', '0', '龙岗区', '440300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450721', '0', '灵山县', '450700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530301', '0', '市辖区', '530300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('533100', '0', '德宏傣族景颇族自治州', '530000', null, null, '2', '0', '0', null, '116');
INSERT INTO `district` VALUES ('530000', '4', '云南省', '000000', null, null, '1', '0', '0', null, '28');
INSERT INTO `district` VALUES ('440204', '0', '浈江区', '440200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513228', '0', '黑水县', '513200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520303', '0', '汇川区', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431125', '0', '江永县', '431100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430401', '0', '市辖区', '430400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('510108', '0', '成华区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441283', '0', '高要市', '441200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430681', '0', '汨罗市', '430600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('511621', '0', '岳池县', '511600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('512081', '0', '简阳市', '512000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450304', '0', '象山区', '450300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510722', '0', '三台县', '510700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520222', '0', '盘县', '520200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441501', '0', '市辖区', '441500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('441881', '0', '英德市', '441800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450600', '0', '防城港市', '450000', null, null, '2', '0', '0', null, '204');
INSERT INTO `district` VALUES ('532800', '0', '西双版纳傣族自治州', '530000', null, null, '2', '0', '0', null, '109');
INSERT INTO `district` VALUES ('511423', '0', '洪雅县', '511400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510114', '0', '新都区', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('532324', '0', '南华县', '532300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441400', '0', '梅州市', '440000', null, null, '2', '0', '0', null, '141');
INSERT INTO `district` VALUES ('533321', '0', '泸水县', '533300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500240', '0', '石柱土家族自治县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510503', '0', '纳溪区', '510500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440200', '0', '韶关市', '440000', null, null, '2', '0', '0', null, '137');
INSERT INTO `district` VALUES ('450901', '0', '市辖区', '450900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('450403', '0', '万秀区', '450400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510626', '0', '罗江县', '510600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('530801', '0', '市辖区', '530800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('430726', '0', '石门县', '430700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450301', '0', '市辖区', '450300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('500226', '0', '荣昌县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500228', '0', '梁平县', '500200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('450902', '0', '玉州区', '450900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542100', '0', '昌都地区', '540000', null, null, '2', '0', '0', null, '99');
INSERT INTO `district` VALUES ('451422', '0', '宁明县', '451400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('520381', '0', '赤水市', '520300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('440785', '0', '恩平市', '440700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('431381', '0', '冷水江市', '431300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510701', '0', '市辖区', '510700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('530326', '0', '会泽县', '530300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('533123', '0', '盈江县', '533100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('513330', '0', '德格县', '513300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('441900', '0', '东莞市', '440000', null, null, '2', '0', '0', null, '119');
INSERT INTO `district` VALUES ('512000', '0', '资阳市', '510000', null, null, '2', '0', '0', null, '242');
INSERT INTO `district` VALUES ('510000', '4', '四川省', '000000', null, null, '1', '0', '0', null, '32');
INSERT INTO `district` VALUES ('511501', '0', '市辖区', '511500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('522328', '0', '安龙县', '522300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('430503', '0', '大祥区', '430500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('500119', '0', '南川区', '500100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('510181', '0', '都江堰市', '510100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632222', '0', '祁连县', '632200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652323', '0', '呼图壁县', '652300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610821', '0', '神木县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640122', '0', '贺兰县', '640100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632521', '0', '共和县', '632500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623025', '0', '玛曲县', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620301', '0', '市辖区', '620300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('620400', '0', '白银市', '620000', null, null, '2', '0', '0', null, '35');
INSERT INTO `district` VALUES ('650102', '0', '天山区', '650100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('710000', '2', '台湾省', '000000', null, null, '1', '0', '0', null, null);
INSERT INTO `district` VALUES ('610430', '0', '淳化县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620201', '0', '市辖区', '620200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('542430', '0', '尼玛县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610103', '0', '碑林区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620921', '0', '金塔县', '620900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653221', '0', '和田县', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620724', '0', '高台县', '620700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610113', '0', '雁塔区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632801', '0', '格尔木市', '632800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621002', '0', '西峰区', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610501', '0', '市辖区', '610500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('632725', '0', '囊谦县', '632700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620525', '0', '张家川回族自治县', '620500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620401', '0', '市辖区', '620400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('640105', '0', '西夏区', '640100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610822', '0', '府谷县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610625', '0', '志丹县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632802', '0', '德令哈市', '632800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640221', '0', '平罗县', '640200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542500', '0', '阿里地区', '540000', null, null, '2', '0', '0', null, '103');
INSERT INTO `district` VALUES ('620901', '0', '市辖区', '620900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('542400', '0', '那曲地区', '540000', null, null, '2', '0', '0', null, '101');
INSERT INTO `district` VALUES ('620102', '0', '城关区', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640323', '0', '盐池县', '640300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653225', '0', '策勒县', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650109', '0', '米东区', '650100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621226', '0', '礼县', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610521', '0', '华县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610302', '0', '渭滨区', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630100', '0', '西宁市', '630000', null, null, '2', '0', '0', null, '66');
INSERT INTO `district` VALUES ('542626', '0', '察隅县', '542600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('659002', '0', '阿拉尔市', '659000', null, null, '3', '0', '0', null, '731');
INSERT INTO `district` VALUES ('620502', '0', '秦州区', '620500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610115', '0', '临潼区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610727', '0', '略阳县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610828', '0', '佳县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610622', '0', '延川县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654301', '0', '阿勒泰市', '654300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610923', '0', '宁陕县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632624', '0', '达日县', '632600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650200', '0', '克拉玛依市', '650000', null, null, '2', '0', '0', null, '95');
INSERT INTO `district` VALUES ('640202', '0', '大武口区', '640200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650201', '0', '市辖区', '650200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('542301', '0', '日喀则市', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621022', '0', '环县', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653127', '0', '麦盖提县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610624', '0', '安塞县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610629', '0', '洛川县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621222', '0', '文县', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652122', '0', '鄯善县', '652100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610401', '0', '市辖区', '610400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('610324', '0', '扶风县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610201', '0', '市辖区', '610200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('653000', '0', '克孜勒苏柯尔克孜自治州', '650000', null, null, '2', '0', '0', null, '84');
INSERT INTO `district` VALUES ('542125', '0', '丁青县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620422', '0', '会宁县', '620400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542429', '0', '巴青县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542324', '0', '定日县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654000', '0', '伊犁哈萨克自治州', '650000', null, null, '2', '0', '0', null, '90');
INSERT INTO `district` VALUES ('652827', '0', '和静县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632800', '0', '海西蒙古族藏族自治州', '630000', null, null, '2', '0', '0', null, '65');
INSERT INTO `district` VALUES ('620922', '0', '瓜州县', '620900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652324', '0', '玛纳斯县', '652300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652327', '0', '吉木萨尔县', '652300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610925', '0', '岚皋县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610524', '0', '合阳县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610824', '0', '靖边县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610326', '0', '眉县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630104', '0', '城西区', '630100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653123', '0', '英吉沙县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620822', '0', '灵台县', '620800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542232', '0', '错那县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640501', '0', '市辖区', '640500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('652302', '0', '阜康市', '652300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620522', '0', '秦安县', '620500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542526', '0', '改则县', '542500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611021', '0', '洛南县', '611000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620423', '0', '景泰县', '620400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610116', '0', '长安区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610628', '0', '富县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610403', '0', '杨陵区', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610724', '0', '西乡县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654200', '0', '塔城地区', '650000', null, null, '2', '0', '0', null, '94');
INSERT INTO `district` VALUES ('542338', '0', '岗巴县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542124', '0', '类乌齐县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630103', '0', '城中区', '630100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653122', '0', '疏勒县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654023', '0', '霍城县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654226', '0', '和布克赛尔蒙古自治县', '654200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620300', '0', '金昌市', '620000', null, null, '2', '0', '0', null, '34');
INSERT INTO `district` VALUES ('659003', '0', '图木舒克市', '659000', null, null, '3', '0', '0', null, '792');
INSERT INTO `district` VALUES ('610222', '0', '宜君县', '610200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654202', '0', '乌苏市', '654200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652826', '0', '焉耆回族自治县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610331', '0', '太白县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653022', '0', '阿克陶县', '653000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610125', '0', '户县', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652328', '0', '木垒哈萨克自治县', '652300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652701', '0', '博乐市', '652700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('622921', '0', '临夏县', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652223', '0', '伊吾县', '652200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542523', '0', '噶尔县', '542500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653121', '0', '疏附县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620923', '0', '肃北蒙古族自治县', '620900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640200', '0', '石嘴山市', '640000', null, null, '2', '0', '0', null, '335');
INSERT INTO `district` VALUES ('542326', '0', '拉孜县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610701', '0', '市辖区', '610700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('632822', '0', '都兰县', '632800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610632', '0', '黄陵县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653201', '0', '和田市', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640502', '0', '沙坡头区', '640500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610126', '0', '高陵县', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542622', '0', '工布江达县', '542600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621122', '0', '陇西县', '621100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611000', '0', '商洛市', '610000', null, null, '2', '0', '0', null, '285');
INSERT INTO `district` VALUES ('542126', '0', '察雅县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610427', '0', '彬县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621027', '0', '镇原县', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653224', '0', '洛浦县', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('622922', '0', '康乐县', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542423', '0', '比如县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610627', '0', '甘泉县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610300', '0', '宝鸡市', '610000', null, null, '2', '0', '0', null, '171');
INSERT INTO `district` VALUES ('653001', '0', '阿图什市', '653000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650104', '0', '新市区', '650100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610329', '0', '麟游县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654224', '0', '托里县', '654200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610528', '0', '富平县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620402', '0', '白银区', '620400', null, null, '3', '0', '0', null, '35');
INSERT INTO `district` VALUES ('632622', '0', '班玛县', '632600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610111', '0', '灞桥区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542623', '0', '米林县', '542600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652928', '0', '阿瓦提县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610500', '0', '渭南市', '610000', null, null, '2', '0', '0', null, '170');
INSERT INTO `district` VALUES ('610924', '0', '紫阳县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640425', '0', '彭阳县', '640400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652900', '0', '阿克苏地区', '650000', null, null, '2', '0', '0', null, '85');
INSERT INTO `district` VALUES ('640303', '0', '红寺堡区', '640300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610502', '0', '临渭区', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('810000', '3', '香港特别行政区', '000000', null, null, '1', '0', '0', null, '2912');
INSERT INTO `district` VALUES ('640424', '0', '泾源县', '640400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632525', '0', '贵南县', '632500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610728', '0', '镇巴县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654325', '0', '青河县', '654300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542328', '0', '谢通门县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542624', '0', '墨脱县', '542600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542133', '0', '边坝县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621123', '0', '渭源县', '621100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653024', '0', '乌恰县', '653000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620111', '0', '红古区', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652723', '0', '温泉县', '652700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640101', '0', '市辖区', '640100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('621200', '0', '陇南市', '620000', null, null, '2', '0', '0', null, '256');
INSERT INTO `district` VALUES ('654003', '0', '奎屯市', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610726', '0', '宁强县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542522', '0', '札达县', '542500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610526', '0', '蒲城县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632821', '0', '乌兰县', '632800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623026', '0', '碌曲县', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620924', '0', '阿克塞哈萨克族自治县', '620900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654322', '0', '富蕴县', '654300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610801', '0', '市辖区', '610800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('623024', '0', '迭部县', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632626', '0', '玛多县', '632600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652722', '0', '精河县', '652700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542337', '0', '萨嘎县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640302', '0', '利通区', '640300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632726', '0', '曲麻莱县', '632700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542327', '0', '昂仁县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650103', '0', '沙依巴克区', '650100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610328', '0', '千阳县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610823', '0', '横山县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640402', '0', '原州区', '640400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652923', '0', '库车县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542129', '0', '芒康县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('659004', '0', '五家渠市', '659000', null, null, '3', '0', '0', null, '789');
INSERT INTO `district` VALUES ('621001', '0', '市辖区', '621000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('630202', '0', '乐都区', '630200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653124', '0', '泽普县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610114', '0', '阎良区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653226', '0', '于田县', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653101', '0', '喀什市', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652927', '0', '乌什县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621101', '0', '市辖区', '621100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('632321', '0', '同仁县', '632300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('622923', '0', '永靖县', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632523', '0', '贵德县', '632500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623000', '0', '甘南藏族自治州', '620000', null, null, '2', '0', '0', null, '247');
INSERT INTO `district` VALUES ('621126', '0', '岷县', '621100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620524', '0', '武山县', '620500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652929', '0', '柯坪县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610428', '0', '长武县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542132', '0', '洛隆县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610425', '0', '礼泉县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650107', '0', '达坂城区', '650100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610122', '0', '蓝田县', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610927', '0', '镇坪县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640422', '0', '西吉县', '640400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652825', '0', '且末县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652823', '0', '尉犁县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654324', '0', '哈巴河县', '654300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621224', '0', '康县', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630101', '0', '市辖区', '630100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('630221', '0', '平安县', '630200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621102', '0', '安定区', '621100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632524', '0', '兴海县', '632500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610581', '0', '韩城市', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654025', '0', '新源县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620825', '0', '庄浪县', '620800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610100', '0', '西安市', '610000', null, null, '2', '0', '0', null, '233');
INSERT INTO `district` VALUES ('620725', '0', '山丹县', '620700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542525', '0', '革吉县', '542500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610631', '0', '黄龙县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623021', '0', '临潭县', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542128', '0', '左贡县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611025', '0', '镇安县', '611000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654225', '0', '裕民县', '654200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640400', '0', '固原市', '640000', null, null, '2', '0', '0', null, '246');
INSERT INTO `district` VALUES ('610702', '0', '汉台区', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610323', '0', '岐山县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632522', '0', '同德县', '632500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620982', '0', '敦煌市', '620900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654300', '0', '阿勒泰地区', '650000', null, null, '2', '0', '0', null, '96');
INSERT INTO `district` VALUES ('620702', '0', '甘州区', '620700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542527', '0', '措勤县', '542500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610124', '0', '周至县', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620824', '0', '华亭县', '620800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640300', '0', '吴忠市', '640000', null, null, '2', '0', '0', null, '322');
INSERT INTO `district` VALUES ('610301', '0', '市辖区', '610300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('610423', '0', '泾阳县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542226', '0', '曲松县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632300', '0', '黄南藏族自治州', '630000', null, null, '2', '0', '0', null, '70');
INSERT INTO `district` VALUES ('620103', '0', '七里河区', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610429', '0', '旬邑县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640121', '0', '永宁县', '640100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623001', '0', '合作市', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632723', '0', '称多县', '632700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653227', '0', '民丰县', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621023', '0', '华池县', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620722', '0', '民乐县', '620700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('o', '0', '全国', '', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `district` VALUES ('610523', '0', '大荔县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620100', '0', '兰州市', '620000', null, null, '2', '0', '0', null, '36');
INSERT INTO `district` VALUES ('542621', '0', '林芝县', '542600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654223', '0', '沙湾县', '654200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610831', '0', '子洲县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('622926', '0', '东乡族自治县', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610404', '0', '渭城区', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640106', '0', '金凤区', '640100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621124', '0', '临洮县', '621100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610829', '0', '吴堡县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620802', '0', '崆峒区', '620800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621201', '0', '市辖区', '621200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('610730', '0', '佛坪县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620523', '0', '甘谷县', '620500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610203', '0', '印台区', '610200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623022', '0', '卓尼县', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652101', '0', '吐鲁番市', '652100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652801', '0', '库尔勒市', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542221', '0', '乃东县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640205', '0', '惠农区', '640200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542233', '0', '浪卡子县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650106', '0', '头屯河区', '650100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630122', '0', '湟中县', '630100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610431', '0', '武功县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654022', '0', '察布查尔锡伯自治县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611002', '0', '商州区', '611000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610700', '0', '汉中市', '610000', null, null, '2', '0', '0', null, '352');
INSERT INTO `district` VALUES ('610304', '0', '陈仓区', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610827', '0', '米脂县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('622901', '0', '临夏市', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620123', '0', '榆中县', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652901', '0', '阿克苏市', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620621', '0', '民勤县', '620600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610402', '0', '秦都区', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542427', '0', '索县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640104', '0', '兴庆区', '640100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542329', '0', '白朗县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610900', '0', '安康市', '610000', null, null, '2', '0', '0', null, '324');
INSERT INTO `district` VALUES ('610525', '0', '澄城县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610481', '0', '兴平市', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620602', '0', '凉州区', '620600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610623', '0', '子长县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632722', '0', '杂多县', '632700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630224', '0', '化隆回族自治县', '630200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620121', '0', '永登县', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542331', '0', '康马县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654201', '0', '塔城市', '654200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632701', '0', '玉树市', '632700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542336', '0', '聂拉木县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640000', '5', '宁夏回族自治区', '000000', null, null, '1', '0', '0', null, '20');
INSERT INTO `district` VALUES ('610725', '0', '勉县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542521', '0', '普兰县', '542500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610422', '0', '三原县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621000', '0', '庆阳市', '620000', null, null, '2', '0', '0', null, '135');
INSERT INTO `district` VALUES ('653222', '0', '墨玉县', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610800', '0', '榆林市', '610000', null, null, '2', '0', '0', null, '231');
INSERT INTO `district` VALUES ('654028', '0', '尼勒克县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630123', '0', '湟源县', '630100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632221', '0', '门源回族自治县', '632200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632600', '0', '果洛藏族自治州', '630000', null, null, '2', '0', '0', null, '72');
INSERT INTO `district` VALUES ('542323', '0', '江孜县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632621', '0', '玛沁县', '632600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620800', '0', '平凉市', '620000', null, null, '2', '0', '0', null, '359');
INSERT INTO `district` VALUES ('542431', '0', '双湖县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654021', '0', '伊宁县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611026', '0', '柞水县', '611000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610825', '0', '定边县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542600', '0', '林芝地区', '540000', null, null, '2', '0', '0', null, '98');
INSERT INTO `district` VALUES ('621026', '0', '宁县', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652824', '0', '若羌县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653126', '0', '叶城县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621025', '0', '正宁县', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610929', '0', '白河县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650121', '0', '乌鲁木齐县', '650100', null, null, '3', '0', '0', null, '92');
INSERT INTO `district` VALUES ('542335', '0', '吉隆县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623023', '0', '舟曲县', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610527', '0', '白水县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640201', '0', '市辖区', '640200', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('630000', '5', '青海省', '000000', null, null, '1', '0', '0', null, '11');
INSERT INTO `district` VALUES ('621227', '0', '徽县', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620623', '0', '天祝藏族自治县', '620600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610921', '0', '汉阴县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630223', '0', '互助土族自治县', '630200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542421', '0', '那曲县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654002', '0', '伊宁市', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610926', '0', '平利县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652922', '0', '温宿县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620503', '0', '麦积区', '620500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620302', '0', '金川区', '620300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621100', '0', '定西市', '620000', null, null, '2', '0', '0', null, '136');
INSERT INTO `district` VALUES ('610722', '0', '城固县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610630', '0', '宜川县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620622', '0', '古浪县', '620600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610101', '0', '市辖区', '610100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('542332', '0', '定结县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653129', '0', '伽师县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542222', '0', '扎囊县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654027', '0', '特克斯县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620701', '0', '市辖区', '620700', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('652800', '0', '巴音郭楞蒙古自治州', '650000', null, null, '2', '0', '0', null, '86');
INSERT INTO `district` VALUES ('610400', '0', '咸阳市', '610000', null, null, '2', '0', '0', null, '323');
INSERT INTO `district` VALUES ('640401', '0', '市辖区', '640400', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('610200', '0', '铜川市', '610000', null, null, '2', '0', '0', null, '232');
INSERT INTO `district` VALUES ('621024', '0', '合水县', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542627', '0', '朗县', '542600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542625', '0', '波密县', '542600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542223', '0', '贡嘎县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653130', '0', '巴楚县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620981', '0', '玉门市', '620900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610322', '0', '凤翔县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542424', '0', '聂荣县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640100', '0', '银川市', '640000', null, null, '2', '0', '0', null, '360');
INSERT INTO `district` VALUES ('652200', '0', '哈密地区', '650000', null, null, '2', '0', '0', null, '91');
INSERT INTO `district` VALUES ('620500', '0', '天水市', '620000', null, null, '2', '0', '0', null, '196');
INSERT INTO `district` VALUES ('620104', '0', '西固区', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610330', '0', '凤县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640381', '0', '青铜峡市', '640300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621221', '0', '成县', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620600', '0', '武威市', '620000', null, null, '2', '0', '0', null, '118');
INSERT INTO `district` VALUES ('620721', '0', '肃南裕固族自治县', '620700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610723', '0', '洋县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632823', '0', '天峻县', '632800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610922', '0', '石泉县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650100', '0', '乌鲁木齐市', '650000', null, null, '2', '0', '0', null, '92');
INSERT INTO `district` VALUES ('652201', '0', '哈密市', '652200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650205', '0', '乌尔禾区', '650200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('622927', '0', '积石山保安族东乡族撒拉族自治县', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610928', '0', '旬阳县', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653023', '0', '阿合奇县', '653000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652822', '0', '轮台县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632625', '0', '久治县', '632600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610204', '0', '耀州区', '610200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610721', '0', '南郑县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542426', '0', '申扎县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542325', '0', '萨迦县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610000', '5', '陕西省', '000000', null, null, '1', '0', '0', null, '27');
INSERT INTO `district` VALUES ('542428', '0', '班戈县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654221', '0', '额敏县', '654200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640324', '0', '同心县', '640300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620200', '0', '嘉峪关市', '620000', null, null, '2', '0', '0', null, '33');
INSERT INTO `district` VALUES ('542422', '0', '嘉黎县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650101', '0', '市辖区', '650100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('610621', '0', '延长县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621125', '0', '漳县', '621100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632324', '0', '河南蒙古族自治县', '632300', null, null, '3', '0', '0', null, '30');
INSERT INTO `district` VALUES ('654323', '0', '福海县', '654300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610104', '0', '莲湖区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650204', '0', '白碱滩区', '650200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640181', '0', '灵武市', '640100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('659000', '0', '自治区直辖县级行政区划', '650000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('632224', '0', '刚察县', '632200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650202', '0', '独山子区', '650200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620902', '0', '肃州区', '620900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620801', '0', '市辖区', '620800', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('640521', '0', '中宁县', '640500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632200', '0', '海北藏族自治州', '630000', null, null, '2', '0', '0', null, '67');
INSERT INTO `district` VALUES ('630121', '0', '大通回族土族自治县', '630100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620521', '0', '清水县', '620500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542200', '0', '山南地区', '540000', null, null, '2', '0', '0', null, '97');
INSERT INTO `district` VALUES ('542322', '0', '南木林县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621228', '0', '两当县', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654024', '0', '巩留县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652702', '0', '阿拉山口市', '652700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650105', '0', '水磨沟区', '650100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640423', '0', '隆德县', '640400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610426', '0', '永寿县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610729', '0', '留坝县', '610700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542334', '0', '亚东县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653128', '0', '岳普湖县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610424', '0', '乾县', '610400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611022', '0', '丹凤县', '611000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650203', '0', '克拉玛依区', '650200', null, null, '3', '0', '0', null, '95');
INSERT INTO `district` VALUES ('621121', '0', '通渭县', '621100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652325', '0', '奇台县', '652300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610522', '0', '潼关县', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610102', '0', '新城区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610826', '0', '绥德县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654321', '0', '布尔津县', '654300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620821', '0', '泾川县', '620800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611001', '0', '市辖区', '611000', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('630102', '0', '城东区', '630100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640500', '0', '中卫市', '640000', null, null, '2', '0', '0', null, '181');
INSERT INTO `district` VALUES ('652100', '0', '吐鲁番地区', '650000', null, null, '2', '0', '0', null, '89');
INSERT INTO `district` VALUES ('659001', '0', '石河子市', '659000', null, null, '3', '0', '0', null, '770');
INSERT INTO `district` VALUES ('610602', '0', '宝塔区', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652301', '0', '昌吉市', '652300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542333', '0', '仲巴县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610303', '0', '金台区', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654326', '0', '吉木乃县', '654300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620421', '0', '靖远县', '620400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542228', '0', '洛扎县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('623027', '0', '夏河县', '623000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542224', '0', '桑日县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('820000', '3', '澳门特别行政区', '000000', null, null, '1', '0', '0', null, '2911');
INSERT INTO `district` VALUES ('610626', '0', '吴起县', '610600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542127', '0', '八宿县', '542100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('630105', '0', '城北区', '630100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542227', '0', '措美县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653200', '0', '和田地区', '650000', null, null, '2', '0', '0', null, '82');
INSERT INTO `district` VALUES ('630200', '0', '海东市', '630000', null, null, '2', '0', '0', null, null);
INSERT INTO `district` VALUES ('630225', '0', '循化撒拉族自治县', '630200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542425', '0', '安多县', '542400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653131', '0', '塔什库尔干塔吉克自治县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610327', '0', '陇县', '610300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542225', '0', '琼结县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542229', '0', '加查县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620403', '0', '平川区', '620400', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632724', '0', '治多县', '632700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620321', '0', '永昌县', '620300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620900', '0', '酒泉市', '620000', null, null, '2', '0', '0', null, '37');
INSERT INTO `district` VALUES ('610901', '0', '市辖区', '610900', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('630222', '0', '民和回族土族自治县', '630200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621202', '0', '武都区', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652700', '0', '博尔塔拉蒙古自治州', '650000', null, null, '2', '0', '0', null, '88');
INSERT INTO `district` VALUES ('652123', '0', '托克逊县', '652100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620723', '0', '临泽县', '620700', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652222', '0', '巴里坤哈萨克自治县', '652200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621021', '0', '庆城县', '621000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('640301', '0', '市辖区', '640300', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('653223', '0', '皮山县', '653200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632623', '0', '甘德县', '632600', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620122', '0', '皋兰县', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('622924', '0', '广河县', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632223', '0', '海晏县', '632200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542231', '0', '隆子县', '542200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652829', '0', '博湖县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620823', '0', '崇信县', '620800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620700', '0', '张掖市', '620000', null, null, '2', '0', '0', null, '117');
INSERT INTO `district` VALUES ('640522', '0', '海原县', '640500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652924', '0', '沙雅县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652828', '0', '和硕县', '652800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542524', '0', '日土县', '542500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632323', '0', '泽库县', '632300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611023', '0', '商南县', '611000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('654026', '0', '昭苏县', '654000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620601', '0', '市辖区', '620600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('622925', '0', '和政县', '622900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653100', '0', '喀什地区', '650000', null, null, '2', '0', '0', null, '83');
INSERT INTO `district` VALUES ('610802', '0', '榆阳区', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620101', '0', '市辖区', '620100', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('542330', '0', '仁布县', '542300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('542300', '0', '日喀则地区', '540000', null, null, '2', '0', '0', null, '102');
INSERT INTO `district` VALUES ('652300', '0', '昌吉回族自治州', '650000', null, null, '2', '0', '0', null, '93');
INSERT INTO `district` VALUES ('610112', '0', '未央区', '610100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('653125', '0', '莎车县', '653100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610830', '0', '清涧县', '610800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610600', '0', '延安市', '610000', null, null, '2', '0', '0', null, '284');
INSERT INTO `district` VALUES ('620105', '0', '安宁区', '620100', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('620501', '0', '市辖区', '620500', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('632700', '0', '玉树藏族自治州', '630000', null, null, '2', '0', '0', null, '71');
INSERT INTO `district` VALUES ('622900', '0', '临夏回族自治州', '620000', null, null, '2', '0', '0', null, '182');
INSERT INTO `district` VALUES ('652925', '0', '新和县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('650000', '5', '新疆维吾尔自治区', '000000', null, null, '1', '0', '0', null, '12');
INSERT INTO `district` VALUES ('632322', '0', '尖扎县', '632300', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('611024', '0', '山阳县', '611000', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610601', '0', '市辖区', '610600', null, null, '3', '0', '1', null, null);
INSERT INTO `district` VALUES ('610582', '0', '华阴市', '610500', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('652926', '0', '拜城县', '652900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610202', '0', '王益区', '610200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('610902', '0', '汉滨区', '610900', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('632500', '0', '海南藏族自治州', '630000', null, null, '2', '0', '0', null, '68');
INSERT INTO `district` VALUES ('620000', '5', '甘肃省', '000000', null, null, '1', '0', '0', null, '6');
INSERT INTO `district` VALUES ('620826', '0', '静宁县', '620800', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621223', '0', '宕昌县', '621200', null, null, '3', '0', '0', null, null);
INSERT INTO `district` VALUES ('621225', '0', '西和县', '621200', null, null, '3', '0', '0', null, null);

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
  `FXR` varchar(36) default NULL,
  `SHY` varchar(36) default NULL,
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
INSERT INTO `jsxxb` VALUES ('ce9deded-6bdd-44dc-8c21-c5e346bbdd0c', 'd81ffad1-e0ef-495f-9fdc-acdbb2fb935e', 'JS001', '1号圈舍', '砖房', '');
INSERT INTO `jsxxb` VALUES ('a5f61758-61c9-45a1-afa2-d6f00e987d9e', 'd81ffad1-e0ef-495f-9fdc-acdbb2fb935e', 'JS002', '新建圈舍', '露天', '');

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
  `FXR` varchar(36) default NULL,
  `FXFS` varchar(16) default NULL,
  `HSR` varchar(36) default NULL,
  `LCZR` varchar(36) default NULL,
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
  `XH` varchar(36) default NULL,
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
  `YHID` varchar(36) NOT NULL COMMENT '用户编号',
  PRIMARY KEY  (`NCBH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ncjbxxb
-- ----------------------------
INSERT INTO `ncjbxxb` VALUES ('d81ffad1-e0ef-495f-9fdc-acdbb2fb935e', '201500001', '我的房山牛场', '租用', '苏庄西大街10号', '110111', '北京伊利乳业有限公司', '张三', '15120070638', '李四', '13739140537', '王五', 'A', '2015-05-08 00:00:00', '2015-05-30 00:00:00', '12345678901', 'xb278@qq.com', '北京市', '', 'f0482464-454d-4a44-b008-dbae061d298a');

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
  `YL` decimal(5,2) default NULL,
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
INSERT INTO `nzjbxx` VALUES ('77b80d7c-cc60-4a0e-9208-980d65cd0cf9', 'd81ffad1-e0ef-495f-9fdc-acdbb2fb935e', 'NZ00001', '1', '1', '2015-05-08 00:00:00', '0', '1', '1', '2.00', '11.00', 'a5f61758-61c9-45a1-afa2-d6f00e987d9e', '11', '1', '1', '2015-05-06 00:00:00', '1', '1', '1', '1', '');

-- ----------------------------
-- Table structure for `nzlcdjb`
-- ----------------------------
DROP TABLE IF EXISTS `nzlcdjb`;
CREATE TABLE `nzlcdjb` (
  `XH` varchar(36) NOT NULL,
  `NCBH` varchar(36) NOT NULL,
  `NZXH` varchar(36) NOT NULL,
  `PZ` varchar(16) default NULL,
  `JS` varchar(36) default NULL,
  `NL` varchar(16) default NULL,
  `LQRQ` datetime NOT NULL,
  `LQLX` varchar(16) NOT NULL,
  `LQTZ` decimal(10,0) NOT NULL,
  `LQYY` varchar(128) NOT NULL,
  `QX` varchar(128) NOT NULL,
  `JSR` varchar(36) NOT NULL,
  `BZ` text,
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
  `NZXH` varchar(36) NOT NULL,
  `ZSRQ` datetime NOT NULL,
  `ZCJS` varchar(36) NOT NULL,
  `ZRJS` varchar(36) NOT NULL,
  `JSR` varchar(36) NOT NULL COMMENT '员工数据序号',
  `BZ` text,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nzzsdjb
-- ----------------------------
INSERT INTO `nzzsdjb` VALUES ('9ef54635-ec96-44e6-8915-6e0da23720e0', 'd81ffad1-e0ef-495f-9fdc-acdbb2fb935e', '77b80d7c-cc60-4a0e-9208-980d65cd0cf9', '2015-05-09 00:00:00', 'ce9deded-6bdd-44dc-8c21-c5e346bbdd0c', 'a5f61758-61c9-45a1-afa2-d6f00e987d9e', '32bd7047-01a4-44dd-8de7-aa398f270773', '');

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
  `PZY` varchar(36) default NULL,
  `FQSJ` datetime default NULL,
  `FQLX` varchar(16) default NULL,
  `FXFS` varchar(32) default NULL,
  `FXR` varchar(36) default NULL,
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
  `JCY` varchar(36) default NULL,
  `JCFS` varchar(16) default NULL COMMENT '直肠/孕酮/超声/其他',
  `TSZT` varchar(16) default NULL,
  `NZXB` varchar(16) default '2' COMMENT '0母1公2未确认',
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
  `NCBH` varchar(36) NOT NULL,
  `YGBH` varchar(16) NOT NULL,
  `YGMC` varchar(32) NOT NULL,
  `ZJHM` varchar(32) NOT NULL,
  `LXDH` varchar(32) NOT NULL,
  `LXDZ` varchar(128) NOT NULL,
  `YGLB` varchar(10) NOT NULL,
  `SCBZ` int(1) NOT NULL default '0' COMMENT '0：未删除\r\n            1：已删除',
  `BZ` text,
  PRIMARY KEY  (`XH`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ygxxb
-- ----------------------------
INSERT INTO `ygxxb` VALUES ('b9a2f96b-7df7-47f2-8d2f-b0952008784d', 'd81ffad1-e0ef-495f-9fdc-acdbb2fb935e', 'Y001', '张三', '123456789', '15120070638', '北京市房山区', '饲养员', '0', null);
INSERT INTO `ygxxb` VALUES ('32bd7047-01a4-44dd-8de7-aa398f270773', 'd81ffad1-e0ef-495f-9fdc-acdbb2fb935e', 'Y002', '李四', '1234567891', '15120070638', '北京市房山区', '饲养员', '0', null);
INSERT INTO `ygxxb` VALUES ('a37c46d0-294c-4e59-a0fa-36c45c74bab4', 'd81ffad1-e0ef-495f-9fdc-acdbb2fb935e', 'Y003', '王五', '123567892', '15120070639', '北京市房山区', '配种员', '0', null);

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
  `FBM_TYPE` int(1) default '1' COMMENT '菜单类型',
  PRIMARY KEY  (`FBM_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yh_system_menus
-- ----------------------------
INSERT INTO `yh_system_menus` VALUES ('1', '系统管理', null, '#', '0', '0', null, '0', '1');
INSERT INTO `yh_system_menus` VALUES ('2', '菜单管理', null, '/master/system/menu!AllMenus.action', '0', '1', '1', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('1b9139be-09af-4667-a634-98dc61906543', '基础数据', null, '#', '0', '0', '', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('7122ab89-6599-43f5-885e-08ba737e2f60', '牛场授权管理', null, '/master/ncgl/ncgl.action', '0', '1', '1b9139be-09af-4667-a634-98dc61906543', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('54af0c61-e2ba-4216-8281-da5e14bcf9fe', '我的牛场信息', null, '/admin/pages/ncgl/me.jsp', '0', '1', '1b9139be-09af-4667-a634-98dc61906543', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('8c3ed385-cc3c-4416-a6ce-9043bf8fe844', '圈舍信息管理', null, '/master/jsgl/jsgl.action', '0', '1', '1b9139be-09af-4667-a634-98dc61906543', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('b953f0d0-a0f3-462b-9726-bc72012ac760', '牛只管理', null, '#', '0', '0', '', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('4fa9bea1-264c-4c68-9239-41db86e9c1db', '牛只信息管理', null, '/master/nzgl/nzxx.action', '0', '1', 'b953f0d0-a0f3-462b-9726-bc72012ac760', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('9881e7c2-d5ca-4d5b-b567-f2607a4951ae', '转舍记录查询', null, '/master/nzgl/zsxx.action', '0', '1', 'b953f0d0-a0f3-462b-9726-bc72012ac760', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('a945cb02-a136-4735-b349-332f8fc94bfa', '离场记录查询', null, '/master/nzgl/lcxx.action', '0', '1', 'b953f0d0-a0f3-462b-9726-bc72012ac760', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('6d07a593-4daa-43ea-9ee5-12be440bce2f', '发情管理', null, '#', '0', '0', '', '3', '1');
INSERT INTO `yh_system_menus` VALUES ('431b0286-702e-40d1-aac0-2481845536da', '发情信息管理', null, '#', '0', '1', '6d07a593-4daa-43ea-9ee5-12be440bce2f', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('60ae96d5-72a9-4d58-bbe3-1166252529ce', '繁殖管理', null, '#', '0', '0', '', '4', '1');
INSERT INTO `yh_system_menus` VALUES ('a98aa967-38b2-45b4-bb13-7ef21badad0f', '发情登记', null, '/master/fzgl/fqdj.action', '0', '1', '60ae96d5-72a9-4d58-bbe3-1166252529ce', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('d41d97c3-3d88-412e-9d46-f59a19d0e5fa', '配种登记', null, '/master/fzgl/pzdj.action', '0', '1', '60ae96d5-72a9-4d58-bbe3-1166252529ce', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('af0a7e33-4e07-4fed-972a-c798616766cb', '妊检登记', null, '/master/fzgl/rjdj.action', '0', '1', '60ae96d5-72a9-4d58-bbe3-1166252529ce', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('48a6b0a6-94fe-40b1-b0bc-1819025b386b', '产犊登记', null, '/master/fzgl/cddj.action', '0', '1', '60ae96d5-72a9-4d58-bbe3-1166252529ce', '3', '1');
INSERT INTO `yh_system_menus` VALUES ('31013884-4db1-46e8-a3af-42c106d156d1', '流产登记', null, '/master/fzgl/lcdj.action', '0', '1', '60ae96d5-72a9-4d58-bbe3-1166252529ce', '4', '1');
INSERT INTO `yh_system_menus` VALUES ('352fa9a5-17d5-4d79-82db-6b392bdad1e3', '产奶登记', null, '#', '0', '0', '', '5', '1');
INSERT INTO `yh_system_menus` VALUES ('a49531a8-6e56-4771-9889-edf78b4ebae7', '个体产奶登记', null, '#', '0', '1', '352fa9a5-17d5-4d79-82db-6b392bdad1e3', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('f2ef60df-3c0d-479c-a3ea-abe162e749e9', '兽医保健', null, '#', '0', '0', '', '6', '1');
INSERT INTO `yh_system_menus` VALUES ('5e498a89-cc2c-4e2d-b8f1-16ecbcdd24e2', '疾病登记', null, '#', '0', '1', 'f2ef60df-3c0d-479c-a3ea-abe162e749e9', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('d8ebffd9-60d9-4813-8ee6-9725ad7c5b60', '角色管理', null, '/master/system/role!listRoles.action', '0', '1', '1', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('979e846b-a625-4ff4-bdb4-cac85c4d6133', '员工信息管理', null, '/master/yggl/ygxx.action', '0', '1', '1b9139be-09af-4667-a634-98dc61906543', '3', '1');
INSERT INTO `yh_system_menus` VALUES ('13a74fbb-d638-4d88-94c3-d92f71b5b831', '数据管理', null, '#', '0', '0', '', '7', '1');
INSERT INTO `yh_system_menus` VALUES ('335ea9de-07ea-4c3a-ab9c-a03b2edfcafc', '数据导入', null, '#', '0', '1', '13a74fbb-d638-4d88-94c3-d92f71b5b831', '0', '1');
INSERT INTO `yh_system_menus` VALUES ('e82d8bb0-5f60-43ed-8cc8-61a1f28e2ba6', '控制器信息管理', null, '#', '0', '1', '6d07a593-4daa-43ea-9ee5-12be440bce2f', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('4cd2f1a6-8328-4c73-b85f-99cb7da45dec', '计步器信息管理', null, '#', '0', '1', '6d07a593-4daa-43ea-9ee5-12be440bce2f', '2', '1');
INSERT INTO `yh_system_menus` VALUES ('26efff26-8d67-482c-bf13-01a0185e932b', '数据导出', null, '#', '0', '1', '13a74fbb-d638-4d88-94c3-d92f71b5b831', '1', '1');
INSERT INTO `yh_system_menus` VALUES ('e8b11752-8fb3-4d05-a48a-78de936d1ff3', '系统初始化', null, '#', '0', '1', '13a74fbb-d638-4d88-94c3-d92f71b5b831', '2', '1');

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
INSERT INTO `yh_system_roles` VALUES ('b05f9a5d-10c7-466f-833a-3ab9928fefad', '超级管理员', null, '1', '0', null, '1', '1');
INSERT INTO `yh_system_roles` VALUES ('bfe348a5-73e1-4d91-9853-e685c46109a9', '系统管理员', null, '7122ab89-6599-43f5-885e-08ba737e2f60', '0', null, '1', '0');
INSERT INTO `yh_system_roles` VALUES ('b05f9a5d-10c7-466f-833a-3ab9928fefae', '企业用户', null, '54af0c61-e2ba-4216-8281-da5e14bcf9fe,8c3ed385-cc3c-4416-a6ce-9043bf8fe844,979e846b-a625-4ff4-bdb4-cac85c4d6133,b953f0d0-a0f3-462b-9726-bc72012ac760,6d07a593-4daa-43ea-9ee5-12be440bce2f,60ae96d5-72a9-4d58-bbe3-1166252529ce,352fa9a5-17d5-4d79-82db-6b392bdad1e3,f2ef60df-3c0d-479c-a3ea-abe162e749e9,13a74fbb-d638-4d88-94c3-d92f71b5b831', '0', null, '2', '0');

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
INSERT INTO `yh_system_users` VALUES ('1', '管理员', 'administrator', '8f54eee04c13e5e09204f259bfa126fa6d2aeee87447918bdc8a6b9d6e13750b', null, '0', 'b05f9a5d-10c7-466f-833a-3ab9928fefad', null, '2015-05-07 22:12:21', '2015-05-08 20:32:42');
INSERT INTO `yh_system_users` VALUES ('2', '系统管理员', 'root', 'd506db04359170f4576523e7f5f680e12b403249ee844bc0e18160bda944e4a8', null, '0', 'bfe348a5-73e1-4d91-9853-e685c46109a9', null, '2015-05-08 22:05:29', '2015-05-08 22:18:59');
INSERT INTO `yh_system_users` VALUES ('f0482464-454d-4a44-b008-dbae061d298a', 'qiye1', 'qiye1', '23134a96830f81f749cad6af6f1eade4e207c845e061153c3885f88cf572dec8', null, '0', 'b05f9a5d-10c7-466f-833a-3ab9928fefae', null, '2015-05-09 12:30:23', '2015-05-09 13:01:03');

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
INSERT INTO `yh_system_users_info` VALUES ('f0482464-454d-4a44-b008-dbae061d298a', '0', '15120070638', null, null, null, '15120070638@qq.com', '0');

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
