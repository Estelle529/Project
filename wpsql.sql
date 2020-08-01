/*
Navicat MySQL Data Transfer

Source Server         : plant
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : wpsql1

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-05-17 09:41:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '首页置顶', '首页轮播图', null, null);

-- ----------------------------
-- Table structure for `banner_item`
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES ('1', '65', '24', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('2', '2', '6', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('3', '3', '1', '3', null, '1', null);
INSERT INTO `banner_item` VALUES ('4', '1', '4', '2', null, '1', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '花卉植物', '55', null, null, null);
INSERT INTO `category` VALUES ('2', '水培植物', '5', null, null, null);
INSERT INTO `category` VALUES ('3', '爬藤植物', '6', null, null, null);
INSERT INTO `category` VALUES ('4', '食虫植物', '4', null, null, null);
INSERT INTO `category` VALUES ('5', '多肉植物', '8', null, null, null);
INSERT INTO `category` VALUES ('6', '宿根植物', '7', null, null, null);
INSERT INTO `category` VALUES ('7', '茎叶观赏', '9', null, null, null);

-- ----------------------------
-- Table structure for `flower_language`
-- ----------------------------
DROP TABLE IF EXISTS `flower_language`;
CREATE TABLE `flower_language` (
  `id` int(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `name_detail` varchar(30) NOT NULL,
  `language` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of flower_language
-- ----------------------------
INSERT INTO `flower_language` VALUES ('1', '玫瑰', '玫瑰', '爱情,高贵,爱与美,容光焕发,纯洁的爱,美丽的爱情,美好常在。');
INSERT INTO `flower_language` VALUES ('2', '玫瑰', '白玫瑰', '我足以与你相配');
INSERT INTO `flower_language` VALUES ('3', '玫瑰', '蓝玫瑰', '奇迹与不可能实现的事');
INSERT INTO `flower_language` VALUES ('4', '玫瑰', '绿玫瑰', '纯真简朴');
INSERT INTO `flower_language` VALUES ('5', '玫瑰', '紫玫瑰', '忧郁，高贵，浪漫真情和珍贵独特');
INSERT INTO `flower_language` VALUES ('6', '玫瑰', '粉玫瑰', '感动，爱的宣言，铭记于心，初恋');
INSERT INTO `flower_language` VALUES ('7', '玫瑰', '黄玫瑰', '对于表示纯洁的友谊和美好的祝福，但对于爱情表示嫉妒失恋和消逝的爱');
INSERT INTO `flower_language` VALUES ('8', '玫瑰', '香槟玫瑰', '爱上你是我今生最大的幸福');
INSERT INTO `flower_language` VALUES ('9', '玫瑰', '蓝色妖姬', '清纯的爱和敦厚善良');
INSERT INTO `flower_language` VALUES ('10', '玫瑰', '路易十四玫瑰', '我只钟情你一个');
INSERT INTO `flower_language` VALUES ('11', '玫瑰', '洛丽玛丝玫瑰', '死的怀念');
INSERT INTO `flower_language` VALUES ('12', '康乃馨', '白色康乃馨', '甜美而可爱、天真无邪、纯洁的爱、给女性带来好运气的礼物、纯洁、纯洁的友谊、我活生生的爱情、吾爱永在');
INSERT INTO `flower_language` VALUES ('13', '康乃馨', '粉色康乃馨', '我永远不会忘了你、美丽、年青、热爱、祝母亲永远年轻美丽；感动、亮丽、母爱、女性的爱、我热烈地爱着你');
INSERT INTO `flower_language` VALUES ('14', '康乃馨', '红色康乃馨', '我的心为你而痛、赞赏、崇拜、迷恋、母爱、亲情、热烈的爱、热情、受伤的心、思念、相信你的爱、祝母亲健康');
INSERT INTO `flower_language` VALUES ('15', '康乃馨', '黄色康乃馨', '你让我感到失望、抛弃、藐视、长久的友谊、对母亲的感谢之恩、拒绝、侮讳、侮蔑、永远感谢、友谊深厚。');
INSERT INTO `flower_language` VALUES ('16', '康乃馨', '米红色康乃馨', '伤感深');
INSERT INTO `flower_language` VALUES ('17', '康乃馨', '红色康乃馨', '热烈的爱');
INSERT INTO `flower_language` VALUES ('18', '康乃馨', '桃红色康乃馨', '热爱着你');
INSERT INTO `flower_language` VALUES ('19', '康乃馨', '杂色康乃馨', '拒绝你的爱');
INSERT INTO `flower_language` VALUES ('20', '康乃馨', '紫色康乃馨', '任性、变幻莫测');
INSERT INTO `flower_language` VALUES ('21', '康乃馨', '斑纹康乃馨', '拒绝、我不能和你在一起');
INSERT INTO `flower_language` VALUES ('22', '康乃馨', '条纹康乃馨', '对不起');
INSERT INTO `flower_language` VALUES ('23', '郁金香', '郁金香', '爱的表白、荣誉、祝福永恒');
INSERT INTO `flower_language` VALUES ('24', '郁金香', '郁金香（红）', '爱的宣言、喜悦、热爱');
INSERT INTO `flower_language` VALUES ('25', '郁金香', '郁金香（粉）', '美人、热爱、幸福');
INSERT INTO `flower_language` VALUES ('26', '郁金香', '郁金香（黄）', '高贵、珍重、财富');
INSERT INTO `flower_language` VALUES ('27', '郁金香', '郁金香（紫）', '无尽的爱、最爱');
INSERT INTO `flower_language` VALUES ('28', '郁金香', '郁金香（白）', '纯情、纯洁');
INSERT INTO `flower_language` VALUES ('29', '郁金香', '郁金香（双色）', '美丽的你、喜相逢');
INSERT INTO `flower_language` VALUES ('30', '郁金香', '郁金香（羽毛）', '情意绵绵 ');
INSERT INTO `flower_language` VALUES ('31', '鸢尾', '鸢尾（爱丽丝）', '优美');
INSERT INTO `flower_language` VALUES ('32', '鸢尾', '德国鸢尾（深宝蓝色）', '神圣');
INSERT INTO `flower_language` VALUES ('33', '鸢尾', '小鸢尾（明黄色）', '协力抵挡、同心');
INSERT INTO `flower_language` VALUES ('34', '鸢尾', '鸢尾爱丽斯（紫蓝色）', '好消息、使者、想念你');
INSERT INTO `flower_language` VALUES ('35', '鸢尾', '鸢尾（黄色）', '表示友谊永固、热情开朗');
INSERT INTO `flower_language` VALUES ('36', '鸢尾', '鸢尾（白色)', '代表纯真');
INSERT INTO `flower_language` VALUES ('37', '鸢尾', '鸢尾（蓝色）', '是赞赏对方素雅大方或暗中仰慕；也有人认为是代表着宿命中的游离和破碎的激情，精致的美丽，可是易碎且易逝');
INSERT INTO `flower_language` VALUES ('38', '鸢尾', '鸢尾（紫色）', '寓意爱意与吉祥');
INSERT INTO `flower_language` VALUES ('39', '水仙花', '水仙', '自恋；只爱自己');
INSERT INTO `flower_language` VALUES ('40', '水仙花', '中国水仙', '纯洁、吉祥');
INSERT INTO `flower_language` VALUES ('41', '水仙花', '西洋水仙', '坚贞爱情、爱你、纯洁');
INSERT INTO `flower_language` VALUES ('42', '水仙花', '黄水仙', '重温爱情');
INSERT INTO `flower_language` VALUES ('43', '水仙花', '山水仙', '美好时光、欣欣向荣');
INSERT INTO `flower_language` VALUES ('44', '山茶花', '山茶花', '可爱，谦让，理想的爱，了不起的魅力');
INSERT INTO `flower_language` VALUES ('45', '山茶花', '白色山茶花', '纯真无邪');
INSERT INTO `flower_language` VALUES ('46', '山茶花', '山茶花 (白) ', '你怎能轻视我的爱情');
INSERT INTO `flower_language` VALUES ('47', '山茶花', '山茶花 (红) ', '天生丽质');
INSERT INTO `flower_language` VALUES ('48', '菊花', '非洲菊（扶郎花）', '神秘、兴奋  ');
INSERT INTO `flower_language` VALUES ('49', '菊花', '雏菊（延命菊）', '愉快、幸福、纯洁、天真、和平、希望、美人');
INSERT INTO `flower_language` VALUES ('50', '菊花', '菊花', '清净、高洁、我爱你、真情');
INSERT INTO `flower_language` VALUES ('51', '菊花', '翠菊', '追想、可靠的爱情、请相信我');
INSERT INTO `flower_language` VALUES ('52', '菊花', '春菊', '为爱情占卜');
INSERT INTO `flower_language` VALUES ('53', '菊花', '六月菊', '别离');
INSERT INTO `flower_language` VALUES ('54', '菊花', '冬菊', '别离');
INSERT INTO `flower_language` VALUES ('55', '菊花', '法国小菊', '忍耐');
INSERT INTO `flower_language` VALUES ('56', '菊花', '瓜叶菊', '快乐');
INSERT INTO `flower_language` VALUES ('57', '菊花', '波斯菊', '野性美');
INSERT INTO `flower_language` VALUES ('58', '菊花', '大波斯菊', '少女纯情');
INSERT INTO `flower_language` VALUES ('59', '菊花', '万寿菊', '友情');
INSERT INTO `flower_language` VALUES ('60', '菊花', '矢车菊', '纤细、优雅');
INSERT INTO `flower_language` VALUES ('61', '菊花', '麦杆菊', '永恒的记忆、刻画在心');
INSERT INTO `flower_language` VALUES ('62', '菊花', '鳞托菊', '永远的爱');
INSERT INTO `flower_language` VALUES ('63', '菊花', '黑心菊', '独树一帜的爱  ');
INSERT INTO `flower_language` VALUES ('64', '菊花', '蛇目菊', '恳切的喜悦');
INSERT INTO `flower_language` VALUES ('65', '菊花', '天人菊', '团结、同心协力');
INSERT INTO `flower_language` VALUES ('66', '菊花', '荷兰菊', '活动与说谎');
INSERT INTO `flower_language` VALUES ('67', '风信子', '风信子', '永远的怀念');
INSERT INTO `flower_language` VALUES ('68', '风信子', '风信子（白）', '恬适、沉静的爱(不敢表露的爱)');
INSERT INTO `flower_language` VALUES ('69', '风信子', '风信子（蓝）', '蓝风信子是所有风信子的始祖，因此它的花语是-生命');
INSERT INTO `flower_language` VALUES ('70', '风信子', '风信子（紫）', '悲伤、妒忌，忧郁的爱(得到我的爱，你一定会幸福快乐)  ');
INSERT INTO `flower_language` VALUES ('71', '风信子', '风信子（红）', '感谢你，让人感动的爱(你的爱充满我心中)');
INSERT INTO `flower_language` VALUES ('72', '风信子', '风信子（黄）', '幸福、美满，与你相伴很幸福');
INSERT INTO `flower_language` VALUES ('73', '风信子', '风信子（粉）', '倾慕、浪漫');
INSERT INTO `flower_language` VALUES ('74', '石竹花', '石竹', '纯洁的爱、才能、大胆、女性美');
INSERT INTO `flower_language` VALUES ('75', '石竹花', '丁香石竹', '大胆、积极');
INSERT INTO `flower_language` VALUES ('76', '石竹花', '五彩石竹', '女性美');
INSERT INTO `flower_language` VALUES ('77', '石竹花', '香石竹', '热心');
INSERT INTO `flower_language` VALUES ('78', '百合', '百合', '纯洁、清香、百年好合');
INSERT INTO `flower_language` VALUES ('79', '百合', '香水百合', '纯洁、富贵、婚礼的祝福');
INSERT INTO `flower_language` VALUES ('80', '百合', '白百合', '纯洁、庄严、心心相印  ');
INSERT INTO `flower_language` VALUES ('81', '百合', '葵百合', '胜利、荣誉、富贵  ');
INSERT INTO `flower_language` VALUES ('82', '百合', '姬百合', '财富、荣誉，清纯，高雅 ');
INSERT INTO `flower_language` VALUES ('83', '百合', '野百合', '永远幸福');
INSERT INTO `flower_language` VALUES ('84', '百合', '狐尾百合', '尊贵、欣欣向荣、杰出  ');
INSERT INTO `flower_language` VALUES ('85', '百合', '玉米百合', '执著的爱、勇敢  ');
INSERT INTO `flower_language` VALUES ('86', '百合', '编笠百合', '才能、威严、杰出  ');
INSERT INTO `flower_language` VALUES ('87', '百合', '圣诞百合', '喜洋洋、庆祝、真情  ');
INSERT INTO `flower_language` VALUES ('88', '百合', '水仙百合', '喜悦、期待相逢');
INSERT INTO `flower_language` VALUES ('89', '曼陀罗', '紫色曼陀罗', '恐怖');
INSERT INTO `flower_language` VALUES ('90', '曼陀罗', '蓝色曼陀罗', '诈情，骗爱');
INSERT INTO `flower_language` VALUES ('91', '曼陀罗', '粉色曼陀罗', '适意');
INSERT INTO `flower_language` VALUES ('92', '曼陀罗', '绿色曼陀罗', '生生不息的希望');
INSERT INTO `flower_language` VALUES ('93', '曼陀罗', '黑色曼陀罗', '不可预知的黑暗、死亡和颠沛流离的爱。无间的爱和复仇，凡间的无爱与无仇，被伤害的坚韧创痍的心灵，生的不');
INSERT INTO `flower_language` VALUES ('94', '曼陀罗', '金色曼陀罗', '敬爱，天生的幸运儿，有着不止息的幸福');
INSERT INTO `flower_language` VALUES ('95', '曼陀罗', '白色曼陀罗', '情花，如用酒吞服，会使人发笑，有麻醉作用。是天上开的花，白色而柔软，见此花者，恶自去除');
INSERT INTO `flower_language` VALUES ('96', '曼陀罗', '红色曼陀罗', '非曼珠沙华，切勿混淆。 流血 血腥的爱');
INSERT INTO `flower_language` VALUES ('97', '曼陀罗', '茶色曼陀罗', '理性，智慧，优雅');
INSERT INTO `flower_language` VALUES ('98', '曼陀罗', '黄色曼陀罗', '尊贵，权利，纷扰不息的争斗');
INSERT INTO `flower_language` VALUES ('99', '百日草', '百日草（洋红色）', '持续的爱');
INSERT INTO `flower_language` VALUES ('100', '百日草', '百日草（混色）', '纪念一个不在的友人');
INSERT INTO `flower_language` VALUES ('101', '百日草', '百日草（绯红色）', '恒久不变');
INSERT INTO `flower_language` VALUES ('102', '百日草', '百日草（白色）', '善良');
INSERT INTO `flower_language` VALUES ('103', '百日草', '百日草（黄色）', '每日的问候');
INSERT INTO `flower_language` VALUES ('104', '兰花', '紫罗兰', '永续的美');
INSERT INTO `flower_language` VALUES ('105', '兰花', '小苍兰', '纯真、无邪');
INSERT INTO `flower_language` VALUES ('106', '兰花', '嘉德利亚兰', '贵妇人');
INSERT INTO `flower_language` VALUES ('107', '兰花', '文心兰', '隐藏的爱');
INSERT INTO `flower_language` VALUES ('108', '兰花', '剑兰', '高雅、长寿、康宁');
INSERT INTO `flower_language` VALUES ('109', '蝴蝶兰', '白花蝴蝶兰', '爱情纯洁 友谊珍贵');
INSERT INTO `flower_language` VALUES ('110', '蝴蝶兰', '红心蝴蝶兰', '鸿运当头 永结同心');
INSERT INTO `flower_language` VALUES ('111', '蝴蝶兰', '红色蝴蝶兰', '仕途顺畅 幸福美满');
INSERT INTO `flower_language` VALUES ('112', '蝴蝶兰', '条点蝴蝶兰', '事事顺心 心想事成');
INSERT INTO `flower_language` VALUES ('113', '蝴蝶兰', '黄色蝴蝶兰', '事业发达 生意兴隆');
INSERT INTO `flower_language` VALUES ('114', '蝴蝶兰', '迷你蝴蝶兰', '快乐天使 活灵活现');
INSERT INTO `flower_language` VALUES ('115', '蝴蝶兰', '蝴蝶兰对应星座', '水瓶座&射手座，代表忠诚，智慧，理性，美德');
INSERT INTO `flower_language` VALUES ('116', '海棠花', '海棠', '游子思乡、离愁别绪');
INSERT INTO `flower_language` VALUES ('117', '海棠花', '四季海棠', '快乐聪慧');
INSERT INTO `flower_language` VALUES ('118', '海棠花', '秋海棠', '苦恋');
INSERT INTO `flower_language` VALUES ('119', '海棠花', '玫瑰海棠', '温和、美丽');
INSERT INTO `flower_language` VALUES ('120', '海棠花', '木瓜海棠', '强烈的爱，专一和健康');
INSERT INTO `flower_language` VALUES ('121', '海棠花', '西府海棠', '美丽、娴静、单恋');
INSERT INTO `flower_language` VALUES ('122', '其他', '木棉', '珍惜身边的人，珍惜身边的幸福');
INSERT INTO `flower_language` VALUES ('123', '其他', '蔷薇', '追忆');
INSERT INTO `flower_language` VALUES ('124', '其他', '海芋', '希望、雄壮之美  ');
INSERT INTO `flower_language` VALUES ('125', '其他', '剑兰', '用心、长寿、福禄、康宁  、幽会');
INSERT INTO `flower_language` VALUES ('126', '其他', '牡丹', '富贵');
INSERT INTO `flower_language` VALUES ('127', '其他', '桃花', '爱情的俘虏  ');
INSERT INTO `flower_language` VALUES ('128', '其他', '芙蓉', '纤细之美 花箴言：世上没有爱情悲剧，只有因爱而生的悲剧');
INSERT INTO `flower_language` VALUES ('129', '其他', '铃兰', '把握幸福  ');
INSERT INTO `flower_language` VALUES ('130', '其他', '莲花', '信仰  ');
INSERT INTO `flower_language` VALUES ('131', '其他', '樱花', '纯洁');
INSERT INTO `flower_language` VALUES ('132', '其他', '梅花', '高雅、高尚、不粗俗');
INSERT INTO `flower_language` VALUES ('133', '其他', '木兰', '灵魂高尚');
INSERT INTO `flower_language` VALUES ('134', '其他', '昙花', '刹那间的美丽，一瞬间的永恒');
INSERT INTO `flower_language` VALUES ('135', '其他', '火鹤花', '新婚、祝福、幸运、快乐');
INSERT INTO `flower_language` VALUES ('136', '其他', '爱丽丝', '稳重、勇于追求爱情  ');
INSERT INTO `flower_language` VALUES ('137', '其他', '小苍兰', '纯洁、幸福、清新舒畅  ');
INSERT INTO `flower_language` VALUES ('138', '其他', '蓝花楹', '在绝望中等待爱情，虽败犹荣');
INSERT INTO `flower_language` VALUES ('139', '其他', '向日葵', '沉默的爱（多指暗恋）');
INSERT INTO `flower_language` VALUES ('140', '其他', '桔梗花', '无望的爱');
INSERT INTO `flower_language` VALUES ('141', '其他', '星辰花', '永不变心');
INSERT INTO `flower_language` VALUES ('142', '其他', '满天星', '真心喜欢');
INSERT INTO `flower_language` VALUES ('143', '其他', '圣诞红', '祝福');
INSERT INTO `flower_language` VALUES ('144', '其他', '金鱼草', '爱出风头');
INSERT INTO `flower_language` VALUES ('145', '其他', '大理花', '华丽、优雅 ');
INSERT INTO `flower_language` VALUES ('146', '其他', '迷迭香', '回忆不想忘记的过去；纪念');
INSERT INTO `flower_language` VALUES ('147', '其他', '薰衣草', '等待爱情  ');
INSERT INTO `flower_language` VALUES ('148', '其他', '三色堇', '沉思、请想念我  ');
INSERT INTO `flower_language` VALUES ('149', '其他', '天竺葵', '爱情安乐愉快 ');
INSERT INTO `flower_language` VALUES ('150', '其他', '非洲堇', '关怀我吧  ');
INSERT INTO `flower_language` VALUES ('151', '其他', '四叶草', '幸运  ');
INSERT INTO `flower_language` VALUES ('152', '其他', '蒲公英', '无法停留的爱  ');
INSERT INTO `flower_language` VALUES ('153', '其他', '龙胆花', '喜欢看忧伤时的你  ');
INSERT INTO `flower_language` VALUES ('154', '其他', '白罂粟', '遗忘，初恋');
INSERT INTO `flower_language` VALUES ('155', '其他', '勿忘我', '永恒的爱、浓情厚谊、永不变的心');
INSERT INTO `flower_language` VALUES ('156', '其他', '黑法师', '诅咒、神秘');
INSERT INTO `flower_language` VALUES ('157', '其他', '紫荆花', '亲情，兄弟和睦');
INSERT INTO `flower_language` VALUES ('158', '其他', '栀子花', '坚强永恒的爱，一生的守候，我们的爱');
INSERT INTO `flower_language` VALUES ('159', '其他', '茉莉花', '忠贞、尊敬、清纯、贞洁、质朴、玲珑、迷人');
INSERT INTO `flower_language` VALUES ('160', '其他', '君子兰', '高贵，有君子之风');
INSERT INTO `flower_language` VALUES ('161', '其他', '仙客来', '内向');
INSERT INTO `flower_language` VALUES ('162', '其他', '朱顶红', '渴望被爱；追求爱');
INSERT INTO `flower_language` VALUES ('163', '其他', '荼蘼花', '末路之美');
INSERT INTO `flower_language` VALUES ('164', '其他', '玛格丽特', '暗恋 ');
INSERT INTO `flower_language` VALUES ('165', '其他', '曼珠沙华（红）', '无尽的爱情，死亡的前兆，地狱的召唤');
INSERT INTO `flower_language` VALUES ('166', '其他', '曼陀罗华（白）', '无尽的思念，绝望的爱情，天堂的回信');
INSERT INTO `flower_language` VALUES ('167', '其他', '桃色夹竹桃', '咒骂，注意危险');
INSERT INTO `flower_language` VALUES ('168', '其他', '黄色夹竹桃', '深刻的友情');

-- ----------------------------
-- Table structure for `image`
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/banner-1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('2', '/banner-2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('3', '/banner-3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('4', '/category-1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('5', '/category-2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('6', '/category-3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('7', '/category-4.jpg', '1', null, null);
INSERT INTO `image` VALUES ('8', '/category-5.jpg', '1', null, null);
INSERT INTO `image` VALUES ('9', '/category-6.jpg', '1', null, null);
INSERT INTO `image` VALUES ('16', '/theme-1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('17', '/theme-2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('18', '/theme-3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('19', '/bh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('20', '/bh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('21', '/bh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('22', '/fxz1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('23', '/fxz0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('24', '/fxz2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('25', '/jh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('26', '/jh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('27', '/jh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('28', '/mlh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('29', '/mlh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('31', '/mlh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('32', '/sx0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('33', '/sx1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('36', '/sx2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('37', '/xrq0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('38', '/xrq1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('39', '/xrq2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('40', '/zylsh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('41', '/zylsh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('42', '/zylsh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('43', '/ll0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('44', '/ll1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('45', '/ll2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('46', '/mgc0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('47', '/mgc1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('48', '/mgc2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('52', '/dl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('53', '/dl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('54', '/dl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('55', '/category-7.jpg', '1', null, null);
INSERT INTO `image` VALUES ('56', '/bh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('57', '/dl3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('58', '/fxz3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('59', '/jh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('60', '/ll3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('61', '/mlh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('62', '/sx3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('63', '/xrq3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('64', '/theme-4.jpg', '1', null, null);
INSERT INTO `image` VALUES ('65', '/banner-4.jpg', '1', null, null);
INSERT INTO `image` VALUES ('66', '/jzl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('67', '/jzl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('68', '/jzl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('69', '/jzl3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('70', '/hdl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('71', '/hdl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('72', '/hdl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('73', '/hdl3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('74', '/bhy0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('75', '/bhy1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('76', '/bhy2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('77', '/bhy3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('78', '/gyz0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('79', '/gyz1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('80', '/gyz2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('81', '/gyz3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('82', '/lh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('83', '/lh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('84', '/lh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('85', '/lh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('86', '/cct0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('87', '/cct1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('88', '/cct2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('89', '/cct3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('90', '/byc0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('91', '/byc1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('92', '/byc2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('93', '/byc3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('94', '/zlc0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('95', '/zlc1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('96', '/zlc2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('97', '/zlc3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('98', '/fwz0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('99', '/fwz1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('100', '/fwz2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('101', '/fwz3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('102', '/swk0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('103', '/swk1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('104', '/swk2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('105', '/swk3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('106', '/hxc0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('107', '/hxc1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('108', '/hxc2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('109', '/hxc3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('110', '/wz0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('111', '/wz1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('112', '/wz2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('113', '/yw0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('114', '/yw1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('115', '/yw2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('116', '/yw3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('117', '/sk0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('118', '/sk1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('119', '/sk2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('120', '/sk3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('121', '/wxy0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('122', '/wxy2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('123', '/wxy3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('124', '/wxy4.jpg', '1', null, null);
INSERT INTO `image` VALUES ('125', '/szh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('126', '/szh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('127', '/szh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('128', '/szh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('129', '/hwl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('130', '/hwl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('131', '/hwl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('132', '/hwl3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('133', '/gl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('134', '/gl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('135', '/gl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('136', '/cch0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('137', '/cch1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('138', '/cch2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('139', '/cch3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('140', '/hxh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('141', '/hxh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('142', '/hxh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('143', '/hxh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('144', '/zzh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('145', '/zzh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('146', '/zzh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('147', '/zzh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('148', '/xzy0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('149', '/xzy1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('150', '/xzy2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('151', '/txj0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('152', '/txj1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('153', '/txj2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('154', '/sy0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('155', '/sy1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('156', '/sy2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('157', '/ql0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('158', '/ql1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('159', '/ql2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('160', '/ql3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('161', '/hgy0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('162', '/hgy1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('163', '/hgy2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('164', '/gbz0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('165', '/gbz1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('166', '/gbz2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('167', '/dhhx0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('168', '/dhhx1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('169', '/dhhx2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('170', '/dhhx3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('171', '/txl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('172', '/txl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('173', '/txl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('174', '/txl3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('175', '/ls0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('176', '/ls1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('177', '/ls2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('178', '/yzh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('179', '/yzh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('180', '/yzh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('181', '/lwh0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('182', '/lwh1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('183', '/lwh2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('184', '/lwh3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('185', '/qfs0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('186', '/qfs1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('187', '/qfs2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('188', '/ghg0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('189', '/ghg1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('190', '/ghg2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('191', '/xsl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('192', '/xsl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('193', '/xsl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('194', '/xmx0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('195', '/xmx1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('196', '/xmx2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('197', '/jql0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('198', '/jql1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('199', '/jql2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('200', '/jyl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('201', '/jyl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('202', '/jyl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('203', '/ljht0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('204', '/ljht1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('205', '/ljht2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('206', '/swz0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('207', '/swz1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('208', '/swz2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('209', '/nzl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('210', '/nzl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('211', '/nzl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('212', '/lnl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('213', '/lnl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('214', '/lnl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('215', '/ch0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('216', '/ch1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('217', '/ch2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('218', '/xkl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('219', '/xkl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('220', '/xkl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('221', '/xkl3.jpg', '1', null, null);
INSERT INTO `image` VALUES ('222', '/hds0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('223', '/hds1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('224', '/hds2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('225', '/ymr0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('226', '/ymr1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('227', '/ymr2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('228', '/jpl0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('229', '/jpl1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('230', '/jpl2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('231', '/wwc0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('232', '/wwc1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('233', '/wwc2.jpg', '1', null, null);
INSERT INTO `image` VALUES ('234', '/dsgy0.jpg', '1', null, null);
INSERT INTO `image` VALUES ('235', '/dsgy1.jpg', '1', null, null);
INSERT INTO `image` VALUES ('236', '/dsgy2.jpg', '1', null, null);

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('37', 'A223227058113087', '59', null, '1582422705', '6.00', '2', 'http://localhost/zerg/public/images/mlh0.jpg', '茉莉花', '2', '1582438518', '[{\"id\":2,\"haveStock\":true,\"counts\":2,\"name\":\"\\u8309\\u8389\\u82b1\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/mlh0.jpg\",\"totalPrice\":6}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('38', 'A223228231402795', '59', null, '1582422823', '4.50', '2', 'http://localhost/zerg/public/images/mlh0.jpg', '茉莉花等', '2', '1582422824', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"name\":\"\\u8309\\u8389\\u82b1\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/mlh0.jpg\",\"totalPrice\":3},{\"id\":4,\"haveStock\":true,\"counts\":1,\"name\":\"\\u767e\\u5408\",\"price\":\"1.50\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/bh0.jpg\",\"totalPrice\":1.5}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('39', 'A223229934647372', '59', null, '1582422993', '4.00', '3', 'http://localhost/zerg/public/images/sx0.jpg', '水仙', '2', '1582727183', '[{\"id\":3,\"haveStock\":true,\"counts\":2,\"name\":\"\\u6c34\\u4ed9\",\"price\":\"2.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/sx0.jpg\",\"totalPrice\":4}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('40', 'A223233096634792', '59', null, '1582423309', '1.50', '3', 'http://localhost/zerg/public/images/bh0.jpg', '百合', '1', '1582727182', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"name\":\"\\u767e\\u5408\",\"price\":\"1.50\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/bh0.jpg\",\"totalPrice\":1.5}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('41', 'A223381491622910', '59', null, '1582438149', '6.00', '3', 'http://localhost/zerg/public/images/mlh0.jpg', '茉莉花', '2', '1582727176', '[{\"id\":2,\"haveStock\":true,\"counts\":2,\"name\":\"\\u8309\\u8389\\u82b1\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/mlh0.jpg\",\"totalPrice\":6}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('42', 'A223386112856566', '59', null, '1582438611', '1.50', '1', 'http://localhost/zerg/public/images/bh0.jpg', '百合', '1', '1582438611', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"name\":\"\\u767e\\u5408\",\"price\":\"1.50\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/bh0.jpg\",\"totalPrice\":1.5}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('43', 'A223451684695657', '59', null, '1582445168', '7.50', '3', 'http://localhost/zerg/public/images/bh0.jpg', '百合', '5', '1582727172', '[{\"id\":4,\"haveStock\":true,\"counts\":5,\"name\":\"\\u767e\\u5408\",\"price\":\"1.50\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/bh0.jpg\",\"totalPrice\":7.5}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('44', 'A229669284540773', '59', null, '1582966928', '22.00', '3', 'http://localhost/zerg/public/images/sx0.jpg', '水仙等', '5', '1583834289', '[{\"id\":3,\"haveStock\":true,\"counts\":1,\"name\":\"\\u6c34\\u4ed9\",\"price\":\"2.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/sx0.jpg\",\"totalPrice\":2},{\"id\":17,\"haveStock\":true,\"counts\":4,\"name\":\"\\u6355\\u8747\\u8349\",\"price\":\"5.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/byc0.jpg\",\"totalPrice\":20}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('45', 'A301262977833735', '59', null, '1583026297', '6.00', '1', 'http://localhost/zerg/public/images/jh0.jpg', '秋菊', '2', '1583026297', '[{\"id\":9,\"haveStock\":true,\"counts\":2,\"name\":\"\\u79cb\\u83ca\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/jh0.jpg\",\"totalPrice\":6}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('46', 'A301266363417353', '59', null, '1583026636', '12.00', '1', 'http://localhost/zerg/public/images/mlh0.jpg', '茉莉花', '4', '1583026636', '[{\"id\":2,\"haveStock\":true,\"counts\":4,\"name\":\"\\u8309\\u8389\\u82b1\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/mlh0.jpg\",\"totalPrice\":12}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('47', 'A301304012188628', '59', null, '1583030401', '4.00', '3', 'http://localhost/zerg/public/images/fxz0.jpg', '风信子', '2', '1583386845', '[{\"id\":1,\"haveStock\":true,\"counts\":2,\"name\":\"\\u98ce\\u4fe1\\u5b50\",\"price\":\"2.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/fxz0.jpg\",\"totalPrice\":4}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-02-21 17:02:53\"}', null);
INSERT INTO `order` VALUES ('48', 'A310269426817269', '59', null, '1583826942', '3.00', '3', 'http://localhost/zerg/public/images/mlh0.jpg', '茉莉花', '1', '1583827100', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"name\":\"\\u8309\\u8389\\u82b1\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/mlh0.jpg\",\"totalPrice\":3}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-03-10 15:55:41\"}', null);
INSERT INTO `order` VALUES ('49', 'A315408340742385', '59', null, '1584240834', '15.00', '1', 'http://localhost/zerg/public/images/xzy0.jpg', '袖珍椰', '1', '1584240834', '[{\"id\":32,\"haveStock\":true,\"counts\":1,\"name\":\"\\u8896\\u73cd\\u6930\",\"price\":\"15.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/xzy0.jpg\",\"totalPrice\":15}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-03-10 15:55:41\"}', null);
INSERT INTO `order` VALUES ('50', 'A315409599218575', '59', null, '1584240959', '15.00', '2', 'http://localhost/zerg/public/images/xzy0.jpg', '袖珍椰', '1', '1584240963', '[{\"id\":32,\"haveStock\":true,\"counts\":1,\"name\":\"\\u8896\\u73cd\\u6930\",\"price\":\"15.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/xzy0.jpg\",\"totalPrice\":15}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-03-10 15:55:41\"}', null);
INSERT INTO `order` VALUES ('51', 'A315412205706503', '59', null, '1584241220', '15.00', '1', 'http://localhost/zerg/public/images/xzy0.jpg', '袖珍椰', '1', '1584241220', '[{\"id\":32,\"haveStock\":true,\"counts\":1,\"name\":\"\\u8896\\u73cd\\u6930\",\"price\":\"15.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/xzy0.jpg\",\"totalPrice\":15}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-03-10 15:55:41\"}', null);
INSERT INTO `order` VALUES ('52', 'A315430277363293', '59', null, '1584243027', '15.00', '2', 'http://localhost/zerg/public/images/xzy0.jpg', '袖珍椰', '1', '1584243029', '[{\"id\":32,\"haveStock\":true,\"counts\":1,\"name\":\"\\u8896\\u73cd\\u6930\",\"price\":\"15.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/xzy0.jpg\",\"totalPrice\":15}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-03-10 15:55:41\"}', null);
INSERT INTO `order` VALUES ('53', 'A315432590758272', '59', null, '1584243258', '158.00', '1', 'http://localhost/zerg/public/images/dl0.jpg', '吊兰等', '13', '1584243258', '[{\"id\":6,\"haveStock\":true,\"counts\":6,\"name\":\"\\u540a\\u5170\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/dl0.jpg\",\"totalPrice\":18},{\"id\":29,\"haveStock\":true,\"counts\":7,\"name\":\"\\u957f\\u6625\\u82b1\",\"price\":\"20.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/cch0.jpg\",\"totalPrice\":140}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-03-10 15:55:41\"}', null);
INSERT INTO `order` VALUES ('54', 'A315436015359406', '59', null, '1584243601', '24.00', '2', 'http://localhost/zerg/public/images/fxz0.jpg', '风信子等', '9', '1584243603', '[{\"id\":1,\"haveStock\":true,\"counts\":3,\"name\":\"\\u98ce\\u4fe1\\u5b50\",\"price\":\"2.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/fxz0.jpg\",\"totalPrice\":6},{\"id\":2,\"haveStock\":true,\"counts\":6,\"name\":\"\\u8309\\u8389\\u82b1\",\"price\":\"3.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/mlh0.jpg\",\"totalPrice\":18}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"15670609309\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":59,\"update_time\":\"2020-03-10 15:55:41\"}', null);
INSERT INTO `order` VALUES ('55', 'A316705727134724', '59', null, '1584370572', '160.00', '3', 'http://localhost/zerg/public/images/ql0.jpg', '球兰', '8', '1584582117', '[{\"id\":35,\"haveStock\":true,\"counts\":8,\"name\":\"\\u7403\\u5170\",\"price\":\"20.00\",\"main_img_url\":\"http:\\/\\/localhost\\/zerg\\/public\\/images\\/ql0.jpg\",\"totalPrice\":160}]', '{\"create_time\":\"2020-02-21 11:01:36\",\"id\":39,\"name\":\"\\u6d4b\\u8bd5\",\"mobile\":\"15670609309\",\"province\":\"\\u9ed1\\u9f99\\u6c5f\\u7701\",\"city\":\"\\u53cc\\u9e2d\\u5c71\\u5e02\",\"country\":\"\\u5b9d\\u5c71\\u533a\",\"detail\":\"\\u6d4b\\u8bd5\\u6570\\u636e\",\"user_id\":59,\"update_time\":\"2020-03-16 22:56:07\"}', null);

-- ----------------------------
-- Table structure for `order_product`
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('47', '1', '2', null, null);
INSERT INTO `order_product` VALUES ('54', '1', '3', null, null);
INSERT INTO `order_product` VALUES ('37', '2', '2', null, null);
INSERT INTO `order_product` VALUES ('38', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('41', '2', '2', null, null);
INSERT INTO `order_product` VALUES ('46', '2', '4', null, null);
INSERT INTO `order_product` VALUES ('48', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('54', '2', '6', null, null);
INSERT INTO `order_product` VALUES ('39', '3', '2', null, null);
INSERT INTO `order_product` VALUES ('44', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('38', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('40', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('42', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('43', '4', '5', null, null);
INSERT INTO `order_product` VALUES ('53', '6', '6', null, null);
INSERT INTO `order_product` VALUES ('45', '9', '2', null, null);
INSERT INTO `order_product` VALUES ('44', '17', '4', null, null);
INSERT INTO `order_product` VALUES ('53', '29', '7', null, null);
INSERT INTO `order_product` VALUES ('49', '32', '1', null, null);
INSERT INTO `order_product` VALUES ('50', '32', '1', null, null);
INSERT INTO `order_product` VALUES ('51', '32', '1', null, null);
INSERT INTO `order_product` VALUES ('52', '32', '1', null, null);
INSERT INTO `order_product` VALUES ('55', '35', '8', null, null);

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  `star` int(11) DEFAULT NULL,
  `flower_language` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '风信子', '2.00', '197', null, '1', '/fxz0.jpg', '1', null, null, null, '23', '123', '喜悦、生命、幸福、浓情、沉静的爱、永远的怀念');
INSERT INTO `product` VALUES ('2', '茉莉花', '3.00', '194', null, '1', '/mlh0.jpg', '1', null, null, null, '28', '234', '你是我的-白色:亲切、喜爱感官感受 紫色:猜忌、成熟美、胆小、臆测');
INSERT INTO `product` VALUES ('3', '水仙', '2.00', '200', null, '1', '/sx0.jpg', '1', null, null, null, '32', '234', '纯洁、吉祥');
INSERT INTO `product` VALUES ('4', '百合', '1.50', '200', null, '1', '/bh0.jpg', '1', null, null, null, '19', '534', '纯洁、高雅、忠贞、神圣');
INSERT INTO `product` VALUES ('5', '绿萝', '2.00', '200', null, '2', '/ll0.jpg', '1', null, null, null, '43', '423', '坚韧善良、守望幸福');
INSERT INTO `product` VALUES ('6', '吊兰', '3.00', '194', null, '3', '/dl0.jpg', '1', null, null, null, '52', '323', '无奈而又给人希望');
INSERT INTO `product` VALUES ('7', '茅膏菜', '1.00', '200', null, '4', '/mgc0.jpg', '1', null, null, null, '46', '234', '我吃虫子，但我不危险');
INSERT INTO `product` VALUES ('8', '仙人球', '2.00', '200', null, '5', '/xrq0.jpg', '1', null, null, null, '37', '245', '坚强，将爱情进行到底');
INSERT INTO `product` VALUES ('9', '秋菊', '3.00', '200', null, '6', '/jh0.jpg', '1', null, null, null, '25', '344', '清净、高洁、我爱你、真情');
INSERT INTO `product` VALUES ('10', '皱叶冷水花', '2.00', '200', null, '7', '/zylsh0.jpg', '1', null, null, null, '40', '423', '爱的相思与别离');
INSERT INTO `product` VALUES ('11', '君子兰', '5.00', '200', null, '6', '/jzl0.jpg', '1', null, null, null, '66', '433', '君子谦谦、有才得志却不骄傲');
INSERT INTO `product` VALUES ('12', '蝴蝶兰', '4.00', '200', null, '1', '/hdl0.jpg', '1', null, null, null, '70', '321', '花姿如蝴蝶飞舞而得名，花语为我爱你，象征着高洁、清雅');
INSERT INTO `product` VALUES ('13', '白鹤芋', '5.00', '200', null, '2', '/bhy0.jpg', '1', null, null, null, '74', '456', '一帆风顺，事业有成');
INSERT INTO `product` VALUES ('14', '观音竹', '3.00', '200', null, '2', '/gyz0.jpg', '1', null, null, null, '78', '234', '高尚、节节高升、平安');
INSERT INTO `product` VALUES ('15', '芦荟', '5.00', '200', null, '5', '/lh0.jpg', '1', null, null, null, '82', '442', '自尊又自卑的爱');
INSERT INTO `product` VALUES ('16', '常春藤', '3.00', '100', null, '3', '/cct0.jpg', '1', null, null, null, '86', '234', '友谊、结婚、永不分离、感化、活力、欢乐以及亘古永恒的青春');
INSERT INTO `product` VALUES ('17', '捕蝇草', '5.00', '100', null, '4', '/byc0.jpg', '1', null, null, null, '90', '345', '天然的智慧');
INSERT INTO `product` VALUES ('18', '猪笼草', '5.00', '50', null, '4', '/zlc0.jpg', '1', null, null, null, '94', '222', '无欲无求 ');
INSERT INTO `product` VALUES ('19', '凤尾竹', '10.00', '100', null, '7', '/fwz0.jpg', '1', null, null, null, '98', '543', '辟邪、节节高升、平安');
INSERT INTO `product` VALUES ('20', '散尾葵', '15.00', '150', null, '7', '/swk0.jpg', '1', null, null, null, '102', '456', '四面腾达、祥瑞吉利');
INSERT INTO `product` VALUES ('21', '含羞草', '5.00', '200', null, '7', '/hxc0.jpg', '1', null, null, null, '106', '345', '害羞，敏感，礼貌');
INSERT INTO `product` VALUES ('22', '文竹', '10.00', '200', null, '7', '/wz0.jpg', '1', null, null, null, '110', '333', '象征永恒，朋友纯洁的心，永远不变。婚礼用花中，它是婚姻幸福甜蜜，爱情地久天长的象征。');
INSERT INTO `product` VALUES ('23', '鸢尾', '5.00', '200', null, '6', '/yw0.jpg', '1', null, null, null, '113', '444', '爱情和友谊、希望、童话');
INSERT INTO `product` VALUES ('24', '蜀葵', '10.00', '200', null, '6', '/sk0.jpg', '1', null, null, null, '117', '342', '梦、温和');
INSERT INTO `product` VALUES ('25', '晚香玉', '15.00', '100', null, '6', '/wxy0.jpg', '1', null, null, null, '121', '355', '危险的快乐');
INSERT INTO `product` VALUES ('26', '石竹花', '3.00', '200', null, '6', '/szh0.jpg', '1', null, null, null, '125', '342', '纯洁的爱、才能、大胆、女性美');
INSERT INTO `product` VALUES ('27', '虎尾兰', '5.00', '200', null, '7', '/hwl0.jpg', '1', null, null, null, '129', '333', '坚强、刚毅、坚韧、长长久久、富贵招财');
INSERT INTO `product` VALUES ('28', '瓜栗', '20.00', '200', null, '7', '/gl0.jpg', '1', null, null, null, '133', '444', '财源滚滚、招财进宝、生意兴隆、前程似锦');
INSERT INTO `product` VALUES ('29', '长春花', '20.00', '193', null, '1', '/cch0.jpg', '1', null, null, null, '136', '355', '愉快的回忆');
INSERT INTO `product` VALUES ('30', '含笑花', '15.00', '200', null, '1', '/hxh0.jpg', '1', null, null, null, '140', '423', '矜持、含蓄、美丽、庄重、纯洁、高洁、端庄');
INSERT INTO `product` VALUES ('31', '栀子花', '15.00', '200', null, '1', '/zzh0.jpg', '1', null, null, null, '144', '555', '坚强、永恒的爱、一生的守候');
INSERT INTO `product` VALUES ('32', '袖珍椰', '15.00', '13', null, '7', '/xzy0.jpg', '1', null, null, null, '148', '234', '蓬勃的生机与活力');
INSERT INTO `product` VALUES ('33', '铁线蕨', '20.00', '130', null, '7', '/txj0.jpg', '1', null, null, null, '151', '456', '雅致、少女的娇柔');
INSERT INTO `product` VALUES ('34', '芍药', '15.00', '200', null, '1', '/sy0.jpg', '1', null, null, null, '154', '442', '美丽动人、依依不舍、难舍难分、真诚不变');
INSERT INTO `product` VALUES ('35', '球兰', '20.00', '92', null, '2', '/ql0.jpg', '1', null, null, null, '157', '566', '青春美丽');
INSERT INTO `product` VALUES ('36', '合果芋', '20.00', '100', null, '2', '/hgy0.jpg', '1', null, null, null, '161', '234', '纯洁的爱情');
INSERT INTO `product` VALUES ('37', '龟背竹', '15.00', '200', null, '2', '/gbz0.jpg', '1', null, null, null, '164', '342', '延年益寿');
INSERT INTO `product` VALUES ('38', '大花红星', '20.00', '100', null, '2', '/dhhx0.jpg', '1', null, null, null, '167', '555', '富贵、尊敬');
INSERT INTO `product` VALUES ('39', '铁线莲', '20.00', '50', null, '3', '/txl0.jpg', '1', null, null, null, '171', '456', '高洁、美丽的心、欺骗、贫穷、宽恕我，我因你而有罪');
INSERT INTO `product` VALUES ('40', '络石', '15.00', '23', null, '3', '/ls0.jpg', '1', null, null, null, '175', '565', '万德吉祥');
INSERT INTO `product` VALUES ('41', '叶子花', '15.00', '34', null, '3', '/yzh0.jpg', '1', null, null, null, '178', '321', '热情、坚韧不拔、顽强奋进');
INSERT INTO `product` VALUES ('42', '露薇花', '15.00', '50', null, '5', '/lwh0.jpg', '1', null, null, null, '181', '453', '童话般的爱');
INSERT INTO `product` VALUES ('43', '千佛手', '20.00', '100', null, '5', '/qfs0.jpg', '1', null, null, null, '185', '238', '积极的，有善意的');
INSERT INTO `product` VALUES ('44', '广寒宫', '20.00', '100', null, '5', '/ghg0.jpg', '1', null, null, null, '188', '443', '冷漠和高傲');
INSERT INTO `product` VALUES ('45', '小松绿', '10.00', '100', null, '5', '/xsl0.jpg', '1', null, null, null, '191', '456', '积极的，有善意的');
INSERT INTO `product` VALUES ('46', '小米星', '10.00', '100', null, '5', '/xmx0.jpg', '1', null, null, null, '194', '423', '肩扛努力、顽强向上');
INSERT INTO `product` VALUES ('47', '姬秋丽', '10.00', '100', null, '5', '/jql0.jpg', '1', null, null, null, '197', '512', '走入岁月的清秋，那一笼郁郁葱葱，低吟浅唱，都为你沉淀');
INSERT INTO `product` VALUES ('48', '姬玉露', '10.00', '100', null, '5', '/jyl0.jpg', '1', null, null, null, '200', '520', '冰清玉洁');
INSERT INTO `product` VALUES ('49', '鹿角海棠', '20.00', '100', null, '5', '/ljht0.jpg', '1', null, null, null, '203', '520', '温顺可爱');
INSERT INTO `product` VALUES ('50', '鼠尾掌', '15.00', '100', null, '5', '/swz0.jpg', '1', null, null, null, '206', '435', '坚强沉稳伪装');
INSERT INTO `product` VALUES ('51', '凝脂莲', '20.00', '100', null, '5', '/nzl0.jpg', '1', null, null, null, '209', '341', '冰清玉洁');
INSERT INTO `product` VALUES ('52', '丽娜莲', '20.00', '100', null, '5', '/lnl0.jpg', '1', null, null, null, '212', '452', '不断提炼中···');
INSERT INTO `product` VALUES ('53', '茶花', '50.00', '100', null, '7', '/ch0.jpg', '1', null, null, null, '215', '123', '纯真无邪、天生丽质');
INSERT INTO `product` VALUES ('54', '仙客来', '30.00', '100', null, '1', '/xkl0.jpg', '1', null, null, null, '218', '432', '喜迎宾客、内向、优美');
INSERT INTO `product` VALUES ('55', '红豆杉', '30.00', '110', null, '7', '/hds0.jpg', '1', null, null, null, '222', '456', '高雅、高傲、相思');
INSERT INTO `product` VALUES ('56', '虞美人', '20.00', '100', null, '6', '/ymr0.jpg', '1', null, null, null, '225', '563', '安慰、遗忘、休息');
INSERT INTO `product` VALUES ('57', '酒瓶兰', '30.00', '100', null, '7', '/jpl0.jpg', '1', null, null, null, '228', '124', '落落大方');
INSERT INTO `product` VALUES ('58', '勿忘草', '10.00', '100', null, '6', '/wwc0.jpg', '1', null, null, null, '231', '555', '永恒的爱,浓情厚谊,永不变的心,永远的回忆');
INSERT INTO `product` VALUES ('59', '滴水观音', '30.00', '50', null, '2', '/dsgy0.jpg', '1', null, null, null, '234', '231', '志同道合、诚意、内蕴清秀');

-- ----------------------------
-- Table structure for `product_breeding`
-- ----------------------------
DROP TABLE IF EXISTS `product_breeding`;
CREATE TABLE `product_breeding` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `detail` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_breeding
-- ----------------------------
INSERT INTO `product_breeding` VALUES ('1', '养护要点1', '土壤：风信子应选择排水良好，不太干燥的沙质壤土为宜，要求土壤肥沃，有机质含量高，团粒结构好，中性至微碱性，pH值6-7的水平。', '1', null, null);
INSERT INTO `product_breeding` VALUES ('2', '养护要点2', '盆栽：用壤土、腐叶土、细沙等混合作营养土，一般10厘米口径盆栽一球，15厘米口径盆栽2-3球，然后将盆埋入土中，其上覆土10厘米-15厘米。', '1', null, null);
INSERT INTO `product_breeding` VALUES ('3', '养护要点3', '水养：风信子水养要求水位离球茎的底盘要有1-2cm的空间，让根系可以透气呼吸，严禁将水加满没过球茎底部。', '1', null, null);
INSERT INTO `product_breeding` VALUES ('4', '养护要点4', '湿度：土壤湿度应保持在60-70%之间，空气湿度应保持在80%左右，并可通过喷雾、地面洒水增加湿度，也可用通风换气等办法，降低湿度。', '1', null, null);
INSERT INTO `product_breeding` VALUES ('5', '养护要点1', '茉莉盆栽，要求培养土富含有机质，而且具有良好的透水和通气性能，一般可用田园土4份、堆肥4份、河沙或谷糠灰2份，外加充分腐熟的干枯饼末、鸡鸭粪等适量，并筛出粉末和粗粒，以粗粒垫底盖面。', '2', null, null);
INSERT INTO `product_breeding` VALUES ('6', '养护要点2', '时间以每年4-5月份新梢末萌发前最为适宜。按苗株大小选用合适的花盆。上盆时一手扶苗，一手铲填培养土，待土盖满全部根系后，将植株稍向上轻提，并把盆振动几下，使土与根系紧密接触。然后用手把盆土压实，让土面距盆沿有2厘米的距离，留作浇水。', '2', null, null);
INSERT INTO `product_breeding` VALUES ('7', '养护要点3', '栽好后，浇定根水，然后放在稍加遮荫的地方7-10天，避免阳光直射，以后逐渐见光。日常管理的关键是水，要根据茉莉喜湿润，不耐旱，怕积水，喜透气的特性，掌握浇水时间和浇水量。', '2', null, null);
INSERT INTO `product_breeding` VALUES ('8', '养护要点4', '施肥方法：从6月至9月开花期勤施含磷较多的液肥，最好每2-3天施一次，肥料可用腐熟好的豆饼和鱼腥水肥液，或者用硫酸铵、过磷酸钙，一般化肥成分兑多了会烧死茉莉植株。也可用0.1%的磷酸二氢钾水溶液，在傍晚向叶面喷洒，也可促其多开花。', '2', null, null);
INSERT INTO `product_breeding` VALUES ('9', '养护要点1', '培植方法:水培法即用浅盆水浸法培养。将经催芽处理后的水仙直立放入水仙浅盆中，加水淹没鳞茎三分之一的为宜。盆中可用石英砂、鹅卵石等将鳞茎固定。土培法家庭较少采用，即利用大多数润土花卉的培养法来栽培水仙。', '3', null, null);
INSERT INTO `product_breeding` VALUES ('10', '养护要点2', '控制花期:水仙的花期，早于桃李而晚于梅。一般秋冬开始水养，冬春即可开花。通过人为控制水仙花期，可以达到这一目的。', '3', null, null);
INSERT INTO `product_breeding` VALUES ('11', '养护要点3', '防止徒长:欲想培育叶子短、花梗长的水仙花，关键在于促进花梗生长，避免叶子徒长。', '3', null, null);
INSERT INTO `product_breeding` VALUES ('12', '养护要点4', '花后处理:一般来说，春节过后，水仙花就凋谢了。通常人们都会把开过花的水仙球扔掉，这其实很可惜。水仙是一种多年生植物，它是靠鳞茎来繁殖的，如果将那些已开过花的鳞茎再埋到土里，它就可以继续生长繁殖。', '3', null, null);
INSERT INTO `product_breeding` VALUES ('13', '养护要点1', '前期管理：冬季选晴天进行中耕，晒表土，保墒保温。春季出苗前松土锄草，提高地温，促苗早发；盖草保墒。夏季应防高温引起的腐烂；天凉又要保温，防霜冻，并施提苗肥，促进百合的生长', '4', null, null);
INSERT INTO `product_breeding` VALUES ('14', '养护要点2', '中、后期管理：一是清沟排水。百合最怕水涝，应经常清沟排水，做到雨停土壤渍水干。\r\n二是适时打顶，春季百合发芽时应保留其一壮芽，其余除去，以免引起鳞茎分裂。三是打顶后控制施氮肥。以促进幼鳞茎迅速肥大。', '4', null, null);
INSERT INTO `product_breeding` VALUES ('15', '养护要点3', '追肥：第1次是稳施腊肥，第2次是重施壮苗肥，第3次是适施壮片肥', '4', null, null);
INSERT INTO `product_breeding` VALUES ('16', '养护要点1', '光照：通常以接受四小时的散射光，绿萝的生长发育最好。', '5', null, null);
INSERT INTO `product_breeding` VALUES ('17', '养护要点2', '温度:室温10℃以上，绿萝可以安全过冬，室温在20℃以上，绿萝可以正常生长', '5', null, null);
INSERT INTO `product_breeding` VALUES ('18', '养护要点3', '湿度:指的是植物生长环境中空气的含水量。用调到雾状刻度的喷雾器向植物的叶片、茎部和气根处喷水，每天若干次', '5', null, null);
INSERT INTO `product_breeding` VALUES ('19', '养护要点4', '土壤：绿萝喜欢湿润，生长季节浇水以经常保持盆土湿润为宜，切忌盆土干燥，否则易引起叶黄和株形不佳。', '5', null, null);
INSERT INTO `product_breeding` VALUES ('20', '养护要点5', '施肥：秋冬季节，植物多生长缓慢甚至停止生长，因此应减少施肥。入冬前，以浇喷液态无机肥为主，时间是15天左右一次。', '5', null, null);
INSERT INTO `product_breeding` VALUES ('21', '养护要点1', '土壤：可用肥沃的沙壤土、腐殖土、泥炭土、或细沙土加少量基肥作盆栽用土。', '6', null, null);
INSERT INTO `product_breeding` VALUES ('22', '养护要点2', '光照：吊兰喜半阴环境，春、秋季应避开强烈阳光直晒，夏季只能早晚见些斜射光照，白天需要遮去阳光的50%-70%。', '6', null, null);
INSERT INTO `product_breeding` VALUES ('23', '养护要点3', '水分：夏季浇水要充足，中午前后及傍晚还应往枝叶上喷水，及时清洗叶片上的灰尘，以防叶干枯。但是，吊兰的肉质根能贮存大量水分，故有较强的抗旱能力，数日不浇水也不会干死。冬季5℃以下时，少浇水，盆土不要过湿，否则叶片会容易发黄。', '6', null, null);
INSERT INTO `product_breeding` VALUES ('24', '养护要点4', '施肥：吊兰是较耐肥的观叶植物，若肥水不足，容易焦头衰老，叶片发黄，失去观赏价值。', '6', null, null);
INSERT INTO `product_breeding` VALUES ('25', '养护要点5', '修剪：平时随时剪去黄叶。每年3月可翻盆一次，剪去老根、腐根及多余须根。5月上、中旬将吊兰老叶剪去一些，会促使萌发更多的新叶和小吊兰。吊兰的根系相当发达，养殖一段时间后应及时更换花盆，以免根系堆积，造成吊兰黄叶，枯萎等现象。', '6', null, null);
INSERT INTO `product_breeding` VALUES ('26', '养护要点1', '基质：可使用纯水苔，也可使用两份水苔/泥炭混合一份珍珠岩，也已再加入一份赤玉土、树皮、蛭石等基质', '7', null, null);
INSERT INTO `product_breeding` VALUES ('27', '养护要点2', '光照：绝大部分的茅膏菜都比较喜阳、耐暴晒，应尽量每天提供4小时以上的直射光。', '7', null, null);
INSERT INTO `product_breeding` VALUES ('28', '养护要点3', '湿度：湿度要控制在40%-90%，冬季一般室内的湿度都能满足要求。夏季不能连续几天高于90%，否则可能造成茎叶腐烂。', '7', null, null);
INSERT INTO `product_breeding` VALUES ('29', '养护要点4', '浇水：将花盆置于有水的水盘中，使水自行渗透至整个花盆，保持水盘中有1厘米左右的水，使基质保持潮湿。茅膏菜对水质的要求偏高，浇水时要用钙、镁等矿物质含量低的软水。', '7', null, null);
INSERT INTO `product_breeding` VALUES ('30', '养护要点5', '温度：迷你茅膏菜，存活温度多在0-37度之间，最佳温度5-30度之间；北领地茅膏菜的生存温度在12-42度之间，最佳温度25-35度之间。是一类喜热怕冷的食虫植物。', '7', null, null);
INSERT INTO `product_breeding` VALUES ('31', '养护要点1', '温度：仙人球性喜高温、干燥环境，冬季室温白天要保持在20℃以上，夜间温度不低于5℃。', '8', null, null);
INSERT INTO `product_breeding` VALUES ('32', '养护要点2', '光照：仙人球要求阳光充足，但在夏季不能强光暴晒，需要适当遮阴。室内栽培，可用灯光照射，使之健壮生长。', '8', null, null);
INSERT INTO `product_breeding` VALUES ('33', '养护要点3', '盆土：盆栽仙人球用土要求排水、透气性良好、含石灰质的沙土(或沙壤土）。', '8', null, null);
INSERT INTO `product_breeding` VALUES ('34', '养护要点4', '栽植：栽植上盆最好在早春进行，花盆不宜过大，以能容纳球体且略有缝隙为宜。', '8', null, null);
INSERT INTO `product_breeding` VALUES ('35', '养护要点1', '盆土:宜选用肥沃的砂质土壤，先小盆后大盆，经2-3次换盆，7月可定盆；定盆可选用6份腐叶土、3份砂土和1份饼肥渣配制成混合土壤。浇透水后放阴凉处，待植株生长正常后移至向阳处。', '9', null, null);
INSERT INTO `product_breeding` VALUES ('36', '养护要点2', '浇水:春季菊苗幼小，浇水宜少；夏季菊苗长大，天气炎热，蒸发量大，浇水要充足，可在清晨浇一次，傍晚再补浇一次，并要用喷水壶向菊花枝叶及周围地面喷水，以增加环境湿度；立秋前要适当控水、控肥，以防止植株窜高疯长。', '9', null, null);
INSERT INTO `product_breeding` VALUES ('37', '养护要点3', '施肥:在菊花植株定植时，盆中要施足底肥。以后可隔10天施一次氮肥。立秋后自菊花孕蕾到现蕾时，可每周施一次稍浓一些的肥水；含苞待放时，再施一次浓肥水后，即暂停施肥。', '9', null, null);
INSERT INTO `product_breeding` VALUES ('38', '养护要点4', '摘心与疏蕾:当菊花植株长至10多厘米高时，即开始摘心。摘心时只留植株基部4-5片叶，上部叶片全部摘除。待长出5—6片新叶时，再将心摘去，使植株保留4-7个主枝，以后长出的枝、芽要及时摘除。', '9', null, null);
INSERT INTO `product_breeding` VALUES ('39', '养护要点1', '水分:平时保持土壤湿度，见干见湿，切勿盆土积水。', '10', null, null);
INSERT INTO `product_breeding` VALUES ('40', '养护要点2', '温度:冷水花比较耐寒，冬季室温不低于6℃不会受冻，14℃以上开始生长。', '10', null, null);
INSERT INTO `product_breeding` VALUES ('41', '养护要点3', '施肥:生长期两周左右浇一次二八成或三七成氮素液肥促使植株健壮。秋后增施磷、钾肥壮茎秆、防倒伏。', '10', null, null);
INSERT INTO `product_breeding` VALUES ('42', '养护要点4', '土壤:喜疏松、排水良好的土壤，可用壤土、河砂、腐叶土混合配制。', '10', null, null);
INSERT INTO `product_breeding` VALUES ('43', '养护要点1', '土壤：君子兰适宜用含腐殖质丰富的土壤，这种土壤透气性好、渗水性好，且土质肥沃，具微酸性（pH6.5）。', '11', null, null);
INSERT INTO `product_breeding` VALUES ('44', '养护要点2', '浇水：君子兰具有较发达的肉质根，根内存蓄着一定的水分，所以这种花比较耐旱。不过，耐旱的花也不可严重缺水，尤其在夏季高温加上空气干燥的情况下不可忘记及时浇水。', '11', null, null);
INSERT INTO `product_breeding` VALUES ('45', '养护要点3', '施肥：花卉中有不少是喜肥的，但对喜肥花卉施肥也要有一个限度，过多施肥，不利生长，甚至会成植株烂根或焦枯。', '11', null, null);
INSERT INTO `product_breeding` VALUES ('46', '养护要点4', '避暑：盛夏时节，气温常在30℃以上，这对君子兰生长极为不利。为此，一般常用搭棚降温。还可将君子兰连盆一起埋进沙子里（将盆埋没），然后在沙子上每日早晚各洒水一次。', '11', null, null);
INSERT INTO `product_breeding` VALUES ('47', '养护要点1', '温度：蝴蝶兰大、中、小白天温度要求基本相同，以不超过30℃为宜，夜间中小苗要求23℃，大苗要求20℃。促花时白天要求20~24℃，夜间17~20℃，第一朵花后白天25~28℃，夜温20~22℃。温度低时用加温机加热，温度高时可用风机-水帘降温。', '12', null, null);
INSERT INTO `product_breeding` VALUES ('48', '养护要点2', '湿度：营养生长阶段湿度要求90%以上最佳，促花处理阶段湿度要求70～80%，开花后湿度要求50%即可。用水帘通风及地面空间喷湿等措施可调控湿度。', '12', null, null);
INSERT INTO `product_breeding` VALUES ('49', '养护要点3', '灌溉：蝴蝶兰的气根具有很强的吸收能力，能吸收氧气、养分、水分等，水分过多会造成窒息死根，因此蝴蝶兰浇水应在见干时用细水灌淋，操作时尽量不让水滞留在叶片凹处或生长点上，以防引起霉变或感染，灌到软盆底孔有水溢出即可。', '12', null, null);
INSERT INTO `product_breeding` VALUES ('50', '养护要点1', '土壤：要求土壤疏松、排水和通气性好，不可用粘\r\n白鹤芋\r\n白鹤芋(3张)\r\n 重土壤，一般可用腐叶土、泥炭土拌和少量珍珠岩配制成基质，种植时加少量有机肥作基肥。', '13', null, null);
INSERT INTO `product_breeding` VALUES ('51', '养护要点2', '光照：光照对植物生长来说是非常重要的，白鹤芋在冬季和早春的时候都需要较好的光照，但是光照渐强时要逐渐遮阳，如果在荫蔽处欣赏的，不可以直接放在阳光下曝晒，这样对白鹤芋的生长很不好。', '13', null, null);
INSERT INTO `product_breeding` VALUES ('52', '养护要点3', '温度：白鹤芋是喜高温种类，应该在高温温室栽培。冬季夜间最低温度应在14-16℃，白天应在25℃左右。', '13', null, null);
INSERT INTO `product_breeding` VALUES ('53', '养护要点4', '浇水：白鹤芋在生长期间应经常保持盆土湿润，但是不能过多的浇水，浇水过多盆土会长期潮湿，容易引起烂根和植株枯黄。', '13', null, null);
INSERT INTO `product_breeding` VALUES ('54', '养护要点1', '土壤：宜于在酸性或徽酸性的沙壤土中生长。盆景中的观音竹一般不需要施肥，任其营养不良，以保持其矮生伏态。', '14', null, null);
INSERT INTO `product_breeding` VALUES ('55', '养护要点2', '繁殖：将分切好的种苗直立栽人口径约10厘米，高度约7厘米的小瓦盆中，素土填实。', '14', null, null);
INSERT INTO `product_breeding` VALUES ('56', '养护要点1', '土壤：芦荟以透水透气性能好，有机质含量高，pH值在 6.5 — 7.2 。', '15', null, null);
INSERT INTO `product_breeding` VALUES ('57', '养护要点2', '光照：喜光，耐半阴，忌阳光直射和过度荫蔽。', '15', null, null);
INSERT INTO `product_breeding` VALUES ('58', '养护要点3', '温度：适宜生长环境温度为 20 — 30 ℃，夜间最佳温度为 14 — 17 ℃。低于 10 ℃基本停止生长，低于 0 ℃芦荟叶肉受冻全部萎蔫死亡。', '15', null, null);
INSERT INTO `product_breeding` VALUES ('59', '养护要点4', '水分：芦荟有较强的抗旱能力，离土的芦荟能干放数月不死。芦荟生长期需要充足的水分，但不耐涝。', '15', null, null);
INSERT INTO `product_breeding` VALUES ('60', '养护要点1', '光照与温度：生长适宜温度18-20℃，温度超过35℃时叶片发黄，生长停止。在室内宜摆放在光线明亮的地。', '16', null, null);
INSERT INTO `product_breeding` VALUES ('61', '养护要点2', '浇水与施肥：常春藤要求温暖多湿的环境，在生长期要保证供水，经常保持盆土湿润，防止完全干燥，若水分不足，会引起落叶。生长期每月要施2-3次稀薄的有机液肥。对生长已成形的盆株，可减少施肥。冬季则停止施肥。', '16', null, null);
INSERT INTO `product_breeding` VALUES ('62', '养护要点3', '整形修剪;新栽的植株，待春季萌芽后应进行摘心，促进分枝，并立架牵引造型，也可以吊挂盆栽。对生长多年的植株，要加强修剪，疏除过密的细弱枝、枯死枝，防止枝蔓过多，引起造型紊乱。', '16', null, null);
INSERT INTO `product_breeding` VALUES ('63', '养护要点1', '光照：沼泽生植物，原生环境没有高大植物遮荫，喜阳光。家庭栽培时，春、 秋、冬三季可全日照，南方夏季应加50%遮荫或置于室内向阳窗台上即可。或用植物补光灯（红蓝比2:1）在距植物15-30cm的上方进行人工光照栽培，照射时间为4小时/天。', '17', null, null);
INSERT INTO `product_breeding` VALUES ('64', '养护要点2', '水分：尽量使用纯净水、雨水等软水（中国南方地区可以使用自来水）。将捕蝇草的盆放置于托盘或玻璃缸内，注水至1-2cm深，并定期补水。（注意：夏天腰水容易烂根）', '17', null, null);
INSERT INTO `product_breeding` VALUES ('65', '养护要点3', '湿度：大于50%，捕蝇草的原生环境算是沼泽型的草原，湿度相对较高，若能以大水盘来做腰水，附近的湿度会高一点，您也可以在盆子的表土上加层水苔，也是有助于空气湿度的保持。', '17', null, null);
INSERT INTO `product_breeding` VALUES ('66', '养护要点4', '基质：基质保持在ph3.5-5的酸性。无添加肥料的泥炭与珍珠岩2：1或纯水苔，基质尽量每年春天更换一次。', '17', null, null);
INSERT INTO `product_breeding` VALUES ('67', '养护要点5', '温度：生长温度15℃～35℃，适宜温度：21～35℃，冬季如想让其休眠，则须控制在5℃左右（0～8℃）。但根据多年的养护经验，不经过休眠对来年的正常生长并没有明显的影响。', '17', null, null);
INSERT INTO `product_breeding` VALUES ('68', '养护要点6', '喂食：请不要强迫他们吃过多的东西，它们会自己捕食。最多只能在2片叶子上投喂节肢类动物（昆虫、蜘蛛等）。它们的消化液很难消化牛肉、鸡肉等人们日常食用的肉类中的脂肪。', '17', null, null);
INSERT INTO `product_breeding` VALUES ('69', '养护要点1', '土壤：土壤以疏松、肥沃和透气的腐叶土或泥炭土为好。盆栽上常用泥炭土、水苔、木炭和冷杉树皮屑的混合基质。', '18', null, null);
INSERT INTO `product_breeding` VALUES ('70', '养护要点2', '浇水：猪笼草对水分的反应比较敏感。猪笼草在高湿条件下才能正常生长发育，生长期需经常喷水，每天需4～5次。如果温度变化大，过于干燥，都会影响叶笼的形成。', '18', null, null);
INSERT INTO `product_breeding` VALUES ('71', '养护要点3', '光照：猪笼草为附生性植物，常生长在大树林下或岩石的北边，自然条件属半阴。夏季强光直射下，必须遮荫，否则叶片易灼伤，直接影响叶笼的发育。但长期在阴暗的条件下，叶笼形成慢而小，笼面彩色暗淡。', '18', null, null);
INSERT INTO `product_breeding` VALUES ('72', '养护要点4', '温度：猪笼草的生长适温为25～30℃，3～9月为21～30℃，9月至翌年3月为18～24℃。冬季温度不低于16℃，15℃以下植株停止生长，10℃以下温度，叶片边缘遭受冻害。', '18', null, null);
INSERT INTO `product_breeding` VALUES ('73', '养护要点1', '温度：凤尾竹为常绿丛生灌木。喜温暖湿润和半阴环境。耐寒性稍差，不耐强光曝晒，怕渍水，宜肥沃、疏松和排水良好的壤土．冬季温度不低于0度。', '19', null, null);
INSERT INTO `product_breeding` VALUES ('74', '养护要点2', '光照：凤尾竹喜光，稍耐阴，喜温暖湿润的气候。喜欢潮湿和温暖，还喜欢半通风和半阴。冬天应该搬到室内有阳光的地方。', '19', null, null);
INSERT INTO `product_breeding` VALUES ('75', '养护要点3', '土壤：凤尾竹喜酸性、微酸性或中性土壤，以pH4.5至7.0为宜，忌粘重、碱性土壤。北方土壤碱性强，可加入0.2%的硫酸亚铁。土壤最好为疏松肥沃、排水良好的沙质壤土，可用农田土拌红黄壤、腐殖土与细沙。', '19', null, null);
INSERT INTO `product_breeding` VALUES ('76', '养护要点4', '水分：凤尾竹喜湿怕积水，装盆后第一次水要浇透，以后保持盆土湿润，不可浇水过多，否则易烂鞭烂根。从装盆至成活阶段还要经常向叶片喷水。', '19', null, null);
INSERT INTO `product_breeding` VALUES ('77', '养护要点5', '肥料：凤尾竹肥料以有机肥为主，经腐熟后的畜粪、垃圾肥及河泥等均可。有机肥主要作为基肥，拌入盆土中混合使用，用量一般为盆土量的10%至15%。凤尾竹生长期每月施入1-2次稀薄的氮肥即可。', '19', null, null);
INSERT INTO `product_breeding` VALUES ('78', '养护要点1', '土壤：室内盆栽散尾葵应选择偏酸性土壤，北方应注意选用腐殖质含量高的沙质壤土。可用腐叶土、泥炭土加1/3河沙及部分基肥配制成培养土。', '20', null, null);
INSERT INTO `product_breeding` VALUES ('79', '养护要点2', '浇水：浇水应根据季节遵循干透湿透的原则，干燥炎热的季节适当多浇，低温阴雨则控制浇水。北方地区特别是水内含盐、碱较多的地方，应注意经常用黑矾调节土壤酸度。平时保持盆土经常湿润。夏秋高温期，还要经常保持植株周围有较高的空气湿度，但切忌盆土积水，以免引起烂根。', '20', null, null);
INSERT INTO `product_breeding` VALUES ('80', '养护要点3', '施肥：一般每1-2周施一次腐熟液肥或复合肥，以促进植株旺盛生长，叶色浓绿，夏季适当追施含氮有机肥，冬季可施芝麻酱渣等有机花肥同时保持盆土干湿状态。', '20', null, null);
INSERT INTO `product_breeding` VALUES ('81', '养护要点4', '光照：散尾葵喜温暖，最适生长温度为20-35℃。', '20', null, null);
INSERT INTO `product_breeding` VALUES ('82', '养护要点5', '移栽：小苗装盆时，先在盆底放入2-3厘米厚的粗粒基质作为滤水层，其上撒上一层充分腐熟的有机肥料作为基肥，厚度约为1-2厘米，再盖上一薄层基质，厚约1-2厘米，然后放入植株，以把肥料与根系分开，避免烧根。', '20', null, null);
INSERT INTO `product_breeding` VALUES ('83', '养护要点1', '繁殖：含羞草为直根性植物，须根很少，适宜播种繁殖，而且最好采取直播的方法，以免移栽伤根；若必须移栽者，应在幼苗期移栽，否则不易成活，作为一年生栽培的含羞草，一般于早春在室内播种。', '21', null, null);
INSERT INTO `product_breeding` VALUES ('84', '养护要点2', '温度：生长适温为20°C左右，冬季应移到室内窗台上，室内温度在10℃左右即可安全过冬。', '21', null, null);
INSERT INTO `product_breeding` VALUES ('85', '养护要点3', '湿度：在阳光充足的条件下，根系生长很快，需要每天浇水。夏季炎热干旱时应该早、晚各浇一次水，缺水则叶片会下垂以至发黄，受触动也不再闭合。', '21', null, null);
INSERT INTO `product_breeding` VALUES ('86', '养护要点4', '土壤：含羞草喜温暖湿润、阳光充足的环境，适生于排水良好，富含有机质的砂质壤土，要求土壤深厚、肥沃、湿润。苗期每半月施追肥1次。如不想让株形过大，则要减少施肥量。', '21', null, null);
INSERT INTO `product_breeding` VALUES ('87', '养护要点1', '光照：文竹养殖不能拿到烈日下暴晒，炎热季节，应放置于阴凉通风之处。同时，文竹开花期既怕风，又怕雨，要注意通风的良好，好天气时可适当置于室外接受阳光照射。', '22', null, null);
INSERT INTO `product_breeding` VALUES ('88', '养护要点2', '温度：生长适温为15-25°C, 高温32°C使会停止生长，叶片发黄。冬季应入室养护，室温保持10°C以上, 5°C以下容易出现冻害,我国南方可以室外越冬。', '22', null, null);
INSERT INTO `product_breeding` VALUES ('89', '养护要点3', '湿度：文竹喜湿润怕泡根养文竹不宜频繁浇“涝汤水”，而宜经常给叶面喷水。一般夏季配合适宜浇水，天叶面喷1 ~ 2次水;冬季在保持土壤湿润的情况下，每3 ~ 4天叶面喷一次水即可。', '22', null, null);
INSERT INTO `product_breeding` VALUES ('90', '养护要点4', '土壤：栽培文竹的盆土，宜用肥沃的沙壤土，要求温暖湿润、富含腐枝、排水须好.文竹喜肥尤喜腐熟的有机肥，科学的施肥方法是春秋两季每周施一 次薄肥， 冬季15~ 20天施一次薄肥。', '22', null, null);
INSERT INTO `product_breeding` VALUES ('91', '养护要点5', '及时整形：文竹易于丛生，一是要结合换盆添土时修剪老残须根，疏理多余的茎叶,避免养分过度消耗，起到养根护叶的作用;二是剪除局部发黄叶片;三是对茎叶同时枯黄的要一起剪除。', '22', null, null);
INSERT INTO `product_breeding` VALUES ('92', '养护要点1', '土壤：在重壤土中，建议加入诸如泥炭、蛭石或粗沙，与25cm左右深的土壤进行混合，以对土壤进行改良。', '23', null, null);
INSERT INTO `product_breeding` VALUES ('93', '养护要点2', '温度：种植后，土壤温度是最重要的因素，最低温为5~8℃，最高温为20℃。土温的高低直接影响到出苗率。土温过低会造成开花能力降低，故最适土温控制在16~18℃之间。', '23', null, null);
INSERT INTO `product_breeding` VALUES ('94', '养护要点1', '土壤要求：蜀葵喜凉爽气候，忌炎热与霜冻，喜光，略耐阴；宜土层深厚、肥沃、排水良好的土壤。', '24', null, null);
INSERT INTO `product_breeding` VALUES ('95', '养护要点2', '光照：要放置在半阴的环境下进行养护为宜。', '24', null, null);
INSERT INTO `product_breeding` VALUES ('96', '养护要点3', '分株：分株繁殖可在8至9月份进行，将老株挖起，分割带须根的茎芽进行更新栽植，栽后马上浇透水，翌年可开花。', '24', null, null);
INSERT INTO `product_breeding` VALUES ('97', '养护要点4', '湿度：水分需求不能过大，造成水涝，否则会烂根。', '24', null, null);
INSERT INTO `product_breeding` VALUES ('98', '养护要点1', '土壤：要求营养充足，再者粘性的土比较适合它，如果选择沙土，反而会不利于它的长势。', '25', null, null);
INSERT INTO `product_breeding` VALUES ('99', '养护要点2', '温度：最适合晚香玉的温度是二十至三十度。在冬天需防寒，放在室内或者温室中，温度在八至十二度比较好。如果低于五度，它就会受到冻害，如果再低，那么甚至可能被冻死。', '25', null, null);
INSERT INTO `product_breeding` VALUES ('100', '养护要点3', '光照：在它的成长速度比较快的时候，需提供良好的光线，将其放在有充分散射光的地方。冬天一般在室内，光线同样不能太暗，否则也会影响它过冬，以及第二年的长势。', '25', null, null);
INSERT INTO `product_breeding` VALUES ('101', '养护要点4', '浇水：晚香玉对水分的需求量较多，在成长期保证水分充足十分重要，不然它的叶子可能会干枯。到了夏天，基本每天都需浇水一次，才能满足需求。但需注意不能积水。', '25', null, null);
INSERT INTO `product_breeding` VALUES ('102', '养护要点1', '土壤：要求排水良好、腐殖质丰富，保肥性能良好而微呈碱性之粘质土壤，可用园土6份、堆肥2份、沙土2份混合配制的培养土。', '26', null, null);
INSERT INTO `product_breeding` VALUES ('103', '养护要点2', '浇水：石竹生长强健，较耐干旱。多雨过湿地区，土壤易板结，根系因通风不良而发育不正常，所以雨季要注意松土排水。除生长开花旺季要及时浇水外。平时可以少浇水，以维持土壤湿润为宜。', '26', null, null);
INSERT INTO `product_breeding` VALUES ('104', '养护要点3', '温度：石竹生长适宜温度15 - 20℃。冬季应放温室，温度保持在12℃以上。空气湿润度以保持在75%左右为宜，花前适当喷水调湿，可防止花苞提前开裂。', '26', null, null);
INSERT INTO `product_breeding` VALUES ('105', '养护要点4', '光照：每天保证光照6-8小时。盛夏时，石竹花正处于半休眠状态，这时应注意避免烈日曝晒。盆土忌积水，否则易烂根。', '26', null, null);
INSERT INTO `product_breeding` VALUES ('106', '养护要点1', '光照：盆栽虎尾兰对光线的要求不高，只要有相对充足光线即可。', '27', null, null);
INSERT INTO `product_breeding` VALUES ('107', '养护要点2', '土壤：虎尾兰适应性强，对土壤要求不严，管理可较为粗放，喜疏松的沙土和腐殖土，耐干旱和瘠薄。盆栽可用肥沃园土3份，煤渣1份，再加入少量豆饼屑或禽粪做基肥。生长很健壮，即使布满了盆也不抑制其生长。一般两年换一次盆，春季进行。', '27', null, null);
INSERT INTO `product_breeding` VALUES ('108', '养护要点3', '温度：虎尾兰适应性强，生长适温为20一30℃，越冬温度为10℃。冬季温度也不能长时间低于10℃，否则植株基部会发生腐烂，造成整株死亡。', '27', null, null);
INSERT INTO `product_breeding` VALUES ('109', '养护要点4', '水分：浇水要适量，掌握宁干勿湿的原则。平时用清水擦洗叶面灰尘，保持叶片清洁光亮。', '27', null, null);
INSERT INTO `product_breeding` VALUES ('110', '养护要点5', '施肥：虎尾兰对肥料要求不高，长期只施氮肥，叶片上的斑纹就会变暗淡，故一般使用复合肥。施肥不应过量。生长盛期，每月可施1-2次肥，施肥量要少。', '27', null, null);
INSERT INTO `product_breeding` VALUES ('111', '养护要点1', '光照：瓜栗树主要靠绿色的光杆进行光合作用，长芽前一般要求较强的光照，故冬、春两季养护半成品发财树一般不遮荫。夏、秋两季由于阳光强烈，不遮荫容易造成大棚内的温度过高和光杆向阳的一面局部失水而死辫，故一般用1层50%遮荫网。', '28', null, null);
INSERT INTO `product_breeding` VALUES ('112', '养护要点2', '温湿度：瓜栗树喜高温中湿环境，第1次浇水后应将大棚薄膜全部封闭，以增加湿度，提高温度。长芽前，温度应保持在25-38℃左右，湿度为 50%-75%左右为宜，并且每天适当通风换气。烈日夏天和干燥的秋天，中午应经常给地面喷洒水，以增湿降温，尽量控制其温、湿度。', '28', null, null);
INSERT INTO `product_breeding` VALUES ('113', '养护要点3', '施肥：上盆长芽后每周喷施1次三要素液肥，如氮∶磷∶钾为20∶20∶20的复合肥 500-600倍液，另每月可向土壤追施1次有机肥或磷钾肥。生长旺季忌偏施氮肥，以免徒长。应均衡施用磷、钾肥，以促使植株健壮，使叶色翠绿，增强观赏效果。', '28', null, null);
INSERT INTO `product_breeding` VALUES ('114', '养护要点1', '光照：长春花为阳性植物，生长、开花均要求阳光充足，光照充足还有利于防止植株徒长。冬季阳光不足，气温降低，不利于生长。', '29', null, null);
INSERT INTO `product_breeding` VALUES ('115', '养护要点2', '温度：长春花对低温比较敏感，所以温度的控制很重要。在长江流域冬季一定要采用保护地栽培，低于15℃以后停止生长，低于5℃会受冻害。', '29', null, null);
INSERT INTO `product_breeding` VALUES ('116', '养护要点3', '水肥管理：长春花雨淋后植株易腐烂，降雨多的地方需大棚种植，介质需排水良好对于完全用人工栽培的，则施肥宜采用20-10-20和14-0-14的水溶性肥料，以200~250ppm的浓度7~10天交替施用一次。', '29', null, null);
INSERT INTO `product_breeding` VALUES ('117', '养护要点1', '浇水：平时要保持盆土湿润，但决不宜过湿。因其根部多位肉质，\r\n含笑花\r\n含笑花 [4]\r\n如浇水太多或雨后盆涝会照成烂根，故阴雨季节要注意控制湿度。', '30', null, null);
INSERT INTO `product_breeding` VALUES ('118', '养护要点2', '施肥：含笑花喜肥，多用腐熟饼肥、骨粉、鸡鸭粪和鱼肚肠等沤肥掺水施用，在生长季节（4~9月）每隔15天左右施一次肥，开花期和10月份以后停止施肥。', '30', null, null);
INSERT INTO `product_breeding` VALUES ('119', '养护要点3', '修剪：含笑花不宜过度修剪，平时可在花后将影响树形的徒长枝、病弱枝和过密重叠枝进行修剪，并减去花后果实，减少养分消耗。春季萌芽前，适当疏去一些老叶，以触发新枝叶。', '30', null, null);
INSERT INTO `product_breeding` VALUES ('120', '养护要点4', '翻盆：每1~2年翻盆一次，宜在每年春季新叶放出前，或在开花后进行，在秋季进行亦可。结合换盆去除适当部分结板旧土，换以肥沃疏松的培养土，减去枯枝或过长老根，在盆地放入足量基肥料。\r\n含笑花\r\n置足量基肥。', '30', null, null);
INSERT INTO `product_breeding` VALUES ('121', '养护要点1', '土壤：喜欢在偏酸性土壤的环境下进行生长，因此在选购栀子花的土壤的时候，注意选择偏酸性的土壤进行养殖，同时注意土壤pH值控制在4.0-6.5之间为宜', '31', null, null);
INSERT INTO `product_breeding` VALUES ('122', '养护要点2', '温度湿度：最佳的生长温度为16℃-18℃最好，但是要注意的是温度的过高或者过低都不利于栀子花的生长需求。生长期间要注意适量的增加浇水量，同时也要注意给栀子花的叶面喷洒一些水。', '31', null, null);
INSERT INTO `product_breeding` VALUES ('123', '养护要点3', '光照：栀子花在生长期间，同时也要注意适量的光照的需求，栀子花是喜爱光照的植物，因此建议在春秋期间，多加注意增加光照时间，而到了夏冬季节，建议放入同分有光照的室内养殖，避免生长期间，温度过高或者过低。', '31', null, null);
INSERT INTO `product_breeding` VALUES ('124', '养护要点1', '浇水：浇水以宁湿勿干为原则，盆土经常保持湿润即可。夏秋季空气干燥时，要经常向植株喷水，以提高环境的空气湿度，这样有利其生长。', '32', null, null);
INSERT INTO `product_breeding` VALUES ('125', '养护要点2', '施肥：袖珍椰对肥料要求不高，一般生长季每月施1-2次液肥，秋末及冬季稍施肥或不施肥。每隔2-3年于春季换盆一次。', '32', null, null);
INSERT INTO `product_breeding` VALUES ('126', '养护要点3', '温度：生长适温为15-30℃，其中5-9月份为19-30℃，10月至翌年4月为13-16℃，在夏季能耐35℃的高温，温度超过35℃以上时，应适当遮荫或采取喷水、通风等措施，冬季应维持不低于5℃的环境温度，否则长期5℃以下的温度时，易受冻落叶。', '32', null, null);
INSERT INTO `product_breeding` VALUES ('127', '养护要点4', '光照：袖珍椰对光照适宜范围大，但以日照50-60%之半阴处为佳。', '32', null, null);
INSERT INTO `product_breeding` VALUES ('128', '养护要点1', '光照和遮光：铁线蕨忌直射而高热的强光，喜散射光。因此，宜生活在荫蔽的环境中，否则，叶片易焦枯。', '33', null, null);
INSERT INTO `product_breeding` VALUES ('129', '养护要点2', '温度和浇水：铁线蕨喜湿润环境，整个生长期需要较高的空气湿度和土壤湿度。幼苗期更需较高的湿度，要求空气相对湿度为70%-80%，在盆底垫1个浅水盆对其生长有利。', '33', null, null);
INSERT INTO `product_breeding` VALUES ('130', '养护要点3', '土壤与施肥：铁线蕨栽植的土壤以疏松、肥沃、透水为佳。因为铁线蕨喜钙质，经常施用钙质肥料或在盆中加入豆饼渣、骨粉、碎蛋壳，对其生长有利。', '33', null, null);
INSERT INTO `product_breeding` VALUES ('131', '养护要点1', '土壤：芍药对土壤有较高要求，肥沃、疏松、且呈酸性。可主要选用砂质土，并混入其他物质，比如基肥等。为了保证透气性和排水性，在花盆的底部可垫上一些小石子。', '34', null, null);
INSERT INTO `product_breeding` VALUES ('132', '养护要点2', '光照：芍药比较喜光，光线对它的长势有帮助，在花期还能促进它开花。一般来说，每天得保证不小于六个小时的光照才行，但要避免直射光。', '34', null, null);
INSERT INTO `product_breeding` VALUES ('133', '养护要点3', '浇水：芍药相对比较耐旱，不过成长期土壤也需保持稍微湿润。可根据季节调控。一般春天可半月浇一次。夏天很热，可每个星期一次。如果秋天下雨比较多，可每月一次。冬天一般不必浇。', '34', null, null);
INSERT INTO `product_breeding` VALUES ('134', '养护要点4', '温度：最适合芍药的温度是十八至二十六度之间。冬天需为它御寒，别低于五度。夏天的温度别超过四十度就行了，一般可以满足。', '34', null, null);
INSERT INTO `product_breeding` VALUES ('135', '养护要点1', '浇水施肥：球兰盆土宜经常保持湿润状态，但盆内不可积水，水分不可过量，以免引起根系腐烂。', '35', null, null);
INSERT INTO `product_breeding` VALUES ('136', '养护要点2', '光照：球兰喜散光，喜半阴环境，耐阴蔽，忌烈日直射。夏季需要移至遮阴处，防止强光直射灼伤叶片，造成叶片失绿变黄，严重时会使叶片脱落，影响观赏效果。', '35', null, null);
INSERT INTO `product_breeding` VALUES ('137', '养护要点3', '温度：球兰不耐寒，生长适温为15~28℃，在高温条件下生长良好，冬季应在冷凉和稍干燥的环境中休眠，越冬温度保持在10℃以上。若低于5℃，则易受寒害，引起落叶，甚至整株死亡。', '35', null, null);
INSERT INTO `product_breeding` VALUES ('138', '养护要点1', '浇水：合果芋是喜湿润怕干旱的植物，在夏季的时候，要对它进行充足的浇水，并且保持盆土的湿润，这样有利于它的茎干生长。在冬季的时候，对合果芋的浇水要减少，它的盆土不能太湿，否则容易造成低温环境下根烂叶枯。', '36', null, null);
INSERT INTO `product_breeding` VALUES ('139', '养护要点2', '施肥：合果芋在明亮的光照下，要对它进行每两周施加一次稀薄肥水，每月再喷洒一次0.2%溶液。在冬季的时候，合果芋就要施肥了。', '36', null, null);
INSERT INTO `product_breeding` VALUES ('140', '养护要点3', '温度：合果芋是不耐严寒的，喜欢高温高湿的环境，一般它的生长温度在20-30度，在冬天的时候，不能低于15度。', '36', null, null);
INSERT INTO `product_breeding` VALUES ('141', '养护要点4', '土壤：合果芋喜高温多湿、疏松肥沃、排水良好的微酸性土壤。在进行。盆栽的时候，它的培土以腐叶土、泥炭土和粗沙的混合制成即可种植。', '36', null, null);
INSERT INTO `product_breeding` VALUES ('142', '养护要点1', '分株：在夏秋进行，将大型的龟背竹的侧枝整段劈下，带部分气生根，直接栽植于木桶或钵内，不仅成活率高，而且成型效果快。', '37', null, null);
INSERT INTO `product_breeding` VALUES ('143', '养护要点2', '扦插：通常用扦插繁殖。扦插多在春季4月份气温回升后进行。一般可剪取带2-3个节的茎段作为插穗，剪除气生根，带叶或不带叶均可。插入沙床后，注意保持土壤湿润，在20℃的温度条件下，约经1-2个月即可生根抽芽。', '37', null, null);
INSERT INTO `product_breeding` VALUES ('144', '养护要点1', '光照：从凤梨花的原生环境中观察，大部份凤梨都喜欢半遮荫环境，忌阳光直接照射。', '38', null, null);
INSERT INTO `product_breeding` VALUES ('145', '养护要点2', '温湿度：日间要求在22-28C上下，而夜间最好维持在20-21C左右。凤梨花对相对湿度（RH）十分敏感，在强光或干燥下，湿度少于50%，叶片会向内卷曲，或无法伸展。', '38', null, null);
INSERT INTO `product_breeding` VALUES ('146', '养护要点3', '土壤：红运当头宜于疏松、肥沃、腐殖质土生长。家庭栽培，可选用草炭土2份加入细沙1份混合，配制成培养土。', '38', null, null);
INSERT INTO `product_breeding` VALUES ('147', '养护要点4', '浇水：红运当头性喜湿润环境，平日保持盆土湿润即可，阴雨天一般不浇水。浇水需要在中午之前进行，或夏季早晚进行，但一定要浇灌于叶杯中，不可只浇灌于盆土中。并在夜晚保持叶片干洁，要增湿需要在生长环境中补水增湿，如地面洒水或启动加湿器等。', '38', null, null);
INSERT INTO `product_breeding` VALUES ('148', '养护要点1', '盆栽管理：繁殖出来的小苗宜用20×20cm带底孔的瓦盆栽培，在盆底多垫瓦片,以利透水,以后每年换盆一次。盆土可用园土：腐殖土=1：1，掺合少量沙和复合肥。盆栽时应将原土球完整放入新盆内，添好培养土浇透水即可。', '39', null, null);
INSERT INTO `product_breeding` VALUES ('149', '养护要点2', '地栽管理1：庭院栽培铁线莲栽应选择地势稍高，排水良好，并有少量遮阴、无西晒的地方。挖60×60cm见方、45 cm深的定植穴，先用石块或瓦砾垫底以利排水，将挖出的土壤和腐殖土按1：1体积比混合，拌入少量复合肥后回填。', '39', null, null);
INSERT INTO `product_breeding` VALUES ('150', '养护要点3', '地栽管理2：将铁线莲小苗脱盆连同土球完整定植到穴内，浇透水，定植穴周围作15 cm高的土埂以便于干旱时浇水灌溉。以后水分管理要见干见湿，保持土壤湿润即可。', '39', null, null);
INSERT INTO `product_breeding` VALUES ('151', '养护要点4', '温度：生长的最适温度为夜间15~17℃，白天21~25℃。夏季，温度高于35℃时，会引起铁线莲叶片发黄甚至落叶，在夏季要采取降温措施。在11月份，温度持续降低，到5℃以下时，铁线莲将进入休眠期，在12月份，铁线莲完全进入休眠期，休眠期的第1、2周，铁线莲开始落叶。', '39', null, null);
INSERT INTO `product_breeding` VALUES ('152', '养护要点5', '光照：铁线莲需要每天6h以上的直接光照，这对它的生长是非常有利的，尽管在天热的时候会产生斑点。', '39', null, null);
INSERT INTO `product_breeding` VALUES ('153', '养护要点1', '盆土选择：络石可盆栽也可以地栽，盆栽络石可以根据养殖者自身的喜好来制作造型。络石对土壤的适应性强，盆土可以呈微酸性或者中性，也可以使用弱碱性的土壤，不过长势较差。一般选择园土即可，可以加入一些腐叶土。', '40', null, null);
INSERT INTO `product_breeding` VALUES ('154', '养护要点2', '光照和温度：络石喜欢温暖，半阴的生长环境，能耐寒冷和酷热，但是忌严寒，喜欢弱光，但是可以耐烈日。养殖络石，可以将其放置在向阳的地方，保证充足的光照。', '40', null, null);
INSERT INTO `product_breeding` VALUES ('155', '养护要点3', '水肥管理：络石喜欢湿润的生长环境，耐一定的干旱，但是忌水涝，要求土壤有一定的肥力。', '40', null, null);
INSERT INTO `product_breeding` VALUES ('156', '养护要点1', '光照温度：叶子花为喜光植物，生长期都要放在阳光充足的地方。冬季霜降前要搬入温室内，温度保持10-15℃，置于向阳处，最低温度不低于3℃。4月谷雨前后搬出温室，放在通风、向阳处养护。霜降前入房。', '41', null, null);
INSERT INTO `product_breeding` VALUES ('157', '养护要点2', '浇水：叶子花喜水但忌积水，每年栽植或上盆、换盆后浇1次透水，生长旺季每天上午喷水1次、下午浇水1次（下午4点以后浇）。春、秋季可酌情2天浇1次水，冬季在室内可控制浇水，促使植株充分休眠。', '41', null, null);
INSERT INTO `product_breeding` VALUES ('158', '养护要点3', '施肥：冬季停止施肥。春季栽植或上盆、换盆时施足基肥，盆栽的出房后可每月施3-4次腐熟的饼肥水或蹄片水，花期前可增施几次磷、钾肥。秋季减少施肥量。夏季生长旺盛时，可每周施1次肥水。', '41', null, null);
INSERT INTO `product_breeding` VALUES ('159', '养护要点1', '浇水：露薇花是多肉植物，叶片虽然不像其他的多肉植物肥肥厚厚的，但也算鲜嫩多汁。所以浇水的多与少，对露薇花的生长由很重要的影响。夏季天气炎热，要减少浇水，保持盆土偏干，以免烂根。', '42', null, null);
INSERT INTO `product_breeding` VALUES ('160', '养护要点2', '施肥：露薇花开花次数多，需要的养分也多，从5月开始露薇花生长速度加快，所以要每半个月施一次稀薄的氮肥。6月，露薇花会慢慢长出花苞，施肥要以磷肥为主，半个月一次。', '42', null, null);
INSERT INTO `product_breeding` VALUES ('161', '养护要点3', '保温：露薇花的耐寒性很差，气温降低后要及时移到室内养护。放在室内向阳的温暖处，控制室内的温度在3~5℃。\r\n\r\n对于冬季室内温度比较低的家庭，建议在花盆套上塑料袋，可以起到很好的保温作用。', '42', null, null);
INSERT INTO `product_breeding` VALUES ('162', '养护要点1', '温度水分：生长适温一般为18-25度，冬季不低于5度；依照干透浇透的原则就行（非常耐旱，尽量少浇水）；一个月浇水1～2次，无需过多，否则会烂根。', '43', null, null);
INSERT INTO `product_breeding` VALUES ('163', '养护要点2', '光照：喜光，可以全日照，夏季通常遮些荫。', '43', null, null);
INSERT INTO `product_breeding` VALUES ('164', '养护要点3', '土壤施肥：用多肉专用土最方便，如泥炭（草炭）+砾石+珍珠岩；一般在生长季一月一次，薄肥勤施，可随浇水施入。', '43', null, null);
INSERT INTO `product_breeding` VALUES ('165', '养护要点1', '土壤：最好弄一些河沙之类的沙石，当然土壤的肥沃性能也要是到保证，不然生长过于缓慢，准备一些泥炭土加上煤渣和蛭石，就是非常不错的培养土质。', '44', null, null);
INSERT INTO `product_breeding` VALUES ('166', '养护要点2', '温度：广寒宫是不耐寒的多肉植物，生长适宜温度在12～22℃。到了冬天要把它搬到室内养，并且要保证室温在5℃以上。白天如果放晴的话可以拿出去晒晒太阳，更利于它的生长。', '44', null, null);
INSERT INTO `product_breeding` VALUES ('167', '养护要点3', '合理浇水：广寒宫是一种特别能耐干旱的多肉植物，平时一个月不浇水都能成活，所以我们平时不能浇水过量，不然造成积水就麻烦了。', '44', null, null);
INSERT INTO `product_breeding` VALUES ('168', '养护要点1', '光照：春秋季节是其主要生长期，应给予充足光照， 如果阳光不足，会使植株徒长，叶与叶之间的距离拉长，失去紧凑的株型，不仅影响观赏，而且还容易因枝条过脆不充实而折断。', '45', null, null);
INSERT INTO `product_breeding` VALUES ('169', '养护要点2', '浇水：注意控制浇水，避免雨淋，尤其是长期雨淋，以防植株腐烂死亡。到秋凉后，植株开始生长后再恢复正常管理。冬季移入室内光照充足、温度不低于10℃的地方，植株可继续生长。', '45', null, null);
INSERT INTO `product_breeding` VALUES ('170', '养护要点3', '土壤：盆土要求疏松透气，具有良好的排水性，可用园土、沙土、蛭石等材料混合配制。', '45', null, null);
INSERT INTO `product_breeding` VALUES ('171', '养护要点1', '土壤：在养小米星的时候土壤要选择疏松的土壤，可以用煤渣然后加入一些泥炭，再在最上层铺上一层小石子，这样可以在给小米星浇水的时候防止土壤表层的养分被冲走出现土壤板结的情况。', '46', null, null);
INSERT INTO `product_breeding` VALUES ('172', '养护要点2', '温度：小米星在夏季的时候要注意放在比较凉爽的地方，而等到冬季的时候要适当的给小米星稍凉的地方，温度不要太冷，差不多在10摄氏度左右就可以了。', '46', null, null);
INSERT INTO `product_breeding` VALUES ('173', '养护要点3', '光照：9月到来年的6月，这几个月的光照是可以满足小米星的要求的，所以，可以给它充足的光照，让它更好的进行光合作用，但是，在夏季的时候光照非常的强烈，而小米星喜欢阴凉的环境，所以，要给它适当的遮荫。', '46', null, null);
INSERT INTO `product_breeding` VALUES ('174', '养护要点1', '光照：光照越充足、昼夜温差越大，叶片色彩越鲜艳润泽。在温度允许的情况下，最好放到室外养护，保证充足的光照。', '47', null, null);
INSERT INTO `product_breeding` VALUES ('175', '养护要点2', '水分：因植株内部水分含量高，姬秋丽在过度潮湿的环境下很容易腐烂。切忌浇水过多。', '47', null, null);
INSERT INTO `product_breeding` VALUES ('176', '养护要点3', '土壤：宜用排水、透气生良好的沙质土壤栽培，以便于多余水分的排除和植物根部的生长；可用泥炭混合颗粒状的浮石或河沙配制培养土，用松针土、蛭石、腐叶土、沙土各1份配制。每12年于春季换盆一次，可将坏死的老根剪去。', '47', null, null);
INSERT INTO `product_breeding` VALUES ('178', '养护要点4', '温度：姬秋丽最适宜的生长温度为15~25℃一般情况下，5℃以下时停止生长或轻度冻伤，0℃及以下叶片中的水分冻结细胞坏死。', '47', null, null);
INSERT INTO `product_breeding` VALUES ('179', '养护要点1', '温度：冬季夜间养护最低温度不得低于8℃，白天需控制在20℃以上，植株可继续生长，应正常浇水，若节制浇水，植株会进入休眠状态。', '48', null, null);
INSERT INTO `product_breeding` VALUES ('180', '养护要点2', '日照：该种对光照较为敏感，若光照过强，叶片生长不良，呈浅褐色，有时强烈的直射光还会灼伤叶片，留下的斑痕会严重影响观赏价值，甚至造成腐烂。而栽培场所过于阴蔽，又会造成株型松散，不紧凑，叶片瘦长，“窗”的透明度低，易感染病虫害。', '48', null, null);
INSERT INTO `product_breeding` VALUES ('181', '养护要点3', '土壤：适宜在疏松，排水透气性良好，含有石灰质，并有较粗颗粒度的沙质土壤中生长。常用泥炭土2份、粗沙3份的混合土栽种，并掺入少量骨粉等。还可用赤玉土、兰石、植金石等材料混合栽种，但要加入适量的泥炭土，以增加土壤的有机质含量。', '48', null, null);
INSERT INTO `product_breeding` VALUES ('182', '养护要点1', '土壤：鹿角海棠养殖土壤以疏松透气的沙土为佳，不一定必须是沙土，和其他多肉植物配土可以相同。', '49', null, null);
INSERT INTO `product_breeding` VALUES ('183', '养护要点2', '浇水：鹿角海棠不用保持土壤长期潮湿，要保持土壤偏干，所以浇水要适量，该种耐干旱，不容易旱死，但是容易因为积水烂根。', '49', null, null);
INSERT INTO `product_breeding` VALUES ('184', '养护要点3', '环境：鹿角海棠要放在阳光充足的环境下养护，如果是新栽可在阴凉通风处缓苗。', '49', null, null);
INSERT INTO `product_breeding` VALUES ('185', '养护要点1', '沙质土壤：选择栽种的土壤最好也是采用沙质的土壤比较合适，沙质的土壤更加透气，更加适合原生态的养护环境，可以用1:1的营养土跟沙子混合在一起使用。', '50', null, null);
INSERT INTO `product_breeding` VALUES ('186', '养护要点2', '光照：仙人掌科的鼠尾掌同样也是喜欢阳光照射的，尤其是南方地区养鼠尾掌长势会更好，更加的旺盛，夏季的高温天气完全不需要担心，只要养护的环境不是密闭的，能通风透气，多高的温度都不怕。', '50', null, null);
INSERT INTO `product_breeding` VALUES ('187', '养护要点3', '浇水：给鼠尾掌浇水并不需要太多，开花的时候适量的多浇一点，像平常一周半个月浇水一次就可以，半个月不浇也没有太大的问题，不会影响生长，但是开花的时候浇水一定不能断了，切记不可向着鼠尾掌的大尾巴上喷水。', '50', null, null);
INSERT INTO `product_breeding` VALUES ('188', '养护要点1', '土壤：盆栽的时候可用腐叶土、煤渣和园土、沙土的混合土作为培养土，之后每隔1～2年在春季结合修剪换盆一次，以促进根系的正常生长。', '51', null, null);
INSERT INTO `product_breeding` VALUES ('189', '养护要点2', '光照：凝脂莲在温差较大、阳光充足的环境下生长繁茂，在生长期间最好将植株放在室内养护，保证每天有充足的光照照射，但在夏季中午的时候要进行遮荫处理，或者放在半阴处养护，冬季的时候尽量将其放在室内的向阳处即可。', '51', null, null);
INSERT INTO `product_breeding` VALUES ('190', '养护要点3', '适度浇水：凝脂莲有较强的耐旱性，如果浇水过多，很容易导致叶片腐烂，在生长期间最好每隔10天浇水一次，主要以喷水为主，每次浇水要一次性浇透，不可积水，秋冬季节气温逐渐变低，此时每隔20天浇水一次，保持盆土干燥即可。', '51', null, null);
INSERT INTO `product_breeding` VALUES ('191', '养护要点1', '土壤：丽娜莲养殖选择的土壤要求透气，排水性要好。一般以混合土壤为佳，比如讲泥炭、煤渣等混合，按照一定的比例配置。', '52', null, null);
INSERT INTO `product_breeding` VALUES ('192', '养护要点2', '浇水：在夏季高温的时候，需要节制浇水，放在阴凉通风处慢慢断水。冬季也是如此，在气温低于0℃的时候，要减少浇水，但是在冬季不能完全不浇水，可以在丽娜莲的根部给一点水。', '52', null, null);
INSERT INTO `product_breeding` VALUES ('193', '养护要点3', '光照：保持充足的光照。一般除了夏季，都是可以全日照。而夏季因为气温高，光照强烈，要适当的遮阴，避免阳光直射。冬季要将其放在室内阳光明亮的地方养护，多接受阳光的照射。', '52', null, null);
INSERT INTO `product_breeding` VALUES ('194', '养护要点1', '土壤：山茶花生长所需的土壤要保证良好的透水性，另外土质要疏松且肥沃，不可以用碱性土壤。', '53', null, null);
INSERT INTO `product_breeding` VALUES ('195', '养护要点2', '光照：山茶花的生长环境宜温暖，光照要充足，温度要保持约18-22℃。', '53', null, null);
INSERT INTO `product_breeding` VALUES ('196', '养护要点3', '水分：山茶花喜欢生长在湿润的环境中，通常春季可增加水量，防止盆内存有积水。', '53', null, null);
INSERT INTO `product_breeding` VALUES ('197', '养护要点4', '施肥：一般肥料较多的情况下，山茶花植株的生长状况较佳。不过要注意的是，施肥的时候应该薄肥勤施，切不可怕麻烦一次性施加给植株过多养分。', '53', null, null);
INSERT INTO `product_breeding` VALUES ('198', '养护要点1', '土壤：培养土可用腐殖土3份、森林腐叶土2份、炉灰碴2份、河砂(砂质菜园土)2份、腐熟的堆肥1份，并适当加入过磷酸钙等化学药品配制。这种土壤，疏松肥沃，适宜仙客来生长。', '54', null, null);
INSERT INTO `product_breeding` VALUES ('199', '养护要点2', '浇水：仙客来能耐旱。但是生长季节土壤要保持湿润，注意盆中不能积水。仙客来不喜欢过于潮湿的土壤，浇水要勤而少。夏季如果不休眠，可以进行正常浇水，保持盆土干润。立秋以后，仙客来进人生殖生长期，这时要施以磷钾肥料。', '54', null, null);
INSERT INTO `product_breeding` VALUES ('200', '养护要点3', '温度：仙客来冬季的生长适温为10～22℃，白天应与夜间保持8～10℃的温差。若夜间温度控制在7～8℃时也可开花，但花期会稍向后推迟；但若低于6℃，则无法正常开花。', '54', null, null);
INSERT INTO `product_breeding` VALUES ('201', '养护要点4', '光照：温度和光照对仙客来的生长发育，都有一定的影响。在整个生长过程中，主要是从温度入手，考虑延长花期。', '54', null, null);
INSERT INTO `product_breeding` VALUES ('202', '养护要点1', '浇水：不同的时期，植物需要的水分不一样，在生长期(3月---11月)需要的水分多，休眠期(12月-2月)需要的则比较少。至于浇水的周期不能统一而论，春秋季一般5-7天浇一次水，夏季3-5天浇一次水，冬季则7-10天浇一次透水。', '55', null, null);
INSERT INTO `product_breeding` VALUES ('203', '养护要点2', '土壤：红豆杉宜在早春2月中下旬栽植，种苗要带土球挖起，可栽庭园荫蔽处，常与乔木配植。盆土用疏松、肥沃的有机 质含量高的酸性土，可用园土、泥炭、沙按2：1：1配成，加1％腐熟的有机肥。', '55', null, null);
INSERT INTO `product_breeding` VALUES ('204', '养护要点3', '温度：东北红豆杉能耐半阴，抗严寒，适应性强，一般能耐-25～-15℃的低温。养成不怕寒冷的生长习性，莳养者在知道了它的习性后，就该满足其对温度的需要。', '55', null, null);
INSERT INTO `product_breeding` VALUES ('205', '养护要点1', '土壤：最好配制肥沃、疏松、透气、排水良好的土壤，建议花友们可以用腐叶土、园土和沙土混合栽种，同时在土壤中施入发酵的饼肥、或者鸡粪、羊粪球等。', '56', null, null);
INSERT INTO `product_breeding` VALUES ('206', '养护要点2', '光照：如果在室内养护，建议放在朝东和朝南的阳台上和窗台上，让植株每天都能沐浴在阳光下。阳光充足有利于植株进行光合作用，光合作用产生营养，能促进植株开花，而且开的花又大又鲜艳的。', '56', null, null);
INSERT INTO `product_breeding` VALUES ('207', '养护要点3', '浇水：在幼苗期，浇水要少一点，一般情况下3～5天浇一次水，保持土壤湿润即可。成株的虞美人生长期需水量较多，为了促发更多的侧枝，使植株生长旺盛，一般情况下2～3天浇一次水，让土壤处于湿润状态。', '56', null, null);
INSERT INTO `product_breeding` VALUES ('208', '养护要点1', '土壤：酒瓶兰喜疏松的沙土和腐殖土，耐干旱和瘠薄。盆栽的土壤要选排水性好的，可用3份肥沃园土与1份煤渣混合，再加少量豆饼或鸡粪作基肥。', '57', null, null);
INSERT INTO `product_breeding` VALUES ('209', '养护要点2', '阳光;酒瓶兰喜充足阳光，但又有一定的耐阴能力。若光线不足，叶片生长细弱，植株生长不健壮。春、秋季应将其置于光照充足处，夏季要适当遮阴。', '57', null, null);
INSERT INTO `product_breeding` VALUES ('210', '养护要点3', '湿度：酒瓶兰喜湿润气候，生长空气相对温度在70-80%，湿度过低会使下部叶片黄化、脱落，上部叶片无光泽。', '57', null, null);
INSERT INTO `product_breeding` VALUES ('211', '养护要点1', '土壤：勿忘草性喜干燥，喜土层深厚，疏松透气，微碱性沙质壤土，如腐熟的有机肥和缓效复合肥，施后均匀翻入土中。', '58', null, null);
INSERT INTO `product_breeding` VALUES ('212', '养护要点2', '温度：勿忘草忌高温高湿，其花芽分化需1.5-2个月低温阶段，需要的温度在15℃以下，气温高于30℃或低于5℃对其生长不利。', '58', null, null);
INSERT INTO `product_breeding` VALUES ('213', '养护要点3', '光照：勿忘草喜阳光，必须在充足的日光照射下才能正常生长。若环境荫蔽，丛虽然繁茂，但抽生的花葶少。因此，每天植株接受日光照射要在4小时以上。如果能够保证全日照，则生长更好。', '58', null, null);
INSERT INTO `product_breeding` VALUES ('214', '养护要点1', '土壤：可以选择一般的园土或者混合腐叶土，如果土质比较粘稠，可以加点细沙，中和一下。', '59', null, null);
INSERT INTO `product_breeding` VALUES ('215', '养护要点2', '光照：滴水观音是喜阴凉的植物，明亮的光线下就可以生长的很好。如果光照过强，叶片会出现萎蔫。但是花期要保证阳光充足，否则花苞带有淡绿色，影响品质。', '59', null, null);
INSERT INTO `product_breeding` VALUES ('216', '养护要点3', '温度：温度对滴水观音的影响是很大的。最适宜的生长温度在20~25℃。温度低于18℃会进入休眠状态，停止生长，这就意味着冬季要及时移到室内，保证适当的温度。但夏季温度高于30摄氏度，生长也会出现异常。', '59', null, null);
INSERT INTO `product_breeding` VALUES ('217', '养护要点4', '水分：滴水观音生长需要充足的水分，尤其是夏季，环境闷热，每天中午要向叶片喷水，增加空气湿度，这样滴水观音的叶片才会又大又厚。冬季只要室内的温度较高，可正常浇水。', '59', null, null);

-- ----------------------------
-- Table structure for `product_image`
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('1', '22', null, '0', '1');
INSERT INTO `product_image` VALUES ('2', '24', null, '0', '1');
INSERT INTO `product_image` VALUES ('3', '29', null, '0', '2');
INSERT INTO `product_image` VALUES ('4', '31', null, '0', '2');
INSERT INTO `product_image` VALUES ('5', '33', null, '0', '3');
INSERT INTO `product_image` VALUES ('6', '36', null, '0', '3');
INSERT INTO `product_image` VALUES ('7', '20', null, '0', '4');
INSERT INTO `product_image` VALUES ('8', '21', null, '0', '4');
INSERT INTO `product_image` VALUES ('9', '44', null, '0', '5');
INSERT INTO `product_image` VALUES ('10', '45', null, '0', '5');
INSERT INTO `product_image` VALUES ('11', '53', null, '0', '6');
INSERT INTO `product_image` VALUES ('12', '54', null, '0', '6');
INSERT INTO `product_image` VALUES ('13', '47', null, '0', '7');
INSERT INTO `product_image` VALUES ('14', '48', null, '0', '7');
INSERT INTO `product_image` VALUES ('15', '38', null, '0', '8');
INSERT INTO `product_image` VALUES ('16', '39', null, '0', '8');
INSERT INTO `product_image` VALUES ('17', '26', null, '0', '9');
INSERT INTO `product_image` VALUES ('18', '27', null, '0', '9');
INSERT INTO `product_image` VALUES ('19', '41', null, '0', '10');
INSERT INTO `product_image` VALUES ('20', '42', null, '0', '10');
INSERT INTO `product_image` VALUES ('21', '58', null, '0', '1');
INSERT INTO `product_image` VALUES ('22', '61', null, '0', '2');
INSERT INTO `product_image` VALUES ('23', '62', null, '0', '3');
INSERT INTO `product_image` VALUES ('24', '56', null, '0', '4');
INSERT INTO `product_image` VALUES ('25', '60', null, '0', '5');
INSERT INTO `product_image` VALUES ('26', '57', null, '0', '6');
INSERT INTO `product_image` VALUES ('27', '63', null, '0', '8');
INSERT INTO `product_image` VALUES ('28', '59', null, '0', '9');
INSERT INTO `product_image` VALUES ('29', '67', null, '0', '11');
INSERT INTO `product_image` VALUES ('30', '68', null, '0', '11');
INSERT INTO `product_image` VALUES ('31', '69', null, '0', '11');
INSERT INTO `product_image` VALUES ('32', '71', null, '0', '12');
INSERT INTO `product_image` VALUES ('33', '72', null, '0', '12');
INSERT INTO `product_image` VALUES ('34', '73', null, '0', '12');
INSERT INTO `product_image` VALUES ('35', '75', null, '0', '13');
INSERT INTO `product_image` VALUES ('36', '76', null, '0', '13');
INSERT INTO `product_image` VALUES ('37', '77', null, '0', '13');
INSERT INTO `product_image` VALUES ('38', '79', null, '0', '14');
INSERT INTO `product_image` VALUES ('39', '80', null, '0', '14');
INSERT INTO `product_image` VALUES ('40', '81', null, '0', '14');
INSERT INTO `product_image` VALUES ('41', '83', null, '0', '15');
INSERT INTO `product_image` VALUES ('42', '84', null, '0', '15');
INSERT INTO `product_image` VALUES ('43', '85', null, '0', '15');
INSERT INTO `product_image` VALUES ('44', '87', null, '0', '16');
INSERT INTO `product_image` VALUES ('45', '88', null, '0', '16');
INSERT INTO `product_image` VALUES ('46', '89', null, '0', '16');
INSERT INTO `product_image` VALUES ('47', '91', null, '0', '17');
INSERT INTO `product_image` VALUES ('48', '92', null, '0', '17');
INSERT INTO `product_image` VALUES ('49', '93', null, '0', '17');
INSERT INTO `product_image` VALUES ('50', '95', null, '0', '18');
INSERT INTO `product_image` VALUES ('51', '96', null, '0', '18');
INSERT INTO `product_image` VALUES ('52', '97', null, '0', '18');
INSERT INTO `product_image` VALUES ('53', '99', null, '0', '19');
INSERT INTO `product_image` VALUES ('54', '100', null, '0', '19');
INSERT INTO `product_image` VALUES ('55', '101', null, '0', '19');
INSERT INTO `product_image` VALUES ('56', '103', null, '0', '20');
INSERT INTO `product_image` VALUES ('57', '104', null, '0', '20');
INSERT INTO `product_image` VALUES ('58', '105', null, '0', '20');
INSERT INTO `product_image` VALUES ('59', '107', null, '0', '21');
INSERT INTO `product_image` VALUES ('60', '108', null, '0', '21');
INSERT INTO `product_image` VALUES ('61', '109', null, '0', '21');
INSERT INTO `product_image` VALUES ('62', '111', null, '0', '22');
INSERT INTO `product_image` VALUES ('63', '112', null, '0', '22');
INSERT INTO `product_image` VALUES ('64', '114', null, '0', '23');
INSERT INTO `product_image` VALUES ('65', '115', null, '0', '23');
INSERT INTO `product_image` VALUES ('66', '116', null, '0', '23');
INSERT INTO `product_image` VALUES ('67', '118', null, '0', '24');
INSERT INTO `product_image` VALUES ('68', '119', null, '0', '24');
INSERT INTO `product_image` VALUES ('69', '120', null, '0', '24');
INSERT INTO `product_image` VALUES ('70', '122', null, '0', '25');
INSERT INTO `product_image` VALUES ('71', '123', null, '0', '25');
INSERT INTO `product_image` VALUES ('72', '124', null, '0', '25');
INSERT INTO `product_image` VALUES ('73', '126', null, '0', '26');
INSERT INTO `product_image` VALUES ('74', '127', null, '0', '26');
INSERT INTO `product_image` VALUES ('75', '128', null, '0', '26');
INSERT INTO `product_image` VALUES ('76', '130', null, '0', '27');
INSERT INTO `product_image` VALUES ('77', '131', null, '0', '27');
INSERT INTO `product_image` VALUES ('78', '132', null, '0', '27');
INSERT INTO `product_image` VALUES ('79', '134', null, '0', '28');
INSERT INTO `product_image` VALUES ('80', '135', null, '0', '28');
INSERT INTO `product_image` VALUES ('81', '137', null, '0', '29');
INSERT INTO `product_image` VALUES ('82', '138', null, '0', '29');
INSERT INTO `product_image` VALUES ('83', '139', null, '0', '29');
INSERT INTO `product_image` VALUES ('84', '141', null, '0', '30');
INSERT INTO `product_image` VALUES ('85', '142', null, '0', '30');
INSERT INTO `product_image` VALUES ('86', '143', null, '0', '30');
INSERT INTO `product_image` VALUES ('87', '145', null, '0', '31');
INSERT INTO `product_image` VALUES ('88', '146', null, '0', '31');
INSERT INTO `product_image` VALUES ('89', '147', null, '0', '31');
INSERT INTO `product_image` VALUES ('90', '149', null, '0', '32');
INSERT INTO `product_image` VALUES ('91', '150', null, '0', '32');
INSERT INTO `product_image` VALUES ('92', '152', null, '0', '33');
INSERT INTO `product_image` VALUES ('93', '153', null, '0', '33');
INSERT INTO `product_image` VALUES ('94', '155', null, '0', '34');
INSERT INTO `product_image` VALUES ('95', '156', null, '0', '34');
INSERT INTO `product_image` VALUES ('96', '158', null, '0', '35');
INSERT INTO `product_image` VALUES ('97', '159', null, '0', '35');
INSERT INTO `product_image` VALUES ('98', '160', null, '0', '35');
INSERT INTO `product_image` VALUES ('99', '162', null, '0', '36');
INSERT INTO `product_image` VALUES ('100', '163', null, '0', '36');
INSERT INTO `product_image` VALUES ('101', '165', null, '0', '37');
INSERT INTO `product_image` VALUES ('102', '166', null, '0', '37');
INSERT INTO `product_image` VALUES ('103', '168', null, '0', '38');
INSERT INTO `product_image` VALUES ('104', '169', null, '0', '38');
INSERT INTO `product_image` VALUES ('105', '170', null, '0', '38');
INSERT INTO `product_image` VALUES ('106', '172', null, '0', '39');
INSERT INTO `product_image` VALUES ('107', '173', null, '0', '39');
INSERT INTO `product_image` VALUES ('108', '174', null, '0', '39');
INSERT INTO `product_image` VALUES ('109', '176', null, '0', '40');
INSERT INTO `product_image` VALUES ('110', '177', null, '0', '40');
INSERT INTO `product_image` VALUES ('111', '179', null, '0', '41');
INSERT INTO `product_image` VALUES ('112', '180', null, '0', '41');
INSERT INTO `product_image` VALUES ('113', '182', null, '0', '42');
INSERT INTO `product_image` VALUES ('114', '183', null, '0', '42');
INSERT INTO `product_image` VALUES ('115', '184', null, '0', '42');
INSERT INTO `product_image` VALUES ('116', '186', null, '0', '43');
INSERT INTO `product_image` VALUES ('117', '187', null, '0', '43');
INSERT INTO `product_image` VALUES ('118', '189', null, '0', '44');
INSERT INTO `product_image` VALUES ('119', '190', null, '0', '44');
INSERT INTO `product_image` VALUES ('120', '192', null, '0', '45');
INSERT INTO `product_image` VALUES ('121', '193', null, '0', '45');
INSERT INTO `product_image` VALUES ('122', '195', null, '0', '46');
INSERT INTO `product_image` VALUES ('123', '196', null, '0', '46');
INSERT INTO `product_image` VALUES ('124', '198', null, '0', '47');
INSERT INTO `product_image` VALUES ('125', '199', null, '0', '47');
INSERT INTO `product_image` VALUES ('126', '201', null, '0', '48');
INSERT INTO `product_image` VALUES ('127', '202', null, '0', '48');
INSERT INTO `product_image` VALUES ('128', '204', null, '0', '49');
INSERT INTO `product_image` VALUES ('129', '205', null, '0', '49');
INSERT INTO `product_image` VALUES ('130', '207', null, '0', '50');
INSERT INTO `product_image` VALUES ('131', '208', null, '0', '50');
INSERT INTO `product_image` VALUES ('132', '210', null, '0', '51');
INSERT INTO `product_image` VALUES ('133', '211', null, '0', '51');
INSERT INTO `product_image` VALUES ('134', '213', null, '0', '52');
INSERT INTO `product_image` VALUES ('135', '214', null, '0', '52');
INSERT INTO `product_image` VALUES ('136', '216', null, '0', '53');
INSERT INTO `product_image` VALUES ('137', '217', null, '0', '53');
INSERT INTO `product_image` VALUES ('138', '219', null, '0', '54');
INSERT INTO `product_image` VALUES ('139', '220', null, '0', '54');
INSERT INTO `product_image` VALUES ('140', '221', null, '0', '54');
INSERT INTO `product_image` VALUES ('141', '223', null, '0', '55');
INSERT INTO `product_image` VALUES ('142', '224', null, '0', '55');
INSERT INTO `product_image` VALUES ('143', '226', null, '0', '56');
INSERT INTO `product_image` VALUES ('144', '227', null, '0', '56');
INSERT INTO `product_image` VALUES ('145', '229', null, '0', '57');
INSERT INTO `product_image` VALUES ('146', '230', null, '0', '57');
INSERT INTO `product_image` VALUES ('147', '232', null, '0', '58');
INSERT INTO `product_image` VALUES ('148', '233', null, '0', '58');
INSERT INTO `product_image` VALUES ('149', '235', null, '0', '59');
INSERT INTO `product_image` VALUES ('150', '236', null, '0', '59');

-- ----------------------------
-- Table structure for `product_misundstand`
-- ----------------------------
DROP TABLE IF EXISTS `product_misundstand`;
CREATE TABLE `product_misundstand` (
  `id` int(5) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of product_misundstand
-- ----------------------------
INSERT INTO `product_misundstand` VALUES ('1', '浇水时间太随意', '浇水的时间是很有讲究的，夏季中午温度比较高，此时切忌浇水，如果浇水，会使得土壤温度突然下降，水分吸收减慢，导致水分供应不足，造成花卉的上部叶子焦枯。一般来说，浇水的时间，冬季宜在下午4时左右，其它季节以上午10时以前为宜。');
INSERT INTO `product_misundstand` VALUES ('2', '夹竹桃', '夹竹桃每年春、夏、秋三季开花，是一种既能观赏、治病，但又能让人中毒的花。它的茎、叶乃至花朵都有毒，其气味如闻得过久，会使人昏昏欲睡，智力下降。它分泌的乳白色汁液，如误食会中毒。');
INSERT INTO `product_misundstand` VALUES ('3', '危险的郁金香', '郁金香，虽然花容端庄，外形典雅，颜色艳丽丰富，异彩纷呈。但是它的花朵中含有一种毒碱，人和动物在这种花丛中待上2~3小时，就会头昏脑涨，出现中毒症状，严重者会毛发脱落，所以最好不要养在家里，如果是成束的鲜花，要注意保持室内通风。');
INSERT INTO `product_misundstand` VALUES ('4', '洋绣球', '洋绣球的花所散发出来的微粒,如果与人接触,会使有些人皮肤发生瘙痒。');
INSERT INTO `product_misundstand` VALUES ('5', '肥越浓越好', '养盆花，如果施肥浓度过大或用量太多，容易造成肥害，轻者导致花卉长势不好，重者可能导致花卉死亡。施肥应按照“薄肥勤施”的原则，以“一分肥九分水”为最好。');
INSERT INTO `product_misundstand` VALUES ('6', '五色梅', '五色梅花、叶均有毒，误食后会引起腹泻、发烧等症状。');
INSERT INTO `product_misundstand` VALUES ('7', '室内的花只能在室内养', '有人认为，室内植物只要放在室内养就可以了，不用搬到室外。实际上，如果盆花在室内摆设时间过长，会由于阳光不足，造成生长不良。同时花卉在夜间不进行光合作用时也需要呼吸与人争氧，所以应该定期把盆花搬出室外调养，同时室内不要摆放过多花卉。');
INSERT INTO `product_misundstand` VALUES ('8', '月季花', '它所散发的浓郁香味，会使个别人闻后突然感到胸闷不适，呼吸困难。注意通风');
INSERT INTO `product_misundstand` VALUES ('9', '松柏类植物', '此类植物会分泌一种松香油味的脂类物质，对人体的肠胃有刺激作用，如果闻久了，不仅影响食欲，还会使人心烦意乱、恶心呕吐、头昏目眩。不适合养殖');
INSERT INTO `product_misundstand` VALUES ('10', '玉丁香', '此花虽然好看，但是它发出的异味还会引起人气喘、烦闷。注意通风');
INSERT INTO `product_misundstand` VALUES ('11', '电视机旁边养花', '有些人为了减少辐射，喜欢在电视机旁边摆放花卉。而实际上这种做法是不对的，电视机在工作时发出的放射线对植物细胞的繁殖有破坏作用，时间稍久还会导致花卉枯死。');
INSERT INTO `product_misundstand` VALUES ('12', '百合花', '百合花它所散发的香味如闻之过久，会使人的中枢神经过度兴奋而引起失眠。');
INSERT INTO `product_misundstand` VALUES ('13', '夜来香', '光合作用时会大量耗氧。此外，它们在夜间还会大量散播强烈刺激嗅觉的微粒，使高血压和心脏病患者感到憋闷。');
INSERT INTO `product_misundstand` VALUES ('14', '晚上叶片上有水滴', '有些人经常在晚上给花卉浇水，或是用湿布拭擦叶片，殊不知晚上叶片上留有水滴，容易造成花卉叶片腐烂，诱发病虫害。因此，要注意浇水时间，以及擦叶片时也要把握好时间，千万要保证晚上叶片上无水，以利于花卉正常生长。');
INSERT INTO `product_misundstand` VALUES ('15', '天竺葵', '天竺葵花具有药用价值，止痛抗菌。虽然可以治病，但是也会使有些人过敏。');
INSERT INTO `product_misundstand` VALUES ('16', '紫荆花', '它所散发出来的花粉人接触过久，会诱发哮喘症或使咳嗽症状加重。');
INSERT INTO `product_misundstand` VALUES ('17', '浇喝剩的茶水能补充营养', '向花盆里浇喝剩的茶水虽然对土壤的疏松有帮助，但是会提高土壤酸碱度，容易引起黄化病，甚至可能导致花卉死亡。剩茶叶末在腐解过程中还会招虫子，影响环境卫生。');
INSERT INTO `product_misundstand` VALUES ('18', '一品红', '全株有毒，特别是茎叶里的白色汁液会刺激皮肤红肿，引起过敏反应，如误食茎、叶，有中毒死亡的危险。');
INSERT INTO `product_misundstand` VALUES ('19', '水仙', '水仙家庭栽种一般没问题，但不要弄破它的鳞茎，因为它里面含有拉丁可毒素，误食可引起呕吐、肠炎；叶和花的汁液可使皮肤红肿，特别当心不要把这种汁液弄到眼睛里去。');
INSERT INTO `product_misundstand` VALUES ('20', '虞美人', '全株有毒，内含有毒生物碱，尤其果实毒性最大，如果误食则会引起中枢神经系统中毒，严重的还可能导致生命危险。');
INSERT INTO `product_misundstand` VALUES ('21', '马蹄莲', '马蹄莲花有毒，内含大量草酸钙结晶和生物碱等，误食会引起昏迷等中毒症状。');
INSERT INTO `product_misundstand` VALUES ('22', '病弱植株需多施肥', '病弱植株枝条细弱，光合作用差，新陈代谢迟缓，如果随便施肥，容易造成肥害。很就象人一样，如果都已经生病了，还拼命的补，不但增加身体负担，还可能加重病情。植物也是同样的道理。因此，病弱植株千万不要一味的追肥，以免适得其反。');
INSERT INTO `product_misundstand` VALUES ('23', '石蒜', '石蒜内含石蒜生物碱，全株有毒，如果误食引起呕吐、腹泻，严重者还会发生语言障碍、口鼻出血。');
INSERT INTO `product_misundstand` VALUES ('24', '含羞草', '含羞草内含含羞草碱。这种毒素，接触过多，会引起眉毛稀疏、头发变黄甚至脱落。因此不要用手指过多拨弄它。');
INSERT INTO `product_misundstand` VALUES ('25', '滴水观音', '滴水观音茎内的白色汁液有毒，滴下的水也是有毒的，误碰或误食其汁液，就会引起咽部和口部的不适，胃里有灼痛感。皮肤接触它的汁液还会瘙痒或产生强烈刺激感，眼睛接触汁液可引起严重的结膜炎，甚至失明。误吃茎叶会有恶心、疼痛的症状，严重的还会窒息，导致心脏麻痹而死亡。');
INSERT INTO `product_misundstand` VALUES ('26', '花叶万年青', '花叶万年青，花叶内含有草酸和天门冬素，其枝叶的汁液具有很强的毒性，一旦触及皮肤，奇痒难熬。尤其是它的果实，毒性更大，误食后会引起口腔、咽喉肿痛，甚至伤害声带，故有人称花叶万年青为“哑巴草”，人畜误食还会带来生命危险。');
INSERT INTO `product_misundstand` VALUES ('27', '浇水打湿盆土表面即可', '浇水时一定要浇透，不要只打湿盆土表面，这样会使花卉的根系供水不足，而造成脱叶甚至枯死。浇水应做到“不干不浇，浇则浇透”，即盆土未干时不要浇水，如果浇水，则要一次浇透。');
INSERT INTO `product_misundstand` VALUES ('28', '长春花', '误食后，会造成白血球减少、血小板减少、肌肉无力、四肢麻痹等症状。');
INSERT INTO `product_misundstand` VALUES ('29', '合果芋', '一般误食合果芋之后，会导致身体中喉咙有灼热感，还会导致口舌发麻，口腔呢你黏膜溃疡感，严重的还会水肿，流口水，嘴巴不易张开。');
INSERT INTO `product_misundstand` VALUES ('30', '仙客来', '仙客来植株有一定的毒性尤其根茎部，误食可能导致腹泻、呕吐；皮肤接触后可能会引起皮肤红肿瘙痒，家养时须注意。');

-- ----------------------------
-- Table structure for `product_pest`
-- ----------------------------
DROP TABLE IF EXISTS `product_pest`;
CREATE TABLE `product_pest` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_pest
-- ----------------------------
INSERT INTO `product_pest` VALUES ('1', '丝核菌', '经常使用新的土壤作为盆土。被侵染的土壤在使用前用常规方法处理。自然冷处理和生根室保持规定的温度。', '1', null, null);
INSERT INTO `product_pest` VALUES ('2', '青霉菌', '防止芽早熟或根的形成。', '1', null, null);
INSERT INTO `product_pest` VALUES ('3', '欧文氏杆菌', '通常种植种球在所推荐的条件下进行，即自然处理或生根室保持低温（9℃），同时不要太潮湿。', '1', null, null);
INSERT INTO `product_pest` VALUES ('4', '卷叶蛾和红蜘蛛危害顶梢嫩叶', '生物防治：清除枯枝落叶，集中浇毁，可以减少部分越冬基数，保护和利用天敌。捕食螨、瓢虫、草蛉、蓟马等对螨都具有一定控制作用，选择药剂时应考虑天敌的安全，若有条件，可人工释放天敌。', '2', null, null);
INSERT INTO `product_pest` VALUES ('5', '白绢病', '及时清除病株残体，集中销毁。', '2', null, null);
INSERT INTO `product_pest` VALUES ('6', '炭疽病', '加强栽培管理，发现病叶及时摘除并销毁。', '2', null, null);
INSERT INTO `product_pest` VALUES ('7', '褐斑病', '发病初期，可用75%百菌清可湿性粉剂600-700倍水溶液，每5-7天喷洒一次，连喷数次可控制病害发展。种植前剥去膜质鳞片，将鳞茎放在0.5%福尔马林溶液中，或放在50%多菌灵500倍水溶液中浸泡半小时，可预防此病发生。', '3', null, null);
INSERT INTO `product_pest` VALUES ('8', '枯叶病', '栽植前剥去干枯鳞片，用稀高锰酸冲洗2-3次预防。病发初期，可用50%代森锌1500倍水溶液喷洒。', '3', null, null);
INSERT INTO `product_pest` VALUES ('9', '线虫病', '此病可用40-43℃的0.5%福尔马林液浸泡鳞茎3-4小时加以预防。如在养护过程中发现植株染病严重，应立即将病株剔除并销毁。', '3', null, null);
INSERT INTO `product_pest` VALUES ('10', '绵腐、立枯、病毒、叶枯、黑茎病', '①搞好种球消毒，②轮作换茬，③清沟沥水，④清除杂草，⑤增施PK肥，拔除病株烧毁，用多菌灵、托布津、代森锌喷淋3~4次。', '4', null, null);
INSERT INTO `product_pest` VALUES ('11', '百合疫病', '①实行轮作；②选择排水良好土壤疏松的地块栽培或采用高厢深沟或超垄栽培，要求畦面要平，以利水系排除。', '4', null, null);
INSERT INTO `product_pest` VALUES ('12', '病毒病', '选育抗病品种或无病鳞茎繁殖，有条件的应设立无病留种地，发现病株及时清除。', '4', null, null);
INSERT INTO `product_pest` VALUES ('13', '炭疽病', '德国产的“施保功”1500倍液为治疗炭疽病的特效药', '5', null, null);
INSERT INTO `product_pest` VALUES ('14', '根腐病', '发病期喷50%多菌灵可湿性粉剂500倍液或可用5%呋喃丹颗粒剂，并可灌根。\r\n发病期喷50%多菌灵可湿性粉剂500倍液或可用5%呋喃丹颗粒剂，并可灌根。\r\n发病期喷50%多菌灵可湿性粉剂500倍液或可用5%呋喃丹颗粒剂，并可灌根。', '5', null, null);
INSERT INTO `product_pest` VALUES ('15', '叶斑病', '清除病叶，注意通风。可用95%的代森铵500倍液，或80%的多菌灵可湿性粉剂1000倍液等喷施防治。', '5', null, null);
INSERT INTO `product_pest` VALUES ('16', '螨虫', '夏秋季的螨虫为次，需用1000倍三氯杀螨醇杀灭。注意通风和增加叶面湿度，可减少感染螨虫。', '6', null, null);
INSERT INTO `product_pest` VALUES ('17', '粉虱', '用多菌灵可湿性粉剂500-800倍液浇灌根部，每周一次，连用2-3次即可。', '6', null, null);
INSERT INTO `product_pest` VALUES ('18', '蚜虫', '喷1500倍氧化乐果杀灭。', '6', null, null);
INSERT INTO `product_pest` VALUES ('19', '蚜虫', '可使用广谱(通用型)杀虫剂进行灭杀，使用时将叶片喷湿即可，切忌大量喷施。', '7', null, null);
INSERT INTO `product_pest` VALUES ('20', '青虫、地老虎', '可使用广谱(通用型)杀虫剂进行灭杀，使用时将叶片喷湿即可，切忌大量喷施。', '7', null, null);
INSERT INTO `product_pest` VALUES ('21', '真菌感染', '真菌易发时可每1-2周喷施一次广谱（通用型）杀菌剂进行预防。若真菌已经开始在基质、植株上滋生，则需要立即加强通风，去除病害部分，并使用一些治疗效果更好的杀菌剂。', '7', null, null);
INSERT INTO `product_pest` VALUES ('22', '病害', '喷洒多菌灵或托布津。', '8', null, null);
INSERT INTO `product_pest` VALUES ('23', '虫害', '喷洒乐果杀除', '8', null, null);
INSERT INTO `product_pest` VALUES ('24', '斑枯病又名叶枯病', '收花后，割去地上都植株，集中烧毁；发病初期，摘除病叶，并交替喷施1∶1∶lbo倍液波尔多液和50%托市津l000倍液。', '9', null, null);
INSERT INTO `product_pest` VALUES ('25', '枯萎病', '选无病老根留种；轮作；作高畦，开深沟，降低湿度；拔除病株，并在病穴撒石灰粉或用50%多菌灵l000倍液浇灌。', '9', null, null);
INSERT INTO `product_pest` VALUES ('26', '虫害', '供内销的菊花（切花或盆花），只要不影响花的品质，可容许少量害虫的发生。', '9', null, null);
INSERT INTO `product_pest` VALUES ('27', '夏季高温季节易发生介壳虫、蚜虫等病害', '及时刮除或用肥皂水清洗，严重时可喷药防治', '10', null, null);
INSERT INTO `product_pest` VALUES ('28', '叶斑病', '喷200倍波尔多液预防', '10', null, null);
INSERT INTO `product_pest` VALUES ('29', '根腐病', '托布津1000倍液浇灌。', '10', null, null);
INSERT INTO `product_pest` VALUES ('30', '叶片枯萎病', '主要为害植株的根际(根颈)及附近地面上茎的皮层与韧皮施肥过量或浇水过多而发生的一种生理性病害。如果是肥大，就要换盆土，根下垫一层细砂，盆土宜用疏松腐叶土，酸碱度以中性为宜。如果是水大，就要控制浇水量，并将黄叶摘除，植株仍能恢复正常生长。', '11', null, null);
INSERT INTO `product_pest` VALUES ('31', '叶斑病', '用0.5%高锰酸钾液涂抹病斑，或用50%多菌灵1000倍液进行喷雾；如若病害严重时，就要摘去被害叶片，进行烧毁，并在伤口处用无菌脱脂棉吸干。', '11', null, null);
INSERT INTO `product_pest` VALUES ('32', '细菌性腐烂病', '因受机械损伤或受介壳虫的危害造成病菌侵入，为害叶鞘和叶心，应切除腐烂处，伤口用脱脂棉吸干，再用0.02%链霉素涂抹。', '11', null, null);
INSERT INTO `product_pest` VALUES ('33', '介壳虫和红蜘蛛', '用40%的氧化乐果或80%敌敌畏1000~1500倍液防治。', '12', null, null);
INSERT INTO `product_pest` VALUES ('34', '软腐病、褐斑病等', '可选抒适宜的药剂进行防治，发病期间可用60%的多菌灵或80%的甲基托布津等', '12', null, null);
INSERT INTO `product_pest` VALUES ('35', '各类害虫', '应定期喷施螨类专杀药剂进行防治，如三氯杀螨醇、尼索朗、哒螨灵等。', '13', null, null);
INSERT INTO `product_pest` VALUES ('36', '叶枯病、褐斑病和灰斑病', '发病前用波尔多液喷洒预防，发病时，喷甲基托布津1000倍液防治。', '14', null, null);
INSERT INTO `product_pest` VALUES ('37', '介壳虫和蚜虫', '喷40%氧化乐果1000倍液灭杀。', '14', null, null);
INSERT INTO `product_pest` VALUES ('38', '芦荟锈病', '肉质叶上产生黄褐色病斑。清除田间病残体，集中烧毁。', '15', null, null);
INSERT INTO `product_pest` VALUES ('39', '芦荟褐斑病', '叶片上产生墨绿色的水渍状病斑。清除菌源。及时清除田间发病较严重地病株、病叶，将其深埋，并对发病区土壤用75%百菌清可湿性粉剂1000倍液+70%甲基托布津可湿性粉剂800倍液进行消毒。', '15', null, null);
INSERT INTO `product_pest` VALUES ('40', '芦荟叶枯病', '多从叶尖或叶缘产生褐色小斑点，后扩展为半圆形干枯，病斑皱缩，中央灰褐色，边缘具水渍状暗褐色的环带。发病初期喷洒27%铜高尚悬浮剂600倍液或1100倍式波尔多液、75%达科宁（百菌清）可湿性粉剂600倍液。', '15', null, null);
INSERT INTO `product_pest` VALUES ('41', '炭疽病', '主要为害叶，受害严重时叶片呈灰白色：秋雨连绵时容易发生。发病后，喷洒50%多菌灵可湿性粉剂500倍液，每7天喷洒1次，连喷3-4次即可防治。', '16', null, null);
INSERT INTO `product_pest` VALUES ('42', '叶斑病', '容易造成叶片枯黄脱落，多因通风不良、环境闷热潮湿引起。发病初期摘除病叶，并集中烧毁。同时喷洒1%波尔多液，每7天喷1次，连喷4-5次。', '16', null, null);
INSERT INTO `product_pest` VALUES ('43', '介壳虫', '受害植株生长不良，并能污染上煤烟病，引起叶片发黄，提前落叶。喷洒40%氧化乐果乳油荆800倍液。其他方法参见苏铁病虫害防治部分。', '16', null, null);
INSERT INTO `product_pest` VALUES ('44', '灰霉病', '在叶边缘产生水渍状褐色或黑色病斑，严重时病斑可占叶大部分或全叶，潮湿时生出灰霉层。用无病新土栽培，控制浇水，氮肥不要施过多。及时摘除病叶，并烧毁。发病时，喷施75%百菌清500倍液。10天1次，连续2～3次。', '16', null, null);
INSERT INTO `product_pest` VALUES ('45', '紫突眼蛎蚧', '以若虫与雌成虫刺吸枝、叶汁液。严重时布满叶片、枝条，致使植株干枯发黄、死亡。冬季结合整形、剪除虫枝叶，并集中烧毁。若虫孵化期，喷施50%辛硫磷1000倍液或速扑杀1500倍液。', '16', null, null);
INSERT INTO `product_pest` VALUES ('46', '茎腐病', '茎段发黑腐烂应立刻停止浇水,将腐烂茎段剪去,用石硫合剂或高脂膜喷洒防治。', '17', null, null);
INSERT INTO `product_pest` VALUES ('47', '蚜虫、介壳虫、蝗虫、金龟子', '氧化乐果喷杀。', '17', null, null);
INSERT INTO `product_pest` VALUES ('48', '叶斑病', '用50%代森锌可湿性粉剂1000倍液喷洒。', '18', null, null);
INSERT INTO `product_pest` VALUES ('49', '介壳虫', '用40%乐果乳油2000倍液喷杀。', '18', null, null);
INSERT INTO `product_pest` VALUES ('50', '叶斑病', '叶片局部坏死，出现黄色斑点或斑块，严重时整叶枯黄脱落。喷洒农药。', '19', null, null);
INSERT INTO `product_pest` VALUES ('51', '介壳虫、红蜘蛛等', '叶片会变成局部黄枯，甚至整叶萎黄脱落。均应及时喷药防治。', '19', null, null);
INSERT INTO `product_pest` VALUES ('52', '叶枯病', '轻者使叶片干枯，重者会导致植株整株死亡。用70%甲基托布津800液或75%百菌清1000倍液喷洒，间隔7-10天喷施一次，连续喷3至4次，可有效控制病情。', '20', null, null);
INSERT INTO `product_pest` VALUES ('53', '根部腐烂', '散尾葵叶尖和叶缘在生长期间出现干焦。注意土壤湿度和温度。', '20', null, null);
INSERT INTO `product_pest` VALUES ('54', '柑橘并盾蚧', '发现少量虫体时，应及时刮除。发生量较大时，喷施50%亚胶硫磷乳油800倍液。喷2-3次为宜。', '20', null, null);
INSERT INTO `product_pest` VALUES ('55', '叶斑病、锈病、红蜘蛛、蛞蝓等', '用50%代森锌可湿性粉剂1000倍液喷洒。', '21', null, null);
INSERT INTO `product_pest` VALUES ('56', '叶枯病', '喷洒200倍波尔多液，或50%多菌灵可湿性粉剂500一600倍液，或喷洒50%托布津可湿性粉剂1000倍液进行防治。', '22', null, null);
INSERT INTO `product_pest` VALUES ('57', '夏季易发生介壳虫、蚜虫等虫害', '40%氧化乐果1000倍液喷杀。', '22', null, null);
INSERT INTO `product_pest` VALUES ('58', '种球腐烂病', '地下根系生长很少或根本不生根。空气湿度小于70%，贮藏时保持空气流通。', '23', null, null);
INSERT INTO `product_pest` VALUES ('59', '冠腐', '出现枯萎、倒伏。病害很快传播到相邻植株上。仔细清除受病植株及其周围土壤。', '23', null, null);
INSERT INTO `product_pest` VALUES ('60', '镰孢性基腐病', '受病部位组织变软，灰褐色，向内抽，有时被覆白色织状物。广泛采用唐菖蒲、小苍兰交替轮作，或一年进行一次土壤处理。 种植前进行种球处理。', '23', null, null);
INSERT INTO `product_pest` VALUES ('61', '灰霉病', '受葡萄孢属侵染的植株整个或局部可见斑块。', '23', null, null);
INSERT INTO `product_pest` VALUES ('62', '丝核菌病', '对已被侵染或可能已被侵染的土壤中进行常规土壤处理。', '23', null, null);
INSERT INTO `product_pest` VALUES ('63', '蜀葵锈病和红蜘蛛', '发现之后要立即喷洒波尔多液或者哒螨灵。', '24', null, null);
INSERT INTO `product_pest` VALUES ('64', '叶枯病', '主要表现为叶尖、叶缘常见发病，逐渐发展为褪绿色黄斑，扩大后呈黄褐色不规则形斑块，严重时病叶干枯，病部生黑色小粒。夏末开始，用1:1:200的波尔多液或2%FeSO4溶液1000倍液或50%退菌特1000倍液，每7-10天喷1次。', '25', null, null);
INSERT INTO `product_pest` VALUES ('65', '炭疽病', '主要表现为叶片出现边缘暗褐色，中央为浅褐色或灰白色病斑，病斑周围可见褪绿晕圈。后期斑上可见成轮纹状排列的黑色小粒点。平时可选用1:1:200倍式波尔多液进行防治。', '25', null, null);
INSERT INTO `product_pest` VALUES ('66', '线虫病', '病状主要表现为植株生长缓慢，株矮、萎黄、叶片数减少、花数减少、花茎变短、生长衰弱，甚至不能开花。可用1%丁基加保扶粉剂或24%欧杀灭溶液防治。', '25', null, null);
INSERT INTO `product_pest` VALUES ('67', '棉铃虫', '生长季节中可用25%杀虫脒或50%毒杀芬乳剂400倍液，90%结晶敌百虫或25%亚胺硫磷乳剂1000倍液。可在田边设置黑光灯诱蛾或用阴干的杨树枝把诱蛾，集中消灭棉铃虫成虫。', '25', null, null);
INSERT INTO `product_pest` VALUES ('68', '黄胸蓟马、花蓟马', '花葶刚抽出时用10%氯氢菊酯EC200-300倍液或1.8%爱福丁EC3000倍液防治。', '25', null, null);
INSERT INTO `product_pest` VALUES ('69', '萼腐病、锈病、灰霉病、芽腐病、根腐病', '用代森锌防治萼腐病，五氧化锈灵防锈锈病。防治其它病害中用代森锌、多菌灵或克菌丹在栽插前进行土壤处理。', '26', null, null);
INSERT INTO `product_pest` VALUES ('70', '红蜘蛛、蚜虫', '一般用40%乐果乳剂1000倍液杀除。', '26', null, null);
INSERT INTO `product_pest` VALUES ('71', '细菌性软腐病', '染病后叶片由绿色变为浅黄色至灰黄色，近地面的茎基部出现水浸状软腐病，后期受害病叶易倒折。发病初期，可选用医用硫酸链霉素2000倍液、47%加瑞农可湿性粉剂700倍液或30%绿得悬浮剂500倍液，每隔5-7天喷一次，连喷2-3次防治。', '27', null, null);
INSERT INTO `product_pest` VALUES ('72', '镰孢斑点病', '镰孢斑点病又称叶斑病，最先在叶片发现圆形病斑，直径可扩大到12毫米。降低土壤湿度。发病初期，可选用波尔多液、53.8%可杀得2000干悬浮剂1000倍液或47%加瑞农可湿性粉剂700倍液，连喷2-3次，每隔5-7天喷一次。', '27', null, null);
INSERT INTO `product_pest` VALUES ('73', '炭疽病', '病斑开始于叶尖或叶缘，褐色，斑面现明显或不明显的轮纹，其病叶上形成有散生或排列规则的小黑点。冬春季剪除病部叶片及枯病叶，增施磷钾肥，发病初期及时喷施50%炭疽福美可湿性粉剂800倍液，或75%的百菌清+70%托布津可湿性粉剂（1：1）1000倍液。', '27', null, null);
INSERT INTO `product_pest` VALUES ('74', '矢尖蚧', '成虫、若虫群集嫩枝和叶片刺吸汁液，使叶片变灰绿色或黄色，致使全株枯萎。可用40%乐果乳油500-1000倍液或50%马拉硫磷乳油600-800倍液、80%敌敌畏乳油800倍液、25%亚胺硫磷或杀虫净或30%苯溴磷等乳油400-600倍液、50%稻丰散乳油1500-2000倍液。', '27', null, null);
INSERT INTO `product_pest` VALUES ('75', '叶斑病', '	用50%多菌灵1000倍液喷洒防治。', '28', null, null);
INSERT INTO `product_pest` VALUES ('76', '介壳虫、粉虱和卷叶螟', '可用25%亚胺硫磷乳油1000倍液喷杀。', '28', null, null);
INSERT INTO `product_pest` VALUES ('78', '基腐病', '主要危害茎基部，根颈部皮层及木质部变黑褐色，地上部萎蔫，严重时全株枯死。及时拔除病株烧毁。换用新盆土或经过消毒的盆土。', '29', null, null);
INSERT INTO `product_pest` VALUES ('79', '黑斑病', '叶片初为黑褐色小斑点，不久扩大为不规则的大斑，红褐色，中心变灰白色坏死。用65%代森锌600倍液，或70.5%代森锰锌600倍液喷1次，喷药时要将叶片的正反面都喷到。', '29', null, null);
INSERT INTO `product_pest` VALUES ('80', '黄化病', '受病植株叶片黄化。防治传播介体叶蝉，减少田间传播。常用的药剂有50%辛硫磷800倍液，或50%敌敌畏1000倍液等。', '29', null, null);
INSERT INTO `product_pest` VALUES ('81', '黑霉病、黄化病', '喷洒0.5度波尔多液，或用5%的酒精擦洗霉污；用0.1%～0.2%硫酸亚铁溶液喷施防治黄化病。', '30', null, null);
INSERT INTO `product_pest` VALUES ('82', '介壳虫、蚜虫及红蜘蛛', '用80%敌敌畏1000～1500倍液喷杀。', '30', null, null);
INSERT INTO `product_pest` VALUES ('83', '煤烟病', '发生在枝条与叶片，发现后可用清水擦洗，或喷0.3波美度石硫合剂，1000～1200倍多菌灵。', '31', null, null);
INSERT INTO `product_pest` VALUES ('84', '腐烂病', '常在下部主干上发生，出现茎秆膨大、开裂，发现后立即刮除或涂5～10度石硫合剂，数次方能奏效。', '31', null, null);
INSERT INTO `product_pest` VALUES ('85', '蚜虫、跳甲虫和天蛾幼虫', '前两种可用乐果、敌百虫，后一种可用666粉防治或人工捕捉。', '31', null, null);
INSERT INTO `product_pest` VALUES ('86', '褐叶圆蚧', '植株叶子颜色变浅，并有浅色斑点产生，症状严重时植物十分衰弱，影响植株的生长并且失去观赏价值。利用红点唇瓢虫进行捕食，以虫治虫。', '32', null, null);
INSERT INTO `product_pest` VALUES ('87', '炭疽病', '发病初期叶尖呈黑褐色，随后病斑慢慢扩展，直到后期病斑连成一片。加强对植株的养护，注意不要将叶片碰伤，多对叶片喷水，使其保持清洁。', '32', null, null);
INSERT INTO `product_pest` VALUES ('88', '叶枯病', '初期可用波尔多液防治，严重时可用70%的甲基托布津1000-1500倍液防治。', '33', null, null);
INSERT INTO `product_pest` VALUES ('89', '介壳虫', '可用40%的氧化乐果1000倍液进行防治。', '33', null, null);
INSERT INTO `product_pest` VALUES ('90', '叶霉病', '叶霉病是芍药常见的一种病害，发病初期叶片上会出现紫褐色的斑点，随后会逐渐扩大，斑点的中央呈现淡褐色，边缘为暗紫褐色，有波纹。及时菌清或多菌灵800~1000倍液，并注意加强通风透气。', '34', null, null);
INSERT INTO `product_pest` VALUES ('91', '白绢病', '白绢病主要出现在土表，仔细观察会发现土表及根茎部会出现白色的柳絮物，渐渐的植株萎蔫。白绢病重点在预防，了每月喷洒一次多菌灵可湿性粉剂500倍液。一旦发病，要及时剪除病株，并换新土重新栽种。', '34', null, null);
INSERT INTO `product_pest` VALUES ('92', '疫病', '疫病可侵害叶、叶柄和茎。叶子发病多从下部叶面开始，出现水渍状病斑，中央灰绿色，边缘暗绿色，然后叶凋萎，枯死。可喷百菌清或多菌灵800~1000倍液，还可以喷洒400倍液铜汞剂防治。', '34', null, null);
INSERT INTO `product_pest` VALUES ('93', '叶斑病和白粉病', '发病初期用50%多菌灵可湿性粉剂1000倍液或70%代森锰锌可湿性粉剂700倍液喷洒。虫害有介壳虫危害，可用25%噻嗪酮可湿性粉剂1500倍液喷杀。', '35', null, null);
INSERT INTO `product_pest` VALUES ('94', '介壳虫', '介壳虫常寄生在叶片叶鞘和茎上，特别是在叶鞘叶背等阴暗处。注意通风，及早发现虫体，少量发生时用毛刷刷去虫体，再用水冲洗干净。', '35', null, null);
INSERT INTO `product_pest` VALUES ('95', '蚜虫', '虫害少量发生时，可用水或肥皂水冲洗叶片，或摘除受害部分。化学防治时可以用溴氰菊酯1000~1500倍、40%氧化乐果2000倍或敌百虫1000倍药液喷洒防治，每隔5~7d1次，连续喷杀3次，有较好的防治效果。', '35', null, null);
INSERT INTO `product_pest` VALUES ('96', '叶斑病和灰霉病', '可用70%代森锌可湿性粉剂700倍液喷洒，平时可用等量式波尔多液喷洒预防。', '36', null, null);
INSERT INTO `product_pest` VALUES ('97', '粉虱和蓟马', '用40%氧化乐果乳油1500倍液喷杀。', '36', null, null);
INSERT INTO `product_pest` VALUES ('98', '叶斑病、灰斑病和茎枯病', '可用65%代森锌可湿性粉剂600倍液喷洒。', '37', null, null);
INSERT INTO `product_pest` VALUES ('99', '蚧壳虫', '少量时可用旧牙刷清洗后用40%氧化乐果乳油1000倍液喷杀。', '37', null, null);
INSERT INTO `product_pest` VALUES ('100', '褐斑病', '红斑点是褐斑病的表现症状，需要及时喷施多菌灵或敌力脱、爱美、农用链霉素等强力杀菌剂进行防治。', '38', null, null);
INSERT INTO `product_pest` VALUES ('101', '红蜘蛛、介壳虫', '喷洒氧化乐果。', '38', null, null);
INSERT INTO `product_pest` VALUES ('102', '枯萎病', '枯萎病是铁线莲最主要的病害，它会突然发生，可以使整个植株萎缩，尽管植株仍有很好根系，用多菌灵或托布津每隔2周喷洒1次，重复2~3次，可有效抑制该病的发生。', '39', null, null);
INSERT INTO `product_pest` VALUES ('103', '粉霉病', '粉霉病是另外一个危害铁线莲较多的病害，在温度超过20℃，高湿的情况下容易发生该病，发病时可以用多菌灵、甲基托布津每隔1周交替使用，重复3~4次。', '39', null, null);
INSERT INTO `product_pest` VALUES ('104', '病虫害较少', '按照防治一般害虫处理', '40', null, null);
INSERT INTO `product_pest` VALUES ('105', '三角梅叶斑病', '病斑初为黄褐色，周围有黄绿色晕圈，后扩展成近圆形或不规则的病斑，边缘暗褐色。一般可用50﹪的多菌灵湿性粉剂500倍液进行防治，每7～10天喷1次。', '41', null, null);
INSERT INTO `product_pest` VALUES ('106', '三角梅褐斑病', '褐斑病主要危害三角梅叶片，在叶面上产生直径为0.1～0.5cm的黄褐色至浅褐色病斑.发现少量病叶及时摘除烧毁，发病初期，用70﹪的代锰森锌可湿性粉剂400倍液，每10天喷一次，连续3～4次。', '41', null, null);
INSERT INTO `product_pest` VALUES ('107', '蚜虫', '喷洒吡虫啉进行救治。还要改变养护方法，避免再次感染。', '42', null, null);
INSERT INTO `product_pest` VALUES ('108', '化水', '及时摘除化水叶片。', '43', null, null);
INSERT INTO `product_pest` VALUES ('109', '叶片化水、蚧壳虫', '如果有化水，及时摘除化水叶片，防治通风处，有蚧壳虫及时冲水清洗，喷药', '44', null, null);
INSERT INTO `product_pest` VALUES ('110', '化水', '及时摘除化水叶片。', '45', null, null);
INSERT INTO `product_pest` VALUES ('111', '叶片化水、蚧壳虫', '如果有化水，及时摘除化水叶片，防治通风处，有蚧壳虫及时冲水清洗，喷药', '46', null, null);
INSERT INTO `product_pest` VALUES ('112', '化水', '及时摘除化水叶片。', '47', null, null);
INSERT INTO `product_pest` VALUES ('113', '烂根病', '应改善栽培环境，选用疏松透气性好的土壤栽种，不要长期积水。此外，植株中心若长期积水会造成心处腐烂。', '48', null, null);
INSERT INTO `product_pest` VALUES ('114', '根粉蚧', '可在种植前对土壤进行高温杀虫处理，并在土壤中加入杀虫药物。', '48', null, null);
INSERT INTO `product_pest` VALUES ('115', '根结线虫病', '鹿角海棠盆栽湿度过大时，常发生根结线虫病，可用3%呋喃丹颗粒剂进行防治。虫害有介壳虫危害，可用55%杀螟松乳油1500倍液喷杀。', '49', null, null);
INSERT INTO `product_pest` VALUES ('116', '斑点病', '采用药剂喷洒治疗是比较常用的方式。使用代森锌药剂进行喷洒治疗即可，最好是经过稀释的65%的代森锌可湿性粉剂的600倍液。', '50', null, null);
INSERT INTO `product_pest` VALUES ('117', '化水', '及时摘除化水叶片。注意养殖环境。', '51', null, null);
INSERT INTO `product_pest` VALUES ('118', '叶片化水、蚧壳虫', '如果有化水，及时摘除化水叶片，防治通风处，有蚧壳虫及时冲水清洗，喷药', '52', null, null);
INSERT INTO `product_pest` VALUES ('119', '炭疽病', '病症多出现于叶缘、叶尖和叶脉两侧。初现暗绿色斑纹，后逐渐扩大成不规则大班，颜色由褐色变为黑色.①彻底清除病叶。②冬季剪除病枯枝。③在每年发病期前，喷洒1%的波尔多液，每半个月一次。', '53', null, null);
INSERT INTO `product_pest` VALUES ('120', '根腐病', '受害植株根部腐烂变黑，叶片变黄，梢尖死亡，花芽掉落，植株逐渐凋萎死亡。①要及时挖除病株及其附近的带菌土，并用1%硫酸铜溶液对病株周围的土壤消毒，防止病菌扩散蔓延。②保持土壤排水良好，严防栽培地积水。', '53', null, null);
INSERT INTO `product_pest` VALUES ('121', '蚜虫', '①在蚜早发生盛期，用50%磷胺乳剂2000倍液或50%乐果乳剂1000倍液喷洒茶花植株，每3～5天喷洒1次，连续3次，可消灭蚜虫。②以烟筋0.5千克，生石灰0.25千克，加水10～15升，浸泡一昼夜，过滤去渣后用以喷雾防治，其效果好。', '53', null, null);
INSERT INTO `product_pest` VALUES ('122', '蚜虫、红蜘蛛、卷叶虫等', '可用呋喃丹等农药，作盆土消毒处理，每盆用量为2～3克(土壤重量的O.1％)，拌入土壤中。', '54', null, null);
INSERT INTO `product_pest` VALUES ('123', '软腐病、叶斑病、真菌萎缩病和炭疽病', '发病时可用0.01％浓度的托布津水溶液，或0.15％～0.2％浓度的退菌特、百菌清水溶液进行有效喷治。', '54', null, null);
INSERT INTO `product_pest` VALUES ('124', '叶螨、蚜虫、介壳虫', '可用呋喃丹等农药，作盆土消毒处理，每盆用量为2～3克(土壤重量的O.1％)，拌入土壤中。', '55', null, null);
INSERT INTO `product_pest` VALUES ('125', '茎腐病', '喷施杀菌类药物，降低土壤的温度，不然会灼伤红豆杉的苗根，并且还可以增施肥料，增强红豆杉幼苗的抵抗力。', '55', null, null);
INSERT INTO `product_pest` VALUES ('126', '苗期枯萎病', '用25%托布津可湿性粉剂1000倍液喷洒。通常子叶出苗后每周用1000倍液百菌清或甲托喷施，连续2-3 次。', '56', null, null);
INSERT INTO `product_pest` VALUES ('127', '蚜虫', '常采用35% 卵虫净乳油1000-1500倍液，2.5%天王星乳油3000倍液，50%灭蚜灵乳油1000-1500倍液，10%氯氢菊酯乳油3000倍液，2.5%功夫乳油3000倍液，40%毒死蜱乳油1500倍液，40%氧化乐果1000倍液，2.5%鱼藤精乳油1500倍喷杀。', '56', null, null);
INSERT INTO `product_pest` VALUES ('128', '叶斑病', '每半个月喷洒1次波尔多液（1:1:100）。', '57', null, null);
INSERT INTO `product_pest` VALUES ('129', '盲蝽、粉虱和介壳虫', '用40%氧化乐果乳剂1500倍液喷杀。', '57', null, null);
INSERT INTO `product_pest` VALUES ('130', '灰霉病', '用800～1000百菌清、甲基托布津连续喷洒3～4次防治。', '58', null, null);
INSERT INTO `product_pest` VALUES ('131', '白粉病', '可用粉绣宁等喷洒防治。', '58', null, null);
INSERT INTO `product_pest` VALUES ('132', '病毒病', '主要采取及时拔除病株烧毁，喷洒杀虫剂防止昆虫传病等措施防治。', '58', null, null);
INSERT INTO `product_pest` VALUES ('133', '叶斑病', '用百菌清或多菌灵800倍液叶面喷雾，连续2-3次既可，每次隔7天。', '59', null, null);
INSERT INTO `product_pest` VALUES ('134', '炭疽病', '用75%的甲基托布津500倍液叶面喷雾，每隔7天一次，连续2-3次，基本可以控制。', '59', null, null);
INSERT INTO `product_pest` VALUES ('135', '枯萎病', '用小刀将病处切除，病处与非病处界限非常明显，一般用手就可以掰掉。', '59', null, null);

-- ----------------------------
-- Table structure for `product_property`
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=532 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES ('1', '中文学名', '风信子', '1', null, null);
INSERT INTO `product_property` VALUES ('2', '拉丁学名', 'Hyacinthus orientalis L.', '1', null, null);
INSERT INTO `product_property` VALUES ('3', '别称', '无', '1', null, null);
INSERT INTO `product_property` VALUES ('4', '科属', '风信子科风信子属', '1', null, null);
INSERT INTO `product_property` VALUES ('5', '分布区域', '原产南欧地中海东部沿岸。现世界均有栽培。', '1', null, null);
INSERT INTO `product_property` VALUES ('6', '是否开花', '开花', '1', null, null);
INSERT INTO `product_property` VALUES ('7', '中文学名', '茉莉花', '2', null, null);
INSERT INTO `product_property` VALUES ('8', '拉丁学名', 'Jasminum sambac (L.) Ait.', '2', null, null);
INSERT INTO `product_property` VALUES ('9', '别称', '香魂、茉莉、木犁花、莫利花、没丽', '2', null, null);
INSERT INTO `product_property` VALUES ('10', '科属', '木犀科素馨属', '2', null, null);
INSERT INTO `product_property` VALUES ('11', '分布区域', '原产印度、中国南方和世界各地广泛栽培。现广泛植栽于亚热带地区。', '2', null, null);
INSERT INTO `product_property` VALUES ('12', '是否开花', '开花', '2', null, null);
INSERT INTO `product_property` VALUES ('13', '中文学名', '水仙', '3', null, null);
INSERT INTO `product_property` VALUES ('14', '拉丁学名', 'Narcissus tazetta  L. var. chinensis Roem.', '3', null, null);
INSERT INTO `product_property` VALUES ('15', '别称', '无', '3', null, null);
INSERT INTO `product_property` VALUES ('16', '科属', '石蒜科水仙属', '3', null, null);
INSERT INTO `product_property` VALUES ('17', '分布区域', '原产亚洲东部的海滨温暖地区；中国浙江、福建沿海岛屿自生', '3', null, null);
INSERT INTO `product_property` VALUES ('18', '是否开花', '开花', '3', null, null);
INSERT INTO `product_property` VALUES ('19', '中文学名', '百合', '4', null, null);
INSERT INTO `product_property` VALUES ('20', '拉丁学名', 'Lilium brownii var. viridulum', '4', null, null);
INSERT INTO `product_property` VALUES ('21', '别称', '强瞿、番韭、山丹、倒仙', '4', null, null);
INSERT INTO `product_property` VALUES ('22', '科属', '百合科百合属', '4', null, null);
INSERT INTO `product_property` VALUES ('23', '分布区域', '亚洲东部，欧洲，北美洲，北半球', '4', null, null);
INSERT INTO `product_property` VALUES ('24', '是否开花', '开花', '4', null, null);
INSERT INTO `product_property` VALUES ('25', '中文学名', '绿萝', '5', null, null);
INSERT INTO `product_property` VALUES ('26', '拉丁学名', 'Scindapsus ', '5', null, null);
INSERT INTO `product_property` VALUES ('27', '别称', '魔鬼藤、黄金葛、黄金藤、桑叶', '5', null, null);
INSERT INTO `product_property` VALUES ('28', '科属', '天南星科麒麟叶属', '5', null, null);
INSERT INTO `product_property` VALUES ('29', '分布区域', '原产于所罗门群岛，中国广东、福建、上海栽培', '5', null, null);
INSERT INTO `product_property` VALUES ('30', '是否开花', '否', '5', null, null);
INSERT INTO `product_property` VALUES ('31', '中文学名', '吊兰', '6', null, null);
INSERT INTO `product_property` VALUES ('32', '拉丁学名', 'Chlorophytum comosum（Thunb.）Baker.', '6', null, null);
INSERT INTO `product_property` VALUES ('33', '别称', '垂盆草、挂兰、钓兰、兰草、折鹤兰、蜘蛛草，飞机草', '6', null, null);
INSERT INTO `product_property` VALUES ('34', '科属', '百合科吊兰属', '6', null, null);
INSERT INTO `product_property` VALUES ('35', '分布区域', '原产非洲南部，世界各地广泛栽培 ', '6', null, null);
INSERT INTO `product_property` VALUES ('36', '是否开花', '是', '6', null, null);
INSERT INTO `product_property` VALUES ('37', '中文学名', '茅膏菜', '7', null, null);
INSERT INTO `product_property` VALUES ('38', '拉丁学名', 'Drosera', '7', null, null);
INSERT INTO `product_property` VALUES ('39', '别称', '毛毡苔、石龙芽草、山胡椒、胡椒草、夏无踪、白花叶、黄金丝等 ', '7', null, null);
INSERT INTO `product_property` VALUES ('40', '科属', '茅膏菜科茅膏菜属', '7', null, null);
INSERT INTO `product_property` VALUES ('41', '分布区域', '除南极洲外所有大洲', '7', null, null);
INSERT INTO `product_property` VALUES ('42', '是否开花', '开花', '7', null, null);
INSERT INTO `product_property` VALUES ('43', '中文学名', '仙人球', '8', null, null);
INSERT INTO `product_property` VALUES ('44', '拉丁学名', 'Echinopsis tubiflora', '8', null, null);
INSERT INTO `product_property` VALUES ('45', '别称', '\r\n\r\n草球、长盛丸、短毛丸、珍珠戟', '8', null, null);
INSERT INTO `product_property` VALUES ('46', '科属', '仙人掌科仙人球属', '8', null, null);
INSERT INTO `product_property` VALUES ('47', '分布区域', '产于南美洲，一般生长在高热、干燥、少雨的沙漠地带', '8', null, null);
INSERT INTO `product_property` VALUES ('48', '是否开花', '开花', '8', null, null);
INSERT INTO `product_property` VALUES ('49', '中文学名', '菊花', '9', null, null);
INSERT INTO `product_property` VALUES ('50', '拉丁学名', 'Dendranthema morifolium  (Ramat.) Tzvel.', '9', null, null);
INSERT INTO `product_property` VALUES ('51', '别称', '寿客、金英、黄华、陶菊、日精、女华、延年、隐逸花、家菊', '9', null, null);
INSERT INTO `product_property` VALUES ('52', '科属', '菊科菊属', '9', null, null);
INSERT INTO `product_property` VALUES ('53', '分布区域', '菊花遍布中国各城镇与农村', '9', null, null);
INSERT INTO `product_property` VALUES ('54', '是否开花', '开花', '9', null, null);
INSERT INTO `product_property` VALUES ('55', '中文学名', '皱叶冷水花', '10', null, null);
INSERT INTO `product_property` VALUES ('56', '拉丁学名', 'Pilea mollis', '10', null, null);
INSERT INTO `product_property` VALUES ('57', '别称', '无', '10', null, null);
INSERT INTO `product_property` VALUES ('58', '科属', '荨麻科冷水花属', '10', null, null);
INSERT INTO `product_property` VALUES ('59', '分布区域', '哥斯达黎加、哥伦比亚', '10', null, null);
INSERT INTO `product_property` VALUES ('60', '是否开花', '开花', '10', null, null);
INSERT INTO `product_property` VALUES ('61', '形态特征', '风信子是多年草本生球根类植物，鳞茎球形或扁球形，有膜质外皮，外被皮膜呈紫蓝色或白色等，皮膜颜色与花色成正相关。', '1', null, null);
INSERT INTO `product_property` VALUES ('62', '生长环境', '风信子习性喜阳、耐寒，适合生长在凉爽湿润的环境和疏松、肥沃的砂质土中，忌积水。', '1', null, null);
INSERT INTO `product_property` VALUES ('63', '适用地点', '书房、卧室', '1', null, null);
INSERT INTO `product_property` VALUES ('64', '形态特征', '直立或攀援灌木，高达3米。小枝圆柱形或稍压扁状，有时中空，疏被柔毛。', '2', null, null);
INSERT INTO `product_property` VALUES ('65', '生长环境', '盛夏季每天要早、晚浇水，如空气干燥，需补充喷水；冬季休眠期，要控制浇水量。', '2', null, null);
INSERT INTO `product_property` VALUES ('66', '适用地点', '书房、卧室', '2', null, null);
INSERT INTO `product_property` VALUES ('67', '形态特征', '鳞茎卵球形。叶宽线形，扁平，钝头，全缘，粉绿色。花茎几与叶等长；伞形花序有花4-8朵；佛焰苞状总苞膜质；花梗长短不一；花被管细，灰绿色，近三棱形；副花冠浅杯状，淡黄色，不皱缩，长不及花被的一半。', '3', null, null);
INSERT INTO `product_property` VALUES ('68', '生长环境', '水仙为秋植球根类温室花卉，喜阳光充足，生命力顽强，能耐半阴，不耐寒。白天水仙花盆要放置在阳光充足的向阳处给予充足的光照。', '3', null, null);
INSERT INTO `product_property` VALUES ('69', '适用地点', '书房、卧室', '3', null, null);
INSERT INTO `product_property` VALUES ('70', '形态特征', '多年生草本，株高70~150厘米。鳞茎球形，淡白色，先端常开放如莲座状，由多数肉质肥厚、卵匙形的鳞片聚合而成。', '4', null, null);
INSERT INTO `product_property` VALUES ('71', '生长环境', '喜凉爽，较耐寒。高温地区生长不良。喜干燥，怕水涝。', '4', null, null);
INSERT INTO `product_property` VALUES ('72', '适用地点', '书房、卧室', '4', null, null);
INSERT INTO `product_property` VALUES ('73', '形态特征', '高大藤本，茎攀援，节间具纵槽；多分枝，枝悬垂。幼枝鞭状，细长，粗3-4毫米，节间长15-20厘米。', '5', null, null);
INSERT INTO `product_property` VALUES ('74', '生长环境', '绿萝属阴性植物，喜湿热的环境，忌阳光直射，喜阴。喜富含腐殖质、疏松肥沃、微酸性的土壤。越冬温度不应低于15℃。', '5', null, null);
INSERT INTO `product_property` VALUES ('75', '适用地点', '书房，窗台', '5', null, null);
INSERT INTO `product_property` VALUES ('76', '形态特征', '根壮茎短，根稍肥厚，叶剑形，花白色，常2-4朵簇生，排成疏散的总状花序或圆锥花序。', '6', null, null);
INSERT INTO `product_property` VALUES ('77', '生长环境', '吊兰性喜温暖湿润、半阴的环境。它适应性强，较耐旱，不甚耐寒。不择土壤，在排水良好、疏松肥沃的砂质土壤中生长较佳。', '6', null, null);
INSERT INTO `product_property` VALUES ('78', '适用地点', '厨房，居室', '6', null, null);
INSERT INTO `product_property` VALUES ('79', '形态特征', '多年生草本，直立，有时攀援状，高9-32厘米，淡绿色，具紫红色汁液；鳞茎，状球茎紫色，球形，直径1-8毫米；茎地下部分长1-4厘米，地上部分通常直，无毛或具乳突状黑色腺点，顶部3至多分枝。', '7', null, null);
INSERT INTO `product_property` VALUES ('80', '生长环境', '生长于海拔50-1600米的山坡、山腰、山顶和溪边等草丛、灌丛和疏林下。', '7', null, null);
INSERT INTO `product_property` VALUES ('81', '适用地点', '窗台', '7', null, null);
INSERT INTO `product_property` VALUES ('82', '形态特征', '仙人球就其外观看，可分为绒类、疣类、宝类、毛柱类、强刺类、海胆类、顶花类等：仙人球的刺毛也有长、短、稀、密之分；颜毛有红、黄、金黄等。', '8', null, null);
INSERT INTO `product_property` VALUES ('83', '生长环境', '一般生长在高热、干燥、肥沃的土地。少雨的沙漠地带。', '8', null, null);
INSERT INTO `product_property` VALUES ('84', '适用地点', '书房、卧室', '8', null, null);
INSERT INTO `product_property` VALUES ('85', '形态特征', '菊花为多年生草本，高 60-150厘米。茎直立，分枝或不分枝，被柔毛。叶互生，有短柄，叶片卵形至披针形。', '9', null, null);
INSERT INTO `product_property` VALUES ('86', '生长环境', '喜阳光，忌荫蔽，较耐旱，怕涝。喜温暖湿润气候，但亦能耐寒，严冬季节根茎能在地下越冬。花能经受微霜，但幼苗生长和分枝孕蕾期需较高的气温。最适生长温度为20℃左右。', '9', null, null);
INSERT INTO `product_property` VALUES ('87', '适用地点', '书房、卧室', '9', null, null);
INSERT INTO `product_property` VALUES ('88', '形态特征', '多年生常绿草本，株高20-50厘米。叶十字形对生，卵形至长卵形。', '10', null, null);
INSERT INTO `product_property` VALUES ('89', '生长环境', '冷水花性喜温暖、湿润的气候，喜疏松肥沃的沙土，生长适宜15℃至25℃，冬季不可低于5℃。', '10', null, null);
INSERT INTO `product_property` VALUES ('90', '适用地点', '书房、卧室', '10', null, null);
INSERT INTO `product_property` VALUES ('91', '中文学名', '君子兰', '11', null, null);
INSERT INTO `product_property` VALUES ('92', '拉丁学名', 'Clivia miniata', '11', null, null);
INSERT INTO `product_property` VALUES ('93', '别称', '大花君子兰、大叶石蒜、剑叶石蒜、达木兰', '11', null, null);
INSERT INTO `product_property` VALUES ('94', '科属', '石蒜科君子兰属', '11', null, null);
INSERT INTO `product_property` VALUES ('95', '分布区域', '君子兰原产于非洲南部亚热带山地森林中，为多年生常绿草本植物。有从欧洲和日本传入的二个种，英国、美国也有，栽培最普遍。', '11', null, null);
INSERT INTO `product_property` VALUES ('96', '是否开花', '开花', '11', null, null);
INSERT INTO `product_property` VALUES ('97', '形态特征', '君子兰根肉质纤维状，为乳白色，十分粗壮。君子兰茎基部宿存的叶基部扩大互抱成假鳞茎状。叶片从根部短缩的茎上呈二列叠出，排列整齐，宽阔呈带形，顶端圆润。', '11', null, null);
INSERT INTO `product_property` VALUES ('98', '生长环境', '既怕炎热又不耐寒，喜欢半阴而湿润的环境，畏强烈的直射阳光，生长的最佳温度在18-28℃之间，10℃以下，30℃以上，生长受抑制。', '11', null, null);
INSERT INTO `product_property` VALUES ('99', '适用地点', '客厅、卧室', '11', null, null);
INSERT INTO `product_property` VALUES ('100', '中文学名', '蝴蝶兰', '12', null, null);
INSERT INTO `product_property` VALUES ('101', '拉丁学名', 'Phalaenopsis aphrodite Rchb. f.', '12', null, null);
INSERT INTO `product_property` VALUES ('102', '别称', '蝶兰、台湾蝴蝶兰', '12', null, null);
INSERT INTO `product_property` VALUES ('103', '科属', '兰科蝴蝶兰属', '12', null, null);
INSERT INTO `product_property` VALUES ('104', '分布区域', '蝴蝶兰是在1750年发现的，迄今已发现七十多个原生种，大多数产于潮湿的亚洲地区。', '12', null, null);
INSERT INTO `product_property` VALUES ('105', '是否开花', '开花', '12', null, null);
INSERT INTO `product_property` VALUES ('106', '形态特征', '茎很短，常被叶鞘所包，花序侧生于茎的基部，长达50厘米，不分枝或有时分枝。', '12', null, null);
INSERT INTO `product_property` VALUES ('107', '生长环境', '蝴蝶兰出生于热带雨林地区，本性喜暖畏寒。生长适温为15~20℃，冬季10℃以下就会停止生长，低于5℃容易死亡。', '12', null, null);
INSERT INTO `product_property` VALUES ('108', '适用地点', '客厅、阳台', '12', null, null);
INSERT INTO `product_property` VALUES ('109', '中文学名', '白鹤芋', '13', null, null);
INSERT INTO `product_property` VALUES ('110', '拉丁学名', 'Spathiphyllum kochii Engl. & K.Krause', '13', null, null);
INSERT INTO `product_property` VALUES ('111', '别称', '白掌、和平芋、苞叶芋、一帆风顺、百合意图', '13', null, null);
INSERT INTO `product_property` VALUES ('112', '科属', '天南星科苞叶芋属', '13', null, null);
INSERT INTO `product_property` VALUES ('113', '分布区域', '原产美洲热带地区，世界各地广泛栽培。', '13', null, null);
INSERT INTO `product_property` VALUES ('114', '是否开花', '开花', '13', null, null);
INSERT INTO `product_property` VALUES ('115', '形态特征', '株高30厘米-40厘米，无茎或茎短小，叶长圆或近披针形，具明显的中脉和叶柄，深绿色。春夏开花，佛焰苞大而显著，高出叶面，白色或微绿色，肉穗花序乳黄色。', '13', null, null);
INSERT INTO `product_property` VALUES ('116', '生长环境', '喜高温高湿，也比较耐阴。白鹤芋叶片较大，对湿度比较敏感，怕强光暴晒，夏季遮荫60-70%，但长期光照不足，则不易开花。', '13', null, null);
INSERT INTO `product_property` VALUES ('117', '适用地点', '卧室、书房、办公室', '13', null, null);
INSERT INTO `product_property` VALUES ('118', '中文学名', '观音竹', '14', null, null);
INSERT INTO `product_property` VALUES ('119', '拉丁学名', 'Bambusa multiplex (Lour.) Raeusch. ex Schult. var. riviereorum R. Maire', '14', null, null);
INSERT INTO `product_property` VALUES ('120', '别称', '筋头竹', '14', null, null);
INSERT INTO `product_property` VALUES ('121', '科属', '竹亚科簕竹属', '14', null, null);
INSERT INTO `product_property` VALUES ('122', '分布区域', '原产中国华南地区。多生于丘陵山地溪边。', '14', null, null);
INSERT INTO `product_property` VALUES ('123', '是否开花', '否', '14', null, null);
INSERT INTO `product_property` VALUES ('124', '形态特征', '竿高4-7米，直径1.5-2.5厘米，尾梢近直或略弯，下部挺直，绿色；节间长30-50厘米，幼时薄被白蜡粉，并于上半部被棕色至暗棕色小刺毛，后者在近节以下部分尤其较为密集，老时则光滑无毛，竿壁稍薄；节处稍隆起，无毛；分枝自竿基部第二或第三节即开始，数枝乃至多枝簇生，主枝稍较粗长。', '14', null, null);
INSERT INTO `product_property` VALUES ('125', '生长环境', '耐寒性较强，喜光而耐半阴。生长快，耐修剪。', '14', null, null);
INSERT INTO `product_property` VALUES ('126', '适应地点', '客厅、卧室、书房', '14', null, null);
INSERT INTO `product_property` VALUES ('127', '中文学名', '芦荟', '15', null, null);
INSERT INTO `product_property` VALUES ('128', '拉丁学名', 'Aloe vera（Haw.） Berg', '15', null, null);
INSERT INTO `product_property` VALUES ('129', '别称', '油葱、洋芦荟、库拉索芦荟、美国芦荟、翠叶芦荟、华芦荟', '15', null, null);
INSERT INTO `product_property` VALUES ('130', '科属', '阿福花科（又称日光兰科、独尾草科）芦荟属', '15', null, null);
INSERT INTO `product_property` VALUES ('131', '分布区域', '芦荟原产于非洲热带干旱地区，分布几乎遍及世界各地。', '15', null, null);
INSERT INTO `product_property` VALUES ('132', '是否开花', '开花', '15', null, null);
INSERT INTO `product_property` VALUES ('133', '形态特征', '叶簇生、大而肥厚，呈座状或生于茎顶，叶常披针形或叶短宽，边缘有尖齿状刺。花序为伞形、总状、穗状、圆锥形等，色呈红、黄或具赤色斑点，花瓣六片、雌蕊六枚。花被基部多连合成筒状。', '15', null, null);
INSERT INTO `product_property` VALUES ('134', '生长环境', '芦荟是热带、亚热带喜光植物，生长要求有充足的阳光、空气。', '15', null, null);
INSERT INTO `product_property` VALUES ('135', '适用地点', '书房、办公室、阳台', '15', null, null);
INSERT INTO `product_property` VALUES ('136', '中文学名', '常春藤', '16', null, null);
INSERT INTO `product_property` VALUES ('137', '拉丁学名', 'Hedera nepalensis K,Koch var.sinensis (Tobl.) Rehd', '16', null, null);
INSERT INTO `product_property` VALUES ('138', '别称', '土鼓藤、钻天风、三角风、散骨风、枫荷梨藤。洋常春藤', '16', null, null);
INSERT INTO `product_property` VALUES ('139', '科属', '五加科常春藤属', '16', null, null);
INSERT INTO `product_property` VALUES ('140', '分布区域', '分布地区广，北自甘肃东南部、陕西南部、河南、山东，南至广东（海南岛除外）、江西、福建，西自西藏波密，东至江苏、浙江的广大区域内均有生长。越南也有分布。', '16', null, null);
INSERT INTO `product_property` VALUES ('141', '是否开花', '开花', '16', null, null);
INSERT INTO `product_property` VALUES ('142', '形态特征', '多年生常绿攀援灌木，气生根，茎灰棕色或黑棕色，光滑，单叶互生；叶柄无托叶有鳞片；花枝上的叶椭圆状披针形，伞形花序单个顶生，花淡黄白色或淡绿白以，花药紫色；花盘隆起，黄色。果实圆球形，红色或黄色，花期9～11月，果期翌年3～5月。', '16', null, null);
INSERT INTO `product_property` VALUES ('143', '生长环境', '阴性藤本植物，也能生长在全光照的环境中，在温暖湿润的气候条件下生长良好，耐寒性较强。对土壤要求不严，喜湿润、疏松、肥沃的土壤，不耐盐碱。', '16', null, null);
INSERT INTO `product_property` VALUES ('144', '适用地点', '阳台、客厅', '16', null, null);
INSERT INTO `product_property` VALUES ('145', '中文学名', '捕蝇草', '17', null, null);
INSERT INTO `product_property` VALUES ('146', '拉丁学名', 'Dionaea muscipula', '17', null, null);
INSERT INTO `product_property` VALUES ('147', '别称', '维纳斯捕蝇草，食虫草，捕虫草，苍蝇地狱、落地珍珠、捕蟲籠', '17', null, null);
INSERT INTO `product_property` VALUES ('148', '科属', '茅膏菜科捕蝇草属', '17', null, null);
INSERT INTO `product_property` VALUES ('149', '分布区域', '捕蝇草原产于北美洲东岸一带，自然生长的原生地主要在北卡罗莱那州、南卡罗莱那州以及佛罗里达州等地，生长环境的特性喜好于潮湿地带。', '17', null, null);
INSERT INTO `product_property` VALUES ('150', '是否开花', '开花', '17', null, null);
INSERT INTO `product_property` VALUES ('151', '形态特征', '茎很短，在叶的顶端长有一个酷似“贝壳”的捕虫夹，且能分泌蜜汁，当有小虫闯入时，能以极快的速度将其夹住，并消化吸收。', '17', null, null);
INSERT INTO `product_property` VALUES ('152', '生活环境', '大多是生长在养份比较贫瘠的湿地，为了补充不足的养份，尤其是氮与磷酸，所以借由特殊演化而来的构造，捕食昆虫消化其养份。', '17', null, null);
INSERT INTO `product_property` VALUES ('153', '适用地点', '卧室向阳窗台、阳台', '17', null, null);
INSERT INTO `product_property` VALUES ('154', '中文学名', '猪笼草', '18', null, null);
INSERT INTO `product_property` VALUES ('155', '拉丁学名', 'Nepenthes sp.', '18', null, null);
INSERT INTO `product_property` VALUES ('156', '别称', '水罐植物、猴水瓶、猴子埕、猪仔笼、雷公壶', '18', null, null);
INSERT INTO `product_property` VALUES ('157', '科属', '猪笼草科猪笼草属', '18', null, null);
INSERT INTO `product_property` VALUES ('158', '分布区域', '猪笼草主要分布于东南亚一带，其中以婆罗洲（又称加里曼丹岛）和苏门答腊岛（印尼所属岛屿）最为丰富。猪笼草属植物共有野生种约170种，中国广东地区仅产一种，另外有园艺种超过1000种。', '18', null, null);
INSERT INTO `product_property` VALUES ('159', '是否开花', '开花', '18', null, null);
INSERT INTO `product_property` VALUES ('160', '形态特征', '其拥有一个独特的吸取营养的器官——捕虫笼，捕虫笼呈圆筒形，下半部稍膨大，笼口上具有盖子，因其形状像猪笼而得名。', '18', null, null);
INSERT INTO `product_property` VALUES ('161', '生长环境', '大多数猪笼草生活的环境其湿度和温度都较高，并具有明亮的散射光。一般为森林或灌木林的边缘或空地上。少数物种，如苹果猪笼草（N. ampullaria），其较喜生长于茂密阴暗的森林中。', '18', null, null);
INSERT INTO `product_property` VALUES ('162', '适用地点', '阳台、庭院', '18', null, null);
INSERT INTO `product_property` VALUES ('163', '中文学名', '凤尾竹', '19', null, null);
INSERT INTO `product_property` VALUES ('164', '拉丁学名', 'Bambusa multiplex (Lour.) Raeusch. ex Schult. \'Fernleaf\' R. A. Young', '19', null, null);
INSERT INTO `product_property` VALUES ('165', '别称', '米竹、筋头竹、蓬莱竹', '19', null, null);
INSERT INTO `product_property` VALUES ('166', '科属', '禾木科簕竹属', '19', null, null);
INSERT INTO `product_property` VALUES ('167', '分布区域', '原产中国，华东、华南、西南以至台湾、香港均有栽培。', '19', null, null);
INSERT INTO `product_property` VALUES ('168', '是否开花', '开花', '19', null, null);
INSERT INTO `product_property` VALUES ('169', '形态特征', '植株较高大，杆高可达6米，竿中空，小枝稍下弯，下部挺直，绿色；竿壁稍薄；节处稍隆起，无毛；叶鞘无毛，纵肋稍隆起，背部具脊；叶耳肾形，边缘具波曲状细长繸毛；叶舌圆拱形，叶片线形，上表面无毛，下表面粉绿而密被短柔毛，小穗含小花，中间小花为两性；外稃两侧稍不对称，长圆状披针形，先端急尖；内稃线形，脊上被短纤毛，花药紫色，子房卵球形，羽毛状。', '19', null, null);
INSERT INTO `product_property` VALUES ('170', '生长环境', '凤尾竹喜酸性、微酸性或中性土壤，盆栽的培养土以腐叶土1份、园土0.5份、及少量河沙和砻糠灰等混合配制而成。忌粘重、碱性土壤。', '19', null, null);
INSERT INTO `product_property` VALUES ('171', '适用地点', '庭院、客厅', '19', null, null);
INSERT INTO `product_property` VALUES ('172', '中文学名', '尾葵', '20', null, null);
INSERT INTO `product_property` VALUES ('173', '拉丁学名', 'Chrysalidocarpus lutescens ', '20', null, null);
INSERT INTO `product_property` VALUES ('174', '别称', '黄椰子、紫葵', '20', null, null);
INSERT INTO `product_property` VALUES ('175', '科属', '棕榈科散尾葵属', '20', null, null);
INSERT INTO `product_property` VALUES ('176', '分布区域', '原产马达加斯加，现引种于中国南方各省。 在中国华南地区和西南地区适宜生长。', '20', null, null);
INSERT INTO `product_property` VALUES ('177', '是否开花', '开花', '20', null, null);
INSERT INTO `product_property` VALUES ('178', '形态特征', '丛生常绿灌木或小乔木。茎干光滑，黄绿色，无毛刺，嫩时披蜡粉，上有明显叶痕，纹状呈环。叶面滑细长，羽状全裂，长40～150cm，叶柄稍弯曲，先端柔软。', '20', null, null);
INSERT INTO `product_property` VALUES ('179', '生长环境', '散尾葵为热带植物，喜温暖、潮湿、半荫环境。\r\n散尾葵\r\n散尾葵\r\n耐寒性不强，气温20℃以下叶子发黄，越冬最低温度需在10℃以上，5℃左右就会冻死。', '20', null, null);
INSERT INTO `product_property` VALUES ('180', '适用地点', '客厅、书房、办公室', '20', null, null);
INSERT INTO `product_property` VALUES ('181', '中文学名', '含羞草', '21', null, null);
INSERT INTO `product_property` VALUES ('182', '拉丁学名', 'Mimosa pudica Linn.', '21', null, null);
INSERT INTO `product_property` VALUES ('183', '别称', '感应草、知羞草、呼喝草、怕丑草', '21', null, null);
INSERT INTO `product_property` VALUES ('184', '科属', '含羞草科 含羞草属', '21', null, null);
INSERT INTO `product_property` VALUES ('185', '分布区域', '原产于南美热带地区，我国各地均有栽种。', '21', null, null);
INSERT INTO `product_property` VALUES ('186', '是否开花', '开花', '21', null, null);
INSERT INTO `product_property` VALUES ('187', '形态特征', '形状似绒球。开花后结荚果，果实呈扁圆形。叶为羽毛状复叶互生，呈掌状排列。大约在盛夏以后开花，头状花序长圆形，2-3个生于叶腋。花为白色、粉红色，花萼钟状，有8个微小萼齿，花瓣四裂，雄蕊四枚，子房无毛。荚果扁平，每荚节有1颗种子，成熟时节间脱落。花期9月。 ', '21', null, null);
INSERT INTO `product_property` VALUES ('188', '生长环境', '含羞草喜温暖湿润、阳光充足的环境，适生于排水良好，富含有机质的砂质壤土，株体健壮，生长迅速，适应性较强。', '21', null, null);
INSERT INTO `product_property` VALUES ('189', '适用地点', '客厅，阳台', '21', null, null);
INSERT INTO `product_property` VALUES ('190', '中文学名', '文竹', '22', null, null);
INSERT INTO `product_property` VALUES ('191', '拉丁学名', 'Asparagussetaceus', '22', null, null);
INSERT INTO `product_property` VALUES ('192', '别称', '云片松、刺天冬、云竹、云片竹、山草、芦笋山草', '22', null, null);
INSERT INTO `product_property` VALUES ('193', '科属', '百合科天门冬属', '22', null, null);
INSERT INTO `product_property` VALUES ('194', '分布区域', '原产于南非，分布于中国中部、西北、长江流域及南方各地。', '22', null, null);
INSERT INTO `product_property` VALUES ('195', '是否开花', '开花', '22', null, null);
INSERT INTO `product_property` VALUES ('196', '形态特征', '文竹高可达几米。文竹根部稍肉质，茎柔软丛生，细长。茎的分枝极多，近平滑。叶状枝通常每10~13枚成簇，刚毛状，略具三棱，长4~5毫米；鳞片状叶基部稍具刺状距或距不明显。', '22', null, null);
INSERT INTO `product_property` VALUES ('197', '生长环境', '文竹性喜温暖湿润和半阴通风的环境，冬季不耐严寒，不耐干旱，不能浇太多水，根会腐烂，夏季忌阳光直射。', '22', null, null);
INSERT INTO `product_property` VALUES ('198', '适用地点', '客厅、书房、庭园', '22', null, null);
INSERT INTO `product_property` VALUES ('199', '中文学名', '鸢尾', '23', null, null);
INSERT INTO `product_property` VALUES ('200', '拉丁学名', 'Iris tectorum Maxim.  ', '23', null, null);
INSERT INTO `product_property` VALUES ('201', '别称', '乌鸢、扁竹花、屋顶鸢尾、蓝蝴蝶、紫蝴蝶、蛤蟆七、蝴蝶花', '23', null, null);
INSERT INTO `product_property` VALUES ('202', '科属', '鸢尾科鸢尾属', '23', null, null);
INSERT INTO `product_property` VALUES ('203', '分布区域', '北非、西班牙、葡萄牙、高加索地区、黎巴嫩和以色列', '23', null, null);
INSERT INTO `product_property` VALUES ('204', '是否开花', '开花', '23', null, null);
INSERT INTO `product_property` VALUES ('205', '形态特征', '多年生草本，根状茎粗壮，直径约1cm，斜伸；叶长15~50cm，宽1.5~3.5cm，花蓝紫色，直径约10cm；蒴果长椭圆形或倒卵形，长4.5~6cm，直径2~2.5cm。', '23', null, null);
INSERT INTO `product_property` VALUES ('206', '生长环境', '坡地、林缘及水边湿地，喜阳光充足，喜湿而不耐涝。', '23', null, null);
INSERT INTO `product_property` VALUES ('207', '适用地点', '庭院', '23', null, null);
INSERT INTO `product_property` VALUES ('208', '中文学名', '蜀葵', '24', null, null);
INSERT INTO `product_property` VALUES ('209', '拉丁学名', 'Althaea rosea （Linn.）Cavan.', '24', null, null);
INSERT INTO `product_property` VALUES ('210', '别称', '一丈红、大蜀季、戎葵、吴葵、卫足葵、胡葵、斗蓬花、秫秸花', '24', null, null);
INSERT INTO `product_property` VALUES ('211', '科属', '锦葵科蜀葵属', '24', null, null);
INSERT INTO `product_property` VALUES ('212', '分布区域', '在中国分布很广，华东、华中、华北、华南地区均有', '24', null, null);
INSERT INTO `product_property` VALUES ('213', '是否开花', '开花', '24', null, null);
INSERT INTO `product_property` VALUES ('214', '形态特征', '二年生直立草本，高达2米，茎枝密被刺毛。 [1]  花呈总状花序顶生单瓣或重瓣，有紫、粉、红、白等色；花期2-8月，蒴果，种子扁圆，肾脏形。', '24', null, null);
INSERT INTO `product_property` VALUES ('215', '生长环境', '它喜光，阳光充足会使它叶片翠绿、花色艳丽。要放置在半阴的环境下进行养护为宜。水分需求不能过大，造成水涝，否则会烂根。生命力很强，盐碱地也能生长。肥料需求不多，只需要在生长季多多提供即可。', '24', null, null);
INSERT INTO `product_property` VALUES ('216', '适用地点', '阳台、客厅', '24', null, null);
INSERT INTO `product_property` VALUES ('217', '中文学名', '晚香玉', '25', null, null);
INSERT INTO `product_property` VALUES ('218', '拉丁学名', 'Polianthes tuberosa L.', '25', null, null);
INSERT INTO `product_property` VALUES ('219', '别称', '夜来香、月下香', '25', null, null);
INSERT INTO `product_property` VALUES ('220', '科属', '石蒜科晚香玉属', '25', null, null);
INSERT INTO `product_property` VALUES ('221', '分布区域', '夜来香、月下香', '25', null, null);
INSERT INTO `product_property` VALUES ('222', '是否开花', '开花', '25', null, null);
INSERT INTO `product_property` VALUES ('223', '形态特征', '茎直立，不分枝。基生叶片簇生，线形，顶端尖，深绿色，在花茎上的叶散生，向上渐小呈苞片状。穗状花序顶生，每苞片内常花，苞片绿色；花乳白色，浓香，花被裂片彼此近似，长圆状披针形，子房下位，花柱细长，蒴果卵球形，种子多数，稍扁。', '25', null, null);
INSERT INTO `product_property` VALUES ('224', '生长环境', '晚香玉性喜温暖湿润、阳光充足的环境，生长适温20-30℃。对土质要求不严，以粘质壤土为宜；对土壤湿度反应较敏感，喜肥沃、潮湿但不积水的土壤。', '25', null, null);
INSERT INTO `product_property` VALUES ('225', '适用地点', '阳台、客厅（注意通风）', '25', null, null);
INSERT INTO `product_property` VALUES ('226', '中文学名', '石竹', '26', null, null);
INSERT INTO `product_property` VALUES ('227', '拉丁学名', 'Dianthus chinensis L.', '26', null, null);
INSERT INTO `product_property` VALUES ('228', '别称', '洛阳花、石柱花等', '26', null, null);
INSERT INTO `product_property` VALUES ('229', '科属', '石竹科石竹属', '26', null, null);
INSERT INTO `product_property` VALUES ('230', '分布区域', '石竹花原产于我国北方，南北普遍生长。生于草原和山坡草地。俄罗斯西伯利亚和朝鲜也有分布。', '26', null, null);
INSERT INTO `product_property` VALUES ('231', '是否开花', '开花', '26', null, null);
INSERT INTO `product_property` VALUES ('232', '形态特征', '茎由根颈生出，疏丛生，直立，上部分枝。叶片线状披针形，长3-5厘米，宽2-4毫米，顶端渐尖，基部稍狭，全缘或有细小齿，中脉较显。花单生枝端或数花集成聚伞花序；花梗长1-3厘米；苞片4，卵形，顶端长渐尖，长达花萼1/2以上，边缘膜质，有缘毛。', '26', null, null);
INSERT INTO `product_property` VALUES ('233', '生长环境', '石竹花性耐寒而不耐酷暑，喜向阳、高燥、通风和排水良好的肥沃壤土。石竹花日开夜合，若上午日照，中午遮荫，晚上露夜，则可延长观赏期，并使之不断抽枝开花。', '26', null, null);
INSERT INTO `product_property` VALUES ('234', '适用地点', '阳台、庭院', '26', null, null);
INSERT INTO `product_property` VALUES ('235', '中文学名', '虎尾兰', '27', null, null);
INSERT INTO `product_property` VALUES ('236', '拉丁学名', 'Sansevieria trifasciata Prain', '27', null, null);
INSERT INTO `product_property` VALUES ('237', '别称', '虎皮兰、千岁兰、虎尾掌、锦兰', '27', null, null);
INSERT INTO `product_property` VALUES ('238', '科属', '百合科虎尾兰属', '27', null, null);
INSERT INTO `product_property` VALUES ('239', '分布区域', '非洲及亚洲南部，中国各地有栽培', '27', null, null);
INSERT INTO `product_property` VALUES ('240', '是否开花', '开花', '27', null, null);
INSERT INTO `product_property` VALUES ('241', '形态特征', '具根状茎，叶基生，肉质线状披针形，硬革质，直立，基部稍呈沟状；暗绿色，两面有浅绿色和深绿相间的横向斑带；总状花序，花白色至淡绿色；浆果直径约7-8毫米。花期11-12月。', '27', null, null);
INSERT INTO `product_property` VALUES ('242', '生长环境', '虎尾兰适应性强，性喜温暖湿润，耐干旱，喜光又耐阴。对土壤要求不严，以排水性较好的砂质壤土较好。其生长适温为20-30℃，越冬温度为10℃。', '27', null, null);
INSERT INTO `product_property` VALUES ('243', '适用地点', '房间、客厅、书房', '27', null, null);
INSERT INTO `product_property` VALUES ('244', '中文学名', '瓜栗', '28', null, null);
INSERT INTO `product_property` VALUES ('245', '拉丁学名', 'Pachira macrocarpa (Cham. et Schlecht.) Walp. ', '28', null, null);
INSERT INTO `product_property` VALUES ('246', '别称', '发财树、马拉巴栗、中美木棉、鹅掌钱', '28', null, null);
INSERT INTO `product_property` VALUES ('247', '科属', '木棉科瓜栗属', '28', null, null);
INSERT INTO `product_property` VALUES ('248', '分布区域', '中国云南西双版纳栽培，生长正常。原产中美墨西哥至哥斯达黎加。', '28', null, null);
INSERT INTO `product_property` VALUES ('249', '是否开花', '开花', '28', null, null);
INSERT INTO `product_property` VALUES ('250', '形态特征', '高4-5米，树冠较松散，幼枝栗褐色，无毛。小叶具短柄或近无柄。蒴果近梨形，果皮厚，木质，几黄褐色，外面无毛，内面密被长绵毛，开裂，每室种子多数。种子大，不规则的梯状楔形，表皮暗褐色，有白色螺纹，内含多胚。花期5-11月，果先后成熟，种子落地后自然萌发。', '28', null, null);
INSERT INTO `product_property` VALUES ('251', '生长环境', '喜高温高湿气候，耐寒力差，幼苗忌霜冻，成年树可耐轻霜及长期5-6℃低温，中国华南地区可露地越冬，以北地区冬季须移入温室内防寒，喜肥沃疏松、透气保水的沙壤土，喜酸性土，忌碱性土或粘重土壤，较耐水湿，也稍耐旱。', '28', null, null);
INSERT INTO `product_property` VALUES ('252', '适用地点', '客厅、办公室', '28', null, null);
INSERT INTO `product_property` VALUES ('253', '中文学名', '长春花', '29', null, null);
INSERT INTO `product_property` VALUES ('254', '拉丁学名', 'Catharanthus roseus （L.） G. Don', '29', null, null);
INSERT INTO `product_property` VALUES ('255', '别称', '日日春、日日草、日日新、三万花、四时春、时钟花、雁来红', '29', null, null);
INSERT INTO `product_property` VALUES ('256', '科属', '夹竹桃科长春花属', '29', null, null);
INSERT INTO `product_property` VALUES ('257', '分布区域', '非洲、亚热带、热带以及中国大陆的华东、西南、中南等地', '29', null, null);
INSERT INTO `product_property` VALUES ('258', '是否开花', '开花', '29', null, null);
INSERT INTO `product_property` VALUES ('259', '形态特征', '亚灌木，略有分枝，高达60厘米，有水液，全株无毛或仅有微毛；茎近方形，有条纹，灰绿色；节间长1-3.5厘米。', '29', null, null);
INSERT INTO `product_property` VALUES ('260', '生长环境', '性喜高温、高湿、耐半阴，不耐严寒，最适宜温度为20℃-33℃，喜阳光，忌湿怕涝，一般土壤均可栽培，但盐碱土壤不宜，以排水良好、通风透气的砂质或富含腐殖质的土壤为好', '29', null, null);
INSERT INTO `product_property` VALUES ('261', '适用地点', '阳台、客厅', '29', null, null);
INSERT INTO `product_property` VALUES ('262', '中文学名', '含笑草', '30', null, null);
INSERT INTO `product_property` VALUES ('263', '拉丁学名', 'Michelia figo (Lour.) Spreng.', '30', null, null);
INSERT INTO `product_property` VALUES ('264', '别称', '含笑美、含笑梅、山节子、白兰花、唐黄心树、香蕉花、香蕉灌木', '30', null, null);
INSERT INTO `product_property` VALUES ('265', '科属', '木兰科含笑属', '30', null, null);
INSERT INTO `product_property` VALUES ('266', '分布区域', '原产于广东和福建，现长江流域至江南、台湾等各地均有栽培', '30', null, null);
INSERT INTO `product_property` VALUES ('267', '是否开花', '开花', '30', null, null);
INSERT INTO `product_property` VALUES ('268', '形态特征', '常绿灌木，高2-3米，树皮灰褐色，分枝繁密；叶革质，狭椭圆形或倒卵状椭圆形，花期3-5月，果期7-8月。', '30', null, null);
INSERT INTO `product_property` VALUES ('269', '生长环境', '生于阴坡杂木林中，溪谷沿岸尤为茂盛。 [1]  含笑花喜肥，性喜半阴，在弱阴下最利生长，忌强烈阳光直射，夏季要注意遮阴。 [2]  秋末霜前移入温室，在10℃左右温度下越冬。', '30', null, null);
INSERT INTO `product_property` VALUES ('270', '适用地点', '客厅、阳台', '30', null, null);
INSERT INTO `product_property` VALUES ('271', '中文学名', '栀子花', '31', null, null);
INSERT INTO `product_property` VALUES ('272', '拉丁学名', 'Gardenia jasminoides Ellis', '31', null, null);
INSERT INTO `product_property` VALUES ('273', '别称', '黄栀子、山栀', '31', null, null);
INSERT INTO `product_property` VALUES ('274', '科属', '茜草科栀子属', '31', null, null);
INSERT INTO `product_property` VALUES ('275', '分布区域', '主要分布在贵州、四川、江苏、浙江、安徽、江西、广东、云南、福建、台湾、湖南、湖北等地。', '31', null, null);
INSERT INTO `product_property` VALUES ('276', '是否开花', '开花', '31', null, null);
INSERT INTO `product_property` VALUES ('277', '形态特征', '单叶对生或三叶轮生，叶片倒卵形，革质，翠绿有光泽。浆果卵形，黄色或橙色。', '31', null, null);
INSERT INTO `product_property` VALUES ('278', '生长环境', '喜温湿，向阳，较耐寒，耐半阴，怕积水，要求疏松、肥沃和酸性的沙壤土，易发生叶子发黄的黄化病。', '31', null, null);
INSERT INTO `product_property` VALUES ('279', '适用地点', '客厅、办公室', '31', null, null);
INSERT INTO `product_property` VALUES ('280', '中文学名', '袖珍椰', '32', null, null);
INSERT INTO `product_property` VALUES ('281', '拉丁学名', 'Chamaedorea elegans Mart.', '32', null, null);
INSERT INTO `product_property` VALUES ('282', '别称', '秀丽竹节椰、矮生椰子、矮棕、客厅棕、袖珍椰子葵、袖珍棕', '32', null, null);
INSERT INTO `product_property` VALUES ('283', '科属', '棕榈科竹棕属', '32', null, null);
INSERT INTO `product_property` VALUES ('284', '分布区域', '原产于墨西哥北部和危地马拉，主要分布在中美洲热带地区。其性喜高温高湿及半阴环境。', '32', null, null);
INSERT INTO `product_property` VALUES ('285', '是否开花', '开花', '32', null, null);
INSERT INTO `product_property` VALUES ('286', '形态特征', '盆栽高度一般不超过1米。它茎干直立，穗状花序腋生，花黄色，呈小球状，雌雄异株，雌花序营养条件好时稍下垂，桨果橙黄色。花期春季。', '32', null, null);
INSERT INTO `product_property` VALUES ('287', '生长环境', '袖珍椰植株小巧玲珑，姿态秀雅，叶色浓绿光亮，耐阴性强，是优良的室内中小型盆栽观叶植物。', '32', null, null);
INSERT INTO `product_property` VALUES ('288', '适应地点', '书房、客厅、卧室、会议室', '32', null, null);
INSERT INTO `product_property` VALUES ('289', '中文学名', '铁线蕨', '33', null, null);
INSERT INTO `product_property` VALUES ('290', '拉丁学名', 'Adiantum capillus-veneris L.', '33', null, null);
INSERT INTO `product_property` VALUES ('291', '别称', '铁丝草、少女的发丝、铁线草、水猪毛土', '33', null, null);
INSERT INTO `product_property` VALUES ('292', '科属', '铁线蕨科铁线蕨属', '33', null, null);
INSERT INTO `product_property` VALUES ('293', '分布区域', '铁线蕨世界种。广布于中国台湾、福建、广东、广西、北京等。常生于流水溪旁石灰岩上或石灰岩洞底和滴水岩壁上。', '33', null, null);
INSERT INTO `product_property` VALUES ('294', '是否开花', '否', '33', null, null);
INSERT INTO `product_property` VALUES ('295', '形态特征', '根状茎细长横走，密被棕色披针形鳞片。柄长纤细，栗黑色，有光泽，叶片卵状三角形，尖头，基部楔形，羽片互生，斜向上，长圆状卵形，圆钝头，能育裂片先端截形、直或略下陷', '33', null, null);
INSERT INTO `product_property` VALUES ('296', '生长环境', '铁线蕨常生于流水溪旁石灰岩上或石灰岩洞底和滴水岩壁上，为钙质土的指示植物，海拔100-2800米。', '33', null, null);
INSERT INTO `product_property` VALUES ('297', '适用地点', '卧室、客厅、书房', '33', null, null);
INSERT INTO `product_property` VALUES ('298', '中文学名', '芍药', '34', null, null);
INSERT INTO `product_property` VALUES ('299', '拉丁学名', 'Paeonia lactiflora Pall.', '34', null, null);
INSERT INTO `product_property` VALUES ('300', '别称', '将离、离草、婪尾春、余容、犁食、没骨花、黑牵夷、红药等', '34', null, null);
INSERT INTO `product_property` VALUES ('301', '科属', '毛茛科芍药属', '34', null, null);
INSERT INTO `product_property` VALUES ('302', '分布区域', '中国、朝鲜、日本、蒙古及西伯利亚地区', '34', null, null);
INSERT INTO `product_property` VALUES ('303', '是否开花', '开花', '34', null, null);
INSERT INTO `product_property` VALUES ('304', '形态特征', '块根由根颈下方生出，肉质，粗壮，呈纺锤形或长柱形，粗0.6～3.5cm。芍药花瓣呈倒卵形，花盘为浅杯状，花期5～6月，花一般着生于茎的顶端或近顶端叶腋处，原种花白色，花瓣5～13枚。', '34', null, null);
INSERT INTO `product_property` VALUES ('305', '生长环境', '喜光照，耐旱。', '34', null, null);
INSERT INTO `product_property` VALUES ('306', '适用地点', '阳台、庭院', '34', null, null);
INSERT INTO `product_property` VALUES ('307', '中文学名', '球兰', '35', null, null);
INSERT INTO `product_property` VALUES ('308', '拉丁学名', 'Hoya carnosa (L. f.) R. Br.', '35', null, null);
INSERT INTO `product_property` VALUES ('309', '别称', '马骝解、狗舌藤、铁脚板等', '35', null, null);
INSERT INTO `product_property` VALUES ('310', '科属', '萝藦科球兰属', '35', null, null);
INSERT INTO `product_property` VALUES ('311', '分布区域', '分布于云南、广西、广东、台湾；热带及亚热带其他地区也有栽培或野生。', '35', null, null);
INSERT INTO `product_property` VALUES ('312', '是否开花', '开花', '35', null, null);
INSERT INTO `product_property` VALUES ('313', '形态特征', '攀援灌木，附生于树上或石上；茎节上生气根。叶对生，肉质，卵圆形至卵圆状长圆形，长3.5-12厘米，宽3-4.5厘米，顶端钝，基部圆形；侧脉不明显，约有4对。', '35', null, null);
INSERT INTO `product_property` VALUES ('314', '生长环境', '攀援灌木，附生于树上或石上，茎节上生气根。', '35', null, null);
INSERT INTO `product_property` VALUES ('315', '适用地点', '卧室、书房', '35', null, null);
INSERT INTO `product_property` VALUES ('316', '中文学名', '合果芋', '36', null, null);
INSERT INTO `product_property` VALUES ('317', '拉丁学名', 'Syngonium podophyllum Schott', '36', null, null);
INSERT INTO `product_property` VALUES ('318', '别称', '长柄合果芋、紫梗芋、剪叶芋、丝素藤、白蝴蝶、箭叶', '36', null, null);
INSERT INTO `product_property` VALUES ('319', '科属', '天南星科合果芋属', '36', null, null);
INSERT INTO `product_property` VALUES ('320', '分布区域', '合果芋原产于热带美洲地区，合果芋作为一种观叶植物在世界各地广泛栽培。', '36', null, null);
INSERT INTO `product_property` VALUES ('321', '是否开花', '不易', '36', null, null);
INSERT INTO `product_property` VALUES ('322', '形态特征', '合果芋属多年生常绿草本植物，合果芋的茎节具气生根，攀附他物生长。叶片呈两型性，箭形或戟形；叶基裂片两侧常着生小型耳状叶片。佛焰苞浅绿或黄色。', '36', null, null);
INSERT INTO `product_property` VALUES ('323', '生长环境', '喜光、不耐严寒，喜欢高温高湿的环境，微酸性土壤。', '36', null, null);
INSERT INTO `product_property` VALUES ('324', '适用地点', '阳台、茶几、案头', '36', null, null);
INSERT INTO `product_property` VALUES ('325', '中文学名', '龟背竹', '37', null, null);
INSERT INTO `product_property` VALUES ('326', '拉丁学名', 'Monstera deliciosa Liebm.', '37', null, null);
INSERT INTO `product_property` VALUES ('327', '别称', '蓬莱蕉、铁丝兰、穿孔喜林芋', '37', null, null);
INSERT INTO `product_property` VALUES ('328', '科属', '天南星科龟背竹属', '37', null, null);
INSERT INTO `product_property` VALUES ('329', '分布区域', '原产于墨西哥，各热带地区多引种栽培供观赏。中国福建、广东、广西和云南等地栽培于露地，北京和湖北等地多栽于温室。', '37', null, null);
INSERT INTO `product_property` VALUES ('330', '是否开花', '开花', '37', null, null);
INSERT INTO `product_property` VALUES ('331', '形态特征', '茎绿色，粗壮，有苍白色的半月形叶迹，周延为环状，余光滑，长3-6米，粗6厘米。叶柄绿色，长常达1米，腹面扁平；叶片大，轮廓心状卵形。', '37', null, null);
INSERT INTO `product_property` VALUES ('332', '生长环境', '龟背竹喜温暖湿润，较遮阴的生态环境，忌强光暴晒与干燥，不耐寒，在中国多行温室栽培，用于布置大厅、居室。生长适温为20-30℃，15℃停止生长，越冬温度为5℃。', '37', null, null);
INSERT INTO `product_property` VALUES ('333', '适用地点', '客厅、书房、卧室', '37', null, null);
INSERT INTO `product_property` VALUES ('334', '中文学名', '大花红星', '38', null, null);
INSERT INTO `product_property` VALUES ('335', '英文名', 'Have a good luck', '38', null, null);
INSERT INTO `product_property` VALUES ('336', '别称', '红运当头，凤梨花,鸿运当头', '38', null, null);
INSERT INTO `product_property` VALUES ('337', '科属', '凤梨科水塔花属', '38', null, null);
INSERT INTO `product_property` VALUES ('338', '分布区域', '墨西哥至巴西南部和阿根廷北部。', '38', null, null);
INSERT INTO `product_property` VALUES ('339', '是否开花', '开花', '38', null, null);
INSERT INTO `product_property` VALUES ('340', '形态特征', '冬、春季室内观赏花卉，四季常绿，花序美丽多姿，色彩丰富，常见栽培的有大红、粉红、金黄、玫红等品种。', '38', null, null);
INSERT INTO `product_property` VALUES ('341', '生长环境', '喜高温、湿润、半荫的习惯，能常年放置在温暖、明亮的室内。冬季可以全日照，春秋早晚应有光照，夏季不要阳光直射。光线明亮，叶面色泽鲜艳。越冬温度以不低于10℃为宜，高于 20℃以上，不利于植株休眠，会影响来年生长和开花。', '38', null, null);
INSERT INTO `product_property` VALUES ('342', '适用地点', '客厅、书房', '38', null, null);
INSERT INTO `product_property` VALUES ('343', '中文学名', '铁线莲', '39', null, null);
INSERT INTO `product_property` VALUES ('344', '拉丁学名', 'Clematis florida Thunb.', '39', null, null);
INSERT INTO `product_property` VALUES ('345', '别称', '铁线牡丹、番莲、金包银、山木通、番莲、威灵仙', '39', null, null);
INSERT INTO `product_property` VALUES ('346', '科属', '毛茛科铁线莲属', '39', null, null);
INSERT INTO `product_property` VALUES ('347', '分布区域', '中国、日本。\r\n', '39', null, null);
INSERT INTO `product_property` VALUES ('348', '是否开花', '开花', '39', null, null);
INSERT INTO `product_property` VALUES ('349', '形态特征', '草质藤本，长约1~2米。茎棕色或紫红色，具六条纵纹，节部膨大，被稀疏短柔毛。二回三出复叶，连叶柄长达12厘米；小叶片狭卵形至披针形，长2~6厘米，宽1~2厘米，顶端钝尖，基部圆形或阔楔形，边缘全缘，极稀有分裂，两面均不被毛，脉纹不显；小叶柄清晰能见，短或长达1厘米；叶柄长4厘米。', '39', null, null);
INSERT INTO `product_property` VALUES ('350', '生长环境', '生于低山区的丘陵灌丛中。喜肥沃、排水良好的碱性壤土，忌积水或夏季干旱而不能保水的土壤。耐寒性强，可耐-20低温。有红蜘蛛或食叶性害虫危害需加强通风。', '39', null, null);
INSERT INTO `product_property` VALUES ('351', '适用地点', '阳台、庭院', '39', null, null);
INSERT INTO `product_property` VALUES ('352', '中文学名', '络石', '40', null, null);
INSERT INTO `product_property` VALUES ('353', '拉丁学名', 'Trachelospermum jasminoides (Lindl.) Lem.', '40', null, null);
INSERT INTO `product_property` VALUES ('354', '别称', '石龙藤，万字花，万字茉莉，风车茉莉', '40', null, null);
INSERT INTO `product_property` VALUES ('355', '科属', '夹竹桃科络石属', '40', null, null);
INSERT INTO `product_property` VALUES ('356', '分布区域', '本种分布很广，山东、安徽、江苏、浙江、福建、台湾、江西、河北、河南、湖北、湖南、广东、广西、云南、贵州、四川、陕西等省区都有分布。日本、朝鲜和越南也有。', '40', null, null);
INSERT INTO `product_property` VALUES ('357', '是否开花', '开花', '40', null, null);
INSERT INTO `product_property` VALUES ('358', '形态特征', '络石原产于中国黄河流域以南，南北各地均有栽培。对气侯的适应性强，能耐寒冷，亦耐暑热，但忌严寒。河南北部以至华北地区露地不能越冬，只宜作盆栽，冬季移入室内。华南可在露地安全越夏。喜湿润环境，忌干风吹袭。', '40', null, null);
INSERT INTO `product_property` VALUES ('359', '生长环境', '络石属常绿木质藤本植物，长可达10米，具乳汁；茎圆柱形赤褐色，叶革质或近革质，叶片椭圆形至卵状椭圆形或宽倒卵形，叶面无毛，中脉微凹，侧脉扁平，叶柄短，二歧聚伞花序腋生或顶生，花多朵组成圆锥状，花白色，芳香。', '40', null, null);
INSERT INTO `product_property` VALUES ('360', '适用地点', '阳台、庭院', '40', null, null);
INSERT INTO `product_property` VALUES ('361', '中文学名', '叶子花', '41', null, null);
INSERT INTO `product_property` VALUES ('362', '拉丁学名', 'Bougainvillea spectabilis Willd.', '41', null, null);
INSERT INTO `product_property` VALUES ('363', '别称', '三角花、室中花、九重葛、贺春红、勒杜鹃、三角梅', '41', null, null);
INSERT INTO `product_property` VALUES ('364', '科属', '紫茉莉科叶子花属', '41', null, null);
INSERT INTO `product_property` VALUES ('365', '分布区域', '原产热带美洲。中国南方栽培供观赏。', '41', null, null);
INSERT INTO `product_property` VALUES ('366', '是否开花', '开花', '41', null, null);
INSERT INTO `product_property` VALUES ('367', '形态特征', '藤状灌木。枝、叶密生柔毛；刺腋生、下弯。叶片椭圆形或卵形，基部圆形，有柄。花序腋生或顶生；苞片椭圆状卵形，基部圆形至心形，长2.5-6.5厘米，宽1.5-4厘米，暗红色或淡紫红色。', '41', null, null);
INSERT INTO `product_property` VALUES ('368', '生长环境', '性喜温暖、湿润的气候和阳光充足的环境。不耐寒，耐瘠薄，耐干旱，耐盐碱，耐修剪，生长势强，喜水但忌积水。要求充足的光照，长江流域及以北地区均盆栽养护。对土壤要求不严，但在肥沃、疏松、排水好的沙质壤土能旺盛生长。', '41', null, null);
INSERT INTO `product_property` VALUES ('369', '适用地点', '阳台、庭院', '41', null, null);
INSERT INTO `product_property` VALUES ('370', '中文学名', '露薇花', '42', null, null);
INSERT INTO `product_property` VALUES ('371', '拉丁学名', 'Lewisia cotyledon', '42', null, null);
INSERT INTO `product_property` VALUES ('372', '别称', '琉维草', '42', null, null);
INSERT INTO `product_property` VALUES ('373', '科属', '马齿苋科露薇花属', '42', null, null);
INSERT INTO `product_property` VALUES ('374', '分布区域', '近年来新兴的观花草本植物，国内有少量引种', '42', null, null);
INSERT INTO `product_property` VALUES ('375', '是否开花', '开花', '42', null, null);
INSERT INTO `product_property` VALUES ('376', '形态特征', '肉质草本花卉，根肉质，基生莲座叶丛，直径9cm~11cm\r\n，叶倒卵状匙形，长5cm~8cm，全缘或波状。圆锥花序顶生，高约25cm，花白色、橙红、粉色或橙黄，具红脉、红晕或红色条纹，瓣片8~10，开展，长1.2cm。', '42', null, null);
INSERT INTO `product_property` VALUES ('377', '生长环境', '不耐寒，喜春季湿润、夏季干燥的生长环境，宜栽培于排水\r\n良好、疏松的砾质土壤，喜半阴的光照条件，在气候潮湿地区，宜全光照下栽培，否则会烂根，不耐夏季酷热。', '42', null, null);
INSERT INTO `product_property` VALUES ('378', '适用地点', '书房、卧室', '42', null, null);
INSERT INTO `product_property` VALUES ('379', '中文学名', '千佛手', '43', null, null);
INSERT INTO `product_property` VALUES ('380', '拉丁学名', 'xSedeveria \'Harry Butterfield\'', '43', null, null);
INSERT INTO `product_property` VALUES ('381', '别称', '菊丸，王玉珠帘', '43', null, null);
INSERT INTO `product_property` VALUES ('382', '科属', '景天科景天属', '43', null, null);
INSERT INTO `product_property` VALUES ('383', '分布区域', '此品种最早在美国加利福尼亚州被培育，又名玉缀和静夜。', '43', null, null);
INSERT INTO `product_property` VALUES ('384', '是否开花', '开花', '43', null, null);
INSERT INTO `product_property` VALUES ('385', '形态特征', '千佛手（xSedeveria ’Harry Butterfield‘），又名菊丸、王玉珠帘，景天科景天属，无明显休眠期。千佛手开花的样子非常别致，刚开始被绿色叶子所包拢保护，叶子张开的时候才露出花苞，花为黄色，多在春夏季开放。', '43', null, null);
INSERT INTO `product_property` VALUES ('386', '生长环境', '千佛手喜阳或温暖干燥的半阴环境，耐干旱，怕积水，要求有一定的空气湿。夏季高温时避免烈日暴晒，注意通风良好。', '43', null, null);
INSERT INTO `product_property` VALUES ('387', '适用地点', '书房、宿舍', '43', null, null);
INSERT INTO `product_property` VALUES ('388', '中文学名', '广寒宫', '44', null, null);
INSERT INTO `product_property` VALUES ('389', '拉丁学名', 'Echeveria cante Glass & Mendoza-Garcia', '44', null, null);
INSERT INTO `product_property` VALUES ('390', '别称', '厚叶广寒宫', '44', null, null);
INSERT INTO `product_property` VALUES ('391', '科属', '景天科拟石莲花属', '44', null, null);
INSERT INTO `product_property` VALUES ('392', '分布区域', 'Gl. 8073, 墨西哥, 萨卡特卡斯州, 1994年六月19日采集, Sombrerete与Fresnillo之间。', '44', null, null);
INSERT INTO `product_property` VALUES ('393', '是否开花', '开花', '44', null, null);
INSERT INTO `product_property` VALUES ('394', '形态特征', '叶片圆匙形，先端尖，叶片比较薄，包裹得也不算紧实，但叶片上覆盖着一层厚厚的白粉，把原本淡绿色的叶片都变成了灰白色，在光照充足、温差加大的情况下，叶色会变成淡淡的橙紫色或蓝紫色，叶边紫红。', '44', null, null);
INSERT INTO `product_property` VALUES ('395', '生长环境', '广寒宫习性强健，耐高温也耐敢旱、耐寒。长期露养的健康植株，在通风良好的情况下，夏季可以不用遮阴，冬季0℃以上可以安全越冬。', '44', null, null);
INSERT INTO `product_property` VALUES ('396', '适用地点', '书房、宿舍', '44', null, null);
INSERT INTO `product_property` VALUES ('397', '中文学名', '小松绿', '45', null, null);
INSERT INTO `product_property` VALUES ('398', '拉丁学名', 'Sedum multiceps Coss. & Durieu', '45', null, null);
INSERT INTO `product_property` VALUES ('399', '别称', '球松', '45', null, null);
INSERT INTO `product_property` VALUES ('400', '科属', '景天科景天属', '45', null, null);
INSERT INTO `product_property` VALUES ('401', '分布区域', '小松绿原产北非的阿尔及利亚。', '45', null, null);
INSERT INTO `product_property` VALUES ('402', '是否开花', '开花', '45', null, null);
INSERT INTO `product_property` VALUES ('403', '形态特征', '多肉植物，植株低矮，多分枝，株型近似球状，新枝浅绿色，以后逐渐转为灰白色，肉质叶近似针状。', '45', null, null);
INSERT INTO `product_property` VALUES ('404', '生长环境', '喜凉爽干燥、阳光充足的环境，在半阴处也能正常生长，耐干旱，怕积水。', '45', null, null);
INSERT INTO `product_property` VALUES ('405', '适用地点', '书房、宿舍', '45', null, null);
INSERT INTO `product_property` VALUES ('406', '中文学名', '小米星', '46', null, null);
INSERT INTO `product_property` VALUES ('407', '拉丁学名', 'Crassula \'Tom Thumb\'', '46', null, null);
INSERT INTO `product_property` VALUES ('408', '别称', '小米星', '46', null, null);
INSERT INTO `product_property` VALUES ('409', '科属', '景天科青锁龙属', '46', null, null);
INSERT INTO `product_property` VALUES ('410', '分布区域', '舞乙女（Crassula rupestris ssp. marnieriana）和爱星（ Crassula rupestris ssp. rupestris）的几率杂交种，由挪威人W. J. Ruysch发现。是杂交出来的品种，在野外没有分布。', '46', null, null);
INSERT INTO `product_property` VALUES ('411', '是否开花', '开花', '46', null, null);
INSERT INTO `product_property` VALUES ('412', '形态特征', '小米星为多年生肉质草本植物，植株直立丛生，多细小的分枝，茎肉质，多年生植株茎干逐渐半木质化，肉质叶呈灰绿至浅绿色，长约0.5厘米，宽约0.4厘米；叶缘稍具红色，在晚秋和早春，温差大的时候红色尤为明显。', '46', null, null);
INSERT INTO `product_property` VALUES ('413', '生长环境', '小米星需要阳光充足和凉爽、干燥的环境，耐半阴，怕水涝，忌闷热潮湿。具有冷凉季节生长，夏季高温休眠的习性，为多肉植物中的“冬型种”。', '46', null, null);
INSERT INTO `product_property` VALUES ('414', '适用地点', '书房、宿舍', '46', null, null);
INSERT INTO `product_property` VALUES ('415', '中文学名', '姬秋丽', '47', null, null);
INSERT INTO `product_property` VALUES ('416', '拉丁学名', 'Graptopetalum mendazoe', '47', null, null);
INSERT INTO `product_property` VALUES ('417', '别称', '秋丽', '47', null, null);
INSERT INTO `product_property` VALUES ('418', '科属', '景天科风车草属', '47', null, null);
INSERT INTO `product_property` VALUES ('419', '分布区域', '美国亚利桑那州', '47', null, null);
INSERT INTO `product_property` VALUES ('420', '是否开花', '开花', '47', null, null);
INSERT INTO `product_property` VALUES ('421', '形态特征', '秋丽的形态特征 秋丽的叶片细长，正面平滑圆润但有点凹凸不平，背面明显突起似龙骨状，顶端稍尖，但仍比较圆润，立体感觉犹如船形。', '47', null, null);
INSERT INTO `product_property` VALUES ('422', '生长环境', '姬秋丽喜凉爽、干燥和阳光充足的环境和排水良好的沙质土壤。', '47', null, null);
INSERT INTO `product_property` VALUES ('423', '适用地点', '书房、宿舍', '47', null, null);
INSERT INTO `product_property` VALUES ('424', '中文学名', '姬玉露', '48', null, null);
INSERT INTO `product_property` VALUES ('425', '拉丁学名', 'Haworthia cooperi var. truncata (H.Jacobsen) M.B.Bayer', '48', null, null);
INSERT INTO `product_property` VALUES ('426', '别称', '姬玉露', '48', null, null);
INSERT INTO `product_property` VALUES ('427', '科属', '阿福花科十二卷属', '48', null, null);
INSERT INTO `product_property` VALUES ('428', '分布区域', '原产地位于南非', '48', null, null);
INSERT INTO `product_property` VALUES ('429', '是否开花', '开花', '48', null, null);
INSERT INTO `product_property` VALUES ('430', '形态特征', '植株无茎，初为单生，后逐渐呈群生状；叶绿色，肉质，上半段呈透明或半透明状，称为“窗”，用于光合作用。总状花序，小花白色。', '48', null, null);
INSERT INTO `product_property` VALUES ('431', '生长环境', '喜凉爽微潮和阳光散射的环境。耐干旱，怕高温潮湿。要求疏松、颗粒较多的沙壤土地。养护最佳温度不应低于20℃。繁殖方法有分株、叶插、播种等。', '48', null, null);
INSERT INTO `product_property` VALUES ('432', '适用地点', '书房、宿舍', '48', null, null);
INSERT INTO `product_property` VALUES ('433', '中文学名', '鹿角海棠', '49', null, null);
INSERT INTO `product_property` VALUES ('434', '拉丁学名', 'Astridia velutina (L.Bolus) Dinter', '49', null, null);
INSERT INTO `product_property` VALUES ('435', '别称', '熏波菊', '49', null, null);
INSERT INTO `product_property` VALUES ('436', '科属', '番杏科鹿角海棠属', '49', null, null);
INSERT INTO `product_property` VALUES ('437', '分布区域', '原生地位于南非西南部地区，种群分布地从纳米比亚南部延伸到里希特费尔德的东北部。 [9]  中国有引进，各地均有栽培。', '49', null, null);
INSERT INTO `product_property` VALUES ('438', '是否开花', '开花', '49', null, null);
INSERT INTO `product_property` VALUES ('439', '形态特征', '鹿角海棠属多年生肉质灌木，叶粉绿色，高度肉质，基部联合对生，具三棱，全株密被极细短绒毛；花白或粉红色，冬季开花。', '49', null, null);
INSERT INTO `product_property` VALUES ('440', '生长环境', '喜温暖干燥和阳光充足的环境。耐干旱，怕高温潮湿。要求疏松的沙壤土地。冬季养护最佳温度不应低于15℃。', '49', null, null);
INSERT INTO `product_property` VALUES ('441', '适用地点', '书房、宿舍', '49', null, null);
INSERT INTO `product_property` VALUES ('442', '中文学名', '鼠尾掌', '50', null, null);
INSERT INTO `product_property` VALUES ('443', '拉丁学名', 'Disocactus flagelliformis (L.) Barthlott', '50', null, null);
INSERT INTO `product_property` VALUES ('444', '别称', '药用鼠尾草、撒尔维亚', '50', null, null);
INSERT INTO `product_property` VALUES ('445', '科属', '仙人掌科姬孔雀属', '50', null, null);
INSERT INTO `product_property` VALUES ('446', '分布区域', '原产于墨西哥。', '50', null, null);
INSERT INTO `product_property` VALUES ('447', '是否开花', '开花', '50', null, null);
INSERT INTO `product_property` VALUES ('448', '形态特征', '变态茎细长，匍匐，在原产地长可达2米，具气生根。茎粗1.5-2厘米。幼茎色绿，以后变灰。具浅棱10-14，刺座小。辐射刺10-20，针形。', '50', null, null);
INSERT INTO `product_property` VALUES ('449', '生长环境', '生长在树林中的岩石或大树上，悬垂生长在温暖、潮湿、空气湿度较大的环境中，喜光照充足的环境，最好将环境温度保持在18-28℃间。土壤应以含腐殖质较多、排水透气良好为佳。', '50', null, null);
INSERT INTO `product_property` VALUES ('450', '适用地点', '阳台、庭院', '50', null, null);
INSERT INTO `product_property` VALUES ('451', '中文学名', '凝脂莲', '51', null, null);
INSERT INTO `product_property` VALUES ('452', '拉丁学名', 'Sedum clavatum', '51', null, null);
INSERT INTO `product_property` VALUES ('453', '别称', '乙姬牡丹，乙女牡丹，峡谷景天', '51', null, null);
INSERT INTO `product_property` VALUES ('454', '科属', '景天科景天属', '51', null, null);
INSERT INTO `product_property` VALUES ('455', '分布区域', '野外多分布于墨西哥，生长于岩壁或安山岩上。该品种现已在世界多地广泛种植。', '51', null, null);
INSERT INTO `product_property` VALUES ('456', '是否开花', '开花', '51', null, null);
INSERT INTO `product_property` VALUES ('457', '形态特征', '叶匙形，互生，排列成莲座状；表面光洁，正面平坦，背面微微隆起，肉质厚实，翠绿色或嫩绿色，叶面上被白粉，并透出密布的极细微的白色颗粒。', '51', null, null);
INSERT INTO `product_property` VALUES ('458', '生长环境', '多年生半灌木，多分枝，凝脂莲常从茎的下部生出新芽，形成群生。', '51', null, null);
INSERT INTO `product_property` VALUES ('459', '适用地点', '书房、宿舍', '51', null, null);
INSERT INTO `product_property` VALUES ('460', '中文学名', '丽娜莲', '52', null, null);
INSERT INTO `product_property` VALUES ('461', '拉丁学名', 'Echeveria lilacina Kimnach & Moran', '52', null, null);
INSERT INTO `product_property` VALUES ('462', '别称', '丽娜希娜', '52', null, null);
INSERT INTO `product_property` VALUES ('463', '科属', '景天科拟石莲花属', '52', null, null);
INSERT INTO `product_property` VALUES ('464', '分布区域', '野外分布于墨西哥新莱昂州，近Rayones地区。', '52', null, null);
INSERT INTO `product_property` VALUES ('465', '是否开花', '开花', '52', null, null);
INSERT INTO `product_property` VALUES ('466', '形态特征', '丽娜莲全年都是淡淡的粉红色，叶端呈尖锐状,给人锋利的印象 [1]  。叶片肉质，呈浅粉色或藕荷色，叶顶端有小尖，先端叶缘弯折，叶面中部内凹。', '52', null, null);
INSERT INTO `product_property` VALUES ('467', '生长环境', '生长期（春秋季）盆土见干见湿，不能向叶面和中心浇水，冬季盆土稍湿即可。夏天需尤其注意通风控水。', '52', null, null);
INSERT INTO `product_property` VALUES ('468', '适用地点', '书房、卧室、宿舍', '52', null, null);
INSERT INTO `product_property` VALUES ('469', '中文学名', '茶花', '53', null, null);
INSERT INTO `product_property` VALUES ('470', '拉丁学名', 'Camellia  sp.', '53', null, null);
INSERT INTO `product_property` VALUES ('471', '别称', '山茶花', '53', null, null);
INSERT INTO `product_property` VALUES ('472', '科属', '山茶科山茶属', '53', null, null);
INSERT INTO `product_property` VALUES ('473', '分布区域', '主要分布于中国和日本。中国中部及南方各省露地多有栽培，已有1400年的栽培历史，北部则行温室盆栽。四川、台湾、山东、江西等地有野生种。', '53', null, null);
INSERT INTO `product_property` VALUES ('474', '是否开花', '开花', '53', null, null);
INSERT INTO `product_property` VALUES ('475', '形态特征', '叶革质，椭圆形，长5-10厘米，宽2.5-5厘米，先端略尖，或急短尖而有钝尖头，基部阔楔形，上面深绿色，干后发亮，无毛，下面浅绿色，无毛，侧脉7-8对，在上下两面均能见，边缘有相隔2-3.5厘米的细锯齿。叶柄长8-15毫米，无毛。', '53', null, null);
INSERT INTO `product_property` VALUES ('476', '生长环境', '茶花惧风喜阳、地势高爽、空气流通、温暖湿润、排水良好、疏松肥沃的砂质壤土，黄土或腐殖土。pH5.5-6.5最佳。适温在20-32 ℃之间，29℃以上时停止生长，35 ℃时叶子会有焦灼现象，要求有一定温差。', '53', null, null);
INSERT INTO `product_property` VALUES ('477', '适用地点', '客厅、办公室', '53', null, null);
INSERT INTO `product_property` VALUES ('478', '中文学名', '仙客来', '54', null, null);
INSERT INTO `product_property` VALUES ('479', '拉丁学名', 'Cyclamen persicum Mill.', '54', null, null);
INSERT INTO `product_property` VALUES ('480', '别称', '萝卜海棠、兔耳花、兔子花、一品冠、篝火花、翻瓣莲', '54', null, null);
INSERT INTO `product_property` VALUES ('481', '科属', '报春花科仙客来属', '54', null, null);
INSERT INTO `product_property` VALUES ('482', '分布区域', '原产希腊、叙利亚、黎巴嫩等地；现已广为栽培。', '54', null, null);
INSERT INTO `product_property` VALUES ('483', '是否开花', '开花', '54', null, null);
INSERT INTO `product_property` VALUES ('484', '形态特征', '叶片由块茎顶部生出，心形、卵形或肾形，叶片有细锯齿，叶面绿色，具有白色或灰色晕斑，叶背绿色或暗红色，叶柄较长，红褐色。', '54', null, null);
INSERT INTO `product_property` VALUES ('485', '生长环境', '仙客来性喜温暖，怕炎热，在凉爽的环境下和富含腐殖质的肥沃沙质壤土\r\n仙客来\r\n仙客来(4张)\r\n 中生长最好。较耐寒，可耐0℃的低温不致受冻。', '54', null, null);
INSERT INTO `product_property` VALUES ('486', '适用地点', '客厅、办公室', '54', null, null);
INSERT INTO `product_property` VALUES ('487', '中文学名', '红豆杉', '55', null, null);
INSERT INTO `product_property` VALUES ('488', '拉丁学名', 'Taxus wallichiana var. chinensis (Pilg.) Florin', '55', null, null);
INSERT INTO `product_property` VALUES ('489', '别称', '扁柏、红豆树、紫杉', '55', null, null);
INSERT INTO `product_property` VALUES ('490', '科属', '红豆杉科红豆科属', '55', null, null);
INSERT INTO `product_property` VALUES ('491', '分布区域', '本属约11种，分布于北半球。我国有4种1变种。', '55', null, null);
INSERT INTO `product_property` VALUES ('492', '是否开花', '开花', '55', null, null);
INSERT INTO `product_property` VALUES ('493', '形态特征', '树皮灰褐色、红褐色或暗褐色，裂成条片脱落；大枝开展，一年生枝绿色或淡黄绿色，秋季变成绿黄色或淡红褐色，二、三年生枝黄褐色、淡红褐色或灰褐色；冬芽黄褐色、淡褐色或红褐色，有光泽，芽鳞三角状卵形，背部无脊或有纵脊，脱落或少数宿存于小枝的基部。', '55', null, null);
INSERT INTO `product_property` VALUES ('494', '生长环境', '红豆杉性喜凉爽湿润气候,可耐零下30℃以下的低温,抗寒性强,最适温度20～25℃,属阴性树种。', '55', null, null);
INSERT INTO `product_property` VALUES ('495', '适用地点', '庭院', '55', null, null);
INSERT INTO `product_property` VALUES ('496', '中文学名', '虞美人', '56', null, null);
INSERT INTO `product_property` VALUES ('497', '拉丁学名', 'Papaver rhoeas  L.', '56', null, null);
INSERT INTO `product_property` VALUES ('498', '别称', '丽春花、赛牡丹、满园春、仙女蒿、虞美人草、舞草', '56', null, null);
INSERT INTO `product_property` VALUES ('499', '科属', '罂粟科罂粟属', '56', null, null);
INSERT INTO `product_property` VALUES ('500', '分布区域', '原产欧洲，中国各地常见栽培', '56', null, null);
INSERT INTO `product_property` VALUES ('501', '是否开花', '开花', '56', null, null);
INSERT INTO `product_property` VALUES ('502', '形态特征', '茎直立，高25-90厘米，具分枝。叶片轮廓披针形或狭卵形，羽状分裂，裂片披针形。花单生于茎和分枝顶端，花蕾长圆状倒卵形，下垂；萼片2，宽椭圆形；花瓣4，圆形、横向宽椭圆形或宽倒卵形，长2.5-4.5厘米。', '56', null, null);
INSERT INTO `product_property` VALUES ('503', '生长环境', '虞美人生长发育适温5-25°C，春夏温度高地区花期缩短，昼夜温差大。夜间低温有利于生长开花，在高海拔山区生长良好，花色更为艳丽。', '56', null, null);
INSERT INTO `product_property` VALUES ('504', '适用地点', '阳台、庭院', '56', null, null);
INSERT INTO `product_property` VALUES ('505', '中文学名', '酒瓶兰', '57', null, null);
INSERT INTO `product_property` VALUES ('506', '拉丁学名', 'Beaucarnea recurvata  Lem.', '57', null, null);
INSERT INTO `product_property` VALUES ('507', '别称', '象腿树', '57', null, null);
INSERT INTO `product_property` VALUES ('508', '科属', '龙舌兰科酒瓶兰属', '57', null, null);
INSERT INTO `product_property` VALUES ('509', '分布区域', '原产墨西哥西北部干旱地区，中国长江流域广泛栽培，中国北方多作盆栽。', '57', null, null);
INSERT INTO `product_property` VALUES ('510', '是否开花', '开花', '57', null, null);
INSERT INTO `product_property` VALUES ('511', '形态特征', '盆栽种植的一般0.5-1.0米。其地下根肉质，茎干直立，状似酒瓶；膨大茎干具有厚木栓层的树皮，呈灰白色或褐色。叶着生于茎于顶端，细长线状，革质而下垂，叶缘具细锯齿。', '57', null, null);
INSERT INTO `product_property` VALUES ('512', '生长环境', '性喜温暖、湿润及日光充足环境，较耐旱、耐寒。生长适宜温为16-28℃，越冬温度为0℃。喜肥沃土壤，在排水通气良好、富含腐殖质的砂质壤土上生长较佳。', '57', null, null);
INSERT INTO `product_property` VALUES ('513', '适用地点', '客厅、庭院、会议室', '57', null, null);
INSERT INTO `product_property` VALUES ('514', '中文学名', '勿忘草', '58', null, null);
INSERT INTO `product_property` VALUES ('515', '拉丁学名', 'Myosotis silvatica Ehrh. ex Hoffm.', '58', null, null);
INSERT INTO `product_property` VALUES ('516', '别称', '勿忘我', '58', null, null);
INSERT INTO `product_property` VALUES ('517', '科属', '紫草科勿忘草属 ', '58', null, null);
INSERT INTO `product_property` VALUES ('518', '分布区域', '分布于中国云南、四川、江苏、华北、西北、东北等地。欧洲以及伊朗、苏联、巴基斯坦、印度和克什米尔地区也有分布。', '58', null, null);
INSERT INTO `product_property` VALUES ('519', '是否开花', '开花', '58', null, null);
INSERT INTO `product_property` VALUES ('520', '形态特征', '多年生草本，茎直立，高20-45厘米，基生叶和茎下部叶有柄，狭倒披针形、长圆状披针形或线状披针形，花序在花期短，花后伸长，花冠蓝色，小坚果卵形，暗褐色，平滑，有光泽。', '58', null, null);
INSERT INTO `product_property` VALUES ('521', '生长环境', '勿忘草适应力强，喜干燥、凉爽的气候，忌湿热，喜光，耐旱，生长适温为20-25℃，适合在疏松、肥沃、排水良好的微碱性土壤中生长。', '58', null, null);
INSERT INTO `product_property` VALUES ('522', '适用地点', '房间、阳台', '58', null, null);
INSERT INTO `product_property` VALUES ('523', '中文学名', '滴水观音', '59', null, null);
INSERT INTO `product_property` VALUES ('524', '拉丁学名', 'Alocasia macrorrhiza', '59', null, null);
INSERT INTO `product_property` VALUES ('525', '别称', '滴水莲', '59', null, null);
INSERT INTO `product_property` VALUES ('526', '科属', '天南星科海芋属', '59', null, null);
INSERT INTO `product_property` VALUES ('527', '分布区域', '分布于中国广东、广西、云南贵州、江西、福建、台湾。', '59', null, null);
INSERT INTO `product_property` VALUES ('528', '是否开花', '开花', '59', null, null);
INSERT INTO `product_property` VALUES ('529', '形态特征', '叶聚生茎顶，盾状着生，卵状戟形，长30-90厘米，基部2裂片分离或稍合生；叶柄长达1米。总花梗长10-30厘米，佛焰苞全长10-20厘米，下部筒状，长4-5厘米。', '59', null, null);
INSERT INTO `product_property` VALUES ('530', '生长环境', '在温暖潮湿、土壤水分充足的条件下，便会从叶尖端或叶边缘向下滴水;而且开的花象观音，因此称为滴水观音。如果空气湿度过小的话，出来的水分马上就会蒸发掉，因此一般水滴都是在早晨较多，被称为“吐水”现象。', '59', null, null);
INSERT INTO `product_property` VALUES ('531', '适用地点', '房间、书房', '59', null, null);

-- ----------------------------
-- Table structure for `product_story`
-- ----------------------------
DROP TABLE IF EXISTS `product_story`;
CREATE TABLE `product_story` (
  `id` int(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `paragraph1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `paragraph2` varchar(255) DEFAULT NULL,
  `paragraph3` varchar(255) DEFAULT NULL,
  `paragraph4` varchar(255) DEFAULT NULL,
  `img_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPRESSED;

-- ----------------------------
-- Records of product_story
-- ----------------------------
INSERT INTO `product_story` VALUES ('1', '风信子', '传说美貌的少年雅辛托斯(海新瑟斯)和太阳神阿波罗是一对恋人，而西风之神杰佛瑞斯也很喜欢雅辛托斯，且常为此吃醋，但雅辛托斯更喜欢阿波罗且经常和他一起玩乐。有一天，当他们正兴高采烈地在草原上掷铁饼，恰巧被躲在树丛中的杰佛瑞斯发现了，心里很不舒服，想捉弄他们一番。', '当阿波罗将铁饼掷向雅辛托斯之际，嫉妒的西风之神偷偷地在旁边用力一吹，竟将那沉甸甸的铁饼打在雅辛托斯的额头上，一时之间血流如柱，这名俊美的少年也因此一命呜呼了。阿波罗惊慌之余，心痛地抱起断了气的爱人“唉！唉！”（Ai！Ai！）地叹着气，只见由雅辛托斯的伤口不断地涌出鲜血，落到地面上并流进草丛里。', '不久之后，草丛间竟开出串串的紫色花，阿波罗为了纪念雅辛托斯，乃以美少年之名当作花名，我们则直译为“风信子”。紫色的风信子从此被后人认为是“嫉妒”的代言者；希腊语Ai和Aei（“永远”之意）同义，所以风信子也象征“永远的怀念”，欧美人常将风信子的花样雕刻在亲人的墓碑上，以示“永久的怀念”。', '', '23');
INSERT INTO `product_story` VALUES ('2', '百合', '百合，是一种从古到今都受人喜爱的世界名花。它原来出生于神州大地，由野生变成人工栽培已有悠久历史。早在公元4世纪时，人们只作为食用和药用。', '及至南北朝时代，梁宣帝发现百合花很值得观赏，他曾诗云：“接叶有多种，开花无异色。含露或低垂，从风时偃抑。甘菊愧仙方，藂兰谢芳馥”。赞美它具有超凡脱俗，矜持含蓄的气质。', '至宋代种植百合花的人更多。大诗人陆游也利用窗前的土丘种上百合花。他也咏曰：“芳兰移取遍中林，余地何妨种玉簪，更乞两丛香百合，老翁七十尚童心”。', '时至近代，喜爱百合花者也不乏人。昔日中华人民共和国国家名誉主席宋庆龄平生对百合花就深为赏识，每逢春夏，她的居室都经常插上几枝。当她逝世的噩耗传出后”，她生前的美国挚友罗森大夫夫妇，立即将一盆百合花送到纽约的中国常驻联合国代表团所设的灵堂，以表达对她深切的悼念。', '19');
INSERT INTO `product_story` VALUES ('3', '观音竹', '观音竹是中国传统的阴生观叶植物之一，栽培历史悠久，深受人们的喜爱，因为常种在庙宇附近，就像是庙宇的守护神，所以人们又称它为观音棕竹。', '观音竹在民间被认为是一种吉祥植物，能够化煞驱邪、保住宅平安，人们常在房前屋后和庭院中种植。在风水学上，棕竹也属于“吉利之物”，种植、摆放在阳台上，可辟邪、保居室平安。', '观音竹有强大的生旺作用，风水上有生旺作用的阳台植物均高大而粗壮，愈厚大愈青绿则生旺效果愈佳。观音竹是很典型的例子，把它放在门口，相信财气会不请自来。', '观音竹乃是护宅驱邪植物，如果觉得家人总是生病，工作总是不顺利，学习总是退步，可以应该放一棵观音竹在门前，让观音竹把邪气赶走，还你一个幸福的家。观音竹属水性植物，门口向东的房子可以摆放一棵观音竹，可改善肾和肝的健康状况。', '78');
INSERT INTO `product_story` VALUES ('4', '常春藤', '常春藤在以前被认为是一种神奇的植物，并且象征忠诚的意义。在希腊神话中，常春藤代表酒神∶迪奥尼索司（Dionysus），有着欢乐与活力的象征意义。它同时也象征著不朽与永恒的青春。', '常春藤是一种十分美好的常绿藤本植物，预示春天长驻，因此有一个美好的名字\"长春藤\"，深得人们的喜爱。送友人长春藤表示友谊之树长青。如果朋友结婚，送新娘的花束中也少不了长春藤美丽的身影。祝愿\"新婚幸福，百头偕老。\"', '在婚礼上，你会发现新娘的的头上常插着一块绿色的植物，那就是用来避邪的常春藤；新娘的花束中也少不了长春藤美丽的身影，寓意生活不受小人或者妖魔鬼怪的影响，而男人戴上它可以辨别恋人的好恶。另外，常春藤还代表着忠实、婚姻、爱情、友谊、感情，代表着友情或者爱情永远保鲜，永不退色。', '', '86');
INSERT INTO `product_story` VALUES ('5', '鸢尾', '鸢尾花主要色彩为蓝紫色，有“蓝色妖姬”的美誉，鸢尾花因花瓣形如鸢鸟尾巴而称之其属名iris，“爱丽丝”。爱丽丝在希腊神话中是彩虹女神，她是众神与人间的使者，主要任务在于将善良人死后的灵魂，经由天地间的彩虹桥携回天国。', '法国是一个鲜花之国，它的首都巴黎有“花都”的美誉。鸢尾被视为法兰西王国的国花。因为相传法兰西王国第一个王朝的国王克洛维在受洗礼时，上帝送给他一件礼物，就是鸢尾。', '在法国，鸢尾是光明和自由的象征。鸢尾在古埃及代表了“力量”与“雄辩”。以色列人则普遍认为黄色鸢尾是“黄金”的象征，故有种植鸢尾的风俗，即盼望能为来世带来财富。', '莫奈在吉维尼的花园中也植有鸢尾；并以它为主题，在画布上留下充满自然生机律动的鸢尾花景象。', '113');
INSERT INTO `product_story` VALUES ('6', '蜀葵', '自古以来，基督教里就有将圣人与特定花朵连结在一起的习惯，这因循于教会在纪念圣人时，常以盛开的花朵点缀祭坛所致，而在中世纪的天主教修道院内，更是有如园艺中心般的种植着各式各样的花朵，久而久之，教会便将366天的圣人分别和不同的花朵合在一起，形成所谓的花历。', '当时大部分的修道院都位在南欧地区，而南欧属地中海型气候，极适合栽种花草。蜀葵是属于锦葵科锦葵属的植物，是被选来祭祀圣斯塔法诺的花朵。他在巴勒斯坦向众人讲解耶稣遭杀害的经过时，被犹太人以乱石击死。', '后来他托梦告诉主教，公元415年人们才发现圣斯塔法诺的遗骸。因此蜀葵的花语是“梦”。凡是在这天出生的人，是个爱作梦的孩子。尤其幻想着自己爱情就像小说情节般高潮迭起，精彩绝伦。', '', '117');
INSERT INTO `product_story` VALUES ('7', '晚香玉', '相传古代有一位姓张的美少年，他的笛声非常优美，远近驰名。有一个月色很美的夏天晚上，少年倚树吹笛，正吹得高兴，突然一片紫云飞近他的上空，一位美丽的仙女自云端翩然而下，仙女说她是月宫的使者，嫦娥听到他的笛声，特地命令她下来索取乐谱，吹笛手欣然相赠。', '嫦娥得到乐谱，命月宫中的乐师吹奏，欢欣之余，为了表示谢意，便又命令先前那位仙女下凡邀请少年上月宫。少年突然对人世间起了依恋之情，于是向仙女要求延缓一天上月宫。', '仙女没有答应他，仅拔下头上的玉簪送给他做纪念，在抛给他之际，少年没有接住，玉簪掉落地上，可是怎么找也找不到。', '结果玉簪变成了花，少年则依然留在世间，而此花不仅在夜间散放香味，尤其是在皎洁的月光下，芳香最为浓郁，是以晚香玉。', '121');
INSERT INTO `product_story` VALUES ('8', '玫瑰', '在中国，玫瑰则因其枝茎带刺，被认为是刺客、侠客的象征。', '而在西方则把玫瑰花当作严守秘密的象征，做客时看到主人家桌子上方画有玫瑰，就明白在这桌上所谈的一切均不可外传，于是有了Sub rosa，“在玫瑰花底下”这个拉丁成语。 ', '英语的under the rose则是源自德语unter der Rosen，古代德国的宴会厅、会议室以及酒店餐厅，天花板上常画有或刻有玫瑰花，用来提醒与会者守口如瓶，严守秘密，不要把玫瑰花下的言行透露出去。', '这是起源于罗马神话中的荷鲁斯（Horus）撞见美女——爱的女神“维纳斯”偷情的情事，她儿子丘比特为了帮自己的母亲保有名节，于是给了他一朵玫瑰，请他守口如瓶，荷鲁斯收了玫瑰于是缄默不语，成为“沉默之神”，这就是under the rose之所以为守口如瓶的由来。', '23');
INSERT INTO `product_story` VALUES ('9', '栀子花', '从春天到初夏都可以看到栀子花的白色花朵。高雅的香气令人无法忽视她的存在。', '栀子花的花语是“喜悦”就如生机盎然的夏天充满了未知的希望和喜悦。花占卜 您有感恩图报之心以真诚待人只要别人对您有少许和善您便报以心灵致谢。这是因为您有一颗赤子之心不懂人心险恶而您的真诚使您常怀欢愉宽恕他人也使您充满喜悦。', '也有解释说栀子花的花语是“永恒的爱与约定”。很美的寄托。大意是因为此花从冬季开始孕育花苞直到近夏至才会绽放含苞期愈长清芬愈久远栀子树的叶也是经年在风霜雪雨中翠绿不凋。', '于是虽然看似不经意的绽放也是经历了长久的努力与坚持。或许栀子花这样的生长习性更符合这一花语。不仅是爱情的寄予平淡、持久、温馨、脱俗的外表下蕴涵的是美丽、坚韧、 醇厚的生命本质。', '144');
INSERT INTO `product_story` VALUES ('10', '芍药', '芍药被人们誉为“花仙”和“花相”，且被列为“十大名花”之一，又被称为“五月花神”，因自古就作为爱情之花，现已被尊为七夕节的代表花卉。另外，“憨湘云醉眠芍药裀”是被誉为红楼梦中经典情景之一。', '中国芍药观赏胜地主要有：江苏扬州（中国仪征芍药节，仪征芍药园俗称中华第一芍药园）、四川中江（中国芍药之乡中国芍药谷4A景区）、亳州（全国最大的中药材交易市场）、此外还有：菏泽（曹州百花园）、洛阳（国家牡丹园）、北京（景山公园）。', '传说中牡丹芍药都不是凡花种，是某年人间瘟疫，玉女或者花神为救世人盗了王母仙丹撒下人间。结果一些变成木本的牡丹，另一些变成草本的芍药，至今芍药还带着个“药”字。牡丹、芍药的花叶根茎确实可以入药，牡丹的丹皮是顶有名的，白芍更是滋阴补血的上品。', '古代西方也有类似的传说，说古希腊名医阿斯克列皮耶有个聪明的学生佩翁青出于蓝，甚至治好了冥神海提斯的伤。阿斯克列皮耶嫉妒之下就杀了佩小弟。好在冥王顾念恩情，把佩小弟变成了一种能治病的花，即芍药。西方人也一直认为芍药具有某种魔力，凡有芍药生长的地方，恶魔都会消失得无影无踪，甚至可以对抗至毒之花——曼陀罗。', '154');
INSERT INTO `product_story` VALUES ('11', '茶花', '茶花是云南省省花，昆明市、重庆市、宁波市市花，云南大理白族自治州州花。', '山茶花开花于冬春之际，花姿丰盈，端庄高雅，是中国传统十大名花之一，也是世界名花之一。郭沫若盛赞曰：“茶花一树早桃红，百朵彤云啸傲中。', '”山茶花，既具有“唯有山茶殊耐久，独能深月占春风”的傲梅风骨，又有“花繁艳红，深夺晓霞”的凌牡丹之鲜艳，因此自古以来就是极富盛名的木本花卉，在唐宋两朝达到了登峰造极之境，十七世纪引入欧洲后也造成轰动，也因此获得“世界名花”的美名。', '山茶花的花语是：理想的爱、谦让。据说，山茶花总是在晚秋天气稍凉时，静静地开在庭院之中。山茶花凋谢时，不是整个花朵掉落下来，而是花瓣一片片地慢慢凋谢，直到生命结束。这么小心翼翼、依依不舍的凋谢方式，和人们追求理想中伴侣的态度一样，所以渐渐地山茶花就成为对心中爱慕女性表达心意的代言了。', '215');
INSERT INTO `product_story` VALUES ('12', '仙客来', '仙客来的花语是内向。仙客来以前大多是野生的，栽培在温室里虽然美丽的它，生命力稍嫌脆弱。因此仙客来的花语就是内向。', '仙客来为世界著名花卉，原产地在欧洲南部希腊等地中海地区。此花花色艳丽，花形独特，刚伸出来的花苞不卷不变，宛如腼腆害羞的少女；等开放时，反卷的花冠，似醉蝶翩翩起舞，又象兔子的耳朵，很像神话“嫦娥奔月”中的月宫玉兔。因此，这花又叫兔耳花。', '中国是在上世纪二三十年代开始少量引入仙客来进行栽培的，其中文名称据说是国画大师张大千先生根据英文名“Cyclamen”的发音而取的，既符合音韵，意义又好。', null, '218');
INSERT INTO `product_story` VALUES ('13', '红豆杉', '关于红豆杉的花语有两种说法，有人说，红豆杉代表高雅，高傲。因为红豆杉能生长到15米高，即使在欧洲地区，也很少能看见有这样高大的树木，所以，高耸入云的红豆杉，就显得孤立而典雅。', '有人说，红豆杉自古以来代表是的思念、相思之情。我更倾向于这一说法，一是基于它的外表，一两点红隐于绿叶中，像娇羞的女子，亦或是三五簇相拥，像是相思的少女在表达火热的内心。这一花语也可以说是来源于它的传说。', '相传，这世上是没有红豆杉的，是一只名叫“爱”的小鸟用它有魔力的泪水浇灌出来的。“爱”因痛失女儿而怀着悲伤之情种下一粒种子并细心呵护，这株植物后来为报恩而努力成长，以至于“爱”死去后，红豆杉依旧告知它的儿女们要世世代代报恩。', '红豆杉也一直在等待它的“恩人”。所以人们常说，在红豆杉树下静静聆听，会听到不一样的声音。', '222');
INSERT INTO `product_story` VALUES ('14', '虞美人', '相传秦朝末年，楚汉相争，西楚霸王项羽兵败，被汉军围于垓下。项羽自知难以突出重围，便与宠妾虞姬夜饮。忽然听到楚歌四起，不禁慷慨悲歌：力拔山兮气盖世，时不利兮骓不逝。骓不逝兮可奈何？虞兮虞兮奈若何？虞姬也感到大势已去，含泪唱《和垓下歌》起舞。', '歌云：“汉兵已略地，四方楚歌声，大王意气尽，贱妾何聊生！”歌罢，从项羽腰间拔出佩剑，向颈一横，顿时血流如注，香销玉殒。这就是战国时期最为凄美悲壮的爱情故事之一——“霸王别姬”，传颂千百年来，一直令人唏嘘不已。', '后来，在虞姬的墓上长出了一种草，形状象鸡冠花，叶子对生，茎软叶长，无风自动，似美人翩翩起舞，娇媚可爱。民间传说这是虞姬精诚所化，于是就把这种草称为“虞美人草”，其花称作“虞美人”。', '虞美人花朵上鲜艳的红色，据说就是虞姬飞溅的鲜血染成。似乎虞姬死后仍在，她变成了虞美人草，年年在春末夏初这段时间开花，即使转为草胎木质，依然执着，仍是那一份对霸王的坚贞与守候，还是像从前一样终年不停地为霸王展颜巧笑、弄衣翩跹。', '225');
INSERT INTO `product_story` VALUES ('15', '勿忘草', '勿忘草原是一种极普通的花草。人们之所以送给它“勿忘我”这样的极富诗意的名字，是源于这么一个美丽的传说。', '欧洲古代有一位骑士，他带着恋人到海滨游览。恋人看到水边有一丛小花，要采来插戴。骑士为表示自己对恋人的爱情，涉水去采。不料海潮汹涌而来，把他去了。', '骑士忙将那丛花用力抛到岸上，大声喊道：“不要忘了我！”后来，人们就把这种花叫做“勿忘我”花。', '这种花由于寄寓了一种深沉的爱，人们就把它看做花中的情种，男女相爱，往往把它扎成花束互相赠送，代表“勿忘我”相思之情，表示双方的深恋密爱。', '231');

-- ----------------------------
-- Table structure for `product_worth`
-- ----------------------------
DROP TABLE IF EXISTS `product_worth`;
CREATE TABLE `product_worth` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_worth
-- ----------------------------
INSERT INTO `product_worth` VALUES ('1', '观赏', '适于布置花坛、花境和花槽，也可作切花、盆栽或水养观赏。', '1', null, null);
INSERT INTO `product_worth` VALUES ('2', '其他', '有滤尘作用，花香能稳定情绪，消除疲劳作用。提取芳香油。', '1', null, null);
INSERT INTO `product_worth` VALUES ('3', '室内栽培', '常绿小灌木类的茉莉花叶色翠绿，花色洁白，香味浓厚,为常见庭园及盆栽观赏芳香花卉。', '2', null, null);
INSERT INTO `product_worth` VALUES ('4', '其他', '提取茉莉油，是制造香精的原料，茉莉油的身价很高，相当于黄金的价格。茉莉花还可薰制茶叶，或蒸取汁液，可代替蔷薇露  ，地处江南的苏州、南京、杭州、金华等地长期以来都作为熏茶香料进行生产。', '2', null, null);
INSERT INTO `product_worth` VALUES ('5', '观赏', '水仙花在客厅，能让人感到宁静、温馨。水仙花在书房和睡房，营造出一种恬静舒适的气氛。', '3', null, null);
INSERT INTO `product_worth` VALUES ('6', '药用', '水仙以鳞茎入药，春秋采集，洗去泥沙，开水烫后，切片晒干或鲜用，有小毒。具有清热解毒，散结消肿等疗效。用于腮腺炎，痈疖疔毒初起红肿热痛等症。', '3', null, null);
INSERT INTO `product_worth` VALUES ('7', '营养价值', '百合鲜食干用均可。百合是中国传统出口特产。', '4', null, null);
INSERT INTO `product_worth` VALUES ('8', '药用价值', '养阴润肺；清心安神。主阴虚久嗽；痰中带血；热病后期；余热未清，或情志不遂所致的虚烦惊悸、失眠多梦、精神恍惚；痈肿；湿疮。', '4', null, null);
INSERT INTO `product_worth` VALUES ('9', '环境应用', '环保学家发现，一盆绿萝在8～10㎡的房间就相当于一个空气净化器，能有效吸收空气中甲醛、苯和三氯乙烯等有害气体。', '5', null, null);
INSERT INTO `product_worth` VALUES ('10', '观赏', '绿萝其缠绕性强，气根发达，叶色斑斓，四季常绿，长枝披垂，是一种较适合室内摆放的观叶植物', '5', null, null);
INSERT INTO `product_worth` VALUES ('11', '环境应用', '吊兰能在微弱的光线下进行光合作用，可吸收室内80%以上的有害气体，吸收甲醛的能力超强', '6', null, null);
INSERT INTO `product_worth` VALUES ('12', '药用价值', '药材基源：为天门冬科植物吊兰的全草或根。采收和储藏：全年均可采收，洗净鲜用。味甘；微苦；性凉，有化痰止咳；散瘀消肿；清热解毒等功效。', '6', null, null);
INSERT INTO `product_worth` VALUES ('13', '药用价值', '以全草入药，具有袪风除湿、行血止痛、治风湿骨痛和抗菌消炎功效，藏医临床常用于治疗月经不调、旧伤复发、瘰疠等症，还可以作为抗衰老、延年益寿的滋补药。', '7', null, null);
INSERT INTO `product_worth` VALUES ('14', '观赏价值', '仙人球在花卉园艺界习惯上将仙人掌类植物中的球形品种称为仙人球；仙人球是一种茎、叶、花均有较高观赏价值。', '8', null, null);
INSERT INTO `product_worth` VALUES ('15', '药用价值', '仙人掌性寒，味苦，含有三萜、苹果酸、琥珀酸、碳酸钾等成分，具有行气活血、滋补健胃、清热解毒的功效。', '8', null, null);
INSERT INTO `product_worth` VALUES ('16', '观赏', '赏菊，一直是中国民间长期流传的习惯，远从古代的京都帝王宫廷、官宦门第和庶民百姓，近至当今中国各城市的人民群众，每年都在秋天举行菊花会、菊展和菊式等各种形式的赏菊活动。', '9', null, null);
INSERT INTO `product_worth` VALUES ('17', '药用', '菊花能入药治病，久服或饮菊花茶能令人长寿。', '9', null, null);
INSERT INTO `product_worth` VALUES ('18', '园林应用', '皱叶冷水花叶片褐红色，叶脉凸起，叶面波皱十分美观。它是冷水花中的精品，也适宜室内外成片、成带景观布置。', '10', null, null);
INSERT INTO `product_worth` VALUES ('19', '药用价值', '夏、秋季采收，鲜用或晒干，有清热利湿、退黄、消肿散结、健脾和胃功效。', '10', null, null);
INSERT INTO `product_worth` VALUES ('20', '经济价值', '在长春农博会上展出的天价君子兰（2010年8月20日摄）。正在举行的长春农博会上，一些君子兰名品标出188万、288万的高价，而一株标价7777万元的君子兰堪称魁，格外引人注目。', '11', null, null);
INSERT INTO `product_worth` VALUES ('21', '观赏价值', '君子兰，株形端庄优美，叶片苍翠挺拔，花大色艳，果实红亮，叶花果并美，有一季观花、三季观果、四季观叶之称。', '11', null, null);
INSERT INTO `product_worth` VALUES ('22', '环保价值', '君子兰具有吸收二氧化碳和放出氧气、吸收尘埃、美化居室的功能', '11', null, null);
INSERT INTO `product_worth` VALUES ('23', '观赏价值', '蝴蝶兰色彩多种，从纯白、粉红、黄花着斑、线都有。蝴蝶兰已是当今兰花之后（嘉德丽雅是兰花之王）。', '12', null, null);
INSERT INTO `product_worth` VALUES ('24', '观赏价值', '白鹤芋花茎挺拔秀美，盆栽点缀客厅、书房，十分舒泰别致，显得高雅俊美。在南方，配置小庭园、池畔、墙角处，别具一格。另外白鹤芋的花也是极好的花篮和插花的装饰材料。', '13', null, null);
INSERT INTO `product_worth` VALUES ('25', '净化空气', '白鹤芋可以过滤室内废气，对付氨气，丙酮，苯和甲醛都有一定功效。用水根\r\n白鹤芋\r\n白鹤芋(5张)\r\n 栽培的白鹤芋，可以透过蒸散作用调节室内的温度和湿度，能有效净化空气中的挥发性有机物。', '13', null, null);
INSERT INTO `product_worth` VALUES ('26', '观赏价值', '观音竹秆叶细密，姿态优雅。常用作绿篱和盆景，也可于庭园密丛植作草地添景和假山上配置或盆栽观赏。', '14', null, null);
INSERT INTO `product_worth` VALUES ('27', '食用价值', '芦荟（Aloe vera，即库拉索芦荟）可食用。如今，库拉索芦荟凝胶制品已经被广泛应用于饮料、果冻、酸奶、罐头等食品的制作中。', '15', null, null);
INSERT INTO `product_worth` VALUES ('28', '保健价值', '芦荟蕴含75种元素，与人体细胞所需物质几乎完全吻合，有着明显的保健价值，被人们荣称为“神奇植物”、“家庭药箱”。抗衰老、促进愈合、强心活血、免疫和再生', '15', null, null);
INSERT INTO `product_worth` VALUES ('29', '美容价值', '芦荟中含的多糖和多种维生素对人体皮肤有良好的营养、滋\r\n芦荟叶片的横截面\r\n芦荟叶片的横截面\r\n润、增白作用。', '15', null, null);
INSERT INTO `product_worth` VALUES ('30', '中医药', '泻火；解毒；化瘀；杀虫。主目赤；便秘；白浊；尿血；小儿惊痫；疳积；烧烫伤；妇女闭经；痔疮；疥疮；痈疖肿毒；跌打损伤。', '15', null, null);
INSERT INTO `product_worth` VALUES ('31', '绿化', '在庭院中可用以攀缘假山、岩石，或在建筑阴面作垂直绿化材料。', '16', null, null);
INSERT INTO `product_worth` VALUES ('32', '药用', '祛风利湿，活血消肿，平肝，解毒。用于风湿关节痛，腰痛，跌打损伤，肝炎、头晕、口眼蜗斜、衄血、目翳、急性结膜炎，肾炎水肿，闭经、痈疽肿毒，荨麻疹，湿疹。', '16', null, null);
INSERT INTO `product_worth` VALUES ('33', '生态', '在10平方米左右的房间内，可消灭70%的苯、50%的甲醛和24%的三氯乙烯，一盘常青藤甲醛的吸附量相当于10克椰维炭的甲醛吸附量。', '16', null, null);
INSERT INTO `product_worth` VALUES ('34', '观赏价值', '捕蝇草的形态比较独特，捕食小虫增加观赏趣味', '17', null, null);
INSERT INTO `product_worth` VALUES ('35', '净化空气', '没有毒性的，平时养殖不会给人们造成任何危害，相反它还能去除空气中有毒气体，而且即使没有阳光的照耀，它也不会散发出二氧化碳，与人们争夺氧气，可摆放在卧室养护。', '17', null, null);
INSERT INTO `product_worth` VALUES ('36', '捕食小虫', '捕蝇草的形态比较独特，一般它的叶片边缘会分泌出蜜腺，这时会吸引周围的昆虫靠近，当昆虫进入叶片内部时，昆虫触碰的叶片两端，那么它就会闭合防止昆虫逃跑，最后使其昆虫成为养分', '17', null, null);
INSERT INTO `product_worth` VALUES ('37', '观赏价值', '形态奇特，有趣，起到一定美化观赏价值', '18', null, null);
INSERT INTO `product_worth` VALUES ('38', '捕食小虫', '帮助用户捕食小虫', '18', null, null);
INSERT INTO `product_worth` VALUES ('39', '药用价值', '清肺润燥，行水，解毒。治肺燥咳嗽，百日咳，黄疸，胃痛，痢疾，水肿，痈肿，虫咬伤。', '18', null, null);
INSERT INTO `product_worth` VALUES ('40', '观赏价值', '适于在庭院中墙隅、屋角、门旁配植，植株较小的凤尾竹可栽植于花台上，也可制作竹类盆景', '19', null, null);
INSERT INTO `product_worth` VALUES ('41', '园林价值', '散尾葵是小型的棕榈植物，耐阴性强。在家居中摆放散尾葵，能够有效去除\r\n散尾葵\r\n散尾葵(3张)\r\n 空气中的苯、三氯乙烯、甲醛等有挥发性的有害物质。', '20', null, null);
INSERT INTO `product_worth` VALUES ('42', '医药价值', '收敛止血。主治：吐血咯血；便血；崩漏', '20', null, null);
INSERT INTO `product_worth` VALUES ('43', '药用价值', '含羞草甘、涩，凉。宁心安神，清热解毒。用于吐泻，失眠，小儿疳积，目赤肿痛，深部脓肿，带状泡疹。 根（含羞草根）：涩、微苦。有毒。止咳化痰，利湿通络，和胃，消积。用于咳嗽痰喘，风湿关节痛，小儿消化不良。', '21', null, null);
INSERT INTO `product_worth` VALUES ('44', '观赏价值', '含羞草株形散落，羽叶纤细秀丽，其叶片一碰即闭合；含羞草花多而清秀，楚楚动人，给人以文弱清秀的印象。', '21', null, null);
INSERT INTO `product_worth` VALUES ('45', '药用价值', '润肺止咳，凉血通淋，利尿解毒.。主治肺结核咳嗽，急性支气管炎，阿米巴痢疾，阴虚肺燥；咳嗽；咯血；小便淋沥。', '22', null, null);
INSERT INTO `product_worth` VALUES ('46', '观赏价值', '文竹以盆栽观叶为主，清新淡雅，布置书房更显书卷气息。文竹枝叶纤细，挺拔秀丽，疏密青翠，姿态潇洒，是良好的切花、花束、花篮的陪衬材料。', '22', null, null);
INSERT INTO `product_worth` VALUES ('47', '观赏价值', '鸢尾叶片碧绿青翠，花形大而奇，宛若翩翩彩蝶，是庭园中的重要花卉之一，也是优美的盆花、切花和花坛用花。其花色丰富，花型奇特，是花坛及庭院绿化的良好材料，也可用作地被植物，有些种类为优良的鲜切花材料。国外有用此花作成香水的习俗。', '23', null, null);
INSERT INTO `product_worth` VALUES ('48', '药用价值', '活血祛瘀，祛风利湿，解毒，消积。用于跌打损伤，风湿疼痛，咽喉肿痛，食积腹胀，疟疾；外用治痈疖肿毒，外伤出血。', '23', null, null);
INSERT INTO `product_worth` VALUES ('49', '观赏价值', '如果你想送花给你的爱人或女朋友来赞美她温和的个性、贤妻良母。那么，可以考虑一下送代表着温和花语的红蜀葵。红蜀葵，也就是红色的蜀葵，红色的蜀葵十分漂亮，颜色鲜艳，给人清新的感觉，很受人喜欢。', '24', null, null);
INSERT INTO `product_worth` VALUES ('50', '医药价值', '根：清热，解毒，排脓，利尿。用于肠炎，痢疾，尿道感染，小便赤痛，子宫颈炎，白带。\r\n子：利尿通淋。用于尿路结石，小便不利，水肿。 \r\n花：通利大小便，解毒散结。用于大小便不利，梅核气，并解河豚毒。\r\n花、叶：外用治痈肿疮疡，烧烫伤。', '24', null, null);
INSERT INTO `product_worth` VALUES ('51', '药用价值', '清热解毒。主痈疮肿毒。', '25', null, null);
INSERT INTO `product_worth` VALUES ('52', '观赏价值', '晚香玉翠叶素茎，碧玉秀荣，含香体洁，幽香四溢，使人七月忘暑，心旷神怡。', '25', null, null);
INSERT INTO `product_worth` VALUES ('53', '经济价值', '晚香玉是提取香精的原料。晚香玉浸膏主要成分有香叶醇、橙花醇、乙酸橙花酯、苯甲酸甲酯、邻氨基苯甲酸甲酯、苄醇、金合欢醇、丁香酚和晚香玉酮等，用于食品，能赋予食品以独特的晚香玉气味。', '25', null, null);
INSERT INTO `product_worth` VALUES ('54', '观赏价值', '石竹花是起源于我国的一种花卉，现今在世界上许多国家都有种植，这种植物的花色十分丰富，可以说是缤纷多彩，在家里养殖一株还能够起到美化室内环境的作用。', '26', null, null);
INSERT INTO `product_worth` VALUES ('55', '净化空气', '石竹花有什么功效，石竹花的功效与作用/药用价值高\r\n编辑：xiongkai2018-07-02 14:04:28\r\n石竹花是一种人们生活中比较常见的花卉植物，有着很高的观赏性，不过它的作用可不仅如此，它还有着许多对人有益的功效，那么石竹花有什么功效呢？石竹花的功效与作用都有哪些？下面小编带大家来了解一下。\r\n\r\n\r\n\r\n一、石竹花有什么功效\r\n\r\n\r\n说到石竹花有什么功效，观赏作用肯定是最为人熟知的，除此之外它还有着极高的药用价值，对于许多病症都有着一定的治疗效果，具体详情在下文石竹花的功效与作用有介绍，', '26', null, null);
INSERT INTO `product_worth` VALUES ('56', '药用价值', '它的根部是可以入药的，且对于一些疮毒，湿疹，都有着不错的治疗效果，在我国古代著名的医学著作《本草备要》当中有提到过石竹花“降心火，利小肠，逐膀胱邪热，为治淋要药。”', '26', null, null);
INSERT INTO `product_worth` VALUES ('57', '观赏价值', '虎尾兰叶片坚挺直立，叶面有灰白和深绿相间的虎尾状横带斑纹，品种较多，株形和叶色变化较大，对环境的适应能力强，是一种坚韧不拔的植物，栽培利用广泛，为常见的家内盆栽观叶植物。', '27', null, null);
INSERT INTO `product_worth` VALUES ('58', '药用价值', '清热解毒；活血消肿。主感冒、肺热咳嗽、疮疡肿毒、跌打损伤、毒蛇咬伤、烫火伤。', '27', null, null);
INSERT INTO `product_worth` VALUES ('59', '净化空气', '虎尾兰堪称卧室植物，即便是在夜间它也可以吸收二氧化碳，放出氧气。六棵齐腰高的虎尾兰就可以满足一个人的吸氧量。在室内养殖虎尾兰配合使用椰维炭，不仅可以提高人们的工作效率，还能在夏季减少开窗换气。', '27', null, null);
INSERT INTO `product_worth` VALUES ('60', '观赏价值', '瓜栗树形似伞状，树干苍劲古朴，茎基部膨大肥圆，其上车轮状的绿叶辐射平展，枝叶潇洒婆娑，极其自然美，观赏价值很高。', '28', null, null);
INSERT INTO `product_worth` VALUES ('61', '食用价值', '果皮未熟时可食，种子可炒食。', '28', null, null);
INSERT INTO `product_worth` VALUES ('62', '观赏价值', '品种较多，颜色鲜艳，利于观赏', '29', null, null);
INSERT INTO `product_worth` VALUES ('63', '药用价值', '凉血降压，镇静安神。用于高血压、火烫伤、恶性淋巴瘤、绒毛膜上皮癌、单核细胞性白血病。', '29', null, null);
INSERT INTO `product_worth` VALUES ('64', '药用价值', '饮用花草茶不仅可使人心情愉悦、振奋精神、还具有活血调筋、养肤养颜、安神减压、纤身美体、保健强身和祛病延年的神奇功效。经常饮用还可使皮肤细嫩红润、光洁亮丽、富有光泽和弹性。', '30', null, null);
INSERT INTO `product_worth` VALUES ('65', '美容保健', '抗氧化，镇静身心、去除紧张、安抚烦躁的情绪，恢复身心的平衡。振奋精神，激发活力，消除疲劳。', '30', null, null);
INSERT INTO `product_worth` VALUES ('66', '观赏价值', '作为庭园中备供观赏暨散发香气之植物，当花苞膨大而外苞行将裂解脱落时，所采摘下的含笑花气味最为香浓。', '30', null, null);
INSERT INTO `product_worth` VALUES ('67', '食用价值', '凉拌栀子花、栀子花鲜汤、栀子蛋花等', '31', null, null);
INSERT INTO `product_worth` VALUES ('68', '药用价值', '中医上以果实入药，称之为山栀子，或称为栀子、焦山栀、生栀子、支子、木丹、越桃、㮁桃，性寒、味苦，功能清热泻火，主治热病心烦、目赤、黄疸、吐血、衄血、热毒疮疡等症。', '31', null, null);
INSERT INTO `product_worth` VALUES ('69', '日用化工', '。用栀子花采用浸提法可生产栀子花浸膏浸膏得率0.1-0.13%可广泛用于化妆品香料和食品香料。采用水蒸气蒸馏法可生产栀子花油。', '31', null, null);
INSERT INTO `product_worth` VALUES ('70', '园林观赏', '栀子叶色亮绿，四季常青，花大洁白，芳香馥郁，又有一定耐荫和抗有毒气体的能力，故为良好的绿化、美化、香化的材料。', '31', null, null);
INSERT INTO `product_worth` VALUES ('71', '观赏价值', '形态小巧别致，置于室内另有一番轻快、悠闲的热带风情。', '32', null, null);
INSERT INTO `product_worth` VALUES ('72', '净化空气', '能够净化空气中的苯、三氯乙烯和甲醛，并有一定的杀菌功能，蒸腾作用效率高，有利于增加室内负离子浓度。', '32', null, null);
INSERT INTO `product_worth` VALUES ('73', '观赏价值', '铁线蕨株型小巧、形态别致，适宜小型盆栽，点缀山石盆景，置于案头、窗台、矮柜之上，清秀洒脱', '33', null, null);
INSERT INTO `product_worth` VALUES ('74', '药用价值', '铁线蕨全草入药。苦，凉。有清热利湿、消肿解毒、止咳平喘、利尿通淋的作用。', '33', null, null);
INSERT INTO `product_worth` VALUES ('75', '观赏价值', '芍药可做专类园、切花、花坛用花等，芍药花大色艳，观赏性佳，和牡丹搭配可在视觉效果上延长花期，因此常和牡丹搭配种植。芍药也可做切花。', '34', null, null);
INSERT INTO `product_worth` VALUES ('76', '药用价值', '中药里的白芍主要是指芍药的根，它具有镇痉、镇痛、通经作用。对妇女的腹痛、胃痉挛、眩晕、痛风、利尿等病症有效。', '34', null, null);
INSERT INTO `product_worth` VALUES ('77', '食用价值', '芍药花粥、芍药花饼、芍药花茶', '34', null, null);
INSERT INTO `product_worth` VALUES ('78', '其他用途', '芍药的种子可榨油供制肥皂和掺合油漆作涂料用。根和叶富有鞣质，可提制栲胶，也可用作土农药，可以杀大豆蚜虫和防治小麦秆锈病等。', '34', null, null);
INSERT INTO `product_worth` VALUES ('79', '观赏价值', '球兰枝条飘逸，优美、小巧玲珑', '35', null, null);
INSERT INTO `product_worth` VALUES ('80', '药用价值', '清热化痰，消肿止痛。治肺热咳嗽，痈肿，瘰疬，乳妇奶少，关节疼痛，睾丸炎。', '35', null, null);
INSERT INTO `product_worth` VALUES ('81', '净化空气', '净化苯、甲醛，同时又能吸附空气中的废气和污染物。', '36', null, null);
INSERT INTO `product_worth` VALUES ('82', '观赏价值', '它株态优美，叶形多变，色彩清雅，与绿萝、蔓绿绒被誉为天南星科的代表性室内观叶植物。', '36', null, null);
INSERT INTO `product_worth` VALUES ('83', '观赏价值', '龟背竹叶形奇特，孔裂纹状，极像龟背。茎节粗壮又似罗汉竹，深褐色气生根，纵横交差，形如电线。其叶常年碧绿，茎粗壮，节上有较大的新月形叶痕，生有索状肉质气生根，极为耐阴，是室内大型盆栽观叶植物。', '37', null, null);
INSERT INTO `product_worth` VALUES ('84', '观赏价值', '鸿运当头是一种十分美丽既可观花又能赏叶的室内盆栽花卉。它以基特有的莲座状株型，鲜艳的穗状花序，较长的花期逐渐成为花卉市场上的“宠儿”。特别是它红艳的花色，给人的感觉是活跃的，特别适合喜欢朝气的人们。', '38', null, null);
INSERT INTO `product_worth` VALUES ('85', '生态应用', '鸿运当头晚上可以大量地吸入二氧化碳和释放氧气。所以，在家里放置一盆鸿运当头，就意味着拥有一个家庭的氧吧。', '38', null, null);
INSERT INTO `product_worth` VALUES ('86', '园林价值', '铁线莲垂直绿化的主要方式有廊架绿亭、立柱、墙面、造型和篱垣栅栏式。廊架绿亭式，利用于花架、棚架、廊、灯柱、栅栏、拱门等配置构成园林绿化独立的景观。', '39', null, null);
INSERT INTO `product_worth` VALUES ('87', '药用价值', '利尿；通络；理气通便；解毒。主主治风湿性关节炎；小便不利；闭经；便秘腹胀；风火牙痛；眼起星翳；虫蛇咬伤；黄疸。', '39', null, null);
INSERT INTO `product_worth` VALUES ('88', '观赏价值', '络石在园林中多作地被，或盆栽观赏，为芳香花卉。供观赏。', '40', null, null);
INSERT INTO `product_worth` VALUES ('89', '药用价值', '根、茎、叶、果实供药用，有祛风活络、利关节、止血、止痛消肿、清热解毒之效能，我国民间有用来治关节炎、肌肉痹痛、跌打损伤、产后腹痛等；安徽地区有用作治血吸虫腹水病。', '40', null, null);
INSERT INTO `product_worth` VALUES ('90', '药用价值', '叶子花的花可入药，具有解毒清热、调和气血的功效。对治疗妇女月经不调，疽毒有一定的效果。', '41', null, null);
INSERT INTO `product_worth` VALUES ('91', '观赏净化', '叶子花树势强健，花形奇特，色彩艳丽，缤纷多彩，花开时节格外鲜艳夺目。叶子花具有一定的抗二氧化硫功能，是一种很好的一环保绿化植物。', '41', null, null);
INSERT INTO `product_worth` VALUES ('92', '观赏价值', '露薇花又名繁瓣花马齿苋科露薇花属多年生草本，花色靓丽、端庄，为近年来新兴的观花草本植物。', '42', null, null);
INSERT INTO `product_worth` VALUES ('93', '观赏价值', '无明显休眠期，幼株比较矮小，多年生老株会形成垂吊状，非常适合家庭盆栽。', '43', null, null);
INSERT INTO `product_worth` VALUES ('94', '观赏价值', '广寒宫属大型石莲花，环境适宜露养可轻松破40cm，仙气十足，阳台一族种在花盆里，也会自适应花盆大小，白粉红晕，月色扫不开。', '44', null, null);
INSERT INTO `product_worth` VALUES ('95', '观赏价值', '小松绿植株矮小，株型紧凑，绿叶簇生枝头，类似松针，整个植株酷似微缩版的松树，用于制作盆景', '45', null, null);
INSERT INTO `product_worth` VALUES ('96', '观赏价值', '小米星是景天科的多肉植物，叶片尖尖的，灰绿色或浅绿色，开花时花朵如米粒般挂满枝头，颇为华丽。', '46', null, null);
INSERT INTO `product_worth` VALUES ('97', '观赏价值', '姬秋丽，是景天科的一种多肉植物，外形如玉石般精致、小巧。总是一簇簇的聚集在一起，数量繁多又晶莹可爱。', '47', null, null);
INSERT INTO `product_worth` VALUES ('98', '观赏价值', '姬玉露，其晶莹剔透的肉质叶圆润可爱，如同水晶雕琢而成的工艺品，且植株体型较小，适合都市化人群的养殖条件，使其成为一种流行的观赏多肉植物。', '48', null, null);
INSERT INTO `product_worth` VALUES ('99', '观赏价值', '鹿角海棠植株常呈匍匐丛生状，在欧美地区经常被用于盆栽或吊\r\n鹿角海棠\r\n鹿角海棠\r\n盆栽。绿色肥厚的叶片向外延伸，有很好的垂吊感。', '49', null, null);
INSERT INTO `product_worth` VALUES ('100', '观赏价值', '鼠尾掌为良好的室内花卉，适于家庭盆栽布置窗台，也可作吊挂悬篮栽培。', '50', null, null);
INSERT INTO `product_worth` VALUES ('101', '观赏价值', '在光照充足、温差大的环境下，叶尖会出现美丽可爱的小红点，叶色变为果冻般的浅绿色或黄绿色，犹如凝冻通透、弹吹欲破的玉脂。', '51', null, null);
INSERT INTO `product_worth` VALUES ('102', '观赏价值', '丽娜莲是景天科拟石莲花属的多肉植物，原产地在墨西哥，丽娜莲的叶子形态十分精美，曲线流畅。', '52', null, null);
INSERT INTO `product_worth` VALUES ('103', '观赏价值', '山茶最宜庭园绿化，从文化内涵上它是一种传统的瑞花嘉木，一种吉祥的喜树。从形态来看，山茶四季常青，树形适中、地栽、盆栽、花坛种植均相宜。', '53', null, null);
INSERT INTO `product_worth` VALUES ('104', '药用价值', '凉血止血；散瘀；消瘀肿。主吐血；衄血；咳血；便血；痔血；赤血痢；血淋；血崩；带下；烫伤；跌扑损伤。用于吐血，衄血，便血，血崩；外用治烧烫伤，创伤出血。', '53', null, null);
INSERT INTO `product_worth` VALUES ('105', '观赏价值', '其株型美观、别致，花盛色艳，还有具香味的品种，深受人们青睐。仙客来还可用无土栽培的方法进行盆栽，清洁迷人，更适合家庭装饰。', '54', null, null);
INSERT INTO `product_worth` VALUES ('106', '净化空气', '仙客来对空气中的有毒气体二氧化硫有较强的抵抗能力。它的叶片能吸收二氧化硫，并经过氧化作用将其转化为无毒或低毒的硫酸盐等物质。', '54', null, null);
INSERT INTO `product_worth` VALUES ('107', '观赏价值', '它的外观看起来十分的美观，极具有观赏价值，别的是绿叶照红花，它是绿叶衬红果。它结出的果实开得十分的鲜红。红红火火看上去十分喜庆，因而受到了很多人的喜欢。', '55', null, null);
INSERT INTO `product_worth` VALUES ('108', '药用价值', '红豆杉里面的紫杉醇是用来治疗癌症的。而紫杉醇只能在红豆杉里提取，提取的过程十分之复杂。这就决定了红豆杉不可取代的崇高地位。', '55', null, null);
INSERT INTO `product_worth` VALUES ('109', '观赏价值', '虞美人的花多彩丰富、开花时薄薄的花瓣质薄如绫，光洁似绸，轻盈花冠似朵朵红云片片彩绸，虽无风亦似自摇，风动时更是飘然欲飞，颇为美观，花期也长，适宜用于花坛、花境栽植，也可盆栽或作切花用。', '56', null, null);
INSERT INTO `product_worth` VALUES ('110', '药用价值', '全草（虞美人）、花、果实：苦、涩，凉。镇痛，镇咳，止泻。用于咳嗽，痢疾，腹痛。', '56', null, null);
INSERT INTO `product_worth` VALUES ('111', '观赏价值', '酒瓶兰婆娑而优雅；花白色。茎干苍劲，基部膨大如酒瓶，形成其独特的观赏形状，是热带观叶植物的优良品种。', '57', null, null);
INSERT INTO `product_worth` VALUES ('112', '观赏价值', '勿忘草株形柔美，茎枝纤细，叶片的形状很像柳树的叶子，无数朵小蓝花开满茎顶部的每个小枝，花瓣的蓝色仿佛是由天空的颜色染成的让人充满无限遐想。花朵中央有一圈黄色心蕊色彩搭配非常和谐。', '58', null, null);
INSERT INTO `product_worth` VALUES ('113', '药用价值', '勿忘草含有比较多的维生素，能够调理人体的新陈代谢，对于减肥和美容都有不错的效果。从中医上来讲主要有清肝明目和清热解毒的作用，对于大便秘结和皮肤粉刺的疗效都很不错。', '58', null, null);
INSERT INTO `product_worth` VALUES ('114', '绿化价值', '滴水观音的叶片具有强大的吸尘作用可以有效的改善家居环境。只要不误食入口还是可以安全种植的。同时可以有效缓解视觉疲劳和增加空气湿度的作用。', '59', null, null);
INSERT INTO `product_worth` VALUES ('115', '药用价值', '滴水观音的根茎是治疗腹痛，霍乱，疝气的良药，还可用于治疗气管炎，流感，伤寒，风湿关节炎。可是在当做药材服用时一定要咨询专业的医生在医师的指导下正确食用。', '59', null, null);

-- ----------------------------
-- Table structure for `theme`
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('1', '香味宜人', '散发香味的花朵', '16', null, '16', null);
INSERT INTO `theme` VALUES ('2', '纯纯的白', '出淤泥而不染', '17', null, '17', null);
INSERT INTO `theme` VALUES ('3', '清雅脱俗', '何为君子', '18', null, '18', null);
INSERT INTO `theme` VALUES ('4', '食虫植物', '消灭小害虫', '64', null, '64', null);

-- ----------------------------
-- Table structure for `theme_product`
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES ('1', '1');
INSERT INTO `theme_product` VALUES ('1', '2');
INSERT INTO `theme_product` VALUES ('1', '9');
INSERT INTO `theme_product` VALUES ('2', '3');
INSERT INTO `theme_product` VALUES ('2', '4');
INSERT INTO `theme_product` VALUES ('3', '6');
INSERT INTO `theme_product` VALUES ('4', '7');
INSERT INTO `theme_product` VALUES ('4', '17');
INSERT INTO `theme_product` VALUES ('4', '18');

-- ----------------------------
-- Table structure for `third_app`
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

-- ----------------------------
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES ('1', 'administrator', 'plmnbv', 'CMS', '32', 'Super', null, null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('59', 'ok1S55Vk8WEVY5E4CaIdhb1pOcnQ', null, null, null, null, null);

-- ----------------------------
-- Table structure for `user_address`
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `create_time` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('1582254096', '39', '测试', '15670609309', '黑龙江省', '双鸭山市', '宝山区', '测试数据', null, '59', '1584370567');

-- ----------------------------
-- Table structure for `user_integral`
-- ----------------------------
DROP TABLE IF EXISTS `user_integral`;
CREATE TABLE `user_integral` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `user_integral` int(5) NOT NULL,
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_integral
-- ----------------------------
INSERT INTO `user_integral` VALUES ('0', '59', '232');
