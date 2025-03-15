/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : xeasywork

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 15/03/2025 16:01:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ai_api_key
-- ----------------------------
DROP TABLE IF EXISTS `ai_api_key`;
CREATE TABLE `ai_api_key`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `api_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密钥',
  `platform` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '平台',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '自定义 API 地址',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AI API 密钥表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_api_key
-- ----------------------------
INSERT INTO `ai_api_key` VALUES (1, '测试ai(需要换成自己的)', 'sk-19xxxxxxxxxxxxxxxxxdbc', 'TongYi', NULL, 'admin', '2025-03-14 23:00:40', 'admin', '2025-03-15 10:45:23', NULL, '0');

-- ----------------------------
-- Table structure for ai_tiny_flow
-- ----------------------------
DROP TABLE IF EXISTS `ai_tiny_flow`;
CREATE TABLE `ai_tiny_flow`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `graph` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '工作流表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_tiny_flow
-- ----------------------------
INSERT INTO `ai_tiny_flow` VALUES (1, '测试模型', '{\"nodes\":[{\"id\":\"2\",\"type\":\"llmNode\",\"data\":{\"title\":\"大模型\",\"description\":\"处理大模型相关问题\",\"expand\":true,\"outputDefs\":[{\"id\":\"RDlfmrPHp7tv20Bf\",\"name\":\"output\"}],\"parameters\":[{\"id\":\"uUvj7zp9fGMhZMMC\",\"name\":\"test\",\"ref\":\"3.test\"}],\"llmId\":1,\"userPrompt\":\"{test}随便说\"},\"position\":{\"x\":550,\"y\":50},\"measured\":{\"width\":347,\"height\":610},\"selected\":false},{\"id\":\"3\",\"type\":\"startNode\",\"data\":{\"title\":\"开始节点\",\"description\":\"开始定义输入参数\",\"expand\":true,\"parameters\":[{\"id\":\"5D317Ha3ronbH5kc\",\"name\":\"test\",\"required\":true}]},\"position\":{\"x\":115,\"y\":50},\"measured\":{\"width\":306,\"height\":200},\"selected\":false,\"dragging\":false},{\"id\":\"4\",\"type\":\"endNode\",\"data\":{\"title\":\"结束节点\",\"description\":\"结束定义输出参数\",\"expand\":true,\"outputDefs\":[{\"id\":\"mGDVGtB2GcW7Zk0Z\",\"ref\":\"2.output\",\"name\":\"test\"}]},\"position\":{\"x\":1156,\"y\":48},\"measured\":{\"width\":361,\"height\":200},\"selected\":false,\"dragging\":false}],\"edges\":[{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"3\",\"target\":\"2\",\"id\":\"xy-edge__3-2\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"2\",\"target\":\"4\",\"id\":\"xy-edge__2-4\",\"selected\":false}],\"viewport\":{\"x\":250,\"y\":100,\"zoom\":1}}', '', NULL, 'admin', '2025-03-15 13:23:51', '大模型的调用', '0');
INSERT INTO `ai_tiny_flow` VALUES (2, 'test', '{\"nodes\":[{\"id\":\"node_rovJujZGFnxF6rrM\",\"position\":{\"x\":80,\"y\":34},\"data\":{\"title\":\"开始节点\",\"description\":\"开始定义输入参数\"},\"type\":\"startNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":126}},{\"id\":\"node_YLO7yeEzpC25M3RG\",\"position\":{\"x\":919,\"y\":17},\"data\":{\"title\":\"结束节点\",\"description\":\"结束定义输出参数\"},\"type\":\"endNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":126}},{\"id\":\"node_fQPb4qDBl4VjcCMW\",\"position\":{\"x\":509,\"y\":32},\"data\":{\"title\":\"搜索引擎\",\"description\":\"通过搜索引擎搜索内容\",\"outputDefs\":[{\"name\":\"documents\",\"dataType\":\"Array\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"addChildDisabled\":true,\"children\":[{\"name\":\"title\",\"dataType\":\"String\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"IF141xtLDoOg6uH8\"},{\"name\":\"content\",\"dataType\":\"String\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"DGxm7RFOq2R8cyF6\"},{\"name\":\"documentId\",\"dataType\":\"Number\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"1ZETL84STnkJeMPi\"},{\"name\":\"knowledgeId\",\"dataType\":\"Number\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"E4OqcLEjtvDk76Hk\"}],\"id\":\"LEdA0XTx5bHrEaMf\"}]},\"type\":\"searchEngineNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":126},\"dragging\":false}],\"edges\":[],\"viewport\":{\"x\":250,\"y\":100,\"zoom\":1}}', '', NULL, '', NULL, NULL, '2');
INSERT INTO `ai_tiny_flow` VALUES (3, '测试输出', '{\"nodes\":[{\"id\":\"node_yt0FdnTZcpx08fkg\",\"position\":{\"x\":-139,\"y\":104},\"data\":{\"title\":\"开始节点\",\"description\":\"开始定义输入参数\",\"expand\":true,\"parameters\":[{\"id\":\"qbYVQuFK8345rBl0\",\"name\":\"arr\",\"dataType\":\"Array\",\"required\":true}]},\"type\":\"startNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":200},\"dragging\":false},{\"id\":\"node_W0GdwxOZECvn4IiN\",\"position\":{\"x\":358,\"y\":105},\"data\":{\"title\":\"动态代码\",\"description\":\"动态执行代码\",\"expand\":true,\"engine\":\"groovy\",\"outputDefs\":[{\"id\":\"FBLNSiKI4PTNXuyn\",\"dataType\":\"Array\",\"name\":\"arr\"}],\"parameters\":[{\"id\":\"u7tW4zSGrz1pfQnE\",\"name\":\"arr\",\"ref\":\"node_yt0FdnTZcpx08fkg.arr\"}],\"code\":\"return [\\\"arr\\\": arr.transpose()]\"},\"type\":\"codeNode\",\"selected\":true,\"measured\":{\"width\":340,\"height\":568},\"dragging\":false},{\"id\":\"node_MYOX6bPCuYOlkkbm\",\"position\":{\"x\":788.789291416276,\"y\":105.7264251502344},\"data\":{\"title\":\"结束节点\",\"description\":\"结束定义输出参数\",\"expand\":true,\"outputDefs\":[{\"id\":\"9VvoSIplMZGBN3e6\",\"name\":\"输出\",\"ref\":\"node_W0GdwxOZECvn4IiN.arr\"}]},\"type\":\"endNode\",\"selected\":false,\"measured\":{\"width\":340,\"height\":200},\"dragging\":false}],\"edges\":[{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_yt0FdnTZcpx08fkg\",\"target\":\"node_W0GdwxOZECvn4IiN\",\"id\":\"xy-edge__node_yt0FdnTZcpx08fkg-node_W0GdwxOZECvn4IiN\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_W0GdwxOZECvn4IiN\",\"target\":\"node_MYOX6bPCuYOlkkbm\",\"id\":\"xy-edge__node_W0GdwxOZECvn4IiN-node_MYOX6bPCuYOlkkbm\",\"selected\":false}],\"viewport\":{\"x\":544,\"y\":80,\"zoom\":1}}', '', NULL, 'admin', '2025-03-15 13:30:43', NULL, '0');
INSERT INTO `ai_tiny_flow` VALUES (7, 'test111', '{\"nodes\":[{\"id\":\"node_yt0FdnTZcpx08fkg\",\"position\":{\"x\":-139,\"y\":104},\"data\":{\"title\":\"开始节点\",\"description\":\"开始定义输入参数\",\"expand\":true,\"parameters\":[{\"id\":\"qbYVQuFK8345rBl0\",\"name\":\"arr\",\"dataType\":\"Array\",\"required\":true}]},\"type\":\"startNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":209},\"dragging\":false},{\"id\":\"node_W0GdwxOZECvn4IiN\",\"position\":{\"x\":358,\"y\":105},\"data\":{\"title\":\"动态代码\",\"description\":\"动态执行代码\",\"expand\":true,\"engine\":\"groovy\",\"outputDefs\":[{\"id\":\"FBLNSiKI4PTNXuyn\",\"dataType\":\"Array\",\"name\":\"res\"}],\"parameters\":[{\"id\":\"u7tW4zSGrz1pfQnE\",\"name\":\"rows\",\"ref\":\"node_yt0FdnTZcpx08fkg.arr\"}],\"code\":\"// 获取最大列数\\n    def maxColumns = rows*.size().max()\\n    \\n    // 创建一个新的列表存储列数据\\n    def columns = (0..<maxColumns).collect { idx ->\\n        rows.collect { it[idx] }\\n    }\\n    \\n    return columns\"},\"type\":\"codeNode\",\"selected\":false,\"measured\":{\"width\":340,\"height\":589},\"dragging\":false},{\"id\":\"node_MYOX6bPCuYOlkkbm\",\"position\":{\"x\":788.789291416276,\"y\":105.7264251502344},\"data\":{\"title\":\"结束节点\",\"description\":\"结束定义输出参数\",\"expand\":true,\"outputDefs\":[{\"id\":\"9VvoSIplMZGBN3e6\",\"name\":\"输出\",\"ref\":\"node_W0GdwxOZECvn4IiN.res\"}]},\"type\":\"endNode\",\"selected\":true,\"measured\":{\"width\":342,\"height\":209},\"dragging\":false}],\"edges\":[{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_yt0FdnTZcpx08fkg\",\"target\":\"node_W0GdwxOZECvn4IiN\",\"id\":\"xy-edge__node_yt0FdnTZcpx08fkg-node_W0GdwxOZECvn4IiN\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_W0GdwxOZECvn4IiN\",\"target\":\"node_MYOX6bPCuYOlkkbm\",\"id\":\"xy-edge__node_W0GdwxOZECvn4IiN-node_MYOX6bPCuYOlkkbm\",\"selected\":false}],\"viewport\":{\"x\":474.67384867114697,\"y\":91.46615240660833,\"zoom\":1.3195079107728944}}', '', NULL, '', NULL, NULL, '2');
INSERT INTO `ai_tiny_flow` VALUES (8, '测试保存', '{\"nodes\":[{\"id\":\"node_q294Rop7Y5Mn7kVS\",\"position\":{\"x\":-67,\"y\":30},\"data\":{\"title\":\"开始节点\",\"description\":\"开始定义输入参数\"},\"type\":\"startNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":126}},{\"id\":\"node_ljPC7bL85VsDR5GM\",\"position\":{\"x\":520,\"y\":59},\"data\":{\"title\":\"循环\",\"description\":\"用于循环执行任务\"},\"type\":\"loopNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":126},\"dragging\":false},{\"id\":\"node_6NkeJWpoAiVEeSfT\",\"position\":{\"x\":884,\"y\":64},\"data\":{\"title\":\"大模型\",\"description\":\"使用大模型处理问题\"},\"type\":\"llmNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":126},\"dragging\":false},{\"id\":\"node_Mu2UKDuvV3bKp8lL\",\"position\":{\"x\":1288,\"y\":256},\"data\":{\"title\":\"知识库\",\"description\":\"通过知识库获取内容\",\"outputDefs\":[{\"name\":\"documents\",\"dataType\":\"Array\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"addChildDisabled\":true,\"children\":[{\"name\":\"title\",\"dataType\":\"String\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"AOZBWOsAeNCMWhWO\"},{\"name\":\"content\",\"dataType\":\"String\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"XuqdUHlSy9m5JyaJ\"},{\"name\":\"documentId\",\"dataType\":\"Number\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"hNtTHi5YI2IVnu3n\"},{\"name\":\"knowledgeId\",\"dataType\":\"Number\",\"nameDisabled\":true,\"dataTypeDisabled\":true,\"id\":\"1VnKZuMe8hKCpkGW\"}],\"id\":\"Q7ODTl3f9X2vGdH0\"}]},\"type\":\"knowledgeNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":126},\"dragging\":false},{\"id\":\"node_CzPf0au4aE3naghj\",\"position\":{\"x\":1426,\"y\":603},\"data\":{\"title\":\"结束节点\",\"description\":\"结束定义输出参数\"},\"type\":\"endNode\",\"selected\":true,\"measured\":{\"width\":306,\"height\":126},\"dragging\":false}],\"edges\":[{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_q294Rop7Y5Mn7kVS\",\"target\":\"node_ljPC7bL85VsDR5GM\",\"id\":\"xy-edge__node_q294Rop7Y5Mn7kVS-node_ljPC7bL85VsDR5GM\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_ljPC7bL85VsDR5GM\",\"target\":\"node_6NkeJWpoAiVEeSfT\",\"id\":\"xy-edge__node_ljPC7bL85VsDR5GM-node_6NkeJWpoAiVEeSfT\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_6NkeJWpoAiVEeSfT\",\"target\":\"node_Mu2UKDuvV3bKp8lL\",\"id\":\"xy-edge__node_6NkeJWpoAiVEeSfT-node_Mu2UKDuvV3bKp8lL\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_Mu2UKDuvV3bKp8lL\",\"target\":\"node_CzPf0au4aE3naghj\",\"id\":\"xy-edge__node_Mu2UKDuvV3bKp8lL-node_CzPf0au4aE3naghj\"}],\"viewport\":{\"x\":250,\"y\":100,\"zoom\":1}}', '', NULL, '', NULL, NULL, '2');
INSERT INTO `ai_tiny_flow` VALUES (9, '测试新增等等档', '{}', 'admin', '2025-03-14 20:14:47', '', NULL, '测试新增等等档', '2');
INSERT INTO `ai_tiny_flow` VALUES (10, '测试http', '{\"nodes\":[{\"id\":\"node_iW5FDe8csRFu7Hss\",\"position\":{\"x\":-72,\"y\":183},\"data\":{\"title\":\"开始节点\",\"description\":\"开始定义输入参数\",\"systemPrompt\":\"\",\"userPrompt\":\"\",\"expand\":true,\"parameters\":[{\"id\":\"EeEO40Q5b2lHikak\",\"name\":\"str\",\"required\":false}]},\"type\":\"startNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":200}},{\"id\":\"node_GvibDPbauNTVmc89\",\"position\":{\"x\":399,\"y\":191},\"data\":{\"title\":\"Http 请求\",\"description\":\"通过 HTTP 请求获取数据\",\"systemPrompt\":\"\",\"userPrompt\":\"\",\"expand\":true,\"outputDefs\":[{\"id\":\"yG9yKEhRMQ4Guz4f\",\"dataType\":\"Object\",\"name\":\"body\",\"children\":[]}],\"urlParameters\":[{\"id\":\"J0SdCUah0VqHuq7P\",\"name\":\"str\",\"ref\":\"node_iW5FDe8csRFu7Hss.str\"}]},\"type\":\"httpNode\",\"selected\":true,\"measured\":{\"width\":443,\"height\":476},\"dragging\":false},{\"id\":\"node_6DFbfdF3WnZfYJQf\",\"position\":{\"x\":979,\"y\":198},\"data\":{\"title\":\"结束节点\",\"description\":\"结束定义输出参数\",\"systemPrompt\":\"\",\"userPrompt\":\"\",\"expand\":true,\"outputDefs\":[{\"id\":\"TxuEdzAXkQm77FF7\",\"name\":\"res\",\"ref\":\"node_GvibDPbauNTVmc89.body\"}]},\"type\":\"endNode\",\"selected\":false,\"measured\":{\"width\":357,\"height\":200},\"dragging\":false}],\"edges\":[{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_iW5FDe8csRFu7Hss\",\"target\":\"node_GvibDPbauNTVmc89\",\"id\":\"xy-edge__node_iW5FDe8csRFu7Hss-node_GvibDPbauNTVmc89\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_GvibDPbauNTVmc89\",\"target\":\"node_6DFbfdF3WnZfYJQf\",\"id\":\"xy-edge__node_GvibDPbauNTVmc89-node_6DFbfdF3WnZfYJQf\",\"selected\":false}],\"viewport\":{\"x\":251,\"y\":100,\"zoom\":1}}', 'admin', '2025-03-15 13:49:23', 'admin', '2025-03-15 15:28:29', NULL, '0');
INSERT INTO `ai_tiny_flow` VALUES (11, '测试回复', '{\"nodes\":[{\"id\":\"node_EVEfZoilDIKGlkhz\",\"position\":{\"x\":-15,\"y\":106},\"data\":{\"title\":\"开始节点\",\"description\":\"开始定义输入参数\",\"systemPrompt\":\"\",\"userPrompt\":\"\",\"expand\":true,\"parameters\":[{\"id\":\"pVF7ihS488FlfWNQ\",\"name\":\"content\",\"required\":true}]},\"type\":\"startNode\",\"selected\":false,\"measured\":{\"width\":306,\"height\":200},\"dragging\":false},{\"id\":\"node_OHI6fKMeQ7UDxWEa\",\"position\":{\"x\":395,\"y\":109},\"data\":{\"title\":\"Http 请求\",\"description\":\"通过 HTTP 请求获取数据\",\"systemPrompt\":\"\",\"userPrompt\":\"\",\"expand\":true,\"headers\":[{\"id\":\"sQOMUEQj4PVLnFjh\",\"name\":\"str\",\"ref\":\"node_EVEfZoilDIKGlkhz.name\",\"refType\":\"input\",\"value\":\"苹果\"}],\"outputDefs\":[{\"id\":\"7Dxg0ATJqFkXTQuU\",\"name\":\"body\",\"dataType\":\"Object\"}]},\"type\":\"httpNode\",\"selected\":false,\"measured\":{\"width\":443,\"height\":476},\"dragging\":false},{\"id\":\"node_p0uZxGdnyL6OJHDi\",\"position\":{\"x\":924,\"y\":108},\"data\":{\"title\":\"大模型\",\"description\":\"使用大模型处理问题\",\"systemPrompt\":\"\",\"userPrompt\":\"结合{body}中的data数据，其中pl字段是评论，sp字段为名称，来回复用户提出的问题：{content}.\\n注意：不能有不利于商家的语言，并且回复中不要出现提示词中的任何信息\",\"expand\":true,\"parameters\":[{\"id\":\"V61bd2RvPjV0cuTC\",\"name\":\"body\",\"ref\":\"node_OHI6fKMeQ7UDxWEa.body\"},{\"id\":\"jeB6kPksHCvZIoJD\",\"name\":\"content\",\"ref\":\"node_EVEfZoilDIKGlkhz.content\"}],\"llmId\":1,\"outputDefs\":[{\"id\":\"IkARLuSbAyA5eDCl\",\"name\":\"output\"}]},\"type\":\"llmNode\",\"selected\":true,\"measured\":{\"width\":367,\"height\":642},\"dragging\":false},{\"id\":\"node_ZMRS1TtNuLaXnoPf\",\"position\":{\"x\":1494,\"y\":99},\"data\":{\"title\":\"结束节点\",\"description\":\"结束定义输出参数\",\"systemPrompt\":\"\",\"userPrompt\":\"\",\"expand\":true,\"outputDefs\":[{\"id\":\"x5GP5np5QsdobAGN\",\"name\":\"over\",\"ref\":\"node_p0uZxGdnyL6OJHDi.output\"}]},\"type\":\"endNode\",\"selected\":false,\"measured\":{\"width\":361,\"height\":200},\"dragging\":false}],\"edges\":[{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_EVEfZoilDIKGlkhz\",\"target\":\"node_OHI6fKMeQ7UDxWEa\",\"id\":\"xy-edge__node_EVEfZoilDIKGlkhz-node_OHI6fKMeQ7UDxWEa\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_OHI6fKMeQ7UDxWEa\",\"target\":\"node_p0uZxGdnyL6OJHDi\",\"id\":\"xy-edge__node_OHI6fKMeQ7UDxWEa-node_p0uZxGdnyL6OJHDi\",\"selected\":false},{\"markerEnd\":{\"type\":\"arrowclosed\",\"width\":20,\"height\":20},\"source\":\"node_p0uZxGdnyL6OJHDi\",\"target\":\"node_ZMRS1TtNuLaXnoPf\",\"id\":\"xy-edge__node_p0uZxGdnyL6OJHDi-node_ZMRS1TtNuLaXnoPf\",\"selected\":false}],\"viewport\":{\"x\":69,\"y\":29,\"zoom\":1}}', 'admin', '2025-03-15 15:30:21', 'admin', '2025-03-15 15:45:55', NULL, '0');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-03-14 13:33:55', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-03-14 13:33:55', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-03-14 13:33:55', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-03-14 13:33:55', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-03-14 13:33:55', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-03-14 13:33:55', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, 'OpenAI', 'OpenAI', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:53:07', 'admin', '2025-03-14 23:07:13', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, 'Ollama', 'Ollama', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:53:15', 'admin', '2025-03-14 23:07:17', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '文心一言', 'YiYan', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:53:26', 'admin', '2025-03-14 23:07:20', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '讯飞星火', 'XingHuo', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:53:43', 'admin', '2025-03-14 23:07:23', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 5, '通义千问', 'TongYi', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:54:06', 'admin', '2025-03-14 23:07:26', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 6, 'DeepSeek', 'DeepSeek', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:54:16', 'admin', '2025-03-14 23:07:31', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 7, '智谱', 'ZhiPu', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:54:34', 'admin', '2025-03-14 23:07:28', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 8, 'OpenAI 微软', 'AzureOpenAI', 'ai_ak_platform', NULL, 'primary', 'N', '0', 'admin', '2025-03-14 22:54:46', 'admin', '2025-03-14 23:07:34', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '模型平台', 'ai_ak_platform', '0', 'admin', '2025-03-14 22:51:12', '', NULL, '模型平台列表');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-03-14 13:33:54', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-03-14 13:33:54', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-03-14 13:33:54', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-03-14 13:33:54', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-03-14 13:33:54', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-03-14 13:33:54', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-03-14 13:33:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, 'AI模块', 0, 2, 'ai', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'AI', 'admin', '2025-03-14 19:16:54', 'admin', '2025-03-14 23:26:08', '');
INSERT INTO `sys_menu` VALUES (2001, '工作流', 2000, 2, 'flow', 'ai/flow/index', NULL, '', 1, 0, 'C', '0', '0', 'ai:flow:list', 'flow', 'admin', '2025-03-14 19:18:37', 'admin', '2025-03-14 23:28:34', '');
INSERT INTO `sys_menu` VALUES (2002, '控制台', 2000, 1, 'console', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'validCode', 'admin', '2025-03-14 22:01:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, 'API密钥', 2002, 1, 'key', 'ai/console/key/index', NULL, '', 1, 0, 'C', '0', '0', 'ai:console:key:list', 'key', 'admin', '2025-03-14 22:03:32', 'admin', '2025-03-14 23:29:15', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-03-14 13:33:54', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-03-15 12:56:16', 'admin', '2025-03-14 13:33:54', '', '2025-03-15 12:56:16', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2025-03-14 13:33:54', 'admin', '2025-03-14 13:33:54', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);

SET FOREIGN_KEY_CHECKS = 1;
