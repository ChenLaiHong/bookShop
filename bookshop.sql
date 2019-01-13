/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50627
Source Host           : localhost:3306
Source Database       : bookshop

Target Server Type    : MYSQL
Target Server Version : 50627
File Encoding         : 65001

Date: 2019-01-13 14:25:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员的主键id',
  `username` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '管理员登录名',
  `password` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '管理员登录密码',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('1', 'admin', '123456');

-- ----------------------------
-- Table structure for `book`
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书主键',
  `bname` varchar(200) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '图书名',
  `author` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '图书作者',
  `book_concern` varchar(200) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '图书出版社',
  `shop_price` double DEFAULT NULL COMMENT '书店价格',
  `market_price` double DEFAULT NULL COMMENT '市场价格',
  `book_desc` text COLLATE utf8_general_mysql500_ci COMMENT '书的简介',
  `image` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '书的图片',
  `is_hot` int(11) DEFAULT NULL COMMENT '是否热门',
  `bdate` datetime DEFAULT NULL COMMENT '上传日期',
  `csid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`bid`),
  KEY `FK2E3AE9B1D99FD6` (`csid`),
  CONSTRAINT `FK2E3AE9B1D99FD6` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '《财务管理》 习题与解析', '杨忠智', '厦门大学出版社', '36.8', '45.6', '助你快速学会财务管理', 'book/0001.jpg', '1', '2018-03-30 21:34:57', '2', '3');
INSERT INTO `book` VALUES ('2', '进出口贸易实务教程       ', '李正方', '上海人民出版社', '40.2', '55.6', '的大大方方', 'book/0002.jpg', '1', '2018-03-30 21:38:09', '2', '9');
INSERT INTO `book` VALUES ('3', '数据库应用基础 基于Visual ', '王衍', '电子工业出版社', '33.4', '40.5', '打开打开抗毒素入会费', 'book/0003.jpg', '0', '2018-03-30 21:39:57', '2', '10');
INSERT INTO `book` VALUES ('4', '数据库应用基础学习指导', '王衍', '电子工业出版社', '20.8', '25.4', '的的地方菲菲', 'book/0004.jpg', '1', '2018-03-30 21:41:45', '2', '10');
INSERT INTO `book` VALUES ('5', '新编商务英语涵电教程', '管春林', '清华大学出版社', '33.6', '38.6', '的地方法懂法', 'book/0005.jpg', '0', '2018-03-30 21:43:09', '2', '10');
INSERT INTO `book` VALUES ('6', '新世纪实用英语写作', '管春林', '清华大学出版社', '52.1', '66.3', '大幅度撒地方', 'book/0006.jpg', '1', '2018-03-30 21:44:28', '2', '10');
INSERT INTO `book` VALUES ('7', '国际金融理论与实务', '管春林', '上海人民出版社', '60.5', '66.4', '大大方方规范GV', 'book/0007.jpg', '0', '2018-03-30 21:49:31', '3', '10');
INSERT INTO `book` VALUES ('8', '金融市场学', '管春林', '上海人民出版社', '52.1', '55.3', '的几分就就是砥砺奋进', 'book/0008.jpg', '1', '2018-03-30 21:50:21', '3', '10');
INSERT INTO `book` VALUES ('9', '金融营销学', '管春林', '上海人民出版社', '44.5', '52.1', '的符号付货款闪客快打', 'book/0009.jpg', '1', '2018-03-30 21:51:03', '3', '10');
INSERT INTO `book` VALUES ('10', '商业银行经营学', '管春林', '上海人民出版社', '33.5', '38.2', '的返回恢复海克斯康的开发', 'book/0010.jpg', '0', '2018-03-30 21:51:57', '3', '10');
INSERT INTO `book` VALUES ('11', '数据库应用基础', '管春林', '上海人民出版社', '25.4', '33.6', '的地方好好考试', 'book/0011.jpg', '0', '2018-03-30 21:52:51', '3', '10');
INSERT INTO `book` VALUES ('12', '图解信息经济学', '管春林', '上海人民出版社', '45.2', '52.3', '东风风神你电脑反馈', 'book/0012.jpg', '1', '2018-03-30 21:53:49', '3', '10');
INSERT INTO `book` VALUES ('13', '财务分析', '管春林', '上海人民出版社', '44.3', '52.3', '康复科降低肌肤', 'book/0013.jpg', '1', '2018-03-30 22:28:16', '4', '8');
INSERT INTO `book` VALUES ('14', '金融学', '管春林', '上海人民出版社', '22.3', '32.1', '打飞机打飞机累死了', 'book/0014.jpg', '0', '2018-03-30 22:29:06', '4', '10');
INSERT INTO `book` VALUES ('15', '数据库应用基础', '管春林', '上海人民出版社', '22.6', '25.3', '反馈反馈就', 'book/0015.jpg', '1', '2018-03-30 22:29:48', '4', '10');
INSERT INTO `book` VALUES ('16', '数据库应用基础学习指导', '管春林', '上海人民出版社', '36.5', '38.6', '电话费计算机的境况', 'book/0016.jpg', '1', '2018-03-30 22:30:36', '4', '10');
INSERT INTO `book` VALUES ('17', '统计学', '管春林', '上海人民出版社', '41.3', '44.6', '搭飞机返回换', 'book/0017.jpg', '0', '2018-03-30 22:33:15', '4', '10');
INSERT INTO `book` VALUES ('18', '投资学', '管春林', '上海人民出版社', '35.6', '37.6', '搭飞机降帆靠港', 'book/0018.jpg', '1', '2018-03-30 22:33:51', '4', '10');
INSERT INTO `book` VALUES ('19', '公共管理学', '管春林', '上海人民出版社', '41.2', '44.1', '的房间里流量费', 'book/0019.jpg', '1', '2018-03-30 23:05:40', '5', '10');
INSERT INTO `book` VALUES ('20', '公共支出分析', '管春林', '上海人民出版社', '20.6', '26.3', '达富结节九分裤开发', 'book/0020.jpg', '0', '2018-03-30 23:06:40', '5', '10');
INSERT INTO `book` VALUES ('21', '劳动经济学', '管春林', '上海人民出版社', '35.6', '37.9', '的反馈反馈反馈开发', 'book/0021.jpg', '1', '2018-03-30 23:07:32', '5', '9');
INSERT INTO `book` VALUES ('22', '区域经济学', '管春林', '上海人民出版社', '25.8', '28.3', '的咖啡机结果集来到了', 'book/0022.jpg', '0', '2018-03-30 23:08:14', '5', '10');
INSERT INTO `book` VALUES ('23', '数据库应用基础', '管春林', '上海人民出版社', '34.6', '39.6', '的几分就父接口算了算了', 'book/0023.jpg', '1', '2018-03-30 23:09:00', '5', '10');
INSERT INTO `book` VALUES ('24', '数据库应用基础', '管春林', '上海人民出版社', '35.4', '38.6', '搭飞机发酒精发酵看', 'book/0024.jpg', '1', '2018-03-30 23:09:51', '5', '10');
INSERT INTO `book` VALUES ('25', '财政学', '管春林', '上海人民出版社', '33.2', '36.1', '的反馈看房价高', 'book/0025.jpg', '1', '2018-03-30 23:12:06', '6', '8');
INSERT INTO `book` VALUES ('26', '公共管理学', '管春林', '上海人民出版社', '30.2', '32.6', '日日日快打快打', 'book/0026.jpg', '0', '2018-03-30 23:12:47', '6', '10');
INSERT INTO `book` VALUES ('27', '区域经济学', '管春林', '上海人民出版社', '32.8', '36.5', '的反馈反馈高考', 'book/0027.jpg', '1', '2018-03-30 23:13:26', '6', '10');
INSERT INTO `book` VALUES ('28', '统计学', '管春林', '上海人民出版社', '23.6', '35.1', '了两个分开开发开发', 'book/0028.jpg', '1', '2018-03-30 23:14:02', '6', '10');
INSERT INTO `book` VALUES ('29', '现代社会调查方法', '管春林', '上海人民出版社', '33.2', '34.5', '的几分就分开放', 'book/0029.jpg', '0', '2018-03-30 23:14:48', '6', '10');
INSERT INTO `book` VALUES ('30', '财政学', '管春林', '上海人民出版社', '30.2', '32.6', '达富结节反馈', 'book/0030.jpg', '1', '2018-03-30 23:16:37', '7', '10');
INSERT INTO `book` VALUES ('31', '公共管理学', '管春林', '上海人民出版社', '30.5', '33.5', '开发开发狂蜂浪蝶', 'book/0031.jpg', '0', '2018-03-30 23:28:04', '7', '10');
INSERT INTO `book` VALUES ('32', '数据库应用基础', '管春林', '上海人民出版社', '33.5', '33.7', '减肥减肥卡卡卡的', 'book/0032.jpg', '0', '2018-03-30 23:29:04', '7', '10');
INSERT INTO `book` VALUES ('33', '数据库应用基础学习指导', '管春林', '上海人民出版社', '25.9', '32', '看看积分几分就低利率的', 'book/0033.jpg', '1', '2018-03-30 23:30:19', '7', '10');
INSERT INTO `book` VALUES ('34', '现代社会调查方法', '管春林', '上海人民出版社', '33.5', '33.9', '的卡夫卡法国红酒', 'book/0034.jpg', '0', '2018-03-30 23:31:16', '7', '10');
INSERT INTO `book` VALUES ('35', '公共管理学', '管春林', '上海人民出版社', '25.6', '33.6', '搭飞机父接口高数课', 'book/0035.jpg', '1', '2018-03-30 23:35:23', '8', '10');
INSERT INTO `book` VALUES ('36', '经济学基础', '管春林', '上海人民出版社', '33.5', '40.3', '搭飞机看挂科浪费', 'book/0036.jpg', '0', '2018-03-30 23:36:10', '8', '10');
INSERT INTO `book` VALUES ('37', '数据库应用基础', '管春林', '上海人民出版社', '36.2', '38.6', '的开发机机构', 'book/0037.jpg', '1', '2018-03-30 23:36:58', '8', '10');
INSERT INTO `book` VALUES ('38', '数据库应用基础学习指导', '管春林', '上海人民出版社', '40.3', '44.2', '的开发急功近利', 'book/0038.jpg', '1', '2018-03-30 23:38:01', '8', '10');
INSERT INTO `book` VALUES ('39', '现代社会调查方法', '管春林', '上海人民出版社', '36.5', '38.7', '的几分就分离了', 'book/0039.jpg', '0', '2018-03-30 23:39:05', '8', '10');
INSERT INTO `book` VALUES ('40', '房地产策划', '管春林', '上海人民出版社', '23.6', '33.9', '的酒精发酵概率论了框架', 'book/0040.jpg', '1', '2018-03-30 23:43:47', '9', '9');
INSERT INTO `book` VALUES ('41', '工程经济学', '管春林', '上海人民出版社', '33', '36.2', '收到两份六块腹肌', 'book/0041.jpg', '1', '2018-03-30 23:44:37', '9', '10');
INSERT INTO `book` VALUES ('42', '工程造价管理', '管春林', '上海人民出版社', '32.2', '33.6', '地负海涵开发开发', 'book/0042.jpg', '0', '2018-03-30 23:45:20', '9', '10');
INSERT INTO `book` VALUES ('43', '市场营销学', '管春林', '上海人民出版社', '36.2', '37.9', '的咖啡机加菲猫从', 'book/0043.jpg', '1', '2018-03-30 23:46:20', '9', '10');
INSERT INTO `book` VALUES ('44', '数据库应用基础', '管春林', '上海人民出版社', '41.2', '43.5', '的反馈反馈李老师', 'book/0044.jpg', '0', '2018-03-30 23:47:15', '9', '10');
INSERT INTO `book` VALUES ('45', '数据库应用基础学习指导', '管春林', '上海人民出版社', '40.2', '41.3', '搭飞机发扣扣', 'book/0045.jpg', '1', '2018-03-30 23:48:01', '9', '10');
INSERT INTO `book` VALUES ('46', '管理信息系统', '管春林', '上海人民出版社', '25.6', '36.2', '搭飞机佛罗里达', 'book/0046.jpg', '0', '2018-03-30 23:50:00', '10', '10');
INSERT INTO `book` VALUES ('47', '商品学概论', '管春林', '上海人民出版社', '32.6', '33.9', '的飞机交付看看是', 'book/0047.jpg', '0', '2018-03-30 23:50:53', '10', '10');
INSERT INTO `book` VALUES ('48', '市场营销学', '管春林', '上海人民出版社', '35.6', '39.5', '定积分公开课带来了', 'book/0048.jpg', '1', '2018-03-30 23:51:59', '10', '10');
INSERT INTO `book` VALUES ('49', '数据库应用基础', '管春林', '上海人民出版社', '33.5', '36.9', '对讲机反馈给李老师', 'book/0049.jpg', '1', '2018-03-30 23:52:49', '10', '10');
INSERT INTO `book` VALUES ('50', '数据库应用基础学习指导', '管春林', '上海人民出版社', '36.5', '39.5', '达富结节发过来落实到解放军', 'book/0050.jpg', '0', '2018-03-30 23:53:39', '10', '10');
INSERT INTO `book` VALUES ('51', '营销调研', '管春林', '上海人民出版社', '37.6', '38.5', '尸毒方剂卡罗拉三等奖', 'book/0051.jpg', '1', '2018-03-30 23:54:25', '10', '10');
INSERT INTO `book` VALUES ('52', '产业经济学', '管春林', '上海人民出版社', '38.5', '39.5', '的金凤凰客流量少', 'book/0052.jpg', '1', '2018-03-30 23:56:15', '11', '10');
INSERT INTO `book` VALUES ('53', '管理信息系统', '管春林', '上海人民出版社', '40.2', '45.1', '水电费看过科罗拉多', 'book/0053.jpg', '0', '2018-03-30 23:57:03', '11', '10');
INSERT INTO `book` VALUES ('54', '企业战略管理', '管春林', '上海人民出版社', '33.6', '52', '的开发急功近利来得及高', 'book/0054.jpg', '0', '2018-03-30 23:57:45', '11', '10');
INSERT INTO `book` VALUES ('55', '市场营销学', '管春林', '上海人民出版社', '25.6', '30.2', '代理费会计师的合法化', 'book/0055.jpg', '1', '2018-03-30 23:58:34', '11', '10');
INSERT INTO `book` VALUES ('56', '数据库应用基础', '管春林', '上海人民出版社', '30.5', '33.2', '的咖啡机记录数乐山大佛', 'book/0056.jpg', '1', '2018-03-30 23:59:22', '11', '10');
INSERT INTO `book` VALUES ('57', '数据库应用基础', '管春林', '上海人民出版社', '32.4', '36.5', '的咖啡机收到了副科级', 'book/0057.jpg', '0', '2018-03-31 00:00:34', '11', '10');
INSERT INTO `book` VALUES ('58', '服务营销', '管春林', '上海人民出版社', '35.6', '39.8', '的咖啡机开发高考啦', 'book/0058.jpg', '1', '2018-03-31 00:02:11', '12', '10');
INSERT INTO `book` VALUES ('59', '国际市场营销学', '管春林', '上海人民出版社', '34.6', '36.2', '达富结节分类管理', 'book/0059.jpg', '0', '2018-03-31 00:03:23', '12', '9');
INSERT INTO `book` VALUES ('60', '商品学概论', '管春林', '上海人民出版社', '36.5', '39.2', '大富科技来树立的咖啡机', 'book/0060.jpg', '1', '2018-03-31 00:04:06', '12', '10');
INSERT INTO `book` VALUES ('61', '市场营销学', '管春林', '上海人民出版社', '35.2', '41', '砥砺奋进贵金属的卡夫卡', 'book/0061.jpg', '1', '2018-03-31 00:04:53', '12', '10');
INSERT INTO `book` VALUES ('62', '数据库应用基础', '管春林', '上海人民出版社', '20.6', '32.6', '的咖啡机概率论尸毒方剂', 'book/0062.jpg', '0', '2018-03-31 00:05:37', '12', '10');
INSERT INTO `book` VALUES ('63', '数据库应用基础学习指导', '管春林', '上海人民出版社', '23.6', '30.2', '的咖啡机开始了砥砺奋进', 'book/0063.jpg', '0', '2018-03-31 00:06:29', '12', '10');
INSERT INTO `book` VALUES ('64', '服务营销', '管春林', '上海人民出版社', '27.9', '32.1', '收到了反馈急功近利达芙妮', 'book/0064.jpg', '1', '2018-03-31 00:08:38', '13', '10');
INSERT INTO `book` VALUES ('65', '供应链管理', '管春林', '上海人民出版社', '22.3', '23.6', '的咖啡机啊看快递分类', 'book/0065.jpg', '1', '2018-03-31 00:09:14', '13', '10');
INSERT INTO `book` VALUES ('66', '经济法通论', '管春林', '上海人民出版社', '25.6', '33', '地方经过海克斯康颠肺流离', 'book/0066.jpg', '0', '2018-03-31 00:10:00', '13', '10');
INSERT INTO `book` VALUES ('67', '市场营销学', '管春林', '上海人民出版社', '24.6', '33.1', '斯柯达减肥减肥了', 'book/0067.jpg', '1', '2018-03-31 00:10:46', '13', '10');
INSERT INTO `book` VALUES ('68', '数据库应用基础', '管春林', '上海人民出版社', '40.2', '44.3', '的咖啡机哈克斯的卡夫卡', 'book/0068.jpg', '1', '2018-03-31 00:11:28', '13', '10');
INSERT INTO `book` VALUES ('69', '数据库应用基础学习指导', '管春林', '上海人民出版社', '35.2', '39.6', '的咖啡机all尸毒方剂', 'book/0069.jpg', '0', '2018-03-31 00:12:16', '13', '10');
INSERT INTO `book` VALUES ('70', '物流成本管理', '管春林', '上海人民出版社', '23.6', '36.2', '砥砺奋进世纪东方', 'book/0070.jpg', '1', '2018-03-31 00:12:56', '13', '10');
INSERT INTO `book` VALUES ('71', '财务分析', '管春林', '上海人民出版社', '32.1', '33.6', '上岛咖啡好看', 'book/0071.jpg', '0', '2018-03-31 00:14:33', '14', '10');
INSERT INTO `book` VALUES ('72', '财务管理', '管春林', '上海人民出版社', '33.6', '39.3', '的开发姜是老的辣', 'book/0072.jpg', '1', '2018-03-31 00:15:11', '14', '10');
INSERT INTO `book` VALUES ('73', '金融学', '管春林', '上海人民出版社', '35.6', '36.5', '的咖啡机阿里', 'book/0073.jpg', '1', '2018-03-31 00:15:53', '14', '10');
INSERT INTO `book` VALUES ('74', '内部控制', '管春林', '上海人民出版社', '36.5', '40.1', '的咖啡机阿里劳动法和', 'book/0074.jpg', '0', '2018-03-31 00:16:33', '14', '10');
INSERT INTO `book` VALUES ('75', '数据库应用基础', '管春林', '上海人民出版社', '41', '44.3', '的看法就爱看的看法', 'book/0075.jpg', '0', '2018-03-31 00:17:11', '14', '10');
INSERT INTO `book` VALUES ('76', '统计学', '管春林', '上海人民出版社', '32.3', '36.5', '嗲登飞来峰接口', 'book/0076.jpg', '1', '2018-03-31 00:17:53', '14', '10');
INSERT INTO `book` VALUES ('77', '成本会计', '管春林', '上海人民出版社', '23.2', '32.6', '的看法就按克鲁赛德', 'book/0077.jpg', '1', '2018-03-31 00:19:24', '15', '10');
INSERT INTO `book` VALUES ('78', '高级财务会计', '管春林', '上海人民出版社', '32.1', '45.2', '的咖啡机阿里水电费', 'book/0078.jpg', '0', '2018-03-31 00:20:03', '15', '10');
INSERT INTO `book` VALUES ('79', '管理会计', '管春林', '上海人民出版社', '33', '36.2', '的开发开放个人', 'book/0079.jpg', '1', '2018-03-31 00:20:40', '15', '10');
INSERT INTO `book` VALUES ('80', '数据库应用基础', '管春林', '上海人民出版社', '13.6', '19.3', '的看法几十块的看法', 'book/0080.jpg', '1', '2018-03-31 00:21:22', '15', '10');
INSERT INTO `book` VALUES ('81', '统计学', '管春林', '上海人民出版社', '19.3', '25.3', '是看得见法拉利水电费', 'book/0081.jpg', '0', '2018-03-31 00:21:59', '15', '10');
INSERT INTO `book` VALUES ('82', '财务管理', '管春林', '上海人民出版社', '23.5', '26.3', '分两个兰蔻开发', 'book/0082.jpg', '0', '2018-03-31 00:23:36', '16', '10');
INSERT INTO `book` VALUES ('83', '金融学', '管春林', '上海人民出版社', '30.2', '36.2', '的反馈口袋里发了', 'book/0083.jpg', '1', '2018-03-31 00:24:12', '16', '10');
INSERT INTO `book` VALUES ('84', '内部控制', '管春林', '上海人民出版社', '25.2', '30.3', '打开方式快递费', 'book/0084.jpg', '1', '2018-03-31 00:24:54', '16', '10');
INSERT INTO `book` VALUES ('85', '统计学', '管春林', '上海人民出版社', '26.3', '32.6', '的浪费了开关机', '0book/085.jpg', '0', '2018-03-31 00:25:29', '16', '10');
INSERT INTO `book` VALUES ('86', '政府审计学', '管春林', '上海人民出版社', '32', '36.2', '的卡夫卡格拉苏蒂', 'book/0086.jpg', '1', '2018-03-31 00:26:08', '16', '10');
INSERT INTO `book` VALUES ('87', '资产评估学', '管春林', '上海人民出版社', '23.6', '50.3', '的开发机机构开始的', 'book/0087.jpg', '1', '2018-03-31 00:26:49', '16', '10');
INSERT INTO `book` VALUES ('88', '财务管理', '管春林', '上海人民出版社', '23.5', '32', '的浪费了开关机', 'book/0088.jpg', '0', '2018-03-31 00:28:19', '17', '10');
INSERT INTO `book` VALUES ('89', '数据库应用基础', '管春林', '上海人民出版社', '22.3', '31.2', '的浪费录入录入', 'book/0089.jpg', '1', '2018-03-31 00:28:59', '17', '10');
INSERT INTO `book` VALUES ('90', '数据库应用基础学习指导', '管春林', '上海人民出版社', '25.6', '32', '的浪费看挂科水电费', 'book/0090.jpg', '1', '2018-03-31 00:29:47', '17', '10');
INSERT INTO `book` VALUES ('91', '统计学', '管春林', '上海人民出版社', '27.3', '31', '代理费老顾客弹框', 'book/0091.jpg', '0', '2018-03-31 00:30:23', '17', '10');
INSERT INTO `book` VALUES ('92', '资产评估学', '管春林', '上海人民出版社', '29.3', '31.2', '的反馈看挂科挂科了', 'book/0092.jpg', '1', '2018-03-31 00:31:07', '17', '10');
INSERT INTO `book` VALUES ('93', 'JAVA面向对象程序设计', '管春林', '上海人民出版社', '30.2', '36.2', '的分类管理东方红如若', 'book/0093.jpg', '1', '2018-03-31 00:32:45', '18', '10');
INSERT INTO `book` VALUES ('94', '经济学基础', '管春林', '上海人民出版社', '30.6', '38.2', '的雷锋精神老地方', 'book/0094.jpg', '0', '2018-03-31 00:33:26', '18', '10');
INSERT INTO `book` VALUES ('95', '市场营销学', '管春林', '上海人民出版社', '23.5', '30.2', '砥砺奋进爱丽丝打飞机', 'book/0095.jpg', '0', '2018-03-31 00:34:04', '18', '10');
INSERT INTO `book` VALUES ('96', '数据库系统概论', '管春林', '上海人民出版社', '23.6', '36.5', '独立法人龙凤咖啡馆你爸妈', 'book/0096.jpg', '0', '2018-03-31 00:34:51', '18', '10');
INSERT INTO `book` VALUES ('97', '物流与供应链管理', '管春林', '上海人民出版社', '26.5', '32.1', '了李春梅v南方大厦的', 'book/0097.jpg', '1', '2018-03-31 00:35:38', '18', '10');
INSERT INTO `book` VALUES ('98', 'C++面向对象程序设计教程', '管春林', '上海人民出版社', '30.2', '33.6', '领略到了反馈卡死了打', 'book/0098.jpg', '1', '2018-03-31 00:37:21', '19', '10');
INSERT INTO `book` VALUES ('99', 'C++语言程序设计', '管春林', '上海人民出版社', '36.1', '45.3', '带来了你能触摸到', 'book/0099.jpg', '0', '2018-03-31 00:38:04', '19', '10');
INSERT INTO `book` VALUES ('100', 'Visual C++面向对象可视化程序设计', '管春林', '上海人民出版社', '33.2', '45.3', '上岛咖啡尽快是否会', 'book/0100.jpg', '1', '2018-03-31 00:39:15', '19', '10');
INSERT INTO `book` VALUES ('101', '高等数学上', '管春林', '上海人民出版社', '22.3', '33.2', '扫地出门把那几个', 'book/0101.jpg', '1', '2018-03-31 00:39:58', '19', '10');
INSERT INTO `book` VALUES ('102', '高等数学下', '管春林', '上海人民出版社', '26.3', '33.1', '拆开看林德洛夫', 'book/0102.jpg', '0', '2018-03-31 00:40:40', '19', '10');
INSERT INTO `book` VALUES ('103', '计算机科学与技术', '管春林', '上海人民出版社', '23.6', '32.6', '多路阀惊世毒妃', 'book/0103.jpg', '1', '2018-03-31 00:41:30', '19', '10');
INSERT INTO `book` VALUES ('104', '计算机组成原理教程', '管春林', '上海人民出版社', '22.6', '23.5', '带来了反馈看过', 'book/0104.jpg', '0', '2018-03-31 00:42:15', '19', '10');
INSERT INTO `book` VALUES ('105', 'JAVA面向对象程序设计', '管春林', '上海人民出版社', '32.3', '36.5', '的流量费利率管控看风景', 'book/0105.jpg', '0', '2018-03-31 00:44:06', '20', '10');
INSERT INTO `book` VALUES ('106', '管理运筹学', '管春林', '上海人民出版社', '22.3', '23.3', '蝶恋蜂狂立丰国际', 'book/0106.jpg', '0', '2018-03-31 00:44:45', '20', '10');
INSERT INTO `book` VALUES ('107', '经济学基础', '管春林', '上海人民出版社', '20.3', '32.6', '蝶恋蜂狂国家级非', 'book/0107.jpg', '1', '2018-03-31 00:45:27', '20', '10');
INSERT INTO `book` VALUES ('108', '数据库系统概论', '管春林', '上海人民出版社', '22.3', '36.2', '的浪费国家开发', 'book/0108.jpg', '1', '2018-03-31 00:46:15', '20', '10');
INSERT INTO `book` VALUES ('109', '网页设计', '管春林', '上海人民出版社', '36', '38.3', '颠肺流离给人家', 'book/0109.jpg', '0', '2018-03-31 00:46:52', '20', '10');
INSERT INTO `book` VALUES ('110', '信息系统审计理论与务实', '管春林', '上海人民出版社', '22.3', '32.3', '蝶恋蜂狂口公交发过火', 'book/0110.jpg', '1', '2018-03-31 00:47:43', '20', '10');
INSERT INTO `book` VALUES ('111', '几何解析', '管春林', '上海人民出版社', '25.6', '32.2', '蝶恋蜂狂钢结构积分', 'book/0111.jpg', '1', '2018-03-31 00:49:18', '21', '10');
INSERT INTO `book` VALUES ('112', '计量经济学基础上下', '管春林', '上海人民出版社', '52.3', '63.2', '的浪费乐山大佛交电费', 'book/0112.jpg', '0', '2018-03-31 00:50:02', '21', '10');
INSERT INTO `book` VALUES ('113', '数据库应用基础', '管春林', '上海人民出版社', '41.2', '55.2', '颠覆了拉的看法京东方', 'book/0113.jpg', '0', '2018-03-31 00:50:42', '21', '10');
INSERT INTO `book` VALUES ('114', '数据库应用基础学习指导', '管春林', '上海人民出版社', '23.6', '32.5', '湿漉漉的放假了', 'book/0114.jpg', '0', '2018-03-31 00:51:26', '21', '10');
INSERT INTO `book` VALUES ('115', '法理学', '管春林', '上海人民出版社', '23.6', '32.1', '的分类点击分类', 'book/0115.jpg', '1', '2018-03-31 00:52:42', '22', '10');
INSERT INTO `book` VALUES ('116', '国际私法', '管春林', '上海人民出版社', '22.6', '36.2', '是劳动法吉林省', 'book/0116.jpg', '0', '2018-03-31 00:53:23', '22', '10');
INSERT INTO `book` VALUES ('117', '行政诉讼法学', '管春林', '上海人民出版社', '31', '33.2', '代理费拉京东方', 'book/0117.jpg', '1', '2018-03-31 00:54:04', '22', '10');
INSERT INTO `book` VALUES ('118', '合同法', '管春林', '上海人民出版社', '23.6', '30.2', '是看得见弗拉地方', 'book/0118.jpg', '1', '2018-03-31 00:54:40', '22', '10');
INSERT INTO `book` VALUES ('119', '仲裁法', '管春林', '上海人民出版社', '22.6', '32.1', '的浏览收到两份机机构', 'book/0119.jpg', '0', '2018-03-31 00:55:16', '22', '10');
INSERT INTO `book` VALUES ('120', '财政学', '管春林', '上海人民出版社', '22.3', '32.3', '尸毒方剂辣豆腐', 'book/0120.jpg', '0', '2018-03-31 00:56:54', '23', '10');
INSERT INTO `book` VALUES ('121', '经济学基础', '管春林', '上海人民出版社', '23.6', '33.5', '卡士大夫撒', 'book/0121.jpg', '1', '2018-03-31 00:57:38', '23', '10');
INSERT INTO `book` VALUES ('122', '社会行政', '管春林', '上海人民出版社', '22.6', '36.2', '的咖啡机卡迪夫', 'book/0122.jpg', '0', '2018-03-31 00:58:16', '23', '10');
INSERT INTO `book` VALUES ('123', '社会学概论新修', '管春林', '上海人民出版社', '23.1', '32.3', '多久啊分类返回换法懂法', 'book/0123.jpg', '1', '2018-03-31 00:59:03', '23', '10');
INSERT INTO `book` VALUES ('124', '政治学', '管春林', '上海人民出版社', '23.5', '25.6', '打了飞机乱世大军阀', 'book/0124.jpg', '1', '2018-03-31 00:59:39', '23', '10');
INSERT INTO `book` VALUES ('125', '社会学概论新修', '管春林', '上海人民出版社', '22.5', '36.2', '大富科技按劳动法', 'book/0125.jpg', '0', '2018-03-31 01:01:18', '24', '10');
INSERT INTO `book` VALUES ('126', '机械制图与计算机绘图', '管春林', '上海人民出版社', '23.5', '36.2', '的浏览发过来了扣款日', 'book/0126.jpg', '0', '2018-03-31 09:16:23', '25', '10');
INSERT INTO `book` VALUES ('127', '人机工程学', '管春林', '上海人民出版社', '33.2', '36.5', '理论理论所绿绿所付多多', 'book/0127.jpg', '0', '2018-03-31 09:17:13', '25', '10');
INSERT INTO `book` VALUES ('128', '外国工艺美术史新编', '管春林', '上海人民出版社', '33.5', '38.3', '冷冷的开口看手机积分', 'book/0128.jpg', '0', '2018-03-31 09:18:11', '25', '10');
INSERT INTO `book` VALUES ('129', '艺术类大学英语', '管春林', '上海人民出版社', '32.1', '33.2', '李老师看看的看法结尾', 'book/0129.jpg', '1', '2018-03-31 09:19:14', '25', '10');
INSERT INTO `book` VALUES ('130', '中国工艺美术史新编', '管春林', '上海人民出版社', '23.6', '33.2', '老是登录市科技局返回换', 'book/0130.jpg', '1', '2018-03-31 09:20:05', '25', '10');
INSERT INTO `book` VALUES ('131', '服装结构设计', '管春林', '上海人民出版社', '25.6', '33.6', '算了算了看得开咖啡结果集', 'book/0131.jpg', '0', '2018-03-31 09:22:44', '26', '10');
INSERT INTO `book` VALUES ('132', '艺术类大学英语', '管春林', '上海人民出版社', '33.5', '36.5', '老师来了说苦咖啡达富结节', 'book/0132.jpg', '1', '2018-03-31 09:23:32', '26', '7');
INSERT INTO `book` VALUES ('133', '服装结构设计', '管春林', '上海人民出版社', '23.5', '33.4', '上带来了的卡夫卡', 'book/0133.jpg', '1', '2018-03-31 09:24:47', '27', '10');
INSERT INTO `book` VALUES ('134', '公共关系学', '管春林', '上海人民出版社', '33.2', '36.5', '的扣扣水利电力负数的', 'book/0134.jpg', '0', '2018-03-31 09:25:36', '27', '10');
INSERT INTO `book` VALUES ('135', '广告设计教程', '管春林', '上海人民出版社', '30.2', '33.6', '的分类律师代理费', 'book/0135.jpg', '0', '2018-03-31 09:26:15', '27', '10');
INSERT INTO `book` VALUES ('136', '广告文案写作', '管春林', '上海人民出版社', '25.6', '30.2', '带来了斯里兰卡开发精加工', 'book/0136.jpg', '1', '2018-03-31 09:26:53', '27', '10');
INSERT INTO `book` VALUES ('137', '新闻学概论', '管春林', '上海人民出版社', '25.3', '33.2', '湿漉漉的苦咖啡收到', 'book/0137.jpg', '1', '2018-03-31 09:27:33', '27', '10');
INSERT INTO `book` VALUES ('138', '古代汉语', '管春林', '上海人民出版社', '22.6', '32.6', '索拉鲁斯了的开发机机构', 'book/0138.jpg', '0', '2018-03-31 09:29:30', '28', '10');
INSERT INTO `book` VALUES ('139', '经济法通论', '管春林', '上海人民出版社', '35.2', '39.3', '的落落大方口口声声你们', 'book/0139.jpg', '1', '2018-03-31 09:30:24', '28', '10');
INSERT INTO `book` VALUES ('140', '外国文学简明教程', '管春林', '上海人民出版社', '23.5', '33.2', '索拉鲁斯了贷款', 'book/0140.jpg', '1', '2018-03-31 09:31:09', '28', '10');
INSERT INTO `book` VALUES ('141', '中国现代经典文学1', '管春林', '上海人民出版社', '33.1', '39.5', '带来了代理费看看关键是', 'book/0141.jpg', '0', '2018-03-31 09:32:00', '28', '10');
INSERT INTO `book` VALUES ('142', '中国现代经典文学2', '管春林', '上海人民出版社', '33.2', '40.2', '理论上的反馈了的福建省', 'book/0142.jpg', '0', '2018-03-31 09:32:47', '28', '10');
INSERT INTO `book` VALUES ('143', '世界现代设计史', '管春林', '上海人民出版社', '23.6', '33.5', '带来了的看法科技馆', 'book/0143.jpg', '1', '2018-03-31 09:34:39', '29', '10');
INSERT INTO `book` VALUES ('144', '艺术类大学英语', '管春林', '上海人民出版社', '50.3', '63.2', '代理商了的卡夫卡加肥加大', 'book/0144.jpg', '1', '2018-03-31 09:35:22', '29', '10');
INSERT INTO `book` VALUES ('145', '艺术类大学英语', '管春林', '上海人民出版社', '26.3', '36.5', '论述论述看贷款将返回', 'book/0145.jpg', '0', '2018-03-31 09:36:48', '30', '10');
INSERT INTO `book` VALUES ('146', '进出口贸易实务教程', '管春林', '上海人民出版社', '25.6', '36.5', '低利率的李开复可控硅几年内', 'book/0146.jpg', '0', '2018-03-31 09:38:37', '31', '10');
INSERT INTO `book` VALUES ('147', '英语国家概况', '管春林', '上海人民出版社', '22.6', '32.5', '索拉鲁斯看的看法科技馆', 'book/0147.jpg', '1', '2018-03-31 09:39:24', '31', '10');
INSERT INTO `book` VALUES ('148', '英语泛读教程3', '管春林', '上海人民出版社', '23.5', '30.2', '登录登录反馈开关机', 'book/0148.jpg', '1', '2018-03-31 09:40:06', '31', '10');
INSERT INTO `book` VALUES ('149', '英语泛读教程2', '管春林', '上海人民出版社', '33.2', '36.5', '地牢猎手浪蝶狂蜂解放军火花塞', 'book/0149.jpg', '1', '2018-03-31 09:40:56', '31', '10');
INSERT INTO `book` VALUES ('150', '美国文学透读', '管春林', '上海人民出版社', '32.1', '36.5', '索拉鲁斯看得开积分', 'book/0150.jpg', '0', '2018-03-31 09:41:49', '31', '10');
INSERT INTO `book` VALUES ('151', '英语教学法', '管春林', '上海人民出版社', '25.3', '30.2', '李老师了打开的foe', 'book/0151.jpg', '0', '2018-03-31 09:42:34', '31', '10');
INSERT INTO `book` VALUES ('152', '美国文学透读', '管春林', '上海人民出版社', '30.2', '33', '登录是林德洛夫孔府家酒', 'book/0152.jpg', '1', '2018-03-31 09:43:20', '31', '10');
INSERT INTO `book` VALUES ('153', '英语泛读教程1', '管春林', '上海人民出版社', '22.3', '32.3', '李老师看看打飞机', 'book/0153.jpg', '1', '2018-03-31 09:44:00', '31', '10');
INSERT INTO `book` VALUES ('154', '现代大学英语', '管春林', '上海人民出版社', '30.2', '33.2', '算了算了看的开发机机构', 'book/0154.jpg', '0', '2018-03-31 09:44:42', '31', '10');
INSERT INTO `book` VALUES ('155', '跨文化商务交际', '管春林', '上海人民出版社', '23.2', '33.2', '带来了斯柯达看风景老师的', 'book/0155.jpg', '0', '2018-03-31 09:45:38', '31', '10');
INSERT INTO `book` VALUES ('156', '高级日语1', '管春林', '上海人民出版社', '26.3', '32.1', '商量了速度快开发几节课', 'book/0156.jpg', '1', '2018-03-31 09:46:18', '31', '10');
INSERT INTO `book` VALUES ('157', '高级日语2', '管春林', '上海人民出版社', '23.5', '33.1', '水利电力卡夫卡就给客人', 'book/0157.jpg', '0', '2018-03-31 09:47:09', '31', '10');
INSERT INTO `book` VALUES ('158', '日语泛读教程1', '管春林', '上海人民出版社', '22.3', '33.2', '带来了市领导反馈可视对讲覅IE', 'book/0158.jpg', '0', '2018-03-31 09:47:55', '31', '10');
INSERT INTO `book` VALUES ('159', '日语泛读教程2', '管春林', '上海人民出版社', '25.3', '36.2', '湿漉漉的发扣扣父接口ski', 'book/0159.jpg', '1', '2018-03-31 09:48:39', '31', '10');
INSERT INTO `book` VALUES ('160', '日语听解教程1', '管春林', '上海人民出版社', '22.6', '32.1', '水利电力了贷款付款人', 'book/0160.jpg', '1', '2018-03-31 09:49:26', '31', '10');
INSERT INTO `book` VALUES ('161', '日语听解教程2', '管春林', '上海人民出版社', '23.5', '30.2', '朗朗上口肯定可以软件', 'book/0161.jpg', '0', '2018-03-31 09:50:23', '31', '10');
INSERT INTO `book` VALUES ('162', '日语听解教程3', '管春林', '上海人民出版社', '33.2', '36.2', '朗朗上口快打快打分级基金', 'book/0162.jpg', '0', '2018-03-31 09:51:05', '31', '10');
INSERT INTO `book` VALUES ('163', '日语听解教程4', '管春林', '上海人民出版社', '36.2', '39.2', '啦啦啦市领导反馈', 'book/0163.jpg', '1', '2018-03-31 09:51:50', '31', '10');
INSERT INTO `book` VALUES ('164', '高级商务英语写作', '管春林', '上海人民出版社', '22.3', '32.2', '得到看看累死了都付款可', 'book/0164.jpg', '1', '2018-03-31 09:58:58', '32', '10');
INSERT INTO `book` VALUES ('165', '商务英语口语1', '管春林', '上海人民出版社', '26.3', '32', '地牢猎手了卡卡卡的咖啡机', 'book/0165.jpg', '0', '2018-03-31 09:59:35', '32', '10');
INSERT INTO `book` VALUES ('166', '商务英语口语2', '管春林', '上海人民出版社', '25.6', '32.6', '带来了塑料袋冷风机', 'book/0166.jpg', '0', '2018-03-31 10:00:19', '32', '10');
INSERT INTO `book` VALUES ('167', '商务英语听力教程1', '管春林', '上海人民出版社', '22.3', '30.2', '带来了塑料袋卡夫卡', 'book/0167.jpg', '1', '2018-03-31 10:01:05', '32', '10');
INSERT INTO `book` VALUES ('168', '商务英语听力教程2', '管春林', '上海人民出版社', '23.6', '32.6', '李老师看看的快捷键发几个', 'book/0168.jpg', '1', '2018-03-31 10:01:54', '32', '10');
INSERT INTO `book` VALUES ('169', '商务英语阅读1', '管春林', '上海人民出版社', '26.3', '33.5', '理论上的看可以让', 'book/0169.jpg', '0', '2018-03-31 10:02:43', '32', '10');
INSERT INTO `book` VALUES ('170', '商务英语综合教程1', '管春林', '上海人民出版社', '23.1', '33.1', '了老师浪蝶狂蜂看看跟', 'book/0170.jpg', '0', '2018-03-31 10:03:28', '32', '10');
INSERT INTO `book` VALUES ('171', '商务英语综合教程1', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0171.jpg', '1', '2018-03-31 10:05:34', '32', '10');
INSERT INTO `book` VALUES ('172', '商务英语综合教程1', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0172.jpg', '0', '2018-03-31 10:05:30', '32', '10');
INSERT INTO `book` VALUES ('173', '商务英语综合教程1', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0173.jpg', '1', '2018-03-31 10:05:25', '32', '10');
INSERT INTO `book` VALUES ('174', '进出口贸易实务教程', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0174.jpg', '0', '2018-03-31 10:07:43', '33', '10');
INSERT INTO `book` VALUES ('175', '跨文化商务交流', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0175.jpg', '1', '2018-03-31 10:10:43', '33', '10');
INSERT INTO `book` VALUES ('176', '美国文学选读', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0176.jpg', '0', '2018-03-31 10:10:49', '33', '10');
INSERT INTO `book` VALUES ('177', '现代大学英语', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0177.jpg', '1', '2018-03-31 10:10:52', '33', '9');
INSERT INTO `book` VALUES ('178', '英语泛读教程1', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0178.jpg', '0', '2018-03-31 10:10:55', '33', '10');
INSERT INTO `book` VALUES ('179', '英语泛读教程2', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0179.jpg', '0', '2018-03-31 10:10:58', '33', '10');
INSERT INTO `book` VALUES ('180', '英语泛读教程3', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0180.jpg', '0', '2018-03-31 10:11:01', '33', '10');
INSERT INTO `book` VALUES ('181', '英语国家概况', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0181.jpg', '1', '2018-03-31 10:11:04', '33', '10');
INSERT INTO `book` VALUES ('182', '英语教学法', '管春林', '上海人民出版社', '22.3', '32.6', '了老师浪蝶狂蜂看看跟', 'book/0182.jpg', '1', '2018-03-31 10:11:06', '33', '10');
INSERT INTO `book` VALUES ('183', '大学军事理论教程', '管春林', '上海人民出版社', '22.6', '30.3', '的拉夫劳伦生理上的看过', 'book/0183.jpg', '1', '2018-03-31 10:16:59', '34', '10');
INSERT INTO `book` VALUES ('184', '概率论与数理统计', '管春林', '上海人民出版社', '22.3', '30.1', '李老师了看看人头就服你', 'book/0184.jpg', '1', '2018-03-31 10:17:29', '34', '8');
INSERT INTO `book` VALUES ('185', '马克思主义', '管春林', '上海人民出版社', '22.5', '33.6', '拉拉裤看得开尅爱人家', 'book/0185.jpg', '0', '2018-03-31 10:22:22', '34', '10');
INSERT INTO `book` VALUES ('186', '毛概', '管春林', '上海人民出版社', '53.3', '63.2', '的浏览打开尅一规范', 'book/0186.jpg', '0', '2018-03-31 10:22:19', '34', '10');
INSERT INTO `book` VALUES ('187', '思修', '管春林', '上海人民出版社', '23.4', '30.5', '案例累死了得开科技', 'book/0187.jpg', '0', '2018-03-31 10:22:16', '34', '10');
INSERT INTO `book` VALUES ('188', '新标准大学英语综合教程1', '管春林', '上海人民出版社', '32', '36.2', '颠肺流离分类可㛩', 'book/0188.jpg', '0', '2018-03-31 10:22:13', '34', '10');
INSERT INTO `book` VALUES ('189', '新标准大学英语综合教程2', '管春林', '上海人民出版社', '32.1', '39.6', '升水流量代课费', 'book/0189.jpg', '1', '2018-03-31 10:22:10', '34', '10');
INSERT INTO `book` VALUES ('190', '新标准大学英语综合教程3', '管春林', '上海人民出版社', '30.2', '33.2', '发给过路人兰蔻开发', 'book/0190.jpg', '1', '2018-03-31 10:22:08', '34', '10');
INSERT INTO `book` VALUES ('191', '新标准大学英语综合教程4', '管春林', '上海人民出版社', '23.6', '30.2', '大大森林里的利润', 'book/0191.jpg', '0', '2018-03-31 10:22:04', '34', '10');
INSERT INTO `book` VALUES ('192', '中国近代史概要', '管春林', '上海人民出版社', '31.2', '36.2', '闪客快打家啦地方', 'book/0192.jpg', '0', '2018-03-31 10:22:01', '34', '10');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '院主键id',
  `cname` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '院名',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '金融与经贸1');
INSERT INTO `category` VALUES ('2', '财税');
INSERT INTO `category` VALUES ('3', '工商管理');
INSERT INTO `category` VALUES ('4', '会计');
INSERT INTO `category` VALUES ('5', '信息');
INSERT INTO `category` VALUES ('6', '法政');
INSERT INTO `category` VALUES ('7', '文化传播与设计');
INSERT INTO `category` VALUES ('8', '外国语');
INSERT INTO `category` VALUES ('9', '共用');
INSERT INTO `category` VALUES ('14', '测试一级11');
INSERT INTO `category` VALUES ('16', 'ccc');

-- ----------------------------
-- Table structure for `categorysecond`
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT COMMENT '二级主键',
  `csname` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '二级名称',
  `cid` int(11) DEFAULT NULL COMMENT '一级id外键',
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF2E7A44E25` (`cid`),
  KEY `FK936FCAF2E77737C1` (`cid`),
  CONSTRAINT `FK936FCAF2E77737C1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`),
  CONSTRAINT `FK936FCAF2E7A44E25` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '保险学', '1');
INSERT INTO `categorysecond` VALUES ('2', '国际经济与贸易', '1');
INSERT INTO `categorysecond` VALUES ('3', '金融学', '1');
INSERT INTO `categorysecond` VALUES ('4', '经济学', '1');
INSERT INTO `categorysecond` VALUES ('5', '财政学', '2');
INSERT INTO `categorysecond` VALUES ('6', '劳动关系', '2');
INSERT INTO `categorysecond` VALUES ('7', '劳动与社会保障', '2');
INSERT INTO `categorysecond` VALUES ('8', '税收学', '2');
INSERT INTO `categorysecond` VALUES ('9', '工程管理', '3');
INSERT INTO `categorysecond` VALUES ('10', '工商管理', '3');
INSERT INTO `categorysecond` VALUES ('11', '人力资源管理', '3');
INSERT INTO `categorysecond` VALUES ('12', '市场营销', '3');
INSERT INTO `categorysecond` VALUES ('13', '物流管理', '3');
INSERT INTO `categorysecond` VALUES ('14', '会计分院', '4');
INSERT INTO `categorysecond` VALUES ('15', '会计学', '4');
INSERT INTO `categorysecond` VALUES ('16', '审计学', '4');
INSERT INTO `categorysecond` VALUES ('17', '资产评估', '4');
INSERT INTO `categorysecond` VALUES ('18', '电子商务', '5');
INSERT INTO `categorysecond` VALUES ('19', '计算机科学与技术', '5');
INSERT INTO `categorysecond` VALUES ('20', '信息管理与信息系统', '5');
INSERT INTO `categorysecond` VALUES ('21', '应用统计学', '5');
INSERT INTO `categorysecond` VALUES ('22', '法学', '6');
INSERT INTO `categorysecond` VALUES ('23', '行政管理', '6');
INSERT INTO `categorysecond` VALUES ('24', '社会工作', '6');
INSERT INTO `categorysecond` VALUES ('25', '产品设计', '7');
INSERT INTO `categorysecond` VALUES ('26', '服装与服饰设计', '7');
INSERT INTO `categorysecond` VALUES ('27', '广告学', '7');
INSERT INTO `categorysecond` VALUES ('28', '汉语言文学', '7');
INSERT INTO `categorysecond` VALUES ('29', '环境设计', '7');
INSERT INTO `categorysecond` VALUES ('30', '视觉传达设计', '7');
INSERT INTO `categorysecond` VALUES ('31', '日语', '8');
INSERT INTO `categorysecond` VALUES ('32', '商务英语', '8');
INSERT INTO `categorysecond` VALUES ('33', '英语', '8');
INSERT INTO `categorysecond` VALUES ('34', '其他', '9');

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论主键id',
  `comment` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '评论内容',
  `time` datetime DEFAULT NULL COMMENT '评论的时间',
  `commenter` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '评论人',
  `oid` int(11) DEFAULT NULL COMMENT '所评论的订单',
  PRIMARY KEY (`comment_id`),
  KEY `FKDC17DDF4E5016D2F` (`oid`),
  KEY `FKDC17DDF4E4CF0F63` (`oid`),
  CONSTRAINT `FKDC17DDF4E4CF0F63` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKDC17DDF4E5016D2F` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '达芙妮难道等开始看考虑的林德洛夫', '2018-04-06 23:48:12', '张三', '3');
INSERT INTO `comments` VALUES ('2', '搭飞机少量的福利费扣款日', '2018-04-07 10:36:15', '测试2', '14');
INSERT INTO `comments` VALUES ('3', 'kdkfjkddd', '2018-04-07 22:32:03', '测试4', '19');
INSERT INTO `comments` VALUES ('4', 'dfkdkdkdjdd', '2018-04-07 22:49:29', '测试5', '20');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单项id',
  `count` int(11) DEFAULT NULL COMMENT '订单项数目',
  `subtotal` double DEFAULT NULL COMMENT '订单总价',
  `bid` int(11) DEFAULT NULL COMMENT '图书外键',
  `oid` int(11) DEFAULT NULL COMMENT '订单外键',
  `uid` int(11) DEFAULT NULL COMMENT '用户外键',
  `time` date DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FKE8A41F81E4CF25E9` (`uid`),
  KEY `FKE8A41F81E5016D2F` (`oid`),
  KEY `FKE8A41F81B67251C` (`bid`),
  KEY `FKE8B2AB61E5016D2F` (`oid`),
  KEY `FKE8B2AB61B67251C` (`bid`),
  CONSTRAINT `FKE8A41F81B67251C` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`),
  CONSTRAINT `FKE8A41F81E4CF25E9` FOREIGN KEY (`uid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8A41F81E5016D2F` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8B2AB61B67251C` FOREIGN KEY (`bid`) REFERENCES `book` (`bid`),
  CONSTRAINT `FKE8B2AB61E5016D2F` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '22.6', '183', '2', '2', '2018-04-07');
INSERT INTO `orderitem` VALUES ('2', '1', '41.2', '19', '3', '3', '2018-04-07');
INSERT INTO `orderitem` VALUES ('3', '1', '40.2', '2', '3', '3', '2018-04-07');
INSERT INTO `orderitem` VALUES ('4', '1', '33', '41', '4', '4', '2018-04-07');
INSERT INTO `orderitem` VALUES ('5', '1', '36.5', '39', '5', '5', '2018-04-07');
INSERT INTO `orderitem` VALUES ('6', '1', '25.6', '46', '6', '6', '2018-04-08');
INSERT INTO `orderitem` VALUES ('7', '1', '23.5', '148', '7', '7', '2018-04-06');
INSERT INTO `orderitem` VALUES ('8', '1', '22.5', '185', '7', '7', '2018-04-06');
INSERT INTO `orderitem` VALUES ('9', '1', '23.2', '77', '8', '8', '2018-04-06');
INSERT INTO `orderitem` VALUES ('10', '1', '30.2', '26', '9', '9', '2018-04-06');
INSERT INTO `orderitem` VALUES ('11', '1', '25.3', '151', '10', '10', '2018-04-06');
INSERT INTO `orderitem` VALUES ('12', '1', '30.6', '94', '11', '11', '2018-04-06');
INSERT INTO `orderitem` VALUES ('13', '2', '61', '31', '12', '12', '2018-04-06');
INSERT INTO `orderitem` VALUES ('14', '2', '44.6', '171', '13', '13', '2018-04-07');
INSERT INTO `orderitem` VALUES ('15', '1', '20.6', '20', '14', '14', '2018-04-07');
INSERT INTO `orderitem` VALUES ('16', '1', '36.8', '1', '14', '14', '2018-04-07');
INSERT INTO `orderitem` VALUES ('17', '1', '33.5', '132', '15', '15', '2018-04-07');
INSERT INTO `orderitem` VALUES ('18', '1', '34.6', '59', '16', '16', '2018-04-07');
INSERT INTO `orderitem` VALUES ('19', '1', '36.8', '1', '16', '16', '2018-04-07');
INSERT INTO `orderitem` VALUES ('20', '1', '33.2', '25', '17', '17', '2018-04-07');
INSERT INTO `orderitem` VALUES ('21', '2', '67', '132', '18', '18', '2018-04-07');
INSERT INTO `orderitem` VALUES ('22', '1', '22.3', '184', '19', '19', '2018-04-07');
INSERT INTO `orderitem` VALUES ('23', '2', '88.6', '13', '20', '20', '2018-04-07');
INSERT INTO `orderitem` VALUES ('24', '1', '33.5', '132', '21', '21', '2018-04-07');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `total` double DEFAULT NULL COMMENT '订单总金额',
  `time` datetime DEFAULT NULL COMMENT '下单时间',
  `state` int(11) DEFAULT NULL COMMENT '订单状态',
  `name` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '收货人姓名',
  `addr` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '送货地址',
  `phone` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '默认收货电话',
  `messages` varchar(255) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '留言',
  `uid` int(11) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5743B27ED` (`uid`),
  CONSTRAINT `FKC3DF62E5743B27ED` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('2', '22.6', '2018-04-01 23:57:39', '2', '张三', '广东佛山', '17765632564', '测试测试', '5');
INSERT INTO `orders` VALUES ('3', '81.4', '2018-04-04 16:24:33', '4', '张三', '浙江杭州', '17769653658', '急急急', '5');
INSERT INTO `orders` VALUES ('4', '33', '2018-04-04 16:25:12', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('5', '36.5', '2018-04-04 16:25:20', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('6', '25.6', '2018-04-04 16:25:30', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('7', '46', '2018-04-04 16:26:01', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('8', '23.2', '2018-04-04 16:26:21', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('9', '30.2', '2018-04-04 16:26:28', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('10', '25.3', '2018-04-04 16:26:40', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('11', '30.6', '2018-04-04 16:26:49', '1', null, null, null, null, '5');
INSERT INTO `orders` VALUES ('12', '61', '2018-04-07 10:11:20', '3', '测试', '广东广州', '18865635425', '快快快', '21');
INSERT INTO `orders` VALUES ('13', '44.6', '2018-04-07 10:15:27', '2', '测试', '广州佛山', '17765636524', '再次快快快', '21');
INSERT INTO `orders` VALUES ('14', '57.4', '2018-04-07 10:28:41', '4', '测试2', '广东佛山', '17765632564', '打飞机速度快方法流浪狗', '22');
INSERT INTO `orders` VALUES ('15', '33.5', '2018-04-07 10:30:27', '1', null, null, null, null, '22');
INSERT INTO `orders` VALUES ('16', '71.4', '2018-04-07 22:04:46', '2', '李四1', '南海', '18865635426', '快快', '24');
INSERT INTO `orders` VALUES ('17', '33.2', '2018-04-07 22:14:27', '2', '测试4', '佛山', '17765963254', '的咖啡机', '28');
INSERT INTO `orders` VALUES ('18', '67', '2018-04-07 22:15:43', '2', '测试4', '广州', '18869635421', '大幅放大', '28');
INSERT INTO `orders` VALUES ('19', '22.3', '2018-04-07 22:19:31', '4', '测试4', '广东南海', '17765636524', '烦烦烦灌灌他突然', '28');
INSERT INTO `orders` VALUES ('20', '88.6', '2018-04-07 22:43:50', '4', '测试5', '广东揭阳', '17765636542', '快快快', '29');
INSERT INTO `orders` VALUES ('21', '33.5', '2018-04-07 22:46:35', '3', '测试5', '广东广州', '17765365424', '顶顶顶顶', '29');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id主键',
  `name` varchar(20) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '用户密码',
  `address` varchar(60) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '用户默认收货地址',
  `phone` varchar(11) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '用户默认收货人号码',
  `email` varchar(30) COLLATE utf8_general_mysql500_ci DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('5', '张三', '111111', '广州番禺', '17765632548', '1185630401@qq.com');
INSERT INTO `user` VALUES ('6', '李四', '123456', '广东佛山', '13665456535', '1163589755@qq.com');
INSERT INTO `user` VALUES ('7', '王五', '555555', '浙江杭州', '13656589547', '365489635@qq.com');
INSERT INTO `user` VALUES ('8', '赵六', '666666', '湖北武汉', '17565689542', '3654223@qq.com');
INSERT INTO `user` VALUES ('9', '田七', '777777', '汕头', '16635698563', '856456555@qq.com');
INSERT INTO `user` VALUES ('10', '邓一', '888888', '揭阳', '18965656362', '445636569@qq.com');
INSERT INTO `user` VALUES ('11', '小二', '999999', '汕尾', '13636565489', '886595246@qq.com');
INSERT INTO `user` VALUES ('12', '陈宇', '000000', '番禺', '13654565266', '996585635@qq.com');
INSERT INTO `user` VALUES ('13', '何以', '123456', '江门', '13654565235', '998856422@qq.com');
INSERT INTO `user` VALUES ('14', '赵凯', '789456', '茂名', '13265487965', '145236546@qq.com');
INSERT INTO `user` VALUES ('15', '范例库', '963963', '黑龙江', '13769586664', '1256354879@qq.com');
INSERT INTO `user` VALUES ('21', '测试', '111111', '广州佛山', '17765636524', '1185630402@qq.com');
INSERT INTO `user` VALUES ('22', '测试2', '111111', '广东揭阳', '17765632548', '1185630400@qq.com');
INSERT INTO `user` VALUES ('23', '李华', '123456', null, null, '1185632655@qq.com');
INSERT INTO `user` VALUES ('24', '李四1', '111111', '广东广州', '17765632589', '156663548@qq.com');
INSERT INTO `user` VALUES ('27', '测试3', '123456', null, null, '1185696356@qq.com');
INSERT INTO `user` VALUES ('28', '测试4', '111111', '广东南海', '17765636524', '115869365@qq.com');
INSERT INTO `user` VALUES ('29', '测试5', '111111', '广东广州', '17765365424', '1185696354@qq.com');
