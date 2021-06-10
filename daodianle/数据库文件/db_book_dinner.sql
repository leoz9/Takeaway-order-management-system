/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : db_book_dinner

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2019-01-06 17:40:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `realName` varchar(32) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('9', '猿来入此', '123', '猿来入此', '13989898989', '上海市浦东新区浦东南路1835号');
INSERT INTO `account` VALUES ('10', '猿来入此1', '123', '张三', '1365656565656', '上海 浦东');

-- ----------------------------
-- Table structure for `authority`
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `menuId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `menuId` (`menuId`),
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`),
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES ('148', '2', '35');
INSERT INTO `authority` VALUES ('149', '2', '36');
INSERT INTO `authority` VALUES ('150', '2', '25');
INSERT INTO `authority` VALUES ('151', '2', '1');
INSERT INTO `authority` VALUES ('152', '2', '14');
INSERT INTO `authority` VALUES ('153', '2', '15');
INSERT INTO `authority` VALUES ('246', '1', '1');
INSERT INTO `authority` VALUES ('247', '1', '5');
INSERT INTO `authority` VALUES ('248', '1', '17');
INSERT INTO `authority` VALUES ('249', '1', '18');
INSERT INTO `authority` VALUES ('250', '1', '19');
INSERT INTO `authority` VALUES ('251', '1', '20');
INSERT INTO `authority` VALUES ('252', '1', '13');
INSERT INTO `authority` VALUES ('253', '1', '21');
INSERT INTO `authority` VALUES ('254', '1', '22');
INSERT INTO `authority` VALUES ('255', '1', '23');
INSERT INTO `authority` VALUES ('256', '1', '35');
INSERT INTO `authority` VALUES ('257', '1', '36');
INSERT INTO `authority` VALUES ('258', '1', '14');
INSERT INTO `authority` VALUES ('259', '1', '15');
INSERT INTO `authority` VALUES ('260', '1', '24');
INSERT INTO `authority` VALUES ('261', '1', '25');
INSERT INTO `authority` VALUES ('262', '1', '26');
INSERT INTO `authority` VALUES ('263', '1', '31');
INSERT INTO `authority` VALUES ('264', '1', '32');
INSERT INTO `authority` VALUES ('265', '1', '33');
INSERT INTO `authority` VALUES ('266', '1', '34');
INSERT INTO `authority` VALUES ('267', '1', '37');
INSERT INTO `authority` VALUES ('268', '1', '38');
INSERT INTO `authority` VALUES ('269', '1', '40');
INSERT INTO `authority` VALUES ('270', '1', '41');
INSERT INTO `authority` VALUES ('271', '1', '42');
INSERT INTO `authority` VALUES ('272', '1', '39');
INSERT INTO `authority` VALUES ('273', '1', '43');
INSERT INTO `authority` VALUES ('274', '1', '44');
INSERT INTO `authority` VALUES ('275', '1', '45');
INSERT INTO `authority` VALUES ('276', '1', '46');
INSERT INTO `authority` VALUES ('277', '1', '47');
INSERT INTO `authority` VALUES ('278', '1', '48');
INSERT INTO `authority` VALUES ('279', '1', '49');
INSERT INTO `authority` VALUES ('280', '1', '50');
INSERT INTO `authority` VALUES ('281', '1', '51');
INSERT INTO `authority` VALUES ('282', '1', '52');
INSERT INTO `authority` VALUES ('283', '1', '53');
INSERT INTO `authority` VALUES ('284', '1', '54');

-- ----------------------------
-- Table structure for `c3p0testtable`
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for `food`
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `price` float(5,2) NOT NULL,
  `sels` int(5) NOT NULL DEFAULT '0',
  `imageUrl` varchar(128) DEFAULT NULL,
  `des` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoryId` (`categoryId`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `food_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('3', '2', '经典稻香米饭', '2.00', '1', '/BookDinner/resources/upload/1546674714109.jpg', '经典香喷喷的米饭。');
INSERT INTO `food` VALUES ('4', '3', '绿茶', '6.00', '0', '/BookDinner/resources/upload/1546736787656.jpg', '清新绿茶');
INSERT INTO `food` VALUES ('5', '2', '老上海葱油拌面', '9.00', '0', '/BookDinner/resources/upload/1546749809733.jpg', '老上海葱油拌面');
INSERT INTO `food` VALUES ('6', '2', '牛肉炒饭', '18.00', '0', '/BookDinner/resources/upload/1546749854607.jpg', '香喷喷的牛肉炒饭');
INSERT INTO `food` VALUES ('7', '2', '奶香馒头', '4.00', '0', '/BookDinner/resources/upload/1546749909393.jpg', '奶香馒头');
INSERT INTO `food` VALUES ('8', '2', '蒜味印度烤饼', '5.00', '0', '/BookDinner/resources/upload/1546749959618.jpg', '蒜味印度烤饼');
INSERT INTO `food` VALUES ('9', '3', '青柠鸡尾酒', '15.00', '2', '/BookDinner/resources/upload/1546750013304.jpg', '青柠鸡尾酒');
INSERT INTO `food` VALUES ('10', '3', '经典自酿啤酒', '12.00', '0', '/BookDinner/resources/upload/1546750061633.jpg', '经典自酿啤酒');
INSERT INTO `food` VALUES ('11', '3', '经典自酿梅酒', '12.00', '0', '/BookDinner/resources/upload/1546750093733.jpg', '经典自酿梅酒');
INSERT INTO `food` VALUES ('12', '3', '经典自酿苹果酒', '12.00', '0', '/BookDinner/resources/upload/1546750133856.jpg', '经典自酿苹果酒');
INSERT INTO `food` VALUES ('13', '5', '招牌蚵仔煎', '28.00', '0', '/BookDinner/resources/upload/1546750198783.jpg', '蚵仔煎是道地台湾小吃，小朋友都很喜欢，我也从小就爱吃。肥美蚵仔搭配软Ｑ面糊、清脆小白菜、铁板香气的煎蛋，真的好吃 !');
INSERT INTO `food` VALUES ('14', '5', '日本料理店的招牌亲子丼', '26.00', '1', '/BookDinner/resources/upload/1546750252959.jpg', '日本料理店的招牌亲子丼');
INSERT INTO `food` VALUES ('15', '5', '婆婆的招牌菜粉蒸肉', '32.00', '1', '/BookDinner/resources/upload/1546750283805.jpg', '婆婆的招牌菜粉蒸肉');
INSERT INTO `food` VALUES ('16', '5', '招牌咕咾肉', '38.00', '2', '/BookDinner/resources/upload/1546750311690.jpg', '招牌咕咾肉');
INSERT INTO `food` VALUES ('17', '5', '热炒招牌三杯杏鲍菇', '22.00', '0', '/BookDinner/resources/upload/1546750344207.jpg', '热炒招牌三杯杏鲍菇');
INSERT INTO `food` VALUES ('18', '5', '吉野家的招牌牛肉饭', '28.00', '1', '/BookDinner/resources/upload/1546750383584.jpg', '吉野家的招牌牛肉饭');
INSERT INTO `food` VALUES ('19', '5', '糖醋丸子', '28.00', '2', '/BookDinner/resources/upload/1546750471087.jpg', '糖醋丸子');
INSERT INTO `food` VALUES ('20', '5', '招牌红焖肘子', '36.00', '0', '/BookDinner/resources/upload/1546750503607.jpg', '招牌红焖肘子');
INSERT INTO `food` VALUES ('21', '6', '红烧排骨', '36.00', '0', '/BookDinner/resources/upload/1546750552223.jpg', '红烧排骨');
INSERT INTO `food` VALUES ('22', '6', '可乐鸡翅', '25.00', '0', '/BookDinner/resources/upload/1546750581873.jpg', '可乐鸡翅');
INSERT INTO `food` VALUES ('23', '6', '红烧肉', '25.00', '1', '/BookDinner/resources/upload/1546750616801.jpg', '红烧肉');
INSERT INTO `food` VALUES ('24', '6', '正宗水煮肉片', '29.80', '0', '/BookDinner/resources/upload/1546750646975.jpg', '正宗水煮肉片');
INSERT INTO `food` VALUES ('25', '6', '家常麻婆豆腐', '16.80', '0', '/BookDinner/resources/upload/1546750730763.jpg', '家常麻婆豆腐');
INSERT INTO `food` VALUES ('26', '7', '家常凉菜', '9.00', '2', '/BookDinner/resources/upload/1546750770326.jpg', '家常凉菜');
INSERT INTO `food` VALUES ('27', '7', '皮蛋凉菜', '9.00', '3', '/BookDinner/resources/upload/1546750814633.jpg', '皮蛋凉菜');
INSERT INTO `food` VALUES ('28', '7', '卤牛肉', '19.00', '4', '/BookDinner/resources/upload/1546750834007.jpg', '卤牛肉');
INSERT INTO `food` VALUES ('29', '7', '棒棒鸡丝-适合夏天的凉菜', '18.00', '2', '/BookDinner/resources/upload/1546750860736.jpg', '棒棒鸡丝-适合夏天的凉菜');
INSERT INTO `food` VALUES ('30', '7', '拍黄瓜：三分钟小凉菜', '12.00', '2', '/BookDinner/resources/upload/1546750888985.jpg', '拍黄瓜：三分钟小凉菜');

-- ----------------------------
-- Table structure for `food_category`
-- ----------------------------
DROP TABLE IF EXISTS `food_category`;
CREATE TABLE `food_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food_category
-- ----------------------------
INSERT INTO `food_category` VALUES ('2', '主食');
INSERT INTO `food_category` VALUES ('3', '酒水饮料');
INSERT INTO `food_category` VALUES ('5', '招牌菜品');
INSERT INTO `food_category` VALUES ('6', '经典热菜');
INSERT INTO `food_category` VALUES ('7', '各类凉菜');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('13', '用户名为admin的用户登录时输入验证码错误!', '2018-12-16 18:17:30');
INSERT INTO `log` VALUES ('14', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:22:56');
INSERT INTO `log` VALUES ('15', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:37:15');
INSERT INTO `log` VALUES ('16', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 18:40:21');
INSERT INTO `log` VALUES ('17', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2018-12-16 19:11:49');
INSERT INTO `log` VALUES ('18', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:13:32');
INSERT INTO `log` VALUES ('19', '用户名为{admin}，的用户成功修改密码!', '2018-12-16 19:14:01');
INSERT INTO `log` VALUES ('20', '用户名为{猿来入此}，角色为{普通用户}的用户登录成功!', '2018-12-16 19:17:46');
INSERT INTO `log` VALUES ('21', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 12:01:20');
INSERT INTO `log` VALUES ('22', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 12:12:30');
INSERT INTO `log` VALUES ('23', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 12:20:16');
INSERT INTO `log` VALUES ('24', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 12:20:51');
INSERT INTO `log` VALUES ('25', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 12:55:49');
INSERT INTO `log` VALUES ('26', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 13:09:19');
INSERT INTO `log` VALUES ('27', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 13:19:11');
INSERT INTO `log` VALUES ('28', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 13:21:06');
INSERT INTO `log` VALUES ('29', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 14:10:05');
INSERT INTO `log` VALUES ('30', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 14:16:48');
INSERT INTO `log` VALUES ('31', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 14:57:33');
INSERT INTO `log` VALUES ('32', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 14:59:39');
INSERT INTO `log` VALUES ('33', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 15:05:30');
INSERT INTO `log` VALUES ('34', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 15:22:39');
INSERT INTO `log` VALUES ('35', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 15:29:48');
INSERT INTO `log` VALUES ('36', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 16:36:59');
INSERT INTO `log` VALUES ('37', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 17:01:12');
INSERT INTO `log` VALUES ('38', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 17:03:04');
INSERT INTO `log` VALUES ('39', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 17:14:26');
INSERT INTO `log` VALUES ('40', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-05 17:17:33');
INSERT INTO `log` VALUES ('41', '用户名为admin的用户登录时输入验证码错误!', '2019-01-06 09:03:34');
INSERT INTO `log` VALUES ('42', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 09:03:48');
INSERT INTO `log` VALUES ('43', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 09:15:35');
INSERT INTO `log` VALUES ('44', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 09:22:00');
INSERT INTO `log` VALUES ('45', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 09:23:41');
INSERT INTO `log` VALUES ('46', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 09:28:54');
INSERT INTO `log` VALUES ('47', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 09:45:00');
INSERT INTO `log` VALUES ('48', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 10:14:40');
INSERT INTO `log` VALUES ('49', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 12:42:00');
INSERT INTO `log` VALUES ('50', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 17:19:43');
INSERT INTO `log` VALUES ('51', '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2019-01-06 17:29:24');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(32) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES ('5', '1', '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES ('13', '1', '角色管理', '../admin/role/list', 'icon-group-key');
INSERT INTO `menu` VALUES ('14', '0', '用户管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES ('15', '14', '用户列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES ('17', '5', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('18', '5', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('19', '5', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('20', '5', '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES ('21', '13', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('22', '13', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('23', '13', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('24', '15', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('25', '15', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('26', '15', '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES ('31', '0', '系统日志', '', 'icon-table-cell');
INSERT INTO `menu` VALUES ('32', '31', '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES ('33', '32', '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES ('34', '32', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('35', '1', '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('36', '35', '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES ('37', '0', '菜品管理', '', 'icon-drink-empty');
INSERT INTO `menu` VALUES ('38', '37', '分类管理', '../admin/food_category/list', 'icon-sitemap-color');
INSERT INTO `menu` VALUES ('39', '37', '菜品管理', '../admin/food/list', 'icon-drink-red');
INSERT INTO `menu` VALUES ('40', '38', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('41', '38', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('42', '38', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('43', '39', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('44', '39', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('45', '39', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('46', '0', '客户管理', '', 'icon-users');
INSERT INTO `menu` VALUES ('47', '46', '客户列表', '../admin/account/list', 'icon-user-group');
INSERT INTO `menu` VALUES ('48', '47', '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES ('49', '47', '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES ('50', '47', '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES ('51', '0', '订单管理', '', 'icon-cart');
INSERT INTO `menu` VALUES ('52', '51', '订单列表', '../admin/order/list', 'icon-cart-full');
INSERT INTO `menu` VALUES ('53', '52', '编辑', 'openEdit()', 'icon-cart-edit');
INSERT INTO `menu` VALUES ('54', '52', '查看', 'openView()', 'icon-eye');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL,
  `money` float(5,2) NOT NULL,
  `productNum` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `recieveName` varchar(32) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(128) NOT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('11', '9', '113.00', '8', '2', '猿来入此', '13989898989', '上海市浦东新区浦东南路1835号', '2019-01-06 17:29:05');
INSERT INTO `orders` VALUES ('12', '9', '236.00', '9', '0', '猿来入此', '13989898989', '上海市浦东新区浦东南路1835号', '2019-01-06 17:36:40');
INSERT INTO `orders` VALUES ('13', '9', '107.00', '7', '1', '猿来入此', '13989898989', '上海市浦东新区浦东南路1835号', '2019-01-06 17:37:06');

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `foodName` varchar(128) NOT NULL,
  `foodImage` varchar(128) NOT NULL,
  `price` float(5,2) NOT NULL,
  `foodNum` int(3) NOT NULL,
  `money` float(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('15', '11', '26', '家常凉菜', '/BookDinner/resources/upload/1546750770326.jpg', '9.00', '1', '9.00');
INSERT INTO `order_item` VALUES ('16', '11', '27', '皮蛋凉菜', '/BookDinner/resources/upload/1546750814633.jpg', '9.00', '2', '18.00');
INSERT INTO `order_item` VALUES ('17', '11', '28', '卤牛肉', '/BookDinner/resources/upload/1546750834007.jpg', '19.00', '2', '38.00');
INSERT INTO `order_item` VALUES ('18', '11', '29', '棒棒鸡丝-适合夏天的凉菜', '/BookDinner/resources/upload/1546750860736.jpg', '18.00', '2', '36.00');
INSERT INTO `order_item` VALUES ('19', '11', '30', '拍黄瓜：三分钟小凉菜', '/BookDinner/resources/upload/1546750888985.jpg', '12.00', '1', '12.00');
INSERT INTO `order_item` VALUES ('20', '12', '14', '日本料理店的招牌亲子丼', '/BookDinner/resources/upload/1546750252959.jpg', '26.00', '1', '26.00');
INSERT INTO `order_item` VALUES ('21', '12', '15', '婆婆的招牌菜粉蒸肉', '/BookDinner/resources/upload/1546750283805.jpg', '32.00', '1', '32.00');
INSERT INTO `order_item` VALUES ('22', '12', '16', '招牌咕咾肉', '/BookDinner/resources/upload/1546750311690.jpg', '38.00', '2', '76.00');
INSERT INTO `order_item` VALUES ('23', '12', '18', '吉野家的招牌牛肉饭', '/BookDinner/resources/upload/1546750383584.jpg', '28.00', '1', '28.00');
INSERT INTO `order_item` VALUES ('24', '12', '19', '糖醋丸子', '/BookDinner/resources/upload/1546750471087.jpg', '28.00', '2', '56.00');
INSERT INTO `order_item` VALUES ('25', '12', '26', '家常凉菜', '/BookDinner/resources/upload/1546750770326.jpg', '9.00', '1', '9.00');
INSERT INTO `order_item` VALUES ('26', '12', '27', '皮蛋凉菜', '/BookDinner/resources/upload/1546750814633.jpg', '9.00', '1', '9.00');
INSERT INTO `order_item` VALUES ('27', '13', '3', '经典稻香米饭', '/BookDinner/resources/upload/1546674714109.jpg', '2.00', '1', '2.00');
INSERT INTO `order_item` VALUES ('28', '13', '9', '青柠鸡尾酒', '/BookDinner/resources/upload/1546750013304.jpg', '15.00', '2', '30.00');
INSERT INTO `order_item` VALUES ('29', '13', '23', '红烧肉', '/BookDinner/resources/upload/1546750616801.jpg', '25.00', '1', '25.00');
INSERT INTO `order_item` VALUES ('30', '13', '28', '卤牛肉', '/BookDinner/resources/upload/1546750834007.jpg', '19.00', '2', '38.00');
INSERT INTO `order_item` VALUES ('31', '13', '30', '拍黄瓜：三分钟小凉菜', '/BookDinner/resources/upload/1546750888985.jpg', '12.00', '1', '12.00');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES ('2', '普通用户', '普通用户，请自由授权！');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `roleId` int(11) NOT NULL,
  `photo` varchar(128) DEFAULT NULL,
  `sex` int(1) NOT NULL DEFAULT '0',
  `age` int(3) NOT NULL DEFAULT '0',
  `address` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '1', '/BookDinner/resources/upload/1546661004297.jpg', '1', '1', '上海市浦东新区浦东南路1835号');
INSERT INTO `user` VALUES ('13', '猿来入此', '123456', '2', '/BookDinner/resources/upload/1546661017251.jpg', '1', '1', '猿来入此');
