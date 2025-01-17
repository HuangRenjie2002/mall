/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.60.10_mysql
 Source Server Type    : MySQL
 Source Server Version : 80400 (8.4.0)
 Source Host           : 192.168.60.10:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80400 (8.4.0)
 File Encoding         : 65001

 Date: 01/07/2024 17:00:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'group_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'configuration description',
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'configuration usage',
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '配置生效的描述',
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '配置的类型',
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '配置的模式',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'jdbc.yaml', 'DEFAULT_GROUP', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://${mall.db.host}:3306/${mall.db.database}?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: ${mall.db.pw}\r\nmybatis-plus:\r\n  configuration:\r\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\r\n  global-config:\r\n    db-config:\r\n      update-strategy: not_null\r\n      id-type: auto', '44945d7537d7cde4b88d80799f4df271', '2024-06-29 17:29:32', '2024-06-29 17:29:32', NULL, '192.168.60.1', '', '', 'jdbl配置', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (2, 'log.yaml', 'DEFAULT_GROUP', 'logging:\r\n  level:\r\n    pers.hrj: debug\r\n  pattern:\r\n    dateformat: HH:mm:ss:SSS\r\n  file:\r\n    path: \"logs/${spring.application.name}\"', '51945283ec08a0d51c4b15cc134617b1', '2024-06-29 17:30:06', '2024-06-29 17:30:06', NULL, '192.168.60.1', '', '', '日志配置', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (3, 'cart-service.yaml', 'DEFAULT_GROUP', 'mall:\n cart:\n  maxItems: 2', '59eddba630bae276b1e0dab2430ffd11', '2024-06-29 17:45:54', '2024-06-29 17:47:20', 'nacos', '192.168.60.1', '', '', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (4, 'gateway-routes.json', 'DEFAULT_GROUP', '[\r\n    {\r\n        \"id\": \"item\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://item-service\"\r\n    },\r\n    {\r\n        \"id\": \"cart\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://cart-service\"\r\n    },\r\n    {\r\n        \"id\": \"user\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://user-service\"\r\n    },\r\n    {\r\n        \"id\": \"trade\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://trade-service\"\r\n    },\r\n    {\r\n        \"id\": \"pay\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://pay-service\"\r\n    }\r\n]', 'ab18523ae6341c6a7d2fc5ce03e0f475', '2024-07-01 10:37:27', '2024-07-01 10:37:27', NULL, '192.168.60.1', '', '', '网关路由信息', NULL, NULL, 'json', NULL, '');
INSERT INTO `config_info` VALUES (5, 'seata.yaml', 'DEFAULT_GROUP', 'seata:\n  registry: # TC服务注册中心的配置，微服务根据这些信息去注册中心获取tc服务地址\n    type: nacos # 注册中心类型 nacos\n    nacos:\n      server-addr: 192.168.60.10:8848 # nacos地址\n      namespace: \"\" # namespace，默认为空\n      group: DEFAULT_GROUP # 分组，默认是DEFAULT_GROUP\n      application: seata-server # seata服务名称\n      username: nacos\n      password: nacos\n  tx-service-group: mall # 事务组名称\n  service:\n    vgroup-mapping: # 事务组与tc集群的映射关系\n      mall: \"default\"\n  data-source-proxy-mode: AT', 'e3a33d1c76b2f5e2fa7be558522fa465', '2024-07-01 16:02:11', '2024-07-01 16:54:17', NULL, '192.168.60.1', '', '', 'seata客户端配置', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增长标识',
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增标识',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'operation type',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'jdbc.yaml', 'DEFAULT_GROUP', '', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://${mall.db.host}:3306/${mall.db.database}?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n    username: root\r\n    password: ${mall.db.pw}\r\nmybatis-plus:\r\n  configuration:\r\n    default-enum-type-handler: com.baomidou.mybatisplus.core.handlers.MybatisEnumTypeHandler\r\n  global-config:\r\n    db-config:\r\n      update-strategy: not_null\r\n      id-type: auto', '44945d7537d7cde4b88d80799f4df271', '2024-06-29 17:29:31', '2024-06-29 17:29:32', NULL, '192.168.60.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 2, 'log.yaml', 'DEFAULT_GROUP', '', 'logging:\r\n  level:\r\n    pers.hrj: debug\r\n  pattern:\r\n    dateformat: HH:mm:ss:SSS\r\n  file:\r\n    path: \"logs/${spring.application.name}\"', '51945283ec08a0d51c4b15cc134617b1', '2024-06-29 17:30:05', '2024-06-29 17:30:06', NULL, '192.168.60.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'hm:\r\n cart:\r\n  maxItems: 1', '7760b4f00b1b690b833d8574394e3c49', '2024-06-29 17:45:53', '2024-06-29 17:45:54', NULL, '192.168.60.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (3, 4, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'hm:\r\n cart:\r\n  maxItems: 1', '7760b4f00b1b690b833d8574394e3c49', '2024-06-29 17:46:54', '2024-06-29 17:46:54', 'nacos', '192.168.60.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (3, 5, 'cart-service.yaml', 'DEFAULT_GROUP', '', 'mall:\n cart:\n  maxItems: 1', 'c3345f745b8141c6b7b247b4eecb254e', '2024-06-29 17:47:20', '2024-06-29 17:47:20', 'nacos', '192.168.60.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (0, 6, 'gateway-routes.json', 'DEFAULT_GROUP', '', '[\r\n    {\r\n        \"id\": \"item\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/items/**\", \"_genkey_1\":\"/search/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://item-service\"\r\n    },\r\n    {\r\n        \"id\": \"cart\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/carts/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://cart-service\"\r\n    },\r\n    {\r\n        \"id\": \"user\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/users/**\", \"_genkey_1\":\"/addresses/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://user-service\"\r\n    },\r\n    {\r\n        \"id\": \"trade\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/orders/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://trade-service\"\r\n    },\r\n    {\r\n        \"id\": \"pay\",\r\n        \"predicates\": [{\r\n            \"name\": \"Path\",\r\n            \"args\": {\"_genkey_0\":\"/pay-orders/**\"}\r\n        }],\r\n        \"filters\": [],\r\n        \"uri\": \"lb://pay-service\"\r\n    }\r\n]', 'ab18523ae6341c6a7d2fc5ce03e0f475', '2024-07-01 10:37:27', '2024-07-01 10:37:27', NULL, '192.168.60.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'seata.yaml', 'DEFAULT_GROUP', '', 'seata:\r\n  registry: # TC服务注册中心的配置，微服务根据这些信息去注册中心获取tc服务地址\r\n    type: nacos # 注册中心类型 nacos\r\n    nacos:\r\n      server-addr: 192.168.60.10:8848 # nacos地址\r\n      namespace: \"\" # namespace，默认为空\r\n      group: DEFAULT_GROUP # 分组，默认是DEFAULT_GROUP\r\n      application: seata-server # seata服务名称\r\n      username: nacos\r\n      password: nacos\r\n  tx-service-group: mall # 事务组名称\r\n  service:\r\n    vgroup-mapping: # 事务组与tc集群的映射关系\r\n      mall: \"default\"', 'e5d2a27e0d53d79f969323340034e733', '2024-07-01 16:02:11', '2024-07-01 16:02:11', NULL, '192.168.60.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (5, 8, 'seata.yaml', 'DEFAULT_GROUP', '', 'seata:\r\n  registry: # TC服务注册中心的配置，微服务根据这些信息去注册中心获取tc服务地址\r\n    type: nacos # 注册中心类型 nacos\r\n    nacos:\r\n      server-addr: 192.168.60.10:8848 # nacos地址\r\n      namespace: \"\" # namespace，默认为空\r\n      group: DEFAULT_GROUP # 分组，默认是DEFAULT_GROUP\r\n      application: seata-server # seata服务名称\r\n      username: nacos\r\n      password: nacos\r\n  tx-service-group: mall # 事务组名称\r\n  service:\r\n    vgroup-mapping: # 事务组与tc集群的映射关系\r\n      mall: \"default\"', 'e5d2a27e0d53d79f969323340034e733', '2024-07-01 16:36:16', '2024-07-01 16:36:17', NULL, '192.168.60.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (5, 9, 'seata.yaml', 'DEFAULT_GROUP', '', 'seata:\n  registry: # TC服务注册中心的配置，微服务根据这些信息去注册中心获取tc服务地址\n    type: nacos # 注册中心类型 nacos\n    nacos:\n      server-addr: 192.168.60.10:8848 # nacos地址\n      namespace: \"\" # namespace，默认为空\n      group: DEFAULT_GROUP # 分组，默认是DEFAULT_GROUP\n      application: seata-server # seata服务名称\n      username: nacos\n      password: nacos\n  tx-service-group: mall # 事务组名称\n  service:\n    vgroup-mapping: # 事务组与tc集群的映射关系\n      mall: \"default\"\n  data-source-proxy-mode: XA', '98fa4b6d7b10652f5489027fb24edd1a', '2024-07-01 16:54:16', '2024-07-01 16:54:17', NULL, '192.168.60.1', 'U', '', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'role',
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'resource',
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'action',
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'username',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'role',
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'username',
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'password',
  `enabled` tinyint(1) NOT NULL COMMENT 'enabled',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
