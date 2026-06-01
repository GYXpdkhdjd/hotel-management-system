/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : hotel-pro

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 26/09/2022 16:07:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hotel_banner
-- ----------------------------
DROP TABLE IF EXISTS `hotel_banner`;
CREATE TABLE `hotel_banner`  (
  `ban_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `info_id` int(11) NULL DEFAULT NULL COMMENT '客房id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '图片',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态 0：下架 1：上架',
  PRIMARY KEY (`ban_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_banner
-- ----------------------------
INSERT INTO `hotel_banner` VALUES (1, 12, '豪华单人间推广', 'http://192.168.31.70:8089/images/03778779-a694-4471-8200-4ee1ee92e08b.png', 1);
INSERT INTO `hotel_banner` VALUES (2, 15, '豪华双人间推广', 'http://192.168.31.70:8089/images/4da19a16-2c76-4774-9d70-812848e6f0c0.png', 1);
INSERT INTO `hotel_banner` VALUES (4, 21, '标准大床房推广', 'http://192.168.31.70:8089/images/93e3f542-42dc-48c3-b706-583fe415a63e.png', 1);

-- ----------------------------
-- Table structure for hotel_info
-- ----------------------------
DROP TABLE IF EXISTS `hotel_info`;
CREATE TABLE `hotel_info`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客房id',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '类型id',
  `info_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '客房名称',
  `img_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '客房图片',
  `info_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '详情',
  `info_price` decimal(18, 2) NULL DEFAULT NULL COMMENT '价格',
  `info_bed` int(11) NULL DEFAULT NULL COMMENT '床位数量',
  `info_count` int(11) NULL DEFAULT NULL COMMENT '可住人数',
  `info_status` tinyint(4) NULL DEFAULT NULL COMMENT '客房状态',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `to_index` tinyint(4) NULL DEFAULT 0 COMMENT '热推(放到首页)',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_info
-- ----------------------------
INSERT INTO `hotel_info` VALUES (11, 1, '标准单人间', 'http://192.168.31.70:8089/images/397ff595-6d07-4844-9173-bca0f9a4e068.png,http://192.168.31.70:8089/images/a1f2c54d-4418-49ac-87ee-4db965c60d5c.png,http://192.168.31.70:8089/images/0f8a3345-2330-4723-9751-6484dedf1462.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午12:00、退房时间 上午12:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 99.00, 1, 1, 1, 1, 0);
INSERT INTO `hotel_info` VALUES (12, 1, '豪华单人间', 'http://192.168.31.70:8089/images/5dc7edda-9d80-43cf-9799-5509e73d4643.png,http://192.168.31.70:8089/images/acb81f67-48e1-4d5c-8d7b-4eb3fb2a9c24.png,http://192.168.31.70:8089/images/0535cbf3-7e59-499b-be47-ab0fd8ec6b22.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午12:00、退房时间 上午12:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 169.00, 1, 1, 1, 2, 0);
INSERT INTO `hotel_info` VALUES (13, 1, '钟点房', 'http://192.168.31.70:8089/images/7a6bd329-b7b8-47b2-a7b1-ae4b2cef073f.png,http://192.168.31.70:8089/images/f630faea-3af2-4752-aa77-4d0c92df2444.png,http://192.168.31.70:8089/images/6f003914-58b6-416a-a0d4-29957ee27728.png', '<p><br></p><p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 早上6:00 - 下午6:00、退房时间 下午6:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 69.00, 1, 1, 1, 3, 0);
INSERT INTO `hotel_info` VALUES (14, 2, '标准双人间', 'http://192.168.31.70:8089/images/fe6998a6-a2ed-4622-a375-089c10f49ae5.png,http://192.168.31.70:8089/images/d880553d-625d-44b7-a18a-d6478a23ee33.png,http://192.168.31.70:8089/images/cad5005a-8cf6-440b-9b99-be2167609654.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 199.00, 2, 2, 1, 4, 0);
INSERT INTO `hotel_info` VALUES (15, 2, '豪华双人间', 'http://192.168.31.70:8089/images/c6c65176-fc4d-465d-bb39-408bd458d761.png,http://192.168.31.70:8089/images/2bf0156f-8c61-4b49-9f60-033c21d7b739.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 269.00, 2, 2, 1, 5, 0);
INSERT INTO `hotel_info` VALUES (16, 2, '情侣间', 'http://192.168.31.70:8089/images/3bfe2d4b-629a-466b-bfe0-3732042163cc.png,http://192.168.31.70:8089/images/16e7208c-72f3-4734-9c64-bdd8804be86f.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 269.00, 2, 2, 1, 6, 0);
INSERT INTO `hotel_info` VALUES (17, 3, '标准三人间', 'http://192.168.31.70:8089/images/a2481f69-8440-4740-933e-9f940628fe4a.png,http://192.168.31.70:8089/images/d908f12d-b2aa-4425-9824-10cd870012c5.png,http://192.168.31.70:8089/images/baa6daaa-8232-4a65-b5d6-f6a61e421a17.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 269.00, 3, 3, 1, 7, 0);
INSERT INTO `hotel_info` VALUES (19, 3, '豪华三人间', 'http://192.168.31.70:8089/images/647c82b8-bd00-4710-9ef3-152390fed547.png,http://192.168.31.70:8089/images/bbc36674-de5f-4765-8a19-1050f8b954df.png,http://192.168.31.70:8089/images/99cd9e44-f922-4d78-bf7e-fbd1ed302fb7.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 319.00, 3, 3, 1, 10, 0);
INSERT INTO `hotel_info` VALUES (20, 3, '静远三人间', 'http://192.168.31.70:8089/images/2249c279-ccf3-4176-ad1c-a7008b26d65a.png,http://192.168.31.70:8089/images/990868c5-2a56-4552-85cb-0d3a7d1cd810.png,http://192.168.31.70:8089/images/27ff406d-b919-4b0f-b69e-b39ac721d6f6.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 319.00, 3, 3, 1, 8, 0);
INSERT INTO `hotel_info` VALUES (21, 4, '标准大床房', 'http://192.168.31.70:8089/images/298b220c-72d2-46d7-82f4-4f171a93b262.png,http://192.168.31.70:8089/images/11e45e8b-b613-4225-80a5-4ae8cf1b9014.png,http://192.168.31.70:8089/images/6c4864be-2c22-41fa-a024-4dd0f1dc5e01.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 199.00, 1, 1, 1, 9, 0);
INSERT INTO `hotel_info` VALUES (22, 4, '怡情大床房', 'http://192.168.31.70:8089/images/915ad5bc-e650-4884-a8bb-34d3f300e7ec.png,http://192.168.31.70:8089/images/a4f4c5fa-f204-4679-84c7-397018d1bb72.png,http://192.168.31.70:8089/images/96a10501-3a86-45a0-ae75-4fd726fe0909.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 319.00, 1, 1, 1, 12, 0);
INSERT INTO `hotel_info` VALUES (23, 4, '雅致大床房', 'http://192.168.31.70:8089/images/55e31594-bbb4-4cba-9310-511f9b514e49.png,http://192.168.31.70:8089/images/2cddda6c-be74-4ff6-827f-5d3c14ad88b0.png', '<p><strong>独立房</strong>间</p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 319.00, 1, 1, 1, 11, 0);
INSERT INTO `hotel_info` VALUES (24, 5, '单人商务间', 'http://192.168.31.70:8089/images/cc9fd210-5613-4b56-bf03-8e9b40084c64.png,http://192.168.31.70:8089/images/c01fa839-48e3-4c47-ace3-3f2173e772c7.png,http://192.168.31.70:8089/images/6f2d198f-c5b4-464f-ab21-088499430bda.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 99.00, 1, 1, 1, 13, 0);
INSERT INTO `hotel_info` VALUES (25, 5, '双人商务间', 'http://192.168.31.70:8089/images/0e51582d-4d89-49fc-8de6-2983c33cc844.png,http://192.168.31.70:8089/images/6fadd40a-0adb-453f-a397-d34ac74d85d2.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 139.00, 2, 2, 1, 14, 0);
INSERT INTO `hotel_info` VALUES (26, 5, '三人商务间', 'http://192.168.31.70:8089/images/9b3a62a8-221f-451d-a2ce-6e8c7a7a1f03.png,http://192.168.31.70:8089/images/1e14d7bf-9cee-492b-a1be-4b9250e327b9.png', '<p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 179.00, 3, 3, 1, 15, 1);
INSERT INTO `hotel_info` VALUES (28, 6, '双套间', 'http://192.168.31.70:8089/images/a05c0c5f-59ce-4c33-a370-ad8ae9bfcea7.png,http://192.168.31.70:8089/images/d2d37d9f-bc70-4e17-a19b-c395c4be48d4.png', '<p><strong>独立房</strong>间</p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 179.00, 2, 2, 1, 16, 1);
INSERT INTO `hotel_info` VALUES (29, 6, '组合套间', 'http://192.168.31.70:8089/images/cd5ce223-7347-47c5-8274-1359251b26a3.png,http://192.168.31.70:8089/images/8d6d6630-b3a8-42d6-aa69-84af9cdd784a.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 299.00, 4, 4, 1, 17, 1);
INSERT INTO `hotel_info` VALUES (30, 6, '多套间', 'http://192.168.31.70:8089/images/51e3ce6e-8f1a-40fa-a7ab-98e2a9f82c42.png,http://192.168.31.70:8089/images/554b8242-d52a-4168-beaa-2645358e2af2.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 699.00, 6, 6, 1, 19, 1);
INSERT INTO `hotel_info` VALUES (31, 6, '高级套间', 'http://192.168.31.70:8089/images/36292926-10da-44e2-a5b4-e156d48cc77e.png,http://192.168.31.70:8089/images/c90867be-c8b6-4256-b851-3ff07e5b39c9.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 900.00, 6, 6, 1, 18, 1);
INSERT INTO `hotel_info` VALUES (32, 6, '复式套间', 'http://192.168.31.70:8089/images/ed0111b4-a6e2-4b97-9038-7b67f24471f4.png,http://192.168.31.70:8089/images/ff6d6fba-3252-4e99-9b88-cb5474e20631.png', '<p><strong>独立房间</strong></p><p>有自己的单独卧室，与他人共享其它空间</p><p><strong>超赞房东</strong></p><p>超赞房东经验丰富、评分很高，致力于为房客提供优质的住宿体验。</p><p><strong>入住/退房</strong></p><p>入住时间 下午2:00 - 下午9:00、退房时间 上午8:00</p><p><strong>自助入住</strong></p><p>通过密码钥匙盒自助入住</p>', 699.00, 6, 6, 1, 20, 1);

-- ----------------------------
-- Table structure for hotel_info_service
-- ----------------------------
DROP TABLE IF EXISTS `hotel_info_service`;
CREATE TABLE `hotel_info_service`  (
  `info_service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `info_id` int(11) NULL DEFAULT NULL COMMENT '客房id',
  `service_id` int(11) NULL DEFAULT NULL COMMENT '服务id',
  PRIMARY KEY (`info_service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 387 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_info_service
-- ----------------------------
INSERT INTO `hotel_info_service` VALUES (187, 6, 1);
INSERT INTO `hotel_info_service` VALUES (188, 6, 2);
INSERT INTO `hotel_info_service` VALUES (189, 6, 3);
INSERT INTO `hotel_info_service` VALUES (190, 6, 4);
INSERT INTO `hotel_info_service` VALUES (191, 6, 5);
INSERT INTO `hotel_info_service` VALUES (192, 9, 1);
INSERT INTO `hotel_info_service` VALUES (193, 9, 2);
INSERT INTO `hotel_info_service` VALUES (194, 9, 5);
INSERT INTO `hotel_info_service` VALUES (195, 9, 4);
INSERT INTO `hotel_info_service` VALUES (196, 5, 1);
INSERT INTO `hotel_info_service` VALUES (197, 5, 4);
INSERT INTO `hotel_info_service` VALUES (198, 5, 5);
INSERT INTO `hotel_info_service` VALUES (199, 10, 1);
INSERT INTO `hotel_info_service` VALUES (200, 10, 4);
INSERT INTO `hotel_info_service` VALUES (201, 10, 2);
INSERT INTO `hotel_info_service` VALUES (202, 10, 3);
INSERT INTO `hotel_info_service` VALUES (321, 25, 1);
INSERT INTO `hotel_info_service` VALUES (322, 25, 2);
INSERT INTO `hotel_info_service` VALUES (323, 25, 3);
INSERT INTO `hotel_info_service` VALUES (324, 24, 1);
INSERT INTO `hotel_info_service` VALUES (325, 24, 2);
INSERT INTO `hotel_info_service` VALUES (326, 24, 3);
INSERT INTO `hotel_info_service` VALUES (330, 23, 1);
INSERT INTO `hotel_info_service` VALUES (331, 23, 2);
INSERT INTO `hotel_info_service` VALUES (332, 23, 3);
INSERT INTO `hotel_info_service` VALUES (333, 19, 1);
INSERT INTO `hotel_info_service` VALUES (334, 19, 2);
INSERT INTO `hotel_info_service` VALUES (335, 19, 3);
INSERT INTO `hotel_info_service` VALUES (336, 21, 1);
INSERT INTO `hotel_info_service` VALUES (337, 21, 2);
INSERT INTO `hotel_info_service` VALUES (338, 21, 3);
INSERT INTO `hotel_info_service` VALUES (339, 20, 1);
INSERT INTO `hotel_info_service` VALUES (340, 20, 2);
INSERT INTO `hotel_info_service` VALUES (341, 20, 3);
INSERT INTO `hotel_info_service` VALUES (342, 17, 1);
INSERT INTO `hotel_info_service` VALUES (343, 17, 2);
INSERT INTO `hotel_info_service` VALUES (344, 17, 3);
INSERT INTO `hotel_info_service` VALUES (348, 15, 1);
INSERT INTO `hotel_info_service` VALUES (349, 15, 2);
INSERT INTO `hotel_info_service` VALUES (350, 15, 3);
INSERT INTO `hotel_info_service` VALUES (351, 14, 1);
INSERT INTO `hotel_info_service` VALUES (352, 14, 2);
INSERT INTO `hotel_info_service` VALUES (353, 14, 3);
INSERT INTO `hotel_info_service` VALUES (354, 13, 1);
INSERT INTO `hotel_info_service` VALUES (355, 13, 2);
INSERT INTO `hotel_info_service` VALUES (356, 13, 3);
INSERT INTO `hotel_info_service` VALUES (357, 12, 1);
INSERT INTO `hotel_info_service` VALUES (358, 12, 2);
INSERT INTO `hotel_info_service` VALUES (359, 12, 3);
INSERT INTO `hotel_info_service` VALUES (360, 11, 1);
INSERT INTO `hotel_info_service` VALUES (361, 11, 2);
INSERT INTO `hotel_info_service` VALUES (362, 11, 3);
INSERT INTO `hotel_info_service` VALUES (363, 26, 1);
INSERT INTO `hotel_info_service` VALUES (364, 26, 2);
INSERT INTO `hotel_info_service` VALUES (365, 26, 3);
INSERT INTO `hotel_info_service` VALUES (366, 28, 1);
INSERT INTO `hotel_info_service` VALUES (367, 28, 2);
INSERT INTO `hotel_info_service` VALUES (368, 28, 3);
INSERT INTO `hotel_info_service` VALUES (369, 29, 1);
INSERT INTO `hotel_info_service` VALUES (370, 29, 2);
INSERT INTO `hotel_info_service` VALUES (371, 29, 3);
INSERT INTO `hotel_info_service` VALUES (372, 30, 1);
INSERT INTO `hotel_info_service` VALUES (373, 30, 2);
INSERT INTO `hotel_info_service` VALUES (374, 30, 3);
INSERT INTO `hotel_info_service` VALUES (375, 31, 1);
INSERT INTO `hotel_info_service` VALUES (376, 31, 2);
INSERT INTO `hotel_info_service` VALUES (377, 31, 3);
INSERT INTO `hotel_info_service` VALUES (378, 32, 1);
INSERT INTO `hotel_info_service` VALUES (379, 32, 2);
INSERT INTO `hotel_info_service` VALUES (380, 32, 3);
INSERT INTO `hotel_info_service` VALUES (381, 22, 1);
INSERT INTO `hotel_info_service` VALUES (382, 22, 2);
INSERT INTO `hotel_info_service` VALUES (383, 22, 3);
INSERT INTO `hotel_info_service` VALUES (384, 16, 1);
INSERT INTO `hotel_info_service` VALUES (385, 16, 2);
INSERT INTO `hotel_info_service` VALUES (386, 16, 3);

-- ----------------------------
-- Table structure for hotel_order
-- ----------------------------
DROP TABLE IF EXISTS `hotel_order`;
CREATE TABLE `hotel_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '小程序openid',
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电话',
  `id_card` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '身份证',
  `room_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '房间id',
  `room_code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '房间编号',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  `book_time` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '到店时间',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '1:预订成功  2：已入住 3：退房 4：取消',
  `room_count` int(11) NULL DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_order
-- ----------------------------
INSERT INTO `hotel_order` VALUES (9, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '王五', '1546879464656', NULL, '147', '201', '2022-09-22 17:07:56', '2022-09-23 ', '4', 1);
INSERT INTO `hotel_order` VALUES (10, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '李翔', '15467896464', NULL, '48,49', '102,103', '2022-09-22 17:08:41', '2022-09-24 ', '2', 2);
INSERT INTO `hotel_order` VALUES (11, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '张丽', '145646465', NULL, '50', '104', '2022-09-22 17:09:11', '2022-09-25 ', '2', 1);
INSERT INTO `hotel_order` VALUES (12, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '测试', '184646464', NULL, '51,52', '105,106', '2022-09-22 17:13:19', '2022-09-26 ', '2', 2);
INSERT INTO `hotel_order` VALUES (13, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '张宇', '1868744646', NULL, '177,178', '250,251', '2022-09-22 18:22:55', '2022-09-26 ', '4', 2);
INSERT INTO `hotel_order` VALUES (14, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '测试', '14646465', NULL, '55', '109', '2022-09-22 18:49:19', '2022-09-27 ', '4', 1);
INSERT INTO `hotel_order` VALUES (15, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '张武', '1856467464646', NULL, '442', '571', '2022-09-26 13:42:50', '2022-09-27 ', '1', 1);
INSERT INTO `hotel_order` VALUES (16, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '李丽', '18687116223', NULL, '458', '600', '2022-09-26 13:43:53', '2022-09-28 ', '2', 1);
INSERT INTO `hotel_order` VALUES (17, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '张三', '1868716223', NULL, '208,209', '281,282', '2022-09-26 14:07:52', '2022-09-29 ', '2', 2);
INSERT INTO `hotel_order` VALUES (18, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '王五', '178464513331', NULL, '443', '572', '2022-09-26 14:10:25', '2022-09-30 ', '1', 1);
INSERT INTO `hotel_order` VALUES (19, 'ok-u55Yewi_iD6ghDCVkzD0A-hwo', '赵柳', '1546464646', NULL, '46', '100', '2022-09-26 14:11:22', '2022-09-30 ', '1', 1);

-- ----------------------------
-- Table structure for hotel_room
-- ----------------------------
DROP TABLE IF EXISTS `hotel_room`;
CREATE TABLE `hotel_room`  (
  `room_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房间id',
  `info_id` int(11) NULL DEFAULT NULL COMMENT '客房id',
  `room_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '房间编号',
  `into_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '(该字段暂未使用)',
  `book_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '预订状态 0：未预订(未使用) 1：已预订 2：已入住 3：维修中 4：停用',
  `use_status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '(该字段暂未使用)',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 551 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_room
-- ----------------------------
INSERT INTO `hotel_room` VALUES (46, 11, '100', '0', '1', '0');
INSERT INTO `hotel_room` VALUES (47, 11, '101', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (48, 11, '102', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (49, 11, '103', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (50, 11, '104', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (51, 11, '105', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (52, 11, '106', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (53, 11, '107', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (54, 11, '108', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (55, 11, '109', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (56, 11, '110', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (57, 11, '111', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (58, 11, '112', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (59, 11, '113', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (60, 11, '114', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (61, 11, '115', '0', '3', '0');
INSERT INTO `hotel_room` VALUES (62, 11, '116', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (63, 11, '117', '0', '4', '0');
INSERT INTO `hotel_room` VALUES (64, 11, '118', '0', '3', '0');
INSERT INTO `hotel_room` VALUES (65, 11, '119', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (66, 11, '120', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (67, 11, '121', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (68, 11, '122', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (69, 11, '123', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (70, 11, '124', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (71, 11, '125', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (72, 11, '126', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (73, 11, '127', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (74, 11, '128', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (75, 11, '129', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (76, 11, '130', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (77, 11, '131', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (78, 11, '132', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (79, 11, '133', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (80, 11, '134', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (81, 11, '135', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (82, 11, '136', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (83, 11, '137', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (84, 11, '138', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (85, 11, '139', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (86, 11, '140', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (87, 11, '141', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (88, 11, '142', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (89, 11, '143', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (90, 11, '144', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (91, 11, '145', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (92, 11, '146', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (93, 11, '147', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (94, 11, '148', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (95, 11, '149', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (96, 11, '150', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (97, 12, '151', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (98, 12, '152', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (99, 12, '153', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (100, 12, '154', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (101, 12, '155', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (102, 12, '156', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (103, 12, '157', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (104, 12, '158', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (105, 12, '159', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (106, 12, '160', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (107, 12, '161', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (108, 12, '162', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (109, 12, '163', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (110, 12, '164', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (111, 12, '165', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (112, 12, '166', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (113, 12, '167', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (114, 12, '168', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (115, 12, '169', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (116, 12, '170', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (117, 12, '171', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (118, 12, '172', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (119, 12, '173', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (120, 12, '174', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (121, 12, '175', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (122, 12, '176', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (123, 12, '177', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (124, 12, '178', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (125, 12, '179', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (126, 12, '180', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (127, 12, '181', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (128, 12, '182', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (129, 12, '183', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (130, 12, '184', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (131, 12, '185', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (132, 12, '186', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (133, 12, '187', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (134, 12, '188', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (135, 12, '189', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (136, 12, '190', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (137, 12, '191', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (138, 12, '192', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (139, 12, '193', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (140, 12, '194', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (141, 12, '195', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (142, 12, '196', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (143, 12, '197', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (144, 12, '198', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (145, 12, '199', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (146, 12, '200', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (147, 13, '201', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (148, 13, '202', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (149, 13, '203', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (150, 13, '204', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (151, 13, '205', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (152, 13, '206', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (153, 13, '207', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (154, 13, '208', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (155, 13, '209', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (156, 13, '210', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (157, 13, '211', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (158, 13, '212', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (159, 13, '213', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (160, 13, '214', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (161, 13, '215', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (162, 13, '216', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (163, 13, '217', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (164, 13, '218', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (165, 13, '219', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (166, 13, '220', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (167, 13, '221', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (168, 13, '222', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (169, 13, '223', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (170, 13, '224', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (171, 13, '225', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (172, 13, '226', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (173, 13, '227', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (174, 13, '228', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (175, 13, '229', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (176, 13, '230', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (177, 14, '250', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (178, 14, '251', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (179, 14, '252', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (180, 14, '253', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (181, 14, '254', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (182, 14, '255', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (183, 14, '256', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (184, 14, '257', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (185, 14, '258', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (186, 14, '259', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (187, 14, '260', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (188, 14, '261', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (189, 14, '262', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (190, 14, '263', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (191, 14, '264', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (192, 14, '265', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (193, 14, '266', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (194, 14, '267', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (195, 14, '268', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (196, 14, '269', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (197, 14, '270', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (198, 14, '271', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (199, 14, '272', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (200, 14, '273', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (201, 14, '274', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (202, 14, '275', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (203, 14, '276', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (204, 14, '277', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (205, 14, '278', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (206, 14, '279', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (207, 14, '280', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (208, 15, '281', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (209, 15, '282', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (210, 15, '283', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (211, 15, '284', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (212, 15, '285', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (213, 15, '286', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (214, 15, '287', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (215, 15, '288', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (216, 15, '289', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (217, 15, '290', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (218, 15, '291', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (219, 15, '292', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (220, 15, '293', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (221, 15, '294', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (222, 15, '295', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (223, 15, '296', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (224, 15, '297', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (225, 15, '298', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (226, 15, '299', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (227, 15, '300', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (228, 15, '301', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (229, 15, '302', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (230, 15, '303', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (231, 15, '304', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (232, 15, '305', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (233, 15, '306', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (234, 15, '307', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (235, 15, '308', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (236, 15, '309', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (237, 15, '310', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (238, 16, '311', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (239, 16, '312', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (240, 16, '313', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (241, 16, '314', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (242, 16, '315', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (243, 16, '316', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (244, 16, '317', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (245, 16, '318', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (246, 16, '319', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (247, 16, '320', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (248, 16, '321', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (249, 16, '322', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (250, 16, '323', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (251, 16, '324', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (252, 16, '325', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (253, 16, '326', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (254, 16, '327', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (255, 16, '328', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (256, 16, '329', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (257, 16, '330', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (258, 17, '331', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (259, 17, '332', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (260, 17, '333', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (261, 17, '334', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (262, 17, '335', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (263, 17, '336', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (264, 17, '337', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (265, 17, '338', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (266, 17, '339', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (267, 17, '340', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (268, 17, '341', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (269, 17, '342', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (270, 17, '343', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (271, 17, '344', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (272, 17, '345', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (273, 17, '346', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (274, 19, '350', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (275, 19, '351', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (276, 19, '352', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (277, 19, '353', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (278, 19, '354', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (279, 19, '355', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (280, 19, '356', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (281, 19, '357', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (282, 19, '358', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (283, 19, '359', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (284, 19, '360', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (285, 19, '361', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (286, 19, '362', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (287, 19, '363', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (288, 19, '364', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (289, 19, '365', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (290, 19, '366', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (291, 19, '367', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (292, 19, '368', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (293, 19, '369', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (294, 19, '370', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (295, 19, '371', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (296, 19, '372', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (297, 19, '373', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (298, 19, '374', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (299, 19, '375', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (300, 19, '376', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (301, 19, '377', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (302, 19, '378', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (303, 19, '379', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (304, 19, '380', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (305, 19, '381', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (306, 19, '382', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (307, 19, '383', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (308, 19, '384', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (309, 19, '385', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (310, 19, '386', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (311, 19, '387', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (312, 19, '388', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (313, 19, '389', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (314, 19, '390', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (315, 19, '391', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (316, 19, '392', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (317, 19, '393', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (318, 19, '394', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (319, 19, '395', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (320, 19, '396', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (321, 19, '397', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (322, 19, '398', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (323, 19, '399', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (324, 19, '400', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (325, 19, '401', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (326, 19, '402', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (327, 19, '403', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (328, 19, '404', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (329, 19, '405', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (330, 19, '406', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (331, 19, '407', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (332, 19, '408', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (333, 19, '409', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (334, 19, '410', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (335, 19, '411', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (336, 19, '412', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (337, 19, '413', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (338, 19, '414', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (339, 19, '415', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (340, 20, '416', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (341, 20, '417', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (342, 20, '418', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (343, 20, '419', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (344, 20, '420', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (345, 20, '421', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (346, 20, '422', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (347, 20, '423', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (348, 20, '424', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (349, 20, '425', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (350, 20, '426', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (351, 20, '427', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (352, 20, '428', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (353, 20, '429', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (354, 20, '430', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (355, 21, '431', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (356, 21, '432', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (357, 21, '433', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (358, 21, '434', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (359, 21, '435', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (360, 21, '436', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (361, 21, '437', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (362, 21, '438', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (363, 21, '439', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (364, 21, '440', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (365, 21, '441', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (366, 21, '442', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (367, 21, '443', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (368, 21, '444', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (369, 21, '445', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (370, 21, '446', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (371, 22, '500', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (372, 22, '501', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (373, 22, '502', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (374, 22, '503', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (375, 22, '504', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (376, 22, '505', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (377, 22, '506', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (378, 22, '507', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (379, 22, '508', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (380, 22, '509', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (381, 22, '510', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (382, 22, '511', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (383, 22, '512', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (384, 22, '513', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (385, 22, '514', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (386, 22, '515', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (387, 23, '516', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (388, 23, '517', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (389, 23, '518', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (390, 23, '519', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (391, 23, '520', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (392, 23, '521', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (393, 23, '522', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (394, 23, '523', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (395, 23, '524', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (396, 23, '525', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (397, 23, '526', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (398, 23, '527', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (399, 23, '528', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (400, 23, '529', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (401, 23, '530', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (402, 23, '531', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (403, 23, '532', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (404, 23, '533', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (405, 23, '534', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (406, 23, '535', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (407, 23, '536', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (408, 24, '537', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (409, 24, '538', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (410, 24, '539', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (411, 24, '540', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (412, 24, '541', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (413, 24, '542', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (414, 24, '543', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (415, 24, '544', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (416, 24, '545', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (417, 24, '546', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (418, 24, '547', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (419, 24, '548', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (420, 24, '549', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (421, 24, '550', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (422, 25, '551', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (423, 25, '552', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (424, 25, '553', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (425, 25, '554', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (426, 25, '555', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (427, 25, '556', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (428, 25, '557', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (429, 25, '558', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (430, 25, '559', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (431, 25, '560', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (432, 25, '561', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (433, 25, '562', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (434, 25, '563', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (435, 25, '564', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (436, 25, '565', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (437, 25, '566', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (438, 25, '567', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (439, 25, '568', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (440, 25, '569', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (441, 25, '570', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (442, 26, '571', '0', '1', '0');
INSERT INTO `hotel_room` VALUES (443, 26, '572', '0', '1', '0');
INSERT INTO `hotel_room` VALUES (444, 26, '573', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (445, 26, '574', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (446, 26, '575', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (447, 26, '576', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (448, 26, '577', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (449, 26, '578', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (450, 26, '579', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (451, 26, '580', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (452, 26, '581', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (453, 26, '582', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (454, 26, '583', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (455, 26, '584', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (456, 26, '585', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (457, 26, '586', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (458, 28, '600', '0', '2', '0');
INSERT INTO `hotel_room` VALUES (459, 28, '601', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (460, 28, '602', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (461, 28, '603', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (462, 28, '604', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (463, 28, '605', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (464, 28, '606', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (465, 28, '607', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (466, 28, '608', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (467, 28, '609', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (468, 28, '610', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (469, 28, '611', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (470, 28, '612', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (471, 28, '613', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (472, 28, '614', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (473, 28, '615', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (474, 29, '616', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (475, 29, '617', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (476, 29, '618', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (477, 29, '619', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (478, 29, '620', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (479, 29, '621', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (480, 29, '622', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (481, 29, '623', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (482, 29, '624', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (483, 29, '625', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (484, 29, '626', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (485, 30, '627', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (486, 30, '628', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (487, 30, '629', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (488, 30, '630', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (489, 30, '631', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (490, 30, '632', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (491, 30, '633', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (492, 30, '634', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (493, 30, '635', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (494, 31, '636', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (495, 31, '637', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (496, 31, '638', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (497, 31, '639', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (498, 31, '640', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (499, 31, '641', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (500, 31, '642', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (501, 31, '643', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (502, 31, '644', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (503, 31, '645', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (504, 31, '646', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (505, 32, '647', '2', '0', '3');
INSERT INTO `hotel_room` VALUES (506, 32, '648', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (507, 32, '649', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (535, 32, '650', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (536, 32, '651', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (537, 32, '652', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (538, 32, '653', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (539, 32, '654', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (540, 32, '655', '0', '0', '0');
INSERT INTO `hotel_room` VALUES (550, 32, '666', '0', '0', '0');

-- ----------------------------
-- Table structure for hotel_service
-- ----------------------------
DROP TABLE IF EXISTS `hotel_service`;
CREATE TABLE `hotel_service`  (
  `service_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_service
-- ----------------------------
INSERT INTO `hotel_service` VALUES (1, '免费wifi', 1);
INSERT INTO `hotel_service` VALUES (2, '太阳能热水', 2);
INSERT INTO `hotel_service` VALUES (3, '咖啡', 3);

-- ----------------------------
-- Table structure for hotel_suggest
-- ----------------------------
DROP TABLE IF EXISTS `hotel_suggest`;
CREATE TABLE `hotel_suggest`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '标题',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'openid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_suggest
-- ----------------------------
INSERT INTO `hotel_suggest` VALUES (1, '环境不好', '不卫生', '2022-09-22 09:43:59', 'ok-u55Yewi_iD6ghDCVkzD0A-hwo');
INSERT INTO `hotel_suggest` VALUES (2, '很好', '环境优美', '2022-09-24 09:43:59', 'ok-u55Yewi_iD6ghDCVkzD0A-hwo');
INSERT INTO `hotel_suggest` VALUES (3, '11', '111', '2022-09-26 14:12:39', 'ok-u55Yewi_iD6ghDCVkzD0A-hwo');

-- ----------------------------
-- Table structure for hotel_type
-- ----------------------------
DROP TABLE IF EXISTS `hotel_type`;
CREATE TABLE `hotel_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel_type
-- ----------------------------
INSERT INTO `hotel_type` VALUES (1, '单人间', 1);
INSERT INTO `hotel_type` VALUES (2, '双人间', 2);
INSERT INTO `hotel_type` VALUES (3, '三人间', 3);
INSERT INTO `hotel_type` VALUES (4, '大床房', 4);
INSERT INTO `hotel_type` VALUES (5, '商务间', 5);
INSERT INTO `hotel_type` VALUES (6, '套间', 6);

-- ----------------------------
-- Table structure for into_order
-- ----------------------------
DROP TABLE IF EXISTS `into_order`;
CREATE TABLE `into_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `room_id` int(11) NULL DEFAULT NULL COMMENT '房间id',
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电话',
  `card_type` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '证件类型',
  `card_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '证件号码',
  `room_code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '房间编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `into_time` datetime(0) NULL DEFAULT NULL COMMENT '入住时间',
  `leave_time` datetime(0) NULL DEFAULT NULL COMMENT '退房时间',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '状态 1：已入住 2：退房',
  `price` decimal(18, 2) NULL DEFAULT NULL COMMENT '金额',
  `user` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of into_order
-- ----------------------------
INSERT INTO `into_order` VALUES (17, 46, '张三', '0', '1789646464', '身份证', '531346556', '100', '2022-09-22 15:13:12', '2022-09-22 15:13:12', '2022-09-22 15:13:58', '2', 699.00, NULL);
INSERT INTO `into_order` VALUES (18, 46, '王五', '0', '14646466446', '身份证', '5131646464', '100', '2022-09-22 15:14:59', '2022-09-22 15:14:59', '2022-09-22 15:17:04', '2', 166.00, NULL);
INSERT INTO `into_order` VALUES (19, 47, '赵柳', '0', '1456464656', '身份证', '5131331131313', '101', '2022-09-22 15:16:04', '2022-09-22 15:16:04', '2022-09-22 17:05:25', '2', 99.00, NULL);
INSERT INTO `into_order` VALUES (20, 99, '哈哈', '0', '1456464256', '身份证', '553133133', '153', '2022-09-22 15:16:29', '2022-09-22 15:16:29', '2022-09-22 17:06:06', '2', 66.00, NULL);
INSERT INTO `into_order` VALUES (21, 100, '测试', '0', '1789764646', '身份证', '51346464646', '154', '2022-09-22 17:05:43', '2022-09-22 17:05:43', '2022-09-22 17:06:13', '2', 999.00, NULL);
INSERT INTO `into_order` VALUES (22, 46, '张三', '0', '14646464', '身份证', '51316464646', '100', '2022-09-22 17:06:58', '2022-09-22 17:06:58', '2022-09-26 13:55:16', '2', 900.00, NULL);
INSERT INTO `into_order` VALUES (23, 47, '李四', '0', '15446464646', '身份证', '511222644445', '101', '2022-09-22 17:07:19', '2022-09-22 17:07:19', '2022-09-26 14:05:22', '2', 560.00, NULL);
INSERT INTO `into_order` VALUES (38, 52, '遛个狗', '0', '1464564646', '身份证', '513446464646', '106', '2022-09-22 17:39:19', '2022-09-22 17:39:19', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (39, 50, '王爽', '0', '17894646456', '身份证', '513464646456', '104', '2022-09-22 17:40:30', '2022-09-22 17:40:30', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (40, 51, '郑敏', '1', '45646754646', '身份证', '14678976465464', '105', '2022-09-22 17:41:21', '2022-09-22 17:41:21', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (42, 48, '测试', '0', '14564646546', '身份证', '15644464464654564', '102', '2022-09-22 18:41:09', '2022-09-22 18:41:09', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (43, 58, '测试', '0', '146464646', '身份证', '146464646546', '112', '2022-09-22 21:55:46', '2022-09-22 21:55:46', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (44, 59, '测试', '0', '146464646', '身份证', '51346464646', '113', '2022-09-22 22:32:25', '2022-09-22 22:32:25', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (45, 49, '李明', '0', '18687116223', '身份证', '5325465464654664', '103', '2022-09-26 13:55:50', '2022-09-26 13:55:50', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (46, 458, '李丽', '1', '18687116223', '身份证', '53456464646', '600', '2022-09-26 14:06:23', '2022-09-26 14:06:23', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (47, 208, '李丽', '1', '18687116223', '身份证', '45222322223', '281', '2022-09-26 14:09:04', '2022-09-26 14:09:04', NULL, '1', NULL, NULL);
INSERT INTO `into_order` VALUES (48, 209, '王明', '0', '1587445464654', '身份证', '51223455464646', '282', '2022-09-26 14:09:29', '2022-09-26 14:09:29', NULL, '1', NULL, NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级菜单id',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '权限字段',
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由name',
  `path` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '路由path',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '组件路径',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类型(0 目录 1菜单，2按钮)',
  `icon` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '图标',
  `parent_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '上级菜单名称',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '序号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'sys:manage', 'system', '/system', '', '0', 'Setting', '顶级菜单', 1, '2022-08-05 09:35:02', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, '员工管理', 'sys:user', 'userList', '/userList', '/system/user/UserList', '1', 'UserFilled', '系统管理', 2, '2022-08-05 09:38:15', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'sys:role', 'roleList', '/roleList', '/system/role/RoleList', '1', 'Wallet', '系统管理', 3, '2022-08-05 09:39:39', '2022-09-24 19:51:17');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'sys:menu', 'menuList', '/menuList', '/system/menu/MenuList', '1', 'Menu', '系统管理', 4, '2022-08-05 09:40:23', NULL);
INSERT INTO `sys_menu` VALUES (5, 0, '酒店管理', 'sys:totelRoot', 'totelRoot', '/totelRoot', '', '0', 'UserFilled', '顶级菜单', 5, '2022-08-05 09:41:48', NULL);
INSERT INTO `sys_menu` VALUES (6, 5, '房间类型', 'sys:roomType', 'roomType', '/roomType', '/type/RoomType', '1', 'UserFilled', '酒店管理', 7, '2022-08-05 09:42:32', '2022-09-25 13:31:44');
INSERT INTO `sys_menu` VALUES (8, 2, '新增', 'sys:user:add', '', '', '', '2', '', '员工管理', 9, '2022-08-05 09:56:42', '2022-09-25 13:31:33');
INSERT INTO `sys_menu` VALUES (9, 2, '编辑', 'sys:user:edit', '', '', '', '2', '', '员工管理', 10, '2022-08-05 09:57:02', '2022-09-25 13:31:28');
INSERT INTO `sys_menu` VALUES (10, 5, '客房管理', 'sys:hotelRoom', 'hotelRoom', '/hotelRoom', '/hotel/HotelRoom', '1', 'Menu', '酒店管理', 8, '2022-08-05 11:56:20', '2022-09-25 13:31:40');
INSERT INTO `sys_menu` VALUES (11, 2, '新增', 'sys:user:delete', '', '', '', '2', '', '员工管理', 11, '2022-09-25 13:26:52', '2022-09-25 13:31:24');
INSERT INTO `sys_menu` VALUES (12, 3, '新增', 'sys:role:add', '', '', '', '2', '', '角色管理', 12, '2022-09-25 13:27:15', '2022-09-25 13:31:19');
INSERT INTO `sys_menu` VALUES (13, 3, '编辑', 'sys:role:edit', '', '', '', '2', '', '角色管理', 13, '2022-09-25 13:27:39', '2022-09-25 13:31:15');
INSERT INTO `sys_menu` VALUES (14, 3, '删除', 'sys:role:delete', '', '', '', '2', '', '角色管理', 14, '2022-09-25 13:27:59', '2022-09-25 13:31:10');
INSERT INTO `sys_menu` VALUES (15, 4, '新增', 'sys:menu:add', '', '', '', '2', '', '菜单管理', 15, '2022-09-25 13:28:23', '2022-09-25 13:31:05');
INSERT INTO `sys_menu` VALUES (16, 4, '编辑', 'sys:menu:edit', '', '', '', '2', '', '菜单管理', 16, '2022-09-25 13:28:43', '2022-09-25 13:31:00');
INSERT INTO `sys_menu` VALUES (17, 4, '删除', 'sys:menu:delete', '', '', '', '2', '', '菜单管理', 17, '2022-09-25 13:29:04', '2022-09-25 13:30:55');
INSERT INTO `sys_menu` VALUES (18, 5, '服务管理', 'sys:roomService', 'roomService', '/roomService', '/service/RoomService', '1', 'UserFilled', '酒店管理', 6, '2022-09-25 13:33:07', '2022-09-25 13:00:54');
INSERT INTO `sys_menu` VALUES (19, 18, '新增', 'sys:roomService:add', '', '', '/type/RoomType', '2', '', '服务管理', 19, '2022-09-25 14:34:12', '2022-09-25 13:00:54');
INSERT INTO `sys_menu` VALUES (20, 18, '编辑', 'sys:roomService:edit', '', '', '/type/RoomType', '2', '', '服务管理', 20, '2022-09-25 14:34:50', '2022-09-25 13:00:54');
INSERT INTO `sys_menu` VALUES (21, 18, '删除', 'sys:roomService:delete', '', '', '/type/RoomType', '2', '', '服务管理', 21, '2022-09-25 14:35:11', '2022-09-25 13:00:54');
INSERT INTO `sys_menu` VALUES (22, 6, '新增', 'sys:roomType:add', '', '', '/type/RoomType', '2', '', '房间类型', 22, '2022-09-25 14:35:34', '2022-09-25 13:00:54');
INSERT INTO `sys_menu` VALUES (23, 6, '编辑', 'sys:roomType:edit', '', '', '/type/RoomType', '2', '', '房间类型', 23, '2022-09-25 14:35:55', '2022-09-25 13:00:54');
INSERT INTO `sys_menu` VALUES (24, 6, '删除', 'sys:roomType:delete', '', '', '/type/RoomType', '2', '', '房间类型', 24, '2022-09-25 14:36:16', '2022-09-25 13:00:54');
INSERT INTO `sys_menu` VALUES (25, 10, '新增', 'sys:hotelRoom:add', '', '', '/hotel/HotelRoom', '2', '', '客房管理', 25, '2022-09-25 14:37:14', '2022-09-25 13:31:40');
INSERT INTO `sys_menu` VALUES (26, 10, '编辑', 'sys:hotelRoom:edit', '', '', '/hotel/HotelRoom', '2', '', '客房管理', 26, '2022-09-25 14:37:53', '2022-09-25 13:31:40');
INSERT INTO `sys_menu` VALUES (27, 10, '删除', 'sys:hotelRoom:delete', '', '', '/hotel/HotelRoom', '2', '', '客房管理', 27, '2022-09-25 14:38:14', '2022-09-25 13:31:40');
INSERT INTO `sys_menu` VALUES (28, 10, '新增房间', 'sys:hotelRoom:addRoom', '', '', '', '2', '', '客房管理', 28, '2022-09-25 14:39:36', NULL);
INSERT INTO `sys_menu` VALUES (29, 0, '活动管理', 'sys:activityRoot', 'activityRoot', '/activityRoot', '', '0', 'UserFilled', '顶级菜单', 29, '2022-09-25 14:40:34', NULL);
INSERT INTO `sys_menu` VALUES (30, 29, '广告管理', 'sys:banner', 'banner', '/banner', '/banner/Banner', '1', 'Menu', '活动管理', 30, '2022-09-25 14:41:33', NULL);
INSERT INTO `sys_menu` VALUES (31, 30, '新增', 'sys:banner:add', '', '', '', '2', '', '广告管理', 31, '2022-09-25 14:41:56', NULL);
INSERT INTO `sys_menu` VALUES (32, 30, '编辑', 'sys:banner:edit', '', '', '', '2', '', '广告管理', 32, '2022-09-25 14:42:17', NULL);
INSERT INTO `sys_menu` VALUES (33, 30, '删除', 'sys:banner:delete', '', '', '', '2', '', '广告管理', 33, '2022-09-25 14:42:35', NULL);
INSERT INTO `sys_menu` VALUES (34, 0, '订单管理', 'sys:orderRoot', 'orderRoot', '/orderRoot', '', '0', 'UserFilled', '顶级菜单', 34, '2022-09-25 14:43:24', NULL);
INSERT INTO `sys_menu` VALUES (35, 34, '入住订单', 'sys:intoOrder', 'intoOrder', '/intoOrder', '/into_order/Index', '1', 'Menu', '订单管理', 35, '2022-09-25 14:44:17', NULL);
INSERT INTO `sys_menu` VALUES (36, 34, '预订订单', 'sys:bookOrder', 'bookOrder', '/bookOrder', '/book_order/Index', '1', 'Menu', '订单管理', 36, '2022-09-25 14:45:07', NULL);
INSERT INTO `sys_menu` VALUES (37, 0, '反馈管理', 'sys:suggestRoot', 'suggestRoot', '/suggestRoot', '', '0', 'UserFilled', '顶级菜单', 37, '2022-09-25 14:46:15', NULL);
INSERT INTO `sys_menu` VALUES (38, 37, '反馈列表', 'sys:suggest', 'suggest', '/suggest', '/suggest/Index', '1', 'Menu', '反馈管理', 38, '2022-09-25 14:47:03', NULL);
INSERT INTO `sys_menu` VALUES (39, 2, '重置密码', 'sys:user:resetPasword', '', '', '', '2', '', '员工管理', 9, '2022-09-26 12:24:35', NULL);
INSERT INTO `sys_menu` VALUES (40, 3, '分配权限', 'sys:role:assignRole', '', '', '', '2', '', '角色管理', 13, '2022-09-26 12:30:36', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', '系统管理员', '2022-06-08 18:03:10', '2022-08-04 09:20:13');
INSERT INTO `sys_role` VALUES (2, '员工', '员工', '2022-06-08 18:04:04', '2022-08-04 09:20:25');
INSERT INTO `sys_role` VALUES (3, '测试', '', '2022-09-26 13:51:54', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色菜单id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (7, 1, 2);
INSERT INTO `sys_role_menu` VALUES (8, 1, 8);
INSERT INTO `sys_role_menu` VALUES (9, 1, 9);
INSERT INTO `sys_role_menu` VALUES (10, 1, 1);
INSERT INTO `sys_role_menu` VALUES (43, 2, 5);
INSERT INTO `sys_role_menu` VALUES (44, 2, 6);
INSERT INTO `sys_role_menu` VALUES (45, 2, 22);
INSERT INTO `sys_role_menu` VALUES (46, 2, 23);
INSERT INTO `sys_role_menu` VALUES (47, 2, 24);
INSERT INTO `sys_role_menu` VALUES (48, 2, 10);
INSERT INTO `sys_role_menu` VALUES (49, 2, 25);
INSERT INTO `sys_role_menu` VALUES (50, 2, 26);
INSERT INTO `sys_role_menu` VALUES (51, 2, 27);
INSERT INTO `sys_role_menu` VALUES (52, 2, 28);
INSERT INTO `sys_role_menu` VALUES (53, 2, 18);
INSERT INTO `sys_role_menu` VALUES (54, 2, 19);
INSERT INTO `sys_role_menu` VALUES (55, 2, 20);
INSERT INTO `sys_role_menu` VALUES (56, 2, 21);
INSERT INTO `sys_role_menu` VALUES (57, 2, 29);
INSERT INTO `sys_role_menu` VALUES (58, 2, 30);
INSERT INTO `sys_role_menu` VALUES (59, 2, 31);
INSERT INTO `sys_role_menu` VALUES (60, 2, 32);
INSERT INTO `sys_role_menu` VALUES (61, 2, 33);
INSERT INTO `sys_role_menu` VALUES (62, 2, 34);
INSERT INTO `sys_role_menu` VALUES (63, 2, 35);
INSERT INTO `sys_role_menu` VALUES (64, 2, 36);
INSERT INTO `sys_role_menu` VALUES (65, 2, 37);
INSERT INTO `sys_role_menu` VALUES (66, 2, 38);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '登录账户',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '密码',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邮箱',
  `sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '性别',
  `salary` decimal(18, 2) NULL DEFAULT NULL COMMENT '工资',
  `is_admin` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否为超级管理员 1：是 0：否',
  `is_account_non_expired` tinyint(4) NULL DEFAULT NULL COMMENT '帐户是否过期(1 未过期，0已过期)',
  `is_account_non_locked` tinyint(4) NULL DEFAULT NULL COMMENT '帐户是否被锁定(1 未锁定，0已锁定)',
  `is_credentials_non_expired` tinyint(4) NULL DEFAULT NULL COMMENT '密码是否过期(1 未过期，0已过期)',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '帐户是否可用(1 可用，0 删除用户)',
  `nick_name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'zs001', '666666', '18687116223', '4646546465@qq.com', '0', 1000.00, NULL, 1, 1, 1, 0, '张三11', '2022-08-04 11:11:24', '2022-08-04 17:07:56');
INSERT INTO `sys_user` VALUES (2, 'ls001', '666666', '1456466546', '', '0', NULL, NULL, 1, 1, 1, 1, '李四', '2022-08-04 11:16:13', NULL);
INSERT INTO `sys_user` VALUES (3, 'ww001', '123', '1464646465', '', '0', 5000.00, NULL, 1, 1, 1, 1, '王五', '2022-08-04 11:16:58', NULL);
INSERT INTO `sys_user` VALUES (4, 'zm002', '123', '17987646546', '', '1', 6000.00, NULL, 1, 1, 1, 1, '张明', '2022-08-04 12:11:17', NULL);
INSERT INTO `sys_user` VALUES (5, 'admin', '123456', '146546456456', '4646546465@qq.com', '1', NULL, '1', 1, 1, 1, 1, 'admin', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 'test1', '123456', '18687116223', '', '0', NULL, NULL, 1, 1, 1, 1, '旺旺', '2022-09-26 13:49:35', NULL);
INSERT INTO `sys_user` VALUES (7, 'test2', '123', '18687116223', '', '0', NULL, NULL, 1, 1, 1, 1, 'test2', '2022-09-26 14:00:28', NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (2, 2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3, 2);
INSERT INTO `sys_user_role` VALUES (4, 4, 2);
INSERT INTO `sys_user_role` VALUES (13, 1, 2);
INSERT INTO `sys_user_role` VALUES (14, 6, 2);
INSERT INTO `sys_user_role` VALUES (15, 7, 2);

SET FOREIGN_KEY_CHECKS = 1;
