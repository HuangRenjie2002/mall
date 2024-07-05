/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.60.10_mysql
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : 192.168.60.10:3306
 Source Schema         : mall-pay

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 05/07/2024 08:45:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_order_no` bigint NOT NULL COMMENT '业务订单号',
  `pay_order_no` bigint NOT NULL DEFAULT 0 COMMENT '支付单号',
  `biz_user_id` bigint NOT NULL COMMENT '支付用户id',
  `pay_channel_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '支付渠道编码',
  `amount` int NOT NULL COMMENT '支付金额，单位分',
  `pay_type` tinyint NOT NULL DEFAULT 5 COMMENT '支付类型，1：h5,2:小程序，3：公众号，4：扫码，5：余额支付',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '支付状态，0：待提交，1:待支付，2：支付超时或取消，3：支付成功',
  `expand_json` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '拓展字段，用于传递不同渠道单独处理的字段',
  `result_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '第三方返回业务码',
  `result_msg` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '第三方返回提示信息',
  `pay_success_time` datetime NULL DEFAULT NULL COMMENT '支付成功时间',
  `pay_over_time` datetime NOT NULL COMMENT '支付超时时间',
  `qr_code_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付二维码链接',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creater` bigint NOT NULL DEFAULT 0 COMMENT '创建人',
  `updater` bigint NOT NULL DEFAULT 0 COMMENT '更新人',
  `is_delete` bit(1) NOT NULL DEFAULT b'0' COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `biz_order_no`(`biz_order_no` ASC) USING BTREE,
  UNIQUE INDEX `pay_order_no`(`pay_order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1808776470471282692 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '支付订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES (1658455441987891201, 1658453559437434882, 1658455441975308289, 1, 'balance', 55400, 5, 3, '', '', '', '2023-05-16 21:14:57', '2023-05-16 22:52:45', NULL, '2023-05-16 20:52:44', '2023-05-18 19:38:03', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1659160218174607363, 1659160216593354754, 1659160218174607362, 1, 'balance', 156000, 5, 3, '', '', '', '2023-05-18 19:34:48', '2023-05-18 21:33:16', NULL, '2023-05-18 19:33:16', '2023-05-18 19:37:54', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1806979208005554177, 1806979205283536897, 1806979207992971265, 1, 'balance', 35400, 5, 1, '', '', '', NULL, '2024-06-29 19:13:10', NULL, '2024-06-29 17:13:11', '2024-06-29 17:13:11', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1808421245233971202, 1808421242356748289, 1808421245217193985, 1, 'balance', 49100, 5, 3, '', '', '', '2024-07-03 16:44:18', '2024-07-03 18:43:18', NULL, '2024-07-03 16:43:19', '2024-07-03 16:44:19', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1808421834747592706, 1808421833753612290, 1808421834747592705, 1, 'balance', 71800, 5, 3, '', '', '', '2024-07-03 16:45:48', '2024-07-03 18:45:39', NULL, '2024-07-03 16:45:40', '2024-07-03 16:45:48', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1808422643312926722, 1808422640960000002, 1808422643304538114, 1, 'balance', 35400, 5, 3, '', '', '', '2024-07-03 16:49:03', '2024-07-03 18:48:52', NULL, '2024-07-03 16:48:53', '2024-07-03 16:49:04', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1808776058309611521, 1808776055046426625, 1808776058297028609, 1, 'balance', 35400, 5, 3, '', '', '', '2024-07-04 16:13:19', '2024-07-04 18:13:12', NULL, '2024-07-04 16:13:14', '2024-07-04 16:13:21', 0, 0, b'0');
INSERT INTO `pay_order` VALUES (1808776470471282691, 1808776469187809282, 1808776470471282690, 1, 'balance', 35400, 5, 1, '', '', '', NULL, '2024-07-04 18:14:51', NULL, '2024-07-04 16:14:52', '2024-07-04 16:14:52', 0, 0, b'0');

SET FOREIGN_KEY_CHECKS = 1;
