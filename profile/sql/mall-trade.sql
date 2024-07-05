/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.60.10_mysql
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : 192.168.60.10:3306
 Source Schema         : mall-trade

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 05/07/2024 08:45:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint NOT NULL COMMENT '订单id',
  `total_fee` int NOT NULL DEFAULT 0 COMMENT '总金额，单位为分',
  `payment_type` tinyint(1) UNSIGNED ZEROFILL NOT NULL COMMENT '支付类型，1、支付宝，2、微信，3、扣减余额',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '订单的状态，1、未付款 2、已付款,未发货 3、已发货,未确认 4、确认收货，交易成功 5、交易取消，订单关闭 6、交易结束，已评价',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pay_time` timestamp NULL DEFAULT NULL COMMENT '支付时间',
  `consign_time` timestamp NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` timestamp NULL DEFAULT NULL COMMENT '交易关闭时间',
  `comment_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `multi_key_status_time`(`status` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (123865420, 327900, 3, 2, 1, '2021-07-28 19:01:41', NULL, NULL, NULL, NULL, NULL, '2021-07-28 19:01:47');
INSERT INTO `order` VALUES (1654779387523936258, 135800, 3, 1, 1, '2023-05-06 17:25:24', NULL, NULL, NULL, NULL, NULL, '2023-05-06 17:25:24');
INSERT INTO `order` VALUES (1654782927348740097, 135800, 3, 1, 1, '2023-05-06 17:39:28', NULL, NULL, NULL, NULL, NULL, '2023-05-06 17:39:28');
INSERT INTO `order` VALUES (1658434251768471554, 120000, 3, 1, 1, '2023-05-16 19:28:32', NULL, NULL, NULL, NULL, NULL, '2023-05-16 19:28:32');
INSERT INTO `order` VALUES (1658453559437434882, 55400, 3, 1, 1, '2023-05-16 20:45:15', NULL, NULL, NULL, NULL, NULL, '2023-05-16 20:45:15');
INSERT INTO `order` VALUES (1659160216593354754, 156000, 3, 1, 1, '2023-05-18 19:33:16', NULL, NULL, NULL, NULL, NULL, '2023-05-18 19:33:16');
INSERT INTO `order` VALUES (1806979205283536897, 35400, 3, 1, 1, '2024-06-29 17:13:10', NULL, NULL, NULL, NULL, NULL, '2024-06-29 17:13:10');
INSERT INTO `order` VALUES (1808421094578835457, 49100, 3, 1, 1, '2024-07-03 16:42:44', NULL, NULL, NULL, NULL, NULL, '2024-07-03 16:42:44');
INSERT INTO `order` VALUES (1808421242356748289, 49100, 3, 1, 1, '2024-07-03 16:43:19', NULL, NULL, NULL, NULL, NULL, '2024-07-03 16:43:19');
INSERT INTO `order` VALUES (1808421833753612290, 71800, 3, 1, 1, '2024-07-03 16:45:40', NULL, NULL, NULL, NULL, NULL, '2024-07-03 16:45:40');
INSERT INTO `order` VALUES (1808422640960000002, 35400, 3, 1, 2, '2024-07-03 16:48:52', '2024-07-03 16:49:03', NULL, NULL, NULL, NULL, '2024-07-03 16:49:04');
INSERT INTO `order` VALUES (1808775514379657217, 35400, 3, 1, 5, '2024-07-04 16:11:04', NULL, NULL, NULL, NULL, NULL, '2024-07-04 16:11:16');
INSERT INTO `order` VALUES (1808776055046426625, 35400, 3, 1, 2, '2024-07-04 16:13:13', '2024-07-04 16:13:22', NULL, NULL, NULL, NULL, '2024-07-04 16:13:23');
INSERT INTO `order` VALUES (1808776469187809282, 35400, 3, 1, 5, '2024-07-04 16:14:52', NULL, NULL, NULL, NULL, NULL, '2024-07-04 16:15:02');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单详情id ',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `item_id` bigint NOT NULL COMMENT 'sku商品id',
  `num` int NOT NULL COMMENT '购买数量',
  `name` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品标题',
  `spec` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '商品动态属性键值集',
  `price` int NOT NULL COMMENT '价格,单位：分',
  `image` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '商品图片',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_order_id`(`order_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单详情表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (1, 123865420, 100000003145, 2, 'vivo X23 8GB+128GB 幻夜蓝 水滴屏全面屏 游戏手机 移动联通电信全网通4G手机', '{\"颜色\": \"红色\", \"版本\": \"8GB+128GB\"}', 95900, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/4612/28/6223/298257/5ba22d66Ef665222f/d97ed0b25cbe8c6e.jpg!q70.jpg.webp', '2021-07-28 19:05:21', '2021-07-28 19:05:21');
INSERT INTO `order_detail` VALUES (8, 1654779387523936258, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 17:25:24', '2023-05-06 17:25:24');
INSERT INTO `order_detail` VALUES (9, 1654779387523936258, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 17:25:24', '2023-05-06 17:25:24');
INSERT INTO `order_detail` VALUES (10, 1654782927348740097, 100002672274, 2, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-06 17:39:28', '2023-05-06 17:39:28');
INSERT INTO `order_detail` VALUES (11, 1654782927348740097, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-06 17:39:28', '2023-05-06 17:39:28');
INSERT INTO `order_detail` VALUES (12, 1658434251768471554, 100002672272, 1, '荣耀V20胡歌同款手机全网通 标配版 6GB+128GB 魅丽红 游戏手机 移动联通电信4G全面屏手机 双卡双待', '{\"颜色\": \"红色\"}', 95000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/8112/20/10485/366920/5c2336deEab272fe3/12b58de5020ca1a1.jpg!q70.jpg.webp', '2023-05-16 19:28:32', '2023-05-16 19:28:32');
INSERT INTO `order_detail` VALUES (13, 1658434251768471554, 100002672300, 1, '三星 Galaxy Note9（SM-N9600）6GB+128GB 寒霜蓝 移动联通电信4G游戏手机 双卡双待', '{\"颜色\": \"蓝色\", \"版本\": \"6GB+128GB\"}', 25000, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t27082/302/324013085/140782/145fdd/5b8e3b98N4c3dcd05.jpg!q70.jpg.webp', '2023-05-16 19:28:32', '2023-05-16 19:28:32');
INSERT INTO `order_detail` VALUES (14, 1658453559437434882, 100002672274, 1, '三星 Galaxy S8+（SM-G9550）6GB+128GB 谜夜黑 移动联通电信4G手机 双卡双待', '{\"颜色\": \"红色\", \"版本\": \"6GB+128GB\"}', 55400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t22954/298/30207467/96223/2f672221/5b233eabN82b4dedc.jpg!q70.jpg.webp', '2023-05-16 20:45:15', '2023-05-16 20:45:15');
INSERT INTO `order_detail` VALUES (15, 1659160216593354754, 100001964366, 1, 'OPPO A7 全面屏拍照手机 4GB+64GB 清新粉 全网通 移动联通电信4G 双卡双待手机', '{\"颜色\": \"粉色\"}', 65400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t25564/327/2615611632/135559/d3c69840/5bebd32eN3bf6f987.jpg!q70.jpg.webp', '2023-05-18 19:33:16', '2023-05-18 19:33:16');
INSERT INTO `order_detail` VALUES (16, 1659160216593354754, 100002624512, 1, '【千玺代言】华为新品 HUAWEI nova 4 极点全面屏手机 2000万超广角三摄 8GB+128GB 蜜语红 全网通双卡双待', '{\"颜色\": \"红色\"}', 90600, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/20085/14/1076/149604/5c0f8dd2Ebafd3bfd/0cb34a7826cbe1c3.jpg!q70.jpg.webp', '2023-05-18 19:33:16', '2023-05-18 19:33:16');
INSERT INTO `order_detail` VALUES (17, 1806979205283536897, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-06-29 17:13:10', '2024-06-29 17:13:10');
INSERT INTO `order_detail` VALUES (28, 1808421094578835457, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-07-03 16:42:44', '2024-07-03 16:42:44');
INSERT INTO `order_detail` VALUES (29, 1808421094578835457, 100001511821, 1, 'HMDIME 牛仔背带裤女2018秋冬新品 韩版学院风潮流百搭弹力修身补丁学生吊带长裤女 AXNZ369 深蓝 30', '{\"颜色\": \"蓝色\", \"尺码\": \"30\"}', 13700, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30892/263/313055374/557791/c98e9abc/5bef811aN036f7c3b.jpg!q70.jpg.webp', '2024-07-03 16:42:44', '2024-07-03 16:42:44');
INSERT INTO `order_detail` VALUES (30, 1808421242356748289, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-07-03 16:43:19', '2024-07-03 16:43:19');
INSERT INTO `order_detail` VALUES (31, 1808421242356748289, 100001511821, 1, 'HMDIME 牛仔背带裤女2018秋冬新品 韩版学院风潮流百搭弹力修身补丁学生吊带长裤女 AXNZ369 深蓝 30', '{\"颜色\": \"蓝色\", \"尺码\": \"30\"}', 13700, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30892/263/313055374/557791/c98e9abc/5bef811aN036f7c3b.jpg!q70.jpg.webp', '2024-07-03 16:43:19', '2024-07-03 16:43:19');
INSERT INTO `order_detail` VALUES (32, 1808421833753612290, 2120808, 1, '姬龙雪 guy laroche女包 GL经典手提包女牛皮大容量单肩包女欧美时尚包包女包GS1210001-06杏色', '{}', 71800, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t30694/267/398774087/90954/6fc143cf/5bf25358N14dadbf7.jpg!q70.jpg.webp', '2024-07-03 16:45:40', '2024-07-03 16:45:40');
INSERT INTO `order_detail` VALUES (33, 1808422640960000002, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-07-03 16:48:52', '2024-07-03 16:48:52');
INSERT INTO `order_detail` VALUES (34, 1808775514379657217, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-07-04 16:11:04', '2024-07-04 16:11:04');
INSERT INTO `order_detail` VALUES (35, 1808776055046426625, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-07-04 16:13:13', '2024-07-04 16:13:13');
INSERT INTO `order_detail` VALUES (36, 1808776469187809282, 40305713537, 1, '【官方正品 品牌直营】奥古狮登小白鞋女秋季透气2018新款百搭韩版休闲鞋运动鞋女鞋厚底板鞋女 浅蓝【厚底】 41', '{\"颜色\": \"金色\", \"尺码\": \"41\"}', 35400, 'https://m.360buyimg.com/mobilecms/s720x720_jfs/t1/14147/34/2890/275451/5c225484Ebd346404/e61513be4639ee2e.jpg!q70.jpg.webp', '2024-07-04 16:14:52', '2024-07-04 16:14:52');

-- ----------------------------
-- Table structure for order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `order_logistics`;
CREATE TABLE `order_logistics`  (
  `order_id` bigint NOT NULL COMMENT '订单id，与订单表一对一',
  `logistics_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '物流单号',
  `logistics_company` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '物流公司名称',
  `contact` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人',
  `mobile` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '收件人手机号码',
  `province` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '省',
  `city` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '市',
  `town` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '区',
  `street` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '街道',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_logistics
-- ----------------------------
INSERT INTO `order_logistics` VALUES (123865420, '', '', '李四', '13838411438', '上海', '上海', '浦东新区', '航头镇', '2021-07-28 19:07:01', '2021-07-28 19:07:01');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid` ASC, `branch_id` ASC) USING BTREE,
  INDEX `ix_log_created`(`log_created` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
