/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-05-20 17:46:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bc_order`
-- ----------------------------
DROP TABLE IF EXISTS `bc_order`;
CREATE TABLE `bc_order` (
  `order_address` varchar(64) NOT NULL COMMENT '订单地址 ',
  `order_type` int(2) NOT NULL COMMENT '订单类型{1:确权,2:邀请,3:购买}',
  `user_address_from` varchar(64) NOT NULL COMMENT '转出账户',
  `user_address_to` varchar(64) NOT NULL COMMENT '转入账户',
  `all_money` varchar(64) NOT NULL COMMENT '交易金额',
  `saas_money` varchar(64) NOT NULL COMMENT '平台金额',
  `real_money` varchar(64) NOT NULL COMMENT '真实金额',
  `pay_state_saas` int(2) NOT NULL COMMENT '支付状态{0:默认,1:清算,2:在途,3:成功,4:失败}',
  `pay_state_user` int(2) NOT NULL COMMENT '支付状态{0:默认,1:清算,2:在途,3:成功,4:失败}',
  `order_address_saas` varchar(128) DEFAULT NULL COMMENT '以太坊账单地址',
  `order_address_user` varchar(128) DEFAULT NULL COMMENT '以太坊账单地址',
  `remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区块链-订单';

-- ----------------------------
-- Records of bc_order
-- ----------------------------

-- ----------------------------
-- Table structure for `bc_user`
-- ----------------------------
DROP TABLE IF EXISTS `bc_user`;
CREATE TABLE `bc_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `bc_type` varchar(64) NOT NULL COMMENT '区块链类型',
  `bc_account` varchar(64) NOT NULL COMMENT '区块链用户主键',
  `bc_balance` varchar(64) DEFAULT '0' COMMENT '我的以太币',
  `bc_token_balance` varchar(64) DEFAULT NULL COMMENT '我的代币',
  `saas_user_id` varchar(64) NOT NULL COMMENT '平台用户主键',
  `saas_user_name` varchar(64) NOT NULL COMMENT '平台账号',
  `saas_user_pass` varchar(64) NOT NULL COMMENT '平台密码',
  `account_token` varchar(64) DEFAULT NULL COMMENT '账户令牌',
  `refresh_token` varchar(64) DEFAULT NULL COMMENT '刷新令牌',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `addTime` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `deleteStatus` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `block_chain_del_flag` (`deleteStatus`),
  KEY `block_chain_user_id` (`saas_user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区块链-用户';

-- ----------------------------
-- Records of bc_user
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_accessory`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_accessory`;
CREATE TABLE `shopping_accessory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `height` int(11) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `size` float NOT NULL,
  `width` int(11) NOT NULL,
  `album_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `config_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BF2D721537B6C51` (`user_id`),
  KEY `FK9BF2D7218603E3C3` (`album_id`),
  KEY `FK9BF2D721707C8F90` (`config_id`),
  KEY `FK351798FBB7C6737F` (`config_id`),
  KEY `FK351798FB1E208F02` (`user_id`),
  KEY `FK351798FB10031732` (`album_id`),
  CONSTRAINT `FK351798FB10031732` FOREIGN KEY (`album_id`) REFERENCES `shopping_album` (`id`),
  CONSTRAINT `FK351798FB1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK351798FBB7C6737F` FOREIGN KEY (`config_id`) REFERENCES `shopping_sysconfig` (`id`),
  CONSTRAINT `FK9BF2D721537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK9BF2D721707C8F90` FOREIGN KEY (`config_id`) REFERENCES `shopping_sysconfig` (`id`),
  CONSTRAINT `FK9BF2D7218603E3C3` FOREIGN KEY (`album_id`) REFERENCES `shopping_album` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=426501 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_accessory
-- ----------------------------
INSERT INTO `shopping_accessory` VALUES ('1', null, '', 'jpg', '300', null, 'good.jpg', 'resources/style/common/images', '30236', '430', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('2', null, '', null, '0', null, 'member.jpg', 'resources/style/common/images', '0', '0', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('3', null, '', null, '0', null, 'store.jpg', 'resources/style/common/images', '0', '0', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('4', '2016-04-02 18:29:19', '', 'jpg', '490', null, '4a8f8680-66ba-4276-8507-3c838a229558.jpg', 'upload/advert', '173737', '1200', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('5', '2013-12-23 21:10:04', '', 'jpg', '133', null, 'a4c98822-aab4-42ba-af94-ab653ffba7ba.jpg', 'upload/advert', '27954', '107', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('6', '2013-12-23 21:10:44', '', 'jpg', '96', null, '0e706092-9910-4522-9613-6331e170933e.jpg', 'upload/advert', '42649', '960', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('7', '2013-12-23 21:11:06', '', 'jpg', '210', null, 'd7425957-e056-413c-bec1-afff1c81a79a.jpg', 'upload/advert', '43086', '210', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('8', '2013-12-23 21:11:20', '', 'jpg', '96', null, '4d5fd7d9-b672-45b2-94cb-1e9f1e5d5d25.jpg', 'upload/advert', '42649', '960', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('9', '2013-12-23 21:14:09', '', 'jpg', '249', null, '492d7eaa-0a72-4f4f-b3e7-2d46d3378d23.jpg', 'upload/advert', '89553', '729', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('10', '2018-01-20 16:48:12', '', 'jpg', '490', null, 'e76dc3a6-b8fa-4395-8906-e13d8ab43198.jpg', 'upload/advert', '106098', '1920', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('11', '2018-01-20 16:48:32', '', 'jpg', '490', null, '404791b4-23bb-497e-9582-582d1f98bd0d.jpg', 'upload/advert', '289843', '1920', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('12', '2018-01-20 16:47:22', '', 'jpg', '490', null, 'c3511da7-6cb7-42c9-ae16-213c20b04d0d.jpg', 'upload/advert', '426400', '1920', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('13', '2018-01-20 16:49:13', '', 'jpg', '490', null, '7233d29a-2ee4-4ecd-ade3-3a64146e344c.jpg', 'upload/advert', '61722', '1920', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('14', '2018-01-20 16:48:52', '', 'jpg', '490', null, 'cc561a28-6272-4775-96aa-4fdf74e843f8.jpg', 'upload/advert', '349213', '1920', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('15', '2013-12-23 21:17:51', '', 'jpg', '280', null, 'f51b6258-fbea-4811-8aaf-581b5f4c7ae7.jpg', 'upload/advert', '129387', '740', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('16', '2013-12-23 21:18:01', '', 'jpg', '249', null, 'a84b012a-ccb0-4dd4-9e1e-e6d9778a9548.jpg', 'upload/advert', '117321', '729', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('17', '2013-12-23 21:18:14', '', 'jpg', '280', null, '743763fe-6762-471b-b875-b7f63e29485a.jpg', 'upload/advert', '212430', '740', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('18', '2013-12-23 21:18:26', '', 'jpg', '249', null, '21069651-a11f-482b-b17c-e124beb663ef.jpg', 'upload/advert', '89553', '729', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('19', '2013-12-23 21:19:01', '', 'jpg', '133', null, '6849abf4-4dc1-4f68-85b8-28cf4023219c.jpg', 'upload/advert', '27898', '107', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('20', '2013-12-23 21:19:16', '', 'jpg', '133', null, '3f77f2b5-2dee-436a-a87b-24c021594015.jpg', 'upload/advert', '30221', '107', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('21', '2013-12-23 21:19:33', '', 'jpg', '133', null, '54da8cb3-eb3d-4738-8cc1-1caae3d91d85.jpg', 'upload/advert', '27310', '107', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('22', '2013-12-23 21:19:51', '', 'jpg', '133', null, 'c75ac72a-4a2b-428c-bed4-5907a183197e.jpg', 'upload/advert', '27059', '107', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('23', '2013-12-23 21:20:49', '', 'jpg', '133', null, 'df179898-3ab8-4292-ad1a-e9a73a1342bf.jpg', 'upload/advert', '29776', '107', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32768', '2013-12-24 09:41:36', '', 'jpg', '16', null, '150ea9d4-fea4-4115-b640-ca6f37eed8c3.jpg', 'upload/spec', '692', '16', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32769', '2013-12-24 09:43:19', '', 'jpg', '16', null, '80ab0b28-1347-496b-a477-2b971b1182a0.jpg', 'upload/spec', '692', '16', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32770', '2013-12-24 09:43:19', '', 'jpg', '16', null, '0f6ca520-33d5-4653-b863-5db6d57189e0.jpg', 'upload/spec', '695', '16', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32771', '2013-12-24 09:43:19', '', 'jpg', '16', null, '972ffcce-3737-45e2-be64-3ab811c20b6f.jpg', 'upload/spec', '695', '16', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32772', '2013-12-24 09:43:19', '', 'jpg', '16', null, '515cd81d-6bd6-414e-ac01-54645a994ca5.jpg', 'upload/spec', '695', '16', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32773', '2013-12-24 09:43:19', '', 'jpg', '16', null, '05b5d41c-2808-4cfe-9153-32117d2f4ff7.jpg', 'upload/spec', '695', '16', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32774', '2013-12-24 09:43:19', '', 'jpg', '16', null, 'f582b11e-0422-4852-85d2-6a5b1247a971.jpg', 'upload/spec', '815', '16', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32775', '2013-12-24 09:50:45', '', 'jpg', '45', null, 'd3bb39fa-bc75-4ab4-b22e-a9bd1f1b5699.jpg', 'upload/brand', '2544', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32776', '2013-12-24 09:51:42', '', 'jpg', '45', null, '1d661523-9320-4e5d-9b92-50eaafa4bd7e.jpg', 'upload/brand', '3358', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32777', '2013-12-24 09:51:57', '', 'jpg', '45', null, 'efde8ef1-e6e8-437c-b3ad-c49de684d3bc.jpg', 'upload/brand', '1817', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32778', '2013-12-24 09:59:10', '', 'jpg', '45', null, '350d05d9-0f6a-4ad7-bdb0-edfd50ba58ca.jpg', 'upload/brand', '4298', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32779', '2013-12-24 10:02:21', '', 'jpg', '45', null, '29e5c0ee-9abe-47ae-8a1e-fbafff421471.jpg', 'upload/brand', '2821', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32780', '2013-12-24 10:02:45', '', 'jpg', '45', null, '08733b5a-124a-4691-94ca-f4ff51c95375.jpg', 'upload/brand', '1736', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32781', '2013-12-24 10:03:16', '', 'jpg', '45', null, 'a7da11fb-7d22-42e3-978a-69b833803219.jpg', 'upload/brand', '636', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32782', '2013-12-24 10:04:10', '', 'jpg', '45', null, '257b0bbc-d07c-4d49-bcf0-5393a34d1299.jpg', 'upload/brand', '2930', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32783', '2013-12-24 10:07:10', '', 'jpg', '45', null, '0ffed031-864a-4e89-b7dc-05853ddfd599.jpg', 'upload/brand', '2812', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32784', '2013-12-24 10:07:30', '', 'jpg', '45', null, 'adb5dacd-def9-4b4e-a670-63265ee9129e.jpg', 'upload/brand', '2000', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32785', '2013-12-24 10:09:05', '', 'jpg', '45', null, '057ae5aa-4b79-4c99-9974-fc80ac1e4889.jpg', 'upload/brand', '929', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32786', '2013-12-24 10:09:36', '', 'jpg', '45', null, '60098b9f-b7d4-406d-95ee-8904d6b95ff5.jpg', 'upload/brand', '2649', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32787', '2013-12-24 10:10:22', '', 'jpg', '45', null, 'b805bc9e-f799-4499-a934-a91ec15efd25.jpg', 'upload/brand', '3158', '90', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('32788', '2013-12-24 10:15:17', '', 'jpg', '33', null, '2df181a9-df2f-429d-96f2-d3f9e81dfd5d.jpg', 'upload/brand', '15745', '93', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('262144', '2014-02-25 14:56:45', '', 'jpg', '156', null, 'fe5b32ed-8ff0-43c1-8535-943fec1a3428.jpg', 'upload/advert', '56095', '156', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('262145', '2014-02-25 14:57:46', '', 'jpg', '156', null, '6c8f5b22-a745-4144-bfe0-13eb3e54a5cb.jpg', 'upload/advert', '56095', '156', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('294912', '2014-02-25 15:04:41', '', 'jpg', '156', null, '15824fef-0bb2-49ec-9dfe-ecfde59add7f.jpg', 'upload/advert', '39206', '156', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('294913', '2014-02-25 15:05:10', '', 'jpg', '156', null, 'bad6731e-e167-4e6f-a5f4-ea1876b37572.jpg', 'upload/advert', '39206', '156', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('294914', '2014-02-25 15:05:42', '', 'jpg', '156', null, 'be8dc85b-72fc-4257-a09e-fb12f90372cb.jpg', 'upload/advert', '58981', '156', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('327682', '2014-02-25 16:09:59', '', 'jpg', '205', null, '7d2b1285-ab87-490c-85b1-98d68f4234f9.jpg', 'upload/advert', '71907', '205', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('360448', '2014-02-25 18:01:00', '', 'jpg', '205', null, 'c7c252b8-3cd1-40f3-8b18-a3e047866bbd.jpg', 'upload/advert', '71907', '205', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('360449', '2014-02-25 18:05:14', '', 'jpg', '205', null, 'ce5eec37-56ce-4c98-b2e6-1098642edc08.jpg', 'upload/advert', '71907', '205', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('360450', '2014-02-25 18:09:54', '', 'jpg', '205', null, '07fcbca9-5b13-4f33-90a0-05b9b9a5e65e.jpg', 'upload/advert', '71907', '205', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('393216', '2014-02-26 11:51:24', '', 'jpg', '600', null, '6cce21dd-3dc3-42b9-a0e3-73f17de367af.jpg', 'upload/group', '188631', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425984', '2014-02-26 17:16:25', '', 'jpg', '600', null, '8cf57386-fe3e-4c53-bc57-d25872cf3a9b.jpg', 'upload/group', '146332', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425985', '2014-02-26 17:17:20', '', 'jpg', '600', null, 'f2992c37-fd16-4c66-947f-e4c5ce72153e.jpg', 'upload/group', '173672', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425986', '2014-02-26 17:18:13', '', 'jpg', '600', null, '176ff210-d85b-4764-98a9-cc20550aa543.jpg', 'upload/group', '191080', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425987', '2014-02-26 17:19:14', '', 'jpg', '600', null, '1e52fa44-cb27-415c-b17f-f8dc9ed32ed8.jpg', 'upload/group', '149109', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425992', '2015-02-28 09:43:00', '', 'jpg', '600', null, 'f552f412-8dda-44da-a745-c4b0bfb470df.jpg', 'upload/integral_goods', '118174', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425993', '2014-09-23 16:42:45', '', 'jpg', '0', null, 'fe3c2f12-9251-4827-81c5-0df90a380e3f.jpg', 'upload/coupon', '0', '0', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425994', '2014-09-23 19:54:23', '', 'jpg', '0', null, '25d56c67-b9a1-4436-a8dd-fa123e58e4ed.jpg', 'upload/coupon', '0', '0', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('425995', '2014-09-24 10:39:08', '', 'jpg', '0', null, '35f8c1d5-f38b-4b6d-9897-58a5f665543e.jpg', 'upload/coupon', '0', '0', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426000', '2014-09-25 13:56:09', '', 'jpg', '618', null, 'd10b3307-8687-4898-a152-0677799a8e58.jpg', 'upload/store/32769/2014/09/25', '0', '487', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426001', '2014-09-25 13:56:11', '', 'jpg', '603', null, '647e3b79-4817-49b1-b831-48d48791fadd.jpg', 'upload/store/32769/2014/09/25', '0', '551', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426002', '2014-09-25 13:56:12', '', 'jpg', '593', null, '66049433-8a3c-4ee6-9a38-7a0f4a5159ce.jpg', 'upload/store/32769/2014/09/25', '0', '462', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426003', '2014-09-25 13:56:13', '', 'jpg', '597', null, 'fe9f1746-e6ac-4d9e-9dad-ca51da63c0f5.jpg', 'upload/store/32769/2014/09/25', '0', '454', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426004', '2014-09-25 14:14:52', '', 'jpg', '610', null, 'b66c68a1-ca78-4031-bf08-a18789ebb136.jpg', 'upload/store/32769/2014/09/25', '0', '445', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426005', '2014-09-25 15:30:27', '', 'jpg', '600', null, 'ee665e1f-d179-47a3-99a5-f439ce7bbf2a.jpg', 'upload/group', '173426', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426006', '2014-09-25 19:22:43', '', 'jpg', '102', null, 'd41c1e29-a3e3-4a3e-9b94-4f845ee1c4d8.jpg', 'upload/advert', '141386', '1002', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426007', '2014-10-09 14:58:18', '', 'jpg', '264', null, 'f46d14db-e21c-4297-8262-4a4652ec53dd.jpg', 'upload/advert', '88846', '580', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426008', '2014-10-09 14:58:45', '', 'jpg', '264', null, '0550f692-3886-4b4b-a98e-a51281d4acd1.jpg', 'upload/advert', '80097', '580', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426009', '2014-10-09 14:59:12', '', 'jpg', '264', null, 'cb3cc3d1-ae3d-4772-8cb1-19e792c7bcc7.jpg', 'upload/advert', '158374', '580', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426010', '2014-10-09 15:17:15', '', 'jpg', '130', null, 'f8203edf-e6f7-4947-8fa2-a30f6775165e.jpg', 'upload/advert', '48590', '180', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426014', '2014-10-10 10:07:55', '', 'jpg', '402', null, '71f52513-5452-4457-a4d6-69b332c1a8af.jpg', 'upload/spare_goods', '77204', '636', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426016', '2014-10-10 10:07:56', '', 'jpg', '480', null, 'd5a668c6-b7d1-43a3-a416-08a1a03f9152.jpg', 'upload/spare_goods', '58315', '667', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426017', '2014-10-10 10:08:26', '', 'jpg', '381', null, 'e8f02b7d-4cea-4b66-8409-ce067d2a7895.jpg', 'upload/spare_goods', '63998', '634', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426018', '2014-10-10 10:43:32', '', 'jpg', '719', null, '59bddbe4-3ac0-47aa-8fd2-ffbbae912cc9.jpg', 'upload/spare_goods', '114288', '598', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426019', '2014-10-10 10:57:53', '', 'jpg', '361', null, '7b4760d8-45e4-4802-abdb-48a8a04cab1a.jpg', 'upload/spare_goods', '58293', '640', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426020', '2014-10-10 11:01:03', '', 'jpg', '444', null, 'c6bc031c-7198-4df2-92ae-92f9874741f3.jpg', 'upload/spare_goods', '60457', '614', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426021', '2014-10-10 11:01:03', '', 'jpg', '445', null, '786387a7-789d-4f6a-a14a-3afa25f89f98.jpg', 'upload/spare_goods', '65602', '611', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426022', '2014-10-14 11:11:22', '', 'jpg', '250', null, '1e7ae7d9-f1f2-4bd3-b69b-8bc1ee0e410f.jpg', 'upload/advert', '60970', '200', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426023', '2014-10-14 12:17:37', '', 'jpg', '728', null, '485d97a7-a80f-492b-a727-44da8d6f5812.jpg', 'upload/spare_goods', '130954', '543', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426024', '2014-10-14 12:17:39', '', 'jpg', '728', null, 'dee0c786-bb8d-43c3-bf90-39da93977d52.jpg', 'upload/spare_goods', '124818', '543', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426025', '2014-10-14 12:17:39', '', 'jpg', '728', null, 'bb01aeea-39c2-4360-9f00-b52c53e3cf5f.jpg', 'upload/spare_goods', '122312', '543', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426026', '2014-10-14 12:17:40', '', 'jpg', '728', null, 'c459ad87-e918-477b-bcc6-ea4ab874138d.jpg', 'upload/spare_goods', '125874', '543', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426027', '2014-10-14 12:30:24', '', 'jpg', '250', null, 'bf28c893-474a-4255-8bcd-1f785a61dbc2.jpg', 'upload/advert', '58683', '200', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426028', '2014-10-14 16:40:40', '', 'jpg', '546', null, '505fcc8f-90eb-4043-8056-31c07b77a9f6.jpg', 'upload/spare_goods', '29257', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426029', '2014-10-14 16:40:41', '', 'jpg', '546', null, '42baa1fa-5b85-4e27-9e73-1d602621c17a.jpg', 'upload/spare_goods', '41891', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426030', '2014-10-14 16:40:42', '', 'jpg', '546', null, '0f29a9bf-dabe-4041-a5e2-3719297edbb6.jpg', 'upload/spare_goods', '31641', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426031', '2014-10-14 16:40:42', '', 'jpg', '546', null, 'df42449c-9225-4c3d-adc4-4d2595a65de2.jpg', 'upload/spare_goods', '26663', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426032', '2014-10-14 16:43:08', '', 'jpg', '368', null, 'a550db2b-9f31-45d2-949a-94259543433e.jpg', 'upload/spare_goods', '102133', '653', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426033', '2014-10-14 16:43:08', '', 'jpg', '368', null, 'e209f065-398a-4871-b592-7bfca9051c32.jpg', 'upload/spare_goods', '97678', '653', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426034', '2014-10-14 16:43:09', '', 'jpg', '368', null, '9a8d3897-1170-4a88-8c57-f4af6b39f116.jpg', 'upload/spare_goods', '101752', '653', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426035', '2014-10-14 16:43:09', '', 'jpg', '368', null, 'bdafdb4f-74ad-479c-ab5c-6445c5fe7c51.jpg', 'upload/spare_goods', '60201', '653', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426036', '2014-10-14 16:53:52', '', 'jpg', '546', null, '36bc6e9d-7c50-4da0-96f5-ada77316ea99.jpg', 'upload/spare_goods', '54502', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426037', '2014-10-14 16:55:28', '', 'jpg', '430', null, '0f400b92-50e1-4794-9d5a-e0f0ff5de6a0.jpg', 'upload/spare_goods', '496555', '651', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426038', '2014-10-14 17:00:19', '', 'jpg', '728', null, 'd22bd545-2e61-4cfd-a2fb-4d7f89e2f21a.jpg', 'upload/spare_goods', '141240', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426039', '2014-10-14 17:02:47', '', 'jpg', '321', null, '325d1dc7-40e0-4ed4-8236-66bc12a7525c.jpg', 'upload/spare_goods', '63887', '263', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426040', '2014-10-14 17:11:43', '', 'jpg', '310', null, '30c5cd5c-56c6-4227-b15b-ce6a0f98b227.jpg', 'upload/spare_goods', '18393', '310', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426041', '2014-10-14 17:13:11', '', 'jpg', '546', null, 'bb31f1fe-5bea-42de-9a6e-729f40fdcc99.jpg', 'upload/spare_goods', '57731', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426042', '2014-10-14 17:13:11', '', 'jpg', '546', null, '7e80ddcf-5670-4bf8-a34c-8307c74b9df7.jpg', 'upload/spare_goods', '44255', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426043', '2014-10-14 17:16:07', '', 'jpg', '728', null, 'f4cd958b-37b3-43ef-bbb2-351cf95c6301.jpg', 'upload/spare_goods', '63889', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426044', '2014-10-14 17:16:07', '', 'jpg', '728', null, '2d3e54c6-048b-4b04-b9d1-00d7bc726251.jpg', 'upload/spare_goods', '60002', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426045', '2014-10-14 17:16:08', '', 'jpg', '728', null, '6c3a662c-c098-40df-86c8-8f6ff660b43e.jpg', 'upload/spare_goods', '66946', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426046', '2014-10-14 17:20:08', '', 'jpg', '728', null, '37c4c573-6cc3-456e-a1a6-0c8e9e5d869f.jpg', 'upload/spare_goods', '114335', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426047', '2014-10-14 17:20:08', '', 'jpg', '728', null, 'c2bdbe41-d969-4fd0-854a-1805144830d1.jpg', 'upload/spare_goods', '114335', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426048', '2014-10-14 17:20:08', '', 'jpg', '728', null, 'd369c6a0-1cfc-45e6-a2b3-0d92848fd4e6.jpg', 'upload/spare_goods', '104489', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426049', '2014-10-14 17:23:10', '', 'jpg', '298', null, 'f2d770a3-d5d6-41e8-a6da-d31a37860ec5.jpg', 'upload/spare_goods', '12584', '208', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426050', '2014-10-14 17:25:05', '', 'jpg', '728', null, 'e1e65b7e-9910-4ea8-a0db-f9025165602a.jpg', 'upload/spare_goods', '65524', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426051', '2014-10-14 17:25:05', '', 'jpg', '546', null, '7a9639f7-96ce-46e6-b3a1-d78024388863.jpg', 'upload/spare_goods', '50043', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426052', '2014-10-14 17:25:06', '', 'jpg', '728', null, '710804f3-6941-48c9-bab2-520aeeb5a6a4.jpg', 'upload/spare_goods', '43502', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426053', '2014-10-14 17:26:44', '', 'jpg', '728', null, '8667e34e-d9a6-4b8b-adc7-b32799cd11db.jpg', 'upload/spare_goods', '103073', '701', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426054', '2014-10-14 17:28:22', '', 'jpg', '300', null, '708e4f57-af88-4070-a054-143f7f09c217.jpg', 'upload/spare_goods', '75915', '265', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426055', '2014-10-14 17:30:23', '', 'jpg', '728', null, '960dcbd0-8744-4665-8eee-21fe84a5e30e.jpg', 'upload/spare_goods', '41800', '543', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426056', '2014-10-14 17:30:23', '', 'jpg', '728', null, 'b3f2ec3e-b638-4a5b-ae1c-d6c16d95303b.jpg', 'upload/spare_goods', '62223', '543', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426057', '2014-10-14 17:30:24', '', 'jpg', '543', null, 'a1a3860c-e3cf-4050-9ea2-91c7eabbe5bf.jpg', 'upload/spare_goods', '51239', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426058', '2014-10-14 17:32:15', '', 'jpg', '546', null, 'b6df984d-6562-4a62-9a98-5c2e8324e082.jpg', 'upload/spare_goods', '46420', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426059', '2014-10-14 17:32:15', '', 'jpg', '728', null, '2bac6584-aeb9-4d6d-a1e8-bc191146a853.jpg', 'upload/spare_goods', '54142', '546', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426060', '2014-10-14 17:32:15', '', 'jpg', '546', null, 'e0812b5e-4f01-4d98-b3f9-ff08c64f8927.jpg', 'upload/spare_goods', '38376', '728', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426061', '2014-11-14 11:32:09', '', 'jpg', '430', null, 'b871f7a5-9e02-4d60-a40d-07465d31b3a2.jpg', 'upload/weixin_qr', '30236', '430', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426062', '2015-01-18 16:23:38', '', 'jpg', '0', null, '239a7304-838e-4887-84c1-b893343eb121.jpg', 'upload', '13400', '159', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426063', '2015-01-18 16:41:49', '', 'jpg', '430', null, 'df580a0d-8cea-43e1-9162-2464defd4774.jpg', 'upload/system', '30236', '430', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426064', '2015-02-08 18:08:37', '', 'jpg', '266', null, '2ba5fdb2-08d7-4a49-ac4f-b95864543887.jpg', 'upload/advert', '71959', '200', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426065', '2015-02-08 18:12:28', '', 'jpg', '266', null, '669bf986-26dd-4626-bb5c-b323aebb109b.jpg', 'upload/advert', '51009', '200', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426066', '2016-04-06 12:37:23', '', 'jpg', '135', null, '24191b8d-68a0-4f67-b496-a9109c426965.jpg', 'upload/advert', '34933', '288', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426067', '2015-02-17 11:44:04', '', 'jpg', '131', null, 'f64c43d0-fbd1-4daf-81e4-7841310500b4.jpg', 'upload/advert', '14108', '259', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426068', '2015-02-17 11:44:32', '', 'jpg', '131', null, '6eb5e3a5-8137-42ae-af5e-0e01f89d8c14.jpg', 'upload/advert', '13976', '259', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426069', '2015-02-17 11:50:52', '', 'jpg', '131', null, '83e67ae1-096d-4b6e-a9af-442efd31f045.jpg', 'upload/advert', '12048', '259', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426070', '2015-02-17 11:51:15', '', 'jpg', '131', null, 'de7f25b9-f562-454c-a3e4-9bd580f072f7.jpg', 'upload/advert', '11389', '259', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426071', '2015-02-17 11:51:55', '', 'jpg', '131', null, '4a49836f-6d32-475e-9c0b-4159c9d1f198.jpg', 'upload/advert', '11069', '259', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426072', '2015-02-17 11:52:13', '', 'jpg', '131', null, 'a58cad3f-64f6-40f3-9a15-d7d13472b818.jpg', 'upload/advert', '10753', '259', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426073', '2015-02-26 09:29:57', '', 'jpg', '342', null, '08c96139-9757-4b20-adc6-819e3e406868.jpg', 'upload/advert', '14325', '200', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426074', '2015-02-26 10:02:58', '', 'jpg', '130', null, 'f068b18e-ff4b-4120-ad5d-621f7d77a7bb.jpg', 'upload/advert', '27219', '180', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426075', '2015-02-26 10:07:50', '', 'jpg', '130', null, '1c8131d2-6d94-423b-95e1-bd7fe95660ce.jpg', 'upload/advert', '39121', '180', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426076', '2015-02-26 10:12:38', '', 'jpg', '300', null, '0b6dba7d-eb49-4723-89cf-bc8359176712.jpg', 'upload/advert', '109553', '220', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426077', '2015-02-28 09:53:52', '', 'jpg', '248', null, '022a57de-dbc6-49eb-a972-23cf529d61b8.jpg', 'upload/advert', '52487', '197', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426078', '2015-02-28 10:01:27', '', 'jpg', '280', null, 'febb6d44-5206-444f-9346-14185618affe.jpg', 'upload/advert', '66797', '262', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426079', '2015-02-28 10:04:41', '', 'jpg', '600', null, 'b31e351c-59f2-4e04-ab0d-aed404c88755.jpg', 'upload/integral_goods', '96789', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426080', '2015-02-28 10:05:34', '', 'jpg', '600', null, '289452b2-f4e5-46e4-94c7-9f36605cfdd3.jpg', 'upload/integral_goods', '109941', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426081', '2015-02-28 10:06:59', '', 'jpg', '600', null, 'c680900c-bfab-435e-8c5e-e8a5cce84549.jpg', 'upload/integral_goods', '94147', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426082', '2015-02-28 10:07:24', '', 'jpg', '600', null, 'f5b85570-c544-44ac-8159-7e1851de7311.jpg', 'upload/integral_goods', '160017', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426083', '2015-02-28 10:08:02', '', 'jpg', '600', null, '7f1e3be9-3ed6-428e-9d34-8aec6cfe89f1.jpg', 'upload/integral_goods', '65755', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426084', '2015-02-28 10:08:43', '', 'jpg', '662', null, '24e8d84a-66b5-4e0f-b6ef-93fdb983fd9e.jpg', 'upload/integral_goods', '99463', '662', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426085', '2015-02-28 10:12:57', '', 'jpg', '600', null, '7ed183bd-1d1a-4adc-83b8-6478418529ef.jpg', 'upload/integral_goods', '160889', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426086', '2015-02-28 10:15:37', '', 'jpg', '600', null, 'ff34530c-7f25-4658-aa51-93f1f349f62f.jpg', 'upload/integral_goods', '188802', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426087', '2015-02-28 10:16:12', '', 'jpg', '600', null, 'e9e9fed2-0e4c-488b-87ba-cb35dedda8c7.jpg', 'upload/integral_goods', '256520', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426088', '2015-02-28 10:21:44', '', 'jpg', '600', null, 'ac1a63f4-1668-467c-8c8c-f6b93276446d.jpg', 'upload/integral_goods', '140456', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426089', '2015-02-28 10:22:25', '', 'jpg', '600', null, '63c40d0b-8ad4-4768-b844-c99e07727768.jpg', 'upload/integral_goods', '126407', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426090', '2015-02-28 10:28:36', '', 'jpg', '713', null, '62a80799-9edb-49cc-9a15-5778e8d6280c.jpg', 'upload/integral_goods', '102808', '713', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426091', '2015-02-28 10:29:16', '', 'jpg', '600', null, 'd2fdf240-ce7a-4c09-b79a-b61d81c8e960.jpg', 'upload/integral_goods', '153089', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426092', '2015-02-28 10:30:01', '', 'jpg', '600', null, 'f8cf2b21-06f9-433b-affe-e8541c77d519.jpg', 'upload/integral_goods', '193247', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426093', '2015-02-28 10:31:06', '', 'jpg', '600', null, '0f775908-597e-4635-aaf4-d454bf188a68.jpg', 'upload/integral_goods', '160378', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426094', '2015-02-28 10:31:45', '', 'jpg', '740', null, '606a0abf-e59f-4e96-87e9-6e79557d822b.jpg', 'upload/integral_goods', '206232', '740', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426095', '2015-02-28 10:32:20', '', 'jpg', '600', null, '5baf44ba-b967-44fa-959d-eff01242058d.jpg', 'upload/integral_goods', '139024', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426096', '2015-02-28 10:32:43', '', 'jpg', '600', null, '69712c21-9ca3-43b9-87d6-09747eab65ea.jpg', 'upload/integral_goods', '138583', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426097', '2015-02-28 10:35:40', '', 'jpg', '600', null, '059cc0ce-3172-425d-9d84-991748c00188.jpg', 'upload/integral_goods', '190037', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426098', '2015-02-28 10:36:40', '', 'jpg', '600', null, '48f47b4c-f438-42d8-be17-3aed211d6d8b.jpg', 'upload/integral_goods', '262214', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426099', '2015-02-28 10:45:23', '', 'jpg', '600', null, '09d55b23-d66a-4258-bb00-d6ae29e0599f.jpg', 'upload/group', '280821', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426100', '2015-02-28 10:46:41', '', 'jpg', '600', null, 'c6d4e558-2985-4af7-9880-2eae4060a0d6.jpg', 'upload/group', '212620', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426101', '2015-02-28 10:48:00', '', 'jpg', '600', null, 'f8a9b5a3-21c9-4a45-bde4-37fcff03178e.jpg', 'upload/group', '165920', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426102', '2015-02-28 10:58:03', '', 'jpg', '600', null, 'ad05f0d8-fa25-45c2-b9a8-0d84945d12d3.jpg', 'upload/group', '153955', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426103', '2015-02-28 10:59:22', '', 'jpg', '600', null, '214c2884-e05c-4063-aa0e-bb2b8d49706e.jpg', 'upload/group', '175490', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426104', '2015-02-28 11:00:22', '', 'jpg', '600', null, 'a3d9a16a-306d-4db3-aa8b-5dc188d76ff6.jpg', 'upload/group', '179306', '600', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426105', '2015-02-28 11:01:57', '', 'jpg', '730', null, '6e63d8d6-1330-4615-bbe8-907727752ff2.jpg', 'upload/group', '267944', '730', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426106', '2015-02-28 16:13:05', '', '.jpg', '132', null, '32778_big.jpg', 'upload/avatar', '0', '132', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426112', '2016-03-09 14:58:39', '', 'jpg', '401', null, '5e861c91-95fa-434a-84bd-addb3ae2fa87.jpg', 'upload/store/1/2016/03/09', '0', '396', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426113', '2016-03-09 14:58:55', '', 'jpg', '284', null, '357c406d-7cc5-42ab-80ea-a54c9d936f06.jpg', 'upload/store/1/2016/03/09', '0', '402', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426114', '2016-03-09 14:59:19', '', 'jpg', '387', null, '083f4b11-803a-4640-8eb5-0d00e1fbc574.jpg', 'upload/store/1/2016/03/09', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426115', '2016-03-09 14:59:32', '', 'jpg', '284', null, 'da9d58ec-a569-435b-b5ea-381568410d70.jpg', 'upload/store/1/2016/03/09', '0', '402', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426116', '2016-03-09 15:00:19', '', 'jpg', '310', null, '1ce520f1-993e-43fb-8559-18c4b66109b8.jpg', 'upload/store/1/2016/03/09', '0', '307', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426118', '2016-03-09 15:25:22', '', 'jpg', '300', null, 'b5e2c24c-a437-4347-8c43-31d5fb2bfbba.jpg', 'upload/store/1/2016/03/09', '0', '300', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426119', '2016-03-09 15:26:35', '', 'jpg', '800', null, 'ee1b5c5b-c5b2-4df2-b643-4f25d4917211.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426120', '2016-03-09 15:27:24', '', 'jpg', '169', null, '38ad6fee-ac6c-4907-816c-8604affe107d.jpg', 'upload/store/1/2016/03/09', '0', '310', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426121', '2016-03-09 15:27:51', '', 'png', '220', null, '18c93855-1401-4dea-b092-476efbd32945.png', 'upload/store/1/2016/03/09', '0', '308', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426122', '2016-03-09 15:29:46', '', 'jpg', '750', null, '281cf76f-6ff9-4eb8-b7c1-351c64f30b32.jpg', 'upload/store/1/2016/03/09', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426123', '2016-03-09 15:33:54', '', 'jpg', '240', null, '246d5f8a-2ce2-4064-b836-2bd84823531e.jpg', 'upload/store/1/2016/03/09', '0', '320', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426124', '2016-03-09 15:47:10', '', 'jpg', '450', null, '876fc8f5-c80e-4de7-935b-6e14e1db9114.jpg', 'upload/store/1/2016/03/09', '0', '450', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426125', '2016-03-09 15:48:26', '', 'jpg', '450', null, '86692949-636d-4245-86d8-56d2aa08914c.jpg', 'upload/store/1/2016/03/09', '0', '450', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426127', '2016-03-09 15:49:55', '', 'jpg', '300', null, 'fb087c71-9959-4d52-9a75-59d8d06814c0.jpg', 'upload/store/1/2016/03/09', '0', '300', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426128', '2016-03-09 15:51:50', '', 'jpg', '360', null, '31801436-2cfd-4a81-b25c-2c65628629e6.jpg', 'upload/store/1/2016/03/09', '0', '360', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426129', '2016-03-09 15:52:42', '', 'jpg', '351', null, '25bd7dd4-f9dc-459c-8626-a942af9e238a.jpg', 'upload/store/1/2016/03/09', '0', '349', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426130', '2016-03-09 15:53:24', '', 'jpg', '700', null, '7dbcaf77-f60f-4e10-8f65-3b628559f7db.jpg', 'upload/store/1/2016/03/09', '0', '700', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426131', '2016-03-09 15:55:48', '', 'jpg', '430', null, 'e361d814-0d95-4932-9f22-5e329bea921f.jpg', 'upload/store/1/2016/03/09', '0', '430', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426132', '2016-03-09 15:56:19', '', 'jpg', '430', null, 'c5e7f83e-a023-4309-b7b9-3eb0ef755510.jpg', 'upload/store/1/2016/03/09', '0', '430', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426133', '2016-03-09 15:57:17', '', 'jpg', '487', null, '2186310b-e0aa-4e09-9f37-c27d9b5358ea.jpg', 'upload/store/1/2016/03/09', '0', '727', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426135', '2016-03-09 15:58:25', '', 'jpg', '430', null, 'cab7cc21-dc34-4a7a-b87e-7afd0b295081.jpg', 'upload/store/1/2016/03/09', '0', '430', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426136', '2016-03-09 15:58:55', '', 'jpg', '342', null, 'd53b9b6a-f29f-401e-bc1d-c443ded603de.jpg', 'upload/store/1/2016/03/09', '0', '430', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426137', '2016-03-09 15:59:27', '', 'jpg', '600', null, '5dbdcff7-c525-4a03-8117-67e27ae97e72.jpg', 'upload/store/1/2016/03/09', '0', '600', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426138', '2016-03-09 16:00:10', '', 'jpg', '600', null, '72d7a807-beb0-439b-86e7-584bedc8f257.jpg', 'upload/store/1/2016/03/09', '0', '600', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426139', '2016-03-09 16:09:00', '', 'jpg', '800', null, '46bf6e9c-6058-46df-8f67-0e497ccecf58.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426140', '2016-03-09 17:39:07', '', 'jpg', '525', null, '30d1b02a-d808-4d5c-b608-a95f20249f30.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426141', '2016-03-09 17:44:49', '', 'jpg', '800', null, '2a5947cd-ea8c-4417-bc3d-df0e0c74e75d.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426142', '2016-03-09 17:45:21', '', 'png', '525', null, 'f566afdc-213d-4bcf-be46-078c5b3a339e.png', 'upload/store/1/2016/03/09', '0', '705', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426143', '2016-03-09 17:45:58', '', 'jpg', '400', null, 'c3dc55f6-05a9-4555-80c0-1f9aeb014675.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426144', '2016-03-09 17:46:34', '', 'jpg', '429', null, '25638022-b3b2-4677-9497-36683f0bbb81.jpg', 'upload/store/1/2016/03/09', '0', '682', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426145', '2016-03-09 17:47:12', '', 'jpg', '339', null, '174174e6-1c92-410d-9be6-0e2e196360a0.jpg', 'upload/store/1/2016/03/09', '0', '440', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426146', '2016-03-09 17:47:53', '', 'jpg', '575', null, '45275356-3f0c-416c-846e-dc83cc87893d.jpg', 'upload/store/1/2016/03/09', '0', '781', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426147', '2016-03-09 17:48:49', '', 'jpg', '240', null, '1e17c526-b4ca-4378-86ce-03802f727181.jpg', 'upload/store/1/2016/03/09', '0', '300', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426148', '2016-03-09 17:50:10', '', 'jpg', '310', null, '317442e5-625a-45e9-abd2-20d2eaea5b7d.jpg', 'upload/store/1/2016/03/09', '0', '310', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426149', '2016-03-09 17:50:51', '', 'jpg', '460', null, '017d897e-cc7f-4b47-a702-f9063ed26f3f.jpg', 'upload/store/1/2016/03/09', '0', '460', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426150', '2016-03-09 17:54:59', '', 'jpg', '375', null, 'c2f17315-6ebf-474a-9545-2dec3a8db7e3.jpg', 'upload/store/1/2016/03/09', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426151', '2016-03-09 17:55:45', '', 'jpg', '600', null, 'ec1f5312-8184-4d17-b618-0d78033b85aa.jpg', 'upload/store/1/2016/03/09', '0', '600', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426152', '2016-03-09 17:56:09', '', 'jpg', '300', null, '4d19bca7-c471-4343-ba89-8a346356a9cf.jpg', 'upload/store/1/2016/03/09', '0', '310', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426155', '2016-03-09 18:12:13', '', 'jpg', '245', null, '03fae35d-0455-4053-abcf-7c3abb5e749e.jpg', 'upload/store/1/2016/03/09', '0', '421', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426156', '2016-03-09 18:12:51', '', 'jpg', '295', null, 'e4a62740-3342-4439-bcbc-16d845b140b4.jpg', 'upload/store/1/2016/03/09', '0', '300', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426159', '2016-03-09 18:15:57', '', 'jpg', '800', null, '768eb6aa-57a7-415a-8a62-d497598154af.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426162', '2016-03-09 18:22:38', '', 'jpg', '508', null, '12ba2bc5-3308-4c06-a0a8-932b4d0004a0.jpg', 'upload/store/1/2016/03/09', '0', '500', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426164', '2016-03-09 18:23:29', '', 'jpg', '800', null, '4baebb60-3c3e-4134-86a3-0ac5230f2e7f.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426166', '2016-03-09 18:24:34', '', 'jpg', '600', null, '57894c4f-0d46-4946-a628-7ebfee4b21af.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426167', '2016-03-09 18:27:18', '', 'jpg', '372', null, 'a2f2cc33-c43b-442e-bffd-51bf1ad1e266.jpg', 'upload/store/1/2016/03/09', '0', '390', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426168', '2016-03-09 18:28:17', '', 'jpg', '550', null, 'bd17818c-3fd5-44ca-b608-ef1133b86f5c.jpg', 'upload/store/1/2016/03/09', '0', '550', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426169', '2016-03-09 18:29:58', '', 'jpg', '383', null, '4c40573c-8e3a-41bc-b8b9-e15fa7a989e0.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426170', '2016-03-09 18:31:30', '', 'jpg', '421', null, 'e749591e-0538-4622-a1f8-804b703c7cf0.jpg', 'upload/store/1/2016/03/09', '0', '392', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426171', '2016-03-09 18:31:55', '', 'jpg', '800', null, '2ce99e66-968c-442f-b5f9-b814805a6ba4.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426172', '2016-03-09 18:32:13', '', 'jpg', '275', null, 'bf859a15-af99-48b7-8cf8-7ef44e91cf85.jpg', 'upload/store/1/2016/03/09', '0', '425', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426173', '2016-03-09 18:33:02', '', 'jpg', '800', null, '15cee948-17d8-4054-93a7-29eb619f0cb1.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426174', '2016-03-09 18:35:53', '', 'jpg', '393', null, '9c01a528-dc15-4ba0-8c81-6b3f590a9f05.jpg', 'upload/store/1/2016/03/09', '0', '410', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426175', '2016-03-09 18:36:13', '', 'jpg', '305', null, 'bb1aa166-a15f-4ecc-9414-5f0d1507417d.jpg', 'upload/store/1/2016/03/09', '0', '300', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426176', '2016-03-09 18:39:06', '', 'jpg', '415', null, '021a0e1c-9f1d-41b8-b03b-91d1533c7607.jpg', 'upload/store/1/2016/03/09', '0', '388', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426178', '2016-03-09 18:39:59', '', 'jpg', '400', null, '8d0dec0b-2a17-4151-90d4-ed0016056cf0.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426179', '2016-03-09 18:40:16', '', 'jpg', '740', null, '31322545-4422-43aa-8350-0dbd59c7f63d.jpg', 'upload/store/1/2016/03/09', '0', '740', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426180', '2016-03-09 18:40:52', '', 'jpg', '493', null, '28121023-2bb1-41d3-8b63-68724d449782.jpg', 'upload/store/1/2016/03/09', '0', '497', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426182', '2016-03-09 18:42:06', '', 'jpg', '400', null, '8e5bf720-4f92-46ed-b1fe-34c683336918.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426184', '2016-03-09 18:43:05', '', 'png', '300', null, '7d4aa773-0aac-4fe3-9f0b-dd0a2894896c.png', 'upload/store/1/2016/03/09', '0', '208', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426185', '2016-03-09 18:43:21', '', 'jpg', '792', null, '3adcc661-34b9-4e2a-a4fd-3b5538ac683a.jpg', 'upload/store/1/2016/03/09', '0', '647', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426186', '2016-03-09 18:43:41', '', 'jpg', '800', null, '94d9c717-1a37-457e-aba7-93bba9fa6e08.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426189', '2016-03-09 18:45:35', '', 'jpg', '290', null, 'ed832a7f-58ef-4c54-b830-db2f9e43ea98.jpg', 'upload/store/1/2016/03/09', '0', '302', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426190', '2016-03-09 18:46:14', '', 'jpg', '500', null, '0314c749-c7ea-48bc-a95b-c9b949ecb81b.jpg', 'upload/store/1/2016/03/09', '0', '500', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426191', '2016-03-09 18:47:04', '', 'png', '367', null, '0d179751-9d01-4344-9d8a-99dba7b997c0.png', 'upload/store/1/2016/03/09', '0', '334', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426192', '2016-03-09 18:47:45', '', 'jpg', '401', null, '4c250695-4908-4153-adf4-31015182ea27.jpg', 'upload/store/1/2016/03/09', '0', '401', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426193', '2016-03-09 18:48:48', '', 'jpg', '772', null, '11493d1a-b497-4e16-ad4f-eae69649ea4c.jpg', 'upload/store/1/2016/03/09', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426194', '2016-03-09 18:49:05', '', 'jpg', '308', null, 'dedf7bbd-c4a7-4435-94d2-e01c42119b6a.jpg', 'upload/store/1/2016/03/09', '0', '308', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426195', '2016-03-09 18:49:20', '', 'jpg', '400', null, 'a37e2cdc-8705-4e24-9fed-deab364bbfef.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426196', '2016-03-09 18:51:41', '', 'jpg', '400', null, 'fcc7a0fa-abfc-4093-9eaa-4db470c3b58c.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426197', '2016-03-09 18:52:27', '', 'jpg', '700', null, 'cebbfba6-9fab-449b-bed2-8bb01ff2f957.jpg', 'upload/store/1/2016/03/09', '0', '500', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426198', '2016-03-09 18:53:07', '', 'jpg', '500', null, '2271a41b-5209-495c-81b1-4fa0a2ae906a.jpg', 'upload/store/1/2016/03/09', '0', '500', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426200', '2016-03-09 18:57:08', '', 'jpg', '417', null, '5708132d-c44a-41c3-843c-61d363642bac.jpg', 'upload/store/1/2016/03/09', '0', '446', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426201', '2016-03-09 18:57:43', '', 'jpg', '700', null, 'c6103a7d-aadd-4fec-ac92-9808d500c3b8.jpg', 'upload/store/1/2016/03/09', '0', '700', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426202', '2016-03-09 18:58:07', '', 'jpg', '480', null, '19915265-fac4-4d5b-aa55-b49cfce3d93f.jpg', 'upload/store/1/2016/03/09', '0', '480', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426203', '2016-03-09 18:58:29', '', 'jpg', '310', null, 'b2bc8d6a-ee7e-41a2-b45f-b2bbe5fe1567.jpg', 'upload/store/1/2016/03/09', '0', '281', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426204', '2016-03-09 18:58:57', '', 'jpg', '400', null, 'c9876b4b-678e-4f09-85c8-81f1fe3e5468.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426205', '2016-03-09 19:03:13', '', 'jpg', '389', null, '2ad74b8f-dbe0-43eb-bee6-4cd1daf78edb.jpg', 'upload/store/1/2016/03/09', '0', '427', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426206', '2016-03-09 19:03:55', '', 'jpg', '800', null, '20c0f66b-104b-4622-a741-5194da919e46.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426207', '2016-03-09 19:04:20', '', 'jpg', '388', null, 'be385d5d-301a-4d4d-becf-7e646923ab9d.jpg', 'upload/store/1/2016/03/09', '0', '396', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426208', '2016-03-09 19:11:36', '', 'jpg', '480', null, '2f055440-9779-4085-989a-feb0c1853836.jpg', 'upload/store/1/2016/03/09', '0', '480', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426209', '2016-03-09 19:12:05', '', 'jpg', '550', null, '2cd22a7e-e725-4a3b-b419-41aecd64c6a2.jpg', 'upload/store/1/2016/03/09', '0', '554', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426210', '2016-03-09 19:12:43', '', 'jpg', '600', null, 'fdd1ecf2-3112-4ebd-84b3-36bad90072cb.jpg', 'upload/store/1/2016/03/09', '0', '600', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426211', '2016-03-09 19:13:01', '', 'jpg', '350', null, '7b3e3b21-ce62-492b-8e2f-18dc7098d6b8.jpg', 'upload/store/1/2016/03/09', '0', '350', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426212', '2016-03-09 19:17:40', '', 'jpg', '800', null, '334b69c0-cafa-48ca-a15c-73ea660574ad.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426213', '2016-03-09 19:18:22', '', 'jpg', '420', null, '642cfcba-a973-420c-a5e8-ba733b3e6557.jpg', 'upload/store/1/2016/03/09', '0', '640', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426214', '2016-03-09 19:54:01', '', 'jpg', '563', null, '75ddb0c0-f60f-4848-8cf4-71fbcdc6d649.jpg', 'upload/store/1/2016/03/09', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426215', '2016-03-09 19:55:17', '', 'jpg', '563', null, 'f7ecff28-224f-4fbe-9077-837ba32c499b.jpg', 'upload/store/1/2016/03/09', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426216', '2016-03-09 19:55:54', '', 'jpg', '800', null, '0f9c9ba2-95cf-4dce-bae1-d72679a1d56f.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426217', '2016-03-09 19:56:40', '', 'jpg', '640', null, '3a860437-4784-4e8a-8738-ad3d6592559e.jpg', 'upload/store/1/2016/03/09', '0', '640', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426218', '2016-03-09 19:57:04', '', 'jpg', '640', null, '89fda20b-ad64-41dd-896a-2426f6cf1b81.jpg', 'upload/store/1/2016/03/09', '0', '640', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426220', '2016-03-09 19:58:24', '', 'png', '505', null, '2886a176-25cf-440d-98c6-0e1e88b18b02.png', 'upload/store/1/2016/03/09', '0', '556', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426221', '2016-03-09 19:58:51', '', 'jpg', '480', null, '599a49ac-3f9d-40d3-8b66-f3e5d942c9c1.jpg', 'upload/store/1/2016/03/09', '0', '480', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426223', '2016-03-09 19:59:30', '', 'jpg', '640', null, '64d65f56-0bdc-4caa-9dc8-62d824c99de9.jpg', 'upload/store/1/2016/03/09', '0', '640', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426224', '2016-03-09 19:59:51', '', 'jpg', '429', null, '49983be9-a0cd-4eca-881e-43a38a440612.jpg', 'upload/store/1/2016/03/09', '0', '450', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426225', '2016-03-09 20:00:17', '', 'jpg', '620', null, 'c196a3f3-d1c7-477f-b703-8548185885a7.jpg', 'upload/store/1/2016/03/09', '0', '687', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426227', '2016-03-09 20:01:04', '', 'jpg', '400', null, '4315bc5e-d7e4-4c75-89e1-bf9e0177ccec.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426228', '2016-03-09 20:01:38', '', 'jpg', '430', null, '23a9cbad-b73b-4e07-88dd-87bb48071447.jpg', 'upload/store/1/2016/03/09', '0', '430', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426229', '2016-03-09 20:02:23', '', 'jpg', '430', null, 'b54e3d6b-5f97-4fa5-9d3a-2c18a4cac20f.jpg', 'upload/store/1/2016/03/09', '0', '430', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426234', '2016-03-09 20:04:33', '', 'jpg', '460', null, '84ab13d3-42d1-44cc-bd7c-9f284a83ea9f.jpg', 'upload/store/1/2016/03/09', '0', '460', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426236', '2016-03-09 20:05:40', '', 'jpg', '800', null, 'da504c07-8b39-4b94-8bb7-5efe07445852.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426237', '2016-03-09 20:06:07', '', 'jpg', '520', null, '980ac438-1f1a-4d0d-b243-ce76344983d3.jpg', 'upload/store/1/2016/03/09', '0', '734', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426238', '2016-03-09 20:06:25', '', 'jpg', '827', null, '88e97f9a-d7b3-4a99-be2f-5fe34aabffb1.jpg', 'upload/store/1/2016/03/09', '0', '839', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426240', '2016-03-09 20:07:53', '', 'png', '400', null, '295a3d6a-bc76-40a3-9771-f2c35ddc5279.png', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426242', '2016-03-09 20:08:58', '', 'jpg', '671', null, '7dcf4d1e-78e3-440e-af7c-8c3926f8dde2.jpg', 'upload/store/1/2016/03/09', '0', '606', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426243', '2016-03-09 20:09:42', '', 'jpg', '600', null, '206f924c-29fe-47d1-be98-2e6fe91a42c0.jpg', 'upload/store/1/2016/03/09', '0', '600', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426244', '2016-03-09 20:10:05', '', 'jpg', '400', null, '4735ad18-cbfc-4303-9cba-d39d681593b8.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426246', '2016-03-09 20:11:07', '', 'jpg', '310', null, 'bee754be-63a1-4803-b6c3-d9f0e2570558.jpg', 'upload/store/1/2016/03/09', '0', '310', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426247', '2016-03-09 20:11:28', '', 'png', '400', null, '5eaf763f-79f5-4f0f-bdb5-3c1ed4e51439.png', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426249', '2016-03-09 20:12:09', '', 'jpg', '400', null, '4f3dd7e2-5812-4c9c-b490-a93d5287f69e.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426252', '2016-03-09 20:13:49', '', 'jpg', '466', null, '41ba4fa8-5376-4f73-8dfc-b17f2ac8f381.jpg', 'upload/store/1/2016/03/09', '0', '466', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426253', '2016-03-09 20:14:07', '', 'jpg', '800', null, '8c57aaae-3d87-47d4-a950-f7283aa5b972.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426257', '2016-03-09 20:19:02', '', 'jpg', '400', null, '9956ffdb-26fa-412c-9f69-ac68db460c58.jpg', 'upload/store/1/2016/03/09', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426259', '2016-03-09 20:20:15', '', 'jpg', '500', null, '3a8cd5b0-3105-4b24-a0cb-6d729ae8bc8a.jpg', 'upload/store/1/2016/03/09', '0', '500', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426260', '2016-03-09 20:20:30', '', 'jpg', '800', null, 'e6fecda9-b584-466d-9e33-d0329bd83aa2.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426261', '2016-03-09 20:21:00', '', 'jpg', '800', null, 'dcadcf50-eb88-4500-8e86-d4da0cb0f484.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426262', '2016-03-09 20:24:46', '', 'jpg', '800', null, 'ae2d4318-bb0e-4fdd-87f5-40579bca5443.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426264', '2016-03-09 20:25:48', '', 'png', '451', null, '8dede06c-7b84-43c9-8530-709d6e0b92b0.png', 'upload/store/1/2016/03/09', '0', '419', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426265', '2016-03-09 20:26:30', '', 'jpg', '750', null, '588324fc-1bc1-44a8-8d7c-ad2f37dcf42f.jpg', 'upload/store/1/2016/03/09', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426266', '2016-03-09 20:27:21', '', 'jpg', '416', null, '7d16200c-cc1e-46ed-b53a-71d7f714f335.jpg', 'upload/store/1/2016/03/09', '0', '419', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426267', '2016-03-09 20:27:46', '', 'jpg', '728', null, 'edd21179-2515-480f-ac95-c33700a2fe14.jpg', 'upload/store/1/2016/03/09', '0', '728', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426268', '2016-03-09 20:28:47', '', 'jpg', '418', null, '2166ef4b-56eb-44e4-a032-ac3b61cde046.jpg', 'upload/store/1/2016/03/09', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426271', '2016-03-09 20:30:13', '', 'jpg', '460', null, 'c9d4616b-3ff7-4a20-8a21-0cf6bf0459bd.jpg', 'upload/store/1/2016/03/09', '0', '460', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426290', '2016-03-09 20:40:11', '', 'png', '397', null, 'a0d40300-22cf-457e-9616-1f70e54c1b60.png', 'upload/store/1/2016/03/09', '0', '393', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426296', '2016-03-09 21:26:37', '', 'jpg', '800', null, '3dad7cec-54cd-444f-a350-a514af6f97bd.jpg', 'upload/store/1/2016/03/09', '0', '800', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426300', '2016-03-09 21:35:22', '', 'jpg', '720', null, '21bef50c-6ee3-457e-9943-e64e8c4c0462.jpg', 'upload/store/1/2016/03/09', '0', '718', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426301', '2016-03-09 21:36:54', '', 'jpg', '715', null, '6ab61eed-58fd-4ac4-bfea-8f47d6171fed.jpg', 'upload/store/1/2016/03/09', '0', '717', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426302', '2016-03-09 21:38:55', '', 'jpg', '720', null, 'da674445-3451-4f65-9dff-43a01f0af371.jpg', 'upload/store/1/2016/03/09', '0', '719', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426303', '2016-03-09 21:40:46', '', 'jpg', '600', null, '50db6d66-a19d-40d5-9875-f4c1f27c7ec4.jpg', 'upload/store/1/2016/03/09', '0', '599', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426304', '2016-03-14 10:50:34', '', 'jpg', '300', null, '949e869a-9176-419e-bf27-445fddf40aaf.jpg', 'upload/advert', '188573', '640', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426305', '2016-03-14 11:15:53', '', 'jpg', '300', null, 'a578b9f7-5732-48cd-a633-874c5804789f.jpg', 'upload/advert', '188573', '640', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426306', '2016-03-14 10:56:12', '', 'jpg', '300', null, '3408d449-4734-4da6-b333-2edf74925c74.jpg', 'upload/advert', '160208', '640', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426307', '2016-03-14 11:16:06', '', 'jpg', '300', null, '01a775b9-50ed-4763-8088-187026bda5da.jpg', 'upload/advert', '157748', '640', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426308', '2016-04-01 18:03:10', '', 'jpg', '200', null, '7d1de9c2-4846-4a98-b10c-5e6f98fb4916.jpg', 'upload/store_logo', '8039', '200', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426310', '2016-04-04 16:07:28', '', 'jpg', '398', null, '8683c4df-abcc-48f9-ba14-8c19c44c18be.jpg', 'upload/store/1/2016/04/04', '0', '401', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426311', '2016-04-04 16:07:32', '', 'jpg', '399', null, '940a1b26-5b76-49d4-9c5d-e2577ee7f15b.jpg', 'upload/store/1/2016/04/04', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426312', '2016-04-04 16:07:36', '', 'jpg', '400', null, '169661b6-6343-4915-9661-5bee8c6733aa.jpg', 'upload/store/1/2016/04/04', '0', '397', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426317', '2016-04-04 16:26:35', '', 'jpg', '800', null, '878b1495-c07a-4ce1-9e18-058031098555.jpg', 'upload/store/1/2016/04/04', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426318', '2016-04-04 16:26:42', '', 'jpg', '1077', null, 'b1bc4c7a-53df-442f-81d0-a95b641c2726.jpg', 'upload/store/1/2016/04/04', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426319', '2016-04-04 16:36:04', '', 'jpg', '570', null, 'c51ca320-b9d9-4bed-b64a-f4768557f57c.jpg', 'upload/store/1/2016/04/04', '0', '615', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426320', '2016-04-04 16:36:08', '', 'jpg', '574', null, '039f78c8-1e7b-41ec-9734-8063b90588e2.jpg', 'upload/store/1/2016/04/04', '0', '617', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426321', '2016-04-04 16:36:12', '', 'jpg', '568', null, '0de6d172-5f47-445d-8ab9-bedb8bebad4a.jpg', 'upload/store/1/2016/04/04', '0', '617', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426322', '2016-04-04 16:36:18', '', 'jpg', '1000', null, '9f02c287-0962-4d4d-a474-5c7328199651.jpg', 'upload/store/1/2016/04/04', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426323', '2016-04-04 16:36:21', '', 'jpg', '1202', null, 'f0cc1d42-ad62-4274-bad1-879db5d3c9ce.jpg', 'upload/store/1/2016/04/04', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426324', '2016-04-04 16:48:53', '', 'jpg', '419', null, '261aa20f-fc4e-42c8-9a02-cba9a773d019.jpg', 'upload/store/1/2016/04/04', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426325', '2016-04-04 16:48:57', '', 'jpg', '415', null, 'a4d8cad7-c222-464c-bd57-42ece219a8f3.jpg', 'upload/store/1/2016/04/04', '0', '420', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426326', '2016-04-04 16:49:01', '', 'jpg', '425', null, 'c455aab0-a5ce-4957-87f7-c04b5837e7f9.jpg', 'upload/store/1/2016/04/04', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426327', '2016-04-04 16:49:08', '', 'jpg', '766', null, 'c5e18ee0-b0ab-4094-bbe7-0ea1f10c5fa5.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426328', '2016-04-04 16:49:16', '', 'jpg', '1048', null, 'cd1aea48-da4a-41d4-b7e6-75d9d0d10159.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426329', '2016-04-04 17:02:56', '', 'jpg', '600', null, 'f5aaad92-231d-45b1-8971-681afd483884.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426330', '2016-04-04 17:10:16', '', 'jpg', '421', null, '1d654e64-47f8-46dd-b3c4-1d0e806af0c1.jpg', 'upload/store/1/2016/04/04', '0', '435', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426331', '2016-04-04 17:10:18', '', 'jpg', '416', null, '53418876-91e8-466f-b421-8d66527f7bf1.jpg', 'upload/store/1/2016/04/04', '0', '426', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426332', '2016-04-04 17:10:22', '', 'jpg', '416', null, '4be02ba5-3032-496c-bf8a-237d99304b9a.jpg', 'upload/store/1/2016/04/04', '0', '413', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426334', '2016-04-04 17:10:45', '', 'jpg', '600', null, '7a6dd5a2-2728-49e6-9d41-42cfd5c51a21.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426335', '2016-04-04 17:24:37', '', 'jpg', '420', null, 'b23a1411-8002-48eb-bc3a-3624ed6ee3ce.jpg', 'upload/store/1/2016/04/04', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426336', '2016-04-04 17:24:43', '', 'jpg', '418', null, '3a2053b8-d53d-4967-b448-daa5d4ecb3cc.jpg', 'upload/store/1/2016/04/04', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426337', '2016-04-04 17:24:46', '', 'jpg', '419', null, '984c5f77-37d8-49ef-bf9f-1cec2fccfe21.jpg', 'upload/store/1/2016/04/04', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426338', '2016-04-04 17:24:49', '', 'jpg', '413', null, '0a498b96-4233-4331-922e-01e4873242e2.jpg', 'upload/store/1/2016/04/04', '0', '409', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426340', '2016-04-04 17:26:07', '', 'jpg', '592', null, '8dbeded6-f229-4957-9bf6-198d21696ddd.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426341', '2016-04-04 17:32:54', '', 'jpg', '823', null, '444ed816-9db0-456d-a28c-fcc7fc900097.jpg', 'upload/store/1/2016/04/04', '0', '778', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426343', '2016-04-04 17:34:39', '', 'jpg', '418', null, '782382ed-8679-4e62-bfc2-be17dd920079.jpg', 'upload/store/1/2016/04/04', '0', '421', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426344', '2016-04-04 17:34:41', '', 'jpg', '419', null, 'bc80fde7-4bbe-4450-a7b4-1f205c050937.jpg', 'upload/store/1/2016/04/04', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426345', '2016-04-04 17:34:44', '', 'jpg', '736', null, '09ab7939-e4df-46fd-aadb-cad2911b2f00.jpg', 'upload/store/1/2016/04/04', '0', '778', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426348', '2016-04-04 17:46:16', '', 'jpg', '418', null, '3c472df1-3280-4cf5-b6f3-c98c66cb136a.jpg', 'upload/store/1/2016/04/04', '0', '413', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426349', '2016-04-04 17:46:18', '', 'jpg', '414', null, '032dc084-0e54-4ba6-a258-9815ba62b403.jpg', 'upload/store/1/2016/04/04', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426350', '2016-04-04 17:46:21', '', 'jpg', '415', null, 'f3846aec-459d-4897-b301-17c7e2954060.jpg', 'upload/store/1/2016/04/04', '0', '432', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426351', '2016-04-04 17:46:24', '', 'jpg', '1500', null, 'e991e8d4-be94-4f42-ac7e-5fbaeaac7d38.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426353', '2016-04-04 17:55:35', '', 'jpg', '418', null, '7e289bdf-270d-4aa3-84e7-18fac7c5446c.jpg', 'upload/store/1/2016/04/04', '0', '423', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426354', '2016-04-04 17:55:37', '', 'jpg', '418', null, '4251c8f6-03ac-43de-9c34-a16120c51474.jpg', 'upload/store/1/2016/04/04', '0', '419', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426355', '2016-04-04 17:55:40', '', 'jpg', '417', null, '22c921a1-ed29-4f78-86ad-e751a417d8ee.jpg', 'upload/store/1/2016/04/04', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426356', '2016-04-04 17:55:43', '', 'jpg', '959', null, 'c69f3b06-7bb0-4b25-a09d-69a5e3e182d8.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426357', '2016-04-04 17:55:48', '', 'jpg', '1064', null, 'bf6d1bb0-2823-45c6-bd7f-a90a911ea27c.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426358', '2016-04-04 18:02:22', '', 'jpg', '419', null, '3dccce3e-b6b9-4f7e-9a5c-694a162aa88d.jpg', 'upload/store/1/2016/04/04', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426359', '2016-04-04 18:02:25', '', 'jpg', '417', null, '4c031b9b-5553-45d6-b442-c5b4ff8f742a.jpg', 'upload/store/1/2016/04/04', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426360', '2016-04-04 18:02:27', '', 'jpg', '420', null, '7544a6bc-41d4-4cb3-9f20-f52053d4d1c4.jpg', 'upload/store/1/2016/04/04', '0', '414', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426361', '2016-04-04 18:02:30', '', 'jpg', '1534', null, '7b0c0465-7e9c-4676-8aa5-19f68eb3d2ba.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426362', '2016-04-04 18:02:36', '', 'jpg', '1518', null, '0e474a11-ae41-4802-8edb-684e97f58d7c.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426363', '2016-04-04 18:06:35', '', 'jpg', '419', null, '7c8d82c1-bfa6-42fd-9921-6755d04c207c.jpg', 'upload/store/1/2016/04/04', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426364', '2016-04-04 18:06:39', '', 'jpg', '418', null, 'a30e38d0-c5f8-44b1-bc10-3a9b3e970dd8.jpg', 'upload/store/1/2016/04/04', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426365', '2016-04-04 18:06:44', '', 'jpg', '416', null, '8ea4f1ec-07b7-423e-ad8e-776636e3a5e1.jpg', 'upload/store/1/2016/04/04', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426367', '2016-04-04 18:06:54', '', 'jpg', '508', null, '30f29109-5979-46ca-a980-7bba16d5e721.jpg', 'upload/store/1/2016/04/04', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426368', '2016-04-04 18:07:02', '', 'jpg', '874', null, 'dbf36624-542e-4099-b1d9-e3cf9d9a03b7.jpg', 'upload/store/1/2016/04/04', '0', '750', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426369', '2016-04-04 18:11:12', '', 'png', '420', null, 'df2e0d8b-047a-4e95-9c31-e5b22c8480b1.png', 'upload/store/1/2016/04/04', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426370', '2016-04-04 18:11:16', '', 'png', '418', null, 'd7f12f86-cba0-4107-9a9d-e77f016ae1d4.png', 'upload/store/1/2016/04/04', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426371', '2016-04-04 18:11:22', '', 'jpg', '1200', null, 'edf9e230-6b9d-46a7-9065-c5900275fb00.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426372', '2016-04-04 18:11:28', '', 'jpg', '307', null, '35a44450-72a8-4806-a7ac-41af954810a1.jpg', 'upload/store/1/2016/04/04', '0', '396', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426373', '2016-04-04 18:11:32', '', 'jpg', '1200', null, '17f61b1a-994e-41f9-bc3e-95d28bf9a6a6.jpg', 'upload/store/1/2016/04/04', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426376', '2016-04-04 20:45:37', '', 'jpg', '426', null, 'cc6f7684-7670-4c30-a30b-01ed146cf24d.jpg', 'upload/store/32769/2016/04/04', '0', '432', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426377', '2016-04-04 20:45:44', '', 'jpg', '418', null, '8ad131f7-7c98-437d-a1e8-abb0d87d69cf.jpg', 'upload/store/32769/2016/04/04', '0', '437', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426378', '2016-04-04 20:45:49', '', 'jpg', '315', null, '13c4e105-bf86-4ee9-ae14-aa5d6a76f9f9.jpg', 'upload/store/32769/2016/04/04', '0', '790', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426379', '2016-04-04 20:45:53', '', 'png', '544', null, 'fe46dffa-427d-443d-962a-c6c0a57e1421.png', 'upload/store/32769/2016/04/04', '0', '791', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426380', '2016-04-04 20:49:46', '', 'jpg', '423', null, 'f8179218-f585-4e3f-bc2d-1e2e714b348b.jpg', 'upload/store/32769/2016/04/04', '0', '433', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426381', '2016-04-04 20:49:50', '', 'png', '378', null, '883c9f9d-e17f-4b21-b05d-e067f5bca1ee.png', 'upload/store/32769/2016/04/04', '0', '435', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426382', '2016-04-04 20:49:53', '', 'jpg', '562', null, '3d5c30c1-41cd-421a-a20d-c522f89e5323.jpg', 'upload/store/32769/2016/04/04', '0', '750', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426383', '2016-04-04 20:49:56', '', 'jpg', '564', null, '6189422c-4677-4bc6-8745-79f401f64b03.jpg', 'upload/store/32769/2016/04/04', '0', '750', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426384', '2016-04-04 20:49:59', '', 'jpg', '528', null, '175f5d19-c126-48cd-989e-82d6fa3237ae.jpg', 'upload/store/32769/2016/04/04', '0', '790', '2', '32769', null);
INSERT INTO `shopping_accessory` VALUES ('426385', '2016-04-06 15:34:13', '', 'jpg', '724', null, 'f481bb63-8b04-4abb-b2b9-0070a4ef974b.jpg', 'upload/store/1/2016/04/06', '0', '872', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426386', '2016-04-06 16:39:15', '', 'png', '414', null, '6c8e5775-3557-4ee3-9977-376bd14aeae8.png', 'upload/store/1/2016/04/06', '0', '412', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426387', '2016-04-06 16:39:18', '', 'png', '421', null, 'cf12064d-926a-4361-be93-bc71ac3c275f.png', 'upload/store/1/2016/04/06', '0', '423', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426388', '2016-04-06 16:39:21', '', 'png', '424', null, '551e2510-e762-4544-9db8-55739edfdce9.png', 'upload/store/1/2016/04/06', '0', '427', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426389', '2016-04-06 16:39:25', '', 'jpg', '906', null, '38acdd97-d8ed-4497-bd4f-0449a886c611.jpg', 'upload/store/1/2016/04/06', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426390', '2016-04-06 16:45:12', '', 'png', '400', null, '2875987f-756d-4556-9a74-058c0d582b32.png', 'upload/store/1/2016/04/06', '0', '401', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426391', '2016-04-06 16:45:22', '', 'png', '414', null, '0a9075fd-4cfe-4157-9c8a-57bd5891c92d.png', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426392', '2016-04-06 16:45:25', '', 'png', '423', null, '2c3167d8-6a4f-41b3-a882-92ee9bff32ea.png', 'upload/store/1/2016/04/06', '0', '422', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426393', '2016-04-06 16:45:29', '', 'png', '418', null, '32b0fc47-37fc-4c3e-a246-e1a9ca4503f5.png', 'upload/store/1/2016/04/06', '0', '425', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426394', '2016-04-06 16:45:32', '', 'png', '423', null, 'e0d6a348-6ac2-45e5-8a68-79f3fda08f8e.png', 'upload/store/1/2016/04/06', '0', '427', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426395', '2016-04-06 16:54:05', '', 'jpg', '418', null, '6b40e445-09fc-4f89-8ca4-99ecee6494d9.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426396', '2016-04-06 16:54:09', '', 'jpg', '418', null, 'c659dca2-e023-46bf-bfdd-3f16bada0f7f.jpg', 'upload/store/1/2016/04/06', '0', '411', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426397', '2016-04-06 16:54:13', '', 'jpg', '415', null, '61197949-2007-4262-aec1-c782314d4389.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426398', '2016-04-06 16:54:16', '', 'jpg', '418', null, 'ba8a9f7f-cb7a-4260-b964-442b414362af.jpg', 'upload/store/1/2016/04/06', '0', '421', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426399', '2016-04-06 16:58:04', '', 'jpg', '419', null, '6e37481c-e531-4d8e-8a46-f99438abaebd.jpg', 'upload/store/1/2016/04/06', '0', '423', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426400', '2016-04-06 16:58:06', '', 'jpg', '421', null, 'b87d840b-fd39-4803-962f-994d77a68dc1.jpg', 'upload/store/1/2016/04/06', '0', '413', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426401', '2016-04-06 16:58:09', '', 'jpg', '418', null, 'c3d20fa9-49dd-4707-946c-f8d0d77e8293.jpg', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426402', '2016-04-06 16:58:29', '', 'jpg', '419', null, 'da8d5bed-5b9d-4fe5-823f-610c4562d956.jpg', 'upload/store/1/2016/04/06', '0', '423', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426403', '2016-04-06 16:58:32', '', 'jpg', '421', null, '72510e37-5268-433a-b042-11d750896bf6.jpg', 'upload/store/1/2016/04/06', '0', '413', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426404', '2016-04-06 16:58:34', '', 'jpg', '418', null, '39863297-3ed0-40fe-999e-e8aaa6c2b824.jpg', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426405', '2016-04-06 17:03:57', '', 'jpg', '420', null, '2a4c105f-d92e-4268-b7e9-c2f015e1a614.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426406', '2016-04-06 17:03:59', '', 'jpg', '419', null, '7d21b214-81b0-49b1-a2a1-aefb541dcd63.jpg', 'upload/store/1/2016/04/06', '0', '426', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426407', '2016-04-06 17:04:02', '', 'jpg', '416', null, '0e893b75-c615-4665-b929-90d825976151.jpg', 'upload/store/1/2016/04/06', '0', '413', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426408', '2016-04-06 17:13:19', '', 'jpg', '417', null, '33de2d44-8c47-499f-aabc-7367b330b801.jpg', 'upload/store/1/2016/04/06', '0', '413', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426409', '2016-04-06 17:13:23', '', 'jpg', '417', null, 'cf391a5e-a9c3-4cc6-894b-54e376a3385b.jpg', 'upload/store/1/2016/04/06', '0', '423', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426410', '2016-04-06 17:13:26', '', 'jpg', '418', null, '807650c3-c617-48be-a3b0-2ca6cfbc6f58.jpg', 'upload/store/1/2016/04/06', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426415', '2016-04-06 17:20:26', '', 'jpg', '420', null, '707f0bde-c7e6-47ed-880e-45029af157b0.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426416', '2016-04-06 17:20:30', '', 'jpg', '417', null, 'ace1b85e-12da-447c-b97b-b5f6e5f86317.jpg', 'upload/store/1/2016/04/06', '0', '414', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426417', '2016-04-06 17:20:33', '', 'jpg', '418', null, '89a0aed5-0b60-4c61-8d7d-d84ee0bd6d75.jpg', 'upload/store/1/2016/04/06', '0', '414', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426418', '2016-04-06 17:23:03', '', 'jpg', '422', null, '8bf9e3e0-9c52-40e7-a856-6580c667096e.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426419', '2016-04-06 17:23:06', '', 'jpg', '416', null, '6bd87c04-9b0e-4238-9dd2-c373784a3b25.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426420', '2016-04-06 17:23:09', '', 'jpg', '416', null, 'a4cb22b9-a295-471e-887f-935483f844ba.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426421', '2016-04-06 17:23:15', '', 'jpg', '995', null, '55a3bf35-b6fe-4fa9-9e9a-22cf9ea2eb55.jpg', 'upload/store/1/2016/04/06', '0', '790', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426422', '2016-04-06 17:25:32', '', 'jpg', '419', null, '01cc160d-9779-4e73-8c95-71429cd2c38c.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426423', '2016-04-06 17:26:22', '', 'jpg', '419', null, '1117e51e-9198-46b0-b5ed-b33b699687e9.jpg', 'upload/store/1/2016/04/06', '0', '412', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426424', '2016-04-06 17:29:36', '', 'jpg', '419', null, '7e25a851-b21f-4130-8898-aea44f1e39fa.jpg', 'upload/store/1/2016/04/06', '0', '410', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426425', '2016-04-06 17:36:39', '', 'jpg', '423', null, 'a5c57635-3a35-4a01-898f-57c158d6d229.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426426', '2016-04-06 17:36:42', '', 'jpg', '422', null, '773b8a97-5a9a-44d2-8489-704b00dcde09.jpg', 'upload/store/1/2016/04/06', '0', '414', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426427', '2016-04-06 17:36:44', '', 'jpg', '420', null, '1d2cdcc4-2f36-4233-be4f-f5bf8054e63c.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426428', '2016-04-06 18:07:36', '', 'jpg', '421', null, '8ff57afe-41bc-46a6-bcde-6a1bb9f0683e.jpg', 'upload/store/1/2016/04/06', '0', '433', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426429', '2016-04-06 18:07:39', '', 'jpg', '425', null, '26a5dd22-c40d-47f7-a04a-4e2ed48bdc66.jpg', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426430', '2016-04-06 18:07:43', '', 'jpg', '420', null, 'b4715c15-33f7-4434-983f-e067dc9cc88e.jpg', 'upload/store/1/2016/04/06', '0', '425', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426431', '2016-04-06 18:07:46', '', 'jpg', '416', null, 'c76f8067-dd18-44ec-aa9e-49c3213f596d.jpg', 'upload/store/1/2016/04/06', '0', '425', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426432', '2016-04-06 18:10:43', '', 'jpg', '401', null, 'a794ce73-9cfa-421b-8425-ee65c1cb17a5.jpg', 'upload/store/1/2016/04/06', '0', '394', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426433', '2016-04-06 18:10:46', '', 'jpg', '434', null, '1dc4f50a-20bf-40ab-9d19-a9540a20be2e.jpg', 'upload/store/1/2016/04/06', '0', '394', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426434', '2016-04-06 18:10:49', '', 'jpg', '421', null, '5f293f93-4ad9-42b6-84e9-22add3c26c3e.jpg', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426436', '2016-04-06 18:14:00', '', 'jpg', '418', null, '5806b379-d18b-4c8d-8027-181300e03105.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426437', '2016-04-06 18:14:03', '', 'jpg', '415', null, '418c49dd-6184-413f-b7eb-2a78a2c6fe40.jpg', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426438', '2016-04-06 18:14:05', '', 'jpg', '415', null, 'f9354154-950f-4cc9-a0d4-60868dca99b4.jpg', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426439', '2016-04-06 18:14:08', '', 'jpg', '418', null, 'fbe68f31-2bd9-4d9f-8398-9ccea77fb1f5.jpg', 'upload/store/1/2016/04/06', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426440', '2016-04-06 18:16:59', '', 'jpg', '417', null, '857228fa-a0a8-4e12-9859-bfb19655f2a1.jpg', 'upload/store/1/2016/04/06', '0', '420', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426441', '2016-04-06 18:17:02', '', 'jpg', '419', null, 'fa30ece5-6b4a-4dba-883a-858c76a41a6f.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426442', '2016-04-06 18:17:05', '', 'jpg', '421', null, 'bd9e45c6-937f-419c-bec2-9dd2fd7b0e47.jpg', 'upload/store/1/2016/04/06', '0', '414', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426443', '2016-04-06 18:17:08', '', 'jpg', '418', null, '0930faec-4aa8-4320-adc4-1ec8905cee2f.jpg', 'upload/store/1/2016/04/06', '0', '410', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426444', '2016-04-06 18:19:52', '', 'jpg', '415', null, '65b46d4f-65e0-42bc-ba4c-83878e42305c.jpg', 'upload/store/1/2016/04/06', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426445', '2016-04-06 18:19:56', '', 'jpg', '417', null, '9c58931f-0351-4887-b0f9-29baeb9082b9.jpg', 'upload/store/1/2016/04/06', '0', '414', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426446', '2016-04-06 18:19:59', '', 'jpg', '418', null, '306d8f70-2c3e-4228-a4e2-8e71a2010c36.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426447', '2016-04-06 18:22:37', '', 'png', '400', null, 'e935d19c-bfe3-4f81-a84a-55a99916f787.png', 'upload/store/1/2016/04/06', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426448', '2016-04-06 18:22:42', '', 'png', '399', null, '83293942-6aaa-45c3-a27b-772ea17661a0.png', 'upload/store/1/2016/04/06', '0', '399', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426449', '2016-04-06 18:22:47', '', 'png', '401', null, '0c2d16c6-2f15-46c4-ac4f-986bbb2b70e6.png', 'upload/store/1/2016/04/06', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426450', '2016-04-06 18:25:22', '', 'jpg', '398', null, '1572d08b-1404-449f-a746-0336612f15a9.jpg', 'upload/store/1/2016/04/06', '0', '401', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426451', '2016-04-06 18:25:25', '', 'jpg', '399', null, '62185be5-21da-4914-a0ab-54b182cad8bc.jpg', 'upload/store/1/2016/04/06', '0', '400', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426452', '2016-04-06 18:25:29', '', 'jpg', '400', null, '54f4adbc-f2dd-4b7d-89f1-9733163a4f58.jpg', 'upload/store/1/2016/04/06', '0', '397', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426453', '2016-04-06 18:28:14', '', 'png', '420', null, '364bef0c-53e0-4b6a-8ca5-e6850436d176.png', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426454', '2016-04-06 18:28:19', '', 'png', '420', null, '06a6fd28-d373-46e7-842e-96a314230ddb.png', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426455', '2016-04-06 18:28:31', '', 'png', '418', null, '99fccbf1-fee0-4680-b89e-f40e10c3744c.png', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426456', '2016-04-06 18:30:23', '', 'png', '573', null, 'd68c32e0-e778-448c-a306-b1f97adbadbb.png', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426457', '2016-04-06 18:30:34', '', 'png', '576', null, '0552f906-c0a5-415f-b682-2f875f2a1a88.png', 'upload/store/1/2016/04/06', '0', '621', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426458', '2016-04-06 18:30:43', '', 'png', '577', null, 'f09e050b-2c10-4580-8e1d-bca92895c100.png', 'upload/store/1/2016/04/06', '0', '624', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426459', '2016-04-06 18:30:55', '', 'png', '572', null, '165262a1-d27d-40fe-8091-0fe22d0ed018.png', 'upload/store/1/2016/04/06', '0', '617', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426460', '2016-04-06 18:33:22', '', 'jpg', '418', null, 'ed7600d6-62cb-48d5-b971-6884f2b2203c.jpg', 'upload/store/1/2016/04/06', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426461', '2016-04-06 18:33:25', '', 'jpg', '418', null, 'ae8965a3-3167-481e-8c9f-28ac9483cbf4.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426462', '2016-04-06 18:33:28', '', 'jpg', '416', null, '76a9174a-5812-473a-a916-d844254eef0a.jpg', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426463', '2016-04-06 18:33:32', '', 'jpg', '418', null, '2f19ae26-de08-457a-b751-5b7e56da3d84.jpg', 'upload/store/1/2016/04/06', '0', '418', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426464', '2016-04-06 18:36:20', '', 'png', '425', null, '4d62c55d-217d-47ea-b2a2-174082b9de7f.png', 'upload/store/1/2016/04/06', '0', '424', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426465', '2016-04-06 18:36:25', '', 'png', '399', null, '46e1d2fb-6098-403d-8094-bdbd24ea01d0.png', 'upload/store/1/2016/04/06', '0', '397', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426466', '2016-04-06 18:36:29', '', 'png', '401', null, '513a11c4-827c-41a7-b2d4-adb2eab494ce.png', 'upload/store/1/2016/04/06', '0', '397', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426467', '2016-04-06 18:36:33', '', 'png', '398', null, '5c898aa0-6413-4419-91b9-e8caaec2c80c.png', 'upload/store/1/2016/04/06', '0', '397', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426468', '2016-04-06 18:38:44', '', 'png', '419', null, '127aa77f-1cdb-4339-9a62-0d220079c2ae.png', 'upload/store/1/2016/04/06', '0', '426', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426469', '2016-04-06 18:38:47', '', 'png', '424', null, 'e9610944-62c8-4c8e-b3bc-290c3b7b20a8.png', 'upload/store/1/2016/04/06', '0', '430', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426470', '2016-04-06 18:38:50', '', 'png', '425', null, '390add0b-13bd-4388-b600-be6b8d1edacc.png', 'upload/store/1/2016/04/06', '0', '420', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426471', '2016-04-06 18:40:43', '', 'png', '418', null, '2716d0c7-3e8f-4404-a182-4a1b70a63f13.png', 'upload/store/1/2016/04/06', '0', '413', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426472', '2016-04-06 18:40:46', '', 'png', '418', null, '26985b15-5203-455f-adf4-aa5783a4f90d.png', 'upload/store/1/2016/04/06', '0', '421', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426473', '2016-04-06 18:40:49', '', 'png', '418', null, '0b90a9f8-7c99-487b-bea5-641aeb7b80cc.png', 'upload/store/1/2016/04/06', '0', '398', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426474', '2016-04-06 19:38:48', '', 'png', '421', null, 'a683585b-3307-4a77-a54d-98f18b05560d.png', 'upload/store/1/2016/04/06', '0', '423', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426475', '2016-04-06 19:38:51', '', 'png', '424', null, 'b6834b89-a96c-4d51-8569-82d25ff5b6bc.png', 'upload/store/1/2016/04/06', '0', '427', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426476', '2016-04-06 19:38:55', '', 'png', '414', null, '1ea51943-69e4-4905-a698-511bbe94dd22.png', 'upload/store/1/2016/04/06', '0', '412', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426477', '2016-04-06 19:41:44', '', 'png', '401', null, '91666991-2921-455c-85fc-58a729cc1124.png', 'upload/store/1/2016/04/06', '0', '396', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426478', '2016-04-06 19:41:51', '', 'png', '401', null, 'dc85e296-4515-421c-95dc-d3e3cbad064c.png', 'upload/store/1/2016/04/06', '0', '399', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426479', '2016-04-06 19:42:02', '', 'png', '567', null, '74700f7b-dee1-45a4-8c4e-648df9034028.png', 'upload/store/1/2016/04/06', '0', '620', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426480', '2016-04-06 19:47:29', '', 'png', '427', null, '157c4f13-47be-40e4-8b6c-8f48cd24e59d.png', 'upload/store/1/2016/04/06', '0', '433', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426481', '2016-04-06 19:47:36', '', 'png', '420', null, '2caf9897-8246-47bd-a166-085c93260d7e.png', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426482', '2016-04-06 19:47:47', '', 'png', '416', null, 'a791d3af-0446-42e6-a61d-aa369df6f066.png', 'upload/store/1/2016/04/06', '0', '420', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426484', '2016-04-06 19:52:02', '', 'png', '424', null, '1391c6cd-33f5-4426-84f6-7a2de2c2d355.png', 'upload/store/1/2016/04/06', '0', '426', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426485', '2016-04-06 19:52:07', '', 'png', '424', null, '75397acd-0a29-4559-90c9-42f4a7a2f430.png', 'upload/store/1/2016/04/06', '0', '421', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426486', '2016-04-06 19:52:10', '', 'png', '421', null, 'b1586406-7742-4f53-9303-666d43b92796.png', 'upload/store/1/2016/04/06', '0', '419', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426488', '2016-04-06 19:54:02', '', 'jpg', '636', null, 'a4276cf4-9a10-4202-8daa-6dca9c0f1266.jpg', 'upload/store/1/2016/04/06', '0', '721', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426489', '2016-04-06 19:54:05', '', 'jpg', '636', null, '8a8aea32-daf6-487f-886d-30c894392cf8.jpg', 'upload/store/1/2016/04/06', '0', '716', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426490', '2016-04-06 19:56:13', '', 'png', '422', null, '830c6898-509c-44da-8881-3e78bfdcad2c.png', 'upload/store/1/2016/04/06', '0', '419', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426491', '2016-04-06 19:56:17', '', 'png', '421', null, '09176424-be56-4173-83fd-e829fc0eb1a8.png', 'upload/store/1/2016/04/06', '0', '417', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426492', '2016-04-06 19:56:23', '', 'png', '421', null, '7ad137f3-4872-425f-8377-9176f672f68b.png', 'upload/store/1/2016/04/06', '0', '424', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426493', '2016-04-06 19:56:29', '', 'png', '419', null, '3ae5de80-8f06-43c6-85eb-c4c087e5c871.png', 'upload/store/1/2016/04/06', '0', '416', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426494', '2016-04-06 19:58:36', '', 'png', '419', null, 'fbf99c24-6aff-4d37-8a28-0860fb1244d7.png', 'upload/store/1/2016/04/06', '0', '421', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426495', '2016-04-06 19:58:43', '', 'png', '421', null, '75b755d4-3243-4ef3-b70f-bdebebfe2c88.png', 'upload/store/1/2016/04/06', '0', '426', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426496', '2016-04-06 19:58:53', '', 'png', '423', null, 'd34fcb72-2378-4493-a7ec-e4b8e66efe38.png', 'upload/store/1/2016/04/06', '0', '426', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426497', '2016-04-06 19:59:02', '', 'png', '418', null, '6e4f47e4-f074-4d1c-81f6-a8ab810ad356.png', 'upload/store/1/2016/04/06', '0', '415', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426498', '2017-10-28 16:59:47', '', 'jpg', '120', null, '380314d6-4196-43e5-8197-3d4bc4a852d5.jpg', 'upload/store_banner', '50815', '990', null, null, null);
INSERT INTO `shopping_accessory` VALUES ('426499', '2018-01-20 16:56:39', '', 'jpg', '278', null, '7de4a32e-fd64-4db8-a5de-1b7313375ffc.jpg', 'upload/store/1/2018/01/20', '0', '300', '1', '32768', null);
INSERT INTO `shopping_accessory` VALUES ('426500', '2018-01-20 17:25:42', '', 'jpg', '80', null, '177e4a96-94df-40c6-bb6e-010d4ef2208a.jpg', 'upload/system', '5523', '180', null, null, null);

-- ----------------------------
-- Table structure for `shopping_activity`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_activity`;
CREATE TABLE `shopping_activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ac_begin_time` date DEFAULT NULL,
  `ac_content` longtext,
  `ac_end_time` date DEFAULT NULL,
  `ac_sequence` int(11) NOT NULL,
  `ac_status` int(11) NOT NULL,
  `ac_title` varchar(255) DEFAULT NULL,
  `ac_acc_id` bigint(20) DEFAULT NULL,
  `ac_rebate` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK11BFAD20D8BBB351` (`ac_acc_id`),
  KEY `FKE6E480620059740` (`ac_acc_id`),
  CONSTRAINT `FK11BFAD20D8BBB351` FOREIGN KEY (`ac_acc_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKE6E480620059740` FOREIGN KEY (`ac_acc_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_activity
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_activity_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_activity_goods`;
CREATE TABLE `shopping_activity_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ag_status` int(11) NOT NULL,
  `act_id` bigint(20) DEFAULT NULL,
  `ag_admin_id` bigint(20) DEFAULT NULL,
  `ag_goods_id` bigint(20) DEFAULT NULL,
  `ag_price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA9F9A5DDA6BB88F7` (`ag_admin_id`),
  KEY `FKA9F9A5DD60FB2C1F` (`act_id`),
  KEY `FKA9F9A5DDED2E89CB` (`ag_goods_id`),
  CONSTRAINT `FKA9F9A5DD60FB2C1F` FOREIGN KEY (`act_id`) REFERENCES `shopping_activity` (`id`),
  CONSTRAINT `FKA9F9A5DDA6BB88F7` FOREIGN KEY (`ag_admin_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKA9F9A5DDED2E89CB` FOREIGN KEY (`ag_goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_activity_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_address`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_address`;
CREATE TABLE `shopping_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `area_info` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ABDBC3537B6C51` (`user_id`),
  KEY `FK9ABDBC32FB91D11` (`area_id`) USING BTREE,
  KEY `FK74EB4C1DFA5E3FC2` (`area_id`),
  KEY `FK74EB4C1D1E208F02` (`user_id`),
  CONSTRAINT `FK74EB4C1D1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK74EB4C1DFA5E3FC2` FOREIGN KEY (`area_id`) REFERENCES `shopping_area` (`id`),
  CONSTRAINT `FK9ABDBC32FB91D11` FOREIGN KEY (`area_id`) REFERENCES `shopping_area` (`id`),
  CONSTRAINT `FK9ABDBC3537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_address
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_advert`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_advert`;
CREATE TABLE `shopping_advert` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ad_begin_time` date DEFAULT NULL,
  `ad_click_num` int(11) NOT NULL,
  `ad_end_time` date DEFAULT NULL,
  `ad_gold` int(11) NOT NULL,
  `ad_slide_sequence` int(11) NOT NULL,
  `ad_status` int(11) NOT NULL,
  `ad_text` varchar(255) DEFAULT NULL,
  `ad_title` varchar(255) DEFAULT NULL,
  `ad_url` varchar(255) DEFAULT NULL,
  `ad_acc_id` bigint(20) DEFAULT NULL,
  `ad_ap_id` bigint(20) DEFAULT NULL,
  `ad_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCECB7A255A9A4C35` (`ad_user_id`) USING BTREE,
  KEY `FKCECB7A25296B4EE3` (`ad_ap_id`) USING BTREE,
  KEY `FKCECB7A25409CE030` (`ad_acc_id`) USING BTREE,
  KEY `FKC0F968B253F6EE6` (`ad_user_id`),
  KEY `FKC0F968BFBAD8854` (`ad_ap_id`),
  KEY `FKC0F968B87E6C41F` (`ad_acc_id`),
  CONSTRAINT `FKC0F968B253F6EE6` FOREIGN KEY (`ad_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKC0F968B87E6C41F` FOREIGN KEY (`ad_acc_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKC0F968BFBAD8854` FOREIGN KEY (`ad_ap_id`) REFERENCES `shopping_adv_pos` (`id`),
  CONSTRAINT `FKCECB7A25296B4EE3` FOREIGN KEY (`ad_ap_id`) REFERENCES `shopping_adv_pos` (`id`),
  CONSTRAINT `FKCECB7A25409CE030` FOREIGN KEY (`ad_acc_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKCECB7A255A9A4C35` FOREIGN KEY (`ad_user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_advert
-- ----------------------------
INSERT INTO `shopping_advert` VALUES ('1', '2013-12-23 21:16:27', '', '2013-12-14', '3', '2022-12-31', '0', '0', '1', '', '首页幻灯广告1', '#', '12', '1', '1');
INSERT INTO `shopping_advert` VALUES ('65536', '2013-12-17 17:13:15', '', '2013-12-16', '8', '2022-12-31', '0', '1', '1', '', '首页幻灯图片2', '#1519911921293575#', '10', '1', '1');
INSERT INTO `shopping_advert` VALUES ('65537', '2013-12-17 17:16:37', '', '2013-12-15', '0', '2022-12-31', '0', '2', '1', '', '首页幻灯图片3', '#', '11', '1', '1');
INSERT INTO `shopping_advert` VALUES ('131073', '2013-12-18 12:30:35', '', '2013-12-18', '4', '2022-12-31', '0', '0', '1', '', '首页滚动广告1', '#', '23', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('163840', '2013-12-18 12:51:12', '', '2013-12-18', '3', '2022-12-31', '0', '0', '1', '', '首页滚动广告2', '#', '5', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('163841', '2013-12-18 12:52:29', '', '2013-12-18', '2', '2022-12-31', '0', '0', '1', '', '首页滚动广告3', '#', '22', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('163842', '2013-12-18 12:58:00', '', '2013-12-18', '3', '2022-12-31', '0', '0', '1', '', '首页滚动广告4', '#', '21', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('163843', '2013-12-18 12:58:22', '', '2013-12-18', '5', '2022-12-31', '0', '0', '1', '', '首页滚动广告5', '#', '20', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('163844', '2013-12-18 12:59:02', '', '2013-12-18', '0', '2022-12-31', '0', '0', '1', '', '首页滚动广告6', '#1519911921293575#', '19', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('229376', '2013-12-19 12:02:39', '', '2013-12-18', '0', '2022-12-31', '0', '1', '1', '', '积分商城幻灯1', '#', '18', '229376', '1');
INSERT INTO `shopping_advert` VALUES ('229377', '2013-12-19 12:02:59', '', '2013-12-18', '0', '2022-12-31', '0', '2', '1', '', '积分商城幻灯2', '#', '17', '229376', '1');
INSERT INTO `shopping_advert` VALUES ('229378', '2013-12-19 12:03:31', '', '2013-12-18', '0', '2022-12-31', '0', '3', '1', '', '积分商城幻灯3', '#', '16', '229376', '1');
INSERT INTO `shopping_advert` VALUES ('229379', '2013-12-19 12:03:50', '', '2013-12-18', '0', '2022-12-31', '0', '4', '1', '', '积分商城幻灯4', '#1519911921293575#', '15', '229376', '1');
INSERT INTO `shopping_advert` VALUES ('262144', '2013-12-19 13:58:52', '', '2013-12-18', '2', '2022-12-31', '0', '4', '1', '', '首页幻灯图片4', '#', '14', '1', '1');
INSERT INTO `shopping_advert` VALUES ('262145', '2013-12-19 14:00:54', '', '2013-12-17', '2', '2022-12-31', '0', '5', '1', '', '首页幻灯广告5', '#', '13', '1', '1');
INSERT INTO `shopping_advert` VALUES ('262146', '2014-10-09 14:58:18', '', '2014-10-01', '0', '2022-12-31', '0', '1', '1', '', '闲置商品主页幻灯广告1', '#', '426007', '262146', '1');
INSERT INTO `shopping_advert` VALUES ('262147', '2014-10-09 14:58:45', '', '2014-10-01', '0', '2022-12-31', '0', '2', '1', '', '闲置商品主页幻灯广告2', '#', '426008', '262146', '1');
INSERT INTO `shopping_advert` VALUES ('262148', '2014-10-09 14:59:12', '', '2014-10-01', '0', '2022-12-31', '0', '3', '1', '', '闲置商品主页幻灯广告3', '#', '426009', '262146', '1');
INSERT INTO `shopping_advert` VALUES ('262149', '2015-02-17 11:44:04', '', '2015-01-01', '1', '2024-12-31', '0', '0', '1', '', '首页滚动广告7', '#', '426067', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('262150', '2015-02-17 11:44:32', '', '2015-01-01', '0', '2024-12-31', '0', '0', '1', '', '首页滚动广告8', '#', '426068', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('262151', '2015-02-17 11:50:52', '', '2015-01-01', '0', '2024-12-31', '0', '0', '1', '', '首页滚动广告9', '#', '426069', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('262152', '2015-02-17 11:51:15', '', '2015-01-31', '2', '2024-12-31', '0', '0', '1', '', '首页滚动广告10', '#', '426070', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('262153', '2015-02-17 11:51:55', '', '2015-01-31', '0', '2024-12-31', '0', '0', '1', '', '首页滚动广告11', '#', '426071', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('262154', '2015-02-17 11:52:13', '', '2015-01-31', '0', '2024-12-31', '0', '0', '1', '', '首页滚动广告12', '#', '426072', '32768', '1');
INSERT INTO `shopping_advert` VALUES ('262155', '2016-03-14 10:55:40', '', '2016-03-01', '0', '2026-03-31', '0', '1', '1', '', 'wap首页广告', '#1519911921293575#', '426305', '262157', '1');
INSERT INTO `shopping_advert` VALUES ('262156', '2016-03-14 10:56:12', '', '2016-03-01', '0', '2026-03-31', '0', '2', '1', '', 'wap首页广告2', '#', '426306', '262157', '1');
INSERT INTO `shopping_advert` VALUES ('262157', '2016-03-14 10:56:48', '', '2016-03-01', '0', '2026-03-31', '0', '3', '1', '', 'wap首页广告3', '#', '426307', '262157', '1');

-- ----------------------------
-- Table structure for `shopping_adv_pos`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_adv_pos`;
CREATE TABLE `shopping_adv_pos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ap_acc_url` varchar(255) DEFAULT NULL,
  `ap_code` longtext,
  `ap_content` longtext,
  `ap_height` int(11) NOT NULL,
  `ap_price` int(11) NOT NULL,
  `ap_sale_type` int(11) NOT NULL,
  `ap_show_type` int(11) NOT NULL,
  `ap_status` int(11) NOT NULL,
  `ap_sys_type` int(11) NOT NULL,
  `ap_text` varchar(255) DEFAULT NULL,
  `ap_title` varchar(255) DEFAULT NULL,
  `ap_type` varchar(255) DEFAULT NULL,
  `ap_use_status` int(11) NOT NULL,
  `ap_width` int(11) NOT NULL,
  `ap_acc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAA108971F2AFAA4` (`ap_acc_id`) USING BTREE,
  KEY `FK75E078F16674DE93` (`ap_acc_id`),
  CONSTRAINT `FK75E078F16674DE93` FOREIGN KEY (`ap_acc_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKAA108971F2AFAA4` FOREIGN KEY (`ap_acc_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_adv_pos
-- ----------------------------
INSERT INTO `shopping_adv_pos` VALUES ('1', '2013-12-17 12:31:22', '', '#', null, '首页幻灯广告', '490', '3000', '0', '1', '1', '0', '', '首页幻灯广告', 'indexslide', '0', '1200', '4');
INSERT INTO `shopping_adv_pos` VALUES ('2', '2014-02-25 14:57:28', '', '#1519911921293575#', null, '首页楼层左下方小广告1', '156', '200', '0', '0', '1', '1', '', '首页楼层左下方小广告1', 'img', '0', '156', '262145');
INSERT INTO `shopping_adv_pos` VALUES ('32768', '2013-12-17 13:40:48', '', '', null, '首页滚动广告', '131', '2800', '0', '1', '1', '0', '', '首页四联滚动广告', 'scroll', '0', '259', null);
INSERT INTO `shopping_adv_pos` VALUES ('32769', '2014-02-25 15:05:10', '', '#1519911921293575#', null, '首页楼层左下方小广告2', '156', '200', '0', '0', '1', '1', '', '首页楼层左下方小广告2', 'img', '0', '156', '294913');
INSERT INTO `shopping_adv_pos` VALUES ('32770', '2014-02-25 15:05:42', '', '#1519911921293575#', null, '首页楼层左下方小广告3', '156', '200', '0', '0', '1', '1', '', '首页楼层左下方小广告3', 'img', '0', '156', '294914');
INSERT INTO `shopping_adv_pos` VALUES ('65536', '2013-12-17 13:50:22', '', '#1519911921293575#', null, '首页底部横幅广告', '95', '1500', '0', '1', '1', '0', '', '首页底部横幅广告', 'img', '0', '1000', '6');
INSERT INTO `shopping_adv_pos` VALUES ('98304', '2013-12-17 14:51:11', '', '#1519911921293575#', '', '商品列表页左侧分类下方小广告', '200', '1000', '0', '1', '1', '1', '', '商品列表页左侧分类下方小广告', 'img', '0', '210', '7');
INSERT INTO `shopping_adv_pos` VALUES ('163840', '2013-12-17 18:38:58', '', '#1519911921293575#', null, '首先特别推荐产品上方横幅广告位', '100', '5000', '0', '1', '1', '1', '', '首先特别推荐产品上方横幅广告位', 'img', '0', '1000', '8');
INSERT INTO `shopping_adv_pos` VALUES ('229376', '2013-12-19 11:58:54', '', '#1519911921293575#', null, '积分商城首页幻灯广告位', '249', '3000', '0', '1', '1', '0', '', '积分商城首页幻灯广告位', 'slide', '0', '729', '9');
INSERT INTO `shopping_adv_pos` VALUES ('262144', '2013-12-19 12:53:37', '', '#1519911921293575#', null, '积分商城首页左侧下方广告位', '232', '1800', '0', '1', '1', '0', '', '积分商城首页左侧下方广告位', 'img', '0', '262', null);
INSERT INTO `shopping_adv_pos` VALUES ('262145', '2014-09-25 19:22:43', '', '#', null, '今日特价顶部广告位', '60', '200', '0', '0', '1', '0', '', '天天特价顶部广告位', 'img', '0', '1200', '426006');
INSERT INTO `shopping_adv_pos` VALUES ('262146', '2014-10-09 14:36:34', '', '#1519911921293575#', null, '闲置商品主页幻灯广告', '264', '100', '0', '0', '1', '0', '', '闲置商品主页幻灯广告', 'slide', '1', '580', null);
INSERT INTO `shopping_adv_pos` VALUES ('262147', '2014-10-09 15:17:15', '', '#1519911921293575#', null, '闲置商品主页顶部右上角图片广告', '130', '100', '0', '0', '1', '0', '', '闲置商品主页顶部右上角图片广告', 'img', '0', '180', '426010');
INSERT INTO `shopping_adv_pos` VALUES ('262148', '2015-02-08 18:08:37', '', '#1519911921293575#', null, '首页顶部右侧广告位', '266', '3000', '0', '0', '1', '1', '', '首页顶部右侧上方固定广告位', 'img', '0', '200', '426064');
INSERT INTO `shopping_adv_pos` VALUES ('262149', '2015-02-08 18:12:28', '', 'http://ww.baidu.com#1519911921293575#', null, '首页顶部右侧下方方固定广告位', '266', '3000', '0', '0', '1', '0', '', '首页顶部右侧下方方固定广告位', 'img', '0', '200', '426065');
INSERT INTO `shopping_adv_pos` VALUES ('262150', '2015-02-08 18:44:45', '', '#', null, '首页品牌推荐下方广告位', '127', '2000', '0', '0', '1', '0', '', '首页品牌推荐下方广告位', 'img', '0', '288', '426066');
INSERT INTO `shopping_adv_pos` VALUES ('262151', '2015-02-26 09:29:57', '', '#', null, '商城活动顶部右侧广告', '341', '600', '0', '1', '1', '0', '', '商城活动顶部右侧广告', 'img', '0', '200', '426073');
INSERT INTO `shopping_adv_pos` VALUES ('262152', '2015-02-26 10:02:58', '', '#1519911921293575#', null, '闲置商品主页顶部右下角图片广告', '130', '600', '0', '1', '1', '0', '', '闲置商品主页顶部右下角图片广告', 'img', '0', '180', '426074');
INSERT INTO `shopping_adv_pos` VALUES ('262153', '2015-02-26 10:07:50', '', '#1519911921293575#', null, '闲置商品主页顶部左下角图片广告', '130', '600', '0', '0', '1', '0', '', '闲置商品主页顶部左下角图片广告', 'img', '0', '180', '426075');
INSERT INTO `shopping_adv_pos` VALUES ('262154', '2015-02-26 10:12:38', '', '#1519911921293575#', null, '闲置商品楼层广告', '300', '600', '0', '1', '1', '0', '', '闲置商品楼层广告', 'img', '0', '220', '426076');
INSERT INTO `shopping_adv_pos` VALUES ('262155', '2015-02-28 09:53:52', '', '#1519911921293575#', null, '积分商城幻灯右侧广告', '248', '800', '0', '1', '1', '0', '', '积分商城幻灯右侧广告', 'img', '0', '197', '426077');
INSERT INTO `shopping_adv_pos` VALUES ('262156', '2015-02-28 10:01:27', '', '#1519911921293575#', null, '积分商城右下角广告', '280', '600', '0', '0', '1', '0', '', '积分商城右下角广告', 'img', '0', '262', '426078');
INSERT INTO `shopping_adv_pos` VALUES ('262157', '2016-03-14 10:50:34', '', '#', null, 'wap手机广告', '300', '100', '0', '1', '1', '0', '', 'wap首页slider', 'wapslide', '0', '640', '426304');

-- ----------------------------
-- Table structure for `shopping_album`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_album`;
CREATE TABLE `shopping_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `alblum_info` longtext,
  `album_default` bit(1) NOT NULL,
  `album_name` varchar(255) DEFAULT NULL,
  `album_sequence` int(11) NOT NULL,
  `album_cover_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2FF965FE537B6C51` (`user_id`),
  KEY `FK2FF965FE58AB9D6E` (`album_cover_id`),
  KEY `FK192D24D81E208F02` (`user_id`),
  KEY `FK192D24D89FF5815D` (`album_cover_id`),
  CONSTRAINT `FK192D24D81E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK192D24D89FF5815D` FOREIGN KEY (`album_cover_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK2FF965FE537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK2FF965FE58AB9D6E` FOREIGN KEY (`album_cover_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_album
-- ----------------------------
INSERT INTO `shopping_album` VALUES ('1', '2013-12-24 12:52:13', '', null, '', '默认相册', '-10000', null, '32768');
INSERT INTO `shopping_album` VALUES ('2', '2014-09-25 11:20:36', '', null, '', '默认相册', '-10000', null, '32769');

-- ----------------------------
-- Table structure for `shopping_area`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_area`;
CREATE TABLE `shopping_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `areaName` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `common` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `FK7D6B3B1ED79E13D4` (`parent_id`),
  KEY `FK9DB73904A2433685` (`parent_id`),
  CONSTRAINT `FK7D6B3B1ED79E13D4` FOREIGN KEY (`parent_id`) REFERENCES `shopping_area` (`id`),
  CONSTRAINT `FK9DB73904A2433685` FOREIGN KEY (`parent_id`) REFERENCES `shopping_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4525504 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_area
-- ----------------------------
INSERT INTO `shopping_area` VALUES ('4521984', '2013-07-30 15:37:33', '', '北京市', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4521985', '2013-07-30 15:37:33', '', '北京市', '1', '0', '4521984', '');
INSERT INTO `shopping_area` VALUES ('4521986', '2013-07-30 15:37:33', '', '东城区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521987', '2013-07-30 15:37:33', '', '西城区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521988', '2013-07-30 15:37:33', '', '朝阳区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521989', '2013-07-30 15:37:33', '', '丰台区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521990', '2013-07-30 15:37:33', '', '石景山区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521991', '2013-07-30 15:37:33', '', '海淀区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521992', '2013-07-30 15:37:33', '', '门头沟区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521993', '2013-07-30 15:37:33', '', '房山区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521994', '2013-07-30 15:37:33', '', '通州区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521995', '2013-07-30 15:37:33', '', '顺义区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521996', '2013-07-30 15:37:33', '', '昌平区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521997', '2013-07-30 15:37:33', '', '大兴区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521998', '2013-07-30 15:37:33', '', '怀柔区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4521999', '2013-07-30 15:37:33', '', '平谷区', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4522001', '2013-07-30 15:37:33', '', '密云县', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4522002', '2013-07-30 15:37:33', '', '延庆县', '2', '0', '4521985', '');
INSERT INTO `shopping_area` VALUES ('4522003', '2013-07-30 15:37:33', '', '天津市', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522004', '2013-07-30 15:37:33', '', '天津市', '1', '0', '4522003', '');
INSERT INTO `shopping_area` VALUES ('4522005', '2013-07-30 15:37:33', '', '和平区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522006', '2013-07-30 15:37:33', '', '河东区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522007', '2013-07-30 15:37:33', '', '河西区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522008', '2013-07-30 15:37:34', '', '南开区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522009', '2013-07-30 15:37:34', '', '河北区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522010', '2013-07-30 15:37:34', '', '红桥区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522011', '2013-07-30 15:37:34', '', '东丽区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522012', '2013-07-30 15:37:34', '', '西青区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522013', '2013-07-30 15:37:34', '', '津南区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522014', '2013-07-30 15:37:34', '', '北辰区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522015', '2013-07-30 15:37:34', '', '武清区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522016', '2013-07-30 15:37:34', '', '宝坻区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522017', '2013-07-30 15:37:34', '', '滨海新区', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522019', '2013-07-30 15:37:34', '', '宁河县', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522020', '2013-07-30 15:37:34', '', '静海县', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522021', '2013-07-30 15:37:34', '', '蓟县', '2', '0', '4522004', '');
INSERT INTO `shopping_area` VALUES ('4522022', '2013-07-30 15:37:34', '', '河北省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522023', '2013-07-30 15:37:34', '', '石家庄市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522024', '2013-07-30 15:37:34', '', '市辖区', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522025', '2013-07-30 15:37:34', '', '长安区', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522026', '2013-07-30 15:37:34', '', '桥东区', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522027', '2013-07-30 15:37:34', '', '桥西区', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522028', '2013-07-30 15:37:34', '', '新华区', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522029', '2013-07-30 15:37:34', '', '井陉矿区', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522030', '2013-07-30 15:37:34', '', '裕华区', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522031', '2013-07-30 15:37:34', '', '井陉县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522032', '2013-07-30 15:37:34', '', '正定县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522033', '2013-07-30 15:37:34', '', '栾城县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522034', '2013-07-30 15:37:34', '', '行唐县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522035', '2013-07-30 15:37:34', '', '灵寿县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522036', '2013-07-30 15:37:34', '', '高邑县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522037', '2013-07-30 15:37:34', '', '深泽县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522038', '2013-07-30 15:37:34', '', '赞皇县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522039', '2013-07-30 15:37:34', '', '无极县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522040', '2013-07-30 15:37:34', '', '平山县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522041', '2013-07-30 15:37:34', '', '元氏县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522042', '2013-07-30 15:37:34', '', '赵县', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522043', '2013-07-30 15:37:34', '', '辛集市', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522044', '2013-07-30 15:37:34', '', '藁城市', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522045', '2013-07-30 15:37:34', '', '晋州市', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522046', '2013-07-30 15:37:35', '', '新乐市', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522047', '2013-07-30 15:37:35', '', '鹿泉市', '2', '0', '4522023', '');
INSERT INTO `shopping_area` VALUES ('4522048', '2013-07-30 15:37:35', '', '唐山市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522049', '2013-07-30 15:37:35', '', '市辖区', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522050', '2013-07-30 15:37:35', '', '路南区', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522051', '2013-07-30 15:37:35', '', '路北区', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522052', '2013-07-30 15:37:35', '', '古冶区', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522053', '2013-07-30 15:37:35', '', '开平区', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522054', '2013-07-30 15:37:35', '', '丰南区', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522055', '2013-07-30 15:37:35', '', '丰润区', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522056', '2013-07-30 15:37:35', '', '滦县', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522057', '2013-07-30 15:37:35', '', '滦南县', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522058', '2013-07-30 15:37:35', '', '乐亭县', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522059', '2013-07-30 15:37:35', '', '迁西县', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522060', '2013-07-30 15:37:35', '', '玉田县', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522061', '2013-07-30 15:37:35', '', '唐海县', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522062', '2013-07-30 15:37:35', '', '遵化市', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522063', '2013-07-30 15:37:35', '', '迁安市', '2', '0', '4522048', '');
INSERT INTO `shopping_area` VALUES ('4522064', '2013-07-30 15:37:35', '', '秦皇岛市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522065', '2013-07-30 15:37:35', '', '市辖区', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522066', '2013-07-30 15:37:35', '', '海港区', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522067', '2013-07-30 15:37:35', '', '山海关区', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522068', '2013-07-30 15:37:35', '', '北戴河区', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522069', '2013-07-30 15:37:35', '', '青龙满族自治县', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522070', '2013-07-30 15:37:35', '', '昌黎县', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522071', '2013-07-30 15:37:35', '', '抚宁县', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522072', '2013-07-30 15:37:35', '', '卢龙县', '2', '0', '4522064', '');
INSERT INTO `shopping_area` VALUES ('4522073', '2013-07-30 15:37:35', '', '邯郸市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522074', '2013-07-30 15:37:35', '', '市辖区', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522075', '2013-07-30 15:37:35', '', '邯山区', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522076', '2013-07-30 15:37:35', '', '丛台区', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522077', '2013-07-30 15:37:35', '', '复兴区', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522078', '2013-07-30 15:37:35', '', '峰峰矿区', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522079', '2013-07-30 15:37:35', '', '邯郸县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522080', '2013-07-30 15:37:35', '', '临漳县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522081', '2013-07-30 15:37:35', '', '成安县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522082', '2013-07-30 15:37:35', '', '大名县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522083', '2013-07-30 15:37:35', '', '涉县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522084', '2013-07-30 15:37:35', '', '磁县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522085', '2013-07-30 15:37:36', '', '肥乡县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522086', '2013-07-30 15:37:36', '', '永年县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522087', '2013-07-30 15:37:36', '', '邱县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522088', '2013-07-30 15:37:36', '', '鸡泽县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522089', '2013-07-30 15:37:36', '', '广平县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522090', '2013-07-30 15:37:36', '', '馆陶县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522091', '2013-07-30 15:37:36', '', '魏县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522092', '2013-07-30 15:37:36', '', '曲周县', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522093', '2013-07-30 15:37:36', '', '武安市', '2', '0', '4522073', '');
INSERT INTO `shopping_area` VALUES ('4522094', '2013-07-30 15:37:36', '', '邢台市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522095', '2013-07-30 15:37:36', '', '市辖区', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522096', '2013-07-30 15:37:36', '', '桥东区', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522097', '2013-07-30 15:37:36', '', '桥西区', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522098', '2013-07-30 15:37:36', '', '邢台县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522099', '2013-07-30 15:37:36', '', '临城县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522100', '2013-07-30 15:37:36', '', '内丘县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522101', '2013-07-30 15:37:36', '', '柏乡县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522102', '2013-07-30 15:37:36', '', '隆尧县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522103', '2013-07-30 15:37:36', '', '任县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522104', '2013-07-30 15:37:36', '', '南和县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522105', '2013-07-30 15:37:36', '', '宁晋县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522106', '2013-07-30 15:37:36', '', '巨鹿县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522107', '2013-07-30 15:37:36', '', '新河县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522108', '2013-07-30 15:37:36', '', '广宗县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522109', '2013-07-30 15:37:36', '', '平乡县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522110', '2013-07-30 15:37:36', '', '威县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522111', '2013-07-30 15:37:36', '', '清河县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522112', '2013-07-30 15:37:36', '', '临西县', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522113', '2013-07-30 15:37:36', '', '南宫市', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522114', '2013-07-30 15:37:36', '', '沙河市', '2', '0', '4522094', '');
INSERT INTO `shopping_area` VALUES ('4522115', '2013-07-30 15:37:36', '', '保定市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522116', '2013-07-30 15:37:36', '', '市辖区', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522117', '2013-07-30 15:37:36', '', '新市区', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522118', '2013-07-30 15:37:36', '', '北市区', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522119', '2013-07-30 15:37:36', '', '南市区', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522120', '2013-07-30 15:37:36', '', '满城县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522121', '2013-07-30 15:37:36', '', '清苑县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522122', '2013-07-30 15:37:36', '', '涞水县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522123', '2013-07-30 15:37:36', '', '阜平县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522124', '2013-07-30 15:37:37', '', '徐水县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522125', '2013-07-30 15:37:37', '', '定兴县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522126', '2013-07-30 15:37:37', '', '唐县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522127', '2013-07-30 15:37:37', '', '高阳县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522128', '2013-07-30 15:37:37', '', '容城县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522129', '2013-07-30 15:37:37', '', '涞源县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522130', '2013-07-30 15:37:37', '', '望都县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522131', '2013-07-30 15:37:37', '', '安新县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522132', '2013-07-30 15:37:37', '', '易县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522133', '2013-07-30 15:37:37', '', '曲阳县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522134', '2013-07-30 15:37:37', '', '蠡县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522135', '2013-07-30 15:37:37', '', '顺平县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522136', '2013-07-30 15:37:37', '', '博野县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522137', '2013-07-30 15:37:37', '', '雄县', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522138', '2013-07-30 15:37:37', '', '涿州市', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522139', '2013-07-30 15:37:37', '', '定州市', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522140', '2013-07-30 15:37:37', '', '安国市', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522141', '2013-07-30 15:37:37', '', '高碑店市', '2', '0', '4522115', '');
INSERT INTO `shopping_area` VALUES ('4522142', '2013-07-30 15:37:37', '', '张家口市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522143', '2013-07-30 15:37:37', '', '市辖区', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522144', '2013-07-30 15:37:37', '', '桥东区', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522145', '2013-07-30 15:37:37', '', '桥西区', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522146', '2013-07-30 15:37:37', '', '宣化区', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522147', '2013-07-30 15:37:37', '', '下花园区', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522148', '2013-07-30 15:37:37', '', '宣化县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522149', '2013-07-30 15:37:37', '', '张北县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522150', '2013-07-30 15:37:37', '', '康保县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522151', '2013-07-30 15:37:37', '', '沽源县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522152', '2013-07-30 15:37:37', '', '尚义县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522153', '2013-07-30 15:37:37', '', '蔚县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522154', '2013-07-30 15:37:37', '', '阳原县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522155', '2013-07-30 15:37:37', '', '怀安县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522156', '2013-07-30 15:37:37', '', '万全县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522157', '2013-07-30 15:37:37', '', '怀来县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522158', '2013-07-30 15:37:37', '', '涿鹿县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522159', '2013-07-30 15:37:37', '', '赤城县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522160', '2013-07-30 15:37:37', '', '崇礼县', '2', '0', '4522142', '');
INSERT INTO `shopping_area` VALUES ('4522161', '2013-07-30 15:37:37', '', '承德市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522162', '2013-07-30 15:37:37', '', '市辖区', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522163', '2013-07-30 15:37:38', '', '双桥区', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522164', '2013-07-30 15:37:38', '', '双滦区', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522165', '2013-07-30 15:37:38', '', '鹰手营子矿区', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522166', '2013-07-30 15:37:38', '', '承德县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522167', '2013-07-30 15:37:38', '', '兴隆县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522168', '2013-07-30 15:37:38', '', '平泉县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522169', '2013-07-30 15:37:38', '', '滦平县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522170', '2013-07-30 15:37:38', '', '隆化县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522171', '2013-07-30 15:37:38', '', '丰宁满族自治县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522172', '2013-07-30 15:37:38', '', '宽城满族自治县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522173', '2013-07-30 15:37:38', '', '围场满族蒙古族自治县', '2', '0', '4522161', '');
INSERT INTO `shopping_area` VALUES ('4522174', '2013-07-30 15:37:38', '', '沧州市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522175', '2013-07-30 15:37:38', '', '市辖区', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522176', '2013-07-30 15:37:38', '', '新华区', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522177', '2013-07-30 15:37:38', '', '运河区', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522178', '2013-07-30 15:37:38', '', '沧县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522179', '2013-07-30 15:37:38', '', '青县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522180', '2013-07-30 15:37:38', '', '东光县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522181', '2013-07-30 15:37:38', '', '海兴县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522182', '2013-07-30 15:37:38', '', '盐山县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522183', '2013-07-30 15:37:38', '', '肃宁县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522184', '2013-07-30 15:37:38', '', '南皮县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522185', '2013-07-30 15:37:38', '', '吴桥县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522186', '2013-07-30 15:37:38', '', '献县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522187', '2013-07-30 15:37:38', '', '孟村回族自治县', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522188', '2013-07-30 15:37:38', '', '泊头市', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522189', '2013-07-30 15:37:38', '', '任丘市', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522190', '2013-07-30 15:37:38', '', '黄骅市', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522191', '2013-07-30 15:37:38', '', '河间市', '2', '0', '4522174', '');
INSERT INTO `shopping_area` VALUES ('4522192', '2013-07-30 15:37:38', '', '廊坊市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522193', '2013-07-30 15:37:38', '', '市辖区', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522194', '2013-07-30 15:37:38', '', '安次区', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522195', '2013-07-30 15:37:38', '', '广阳区', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522196', '2013-07-30 15:37:38', '', '固安县', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522197', '2013-07-30 15:37:38', '', '永清县', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522198', '2013-07-30 15:37:38', '', '香河县', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522199', '2013-07-30 15:37:38', '', '大城县', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522200', '2013-07-30 15:37:38', '', '文安县', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522201', '2013-07-30 15:37:39', '', '大厂回族自治县', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522202', '2013-07-30 15:37:39', '', '霸州市', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522203', '2013-07-30 15:37:39', '', '三河市', '2', '0', '4522192', '');
INSERT INTO `shopping_area` VALUES ('4522204', '2013-07-30 15:37:39', '', '衡水市', '1', '0', '4522022', '');
INSERT INTO `shopping_area` VALUES ('4522205', '2013-07-30 15:37:39', '', '市辖区', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522206', '2013-07-30 15:37:39', '', '桃城区', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522207', '2013-07-30 15:37:39', '', '枣强县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522208', '2013-07-30 15:37:39', '', '武邑县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522209', '2013-07-30 15:37:39', '', '武强县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522210', '2013-07-30 15:37:39', '', '饶阳县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522211', '2013-07-30 15:37:39', '', '安平县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522212', '2013-07-30 15:37:39', '', '故城县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522213', '2013-07-30 15:37:39', '', '景县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522214', '2013-07-30 15:37:39', '', '阜城县', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522215', '2013-07-30 15:37:39', '', '冀州市', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522216', '2013-07-30 15:37:39', '', '深州市', '2', '0', '4522204', '');
INSERT INTO `shopping_area` VALUES ('4522217', '2013-07-30 15:37:39', '', '山西省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522218', '2013-07-30 15:37:39', '', '太原市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522219', '2013-07-30 15:37:39', '', '市辖区', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522220', '2013-07-30 15:37:39', '', '小店区', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522221', '2013-07-30 15:37:39', '', '迎泽区', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522222', '2013-07-30 15:37:39', '', '杏花岭区', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522223', '2013-07-30 15:37:39', '', '尖草坪区', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522224', '2013-07-30 15:37:39', '', '万柏林区', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522225', '2013-07-30 15:37:39', '', '晋源区', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522226', '2013-07-30 15:37:39', '', '清徐县', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522227', '2013-07-30 15:37:39', '', '阳曲县', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522228', '2013-07-30 15:37:39', '', '娄烦县', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522229', '2013-07-30 15:37:39', '', '古交市', '2', '0', '4522218', '');
INSERT INTO `shopping_area` VALUES ('4522230', '2013-07-30 15:37:39', '', '大同市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522231', '2013-07-30 15:37:39', '', '市辖区', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522232', '2013-07-30 15:37:39', '', '城区', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522233', '2013-07-30 15:37:39', '', '矿区', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522234', '2013-07-30 15:37:39', '', '南郊区', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522235', '2013-07-30 15:37:39', '', '新荣区', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522236', '2013-07-30 15:37:39', '', '阳高县', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522237', '2013-07-30 15:37:39', '', '天镇县', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522238', '2013-07-30 15:37:40', '', '广灵县', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522239', '2013-07-30 15:37:40', '', '灵丘县', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522240', '2013-07-30 15:37:40', '', '浑源县', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522241', '2013-07-30 15:37:40', '', '左云县', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522242', '2013-07-30 15:37:40', '', '大同县', '2', '0', '4522230', '');
INSERT INTO `shopping_area` VALUES ('4522243', '2013-07-30 15:37:40', '', '阳泉市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522244', '2013-07-30 15:37:40', '', '市辖区', '2', '0', '4522243', '');
INSERT INTO `shopping_area` VALUES ('4522245', '2013-07-30 15:37:40', '', '城区', '2', '0', '4522243', '');
INSERT INTO `shopping_area` VALUES ('4522246', '2013-07-30 15:37:40', '', '矿区', '2', '0', '4522243', '');
INSERT INTO `shopping_area` VALUES ('4522247', '2013-07-30 15:37:40', '', '郊区', '2', '0', '4522243', '');
INSERT INTO `shopping_area` VALUES ('4522248', '2013-07-30 15:37:40', '', '平定县', '2', '0', '4522243', '');
INSERT INTO `shopping_area` VALUES ('4522249', '2013-07-30 15:37:40', '', '盂县', '2', '0', '4522243', '');
INSERT INTO `shopping_area` VALUES ('4522250', '2013-07-30 15:37:40', '', '长治市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522251', '2013-07-30 15:37:40', '', '市辖区', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522252', '2013-07-30 15:37:40', '', '城区', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522253', '2013-07-30 15:37:40', '', '郊区', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522254', '2013-07-30 15:37:40', '', '长治县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522255', '2013-07-30 15:37:40', '', '襄垣县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522256', '2013-07-30 15:37:40', '', '屯留县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522257', '2013-07-30 15:37:40', '', '平顺县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522258', '2013-07-30 15:37:40', '', '黎城县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522259', '2013-07-30 15:37:40', '', '壶关县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522260', '2013-07-30 15:37:40', '', '长子县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522261', '2013-07-30 15:37:40', '', '武乡县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522262', '2013-07-30 15:37:40', '', '沁县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522263', '2013-07-30 15:37:40', '', '沁源县', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522264', '2013-07-30 15:37:40', '', '潞城市', '2', '0', '4522250', '');
INSERT INTO `shopping_area` VALUES ('4522265', '2013-07-30 15:37:40', '', '晋城市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522266', '2013-07-30 15:37:40', '', '市辖区', '2', '0', '4522265', '');
INSERT INTO `shopping_area` VALUES ('4522267', '2013-07-30 15:37:40', '', '城区', '2', '0', '4522265', '');
INSERT INTO `shopping_area` VALUES ('4522268', '2013-07-30 15:37:40', '', '沁水县', '2', '0', '4522265', '');
INSERT INTO `shopping_area` VALUES ('4522269', '2013-07-30 15:37:40', '', '阳城县', '2', '0', '4522265', '');
INSERT INTO `shopping_area` VALUES ('4522270', '2013-07-30 15:37:40', '', '陵川县', '2', '0', '4522265', '');
INSERT INTO `shopping_area` VALUES ('4522271', '2013-07-30 15:37:40', '', '泽州县', '2', '0', '4522265', '');
INSERT INTO `shopping_area` VALUES ('4522272', '2013-07-30 15:37:40', '', '高平市', '2', '0', '4522265', '');
INSERT INTO `shopping_area` VALUES ('4522273', '2013-07-30 15:37:40', '', '朔州市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522274', '2013-07-30 15:37:40', '', '市辖区', '2', '0', '4522273', '');
INSERT INTO `shopping_area` VALUES ('4522275', '2013-07-30 15:37:41', '', '朔城区', '2', '0', '4522273', '');
INSERT INTO `shopping_area` VALUES ('4522276', '2013-07-30 15:37:41', '', '平鲁区', '2', '0', '4522273', '');
INSERT INTO `shopping_area` VALUES ('4522277', '2013-07-30 15:37:41', '', '山阴县', '2', '0', '4522273', '');
INSERT INTO `shopping_area` VALUES ('4522278', '2013-07-30 15:37:41', '', '应县', '2', '0', '4522273', '');
INSERT INTO `shopping_area` VALUES ('4522279', '2013-07-30 15:37:41', '', '右玉县', '2', '0', '4522273', '');
INSERT INTO `shopping_area` VALUES ('4522280', '2013-07-30 15:37:41', '', '怀仁县', '2', '0', '4522273', '');
INSERT INTO `shopping_area` VALUES ('4522281', '2013-07-30 15:37:41', '', '晋中市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522282', '2013-07-30 15:37:41', '', '市辖区', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522283', '2013-07-30 15:37:41', '', '榆次区', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522284', '2013-07-30 15:37:41', '', '榆社县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522285', '2013-07-30 15:37:41', '', '左权县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522286', '2013-07-30 15:37:41', '', '和顺县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522287', '2013-07-30 15:37:41', '', '昔阳县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522288', '2013-07-30 15:37:41', '', '寿阳县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522289', '2013-07-30 15:37:41', '', '太谷县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522290', '2013-07-30 15:37:41', '', '祁县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522291', '2013-07-30 15:37:41', '', '平遥县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522292', '2013-07-30 15:37:41', '', '灵石县', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522293', '2013-07-30 15:37:41', '', '介休市', '2', '0', '4522281', '');
INSERT INTO `shopping_area` VALUES ('4522294', '2013-07-30 15:37:41', '', '运城市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522295', '2013-07-30 15:37:41', '', '市辖区', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522296', '2013-07-30 15:37:41', '', '盐湖区', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522297', '2013-07-30 15:37:41', '', '临猗县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522298', '2013-07-30 15:37:41', '', '万荣县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522299', '2013-07-30 15:37:41', '', '闻喜县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522300', '2013-07-30 15:37:41', '', '稷山县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522301', '2013-07-30 15:37:41', '', '新绛县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522302', '2013-07-30 15:37:41', '', '绛县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522303', '2013-07-30 15:37:41', '', '垣曲县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522304', '2013-07-30 15:37:41', '', '夏县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522305', '2013-07-30 15:37:41', '', '平陆县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522306', '2013-07-30 15:37:41', '', '芮城县', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522307', '2013-07-30 15:37:41', '', '永济市', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522308', '2013-07-30 15:37:42', '', '河津市', '2', '0', '4522294', '');
INSERT INTO `shopping_area` VALUES ('4522309', '2013-07-30 15:37:42', '', '忻州市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522310', '2013-07-30 15:37:42', '', '市辖区', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522311', '2013-07-30 15:37:42', '', '忻府区', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522312', '2013-07-30 15:37:42', '', '定襄县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522313', '2013-07-30 15:37:42', '', '五台县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522314', '2013-07-30 15:37:42', '', '代县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522315', '2013-07-30 15:37:42', '', '繁峙县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522316', '2013-07-30 15:37:42', '', '宁武县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522317', '2013-07-30 15:37:42', '', '静乐县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522318', '2013-07-30 15:37:42', '', '神池县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522319', '2013-07-30 15:37:42', '', '五寨县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522320', '2013-07-30 15:37:42', '', '岢岚县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522321', '2013-07-30 15:37:42', '', '河曲县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522322', '2013-07-30 15:37:42', '', '保德县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522323', '2013-07-30 15:37:42', '', '偏关县', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522324', '2013-07-30 15:37:42', '', '原平市', '2', '0', '4522309', '');
INSERT INTO `shopping_area` VALUES ('4522325', '2013-07-30 15:37:42', '', '临汾市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522326', '2013-07-30 15:37:42', '', '市辖区', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522327', '2013-07-30 15:37:42', '', '尧都区', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522328', '2013-07-30 15:37:42', '', '曲沃县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522329', '2013-07-30 15:37:42', '', '翼城县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522330', '2013-07-30 15:37:42', '', '襄汾县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522331', '2013-07-30 15:37:42', '', '洪洞县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522332', '2013-07-30 15:37:42', '', '古县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522333', '2013-07-30 15:37:42', '', '安泽县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522334', '2013-07-30 15:37:42', '', '浮山县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522335', '2013-07-30 15:37:42', '', '吉县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522336', '2013-07-30 15:37:42', '', '乡宁县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522337', '2013-07-30 15:37:42', '', '大宁县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522338', '2013-07-30 15:37:42', '', '隰县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522339', '2013-07-30 15:37:42', '', '永和县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522340', '2013-07-30 15:37:42', '', '蒲县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522341', '2013-07-30 15:37:42', '', '汾西县', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522342', '2013-07-30 15:37:42', '', '侯马市', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522343', '2013-07-30 15:37:42', '', '霍州市', '2', '0', '4522325', '');
INSERT INTO `shopping_area` VALUES ('4522344', '2013-07-30 15:37:42', '', '吕梁市', '1', '0', '4522217', '');
INSERT INTO `shopping_area` VALUES ('4522345', '2013-07-30 15:37:43', '', '市辖区', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522346', '2013-07-30 15:37:43', '', '离石区', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522347', '2013-07-30 15:37:43', '', '文水县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522348', '2013-07-30 15:37:43', '', '交城县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522349', '2013-07-30 15:37:43', '', '兴县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522350', '2013-07-30 15:37:43', '', '临县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522351', '2013-07-30 15:37:43', '', '柳林县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522352', '2013-07-30 15:37:43', '', '石楼县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522353', '2013-07-30 15:37:43', '', '岚县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522354', '2013-07-30 15:37:43', '', '方山县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522355', '2013-07-30 15:37:43', '', '中阳县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522356', '2013-07-30 15:37:43', '', '交口县', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522357', '2013-07-30 15:37:43', '', '孝义市', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522358', '2013-07-30 15:37:43', '', '汾阳市', '2', '0', '4522344', '');
INSERT INTO `shopping_area` VALUES ('4522359', '2013-07-30 15:37:43', '', '内蒙古自治区', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522360', '2013-07-30 15:37:43', '', '呼和浩特市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522361', '2013-07-30 15:37:43', '', '市辖区', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522362', '2013-07-30 15:37:43', '', '新城区', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522363', '2013-07-30 15:37:43', '', '回民区', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522364', '2013-07-30 15:37:43', '', '玉泉区', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522365', '2013-07-30 15:37:43', '', '赛罕区', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522366', '2013-07-30 15:37:43', '', '土默特左旗', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522367', '2013-07-30 15:37:43', '', '托克托县', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522368', '2013-07-30 15:37:43', '', '和林格尔县', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522369', '2013-07-30 15:37:43', '', '清水河县', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522370', '2013-07-30 15:37:43', '', '武川县', '2', '0', '4522360', '');
INSERT INTO `shopping_area` VALUES ('4522371', '2013-07-30 15:37:43', '', '包头市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522372', '2013-07-30 15:37:43', '', '市辖区', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522373', '2013-07-30 15:37:43', '', '东河区', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522374', '2013-07-30 15:37:43', '', '昆都仑区', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522375', '2013-07-30 15:37:43', '', '青山区', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522376', '2013-07-30 15:37:43', '', '石拐区', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522377', '2013-07-30 15:37:43', '', '白云鄂博矿区', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522378', '2013-07-30 15:37:43', '', '九原区', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522379', '2013-07-30 15:37:44', '', '土默特右旗', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522380', '2013-07-30 15:37:44', '', '固阳县', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522381', '2013-07-30 15:37:44', '', '达尔罕茂明安联合旗', '2', '0', '4522371', '');
INSERT INTO `shopping_area` VALUES ('4522382', '2013-07-30 15:37:44', '', '乌海市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522383', '2013-07-30 15:37:44', '', '市辖区', '2', '0', '4522382', '');
INSERT INTO `shopping_area` VALUES ('4522384', '2013-07-30 15:37:44', '', '海勃湾区', '2', '0', '4522382', '');
INSERT INTO `shopping_area` VALUES ('4522385', '2013-07-30 15:37:44', '', '海南区', '2', '0', '4522382', '');
INSERT INTO `shopping_area` VALUES ('4522386', '2013-07-30 15:37:44', '', '乌达区', '2', '0', '4522382', '');
INSERT INTO `shopping_area` VALUES ('4522387', '2013-07-30 15:37:44', '', '赤峰市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522388', '2013-07-30 15:37:44', '', '市辖区', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522389', '2013-07-30 15:37:44', '', '红山区', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522390', '2013-07-30 15:37:44', '', '元宝山区', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522391', '2013-07-30 15:37:44', '', '松山区', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522392', '2013-07-30 15:37:44', '', '阿鲁科尔沁旗', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522393', '2013-07-30 15:37:44', '', '巴林左旗', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522394', '2013-07-30 15:37:44', '', '巴林右旗', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522395', '2013-07-30 15:37:44', '', '林西县', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522396', '2013-07-30 15:37:44', '', '克什克腾旗', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522397', '2013-07-30 15:37:44', '', '翁牛特旗', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522398', '2013-07-30 15:37:44', '', '喀喇沁旗', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522399', '2013-07-30 15:37:44', '', '宁城县', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522400', '2013-07-30 15:37:44', '', '敖汉旗', '2', '0', '4522387', '');
INSERT INTO `shopping_area` VALUES ('4522401', '2013-07-30 15:37:44', '', '通辽市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522402', '2013-07-30 15:37:44', '', '市辖区', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522403', '2013-07-30 15:37:44', '', '科尔沁区', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522404', '2013-07-30 15:37:44', '', '科尔沁左翼中旗', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522405', '2013-07-30 15:37:44', '', '科尔沁左翼后旗', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522406', '2013-07-30 15:37:44', '', '开鲁县', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522407', '2013-07-30 15:37:44', '', '库伦旗', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522408', '2013-07-30 15:37:44', '', '奈曼旗', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522409', '2013-07-30 15:37:44', '', '扎鲁特旗', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522410', '2013-07-30 15:37:44', '', '霍林郭勒市', '2', '0', '4522401', '');
INSERT INTO `shopping_area` VALUES ('4522411', '2013-07-30 15:37:44', '', '鄂尔多斯市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522412', '2013-07-30 15:37:44', '', '市辖区', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522413', '2013-07-30 15:37:44', '', '东胜区', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522414', '2013-07-30 15:37:44', '', '达拉特旗', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522415', '2013-07-30 15:37:45', '', '准格尔旗', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522416', '2013-07-30 15:37:45', '', '鄂托克前旗', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522417', '2013-07-30 15:37:45', '', '鄂托克旗', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522418', '2013-07-30 15:37:45', '', '杭锦旗', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522419', '2013-07-30 15:37:45', '', '乌审旗', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522420', '2013-07-30 15:37:45', '', '伊金霍洛旗', '2', '0', '4522411', '');
INSERT INTO `shopping_area` VALUES ('4522421', '2013-07-30 15:37:45', '', '呼伦贝尔市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522422', '2013-07-30 15:37:45', '', '市辖区', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522423', '2013-07-30 15:37:45', '', '海拉尔区', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522424', '2013-07-30 15:37:45', '', '阿荣旗', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522425', '2013-07-30 15:37:45', '', '莫力达瓦达斡尔族自治旗', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522426', '2013-07-30 15:37:45', '', '鄂伦春自治旗', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522427', '2013-07-30 15:37:45', '', '鄂温克族自治旗', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522428', '2013-07-30 15:37:45', '', '陈巴尔虎旗', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522429', '2013-07-30 15:37:45', '', '新巴尔虎左旗', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522430', '2013-07-30 15:37:45', '', '新巴尔虎右旗', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522431', '2013-07-30 15:37:45', '', '满洲里市', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522432', '2013-07-30 15:37:45', '', '牙克石市', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522433', '2013-07-30 15:37:45', '', '扎兰屯市', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522434', '2013-07-30 15:37:45', '', '额尔古纳市', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522435', '2013-07-30 15:37:45', '', '根河市', '2', '0', '4522421', '');
INSERT INTO `shopping_area` VALUES ('4522436', '2013-07-30 15:37:45', '', '巴彦淖尔市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522437', '2013-07-30 15:37:45', '', '市辖区', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522438', '2013-07-30 15:37:45', '', '临河区', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522439', '2013-07-30 15:37:45', '', '五原县', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522440', '2013-07-30 15:37:45', '', '磴口县', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522441', '2013-07-30 15:37:45', '', '乌拉特前旗', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522442', '2013-07-30 15:37:45', '', '乌拉特中旗', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522443', '2013-07-30 15:37:45', '', '乌拉特后旗', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522444', '2013-07-30 15:37:45', '', '杭锦后旗', '2', '0', '4522436', '');
INSERT INTO `shopping_area` VALUES ('4522445', '2013-07-30 15:37:45', '', '乌兰察布市', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522446', '2013-07-30 15:37:45', '', '市辖区', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522447', '2013-07-30 15:37:45', '', '集宁区', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522448', '2013-07-30 15:37:45', '', '卓资县', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522449', '2013-07-30 15:37:46', '', '化德县', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522450', '2013-07-30 15:37:46', '', '商都县', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522451', '2013-07-30 15:37:46', '', '兴和县', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522452', '2013-07-30 15:37:46', '', '凉城县', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522453', '2013-07-30 15:37:46', '', '察哈尔右翼前旗', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522454', '2013-07-30 15:37:46', '', '察哈尔右翼中旗', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522455', '2013-07-30 15:37:46', '', '察哈尔右翼后旗', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522456', '2013-07-30 15:37:46', '', '四子王旗', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522457', '2013-07-30 15:37:46', '', '丰镇市', '2', '0', '4522445', '');
INSERT INTO `shopping_area` VALUES ('4522458', '2013-07-30 15:37:46', '', '兴安盟', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522459', '2013-07-30 15:37:46', '', '乌兰浩特市', '2', '0', '4522458', '');
INSERT INTO `shopping_area` VALUES ('4522460', '2013-07-30 15:37:46', '', '阿尔山市', '2', '0', '4522458', '');
INSERT INTO `shopping_area` VALUES ('4522461', '2013-07-30 15:37:46', '', '科尔沁右翼前旗', '2', '0', '4522458', '');
INSERT INTO `shopping_area` VALUES ('4522462', '2013-07-30 15:37:46', '', '科尔沁右翼中旗', '2', '0', '4522458', '');
INSERT INTO `shopping_area` VALUES ('4522463', '2013-07-30 15:37:46', '', '扎赉特旗', '2', '0', '4522458', '');
INSERT INTO `shopping_area` VALUES ('4522464', '2013-07-30 15:37:46', '', '突泉县', '2', '0', '4522458', '');
INSERT INTO `shopping_area` VALUES ('4522465', '2013-07-30 15:37:46', '', '锡林郭勒盟', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522466', '2013-07-30 15:37:46', '', '二连浩特市', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522467', '2013-07-30 15:37:46', '', '锡林浩特市', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522468', '2013-07-30 15:37:46', '', '阿巴嘎旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522469', '2013-07-30 15:37:46', '', '苏尼特左旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522470', '2013-07-30 15:37:46', '', '苏尼特右旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522471', '2013-07-30 15:37:46', '', '东乌珠穆沁旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522472', '2013-07-30 15:37:46', '', '西乌珠穆沁旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522473', '2013-07-30 15:37:46', '', '太仆寺旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522474', '2013-07-30 15:37:46', '', '镶黄旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522475', '2013-07-30 15:37:46', '', '正镶白旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522476', '2013-07-30 15:37:46', '', '正蓝旗', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522477', '2013-07-30 15:37:46', '', '多伦县', '2', '0', '4522465', '');
INSERT INTO `shopping_area` VALUES ('4522478', '2013-07-30 15:37:46', '', '阿拉善盟', '1', '0', '4522359', '');
INSERT INTO `shopping_area` VALUES ('4522479', '2013-07-30 15:37:46', '', '阿拉善左旗', '2', '0', '4522478', '');
INSERT INTO `shopping_area` VALUES ('4522480', '2013-07-30 15:37:46', '', '阿拉善右旗', '2', '0', '4522478', '');
INSERT INTO `shopping_area` VALUES ('4522481', '2013-07-30 15:37:47', '', '额济纳旗', '2', '0', '4522478', '');
INSERT INTO `shopping_area` VALUES ('4522482', '2013-07-30 15:37:47', '', '辽宁省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522483', '2013-07-30 15:37:47', '', '沈阳市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522484', '2013-07-30 15:37:47', '', '浑南新区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522485', '2013-07-30 15:37:47', '', '和平区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522486', '2013-07-30 15:37:47', '', '沈河区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522487', '2013-07-30 15:37:47', '', '大东区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522488', '2013-07-30 15:37:47', '', '皇姑区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522489', '2013-07-30 15:37:47', '', '铁西区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522490', '2013-07-30 15:37:47', '', '苏家屯区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522491', '2013-07-30 15:37:47', '', '东陵区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522492', '2013-07-30 15:37:47', '', '沈北新区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522493', '2013-07-30 15:37:47', '', '于洪区', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522494', '2013-07-30 15:37:47', '', '辽中县', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522495', '2013-07-30 15:37:47', '', '康平县', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522496', '2013-07-30 15:37:47', '', '法库县', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522497', '2013-07-30 15:37:47', '', '新民市', '2', '0', '4522483', '');
INSERT INTO `shopping_area` VALUES ('4522498', '2013-07-30 15:37:47', '', '大连市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522499', '2013-07-30 15:37:47', '', '市辖区', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522500', '2013-07-30 15:37:47', '', '中山区', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522501', '2013-07-30 15:37:47', '', '西岗区', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522502', '2013-07-30 15:37:47', '', '沙河口区', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522503', '2013-07-30 15:37:47', '', '甘井子区', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522504', '2013-07-30 15:37:47', '', '旅顺口区', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522505', '2013-07-30 15:37:47', '', '金州区', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522506', '2013-07-30 15:37:47', '', '长海县', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522507', '2013-07-30 15:37:47', '', '瓦房店市', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522508', '2013-07-30 15:37:47', '', '普兰店市', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522509', '2013-07-30 15:37:47', '', '庄河市', '2', '0', '4522498', '');
INSERT INTO `shopping_area` VALUES ('4522510', '2013-07-30 15:37:47', '', '鞍山市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522511', '2013-07-30 15:37:47', '', '市辖区', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522512', '2013-07-30 15:37:48', '', '铁东区', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522513', '2013-07-30 15:37:48', '', '铁西区', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522514', '2013-07-30 15:37:48', '', '立山区', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522515', '2013-07-30 15:37:48', '', '千山区', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522516', '2013-07-30 15:37:48', '', '台安县', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522517', '2013-07-30 15:37:48', '', '岫岩满族自治县', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522518', '2013-07-30 15:37:48', '', '海城市', '2', '0', '4522510', '');
INSERT INTO `shopping_area` VALUES ('4522519', '2013-07-30 15:37:48', '', '抚顺市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522520', '2013-07-30 15:37:48', '', '市辖区', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522521', '2013-07-30 15:37:48', '', '新抚区', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522522', '2013-07-30 15:37:48', '', '东洲区', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522523', '2013-07-30 15:37:48', '', '望花区', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522524', '2013-07-30 15:37:48', '', '顺城区', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522525', '2013-07-30 15:37:48', '', '抚顺县', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522526', '2013-07-30 15:37:48', '', '新宾满族自治县', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522527', '2013-07-30 15:37:48', '', '清原满族自治县', '2', '0', '4522519', '');
INSERT INTO `shopping_area` VALUES ('4522528', '2013-07-30 15:37:48', '', '本溪市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522529', '2013-07-30 15:37:48', '', '市辖区', '2', '0', '4522528', '');
INSERT INTO `shopping_area` VALUES ('4522530', '2013-07-30 15:37:48', '', '平山区', '2', '0', '4522528', '');
INSERT INTO `shopping_area` VALUES ('4522531', '2013-07-30 15:37:48', '', '溪湖区', '2', '0', '4522528', '');
INSERT INTO `shopping_area` VALUES ('4522532', '2013-07-30 15:37:48', '', '明山区', '2', '0', '4522528', '');
INSERT INTO `shopping_area` VALUES ('4522533', '2013-07-30 15:37:48', '', '南芬区', '2', '0', '4522528', '');
INSERT INTO `shopping_area` VALUES ('4522534', '2013-07-30 15:37:48', '', '本溪满族自治县', '2', '0', '4522528', '');
INSERT INTO `shopping_area` VALUES ('4522535', '2013-07-30 15:37:48', '', '桓仁满族自治县', '2', '0', '4522528', '');
INSERT INTO `shopping_area` VALUES ('4522536', '2013-07-30 15:37:48', '', '丹东市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522537', '2013-07-30 15:37:48', '', '市辖区', '2', '0', '4522536', '');
INSERT INTO `shopping_area` VALUES ('4522538', '2013-07-30 15:37:48', '', '元宝区', '2', '0', '4522536', '');
INSERT INTO `shopping_area` VALUES ('4522539', '2013-07-30 15:37:48', '', '振兴区', '2', '0', '4522536', '');
INSERT INTO `shopping_area` VALUES ('4522540', '2013-07-30 15:37:48', '', '振安区', '2', '0', '4522536', '');
INSERT INTO `shopping_area` VALUES ('4522541', '2013-07-30 15:37:48', '', '宽甸满族自治县', '2', '0', '4522536', '');
INSERT INTO `shopping_area` VALUES ('4522542', '2013-07-30 15:37:48', '', '东港市', '2', '0', '4522536', '');
INSERT INTO `shopping_area` VALUES ('4522543', '2013-07-30 15:37:49', '', '凤城市', '2', '0', '4522536', '');
INSERT INTO `shopping_area` VALUES ('4522544', '2013-07-30 15:37:49', '', '锦州市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522545', '2013-07-30 15:37:49', '', '市辖区', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522546', '2013-07-30 15:37:49', '', '古塔区', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522547', '2013-07-30 15:37:49', '', '凌河区', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522548', '2013-07-30 15:37:49', '', '太和区', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522549', '2013-07-30 15:37:49', '', '黑山县', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522550', '2013-07-30 15:37:49', '', '义县', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522551', '2013-07-30 15:37:49', '', '凌海市', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522552', '2013-07-30 15:37:49', '', '北镇市', '2', '0', '4522544', '');
INSERT INTO `shopping_area` VALUES ('4522553', '2013-07-30 15:37:49', '', '营口市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522554', '2013-07-30 15:37:49', '', '市辖区', '2', '0', '4522553', '');
INSERT INTO `shopping_area` VALUES ('4522555', '2013-07-30 15:37:49', '', '站前区', '2', '0', '4522553', '');
INSERT INTO `shopping_area` VALUES ('4522556', '2013-07-30 15:37:49', '', '西市区', '2', '0', '4522553', '');
INSERT INTO `shopping_area` VALUES ('4522557', '2013-07-30 15:37:49', '', '鲅鱼圈区', '2', '0', '4522553', '');
INSERT INTO `shopping_area` VALUES ('4522558', '2013-07-30 15:37:49', '', '老边区', '2', '0', '4522553', '');
INSERT INTO `shopping_area` VALUES ('4522559', '2013-07-30 15:37:49', '', '盖州市', '2', '0', '4522553', '');
INSERT INTO `shopping_area` VALUES ('4522560', '2013-07-30 15:37:49', '', '大石桥市', '2', '0', '4522553', '');
INSERT INTO `shopping_area` VALUES ('4522561', '2013-07-30 15:37:49', '', '阜新市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522562', '2013-07-30 15:37:49', '', '市辖区', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522563', '2013-07-30 15:37:49', '', '海州区', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522564', '2013-07-30 15:37:49', '', '新邱区', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522565', '2013-07-30 15:37:49', '', '太平区', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522566', '2013-07-30 15:37:49', '', '清河门区', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522567', '2013-07-30 15:37:49', '', '细河区', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522568', '2013-07-30 15:37:49', '', '阜新蒙古族自治县', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522569', '2013-07-30 15:37:49', '', '彰武县', '2', '0', '4522561', '');
INSERT INTO `shopping_area` VALUES ('4522570', '2013-07-30 15:37:49', '', '辽阳市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522571', '2013-07-30 15:37:50', '', '市辖区', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522572', '2013-07-30 15:37:50', '', '白塔区', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522573', '2013-07-30 15:37:50', '', '文圣区', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522574', '2013-07-30 15:37:50', '', '宏伟区', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522575', '2013-07-30 15:37:50', '', '弓长岭区', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522576', '2013-07-30 15:37:50', '', '太子河区', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522577', '2013-07-30 15:37:50', '', '辽阳县', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522578', '2013-07-30 15:37:50', '', '灯塔市', '2', '0', '4522570', '');
INSERT INTO `shopping_area` VALUES ('4522579', '2013-07-30 15:37:50', '', '盘锦市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522580', '2013-07-30 15:37:50', '', '市辖区', '2', '0', '4522579', '');
INSERT INTO `shopping_area` VALUES ('4522581', '2013-07-30 15:37:50', '', '双台子区', '2', '0', '4522579', '');
INSERT INTO `shopping_area` VALUES ('4522582', '2013-07-30 15:37:50', '', '兴隆台区', '2', '0', '4522579', '');
INSERT INTO `shopping_area` VALUES ('4522583', '2013-07-30 15:37:50', '', '大洼县', '2', '0', '4522579', '');
INSERT INTO `shopping_area` VALUES ('4522584', '2013-07-30 15:37:50', '', '盘山县', '2', '0', '4522579', '');
INSERT INTO `shopping_area` VALUES ('4522585', '2013-07-30 15:37:50', '', '铁岭市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522586', '2013-07-30 15:37:50', '', '市辖区', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522587', '2013-07-30 15:37:50', '', '银州区', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522588', '2013-07-30 15:37:50', '', '清河区', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522589', '2013-07-30 15:37:50', '', '铁岭县', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522590', '2013-07-30 15:37:50', '', '西丰县', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522591', '2013-07-30 15:37:50', '', '昌图县', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522592', '2013-07-30 15:37:50', '', '调兵山市', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522593', '2013-07-30 15:37:50', '', '开原市', '2', '0', '4522585', '');
INSERT INTO `shopping_area` VALUES ('4522594', '2013-07-30 15:37:50', '', '朝阳市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522595', '2013-07-30 15:37:50', '', '市辖区', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522596', '2013-07-30 15:37:50', '', '双塔区', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522597', '2013-07-30 15:37:50', '', '龙城区', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522598', '2013-07-30 15:37:50', '', '朝阳县', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522599', '2013-07-30 15:37:51', '', '建平县', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522600', '2013-07-30 15:37:51', '', '喀喇沁左翼蒙古族自治县', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522601', '2013-07-30 15:37:51', '', '北票市', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522602', '2013-07-30 15:37:51', '', '凌源市', '2', '0', '4522594', '');
INSERT INTO `shopping_area` VALUES ('4522603', '2013-07-30 15:37:51', '', '葫芦岛市', '1', '0', '4522482', '');
INSERT INTO `shopping_area` VALUES ('4522604', '2013-07-30 15:37:51', '', '市辖区', '2', '0', '4522603', '');
INSERT INTO `shopping_area` VALUES ('4522605', '2013-07-30 15:37:51', '', '连山区', '2', '0', '4522603', '');
INSERT INTO `shopping_area` VALUES ('4522606', '2013-07-30 15:37:51', '', '龙港区', '2', '0', '4522603', '');
INSERT INTO `shopping_area` VALUES ('4522607', '2013-07-30 15:37:51', '', '南票区', '2', '0', '4522603', '');
INSERT INTO `shopping_area` VALUES ('4522608', '2013-07-30 15:37:51', '', '绥中县', '2', '0', '4522603', '');
INSERT INTO `shopping_area` VALUES ('4522609', '2013-07-30 15:37:51', '', '建昌县', '2', '0', '4522603', '');
INSERT INTO `shopping_area` VALUES ('4522610', '2013-07-30 15:37:51', '', '兴城市', '2', '0', '4522603', '');
INSERT INTO `shopping_area` VALUES ('4522611', '2013-07-30 15:37:51', '', '吉林省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522612', '2013-07-30 15:37:51', '', '长春市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522613', '2013-07-30 15:37:51', '', '市辖区', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522614', '2013-07-30 15:37:51', '', '南关区', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522615', '2013-07-30 15:37:51', '', '宽城区', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522616', '2013-07-30 15:37:51', '', '朝阳区', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522617', '2013-07-30 15:37:51', '', '二道区', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522618', '2013-07-30 15:37:51', '', '绿园区', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522619', '2013-07-30 15:37:51', '', '双阳区', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522620', '2013-07-30 15:37:51', '', '农安县', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522621', '2013-07-30 15:37:51', '', '九台市', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522622', '2013-07-30 15:37:51', '', '榆树市', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522623', '2013-07-30 15:37:51', '', '德惠市', '2', '0', '4522612', '');
INSERT INTO `shopping_area` VALUES ('4522624', '2013-07-30 15:37:51', '', '吉林市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522625', '2013-07-30 15:37:51', '', '市辖区', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522626', '2013-07-30 15:37:52', '', '昌邑区', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522627', '2013-07-30 15:37:52', '', '龙潭区', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522628', '2013-07-30 15:37:52', '', '船营区', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522629', '2013-07-30 15:37:52', '', '丰满区', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522630', '2013-07-30 15:37:52', '', '永吉县', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522631', '2013-07-30 15:37:52', '', '蛟河市', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522632', '2013-07-30 15:37:52', '', '桦甸市', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522633', '2013-07-30 15:37:52', '', '舒兰市', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522634', '2013-07-30 15:37:52', '', '磐石市', '2', '0', '4522624', '');
INSERT INTO `shopping_area` VALUES ('4522635', '2013-07-30 15:37:52', '', '四平市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522636', '2013-07-30 15:37:52', '', '市辖区', '2', '0', '4522635', '');
INSERT INTO `shopping_area` VALUES ('4522637', '2013-07-30 15:37:52', '', '铁西区', '2', '0', '4522635', '');
INSERT INTO `shopping_area` VALUES ('4522638', '2013-07-30 15:37:52', '', '铁东区', '2', '0', '4522635', '');
INSERT INTO `shopping_area` VALUES ('4522639', '2013-07-30 15:37:52', '', '梨树县', '2', '0', '4522635', '');
INSERT INTO `shopping_area` VALUES ('4522640', '2013-07-30 15:37:52', '', '伊通满族自治县', '2', '0', '4522635', '');
INSERT INTO `shopping_area` VALUES ('4522641', '2013-07-30 15:37:52', '', '公主岭市', '2', '0', '4522635', '');
INSERT INTO `shopping_area` VALUES ('4522642', '2013-07-30 15:37:52', '', '双辽市', '2', '0', '4522635', '');
INSERT INTO `shopping_area` VALUES ('4522643', '2013-07-30 15:37:52', '', '辽源市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522644', '2013-07-30 15:37:52', '', '市辖区', '2', '0', '4522643', '');
INSERT INTO `shopping_area` VALUES ('4522645', '2013-07-30 15:37:52', '', '龙山区', '2', '0', '4522643', '');
INSERT INTO `shopping_area` VALUES ('4522646', '2013-07-30 15:37:52', '', '西安区', '2', '0', '4522643', '');
INSERT INTO `shopping_area` VALUES ('4522647', '2013-07-30 15:37:52', '', '东丰县', '2', '0', '4522643', '');
INSERT INTO `shopping_area` VALUES ('4522648', '2013-07-30 15:37:52', '', '东辽县', '2', '0', '4522643', '');
INSERT INTO `shopping_area` VALUES ('4522649', '2013-07-30 15:37:52', '', '通化市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522650', '2013-07-30 15:37:52', '', '市辖区', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522651', '2013-07-30 15:37:52', '', '东昌区', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522652', '2013-07-30 15:37:52', '', '二道江区', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522653', '2013-07-30 15:37:52', '', '通化县', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522654', '2013-07-30 15:37:53', '', '辉南县', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522655', '2013-07-30 15:37:53', '', '柳河县', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522656', '2013-07-30 15:37:53', '', '梅河口市', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522657', '2013-07-30 15:37:53', '', '集安市', '2', '0', '4522649', '');
INSERT INTO `shopping_area` VALUES ('4522658', '2013-07-30 15:37:53', '', '白山市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522659', '2013-07-30 15:37:53', '', '市辖区', '2', '0', '4522658', '');
INSERT INTO `shopping_area` VALUES ('4522660', '2013-07-30 15:37:53', '', '八道江区', '2', '0', '4522658', '');
INSERT INTO `shopping_area` VALUES ('4522661', '2013-07-30 15:37:53', '', '江源区', '2', '0', '4522658', '');
INSERT INTO `shopping_area` VALUES ('4522662', '2013-07-30 15:37:53', '', '抚松县', '2', '0', '4522658', '');
INSERT INTO `shopping_area` VALUES ('4522663', '2013-07-30 15:37:53', '', '靖宇县', '2', '0', '4522658', '');
INSERT INTO `shopping_area` VALUES ('4522664', '2013-07-30 15:37:53', '', '长白朝鲜族自治县', '2', '0', '4522658', '');
INSERT INTO `shopping_area` VALUES ('4522665', '2013-07-30 15:37:53', '', '临江市', '2', '0', '4522658', '');
INSERT INTO `shopping_area` VALUES ('4522666', '2013-07-30 15:37:53', '', '松原市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522667', '2013-07-30 15:37:53', '', '市辖区', '2', '0', '4522666', '');
INSERT INTO `shopping_area` VALUES ('4522668', '2013-07-30 15:37:53', '', '宁江区', '2', '0', '4522666', '');
INSERT INTO `shopping_area` VALUES ('4522669', '2013-07-30 15:37:53', '', '前郭尔罗斯蒙古族自治县', '2', '0', '4522666', '');
INSERT INTO `shopping_area` VALUES ('4522670', '2013-07-30 15:37:53', '', '长岭县', '2', '0', '4522666', '');
INSERT INTO `shopping_area` VALUES ('4522671', '2013-07-30 15:37:53', '', '乾安县', '2', '0', '4522666', '');
INSERT INTO `shopping_area` VALUES ('4522672', '2013-07-30 15:37:53', '', '扶余县', '2', '0', '4522666', '');
INSERT INTO `shopping_area` VALUES ('4522673', '2013-07-30 15:37:53', '', '白城市', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522674', '2013-07-30 15:37:53', '', '市辖区', '2', '0', '4522673', '');
INSERT INTO `shopping_area` VALUES ('4522675', '2013-07-30 15:37:53', '', '洮北区', '2', '0', '4522673', '');
INSERT INTO `shopping_area` VALUES ('4522676', '2013-07-30 15:37:53', '', '镇赉县', '2', '0', '4522673', '');
INSERT INTO `shopping_area` VALUES ('4522677', '2013-07-30 15:37:53', '', '通榆县', '2', '0', '4522673', '');
INSERT INTO `shopping_area` VALUES ('4522678', '2013-07-30 15:37:53', '', '洮南市', '2', '0', '4522673', '');
INSERT INTO `shopping_area` VALUES ('4522679', '2013-07-30 15:37:53', '', '大安市', '2', '0', '4522673', '');
INSERT INTO `shopping_area` VALUES ('4522680', '2013-07-30 15:37:53', '', '延边朝鲜族自治州', '1', '0', '4522611', '');
INSERT INTO `shopping_area` VALUES ('4522681', '2013-07-30 15:37:53', '', '延吉市', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522682', '2013-07-30 15:37:54', '', '图们市', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522683', '2013-07-30 15:37:54', '', '敦化市', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522684', '2013-07-30 15:37:54', '', '珲春市', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522685', '2013-07-30 15:37:54', '', '龙井市', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522686', '2013-07-30 15:37:54', '', '和龙市', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522687', '2013-07-30 15:37:54', '', '汪清县', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522688', '2013-07-30 15:37:54', '', '安图县', '2', '0', '4522680', '');
INSERT INTO `shopping_area` VALUES ('4522689', '2013-07-30 15:37:54', '', '黑龙江省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522690', '2013-07-30 15:37:54', '', '哈尔滨市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522691', '2013-07-30 15:37:54', '', '市辖区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522692', '2013-07-30 15:37:54', '', '道里区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522693', '2013-07-30 15:37:54', '', '南岗区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522694', '2013-07-30 15:37:54', '', '道外区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522695', '2013-07-30 15:37:54', '', '平房区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522696', '2013-07-30 15:37:54', '', '松北区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522697', '2013-07-30 15:37:54', '', '香坊区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522698', '2013-07-30 15:37:54', '', '呼兰区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522699', '2013-07-30 15:37:54', '', '阿城区', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522700', '2013-07-30 15:37:54', '', '依兰县', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522701', '2013-07-30 15:37:54', '', '方正县', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522702', '2013-07-30 15:37:54', '', '宾县', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522703', '2013-07-30 15:37:54', '', '巴彦县', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522704', '2013-07-30 15:37:54', '', '木兰县', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522705', '2013-07-30 15:37:54', '', '通河县', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522706', '2013-07-30 15:37:54', '', '延寿县', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522707', '2013-07-30 15:37:54', '', '双城市', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522708', '2013-07-30 15:37:54', '', '尚志市', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522709', '2013-07-30 15:37:55', '', '五常市', '2', '0', '4522690', '');
INSERT INTO `shopping_area` VALUES ('4522710', '2013-07-30 15:37:55', '', '齐齐哈尔市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522711', '2013-07-30 15:37:55', '', '市辖区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522712', '2013-07-30 15:37:55', '', '龙沙区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522713', '2013-07-30 15:37:55', '', '建华区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522714', '2013-07-30 15:37:55', '', '铁锋区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522715', '2013-07-30 15:37:55', '', '昂昂溪区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522716', '2013-07-30 15:37:55', '', '富拉尔基区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522717', '2013-07-30 15:37:55', '', '碾子山区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522718', '2013-07-30 15:37:55', '', '梅里斯达斡尔族区', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522719', '2013-07-30 15:37:55', '', '龙江县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522720', '2013-07-30 15:37:55', '', '依安县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522721', '2013-07-30 15:37:55', '', '泰来县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522722', '2013-07-30 15:37:55', '', '甘南县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522723', '2013-07-30 15:37:55', '', '富裕县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522724', '2013-07-30 15:37:55', '', '克山县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522725', '2013-07-30 15:37:55', '', '克东县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522726', '2013-07-30 15:37:55', '', '拜泉县', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522727', '2013-07-30 15:37:55', '', '讷河市', '2', '0', '4522710', '');
INSERT INTO `shopping_area` VALUES ('4522728', '2013-07-30 15:37:55', '', '鸡西市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522729', '2013-07-30 15:37:55', '', '市辖区', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522730', '2013-07-30 15:37:55', '', '鸡冠区', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522731', '2013-07-30 15:37:55', '', '恒山区', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522732', '2013-07-30 15:37:56', '', '滴道区', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522733', '2013-07-30 15:37:56', '', '梨树区', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522734', '2013-07-30 15:37:56', '', '城子河区', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522735', '2013-07-30 15:37:56', '', '麻山区', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522736', '2013-07-30 15:37:56', '', '鸡东县', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522737', '2013-07-30 15:37:56', '', '虎林市', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522738', '2013-07-30 15:37:56', '', '密山市', '2', '0', '4522728', '');
INSERT INTO `shopping_area` VALUES ('4522739', '2013-07-30 15:37:56', '', '鹤岗市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522740', '2013-07-30 15:37:56', '', '市辖区', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522741', '2013-07-30 15:37:56', '', '向阳区', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522742', '2013-07-30 15:37:56', '', '工农区', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522743', '2013-07-30 15:37:56', '', '南山区', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522744', '2013-07-30 15:37:56', '', '兴安区', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522745', '2013-07-30 15:37:56', '', '东山区', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522746', '2013-07-30 15:37:56', '', '兴山区', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522747', '2013-07-30 15:37:56', '', '萝北县', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522748', '2013-07-30 15:37:56', '', '绥滨县', '2', '0', '4522739', '');
INSERT INTO `shopping_area` VALUES ('4522749', '2013-07-30 15:37:56', '', '双鸭山市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522750', '2013-07-30 15:37:56', '', '市辖区', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522751', '2013-07-30 15:37:56', '', '尖山区', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522752', '2013-07-30 15:37:56', '', '岭东区', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522753', '2013-07-30 15:37:56', '', '四方台区', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522754', '2013-07-30 15:37:56', '', '宝山区', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522755', '2013-07-30 15:37:56', '', '集贤县', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522756', '2013-07-30 15:37:57', '', '友谊县', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522757', '2013-07-30 15:37:57', '', '宝清县', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522758', '2013-07-30 15:37:57', '', '饶河县', '2', '0', '4522749', '');
INSERT INTO `shopping_area` VALUES ('4522759', '2013-07-30 15:37:57', '', '大庆市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522760', '2013-07-30 15:37:57', '', '市辖区', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522761', '2013-07-30 15:37:57', '', '萨尔图区', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522762', '2013-07-30 15:37:57', '', '龙凤区', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522763', '2013-07-30 15:37:57', '', '让胡路区', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522764', '2013-07-30 15:37:57', '', '红岗区', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522765', '2013-07-30 15:37:57', '', '大同区', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522766', '2013-07-30 15:37:57', '', '肇州县', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522767', '2013-07-30 15:37:57', '', '肇源县', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522768', '2013-07-30 15:37:57', '', '林甸县', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522769', '2013-07-30 15:37:57', '', '杜尔伯特蒙古族自治县', '2', '0', '4522759', '');
INSERT INTO `shopping_area` VALUES ('4522770', '2013-07-30 15:37:57', '', '伊春市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522771', '2013-07-30 15:37:57', '', '市辖区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522772', '2013-07-30 15:37:57', '', '伊春区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522773', '2013-07-30 15:37:57', '', '南岔区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522774', '2013-07-30 15:37:57', '', '友好区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522775', '2013-07-30 15:37:57', '', '西林区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522776', '2013-07-30 15:37:57', '', '翠峦区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522777', '2013-07-30 15:37:57', '', '新青区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522778', '2013-07-30 15:37:57', '', '美溪区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522779', '2013-07-30 15:37:58', '', '金山屯区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522780', '2013-07-30 15:37:58', '', '五营区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522781', '2013-07-30 15:37:58', '', '乌马河区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522782', '2013-07-30 15:37:58', '', '汤旺河区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522783', '2013-07-30 15:37:58', '', '带岭区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522784', '2013-07-30 15:37:58', '', '乌伊岭区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522785', '2013-07-30 15:37:58', '', '红星区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522786', '2013-07-30 15:37:58', '', '上甘岭区', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522787', '2013-07-30 15:37:58', '', '嘉荫县', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522788', '2013-07-30 15:37:58', '', '铁力市', '2', '0', '4522770', '');
INSERT INTO `shopping_area` VALUES ('4522789', '2013-07-30 15:37:58', '', '佳木斯市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522790', '2013-07-30 15:37:58', '', '市辖区', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522791', '2013-07-30 15:37:58', '', '向阳区', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522792', '2013-07-30 15:37:58', '', '前进区', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522793', '2013-07-30 15:37:58', '', '东风区', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522794', '2013-07-30 15:37:58', '', '郊区', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522795', '2013-07-30 15:37:58', '', '桦南县', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522796', '2013-07-30 15:37:58', '', '桦川县', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522797', '2013-07-30 15:37:58', '', '汤原县', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522798', '2013-07-30 15:37:58', '', '抚远县', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522799', '2013-07-30 15:37:58', '', '同江市', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522800', '2013-07-30 15:37:58', '', '富锦市', '2', '0', '4522789', '');
INSERT INTO `shopping_area` VALUES ('4522801', '2013-07-30 15:37:58', '', '七台河市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522802', '2013-07-30 15:37:58', '', '市辖区', '2', '0', '4522801', '');
INSERT INTO `shopping_area` VALUES ('4522803', '2013-07-30 15:37:59', '', '新兴区', '2', '0', '4522801', '');
INSERT INTO `shopping_area` VALUES ('4522804', '2013-07-30 15:37:59', '', '桃山区', '2', '0', '4522801', '');
INSERT INTO `shopping_area` VALUES ('4522805', '2013-07-30 15:37:59', '', '茄子河区', '2', '0', '4522801', '');
INSERT INTO `shopping_area` VALUES ('4522806', '2013-07-30 15:37:59', '', '勃利县', '2', '0', '4522801', '');
INSERT INTO `shopping_area` VALUES ('4522807', '2013-07-30 15:37:59', '', '牡丹江市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522808', '2013-07-30 15:37:59', '', '市辖区', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522809', '2013-07-30 15:37:59', '', '东安区', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522810', '2013-07-30 15:37:59', '', '阳明区', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522811', '2013-07-30 15:37:59', '', '爱民区', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522812', '2013-07-30 15:37:59', '', '西安区', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522813', '2013-07-30 15:37:59', '', '东宁县', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522814', '2013-07-30 15:37:59', '', '林口县', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522815', '2013-07-30 15:37:59', '', '绥芬河市', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522816', '2013-07-30 15:37:59', '', '海林市', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522817', '2013-07-30 15:37:59', '', '宁安市', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522818', '2013-07-30 15:37:59', '', '穆棱市', '2', '0', '4522807', '');
INSERT INTO `shopping_area` VALUES ('4522819', '2013-07-30 15:37:59', '', '黑河市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522820', '2013-07-30 15:37:59', '', '市辖区', '2', '0', '4522819', '');
INSERT INTO `shopping_area` VALUES ('4522821', '2013-07-30 15:37:59', '', '爱辉区', '2', '0', '4522819', '');
INSERT INTO `shopping_area` VALUES ('4522822', '2013-07-30 15:37:59', '', '嫩江县', '2', '0', '4522819', '');
INSERT INTO `shopping_area` VALUES ('4522823', '2013-07-30 15:37:59', '', '逊克县', '2', '0', '4522819', '');
INSERT INTO `shopping_area` VALUES ('4522824', '2013-07-30 15:37:59', '', '孙吴县', '2', '0', '4522819', '');
INSERT INTO `shopping_area` VALUES ('4522825', '2013-07-30 15:38:00', '', '北安市', '2', '0', '4522819', '');
INSERT INTO `shopping_area` VALUES ('4522826', '2013-07-30 15:38:00', '', '五大连池市', '2', '0', '4522819', '');
INSERT INTO `shopping_area` VALUES ('4522827', '2013-07-30 15:38:00', '', '绥化市', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522828', '2013-07-30 15:38:00', '', '市辖区', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522829', '2013-07-30 15:38:00', '', '北林区', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522830', '2013-07-30 15:38:00', '', '望奎县', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522831', '2013-07-30 15:38:00', '', '兰西县', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522832', '2013-07-30 15:38:00', '', '青冈县', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522833', '2013-07-30 15:38:00', '', '庆安县', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522834', '2013-07-30 15:38:00', '', '明水县', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522835', '2013-07-30 15:38:00', '', '绥棱县', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522836', '2013-07-30 15:38:00', '', '安达市', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522837', '2013-07-30 15:38:00', '', '肇东市', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522838', '2013-07-30 15:38:00', '', '海伦市', '2', '0', '4522827', '');
INSERT INTO `shopping_area` VALUES ('4522839', '2013-07-30 15:38:00', '', '大兴安岭地区', '1', '0', '4522689', '');
INSERT INTO `shopping_area` VALUES ('4522840', '2013-07-30 15:38:00', '', '加格达奇区', '2', '0', '4522839', '');
INSERT INTO `shopping_area` VALUES ('4522841', '2013-07-30 15:38:00', '', '松岭区', '2', '0', '4522839', '');
INSERT INTO `shopping_area` VALUES ('4522842', '2013-07-30 15:38:00', '', '新林区', '2', '0', '4522839', '');
INSERT INTO `shopping_area` VALUES ('4522843', '2013-07-30 15:38:00', '', '呼中区', '2', '0', '4522839', '');
INSERT INTO `shopping_area` VALUES ('4522844', '2013-07-30 15:38:00', '', '呼玛县', '2', '0', '4522839', '');
INSERT INTO `shopping_area` VALUES ('4522845', '2013-07-30 15:38:00', '', '塔河县', '2', '0', '4522839', '');
INSERT INTO `shopping_area` VALUES ('4522846', '2013-07-30 15:38:00', '', '漠河县', '2', '0', '4522839', '');
INSERT INTO `shopping_area` VALUES ('4522847', '2013-07-30 15:38:00', '', '上海市', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522848', '2013-07-30 15:38:01', '', '上海市', '1', '0', '4522847', '');
INSERT INTO `shopping_area` VALUES ('4522849', '2013-07-30 15:38:01', '', '黄浦区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522850', '2013-07-30 15:38:01', '', '卢湾区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522851', '2013-07-30 15:38:01', '', '徐汇区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522852', '2013-07-30 15:38:01', '', '长宁区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522853', '2013-07-30 15:38:01', '', '静安区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522854', '2013-07-30 15:38:01', '', '普陀区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522855', '2013-07-30 15:38:01', '', '闸北区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522856', '2013-07-30 15:38:01', '', '虹口区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522857', '2013-07-30 15:38:01', '', '杨浦区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522858', '2013-07-30 15:38:01', '', '闵行区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522859', '2013-07-30 15:38:01', '', '宝山区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522860', '2013-07-30 15:38:01', '', '嘉定区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522861', '2013-07-30 15:38:01', '', '浦东新区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522862', '2013-07-30 15:38:01', '', '金山区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522863', '2013-07-30 15:38:01', '', '松江区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522864', '2013-07-30 15:38:01', '', '青浦区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522865', '2013-07-30 15:38:01', '', '奉贤区', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522867', '2013-07-30 15:38:01', '', '崇明县', '2', '0', '4522848', '');
INSERT INTO `shopping_area` VALUES ('4522868', '2013-07-30 15:38:01', '', '江苏省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4522869', '2013-07-30 15:38:02', '', '南京市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522870', '2013-07-30 15:38:02', '', '市辖区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522871', '2013-07-30 15:38:02', '', '玄武区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522872', '2013-07-30 15:38:02', '', '白下区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522873', '2013-07-30 15:38:02', '', '秦淮区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522874', '2013-07-30 15:38:02', '', '建邺区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522875', '2013-07-30 15:38:02', '', '鼓楼区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522876', '2013-07-30 15:38:02', '', '下关区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522877', '2013-07-30 15:38:02', '', '浦口区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522878', '2013-07-30 15:38:02', '', '栖霞区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522879', '2013-07-30 15:38:02', '', '雨花台区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522880', '2013-07-30 15:38:02', '', '江宁区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522881', '2013-07-30 15:38:02', '', '六合区', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522882', '2013-07-30 15:38:02', '', '溧水县', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522883', '2013-07-30 15:38:02', '', '高淳县', '2', '0', '4522869', '');
INSERT INTO `shopping_area` VALUES ('4522884', '2013-07-30 15:38:02', '', '无锡市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522885', '2013-07-30 15:38:02', '', '市辖区', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522886', '2013-07-30 15:38:02', '', '崇安区', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522887', '2013-07-30 15:38:02', '', '南长区', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522888', '2013-07-30 15:38:02', '', '北塘区', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522889', '2013-07-30 15:38:02', '', '锡山区', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522890', '2013-07-30 15:38:02', '', '惠山区', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522891', '2013-07-30 15:38:03', '', '滨湖区', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522892', '2013-07-30 15:38:03', '', '江阴市', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522893', '2013-07-30 15:38:03', '', '宜兴市', '2', '0', '4522884', '');
INSERT INTO `shopping_area` VALUES ('4522894', '2013-07-30 15:38:03', '', '徐州市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522895', '2013-07-30 15:38:03', '', '市辖区', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522896', '2013-07-30 15:38:03', '', '鼓楼区', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522897', '2013-07-30 15:38:03', '', '云龙区', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522898', '2013-07-30 15:38:03', '', '贾汪区', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522899', '2013-07-30 15:38:03', '', '泉山区', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522900', '2013-07-30 15:38:03', '', '铜山区', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522901', '2013-07-30 15:38:03', '', '丰县', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522902', '2013-07-30 15:38:03', '', '沛县', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522903', '2013-07-30 15:38:03', '', '睢宁县', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522904', '2013-07-30 15:38:03', '', '新沂市', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522905', '2013-07-30 15:38:03', '', '邳州市', '2', '0', '4522894', '');
INSERT INTO `shopping_area` VALUES ('4522906', '2013-07-30 15:38:03', '', '常州市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522907', '2013-07-30 15:38:03', '', '市辖区', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522908', '2013-07-30 15:38:03', '', '天宁区', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522909', '2013-07-30 15:38:03', '', '钟楼区', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522910', '2013-07-30 15:38:03', '', '戚墅堰区', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522911', '2013-07-30 15:38:03', '', '新北区', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522912', '2013-07-30 15:38:03', '', '武进区', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522913', '2013-07-30 15:38:04', '', '溧阳市', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522914', '2013-07-30 15:38:04', '', '金坛市', '2', '0', '4522906', '');
INSERT INTO `shopping_area` VALUES ('4522915', '2013-07-30 15:38:04', '', '苏州市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522916', '2013-07-30 15:38:04', '', '市辖区', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522917', '2013-07-30 15:38:04', '', '沧浪区', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522918', '2013-07-30 15:38:04', '', '平江区', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522919', '2013-07-30 15:38:04', '', '金阊区', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522920', '2013-07-30 15:38:04', '', '虎丘区', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522921', '2013-07-30 15:38:04', '', '吴中区', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522922', '2013-07-30 15:38:04', '', '相城区', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522923', '2013-07-30 15:38:04', '', '常熟市', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522924', '2013-07-30 15:38:04', '', '张家港市', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522925', '2013-07-30 15:38:04', '', '昆山市', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522926', '2013-07-30 15:38:04', '', '吴江市', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522927', '2013-07-30 15:38:04', '', '太仓市', '2', '0', '4522915', '');
INSERT INTO `shopping_area` VALUES ('4522928', '2013-07-30 15:38:04', '', '南通市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522929', '2013-07-30 15:38:04', '', '市辖区', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522930', '2013-07-30 15:38:04', '', '崇川区', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522931', '2013-07-30 15:38:04', '', '港闸区', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522932', '2013-07-30 15:38:04', '', '通州区', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522933', '2013-07-30 15:38:04', '', '海安县', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522934', '2013-07-30 15:38:04', '', '如东县', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522935', '2013-07-30 15:38:05', '', '启东市', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522936', '2013-07-30 15:38:05', '', '如皋市', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522937', '2013-07-30 15:38:05', '', '海门市', '2', '0', '4522928', '');
INSERT INTO `shopping_area` VALUES ('4522938', '2013-07-30 15:38:05', '', '连云港市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522939', '2013-07-30 15:38:05', '', '市辖区', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522940', '2013-07-30 15:38:05', '', '连云区', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522941', '2013-07-30 15:38:05', '', '新浦区', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522942', '2013-07-30 15:38:05', '', '海州区', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522943', '2013-07-30 15:38:05', '', '赣榆县', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522944', '2013-07-30 15:38:05', '', '东海县', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522945', '2013-07-30 15:38:05', '', '灌云县', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522946', '2013-07-30 15:38:05', '', '灌南县', '2', '0', '4522938', '');
INSERT INTO `shopping_area` VALUES ('4522947', '2013-07-30 15:38:05', '', '淮安市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522948', '2013-07-30 15:38:05', '', '市辖区', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522949', '2013-07-30 15:38:05', '', '清河区', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522950', '2013-07-30 15:38:05', '', '楚州区', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522951', '2013-07-30 15:38:05', '', '淮阴区', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522952', '2013-07-30 15:38:05', '', '清浦区', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522953', '2013-07-30 15:38:05', '', '涟水县', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522954', '2013-07-30 15:38:05', '', '洪泽县', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522955', '2013-07-30 15:38:05', '', '盱眙县', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522956', '2013-07-30 15:38:05', '', '金湖县', '2', '0', '4522947', '');
INSERT INTO `shopping_area` VALUES ('4522957', '2013-07-30 15:38:06', '', '盐城市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522958', '2013-07-30 15:38:06', '', '市辖区', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522959', '2013-07-30 15:38:06', '', '亭湖区', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522960', '2013-07-30 15:38:06', '', '盐都区', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522961', '2013-07-30 15:38:06', '', '响水县', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522962', '2013-07-30 15:38:06', '', '滨海县', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522963', '2013-07-30 15:38:06', '', '阜宁县', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522964', '2013-07-30 15:38:06', '', '射阳县', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522965', '2013-07-30 15:38:06', '', '建湖县', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522966', '2013-07-30 15:38:06', '', '东台市', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522967', '2013-07-30 15:38:06', '', '大丰市', '2', '0', '4522957', '');
INSERT INTO `shopping_area` VALUES ('4522968', '2013-07-30 15:38:06', '', '扬州市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522969', '2013-07-30 15:38:06', '', '市辖区', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522970', '2013-07-30 15:38:06', '', '广陵区', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522971', '2013-07-30 15:38:06', '', '邗江区', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522972', '2013-07-30 15:38:06', '', '维扬区', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522973', '2013-07-30 15:38:06', '', '宝应县', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522974', '2013-07-30 15:38:06', '', '仪征市', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522975', '2013-07-30 15:38:06', '', '高邮市', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522976', '2013-07-30 15:38:06', '', '江都市', '2', '0', '4522968', '');
INSERT INTO `shopping_area` VALUES ('4522977', '2013-07-30 15:38:06', '', '镇江市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522978', '2013-07-30 15:38:07', '', '市辖区', '2', '0', '4522977', '');
INSERT INTO `shopping_area` VALUES ('4522979', '2013-07-30 15:38:07', '', '京口区', '2', '0', '4522977', '');
INSERT INTO `shopping_area` VALUES ('4522980', '2013-07-30 15:38:07', '', '润州区', '2', '0', '4522977', '');
INSERT INTO `shopping_area` VALUES ('4522981', '2013-07-30 15:38:07', '', '丹徒区', '2', '0', '4522977', '');
INSERT INTO `shopping_area` VALUES ('4522982', '2013-07-30 15:38:07', '', '丹阳市', '2', '0', '4522977', '');
INSERT INTO `shopping_area` VALUES ('4522983', '2013-07-30 15:38:07', '', '扬中市', '2', '0', '4522977', '');
INSERT INTO `shopping_area` VALUES ('4522984', '2013-07-30 15:38:07', '', '句容市', '2', '0', '4522977', '');
INSERT INTO `shopping_area` VALUES ('4522985', '2013-07-30 15:38:07', '', '泰州市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522986', '2013-07-30 15:38:07', '', '市辖区', '2', '0', '4522985', '');
INSERT INTO `shopping_area` VALUES ('4522987', '2013-07-30 15:38:07', '', '海陵区', '2', '0', '4522985', '');
INSERT INTO `shopping_area` VALUES ('4522988', '2013-07-30 15:38:07', '', '高港区', '2', '0', '4522985', '');
INSERT INTO `shopping_area` VALUES ('4522989', '2013-07-30 15:38:07', '', '兴化市', '2', '0', '4522985', '');
INSERT INTO `shopping_area` VALUES ('4522990', '2013-07-30 15:38:07', '', '靖江市', '2', '0', '4522985', '');
INSERT INTO `shopping_area` VALUES ('4522991', '2013-07-30 15:38:07', '', '泰兴市', '2', '0', '4522985', '');
INSERT INTO `shopping_area` VALUES ('4522992', '2013-07-30 15:38:07', '', '姜堰市', '2', '0', '4522985', '');
INSERT INTO `shopping_area` VALUES ('4522993', '2013-07-30 15:38:07', '', '宿迁市', '1', '0', '4522868', '');
INSERT INTO `shopping_area` VALUES ('4522994', '2013-07-30 15:38:07', '', '市辖区', '2', '0', '4522993', '');
INSERT INTO `shopping_area` VALUES ('4522995', '2013-07-30 15:38:07', '', '宿城区', '2', '0', '4522993', '');
INSERT INTO `shopping_area` VALUES ('4522996', '2013-07-30 15:38:07', '', '宿豫区', '2', '0', '4522993', '');
INSERT INTO `shopping_area` VALUES ('4522997', '2013-07-30 15:38:07', '', '沭阳县', '2', '0', '4522993', '');
INSERT INTO `shopping_area` VALUES ('4522998', '2013-07-30 15:38:07', '', '泗阳县', '2', '0', '4522993', '');
INSERT INTO `shopping_area` VALUES ('4522999', '2013-07-30 15:38:08', '', '泗洪县', '2', '0', '4522993', '');
INSERT INTO `shopping_area` VALUES ('4523000', '2013-07-30 15:38:08', '', '浙江省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523001', '2013-07-30 15:38:08', '', '杭州市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523002', '2013-07-30 15:38:08', '', '市辖区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523003', '2013-07-30 15:38:08', '', '上城区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523004', '2013-07-30 15:38:08', '', '下城区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523005', '2013-07-30 15:38:08', '', '江干区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523006', '2013-07-30 15:38:08', '', '拱墅区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523007', '2013-07-30 15:38:08', '', '西湖区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523008', '2013-07-30 15:38:08', '', '滨江区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523009', '2013-07-30 15:38:08', '', '萧山区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523010', '2013-07-30 15:38:08', '', '余杭区', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523011', '2013-07-30 15:38:08', '', '桐庐县', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523012', '2013-07-30 15:38:08', '', '淳安县', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523013', '2013-07-30 15:38:08', '', '建德市', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523014', '2013-07-30 15:38:08', '', '富阳市', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523015', '2013-07-30 15:38:08', '', '临安市', '2', '0', '4523001', '');
INSERT INTO `shopping_area` VALUES ('4523016', '2013-07-30 15:38:08', '', '宁波市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523017', '2013-07-30 15:38:08', '', '市辖区', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523018', '2013-07-30 15:38:08', '', '海曙区', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523019', '2013-07-30 15:38:08', '', '江东区', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523020', '2013-07-30 15:38:09', '', '江北区', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523021', '2013-07-30 15:38:09', '', '北仑区', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523022', '2013-07-30 15:38:09', '', '镇海区', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523023', '2013-07-30 15:38:09', '', '鄞州区', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523024', '2013-07-30 15:38:09', '', '象山县', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523025', '2013-07-30 15:38:09', '', '宁海县', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523026', '2013-07-30 15:38:09', '', '余姚市', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523027', '2013-07-30 15:38:09', '', '慈溪市', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523028', '2013-07-30 15:38:09', '', '奉化市', '2', '0', '4523016', '');
INSERT INTO `shopping_area` VALUES ('4523029', '2013-07-30 15:38:09', '', '温州市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523030', '2013-07-30 15:38:09', '', '市辖区', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523031', '2013-07-30 15:38:09', '', '鹿城区', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523032', '2013-07-30 15:38:09', '', '龙湾区', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523033', '2013-07-30 15:38:09', '', '瓯海区', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523034', '2013-07-30 15:38:09', '', '洞头县', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523035', '2013-07-30 15:38:09', '', '永嘉县', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523036', '2013-07-30 15:38:09', '', '平阳县', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523037', '2013-07-30 15:38:09', '', '苍南县', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523038', '2013-07-30 15:38:09', '', '文成县', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523039', '2013-07-30 15:38:10', '', '泰顺县', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523040', '2013-07-30 15:38:10', '', '瑞安市', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523041', '2013-07-30 15:38:10', '', '乐清市', '2', '0', '4523029', '');
INSERT INTO `shopping_area` VALUES ('4523042', '2013-07-30 15:38:10', '', '嘉兴市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523043', '2013-07-30 15:38:10', '', '市辖区', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523044', '2013-07-30 15:38:10', '', '南湖区', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523045', '2013-07-30 15:38:10', '', '秀洲区', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523046', '2013-07-30 15:38:10', '', '嘉善县', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523047', '2013-07-30 15:38:10', '', '海盐县', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523048', '2013-07-30 15:38:10', '', '海宁市', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523049', '2013-07-30 15:38:10', '', '平湖市', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523050', '2013-07-30 15:38:10', '', '桐乡市', '2', '0', '4523042', '');
INSERT INTO `shopping_area` VALUES ('4523051', '2013-07-30 15:38:10', '', '湖州市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523052', '2013-07-30 15:38:10', '', '市辖区', '2', '0', '4523051', '');
INSERT INTO `shopping_area` VALUES ('4523053', '2013-07-30 15:38:10', '', '吴兴区', '2', '0', '4523051', '');
INSERT INTO `shopping_area` VALUES ('4523054', '2013-07-30 15:38:10', '', '南浔区', '2', '0', '4523051', '');
INSERT INTO `shopping_area` VALUES ('4523055', '2013-07-30 15:38:10', '', '德清县', '2', '0', '4523051', '');
INSERT INTO `shopping_area` VALUES ('4523056', '2013-07-30 15:38:10', '', '长兴县', '2', '0', '4523051', '');
INSERT INTO `shopping_area` VALUES ('4523057', '2013-07-30 15:38:10', '', '安吉县', '2', '0', '4523051', '');
INSERT INTO `shopping_area` VALUES ('4523058', '2013-07-30 15:38:10', '', '绍兴市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523059', '2013-07-30 15:38:11', '', '市辖区', '2', '0', '4523058', '');
INSERT INTO `shopping_area` VALUES ('4523060', '2013-07-30 15:38:11', '', '越城区', '2', '0', '4523058', '');
INSERT INTO `shopping_area` VALUES ('4523061', '2013-07-30 15:38:11', '', '绍兴县', '2', '0', '4523058', '');
INSERT INTO `shopping_area` VALUES ('4523062', '2013-07-30 15:38:11', '', '新昌县', '2', '0', '4523058', '');
INSERT INTO `shopping_area` VALUES ('4523063', '2013-07-30 15:38:11', '', '诸暨市', '2', '0', '4523058', '');
INSERT INTO `shopping_area` VALUES ('4523064', '2013-07-30 15:38:11', '', '上虞市', '2', '0', '4523058', '');
INSERT INTO `shopping_area` VALUES ('4523065', '2013-07-30 15:38:11', '', '嵊州市', '2', '0', '4523058', '');
INSERT INTO `shopping_area` VALUES ('4523066', '2013-07-30 15:38:11', '', '金华市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523067', '2013-07-30 15:38:11', '', '市辖区', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523068', '2013-07-30 15:38:11', '', '婺城区', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523069', '2013-07-30 15:38:11', '', '金东区', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523070', '2013-07-30 15:38:11', '', '武义县', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523071', '2013-07-30 15:38:11', '', '浦江县', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523072', '2013-07-30 15:38:11', '', '磐安县', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523073', '2013-07-30 15:38:11', '', '兰溪市', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523074', '2013-07-30 15:38:11', '', '义乌市', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523075', '2013-07-30 15:38:11', '', '东阳市', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523076', '2013-07-30 15:38:11', '', '永康市', '2', '0', '4523066', '');
INSERT INTO `shopping_area` VALUES ('4523077', '2013-07-30 15:38:11', '', '衢州市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523078', '2013-07-30 15:38:12', '', '市辖区', '2', '0', '4523077', '');
INSERT INTO `shopping_area` VALUES ('4523079', '2013-07-30 15:38:12', '', '柯城区', '2', '0', '4523077', '');
INSERT INTO `shopping_area` VALUES ('4523080', '2013-07-30 15:38:12', '', '衢江区', '2', '0', '4523077', '');
INSERT INTO `shopping_area` VALUES ('4523081', '2013-07-30 15:38:12', '', '常山县', '2', '0', '4523077', '');
INSERT INTO `shopping_area` VALUES ('4523082', '2013-07-30 15:38:12', '', '开化县', '2', '0', '4523077', '');
INSERT INTO `shopping_area` VALUES ('4523083', '2013-07-30 15:38:12', '', '龙游县', '2', '0', '4523077', '');
INSERT INTO `shopping_area` VALUES ('4523084', '2013-07-30 15:38:12', '', '江山市', '2', '0', '4523077', '');
INSERT INTO `shopping_area` VALUES ('4523085', '2013-07-30 15:38:12', '', '舟山市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523086', '2013-07-30 15:38:12', '', '市辖区', '2', '0', '4523085', '');
INSERT INTO `shopping_area` VALUES ('4523087', '2013-07-30 15:38:12', '', '定海区', '2', '0', '4523085', '');
INSERT INTO `shopping_area` VALUES ('4523088', '2013-07-30 15:38:12', '', '普陀区', '2', '0', '4523085', '');
INSERT INTO `shopping_area` VALUES ('4523089', '2013-07-30 15:38:12', '', '岱山县', '2', '0', '4523085', '');
INSERT INTO `shopping_area` VALUES ('4523090', '2013-07-30 15:38:12', '', '嵊泗县', '2', '0', '4523085', '');
INSERT INTO `shopping_area` VALUES ('4523091', '2013-07-30 15:38:12', '', '台州市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523092', '2013-07-30 15:38:12', '', '市辖区', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523093', '2013-07-30 15:38:12', '', '椒江区', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523094', '2013-07-30 15:38:12', '', '黄岩区', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523095', '2013-07-30 15:38:12', '', '路桥区', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523096', '2013-07-30 15:38:12', '', '玉环县', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523097', '2013-07-30 15:38:13', '', '三门县', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523098', '2013-07-30 15:38:13', '', '天台县', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523099', '2013-07-30 15:38:13', '', '仙居县', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523100', '2013-07-30 15:38:13', '', '温岭市', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523101', '2013-07-30 15:38:13', '', '临海市', '2', '0', '4523091', '');
INSERT INTO `shopping_area` VALUES ('4523102', '2013-07-30 15:38:13', '', '丽水市', '1', '0', '4523000', '');
INSERT INTO `shopping_area` VALUES ('4523103', '2013-07-30 15:38:13', '', '市辖区', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523104', '2013-07-30 15:38:13', '', '莲都区', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523105', '2013-07-30 15:38:13', '', '青田县', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523106', '2013-07-30 15:38:13', '', '缙云县', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523107', '2013-07-30 15:38:13', '', '遂昌县', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523108', '2013-07-30 15:38:13', '', '松阳县', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523109', '2013-07-30 15:38:13', '', '云和县', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523110', '2013-07-30 15:38:13', '', '庆元县', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523111', '2013-07-30 15:38:13', '', '景宁畲族自治县', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523112', '2013-07-30 15:38:13', '', '龙泉市', '2', '0', '4523102', '');
INSERT INTO `shopping_area` VALUES ('4523113', '2013-07-30 15:38:13', '', '安徽省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523114', '2013-07-30 15:38:13', '', '合肥市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523115', '2013-07-30 15:38:13', '', '市辖区', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523116', '2013-07-30 15:38:14', '', '瑶海区', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523117', '2013-07-30 15:38:14', '', '庐阳区', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523118', '2013-07-30 15:38:14', '', '蜀山区', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523119', '2013-07-30 15:38:14', '', '包河区', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523120', '2013-07-30 15:38:14', '', '长丰县', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523121', '2013-07-30 15:38:14', '', '肥东县', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523122', '2013-07-30 15:38:14', '', '肥西县', '2', '0', '4523114', '');
INSERT INTO `shopping_area` VALUES ('4523123', '2013-07-30 15:38:14', '', '芜湖市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523124', '2013-07-30 15:38:14', '', '市辖区', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523125', '2013-07-30 15:38:14', '', '镜湖区', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523126', '2013-07-30 15:38:14', '', '弋江区', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523127', '2013-07-30 15:38:14', '', '鸠江区', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523128', '2013-07-30 15:38:14', '', '三山区', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523129', '2013-07-30 15:38:14', '', '芜湖县', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523130', '2013-07-30 15:38:14', '', '繁昌县', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523131', '2013-07-30 15:38:14', '', '南陵县', '2', '0', '4523123', '');
INSERT INTO `shopping_area` VALUES ('4523132', '2013-07-30 15:38:14', '', '蚌埠市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523133', '2013-07-30 15:38:14', '', '市辖区', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523134', '2013-07-30 15:38:15', '', '龙子湖区', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523135', '2013-07-30 15:38:15', '', '蚌山区', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523136', '2013-07-30 15:38:15', '', '禹会区', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523137', '2013-07-30 15:38:15', '', '淮上区', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523138', '2013-07-30 15:38:15', '', '怀远县', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523139', '2013-07-30 15:38:15', '', '五河县', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523140', '2013-07-30 15:38:15', '', '固镇县', '2', '0', '4523132', '');
INSERT INTO `shopping_area` VALUES ('4523141', '2013-07-30 15:38:15', '', '淮南市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523142', '2013-07-30 15:38:15', '', '市辖区', '2', '0', '4523141', '');
INSERT INTO `shopping_area` VALUES ('4523143', '2013-07-30 15:38:15', '', '大通区', '2', '0', '4523141', '');
INSERT INTO `shopping_area` VALUES ('4523144', '2013-07-30 15:38:15', '', '田家庵区', '2', '0', '4523141', '');
INSERT INTO `shopping_area` VALUES ('4523145', '2013-07-30 15:38:15', '', '谢家集区', '2', '0', '4523141', '');
INSERT INTO `shopping_area` VALUES ('4523146', '2013-07-30 15:38:15', '', '八公山区', '2', '0', '4523141', '');
INSERT INTO `shopping_area` VALUES ('4523147', '2013-07-30 15:38:15', '', '潘集区', '2', '0', '4523141', '');
INSERT INTO `shopping_area` VALUES ('4523148', '2013-07-30 15:38:15', '', '凤台县', '2', '0', '4523141', '');
INSERT INTO `shopping_area` VALUES ('4523149', '2013-07-30 15:38:15', '', '马鞍山市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523150', '2013-07-30 15:38:16', '', '市辖区', '2', '0', '4523149', '');
INSERT INTO `shopping_area` VALUES ('4523151', '2013-07-30 15:38:16', '', '金家庄区', '2', '0', '4523149', '');
INSERT INTO `shopping_area` VALUES ('4523152', '2013-07-30 15:38:16', '', '花山区', '2', '0', '4523149', '');
INSERT INTO `shopping_area` VALUES ('4523153', '2013-07-30 15:38:16', '', '雨山区', '2', '0', '4523149', '');
INSERT INTO `shopping_area` VALUES ('4523154', '2013-07-30 15:38:16', '', '当涂县', '2', '0', '4523149', '');
INSERT INTO `shopping_area` VALUES ('4523155', '2013-07-30 15:38:16', '', '淮北市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523156', '2013-07-30 15:38:16', '', '市辖区', '2', '0', '4523155', '');
INSERT INTO `shopping_area` VALUES ('4523157', '2013-07-30 15:38:16', '', '杜集区', '2', '0', '4523155', '');
INSERT INTO `shopping_area` VALUES ('4523158', '2013-07-30 15:38:16', '', '相山区', '2', '0', '4523155', '');
INSERT INTO `shopping_area` VALUES ('4523159', '2013-07-30 15:38:16', '', '烈山区', '2', '0', '4523155', '');
INSERT INTO `shopping_area` VALUES ('4523160', '2013-07-30 15:38:16', '', '濉溪县', '2', '0', '4523155', '');
INSERT INTO `shopping_area` VALUES ('4523161', '2013-07-30 15:38:16', '', '铜陵市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523162', '2013-07-30 15:38:16', '', '市辖区', '2', '0', '4523161', '');
INSERT INTO `shopping_area` VALUES ('4523163', '2013-07-30 15:38:16', '', '铜官山区', '2', '0', '4523161', '');
INSERT INTO `shopping_area` VALUES ('4523164', '2013-07-30 15:38:16', '', '狮子山区', '2', '0', '4523161', '');
INSERT INTO `shopping_area` VALUES ('4523165', '2013-07-30 15:38:16', '', '郊区', '2', '0', '4523161', '');
INSERT INTO `shopping_area` VALUES ('4523166', '2013-07-30 15:38:16', '', '铜陵县', '2', '0', '4523161', '');
INSERT INTO `shopping_area` VALUES ('4523167', '2013-07-30 15:38:16', '', '安庆市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523168', '2013-07-30 15:38:17', '', '市辖区', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523169', '2013-07-30 15:38:17', '', '迎江区', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523170', '2013-07-30 15:38:17', '', '大观区', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523171', '2013-07-30 15:38:17', '', '宜秀区', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523172', '2013-07-30 15:38:17', '', '怀宁县', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523173', '2013-07-30 15:38:17', '', '枞阳县', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523174', '2013-07-30 15:38:17', '', '潜山县', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523175', '2013-07-30 15:38:17', '', '太湖县', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523176', '2013-07-30 15:38:17', '', '宿松县', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523177', '2013-07-30 15:38:17', '', '望江县', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523178', '2013-07-30 15:38:17', '', '岳西县', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523179', '2013-07-30 15:38:17', '', '桐城市', '2', '0', '4523167', '');
INSERT INTO `shopping_area` VALUES ('4523180', '2013-07-30 15:38:17', '', '黄山市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523181', '2013-07-30 15:38:17', '', '市辖区', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523182', '2013-07-30 15:38:17', '', '屯溪区', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523183', '2013-07-30 15:38:17', '', '黄山区', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523184', '2013-07-30 15:38:17', '', '徽州区', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523185', '2013-07-30 15:38:17', '', '歙县', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523186', '2013-07-30 15:38:17', '', '休宁县', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523187', '2013-07-30 15:38:18', '', '黟县', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523188', '2013-07-30 15:38:18', '', '祁门县', '2', '0', '4523180', '');
INSERT INTO `shopping_area` VALUES ('4523189', '2013-07-30 15:38:18', '', '滁州市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523190', '2013-07-30 15:38:18', '', '市辖区', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523191', '2013-07-30 15:38:18', '', '琅琊区', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523192', '2013-07-30 15:38:18', '', '南谯区', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523193', '2013-07-30 15:38:18', '', '来安县', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523194', '2013-07-30 15:38:18', '', '全椒县', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523195', '2013-07-30 15:38:18', '', '定远县', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523196', '2013-07-30 15:38:18', '', '凤阳县', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523197', '2013-07-30 15:38:18', '', '天长市', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523198', '2013-07-30 15:38:18', '', '明光市', '2', '0', '4523189', '');
INSERT INTO `shopping_area` VALUES ('4523199', '2013-07-30 15:38:18', '', '阜阳市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523200', '2013-07-30 15:38:18', '', '市辖区', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523201', '2013-07-30 15:38:18', '', '颍州区', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523202', '2013-07-30 15:38:18', '', '颍东区', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523203', '2013-07-30 15:38:18', '', '颍泉区', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523204', '2013-07-30 15:38:18', '', '临泉县', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523205', '2013-07-30 15:38:19', '', '太和县', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523206', '2013-07-30 15:38:19', '', '阜南县', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523207', '2013-07-30 15:38:19', '', '颍上县', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523208', '2013-07-30 15:38:19', '', '界首市', '2', '0', '4523199', '');
INSERT INTO `shopping_area` VALUES ('4523209', '2013-07-30 15:38:19', '', '宿州市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523210', '2013-07-30 15:38:19', '', '市辖区', '2', '0', '4523209', '');
INSERT INTO `shopping_area` VALUES ('4523211', '2013-07-30 15:38:19', '', '埇桥区', '2', '0', '4523209', '');
INSERT INTO `shopping_area` VALUES ('4523212', '2013-07-30 15:38:19', '', '砀山县', '2', '0', '4523209', '');
INSERT INTO `shopping_area` VALUES ('4523213', '2013-07-30 15:38:19', '', '萧县', '2', '0', '4523209', '');
INSERT INTO `shopping_area` VALUES ('4523214', '2013-07-30 15:38:19', '', '灵璧县', '2', '0', '4523209', '');
INSERT INTO `shopping_area` VALUES ('4523215', '2013-07-30 15:38:19', '', '泗县', '2', '0', '4523209', '');
INSERT INTO `shopping_area` VALUES ('4523216', '2013-07-30 15:38:19', '', '巢湖市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523217', '2013-07-30 15:38:19', '', '市辖区', '2', '0', '4523216', '');
INSERT INTO `shopping_area` VALUES ('4523218', '2013-07-30 15:38:19', '', '居巢区', '2', '0', '4523216', '');
INSERT INTO `shopping_area` VALUES ('4523219', '2013-07-30 15:38:19', '', '庐江县', '2', '0', '4523216', '');
INSERT INTO `shopping_area` VALUES ('4523220', '2013-07-30 15:38:19', '', '无为县', '2', '0', '4523216', '');
INSERT INTO `shopping_area` VALUES ('4523221', '2013-07-30 15:38:19', '', '含山县', '2', '0', '4523216', '');
INSERT INTO `shopping_area` VALUES ('4523222', '2013-07-30 15:38:19', '', '和县', '2', '0', '4523216', '');
INSERT INTO `shopping_area` VALUES ('4523223', '2013-07-30 15:38:20', '', '六安市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523224', '2013-07-30 15:38:20', '', '市辖区', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523225', '2013-07-30 15:38:20', '', '金安区', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523226', '2013-07-30 15:38:20', '', '裕安区', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523227', '2013-07-30 15:38:20', '', '寿县', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523228', '2013-07-30 15:38:20', '', '霍邱县', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523229', '2013-07-30 15:38:20', '', '舒城县', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523230', '2013-07-30 15:38:20', '', '金寨县', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523231', '2013-07-30 15:38:20', '', '霍山县', '2', '0', '4523223', '');
INSERT INTO `shopping_area` VALUES ('4523232', '2013-07-30 15:38:20', '', '亳州市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523233', '2013-07-30 15:38:20', '', '市辖区', '2', '0', '4523232', '');
INSERT INTO `shopping_area` VALUES ('4523234', '2013-07-30 15:38:20', '', '谯城区', '2', '0', '4523232', '');
INSERT INTO `shopping_area` VALUES ('4523235', '2013-07-30 15:38:20', '', '涡阳县', '2', '0', '4523232', '');
INSERT INTO `shopping_area` VALUES ('4523236', '2013-07-30 15:38:20', '', '蒙城县', '2', '0', '4523232', '');
INSERT INTO `shopping_area` VALUES ('4523237', '2013-07-30 15:38:20', '', '利辛县', '2', '0', '4523232', '');
INSERT INTO `shopping_area` VALUES ('4523238', '2013-07-30 15:38:20', '', '池州市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523239', '2013-07-30 15:38:20', '', '市辖区', '2', '0', '4523238', '');
INSERT INTO `shopping_area` VALUES ('4523240', '2013-07-30 15:38:20', '', '贵池区', '2', '0', '4523238', '');
INSERT INTO `shopping_area` VALUES ('4523241', '2013-07-30 15:38:21', '', '东至县', '2', '0', '4523238', '');
INSERT INTO `shopping_area` VALUES ('4523242', '2013-07-30 15:38:21', '', '石台县', '2', '0', '4523238', '');
INSERT INTO `shopping_area` VALUES ('4523243', '2013-07-30 15:38:21', '', '青阳县', '2', '0', '4523238', '');
INSERT INTO `shopping_area` VALUES ('4523244', '2013-07-30 15:38:21', '', '宣城市', '1', '0', '4523113', '');
INSERT INTO `shopping_area` VALUES ('4523245', '2013-07-30 15:38:21', '', '市辖区', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523246', '2013-07-30 15:38:21', '', '宣州区', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523247', '2013-07-30 15:38:21', '', '郎溪县', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523248', '2013-07-30 15:38:21', '', '广德县', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523249', '2013-07-30 15:38:21', '', '泾县', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523250', '2013-07-30 15:38:21', '', '绩溪县', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523251', '2013-07-30 15:38:21', '', '旌德县', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523252', '2013-07-30 15:38:21', '', '宁国市', '2', '0', '4523244', '');
INSERT INTO `shopping_area` VALUES ('4523253', '2013-07-30 15:38:21', '', '福建省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523254', '2013-07-30 15:38:21', '', '福州市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523255', '2013-07-30 15:38:21', '', '市辖区', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523256', '2013-07-30 15:38:21', '', '鼓楼区', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523257', '2013-07-30 15:38:22', '', '台江区', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523258', '2013-07-30 15:38:22', '', '仓山区', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523259', '2013-07-30 15:38:22', '', '马尾区', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523260', '2013-07-30 15:38:22', '', '晋安区', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523261', '2013-07-30 15:38:22', '', '闽侯县', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523262', '2013-07-30 15:38:22', '', '连江县', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523263', '2013-07-30 15:38:22', '', '罗源县', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523264', '2013-07-30 15:38:22', '', '闽清县', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523265', '2013-07-30 15:38:22', '', '永泰县', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523266', '2013-07-30 15:38:22', '', '平潭县', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523267', '2013-07-30 15:38:22', '', '福清市', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523268', '2013-07-30 15:38:22', '', '长乐市', '2', '0', '4523254', '');
INSERT INTO `shopping_area` VALUES ('4523269', '2013-07-30 15:38:22', '', '厦门市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523270', '2013-07-30 15:38:22', '', '市辖区', '2', '0', '4523269', '');
INSERT INTO `shopping_area` VALUES ('4523271', '2013-07-30 15:38:22', '', '思明区', '2', '0', '4523269', '');
INSERT INTO `shopping_area` VALUES ('4523272', '2013-07-30 15:38:22', '', '海沧区', '2', '0', '4523269', '');
INSERT INTO `shopping_area` VALUES ('4523273', '2013-07-30 15:38:22', '', '湖里区', '2', '0', '4523269', '');
INSERT INTO `shopping_area` VALUES ('4523274', '2013-07-30 15:38:22', '', '集美区', '2', '0', '4523269', '');
INSERT INTO `shopping_area` VALUES ('4523275', '2013-07-30 15:38:22', '', '同安区', '2', '0', '4523269', '');
INSERT INTO `shopping_area` VALUES ('4523276', '2013-07-30 15:38:23', '', '翔安区', '2', '0', '4523269', '');
INSERT INTO `shopping_area` VALUES ('4523277', '2013-07-30 15:38:23', '', '莆田市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523278', '2013-07-30 15:38:23', '', '市辖区', '2', '0', '4523277', '');
INSERT INTO `shopping_area` VALUES ('4523279', '2013-07-30 15:38:23', '', '城厢区', '2', '0', '4523277', '');
INSERT INTO `shopping_area` VALUES ('4523280', '2013-07-30 15:38:23', '', '涵江区', '2', '0', '4523277', '');
INSERT INTO `shopping_area` VALUES ('4523281', '2013-07-30 15:38:23', '', '荔城区', '2', '0', '4523277', '');
INSERT INTO `shopping_area` VALUES ('4523282', '2013-07-30 15:38:23', '', '秀屿区', '2', '0', '4523277', '');
INSERT INTO `shopping_area` VALUES ('4523283', '2013-07-30 15:38:23', '', '仙游县', '2', '0', '4523277', '');
INSERT INTO `shopping_area` VALUES ('4523284', '2013-07-30 15:38:23', '', '三明市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523285', '2013-07-30 15:38:23', '', '市辖区', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523286', '2013-07-30 15:38:23', '', '梅列区', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523287', '2013-07-30 15:38:23', '', '三元区', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523288', '2013-07-30 15:38:23', '', '明溪县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523289', '2013-07-30 15:38:23', '', '清流县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523290', '2013-07-30 15:38:23', '', '宁化县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523291', '2013-07-30 15:38:23', '', '大田县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523292', '2013-07-30 15:38:23', '', '尤溪县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523293', '2013-07-30 15:38:23', '', '沙县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523294', '2013-07-30 15:38:24', '', '将乐县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523295', '2013-07-30 15:38:24', '', '泰宁县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523296', '2013-07-30 15:38:24', '', '建宁县', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523297', '2013-07-30 15:38:24', '', '永安市', '2', '0', '4523284', '');
INSERT INTO `shopping_area` VALUES ('4523298', '2013-07-30 15:38:24', '', '泉州市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523299', '2013-07-30 15:38:24', '', '市辖区', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523300', '2013-07-30 15:38:24', '', '鲤城区', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523301', '2013-07-30 15:38:24', '', '丰泽区', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523302', '2013-07-30 15:38:24', '', '洛江区', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523303', '2013-07-30 15:38:24', '', '泉港区', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523304', '2013-07-30 15:38:24', '', '惠安县', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523305', '2013-07-30 15:38:24', '', '安溪县', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523306', '2013-07-30 15:38:24', '', '永春县', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523307', '2013-07-30 15:38:24', '', '德化县', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523308', '2013-07-30 15:38:24', '', '金门县', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523309', '2013-07-30 15:38:24', '', '石狮市', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523310', '2013-07-30 15:38:24', '', '晋江市', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523311', '2013-07-30 15:38:24', '', '南安市', '2', '0', '4523298', '');
INSERT INTO `shopping_area` VALUES ('4523312', '2013-07-30 15:38:24', '', '漳州市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523313', '2013-07-30 15:38:25', '', '市辖区', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523314', '2013-07-30 15:38:25', '', '芗城区', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523315', '2013-07-30 15:38:25', '', '龙文区', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523316', '2013-07-30 15:38:25', '', '云霄县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523317', '2013-07-30 15:38:25', '', '漳浦县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523318', '2013-07-30 15:38:25', '', '诏安县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523319', '2013-07-30 15:38:25', '', '长泰县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523320', '2013-07-30 15:38:25', '', '东山县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523321', '2013-07-30 15:38:25', '', '南靖县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523322', '2013-07-30 15:38:25', '', '平和县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523323', '2013-07-30 15:38:25', '', '华安县', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523324', '2013-07-30 15:38:25', '', '龙海市', '2', '0', '4523312', '');
INSERT INTO `shopping_area` VALUES ('4523325', '2013-07-30 15:38:25', '', '南平市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523326', '2013-07-30 15:38:25', '', '市辖区', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523327', '2013-07-30 15:38:25', '', '延平区', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523328', '2013-07-30 15:38:25', '', '顺昌县', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523329', '2013-07-30 15:38:25', '', '浦城县', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523330', '2013-07-30 15:38:25', '', '光泽县', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523331', '2013-07-30 15:38:25', '', '松溪县', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523332', '2013-07-30 15:38:26', '', '政和县', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523333', '2013-07-30 15:38:26', '', '邵武市', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523334', '2013-07-30 15:38:26', '', '武夷山市', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523335', '2013-07-30 15:38:26', '', '建瓯市', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523336', '2013-07-30 15:38:26', '', '建阳市', '2', '0', '4523325', '');
INSERT INTO `shopping_area` VALUES ('4523337', '2013-07-30 15:38:26', '', '龙岩市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523338', '2013-07-30 15:38:26', '', '市辖区', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523339', '2013-07-30 15:38:26', '', '新罗区', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523340', '2013-07-30 15:38:26', '', '长汀县', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523341', '2013-07-30 15:38:26', '', '永定县', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523342', '2013-07-30 15:38:26', '', '上杭县', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523343', '2013-07-30 15:38:26', '', '武平县', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523344', '2013-07-30 15:38:26', '', '连城县', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523345', '2013-07-30 15:38:26', '', '漳平市', '2', '0', '4523337', '');
INSERT INTO `shopping_area` VALUES ('4523346', '2013-07-30 15:38:26', '', '宁德市', '1', '0', '4523253', '');
INSERT INTO `shopping_area` VALUES ('4523347', '2013-07-30 15:38:26', '', '市辖区', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523348', '2013-07-30 15:38:26', '', '蕉城区', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523349', '2013-07-30 15:38:26', '', '霞浦县', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523350', '2013-07-30 15:38:26', '', '古田县', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523351', '2013-07-30 15:38:27', '', '屏南县', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523352', '2013-07-30 15:38:27', '', '寿宁县', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523353', '2013-07-30 15:38:27', '', '周宁县', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523354', '2013-07-30 15:38:27', '', '柘荣县', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523355', '2013-07-30 15:38:27', '', '福安市', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523356', '2013-07-30 15:38:27', '', '福鼎市', '2', '0', '4523346', '');
INSERT INTO `shopping_area` VALUES ('4523357', '2013-07-30 15:38:27', '', '江西省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523358', '2013-07-30 15:38:27', '', '南昌市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523359', '2013-07-30 15:38:27', '', '市辖区', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523360', '2013-07-30 15:38:27', '', '东湖区', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523361', '2013-07-30 15:38:27', '', '西湖区', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523362', '2013-07-30 15:38:27', '', '青云谱区', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523363', '2013-07-30 15:38:27', '', '湾里区', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523364', '2013-07-30 15:38:27', '', '青山湖区', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523365', '2013-07-30 15:38:27', '', '南昌县', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523366', '2013-07-30 15:38:27', '', '新建县', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523367', '2013-07-30 15:38:27', '', '安义县', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523368', '2013-07-30 15:38:27', '', '进贤县', '2', '0', '4523358', '');
INSERT INTO `shopping_area` VALUES ('4523369', '2013-07-30 15:38:28', '', '景德镇市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523370', '2013-07-30 15:38:28', '', '市辖区', '2', '0', '4523369', '');
INSERT INTO `shopping_area` VALUES ('4523371', '2013-07-30 15:38:28', '', '昌江区', '2', '0', '4523369', '');
INSERT INTO `shopping_area` VALUES ('4523372', '2013-07-30 15:38:28', '', '珠山区', '2', '0', '4523369', '');
INSERT INTO `shopping_area` VALUES ('4523373', '2013-07-30 15:38:28', '', '浮梁县', '2', '0', '4523369', '');
INSERT INTO `shopping_area` VALUES ('4523374', '2013-07-30 15:38:28', '', '乐平市', '2', '0', '4523369', '');
INSERT INTO `shopping_area` VALUES ('4523375', '2013-07-30 15:38:28', '', '萍乡市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523376', '2013-07-30 15:38:28', '', '市辖区', '2', '0', '4523375', '');
INSERT INTO `shopping_area` VALUES ('4523377', '2013-07-30 15:38:28', '', '安源区', '2', '0', '4523375', '');
INSERT INTO `shopping_area` VALUES ('4523378', '2013-07-30 15:38:28', '', '湘东区', '2', '0', '4523375', '');
INSERT INTO `shopping_area` VALUES ('4523379', '2013-07-30 15:38:28', '', '莲花县', '2', '0', '4523375', '');
INSERT INTO `shopping_area` VALUES ('4523380', '2013-07-30 15:38:28', '', '上栗县', '2', '0', '4523375', '');
INSERT INTO `shopping_area` VALUES ('4523381', '2013-07-30 15:38:28', '', '芦溪县', '2', '0', '4523375', '');
INSERT INTO `shopping_area` VALUES ('4523382', '2013-07-30 15:38:28', '', '九江市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523383', '2013-07-30 15:38:28', '', '市辖区', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523384', '2013-07-30 15:38:28', '', '庐山区', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523385', '2013-07-30 15:38:28', '', '浔阳区', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523386', '2013-07-30 15:38:28', '', '九江县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523387', '2013-07-30 15:38:29', '', '武宁县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523388', '2013-07-30 15:38:29', '', '修水县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523389', '2013-07-30 15:38:29', '', '永修县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523390', '2013-07-30 15:38:29', '', '德安县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523391', '2013-07-30 15:38:29', '', '星子县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523392', '2013-07-30 15:38:29', '', '都昌县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523393', '2013-07-30 15:38:29', '', '湖口县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523394', '2013-07-30 15:38:29', '', '彭泽县', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523395', '2013-07-30 15:38:29', '', '瑞昌市', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523396', '2013-07-30 15:38:29', '', '共青城市', '2', '0', '4523382', '');
INSERT INTO `shopping_area` VALUES ('4523397', '2013-07-30 15:38:29', '', '新余市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523398', '2013-07-30 15:38:29', '', '市辖区', '2', '0', '4523397', '');
INSERT INTO `shopping_area` VALUES ('4523399', '2013-07-30 15:38:29', '', '渝水区', '2', '0', '4523397', '');
INSERT INTO `shopping_area` VALUES ('4523400', '2013-07-30 15:38:29', '', '分宜县', '2', '0', '4523397', '');
INSERT INTO `shopping_area` VALUES ('4523401', '2013-07-30 15:38:29', '', '鹰潭市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523402', '2013-07-30 15:38:29', '', '市辖区', '2', '0', '4523401', '');
INSERT INTO `shopping_area` VALUES ('4523403', '2013-07-30 15:38:29', '', '月湖区', '2', '0', '4523401', '');
INSERT INTO `shopping_area` VALUES ('4523404', '2013-07-30 15:38:30', '', '余江县', '2', '0', '4523401', '');
INSERT INTO `shopping_area` VALUES ('4523405', '2013-07-30 15:38:30', '', '贵溪市', '2', '0', '4523401', '');
INSERT INTO `shopping_area` VALUES ('4523406', '2013-07-30 15:38:30', '', '赣州市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523407', '2013-07-30 15:38:30', '', '市辖区', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523408', '2013-07-30 15:38:30', '', '章贡区', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523409', '2013-07-30 15:38:30', '', '赣县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523410', '2013-07-30 15:38:30', '', '信丰县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523411', '2013-07-30 15:38:30', '', '大余县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523412', '2013-07-30 15:38:30', '', '上犹县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523413', '2013-07-30 15:38:30', '', '崇义县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523414', '2013-07-30 15:38:30', '', '安远县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523415', '2013-07-30 15:38:30', '', '龙南县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523416', '2013-07-30 15:38:30', '', '定南县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523417', '2013-07-30 15:38:30', '', '全南县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523418', '2013-07-30 15:38:30', '', '宁都县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523419', '2013-07-30 15:38:30', '', '于都县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523420', '2013-07-30 15:38:30', '', '兴国县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523421', '2013-07-30 15:38:31', '', '会昌县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523422', '2013-07-30 15:38:31', '', '寻乌县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523423', '2013-07-30 15:38:31', '', '石城县', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523424', '2013-07-30 15:38:31', '', '瑞金市', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523425', '2013-07-30 15:38:31', '', '南康市', '2', '0', '4523406', '');
INSERT INTO `shopping_area` VALUES ('4523426', '2013-07-30 15:38:31', '', '吉安市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523427', '2013-07-30 15:38:31', '', '市辖区', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523428', '2013-07-30 15:38:31', '', '吉州区', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523429', '2013-07-30 15:38:31', '', '青原区', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523430', '2013-07-30 15:38:31', '', '吉安县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523431', '2013-07-30 15:38:31', '', '吉水县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523432', '2013-07-30 15:38:31', '', '峡江县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523433', '2013-07-30 15:38:31', '', '新干县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523434', '2013-07-30 15:38:31', '', '永丰县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523435', '2013-07-30 15:38:31', '', '泰和县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523436', '2013-07-30 15:38:31', '', '遂川县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523437', '2013-07-30 15:38:31', '', '万安县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523438', '2013-07-30 15:38:31', '', '安福县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523439', '2013-07-30 15:38:32', '', '永新县', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523440', '2013-07-30 15:38:32', '', '井冈山市', '2', '0', '4523426', '');
INSERT INTO `shopping_area` VALUES ('4523441', '2013-07-30 15:38:32', '', '宜春市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523442', '2013-07-30 15:38:32', '', '市辖区', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523443', '2013-07-30 15:38:32', '', '袁州区', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523444', '2013-07-30 15:38:32', '', '奉新县', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523445', '2013-07-30 15:38:32', '', '万载县', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523446', '2013-07-30 15:38:32', '', '上高县', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523447', '2013-07-30 15:38:32', '', '宜丰县', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523448', '2013-07-30 15:38:32', '', '靖安县', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523449', '2013-07-30 15:38:32', '', '铜鼓县', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523450', '2013-07-30 15:38:32', '', '丰城市', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523451', '2013-07-30 15:38:32', '', '樟树市', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523452', '2013-07-30 15:38:32', '', '高安市', '2', '0', '4523441', '');
INSERT INTO `shopping_area` VALUES ('4523453', '2013-07-30 15:38:32', '', '抚州市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523454', '2013-07-30 15:38:32', '', '市辖区', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523455', '2013-07-30 15:38:32', '', '临川区', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523456', '2013-07-30 15:38:33', '', '南城县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523457', '2013-07-30 15:38:33', '', '黎川县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523458', '2013-07-30 15:38:33', '', '南丰县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523459', '2013-07-30 15:38:33', '', '崇仁县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523460', '2013-07-30 15:38:33', '', '乐安县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523461', '2013-07-30 15:38:33', '', '宜黄县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523462', '2013-07-30 15:38:33', '', '金溪县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523463', '2013-07-30 15:38:33', '', '资溪县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523464', '2013-07-30 15:38:33', '', '东乡县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523465', '2013-07-30 15:38:33', '', '广昌县', '2', '0', '4523453', '');
INSERT INTO `shopping_area` VALUES ('4523466', '2013-07-30 15:38:33', '', '上饶市', '1', '0', '4523357', '');
INSERT INTO `shopping_area` VALUES ('4523467', '2013-07-30 15:38:33', '', '市辖区', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523468', '2013-07-30 15:38:33', '', '信州区', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523469', '2013-07-30 15:38:33', '', '上饶县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523470', '2013-07-30 15:38:33', '', '广丰县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523471', '2013-07-30 15:38:33', '', '玉山县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523472', '2013-07-30 15:38:33', '', '铅山县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523473', '2013-07-30 15:38:34', '', '横峰县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523474', '2013-07-30 15:38:34', '', '弋阳县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523475', '2013-07-30 15:38:34', '', '余干县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523476', '2013-07-30 15:38:34', '', '鄱阳县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523477', '2013-07-30 15:38:34', '', '万年县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523478', '2013-07-30 15:38:34', '', '婺源县', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523479', '2013-07-30 15:38:34', '', '德兴市', '2', '0', '4523466', '');
INSERT INTO `shopping_area` VALUES ('4523480', '2013-07-30 15:38:34', '', '山东省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523481', '2013-07-30 15:38:34', '', '济南市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523482', '2013-07-30 15:38:34', '', '市辖区', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523483', '2013-07-30 15:38:34', '', '历下区', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523484', '2013-07-30 15:38:34', '', '市中区', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523485', '2013-07-30 15:38:34', '', '槐荫区', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523486', '2013-07-30 15:38:34', '', '天桥区', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523487', '2013-07-30 15:38:34', '', '历城区', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523488', '2013-07-30 15:38:34', '', '长清区', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523489', '2013-07-30 15:38:34', '', '平阴县', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523490', '2013-07-30 15:38:35', '', '济阳县', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523491', '2013-07-30 15:38:35', '', '商河县', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523492', '2013-07-30 15:38:35', '', '章丘市', '2', '0', '4523481', '');
INSERT INTO `shopping_area` VALUES ('4523493', '2013-07-30 15:38:35', '', '青岛市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523494', '2013-07-30 15:38:35', '', '市辖区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523495', '2013-07-30 15:38:35', '', '市南区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523496', '2013-07-30 15:38:35', '', '市北区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523497', '2013-07-30 15:38:35', '', '四方区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523498', '2013-07-30 15:38:35', '', '黄岛区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523499', '2013-07-30 15:38:35', '', '崂山区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523500', '2013-07-30 15:38:35', '', '李沧区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523501', '2013-07-30 15:38:35', '', '城阳区', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523502', '2013-07-30 15:38:35', '', '胶州市', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523503', '2013-07-30 15:38:35', '', '即墨市', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523504', '2013-07-30 15:38:35', '', '平度市', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523505', '2013-07-30 15:38:35', '', '胶南市', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523506', '2013-07-30 15:38:35', '', '莱西市', '2', '0', '4523493', '');
INSERT INTO `shopping_area` VALUES ('4523507', '2013-07-30 15:38:36', '', '淄博市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523508', '2013-07-30 15:38:36', '', '市辖区', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523509', '2013-07-30 15:38:36', '', '淄川区', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523510', '2013-07-30 15:38:36', '', '张店区', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523511', '2013-07-30 15:38:36', '', '博山区', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523512', '2013-07-30 15:38:36', '', '临淄区', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523513', '2013-07-30 15:38:36', '', '周村区', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523514', '2013-07-30 15:38:36', '', '桓台县', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523515', '2013-07-30 15:38:36', '', '高青县', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523516', '2013-07-30 15:38:36', '', '沂源县', '2', '0', '4523507', '');
INSERT INTO `shopping_area` VALUES ('4523517', '2013-07-30 15:38:36', '', '枣庄市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523518', '2013-07-30 15:38:36', '', '市辖区', '2', '0', '4523517', '');
INSERT INTO `shopping_area` VALUES ('4523519', '2013-07-30 15:38:36', '', '市中区', '2', '0', '4523517', '');
INSERT INTO `shopping_area` VALUES ('4523520', '2013-07-30 15:38:36', '', '薛城区', '2', '0', '4523517', '');
INSERT INTO `shopping_area` VALUES ('4523521', '2013-07-30 15:38:36', '', '峄城区', '2', '0', '4523517', '');
INSERT INTO `shopping_area` VALUES ('4523522', '2013-07-30 15:38:36', '', '台儿庄区', '2', '0', '4523517', '');
INSERT INTO `shopping_area` VALUES ('4523523', '2013-07-30 15:38:36', '', '山亭区', '2', '0', '4523517', '');
INSERT INTO `shopping_area` VALUES ('4523524', '2013-07-30 15:38:36', '', '滕州市', '2', '0', '4523517', '');
INSERT INTO `shopping_area` VALUES ('4523525', '2013-07-30 15:38:37', '', '东营市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523526', '2013-07-30 15:38:37', '', '市辖区', '2', '0', '4523525', '');
INSERT INTO `shopping_area` VALUES ('4523527', '2013-07-30 15:38:37', '', '东营区', '2', '0', '4523525', '');
INSERT INTO `shopping_area` VALUES ('4523528', '2013-07-30 15:38:37', '', '河口区', '2', '0', '4523525', '');
INSERT INTO `shopping_area` VALUES ('4523529', '2013-07-30 15:38:37', '', '垦利县', '2', '0', '4523525', '');
INSERT INTO `shopping_area` VALUES ('4523530', '2013-07-30 15:38:37', '', '利津县', '2', '0', '4523525', '');
INSERT INTO `shopping_area` VALUES ('4523531', '2013-07-30 15:38:37', '', '广饶县', '2', '0', '4523525', '');
INSERT INTO `shopping_area` VALUES ('4523532', '2013-07-30 15:38:37', '', '烟台市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523533', '2013-07-30 15:38:37', '', '市辖区', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523534', '2013-07-30 15:38:37', '', '芝罘区', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523535', '2013-07-30 15:38:37', '', '福山区', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523536', '2013-07-30 15:38:37', '', '牟平区', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523537', '2013-07-30 15:38:37', '', '莱山区', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523538', '2013-07-30 15:38:37', '', '长岛县', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523539', '2013-07-30 15:38:37', '', '龙口市', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523540', '2013-07-30 15:38:37', '', '莱阳市', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523541', '2013-07-30 15:38:37', '', '莱州市', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523542', '2013-07-30 15:38:38', '', '蓬莱市', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523543', '2013-07-30 15:38:38', '', '招远市', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523544', '2013-07-30 15:38:38', '', '栖霞市', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523545', '2013-07-30 15:38:38', '', '海阳市', '2', '0', '4523532', '');
INSERT INTO `shopping_area` VALUES ('4523546', '2013-07-30 15:38:38', '', '潍坊市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523547', '2013-07-30 15:38:38', '', '市辖区', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523548', '2013-07-30 15:38:38', '', '潍城区', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523549', '2013-07-30 15:38:38', '', '寒亭区', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523550', '2013-07-30 15:38:38', '', '坊子区', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523551', '2013-07-30 15:38:38', '', '奎文区', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523552', '2013-07-30 15:38:38', '', '临朐县', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523553', '2013-07-30 15:38:38', '', '昌乐县', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523554', '2013-07-30 15:38:38', '', '青州市', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523555', '2013-07-30 15:38:38', '', '诸城市', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523556', '2013-07-30 15:38:38', '', '寿光市', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523557', '2013-07-30 15:38:38', '', '安丘市', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523558', '2013-07-30 15:38:38', '', '高密市', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523559', '2013-07-30 15:38:39', '', '昌邑市', '2', '0', '4523546', '');
INSERT INTO `shopping_area` VALUES ('4523560', '2013-07-30 15:38:39', '', '济宁市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523561', '2013-07-30 15:38:39', '', '市辖区', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523562', '2013-07-30 15:38:39', '', '市中区', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523563', '2013-07-30 15:38:39', '', '任城区', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523564', '2013-07-30 15:38:39', '', '微山县', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523565', '2013-07-30 15:38:39', '', '鱼台县', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523566', '2013-07-30 15:38:39', '', '金乡县', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523567', '2013-07-30 15:38:39', '', '嘉祥县', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523568', '2013-07-30 15:38:39', '', '汶上县', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523569', '2013-07-30 15:38:39', '', '泗水县', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523570', '2013-07-30 15:38:39', '', '梁山县', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523571', '2013-07-30 15:38:39', '', '曲阜市', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523572', '2013-07-30 15:38:39', '', '兖州市', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523573', '2013-07-30 15:38:39', '', '邹城市', '2', '0', '4523560', '');
INSERT INTO `shopping_area` VALUES ('4523574', '2013-07-30 15:38:39', '', '泰安市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523575', '2013-07-30 15:38:40', '', '市辖区', '2', '0', '4523574', '');
INSERT INTO `shopping_area` VALUES ('4523576', '2013-07-30 15:38:40', '', '泰山区', '2', '0', '4523574', '');
INSERT INTO `shopping_area` VALUES ('4523577', '2013-07-30 15:38:40', '', '岱岳区', '2', '0', '4523574', '');
INSERT INTO `shopping_area` VALUES ('4523578', '2013-07-30 15:38:40', '', '宁阳县', '2', '0', '4523574', '');
INSERT INTO `shopping_area` VALUES ('4523579', '2013-07-30 15:38:40', '', '东平县', '2', '0', '4523574', '');
INSERT INTO `shopping_area` VALUES ('4523580', '2013-07-30 15:38:40', '', '新泰市', '2', '0', '4523574', '');
INSERT INTO `shopping_area` VALUES ('4523581', '2013-07-30 15:38:40', '', '肥城市', '2', '0', '4523574', '');
INSERT INTO `shopping_area` VALUES ('4523582', '2013-07-30 15:38:40', '', '威海市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523583', '2013-07-30 15:38:40', '', '市辖区', '2', '0', '4523582', '');
INSERT INTO `shopping_area` VALUES ('4523584', '2013-07-30 15:38:40', '', '环翠区', '2', '0', '4523582', '');
INSERT INTO `shopping_area` VALUES ('4523585', '2013-07-30 15:38:40', '', '文登市', '2', '0', '4523582', '');
INSERT INTO `shopping_area` VALUES ('4523586', '2013-07-30 15:38:40', '', '荣成市', '2', '0', '4523582', '');
INSERT INTO `shopping_area` VALUES ('4523587', '2013-07-30 15:38:40', '', '乳山市', '2', '0', '4523582', '');
INSERT INTO `shopping_area` VALUES ('4523588', '2013-07-30 15:38:40', '', '日照市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523589', '2013-07-30 15:38:40', '', '市辖区', '2', '0', '4523588', '');
INSERT INTO `shopping_area` VALUES ('4523590', '2013-07-30 15:38:40', '', '东港区', '2', '0', '4523588', '');
INSERT INTO `shopping_area` VALUES ('4523591', '2013-07-30 15:38:40', '', '岚山区', '2', '0', '4523588', '');
INSERT INTO `shopping_area` VALUES ('4523592', '2013-07-30 15:38:40', '', '五莲县', '2', '0', '4523588', '');
INSERT INTO `shopping_area` VALUES ('4523593', '2013-07-30 15:38:41', '', '莒县', '2', '0', '4523588', '');
INSERT INTO `shopping_area` VALUES ('4523594', '2013-07-30 15:38:41', '', '莱芜市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523595', '2013-07-30 15:38:41', '', '市辖区', '2', '0', '4523594', '');
INSERT INTO `shopping_area` VALUES ('4523596', '2013-07-30 15:38:41', '', '莱城区', '2', '0', '4523594', '');
INSERT INTO `shopping_area` VALUES ('4523597', '2013-07-30 15:38:41', '', '钢城区', '2', '0', '4523594', '');
INSERT INTO `shopping_area` VALUES ('4523598', '2013-07-30 15:38:41', '', '临沂市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523599', '2013-07-30 15:38:41', '', '市辖区', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523600', '2013-07-30 15:38:41', '', '兰山区', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523601', '2013-07-30 15:38:41', '', '罗庄区', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523602', '2013-07-30 15:38:41', '', '河东区', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523603', '2013-07-30 15:38:41', '', '沂南县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523604', '2013-07-30 15:38:41', '', '郯城县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523605', '2013-07-30 15:38:41', '', '沂水县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523606', '2013-07-30 15:38:41', '', '苍山县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523607', '2013-07-30 15:38:41', '', '费县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523608', '2013-07-30 15:38:41', '', '平邑县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523609', '2013-07-30 15:38:42', '', '莒南县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523610', '2013-07-30 15:38:42', '', '蒙阴县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523611', '2013-07-30 15:38:42', '', '临沭县', '2', '0', '4523598', '');
INSERT INTO `shopping_area` VALUES ('4523612', '2013-07-30 15:38:42', '', '德州市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523613', '2013-07-30 15:38:42', '', '市辖区', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523614', '2013-07-30 15:38:42', '', '德城区', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523615', '2013-07-30 15:38:42', '', '陵县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523616', '2013-07-30 15:38:42', '', '宁津县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523617', '2013-07-30 15:38:42', '', '庆云县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523618', '2013-07-30 15:38:42', '', '临邑县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523619', '2013-07-30 15:38:42', '', '齐河县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523620', '2013-07-30 15:38:42', '', '平原县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523621', '2013-07-30 15:38:42', '', '夏津县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523622', '2013-07-30 15:38:42', '', '武城县', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523623', '2013-07-30 15:38:42', '', '乐陵市', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523624', '2013-07-30 15:38:42', '', '禹城市', '2', '0', '4523612', '');
INSERT INTO `shopping_area` VALUES ('4523625', '2013-07-30 15:38:43', '', '聊城市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523626', '2013-07-30 15:38:43', '', '市辖区', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523627', '2013-07-30 15:38:43', '', '东昌府区', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523628', '2013-07-30 15:38:43', '', '阳谷县', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523629', '2013-07-30 15:38:43', '', '莘县', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523630', '2013-07-30 15:38:43', '', '茌平县', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523631', '2013-07-30 15:38:43', '', '东阿县', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523632', '2013-07-30 15:38:43', '', '冠县', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523633', '2013-07-30 15:38:43', '', '高唐县', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523634', '2013-07-30 15:38:43', '', '临清市', '2', '0', '4523625', '');
INSERT INTO `shopping_area` VALUES ('4523635', '2013-07-30 15:38:43', '', '滨州市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523636', '2013-07-30 15:38:43', '', '市辖区', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523637', '2013-07-30 15:38:43', '', '滨城区', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523638', '2013-07-30 15:38:43', '', '惠民县', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523639', '2013-07-30 15:38:43', '', '阳信县', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523640', '2013-07-30 15:38:43', '', '无棣县', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523641', '2013-07-30 15:38:44', '', '沾化县', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523642', '2013-07-30 15:38:44', '', '博兴县', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523643', '2013-07-30 15:38:44', '', '邹平县', '2', '0', '4523635', '');
INSERT INTO `shopping_area` VALUES ('4523644', '2013-07-30 15:38:44', '', '菏泽市', '1', '0', '4523480', '');
INSERT INTO `shopping_area` VALUES ('4523645', '2013-07-30 15:38:44', '', '市辖区', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523646', '2013-07-30 15:38:44', '', '牡丹区', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523647', '2013-07-30 15:38:44', '', '曹县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523648', '2013-07-30 15:38:44', '', '单县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523649', '2013-07-30 15:38:44', '', '成武县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523650', '2013-07-30 15:38:44', '', '巨野县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523651', '2013-07-30 15:38:44', '', '郓城县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523652', '2013-07-30 15:38:44', '', '鄄城县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523653', '2013-07-30 15:38:44', '', '定陶县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523654', '2013-07-30 15:38:44', '', '东明县', '2', '0', '4523644', '');
INSERT INTO `shopping_area` VALUES ('4523655', '2013-07-30 15:38:44', '', '河南省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523656', '2013-07-30 15:38:44', '', '郑州市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523657', '2013-07-30 15:38:44', '', '市辖区', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523658', '2013-07-30 15:38:45', '', '中原区', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523659', '2013-07-30 15:38:45', '', '二七区', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523660', '2013-07-30 15:38:45', '', '管城回族区', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523661', '2013-07-30 15:38:45', '', '金水区', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523662', '2013-07-30 15:38:45', '', '上街区', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523663', '2013-07-30 15:38:45', '', '惠济区', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523664', '2013-07-30 15:38:45', '', '中牟县', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523665', '2013-07-30 15:38:45', '', '巩义市', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523666', '2013-07-30 15:38:45', '', '荥阳市', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523667', '2013-07-30 15:38:45', '', '新密市', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523668', '2013-07-30 15:38:45', '', '新郑市', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523669', '2013-07-30 15:38:45', '', '登封市', '2', '0', '4523656', '');
INSERT INTO `shopping_area` VALUES ('4523670', '2013-07-30 15:38:45', '', '开封市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523671', '2013-07-30 15:38:45', '', '市辖区', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523672', '2013-07-30 15:38:45', '', '龙亭区', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523673', '2013-07-30 15:38:45', '', '顺河回族区', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523674', '2013-07-30 15:38:46', '', '鼓楼区', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523675', '2013-07-30 15:38:46', '', '禹王台区', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523676', '2013-07-30 15:38:46', '', '金明区', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523677', '2013-07-30 15:38:46', '', '杞县', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523678', '2013-07-30 15:38:46', '', '通许县', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523679', '2013-07-30 15:38:46', '', '尉氏县', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523680', '2013-07-30 15:38:46', '', '开封县', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523681', '2013-07-30 15:38:46', '', '兰考县', '2', '0', '4523670', '');
INSERT INTO `shopping_area` VALUES ('4523682', '2013-07-30 15:38:46', '', '洛阳市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523683', '2013-07-30 15:38:46', '', '市辖区', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523684', '2013-07-30 15:38:46', '', '老城区', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523685', '2013-07-30 15:38:46', '', '西工区', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523686', '2013-07-30 15:38:46', '', '瀍河回族区', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523687', '2013-07-30 15:38:46', '', '涧西区', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523688', '2013-07-30 15:38:46', '', '吉利区', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523689', '2013-07-30 15:38:46', '', '洛龙区', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523690', '2013-07-30 15:38:47', '', '孟津县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523691', '2013-07-30 15:38:47', '', '新安县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523692', '2013-07-30 15:38:47', '', '栾川县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523693', '2013-07-30 15:38:47', '', '嵩县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523694', '2013-07-30 15:38:47', '', '汝阳县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523695', '2013-07-30 15:38:47', '', '宜阳县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523696', '2013-07-30 15:38:47', '', '洛宁县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523697', '2013-07-30 15:38:47', '', '伊川县', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523698', '2013-07-30 15:38:47', '', '偃师市', '2', '0', '4523682', '');
INSERT INTO `shopping_area` VALUES ('4523699', '2013-07-30 15:38:47', '', '平顶山市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523700', '2013-07-30 15:38:47', '', '市辖区', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523701', '2013-07-30 15:38:47', '', '新华区', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523702', '2013-07-30 15:38:47', '', '卫东区', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523703', '2013-07-30 15:38:47', '', '石龙区', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523704', '2013-07-30 15:38:47', '', '湛河区', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523705', '2013-07-30 15:38:47', '', '宝丰县', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523706', '2013-07-30 15:38:47', '', '叶县', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523707', '2013-07-30 15:38:48', '', '鲁山县', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523708', '2013-07-30 15:38:48', '', '郏县', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523709', '2013-07-30 15:38:48', '', '舞钢市', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523710', '2013-07-30 15:38:48', '', '汝州市', '2', '0', '4523699', '');
INSERT INTO `shopping_area` VALUES ('4523711', '2013-07-30 15:38:48', '', '安阳市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523712', '2013-07-30 15:38:48', '', '市辖区', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523713', '2013-07-30 15:38:48', '', '文峰区', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523714', '2013-07-30 15:38:48', '', '北关区', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523715', '2013-07-30 15:38:48', '', '殷都区', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523716', '2013-07-30 15:38:48', '', '龙安区', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523717', '2013-07-30 15:38:48', '', '安阳县', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523718', '2013-07-30 15:38:48', '', '汤阴县', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523719', '2013-07-30 15:38:48', '', '滑县', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523720', '2013-07-30 15:38:48', '', '内黄县', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523721', '2013-07-30 15:38:48', '', '林州市', '2', '0', '4523711', '');
INSERT INTO `shopping_area` VALUES ('4523722', '2013-07-30 15:38:48', '', '鹤壁市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523723', '2013-07-30 15:38:49', '', '市辖区', '2', '0', '4523722', '');
INSERT INTO `shopping_area` VALUES ('4523724', '2013-07-30 15:38:49', '', '鹤山区', '2', '0', '4523722', '');
INSERT INTO `shopping_area` VALUES ('4523725', '2013-07-30 15:38:49', '', '山城区', '2', '0', '4523722', '');
INSERT INTO `shopping_area` VALUES ('4523726', '2013-07-30 15:38:49', '', '淇滨区', '2', '0', '4523722', '');
INSERT INTO `shopping_area` VALUES ('4523727', '2013-07-30 15:38:49', '', '浚县', '2', '0', '4523722', '');
INSERT INTO `shopping_area` VALUES ('4523728', '2013-07-30 15:38:49', '', '淇县', '2', '0', '4523722', '');
INSERT INTO `shopping_area` VALUES ('4523729', '2013-07-30 15:38:49', '', '新乡市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523730', '2013-07-30 15:38:49', '', '市辖区', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523731', '2013-07-30 15:38:49', '', '红旗区', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523732', '2013-07-30 15:38:49', '', '卫滨区', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523733', '2013-07-30 15:38:49', '', '凤泉区', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523734', '2013-07-30 15:38:49', '', '牧野区', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523735', '2013-07-30 15:38:49', '', '新乡县', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523736', '2013-07-30 15:38:49', '', '获嘉县', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523737', '2013-07-30 15:38:49', '', '原阳县', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523738', '2013-07-30 15:38:49', '', '延津县', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523739', '2013-07-30 15:38:50', '', '封丘县', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523740', '2013-07-30 15:38:50', '', '长垣县', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523741', '2013-07-30 15:38:50', '', '卫辉市', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523742', '2013-07-30 15:38:50', '', '辉县市', '2', '0', '4523729', '');
INSERT INTO `shopping_area` VALUES ('4523743', '2013-07-30 15:38:50', '', '焦作市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523744', '2013-07-30 15:38:50', '', '市辖区', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523745', '2013-07-30 15:38:50', '', '解放区', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523746', '2013-07-30 15:38:50', '', '中站区', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523747', '2013-07-30 15:38:50', '', '马村区', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523748', '2013-07-30 15:38:50', '', '山阳区', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523749', '2013-07-30 15:38:50', '', '修武县', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523750', '2013-07-30 15:38:50', '', '博爱县', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523751', '2013-07-30 15:38:50', '', '武陟县', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523752', '2013-07-30 15:38:50', '', '温县', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523753', '2013-07-30 15:38:50', '', '沁阳市', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523754', '2013-07-30 15:38:51', '', '孟州市', '2', '0', '4523743', '');
INSERT INTO `shopping_area` VALUES ('4523755', '2013-07-30 15:38:51', '', '濮阳市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523756', '2013-07-30 15:38:51', '', '市辖区', '2', '0', '4523755', '');
INSERT INTO `shopping_area` VALUES ('4523757', '2013-07-30 15:38:51', '', '华龙区', '2', '0', '4523755', '');
INSERT INTO `shopping_area` VALUES ('4523758', '2013-07-30 15:38:51', '', '清丰县', '2', '0', '4523755', '');
INSERT INTO `shopping_area` VALUES ('4523759', '2013-07-30 15:38:51', '', '南乐县', '2', '0', '4523755', '');
INSERT INTO `shopping_area` VALUES ('4523760', '2013-07-30 15:38:51', '', '范县', '2', '0', '4523755', '');
INSERT INTO `shopping_area` VALUES ('4523761', '2013-07-30 15:38:51', '', '台前县', '2', '0', '4523755', '');
INSERT INTO `shopping_area` VALUES ('4523762', '2013-07-30 15:38:51', '', '濮阳县', '2', '0', '4523755', '');
INSERT INTO `shopping_area` VALUES ('4523763', '2013-07-30 15:38:51', '', '许昌市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523764', '2013-07-30 15:38:51', '', '市辖区', '2', '0', '4523763', '');
INSERT INTO `shopping_area` VALUES ('4523765', '2013-07-30 15:38:51', '', '魏都区', '2', '0', '4523763', '');
INSERT INTO `shopping_area` VALUES ('4523766', '2013-07-30 15:38:51', '', '许昌县', '2', '0', '4523763', '');
INSERT INTO `shopping_area` VALUES ('4523767', '2013-07-30 15:38:51', '', '鄢陵县', '2', '0', '4523763', '');
INSERT INTO `shopping_area` VALUES ('4523768', '2013-07-30 15:38:51', '', '襄城县', '2', '0', '4523763', '');
INSERT INTO `shopping_area` VALUES ('4523769', '2013-07-30 15:38:51', '', '禹州市', '2', '0', '4523763', '');
INSERT INTO `shopping_area` VALUES ('4523770', '2013-07-30 15:38:52', '', '长葛市', '2', '0', '4523763', '');
INSERT INTO `shopping_area` VALUES ('4523771', '2013-07-30 15:38:52', '', '漯河市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523772', '2013-07-30 15:38:52', '', '市辖区', '2', '0', '4523771', '');
INSERT INTO `shopping_area` VALUES ('4523773', '2013-07-30 15:38:52', '', '源汇区', '2', '0', '4523771', '');
INSERT INTO `shopping_area` VALUES ('4523774', '2013-07-30 15:38:52', '', '郾城区', '2', '0', '4523771', '');
INSERT INTO `shopping_area` VALUES ('4523775', '2013-07-30 15:38:52', '', '召陵区', '2', '0', '4523771', '');
INSERT INTO `shopping_area` VALUES ('4523776', '2013-07-30 15:38:52', '', '舞阳县', '2', '0', '4523771', '');
INSERT INTO `shopping_area` VALUES ('4523777', '2013-07-30 15:38:52', '', '临颍县', '2', '0', '4523771', '');
INSERT INTO `shopping_area` VALUES ('4523778', '2013-07-30 15:38:52', '', '三门峡市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523779', '2013-07-30 15:38:52', '', '市辖区', '2', '0', '4523778', '');
INSERT INTO `shopping_area` VALUES ('4523780', '2013-07-30 15:38:52', '', '湖滨区', '2', '0', '4523778', '');
INSERT INTO `shopping_area` VALUES ('4523781', '2013-07-30 15:38:52', '', '渑池县', '2', '0', '4523778', '');
INSERT INTO `shopping_area` VALUES ('4523782', '2013-07-30 15:38:52', '', '陕县', '2', '0', '4523778', '');
INSERT INTO `shopping_area` VALUES ('4523783', '2013-07-30 15:38:52', '', '卢氏县', '2', '0', '4523778', '');
INSERT INTO `shopping_area` VALUES ('4523784', '2013-07-30 15:38:53', '', '义马市', '2', '0', '4523778', '');
INSERT INTO `shopping_area` VALUES ('4523785', '2013-07-30 15:38:53', '', '灵宝市', '2', '0', '4523778', '');
INSERT INTO `shopping_area` VALUES ('4523786', '2013-07-30 15:38:53', '', '南阳市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523787', '2013-07-30 15:38:53', '', '市辖区', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523788', '2013-07-30 15:38:53', '', '宛城区', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523789', '2013-07-30 15:38:53', '', '卧龙区', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523790', '2013-07-30 15:38:53', '', '南召县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523791', '2013-07-30 15:38:53', '', '方城县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523792', '2013-07-30 15:38:53', '', '西峡县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523793', '2013-07-30 15:38:53', '', '镇平县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523794', '2013-07-30 15:38:53', '', '内乡县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523795', '2013-07-30 15:38:53', '', '淅川县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523796', '2013-07-30 15:38:53', '', '社旗县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523797', '2013-07-30 15:38:53', '', '唐河县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523798', '2013-07-30 15:38:53', '', '新野县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523799', '2013-07-30 15:38:53', '', '桐柏县', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523800', '2013-07-30 15:38:53', '', '邓州市', '2', '0', '4523786', '');
INSERT INTO `shopping_area` VALUES ('4523801', '2013-07-30 15:38:54', '', '商丘市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523802', '2013-07-30 15:38:54', '', '市辖区', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523803', '2013-07-30 15:38:54', '', '梁园区', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523804', '2013-07-30 15:38:54', '', '睢阳区', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523805', '2013-07-30 15:38:54', '', '民权县', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523806', '2013-07-30 15:38:54', '', '睢县', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523807', '2013-07-30 15:38:54', '', '宁陵县', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523808', '2013-07-30 15:38:54', '', '柘城县', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523809', '2013-07-30 15:38:54', '', '虞城县', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523810', '2013-07-30 15:38:54', '', '夏邑县', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523811', '2013-07-30 15:38:54', '', '永城市', '2', '0', '4523801', '');
INSERT INTO `shopping_area` VALUES ('4523812', '2013-07-30 15:38:54', '', '信阳市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523813', '2013-07-30 15:38:54', '', '市辖区', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523814', '2013-07-30 15:38:54', '', '浉河区', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523815', '2013-07-30 15:38:54', '', '平桥区', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523816', '2013-07-30 15:38:54', '', '罗山县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523817', '2013-07-30 15:38:55', '', '光山县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523818', '2013-07-30 15:38:55', '', '新县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523819', '2013-07-30 15:38:55', '', '商城县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523820', '2013-07-30 15:38:55', '', '固始县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523821', '2013-07-30 15:38:55', '', '潢川县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523822', '2013-07-30 15:38:55', '', '淮滨县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523823', '2013-07-30 15:38:55', '', '息县', '2', '0', '4523812', '');
INSERT INTO `shopping_area` VALUES ('4523824', '2013-07-30 15:38:55', '', '周口市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523825', '2013-07-30 15:38:55', '', '市辖区', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523826', '2013-07-30 15:38:55', '', '川汇区', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523827', '2013-07-30 15:38:55', '', '扶沟县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523828', '2013-07-30 15:38:55', '', '西华县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523829', '2013-07-30 15:38:55', '', '商水县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523830', '2013-07-30 15:38:55', '', '沈丘县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523831', '2013-07-30 15:38:55', '', '郸城县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523832', '2013-07-30 15:38:55', '', '淮阳县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523833', '2013-07-30 15:38:56', '', '太康县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523834', '2013-07-30 15:38:56', '', '鹿邑县', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523835', '2013-07-30 15:38:56', '', '项城市', '2', '0', '4523824', '');
INSERT INTO `shopping_area` VALUES ('4523836', '2013-07-30 15:38:56', '', '驻马店市', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523837', '2013-07-30 15:38:56', '', '市辖区', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523838', '2013-07-30 15:38:56', '', '驿城区', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523839', '2013-07-30 15:38:56', '', '西平县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523840', '2013-07-30 15:38:56', '', '上蔡县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523841', '2013-07-30 15:38:56', '', '平舆县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523842', '2013-07-30 15:38:56', '', '正阳县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523843', '2013-07-30 15:38:56', '', '确山县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523844', '2013-07-30 15:38:56', '', '泌阳县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523845', '2013-07-30 15:38:56', '', '汝南县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523846', '2013-07-30 15:38:56', '', '遂平县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523847', '2013-07-30 15:38:56', '', '新蔡县', '2', '0', '4523836', '');
INSERT INTO `shopping_area` VALUES ('4523848', '2013-07-30 15:38:56', '', '省直辖县级行政区划', '1', '0', '4523655', '');
INSERT INTO `shopping_area` VALUES ('4523849', '2013-07-30 15:38:57', '', '济源市', '2', '0', '4523848', '');
INSERT INTO `shopping_area` VALUES ('4523850', '2013-07-30 15:38:57', '', '湖北省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523851', '2013-07-30 15:38:57', '', '武汉市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523852', '2013-07-30 15:38:57', '', '市辖区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523853', '2013-07-30 15:38:57', '', '江岸区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523854', '2013-07-30 15:38:57', '', '江汉区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523855', '2013-07-30 15:38:57', '', '硚口区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523856', '2013-07-30 15:38:57', '', '汉阳区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523857', '2013-07-30 15:38:57', '', '武昌区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523858', '2013-07-30 15:38:57', '', '青山区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523859', '2013-07-30 15:38:57', '', '洪山区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523860', '2013-07-30 15:38:57', '', '东西湖区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523861', '2013-07-30 15:38:57', '', '汉南区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523862', '2013-07-30 15:38:57', '', '蔡甸区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523863', '2013-07-30 15:38:57', '', '江夏区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523864', '2013-07-30 15:38:57', '', '黄陂区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523865', '2013-07-30 15:38:58', '', '新洲区', '2', '0', '4523851', '');
INSERT INTO `shopping_area` VALUES ('4523866', '2013-07-30 15:38:58', '', '黄石市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523867', '2013-07-30 15:38:58', '', '市辖区', '2', '0', '4523866', '');
INSERT INTO `shopping_area` VALUES ('4523868', '2013-07-30 15:38:58', '', '黄石港区', '2', '0', '4523866', '');
INSERT INTO `shopping_area` VALUES ('4523869', '2013-07-30 15:38:58', '', '西塞山区', '2', '0', '4523866', '');
INSERT INTO `shopping_area` VALUES ('4523870', '2013-07-30 15:38:58', '', '下陆区', '2', '0', '4523866', '');
INSERT INTO `shopping_area` VALUES ('4523871', '2013-07-30 15:38:58', '', '铁山区', '2', '0', '4523866', '');
INSERT INTO `shopping_area` VALUES ('4523872', '2013-07-30 15:38:58', '', '阳新县', '2', '0', '4523866', '');
INSERT INTO `shopping_area` VALUES ('4523873', '2013-07-30 15:38:58', '', '大冶市', '2', '0', '4523866', '');
INSERT INTO `shopping_area` VALUES ('4523874', '2013-07-30 15:38:58', '', '十堰市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523875', '2013-07-30 15:38:58', '', '市辖区', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523876', '2013-07-30 15:38:58', '', '茅箭区', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523877', '2013-07-30 15:38:58', '', '张湾区', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523878', '2013-07-30 15:38:58', '', '郧县', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523879', '2013-07-30 15:38:58', '', '郧西县', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523880', '2013-07-30 15:38:59', '', '竹山县', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523881', '2013-07-30 15:38:59', '', '竹溪县', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523882', '2013-07-30 15:38:59', '', '房县', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523883', '2013-07-30 15:38:59', '', '丹江口市', '2', '0', '4523874', '');
INSERT INTO `shopping_area` VALUES ('4523884', '2013-07-30 15:38:59', '', '宜昌市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523885', '2013-07-30 15:38:59', '', '市辖区', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523886', '2013-07-30 15:38:59', '', '西陵区', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523887', '2013-07-30 15:38:59', '', '伍家岗区', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523888', '2013-07-30 15:38:59', '', '点军区', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523889', '2013-07-30 15:38:59', '', '猇亭区', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523890', '2013-07-30 15:38:59', '', '夷陵区', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523891', '2013-07-30 15:38:59', '', '远安县', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523892', '2013-07-30 15:38:59', '', '兴山县', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523893', '2013-07-30 15:38:59', '', '秭归县', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523894', '2013-07-30 15:38:59', '', '长阳土家族自治县', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523895', '2013-07-30 15:39:00', '', '五峰土家族自治县', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523896', '2013-07-30 15:39:00', '', '宜都市', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523897', '2013-07-30 15:39:00', '', '当阳市', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523898', '2013-07-30 15:39:00', '', '枝江市', '2', '0', '4523884', '');
INSERT INTO `shopping_area` VALUES ('4523899', '2013-07-30 15:39:00', '', '襄樊市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523900', '2013-07-30 15:39:00', '', '市辖区', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523901', '2013-07-30 15:39:00', '', '襄城区', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523902', '2013-07-30 15:39:00', '', '樊城区', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523903', '2013-07-30 15:39:00', '', '襄阳区', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523904', '2013-07-30 15:39:00', '', '南漳县', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523905', '2013-07-30 15:39:00', '', '谷城县', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523906', '2013-07-30 15:39:00', '', '保康县', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523907', '2013-07-30 15:39:00', '', '老河口市', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523908', '2013-07-30 15:39:00', '', '枣阳市', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523909', '2013-07-30 15:39:00', '', '宜城市', '2', '0', '4523899', '');
INSERT INTO `shopping_area` VALUES ('4523910', '2013-07-30 15:39:01', '', '鄂州市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523911', '2013-07-30 15:39:01', '', '市辖区', '2', '0', '4523910', '');
INSERT INTO `shopping_area` VALUES ('4523912', '2013-07-30 15:39:01', '', '梁子湖区', '2', '0', '4523910', '');
INSERT INTO `shopping_area` VALUES ('4523913', '2013-07-30 15:39:01', '', '华容区', '2', '0', '4523910', '');
INSERT INTO `shopping_area` VALUES ('4523914', '2013-07-30 15:39:01', '', '鄂城区', '2', '0', '4523910', '');
INSERT INTO `shopping_area` VALUES ('4523915', '2013-07-30 15:39:01', '', '荆门市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523916', '2013-07-30 15:39:01', '', '市辖区', '2', '0', '4523915', '');
INSERT INTO `shopping_area` VALUES ('4523917', '2013-07-30 15:39:01', '', '东宝区', '2', '0', '4523915', '');
INSERT INTO `shopping_area` VALUES ('4523918', '2013-07-30 15:39:01', '', '掇刀区', '2', '0', '4523915', '');
INSERT INTO `shopping_area` VALUES ('4523919', '2013-07-30 15:39:01', '', '京山县', '2', '0', '4523915', '');
INSERT INTO `shopping_area` VALUES ('4523920', '2013-07-30 15:39:01', '', '沙洋县', '2', '0', '4523915', '');
INSERT INTO `shopping_area` VALUES ('4523921', '2013-07-30 15:39:01', '', '钟祥市', '2', '0', '4523915', '');
INSERT INTO `shopping_area` VALUES ('4523922', '2013-07-30 15:39:01', '', '孝感市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523923', '2013-07-30 15:39:01', '', '市辖区', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523924', '2013-07-30 15:39:01', '', '孝南区', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523925', '2013-07-30 15:39:02', '', '孝昌县', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523926', '2013-07-30 15:39:02', '', '大悟县', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523927', '2013-07-30 15:39:02', '', '云梦县', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523928', '2013-07-30 15:39:02', '', '应城市', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523929', '2013-07-30 15:39:02', '', '安陆市', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523930', '2013-07-30 15:39:02', '', '汉川市', '2', '0', '4523922', '');
INSERT INTO `shopping_area` VALUES ('4523931', '2013-07-30 15:39:02', '', '荆州市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523932', '2013-07-30 15:39:02', '', '市辖区', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523933', '2013-07-30 15:39:02', '', '沙市区', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523934', '2013-07-30 15:39:02', '', '荆州区', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523935', '2013-07-30 15:39:02', '', '公安县', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523936', '2013-07-30 15:39:02', '', '监利县', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523937', '2013-07-30 15:39:02', '', '江陵县', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523938', '2013-07-30 15:39:03', '', '石首市', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523939', '2013-07-30 15:39:03', '', '洪湖市', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523940', '2013-07-30 15:39:03', '', '松滋市', '2', '0', '4523931', '');
INSERT INTO `shopping_area` VALUES ('4523941', '2013-07-30 15:39:03', '', '黄冈市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523942', '2013-07-30 15:39:03', '', '市辖区', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523943', '2013-07-30 15:39:03', '', '黄州区', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523944', '2013-07-30 15:39:03', '', '团风县', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523945', '2013-07-30 15:39:03', '', '红安县', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523946', '2013-07-30 15:39:03', '', '罗田县', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523947', '2013-07-30 15:39:03', '', '英山县', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523948', '2013-07-30 15:39:03', '', '浠水县', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523949', '2013-07-30 15:39:03', '', '蕲春县', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523950', '2013-07-30 15:39:03', '', '黄梅县', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523951', '2013-07-30 15:39:03', '', '麻城市', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523952', '2013-07-30 15:39:04', '', '武穴市', '2', '0', '4523941', '');
INSERT INTO `shopping_area` VALUES ('4523953', '2013-07-30 15:39:04', '', '咸宁市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523954', '2013-07-30 15:39:04', '', '市辖区', '2', '0', '4523953', '');
INSERT INTO `shopping_area` VALUES ('4523955', '2013-07-30 15:39:04', '', '咸安区', '2', '0', '4523953', '');
INSERT INTO `shopping_area` VALUES ('4523956', '2013-07-30 15:39:04', '', '嘉鱼县', '2', '0', '4523953', '');
INSERT INTO `shopping_area` VALUES ('4523957', '2013-07-30 15:39:04', '', '通城县', '2', '0', '4523953', '');
INSERT INTO `shopping_area` VALUES ('4523958', '2013-07-30 15:39:04', '', '崇阳县', '2', '0', '4523953', '');
INSERT INTO `shopping_area` VALUES ('4523959', '2013-07-30 15:39:04', '', '通山县', '2', '0', '4523953', '');
INSERT INTO `shopping_area` VALUES ('4523960', '2013-07-30 15:39:04', '', '赤壁市', '2', '0', '4523953', '');
INSERT INTO `shopping_area` VALUES ('4523961', '2013-07-30 15:39:04', '', '随州市', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523962', '2013-07-30 15:39:04', '', '市辖区', '2', '0', '4523961', '');
INSERT INTO `shopping_area` VALUES ('4523963', '2013-07-30 15:39:04', '', '曾都区', '2', '0', '4523961', '');
INSERT INTO `shopping_area` VALUES ('4523964', '2013-07-30 15:39:04', '', '随县', '2', '0', '4523961', '');
INSERT INTO `shopping_area` VALUES ('4523965', '2013-07-30 15:39:04', '', '广水市', '2', '0', '4523961', '');
INSERT INTO `shopping_area` VALUES ('4523966', '2013-07-30 15:39:05', '', '恩施土家族苗族自治州', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523967', '2013-07-30 15:39:05', '', '恩施市', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523968', '2013-07-30 15:39:05', '', '利川市', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523969', '2013-07-30 15:39:05', '', '建始县', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523970', '2013-07-30 15:39:05', '', '巴东县', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523971', '2013-07-30 15:39:05', '', '宣恩县', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523972', '2013-07-30 15:39:05', '', '咸丰县', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523973', '2013-07-30 15:39:05', '', '来凤县', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523974', '2013-07-30 15:39:05', '', '鹤峰县', '2', '0', '4523966', '');
INSERT INTO `shopping_area` VALUES ('4523975', '2013-07-30 15:39:05', '', '省直辖县级行政区划', '1', '0', '4523850', '');
INSERT INTO `shopping_area` VALUES ('4523976', '2013-07-30 15:39:05', '', '仙桃市', '2', '0', '4523975', '');
INSERT INTO `shopping_area` VALUES ('4523977', '2013-07-30 15:39:05', '', '潜江市', '2', '0', '4523975', '');
INSERT INTO `shopping_area` VALUES ('4523978', '2013-07-30 15:39:05', '', '天门市', '2', '0', '4523975', '');
INSERT INTO `shopping_area` VALUES ('4523979', '2013-07-30 15:39:05', '', '神农架林区', '2', '0', '4523975', '');
INSERT INTO `shopping_area` VALUES ('4523980', '2013-07-30 15:39:05', '', '湖南省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4523981', '2013-07-30 15:39:06', '', '长沙市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4523982', '2013-07-30 15:39:06', '', '市辖区', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523983', '2013-07-30 15:39:06', '', '芙蓉区', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523984', '2013-07-30 15:39:06', '', '天心区', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523985', '2013-07-30 15:39:06', '', '岳麓区', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523986', '2013-07-30 15:39:06', '', '开福区', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523987', '2013-07-30 15:39:06', '', '雨花区', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523988', '2013-07-30 15:39:06', '', '长沙县', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523989', '2013-07-30 15:39:06', '', '望城县', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523990', '2013-07-30 15:39:06', '', '宁乡县', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523991', '2013-07-30 15:39:06', '', '浏阳市', '2', '0', '4523981', '');
INSERT INTO `shopping_area` VALUES ('4523992', '2013-07-30 15:39:06', '', '株洲市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4523993', '2013-07-30 15:39:06', '', '市辖区', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4523994', '2013-07-30 15:39:06', '', '荷塘区', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4523995', '2013-07-30 15:39:06', '', '芦淞区', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4523996', '2013-07-30 15:39:07', '', '石峰区', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4523997', '2013-07-30 15:39:07', '', '天元区', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4523998', '2013-07-30 15:39:07', '', '株洲县', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4523999', '2013-07-30 15:39:07', '', '攸县', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4524000', '2013-07-30 15:39:07', '', '茶陵县', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4524001', '2013-07-30 15:39:07', '', '炎陵县', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4524002', '2013-07-30 15:39:07', '', '醴陵市', '2', '0', '4523992', '');
INSERT INTO `shopping_area` VALUES ('4524003', '2013-07-30 15:39:07', '', '湘潭市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524004', '2013-07-30 15:39:07', '', '市辖区', '2', '0', '4524003', '');
INSERT INTO `shopping_area` VALUES ('4524005', '2013-07-30 15:39:07', '', '雨湖区', '2', '0', '4524003', '');
INSERT INTO `shopping_area` VALUES ('4524006', '2013-07-30 15:39:07', '', '岳塘区', '2', '0', '4524003', '');
INSERT INTO `shopping_area` VALUES ('4524007', '2013-07-30 15:39:07', '', '湘潭县', '2', '0', '4524003', '');
INSERT INTO `shopping_area` VALUES ('4524008', '2013-07-30 15:39:07', '', '湘乡市', '2', '0', '4524003', '');
INSERT INTO `shopping_area` VALUES ('4524009', '2013-07-30 15:39:07', '', '韶山市', '2', '0', '4524003', '');
INSERT INTO `shopping_area` VALUES ('4524010', '2013-07-30 15:39:08', '', '衡阳市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524011', '2013-07-30 15:39:08', '', '市辖区', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524012', '2013-07-30 15:39:08', '', '珠晖区', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524013', '2013-07-30 15:39:08', '', '雁峰区', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524014', '2013-07-30 15:39:08', '', '石鼓区', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524015', '2013-07-30 15:39:08', '', '蒸湘区', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524016', '2013-07-30 15:39:08', '', '南岳区', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524017', '2013-07-30 15:39:08', '', '衡阳县', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524018', '2013-07-30 15:39:08', '', '衡南县', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524019', '2013-07-30 15:39:08', '', '衡山县', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524020', '2013-07-30 15:39:08', '', '衡东县', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524021', '2013-07-30 15:39:08', '', '祁东县', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524022', '2013-07-30 15:39:08', '', '耒阳市', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524023', '2013-07-30 15:39:08', '', '常宁市', '2', '0', '4524010', '');
INSERT INTO `shopping_area` VALUES ('4524024', '2013-07-30 15:39:08', '', '邵阳市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524025', '2013-07-30 15:39:09', '', '市辖区', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524026', '2013-07-30 15:39:09', '', '双清区', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524027', '2013-07-30 15:39:09', '', '大祥区', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524028', '2013-07-30 15:39:09', '', '北塔区', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524029', '2013-07-30 15:39:09', '', '邵东县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524030', '2013-07-30 15:39:09', '', '新邵县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524031', '2013-07-30 15:39:09', '', '邵阳县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524032', '2013-07-30 15:39:09', '', '隆回县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524033', '2013-07-30 15:39:09', '', '洞口县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524034', '2013-07-30 15:39:09', '', '绥宁县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524035', '2013-07-30 15:39:09', '', '新宁县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524036', '2013-07-30 15:39:09', '', '城步苗族自治县', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524037', '2013-07-30 15:39:09', '', '武冈市', '2', '0', '4524024', '');
INSERT INTO `shopping_area` VALUES ('4524038', '2013-07-30 15:39:09', '', '岳阳市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524039', '2013-07-30 15:39:10', '', '市辖区', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524040', '2013-07-30 15:39:10', '', '岳阳楼区', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524041', '2013-07-30 15:39:10', '', '云溪区', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524042', '2013-07-30 15:39:10', '', '君山区', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524043', '2013-07-30 15:39:10', '', '岳阳县', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524044', '2013-07-30 15:39:10', '', '华容县', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524045', '2013-07-30 15:39:10', '', '湘阴县', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524046', '2013-07-30 15:39:10', '', '平江县', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524047', '2013-07-30 15:39:10', '', '汨罗市', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524048', '2013-07-30 15:39:10', '', '临湘市', '2', '0', '4524038', '');
INSERT INTO `shopping_area` VALUES ('4524049', '2013-07-30 15:39:10', '', '常德市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524050', '2013-07-30 15:39:10', '', '市辖区', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524051', '2013-07-30 15:39:10', '', '武陵区', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524052', '2013-07-30 15:39:10', '', '鼎城区', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524053', '2013-07-30 15:39:10', '', '安乡县', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524054', '2013-07-30 15:39:11', '', '汉寿县', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524055', '2013-07-30 15:39:11', '', '澧县', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524056', '2013-07-30 15:39:11', '', '临澧县', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524057', '2013-07-30 15:39:11', '', '桃源县', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524058', '2013-07-30 15:39:11', '', '石门县', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524059', '2013-07-30 15:39:11', '', '津市市', '2', '0', '4524049', '');
INSERT INTO `shopping_area` VALUES ('4524060', '2013-07-30 15:39:11', '', '张家界市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524061', '2013-07-30 15:39:11', '', '市辖区', '2', '0', '4524060', '');
INSERT INTO `shopping_area` VALUES ('4524062', '2013-07-30 15:39:11', '', '永定区', '2', '0', '4524060', '');
INSERT INTO `shopping_area` VALUES ('4524063', '2013-07-30 15:39:11', '', '武陵源区', '2', '0', '4524060', '');
INSERT INTO `shopping_area` VALUES ('4524064', '2013-07-30 15:39:11', '', '慈利县', '2', '0', '4524060', '');
INSERT INTO `shopping_area` VALUES ('4524065', '2013-07-30 15:39:11', '', '桑植县', '2', '0', '4524060', '');
INSERT INTO `shopping_area` VALUES ('4524066', '2013-07-30 15:39:11', '', '益阳市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524067', '2013-07-30 15:39:11', '', '市辖区', '2', '0', '4524066', '');
INSERT INTO `shopping_area` VALUES ('4524068', '2013-07-30 15:39:11', '', '资阳区', '2', '0', '4524066', '');
INSERT INTO `shopping_area` VALUES ('4524069', '2013-07-30 15:39:12', '', '赫山区', '2', '0', '4524066', '');
INSERT INTO `shopping_area` VALUES ('4524070', '2013-07-30 15:39:12', '', '南县', '2', '0', '4524066', '');
INSERT INTO `shopping_area` VALUES ('4524071', '2013-07-30 15:39:12', '', '桃江县', '2', '0', '4524066', '');
INSERT INTO `shopping_area` VALUES ('4524072', '2013-07-30 15:39:12', '', '安化县', '2', '0', '4524066', '');
INSERT INTO `shopping_area` VALUES ('4524073', '2013-07-30 15:39:12', '', '沅江市', '2', '0', '4524066', '');
INSERT INTO `shopping_area` VALUES ('4524074', '2013-07-30 15:39:12', '', '郴州市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524075', '2013-07-30 15:39:12', '', '市辖区', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524076', '2013-07-30 15:39:12', '', '北湖区', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524077', '2013-07-30 15:39:12', '', '苏仙区', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524078', '2013-07-30 15:39:12', '', '桂阳县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524079', '2013-07-30 15:39:12', '', '宜章县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524080', '2013-07-30 15:39:12', '', '永兴县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524081', '2013-07-30 15:39:12', '', '嘉禾县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524082', '2013-07-30 15:39:12', '', '临武县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524083', '2013-07-30 15:39:13', '', '汝城县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524084', '2013-07-30 15:39:13', '', '桂东县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524085', '2013-07-30 15:39:13', '', '安仁县', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524086', '2013-07-30 15:39:13', '', '资兴市', '2', '0', '4524074', '');
INSERT INTO `shopping_area` VALUES ('4524087', '2013-07-30 15:39:13', '', '永州市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524088', '2013-07-30 15:39:13', '', '市辖区', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524089', '2013-07-30 15:39:13', '', '零陵区', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524090', '2013-07-30 15:39:13', '', '冷水滩区', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524091', '2013-07-30 15:39:13', '', '祁阳县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524092', '2013-07-30 15:39:13', '', '东安县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524093', '2013-07-30 15:39:13', '', '双牌县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524094', '2013-07-30 15:39:13', '', '道县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524095', '2013-07-30 15:39:13', '', '江永县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524096', '2013-07-30 15:39:14', '', '宁远县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524097', '2013-07-30 15:39:14', '', '蓝山县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524098', '2013-07-30 15:39:14', '', '新田县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524099', '2013-07-30 15:39:14', '', '江华瑶族自治县', '2', '0', '4524087', '');
INSERT INTO `shopping_area` VALUES ('4524100', '2013-07-30 15:39:14', '', '怀化市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524101', '2013-07-30 15:39:14', '', '市辖区', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524102', '2013-07-30 15:39:14', '', '鹤城区', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524103', '2013-07-30 15:39:14', '', '中方县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524104', '2013-07-30 15:39:14', '', '沅陵县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524105', '2013-07-30 15:39:14', '', '辰溪县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524106', '2013-07-30 15:39:14', '', '溆浦县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524107', '2013-07-30 15:39:14', '', '会同县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524108', '2013-07-30 15:39:14', '', '麻阳苗族自治县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524109', '2013-07-30 15:39:14', '', '新晃侗族自治县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524110', '2013-07-30 15:39:14', '', '芷江侗族自治县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524111', '2013-07-30 15:39:15', '', '靖州苗族侗族自治县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524112', '2013-07-30 15:39:15', '', '通道侗族自治县', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524113', '2013-07-30 15:39:15', '', '洪江市', '2', '0', '4524100', '');
INSERT INTO `shopping_area` VALUES ('4524114', '2013-07-30 15:39:15', '', '娄底市', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524115', '2013-07-30 15:39:15', '', '市辖区', '2', '0', '4524114', '');
INSERT INTO `shopping_area` VALUES ('4524116', '2013-07-30 15:39:15', '', '娄星区', '2', '0', '4524114', '');
INSERT INTO `shopping_area` VALUES ('4524117', '2013-07-30 15:39:15', '', '双峰县', '2', '0', '4524114', '');
INSERT INTO `shopping_area` VALUES ('4524118', '2013-07-30 15:39:15', '', '新化县', '2', '0', '4524114', '');
INSERT INTO `shopping_area` VALUES ('4524119', '2013-07-30 15:39:15', '', '冷水江市', '2', '0', '4524114', '');
INSERT INTO `shopping_area` VALUES ('4524120', '2013-07-30 15:39:15', '', '涟源市', '2', '0', '4524114', '');
INSERT INTO `shopping_area` VALUES ('4524121', '2013-07-30 15:39:15', '', '湘西土家族苗族自治州', '1', '0', '4523980', '');
INSERT INTO `shopping_area` VALUES ('4524122', '2013-07-30 15:39:15', '', '吉首市', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524123', '2013-07-30 15:39:15', '', '泸溪县', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524124', '2013-07-30 15:39:16', '', '凤凰县', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524125', '2013-07-30 15:39:16', '', '花垣县', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524126', '2013-07-30 15:39:16', '', '保靖县', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524127', '2013-07-30 15:39:16', '', '古丈县', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524128', '2013-07-30 15:39:16', '', '永顺县', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524129', '2013-07-30 15:39:16', '', '龙山县', '2', '0', '4524121', '');
INSERT INTO `shopping_area` VALUES ('4524130', '2013-07-30 15:39:16', '', '广东省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524131', '2013-07-30 15:39:16', '', '广州市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524132', '2013-07-30 15:39:16', '', '市辖区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524133', '2013-07-30 15:39:16', '', '荔湾区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524134', '2013-07-30 15:39:16', '', '越秀区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524135', '2013-07-30 15:39:16', '', '海珠区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524136', '2013-07-30 15:39:16', '', '天河区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524137', '2013-07-30 15:39:17', '', '白云区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524138', '2013-07-30 15:39:17', '', '黄埔区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524139', '2013-07-30 15:39:17', '', '番禺区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524140', '2013-07-30 15:39:17', '', '花都区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524141', '2013-07-30 15:39:17', '', '南沙区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524142', '2013-07-30 15:39:17', '', '萝岗区', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524143', '2013-07-30 15:39:17', '', '增城市', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524144', '2013-07-30 15:39:17', '', '从化市', '2', '0', '4524131', '');
INSERT INTO `shopping_area` VALUES ('4524145', '2013-07-30 15:39:17', '', '韶关市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524146', '2013-07-30 15:39:17', '', '市辖区', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524147', '2013-07-30 15:39:17', '', '武江区', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524148', '2013-07-30 15:39:17', '', '浈江区', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524149', '2013-07-30 15:39:17', '', '曲江区', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524150', '2013-07-30 15:39:17', '', '始兴县', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524151', '2013-07-30 15:39:18', '', '仁化县', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524152', '2013-07-30 15:39:18', '', '翁源县', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524153', '2013-07-30 15:39:18', '', '乳源瑶族自治县', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524154', '2013-07-30 15:39:18', '', '新丰县', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524155', '2013-07-30 15:39:18', '', '乐昌市', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524156', '2013-07-30 15:39:18', '', '南雄市', '2', '0', '4524145', '');
INSERT INTO `shopping_area` VALUES ('4524157', '2013-07-30 15:39:18', '', '深圳市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524158', '2013-07-30 15:39:18', '', '市辖区', '2', '0', '4524157', '');
INSERT INTO `shopping_area` VALUES ('4524159', '2013-07-30 15:39:18', '', '罗湖区', '2', '0', '4524157', '');
INSERT INTO `shopping_area` VALUES ('4524160', '2013-07-30 15:39:18', '', '福田区', '2', '0', '4524157', '');
INSERT INTO `shopping_area` VALUES ('4524161', '2013-07-30 15:39:18', '', '南山区', '2', '0', '4524157', '');
INSERT INTO `shopping_area` VALUES ('4524162', '2013-07-30 15:39:18', '', '宝安区', '2', '0', '4524157', '');
INSERT INTO `shopping_area` VALUES ('4524163', '2013-07-30 15:39:18', '', '龙岗区', '2', '0', '4524157', '');
INSERT INTO `shopping_area` VALUES ('4524164', '2013-07-30 15:39:19', '', '盐田区', '2', '0', '4524157', '');
INSERT INTO `shopping_area` VALUES ('4524165', '2013-07-30 15:39:19', '', '珠海市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524166', '2013-07-30 15:39:19', '', '市辖区', '2', '0', '4524165', '');
INSERT INTO `shopping_area` VALUES ('4524167', '2013-07-30 15:39:19', '', '香洲区', '2', '0', '4524165', '');
INSERT INTO `shopping_area` VALUES ('4524168', '2013-07-30 15:39:19', '', '斗门区', '2', '0', '4524165', '');
INSERT INTO `shopping_area` VALUES ('4524169', '2013-07-30 15:39:19', '', '金湾区', '2', '0', '4524165', '');
INSERT INTO `shopping_area` VALUES ('4524170', '2013-07-30 15:39:19', '', '汕头市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524171', '2013-07-30 15:39:19', '', '市辖区', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524172', '2013-07-30 15:39:19', '', '龙湖区', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524173', '2013-07-30 15:39:19', '', '金平区', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524174', '2013-07-30 15:39:19', '', '濠江区', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524175', '2013-07-30 15:39:20', '', '潮阳区', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524176', '2013-07-30 15:39:20', '', '潮南区', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524177', '2013-07-30 15:39:20', '', '澄海区', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524178', '2013-07-30 15:39:20', '', '南澳县', '2', '0', '4524170', '');
INSERT INTO `shopping_area` VALUES ('4524179', '2013-07-30 15:39:20', '', '佛山市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524180', '2013-07-30 15:39:20', '', '市辖区', '2', '0', '4524179', '');
INSERT INTO `shopping_area` VALUES ('4524181', '2013-07-30 15:39:20', '', '禅城区', '2', '0', '4524179', '');
INSERT INTO `shopping_area` VALUES ('4524182', '2013-07-30 15:39:20', '', '南海区', '2', '0', '4524179', '');
INSERT INTO `shopping_area` VALUES ('4524183', '2013-07-30 15:39:20', '', '顺德区', '2', '0', '4524179', '');
INSERT INTO `shopping_area` VALUES ('4524184', '2013-07-30 15:39:20', '', '三水区', '2', '0', '4524179', '');
INSERT INTO `shopping_area` VALUES ('4524185', '2013-07-30 15:39:20', '', '高明区', '2', '0', '4524179', '');
INSERT INTO `shopping_area` VALUES ('4524186', '2013-07-30 15:39:20', '', '江门市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524187', '2013-07-30 15:39:20', '', '市辖区', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524188', '2013-07-30 15:39:21', '', '蓬江区', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524189', '2013-07-30 15:39:21', '', '江海区', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524190', '2013-07-30 15:39:21', '', '新会区', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524191', '2013-07-30 15:39:21', '', '台山市', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524192', '2013-07-30 15:39:21', '', '开平市', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524193', '2013-07-30 15:39:21', '', '鹤山市', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524194', '2013-07-30 15:39:21', '', '恩平市', '2', '0', '4524186', '');
INSERT INTO `shopping_area` VALUES ('4524195', '2013-07-30 15:39:21', '', '湛江市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524196', '2013-07-30 15:39:21', '', '市辖区', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524197', '2013-07-30 15:39:21', '', '赤坎区', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524198', '2013-07-30 15:39:21', '', '霞山区', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524199', '2013-07-30 15:39:21', '', '坡头区', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524200', '2013-07-30 15:39:21', '', '麻章区', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524201', '2013-07-30 15:39:21', '', '遂溪县', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524202', '2013-07-30 15:39:22', '', '徐闻县', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524203', '2013-07-30 15:39:22', '', '廉江市', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524204', '2013-07-30 15:39:22', '', '雷州市', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524205', '2013-07-30 15:39:22', '', '吴川市', '2', '0', '4524195', '');
INSERT INTO `shopping_area` VALUES ('4524206', '2013-07-30 15:39:22', '', '茂名市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524207', '2013-07-30 15:39:22', '', '市辖区', '2', '0', '4524206', '');
INSERT INTO `shopping_area` VALUES ('4524208', '2013-07-30 15:39:22', '', '茂南区', '2', '0', '4524206', '');
INSERT INTO `shopping_area` VALUES ('4524209', '2013-07-30 15:39:22', '', '茂港区', '2', '0', '4524206', '');
INSERT INTO `shopping_area` VALUES ('4524210', '2013-07-30 15:39:22', '', '电白县', '2', '0', '4524206', '');
INSERT INTO `shopping_area` VALUES ('4524211', '2013-07-30 15:39:22', '', '高州市', '2', '0', '4524206', '');
INSERT INTO `shopping_area` VALUES ('4524212', '2013-07-30 15:39:22', '', '化州市', '2', '0', '4524206', '');
INSERT INTO `shopping_area` VALUES ('4524213', '2013-07-30 15:39:22', '', '信宜市', '2', '0', '4524206', '');
INSERT INTO `shopping_area` VALUES ('4524214', '2013-07-30 15:39:22', '', '肇庆市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524215', '2013-07-30 15:39:22', '', '市辖区', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524216', '2013-07-30 15:39:22', '', '端州区', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524217', '2013-07-30 15:39:23', '', '鼎湖区', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524218', '2013-07-30 15:39:23', '', '广宁县', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524219', '2013-07-30 15:39:23', '', '怀集县', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524220', '2013-07-30 15:39:23', '', '封开县', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524221', '2013-07-30 15:39:23', '', '德庆县', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524222', '2013-07-30 15:39:23', '', '高要市', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524223', '2013-07-30 15:39:23', '', '四会市', '2', '0', '4524214', '');
INSERT INTO `shopping_area` VALUES ('4524224', '2013-07-30 15:39:23', '', '惠州市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524225', '2013-07-30 15:39:23', '', '市辖区', '2', '0', '4524224', '');
INSERT INTO `shopping_area` VALUES ('4524226', '2013-07-30 15:39:23', '', '惠城区', '2', '0', '4524224', '');
INSERT INTO `shopping_area` VALUES ('4524227', '2013-07-30 15:39:23', '', '惠阳区', '2', '0', '4524224', '');
INSERT INTO `shopping_area` VALUES ('4524228', '2013-07-30 15:39:23', '', '博罗县', '2', '0', '4524224', '');
INSERT INTO `shopping_area` VALUES ('4524229', '2013-07-30 15:39:24', '', '惠东县', '2', '0', '4524224', '');
INSERT INTO `shopping_area` VALUES ('4524230', '2013-07-30 15:39:24', '', '龙门县', '2', '0', '4524224', '');
INSERT INTO `shopping_area` VALUES ('4524231', '2013-07-30 15:39:24', '', '梅州市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524232', '2013-07-30 15:39:24', '', '市辖区', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524233', '2013-07-30 15:39:24', '', '梅江区', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524234', '2013-07-30 15:39:24', '', '梅县', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524235', '2013-07-30 15:39:24', '', '大埔县', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524236', '2013-07-30 15:39:24', '', '丰顺县', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524237', '2013-07-30 15:39:24', '', '五华县', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524238', '2013-07-30 15:39:24', '', '平远县', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524239', '2013-07-30 15:39:24', '', '蕉岭县', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524240', '2013-07-30 15:39:24', '', '兴宁市', '2', '0', '4524231', '');
INSERT INTO `shopping_area` VALUES ('4524241', '2013-07-30 15:39:24', '', '汕尾市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524242', '2013-07-30 15:39:24', '', '市辖区', '2', '0', '4524241', '');
INSERT INTO `shopping_area` VALUES ('4524243', '2013-07-30 15:39:25', '', '城区', '2', '0', '4524241', '');
INSERT INTO `shopping_area` VALUES ('4524244', '2013-07-30 15:39:25', '', '海丰县', '2', '0', '4524241', '');
INSERT INTO `shopping_area` VALUES ('4524245', '2013-07-30 15:39:25', '', '陆河县', '2', '0', '4524241', '');
INSERT INTO `shopping_area` VALUES ('4524246', '2013-07-30 15:39:25', '', '陆丰市', '2', '0', '4524241', '');
INSERT INTO `shopping_area` VALUES ('4524247', '2013-07-30 15:39:25', '', '河源市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524248', '2013-07-30 15:39:25', '', '市辖区', '2', '0', '4524247', '');
INSERT INTO `shopping_area` VALUES ('4524249', '2013-07-30 15:39:25', '', '源城区', '2', '0', '4524247', '');
INSERT INTO `shopping_area` VALUES ('4524250', '2013-07-30 15:39:25', '', '紫金县', '2', '0', '4524247', '');
INSERT INTO `shopping_area` VALUES ('4524251', '2013-07-30 15:39:25', '', '龙川县', '2', '0', '4524247', '');
INSERT INTO `shopping_area` VALUES ('4524252', '2013-07-30 15:39:25', '', '连平县', '2', '0', '4524247', '');
INSERT INTO `shopping_area` VALUES ('4524253', '2013-07-30 15:39:25', '', '和平县', '2', '0', '4524247', '');
INSERT INTO `shopping_area` VALUES ('4524254', '2013-07-30 15:39:25', '', '东源县', '2', '0', '4524247', '');
INSERT INTO `shopping_area` VALUES ('4524255', '2013-07-30 15:39:26', '', '阳江市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524256', '2013-07-30 15:39:26', '', '市辖区', '2', '0', '4524255', '');
INSERT INTO `shopping_area` VALUES ('4524257', '2013-07-30 15:39:26', '', '江城区', '2', '0', '4524255', '');
INSERT INTO `shopping_area` VALUES ('4524258', '2013-07-30 15:39:26', '', '阳西县', '2', '0', '4524255', '');
INSERT INTO `shopping_area` VALUES ('4524259', '2013-07-30 15:39:26', '', '阳东县', '2', '0', '4524255', '');
INSERT INTO `shopping_area` VALUES ('4524260', '2013-07-30 15:39:26', '', '阳春市', '2', '0', '4524255', '');
INSERT INTO `shopping_area` VALUES ('4524261', '2013-07-30 15:39:26', '', '清远市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524262', '2013-07-30 15:39:26', '', '市辖区', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524263', '2013-07-30 15:39:26', '', '清城区', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524264', '2013-07-30 15:39:26', '', '佛冈县', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524265', '2013-07-30 15:39:26', '', '阳山县', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524266', '2013-07-30 15:39:26', '', '连山壮族瑶族自治县', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524267', '2013-07-30 15:39:27', '', '连南瑶族自治县', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524268', '2013-07-30 15:39:27', '', '清新县', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524269', '2013-07-30 15:39:27', '', '英德市', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524270', '2013-07-30 15:39:27', '', '连州市', '2', '0', '4524261', '');
INSERT INTO `shopping_area` VALUES ('4524271', '2013-07-30 15:39:27', '', '东莞市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524272', '2013-07-30 15:39:27', '', '中山市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524273', '2013-07-30 15:39:27', '', '潮州市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524274', '2013-07-30 15:39:27', '', '市辖区', '2', '0', '4524273', '');
INSERT INTO `shopping_area` VALUES ('4524275', '2013-07-30 15:39:27', '', '湘桥区', '2', '0', '4524273', '');
INSERT INTO `shopping_area` VALUES ('4524276', '2013-07-30 15:39:27', '', '潮安县', '2', '0', '4524273', '');
INSERT INTO `shopping_area` VALUES ('4524277', '2013-07-30 15:39:27', '', '饶平县', '2', '0', '4524273', '');
INSERT INTO `shopping_area` VALUES ('4524278', '2013-07-30 15:39:27', '', '揭阳市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524279', '2013-07-30 15:39:28', '', '市辖区', '2', '0', '4524278', '');
INSERT INTO `shopping_area` VALUES ('4524280', '2013-07-30 15:39:28', '', '榕城区', '2', '0', '4524278', '');
INSERT INTO `shopping_area` VALUES ('4524281', '2013-07-30 15:39:28', '', '揭东县', '2', '0', '4524278', '');
INSERT INTO `shopping_area` VALUES ('4524282', '2013-07-30 15:39:28', '', '揭西县', '2', '0', '4524278', '');
INSERT INTO `shopping_area` VALUES ('4524283', '2013-07-30 15:39:28', '', '惠来县', '2', '0', '4524278', '');
INSERT INTO `shopping_area` VALUES ('4524284', '2013-07-30 15:39:28', '', '普宁市', '2', '0', '4524278', '');
INSERT INTO `shopping_area` VALUES ('4524285', '2013-07-30 15:39:28', '', '云浮市', '1', '0', '4524130', '');
INSERT INTO `shopping_area` VALUES ('4524286', '2013-07-30 15:39:28', '', '市辖区', '2', '0', '4524285', '');
INSERT INTO `shopping_area` VALUES ('4524287', '2013-07-30 15:39:28', '', '云城区', '2', '0', '4524285', '');
INSERT INTO `shopping_area` VALUES ('4524288', '2013-07-30 15:39:28', '', '新兴县', '2', '0', '4524285', '');
INSERT INTO `shopping_area` VALUES ('4524289', '2013-07-30 15:39:28', '', '郁南县', '2', '0', '4524285', '');
INSERT INTO `shopping_area` VALUES ('4524290', '2013-07-30 15:39:28', '', '云安县', '2', '0', '4524285', '');
INSERT INTO `shopping_area` VALUES ('4524291', '2013-07-30 15:39:28', '', '罗定市', '2', '0', '4524285', '');
INSERT INTO `shopping_area` VALUES ('4524292', '2013-07-30 15:39:29', '', '广西壮族自治区', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524293', '2013-07-30 15:39:29', '', '南宁市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524294', '2013-07-30 15:39:29', '', '市辖区', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524295', '2013-07-30 15:39:29', '', '兴宁区', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524296', '2013-07-30 15:39:29', '', '青秀区', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524297', '2013-07-30 15:39:29', '', '江南区', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524298', '2013-07-30 15:39:29', '', '西乡塘区', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524299', '2013-07-30 15:39:29', '', '良庆区', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524300', '2013-07-30 15:39:29', '', '邕宁区', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524301', '2013-07-30 15:39:29', '', '武鸣县', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524302', '2013-07-30 15:39:29', '', '隆安县', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524303', '2013-07-30 15:39:29', '', '马山县', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524304', '2013-07-30 15:39:30', '', '上林县', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524305', '2013-07-30 15:39:30', '', '宾阳县', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524306', '2013-07-30 15:39:30', '', '横县', '2', '0', '4524293', '');
INSERT INTO `shopping_area` VALUES ('4524307', '2013-07-30 15:39:30', '', '柳州市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524308', '2013-07-30 15:39:30', '', '市辖区', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524309', '2013-07-30 15:39:30', '', '城中区', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524310', '2013-07-30 15:39:30', '', '鱼峰区', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524311', '2013-07-30 15:39:30', '', '柳南区', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524312', '2013-07-30 15:39:30', '', '柳北区', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524313', '2013-07-30 15:39:30', '', '柳江县', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524314', '2013-07-30 15:39:30', '', '柳城县', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524315', '2013-07-30 15:39:30', '', '鹿寨县', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524316', '2013-07-30 15:39:30', '', '融安县', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524317', '2013-07-30 15:39:30', '', '融水苗族自治县', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524318', '2013-07-30 15:39:31', '', '三江侗族自治县', '2', '0', '4524307', '');
INSERT INTO `shopping_area` VALUES ('4524319', '2013-07-30 15:39:31', '', '桂林市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524320', '2013-07-30 15:39:31', '', '市辖区', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524321', '2013-07-30 15:39:31', '', '秀峰区', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524322', '2013-07-30 15:39:31', '', '叠彩区', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524323', '2013-07-30 15:39:31', '', '象山区', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524324', '2013-07-30 15:39:31', '', '七星区', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524325', '2013-07-30 15:39:31', '', '雁山区', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524326', '2013-07-30 15:39:31', '', '阳朔县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524327', '2013-07-30 15:39:31', '', '临桂县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524328', '2013-07-30 15:39:31', '', '灵川县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524329', '2013-07-30 15:39:31', '', '全州县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524330', '2013-07-30 15:39:31', '', '兴安县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524331', '2013-07-30 15:39:32', '', '永福县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524332', '2013-07-30 15:39:32', '', '灌阳县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524333', '2013-07-30 15:39:32', '', '龙胜各族自治县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524334', '2013-07-30 15:39:32', '', '资源县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524335', '2013-07-30 15:39:32', '', '平乐县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524336', '2013-07-30 15:39:32', '', '荔蒲县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524337', '2013-07-30 15:39:32', '', '恭城瑶族自治县', '2', '0', '4524319', '');
INSERT INTO `shopping_area` VALUES ('4524338', '2013-07-30 15:39:32', '', '梧州市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524339', '2013-07-30 15:39:32', '', '市辖区', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524340', '2013-07-30 15:39:32', '', '万秀区', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524341', '2013-07-30 15:39:32', '', '蝶山区', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524342', '2013-07-30 15:39:32', '', '长洲区', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524343', '2013-07-30 15:39:33', '', '苍梧县', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524344', '2013-07-30 15:39:33', '', '藤县', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524345', '2013-07-30 15:39:33', '', '蒙山县', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524346', '2013-07-30 15:39:33', '', '岑溪市', '2', '0', '4524338', '');
INSERT INTO `shopping_area` VALUES ('4524347', '2013-07-30 15:39:33', '', '北海市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524348', '2013-07-30 15:39:33', '', '市辖区', '2', '0', '4524347', '');
INSERT INTO `shopping_area` VALUES ('4524349', '2013-07-30 15:39:33', '', '海城区', '2', '0', '4524347', '');
INSERT INTO `shopping_area` VALUES ('4524350', '2013-07-30 15:39:33', '', '银海区', '2', '0', '4524347', '');
INSERT INTO `shopping_area` VALUES ('4524351', '2013-07-30 15:39:33', '', '铁山港区', '2', '0', '4524347', '');
INSERT INTO `shopping_area` VALUES ('4524352', '2013-07-30 15:39:33', '', '合浦县', '2', '0', '4524347', '');
INSERT INTO `shopping_area` VALUES ('4524353', '2013-07-30 15:39:33', '', '防城港市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524354', '2013-07-30 15:39:34', '', '市辖区', '2', '0', '4524353', '');
INSERT INTO `shopping_area` VALUES ('4524355', '2013-07-30 15:39:34', '', '港口区', '2', '0', '4524353', '');
INSERT INTO `shopping_area` VALUES ('4524356', '2013-07-30 15:39:34', '', '防城区', '2', '0', '4524353', '');
INSERT INTO `shopping_area` VALUES ('4524357', '2013-07-30 15:39:34', '', '上思县', '2', '0', '4524353', '');
INSERT INTO `shopping_area` VALUES ('4524358', '2013-07-30 15:39:34', '', '东兴市', '2', '0', '4524353', '');
INSERT INTO `shopping_area` VALUES ('4524359', '2013-07-30 15:39:34', '', '钦州市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524360', '2013-07-30 15:39:34', '', '市辖区', '2', '0', '4524359', '');
INSERT INTO `shopping_area` VALUES ('4524361', '2013-07-30 15:39:34', '', '钦南区', '2', '0', '4524359', '');
INSERT INTO `shopping_area` VALUES ('4524362', '2013-07-30 15:39:34', '', '钦北区', '2', '0', '4524359', '');
INSERT INTO `shopping_area` VALUES ('4524363', '2013-07-30 15:39:34', '', '灵山县', '2', '0', '4524359', '');
INSERT INTO `shopping_area` VALUES ('4524364', '2013-07-30 15:39:34', '', '浦北县', '2', '0', '4524359', '');
INSERT INTO `shopping_area` VALUES ('4524365', '2013-07-30 15:39:34', '', '贵港市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524366', '2013-07-30 15:39:34', '', '市辖区', '2', '0', '4524365', '');
INSERT INTO `shopping_area` VALUES ('4524367', '2013-07-30 15:39:35', '', '港北区', '2', '0', '4524365', '');
INSERT INTO `shopping_area` VALUES ('4524368', '2013-07-30 15:39:35', '', '港南区', '2', '0', '4524365', '');
INSERT INTO `shopping_area` VALUES ('4524369', '2013-07-30 15:39:35', '', '覃塘区', '2', '0', '4524365', '');
INSERT INTO `shopping_area` VALUES ('4524370', '2013-07-30 15:39:35', '', '平南县', '2', '0', '4524365', '');
INSERT INTO `shopping_area` VALUES ('4524371', '2013-07-30 15:39:35', '', '桂平市', '2', '0', '4524365', '');
INSERT INTO `shopping_area` VALUES ('4524372', '2013-07-30 15:39:35', '', '玉林市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524373', '2013-07-30 15:39:35', '', '市辖区', '2', '0', '4524372', '');
INSERT INTO `shopping_area` VALUES ('4524374', '2013-07-30 15:39:35', '', '玉州区', '2', '0', '4524372', '');
INSERT INTO `shopping_area` VALUES ('4524375', '2013-07-30 15:39:35', '', '容县', '2', '0', '4524372', '');
INSERT INTO `shopping_area` VALUES ('4524376', '2013-07-30 15:39:35', '', '陆川县', '2', '0', '4524372', '');
INSERT INTO `shopping_area` VALUES ('4524377', '2013-07-30 15:39:35', '', '博白县', '2', '0', '4524372', '');
INSERT INTO `shopping_area` VALUES ('4524378', '2013-07-30 15:39:35', '', '兴业县', '2', '0', '4524372', '');
INSERT INTO `shopping_area` VALUES ('4524379', '2013-07-30 15:39:35', '', '北流市', '2', '0', '4524372', '');
INSERT INTO `shopping_area` VALUES ('4524380', '2013-07-30 15:39:35', '', '百色市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524381', '2013-07-30 15:39:36', '', '市辖区', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524382', '2013-07-30 15:39:36', '', '右江区', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524383', '2013-07-30 15:39:36', '', '田阳县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524384', '2013-07-30 15:39:36', '', '田东县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524385', '2013-07-30 15:39:36', '', '平果县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524386', '2013-07-30 15:39:36', '', '德保县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524387', '2013-07-30 15:39:36', '', '靖西县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524388', '2013-07-30 15:39:36', '', '那坡县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524389', '2013-07-30 15:39:36', '', '凌云县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524390', '2013-07-30 15:39:36', '', '乐业县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524391', '2013-07-30 15:39:36', '', '田林县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524392', '2013-07-30 15:39:36', '', '西林县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524393', '2013-07-30 15:39:36', '', '隆林各族自治县', '2', '0', '4524380', '');
INSERT INTO `shopping_area` VALUES ('4524394', '2013-07-30 15:39:37', '', '贺州市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524395', '2013-07-30 15:39:37', '', '市辖区', '2', '0', '4524394', '');
INSERT INTO `shopping_area` VALUES ('4524396', '2013-07-30 15:39:37', '', '八步区', '2', '0', '4524394', '');
INSERT INTO `shopping_area` VALUES ('4524397', '2013-07-30 15:39:37', '', '平桂管理区', '2', '0', '4524394', '');
INSERT INTO `shopping_area` VALUES ('4524398', '2013-07-30 15:39:37', '', '昭平县', '2', '0', '4524394', '');
INSERT INTO `shopping_area` VALUES ('4524399', '2013-07-30 15:39:37', '', '钟山县', '2', '0', '4524394', '');
INSERT INTO `shopping_area` VALUES ('4524400', '2013-07-30 15:39:37', '', '富川瑶族自治县', '2', '0', '4524394', '');
INSERT INTO `shopping_area` VALUES ('4524401', '2013-07-30 15:39:37', '', '河池市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524402', '2013-07-30 15:39:37', '', '市辖区', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524403', '2013-07-30 15:39:37', '', '金城江区', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524404', '2013-07-30 15:39:37', '', '南丹县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524405', '2013-07-30 15:39:37', '', '天峨县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524406', '2013-07-30 15:39:37', '', '凤山县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524407', '2013-07-30 15:39:38', '', '东兰县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524408', '2013-07-30 15:39:38', '', '罗城仫佬族自治县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524409', '2013-07-30 15:39:38', '', '环江毛南族自治县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524410', '2013-07-30 15:39:38', '', '巴马瑶族自治县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524411', '2013-07-30 15:39:38', '', '都安瑶族自治县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524412', '2013-07-30 15:39:38', '', '大化瑶族自治县', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524413', '2013-07-30 15:39:38', '', '宜州市', '2', '0', '4524401', '');
INSERT INTO `shopping_area` VALUES ('4524414', '2013-07-30 15:39:38', '', '来宾市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524415', '2013-07-30 15:39:38', '', '市辖区', '2', '0', '4524414', '');
INSERT INTO `shopping_area` VALUES ('4524416', '2013-07-30 15:39:38', '', '兴宾区', '2', '0', '4524414', '');
INSERT INTO `shopping_area` VALUES ('4524417', '2013-07-30 15:39:38', '', '忻城县', '2', '0', '4524414', '');
INSERT INTO `shopping_area` VALUES ('4524418', '2013-07-30 15:39:38', '', '象州县', '2', '0', '4524414', '');
INSERT INTO `shopping_area` VALUES ('4524419', '2013-07-30 15:39:38', '', '武宣县', '2', '0', '4524414', '');
INSERT INTO `shopping_area` VALUES ('4524420', '2013-07-30 15:39:39', '', '金秀瑶族自治县', '2', '0', '4524414', '');
INSERT INTO `shopping_area` VALUES ('4524421', '2013-07-30 15:39:39', '', '合山市', '2', '0', '4524414', '');
INSERT INTO `shopping_area` VALUES ('4524422', '2013-07-30 15:39:39', '', '崇左市', '1', '0', '4524292', '');
INSERT INTO `shopping_area` VALUES ('4524423', '2013-07-30 15:39:39', '', '市辖区', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524424', '2013-07-30 15:39:39', '', '江洲区', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524425', '2013-07-30 15:39:39', '', '扶绥县', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524426', '2013-07-30 15:39:39', '', '宁明县', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524427', '2013-07-30 15:39:39', '', '龙州县', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524428', '2013-07-30 15:39:39', '', '大新县', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524429', '2013-07-30 15:39:39', '', '天等县', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524430', '2013-07-30 15:39:39', '', '凭祥市', '2', '0', '4524422', '');
INSERT INTO `shopping_area` VALUES ('4524431', '2013-07-30 15:39:39', '', '海南省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524432', '2013-07-30 15:39:39', '', '海口市', '1', '0', '4524431', '');
INSERT INTO `shopping_area` VALUES ('4524433', '2013-07-30 15:39:40', '', '市辖区', '2', '0', '4524432', '');
INSERT INTO `shopping_area` VALUES ('4524434', '2013-07-30 15:39:40', '', '秀英区', '2', '0', '4524432', '');
INSERT INTO `shopping_area` VALUES ('4524435', '2013-07-30 15:39:40', '', '龙华区', '2', '0', '4524432', '');
INSERT INTO `shopping_area` VALUES ('4524436', '2013-07-30 15:39:40', '', '琼山区', '2', '0', '4524432', '');
INSERT INTO `shopping_area` VALUES ('4524437', '2013-07-30 15:39:40', '', '美兰区', '2', '0', '4524432', '');
INSERT INTO `shopping_area` VALUES ('4524438', '2013-07-30 15:39:40', '', '三亚市', '1', '0', '4524431', '');
INSERT INTO `shopping_area` VALUES ('4524439', '2013-07-30 15:39:40', '', '市辖区', '2', '0', '4524438', '');
INSERT INTO `shopping_area` VALUES ('4524440', '2013-07-30 15:39:40', '', '省直辖县级行政区划', '1', '0', '4524431', '');
INSERT INTO `shopping_area` VALUES ('4524441', '2013-07-30 15:39:40', '', '五指山市', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524442', '2013-07-30 15:39:40', '', '琼海市', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524443', '2013-07-30 15:39:40', '', '儋州市', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524444', '2013-07-30 15:39:40', '', '文昌市', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524445', '2013-07-30 15:39:40', '', '万宁市', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524446', '2013-07-30 15:39:41', '', '东方市', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524447', '2013-07-30 15:39:41', '', '定安县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524448', '2013-07-30 15:39:41', '', '屯昌县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524449', '2013-07-30 15:39:41', '', '澄迈县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524450', '2013-07-30 15:39:41', '', '临高县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524451', '2013-07-30 15:39:41', '', '白沙黎族自治县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524452', '2013-07-30 15:39:41', '', '昌江黎族自治县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524453', '2013-07-30 15:39:41', '', '乐东黎族自治县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524454', '2013-07-30 15:39:41', '', '陵水黎族自治县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524455', '2013-07-30 15:39:41', '', '保亭黎族苗族自治县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524456', '2013-07-30 15:39:41', '', '琼中黎族苗族自治县', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524457', '2013-07-30 15:39:41', '', '西沙群岛', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524458', '2013-07-30 15:39:41', '', '南沙群岛', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524459', '2013-07-30 15:39:42', '', '中沙群岛的岛礁及其海域', '2', '0', '4524440', '');
INSERT INTO `shopping_area` VALUES ('4524460', '2013-07-30 15:39:42', '', '重庆市', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524461', '2013-07-30 15:39:42', '', '重庆市', '1', '0', '4524460', '');
INSERT INTO `shopping_area` VALUES ('4524462', '2013-07-30 15:39:42', '', '万州区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524463', '2013-07-30 15:39:42', '', '涪陵区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524464', '2013-07-30 15:39:42', '', '渝中区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524465', '2013-07-30 15:39:42', '', '大渡口区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524466', '2013-07-30 15:39:42', '', '江北区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524467', '2013-07-30 15:39:42', '', '沙坪坝区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524468', '2013-07-30 15:39:42', '', '九龙坡区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524469', '2013-07-30 15:39:42', '', '南岸区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524470', '2013-07-30 15:39:42', '', '北碚区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524471', '2013-07-30 15:39:43', '', '万盛区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524472', '2013-07-30 15:39:43', '', '双桥区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524473', '2013-07-30 15:39:43', '', '渝北区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524474', '2013-07-30 15:39:43', '', '巴南区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524475', '2013-07-30 15:39:43', '', '黔江区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524476', '2013-07-30 15:39:43', '', '长寿区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524477', '2013-07-30 15:39:43', '', '江津区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524478', '2013-07-30 15:39:43', '', '合川区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524479', '2013-07-30 15:39:43', '', '永川区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524480', '2013-07-30 15:39:43', '', '南川区', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524482', '2013-07-30 15:39:43', '', '綦江县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524483', '2013-07-30 15:39:44', '', '潼南县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524484', '2013-07-30 15:39:44', '', '铜梁县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524485', '2013-07-30 15:39:44', '', '大足县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524486', '2013-07-30 15:39:44', '', '荣昌县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524487', '2013-07-30 15:39:44', '', '璧山县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524488', '2013-07-30 15:39:44', '', '梁平县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524489', '2013-07-30 15:39:44', '', '城口县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524490', '2013-07-30 15:39:44', '', '丰都县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524491', '2013-07-30 15:39:44', '', '垫江县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524492', '2013-07-30 15:39:44', '', '武隆县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524493', '2013-07-30 15:39:44', '', '忠县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524494', '2013-07-30 15:39:44', '', '开县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524495', '2013-07-30 15:39:44', '', '云阳县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524496', '2013-07-30 15:39:45', '', '奉节县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524497', '2013-07-30 15:39:45', '', '巫山县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524498', '2013-07-30 15:39:45', '', '巫溪县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524499', '2013-07-30 15:39:45', '', '石柱土家族自治县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524500', '2013-07-30 15:39:45', '', '秀山土家族苗族自治县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524501', '2013-07-30 15:39:45', '', '酉阳土家族苗族自治县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524502', '2013-07-30 15:39:45', '', '彭水苗族土家族自治县', '2', '0', '4524461', '');
INSERT INTO `shopping_area` VALUES ('4524503', '2013-07-30 15:39:45', '', '四川省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524504', '2013-07-30 15:39:45', '', '成都市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524505', '2013-07-30 15:39:45', '', '市辖区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524506', '2013-07-30 15:39:45', '', '锦江区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524507', '2013-07-30 15:39:45', '', '青羊区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524508', '2013-07-30 15:39:45', '', '金牛区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524509', '2013-07-30 15:39:46', '', '武侯区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524510', '2013-07-30 15:39:46', '', '成华区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524511', '2013-07-30 15:39:46', '', '龙泉驿区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524512', '2013-07-30 15:39:46', '', '青白江区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524513', '2013-07-30 15:39:46', '', '新都区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524514', '2013-07-30 15:39:46', '', '温江区', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524515', '2013-07-30 15:39:46', '', '金堂县', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524516', '2013-07-30 15:39:46', '', '双流县', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524517', '2013-07-30 15:39:46', '', '郫县', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524518', '2013-07-30 15:39:46', '', '大邑县', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524519', '2013-07-30 15:39:46', '', '蒲江县', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524520', '2013-07-30 15:39:46', '', '新津县', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524521', '2013-07-30 15:39:47', '', '都江堰市', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524522', '2013-07-30 15:39:47', '', '彭州市', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524523', '2013-07-30 15:39:47', '', '邛崃市', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524524', '2013-07-30 15:39:47', '', '崇州市', '2', '0', '4524504', '');
INSERT INTO `shopping_area` VALUES ('4524525', '2013-07-30 15:39:47', '', '自贡市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524526', '2013-07-30 15:39:47', '', '市辖区', '2', '0', '4524525', '');
INSERT INTO `shopping_area` VALUES ('4524527', '2013-07-30 15:39:47', '', '自流井区', '2', '0', '4524525', '');
INSERT INTO `shopping_area` VALUES ('4524528', '2013-07-30 15:39:47', '', '贡井区', '2', '0', '4524525', '');
INSERT INTO `shopping_area` VALUES ('4524529', '2013-07-30 15:39:47', '', '大安区', '2', '0', '4524525', '');
INSERT INTO `shopping_area` VALUES ('4524530', '2013-07-30 15:39:47', '', '沿滩区', '2', '0', '4524525', '');
INSERT INTO `shopping_area` VALUES ('4524531', '2013-07-30 15:39:47', '', '荣县', '2', '0', '4524525', '');
INSERT INTO `shopping_area` VALUES ('4524532', '2013-07-30 15:39:47', '', '富顺县', '2', '0', '4524525', '');
INSERT INTO `shopping_area` VALUES ('4524533', '2013-07-30 15:39:48', '', '攀枝花市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524534', '2013-07-30 15:39:48', '', '市辖区', '2', '0', '4524533', '');
INSERT INTO `shopping_area` VALUES ('4524535', '2013-07-30 15:39:48', '', '东区', '2', '0', '4524533', '');
INSERT INTO `shopping_area` VALUES ('4524536', '2013-07-30 15:39:48', '', '西区', '2', '0', '4524533', '');
INSERT INTO `shopping_area` VALUES ('4524537', '2013-07-30 15:39:48', '', '仁和区', '2', '0', '4524533', '');
INSERT INTO `shopping_area` VALUES ('4524538', '2013-07-30 15:39:48', '', '米易县', '2', '0', '4524533', '');
INSERT INTO `shopping_area` VALUES ('4524539', '2013-07-30 15:39:48', '', '盐边县', '2', '0', '4524533', '');
INSERT INTO `shopping_area` VALUES ('4524540', '2013-07-30 15:39:48', '', '泸州市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524541', '2013-07-30 15:39:48', '', '市辖区', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524542', '2013-07-30 15:39:48', '', '江阳区', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524543', '2013-07-30 15:39:48', '', '纳溪区', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524544', '2013-07-30 15:39:48', '', '龙马潭区', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524545', '2013-07-30 15:39:48', '', '泸县', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524546', '2013-07-30 15:39:49', '', '合江县', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524547', '2013-07-30 15:39:49', '', '叙永县', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524548', '2013-07-30 15:39:49', '', '古蔺县', '2', '0', '4524540', '');
INSERT INTO `shopping_area` VALUES ('4524549', '2013-07-30 15:39:49', '', '德阳市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524550', '2013-07-30 15:39:49', '', '市辖区', '2', '0', '4524549', '');
INSERT INTO `shopping_area` VALUES ('4524551', '2013-07-30 15:39:49', '', '旌阳区', '2', '0', '4524549', '');
INSERT INTO `shopping_area` VALUES ('4524552', '2013-07-30 15:39:49', '', '中江县', '2', '0', '4524549', '');
INSERT INTO `shopping_area` VALUES ('4524553', '2013-07-30 15:39:49', '', '罗江县', '2', '0', '4524549', '');
INSERT INTO `shopping_area` VALUES ('4524554', '2013-07-30 15:39:49', '', '广汉市', '2', '0', '4524549', '');
INSERT INTO `shopping_area` VALUES ('4524555', '2013-07-30 15:39:49', '', '什邡市', '2', '0', '4524549', '');
INSERT INTO `shopping_area` VALUES ('4524556', '2013-07-30 15:39:49', '', '绵竹市', '2', '0', '4524549', '');
INSERT INTO `shopping_area` VALUES ('4524557', '2013-07-30 15:39:49', '', '绵阳市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524558', '2013-07-30 15:39:50', '', '市辖区', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524559', '2013-07-30 15:39:50', '', '涪城区', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524560', '2013-07-30 15:39:50', '', '游仙区', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524561', '2013-07-30 15:39:50', '', '三台县', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524562', '2013-07-30 15:39:50', '', '盐亭县', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524563', '2013-07-30 15:39:50', '', '安县', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524564', '2013-07-30 15:39:50', '', '梓潼县', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524565', '2013-07-30 15:39:50', '', '北川羌族自治县', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524566', '2013-07-30 15:39:50', '', '平武县', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524567', '2013-07-30 15:39:50', '', '江油市', '2', '0', '4524557', '');
INSERT INTO `shopping_area` VALUES ('4524568', '2013-07-30 15:39:50', '', '广元市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524569', '2013-07-30 15:39:50', '', '市辖区', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524570', '2013-07-30 15:39:50', '', '利州区', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524571', '2013-07-30 15:39:51', '', '元坝区', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524572', '2013-07-30 15:39:51', '', '朝天区', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524573', '2013-07-30 15:39:51', '', '旺苍县', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524574', '2013-07-30 15:39:51', '', '青川县', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524575', '2013-07-30 15:39:51', '', '剑阁县', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524576', '2013-07-30 15:39:51', '', '苍溪县', '2', '0', '4524568', '');
INSERT INTO `shopping_area` VALUES ('4524577', '2013-07-30 15:39:51', '', '遂宁市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524578', '2013-07-30 15:39:51', '', '市辖区', '2', '0', '4524577', '');
INSERT INTO `shopping_area` VALUES ('4524579', '2013-07-30 15:39:51', '', '船山区', '2', '0', '4524577', '');
INSERT INTO `shopping_area` VALUES ('4524580', '2013-07-30 15:39:51', '', '安居区', '2', '0', '4524577', '');
INSERT INTO `shopping_area` VALUES ('4524581', '2013-07-30 15:39:51', '', '蓬溪县', '2', '0', '4524577', '');
INSERT INTO `shopping_area` VALUES ('4524582', '2013-07-30 15:39:51', '', '射洪县', '2', '0', '4524577', '');
INSERT INTO `shopping_area` VALUES ('4524583', '2013-07-30 15:39:52', '', '大英县', '2', '0', '4524577', '');
INSERT INTO `shopping_area` VALUES ('4524584', '2013-07-30 15:39:52', '', '内江市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524585', '2013-07-30 15:39:52', '', '市辖区', '2', '0', '4524584', '');
INSERT INTO `shopping_area` VALUES ('4524586', '2013-07-30 15:39:52', '', '市中区', '2', '0', '4524584', '');
INSERT INTO `shopping_area` VALUES ('4524587', '2013-07-30 15:39:52', '', '东兴区', '2', '0', '4524584', '');
INSERT INTO `shopping_area` VALUES ('4524588', '2013-07-30 15:39:52', '', '威远县', '2', '0', '4524584', '');
INSERT INTO `shopping_area` VALUES ('4524589', '2013-07-30 15:39:52', '', '资中县', '2', '0', '4524584', '');
INSERT INTO `shopping_area` VALUES ('4524590', '2013-07-30 15:39:52', '', '隆昌县', '2', '0', '4524584', '');
INSERT INTO `shopping_area` VALUES ('4524591', '2013-07-30 15:39:52', '', '乐山市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524592', '2013-07-30 15:39:52', '', '市辖区', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524593', '2013-07-30 15:39:52', '', '市中区', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524594', '2013-07-30 15:39:52', '', '沙湾区', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524595', '2013-07-30 15:39:52', '', '五通桥区', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524596', '2013-07-30 15:39:53', '', '金口河区', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524597', '2013-07-30 15:39:53', '', '犍为县', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524598', '2013-07-30 15:39:53', '', '井研县', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524599', '2013-07-30 15:39:53', '', '夹江县', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524600', '2013-07-30 15:39:53', '', '沐川县', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524601', '2013-07-30 15:39:53', '', '峨边彝族自治县', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524602', '2013-07-30 15:39:53', '', '马边彝族自治县', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524603', '2013-07-30 15:39:53', '', '峨眉山市', '2', '0', '4524591', '');
INSERT INTO `shopping_area` VALUES ('4524604', '2013-07-30 15:39:53', '', '南充市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524605', '2013-07-30 15:39:54', '', '市辖区', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524606', '2013-07-30 15:39:54', '', '顺庆区', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524607', '2013-07-30 15:39:54', '', '高坪区', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524608', '2013-07-30 15:39:54', '', '嘉陵区', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524609', '2013-07-30 15:39:54', '', '南部县', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524610', '2013-07-30 15:39:54', '', '营山县', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524611', '2013-07-30 15:39:54', '', '蓬安县', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524612', '2013-07-30 15:39:54', '', '仪陇县', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524613', '2013-07-30 15:39:54', '', '西充县', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524614', '2013-07-30 15:39:54', '', '阆中市', '2', '0', '4524604', '');
INSERT INTO `shopping_area` VALUES ('4524615', '2013-07-30 15:39:54', '', '眉山市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524616', '2013-07-30 15:39:54', '', '市辖区', '2', '0', '4524615', '');
INSERT INTO `shopping_area` VALUES ('4524617', '2013-07-30 15:39:55', '', '东坡区', '2', '0', '4524615', '');
INSERT INTO `shopping_area` VALUES ('4524618', '2013-07-30 15:39:55', '', '仁寿县', '2', '0', '4524615', '');
INSERT INTO `shopping_area` VALUES ('4524619', '2013-07-30 15:39:55', '', '彭山县', '2', '0', '4524615', '');
INSERT INTO `shopping_area` VALUES ('4524620', '2013-07-30 15:39:55', '', '洪雅县', '2', '0', '4524615', '');
INSERT INTO `shopping_area` VALUES ('4524621', '2013-07-30 15:39:55', '', '丹棱县', '2', '0', '4524615', '');
INSERT INTO `shopping_area` VALUES ('4524622', '2013-07-30 15:39:55', '', '青神县', '2', '0', '4524615', '');
INSERT INTO `shopping_area` VALUES ('4524623', '2013-07-30 15:39:55', '', '宜宾市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524624', '2013-07-30 15:39:55', '', '市辖区', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524625', '2013-07-30 15:39:55', '', '翠屏区', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524626', '2013-07-30 15:39:55', '', '宜宾县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524627', '2013-07-30 15:39:55', '', '南溪县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524628', '2013-07-30 15:39:55', '', '江安县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524629', '2013-07-30 15:39:55', '', '长宁县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524630', '2013-07-30 15:39:56', '', '高县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524631', '2013-07-30 15:39:56', '', '珙县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524632', '2013-07-30 15:39:56', '', '筠连县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524633', '2013-07-30 15:39:56', '', '兴文县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524634', '2013-07-30 15:39:56', '', '屏山县', '2', '0', '4524623', '');
INSERT INTO `shopping_area` VALUES ('4524635', '2013-07-30 15:39:56', '', '广安市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524636', '2013-07-30 15:39:56', '', '市辖区', '2', '0', '4524635', '');
INSERT INTO `shopping_area` VALUES ('4524637', '2013-07-30 15:39:56', '', '广安区', '2', '0', '4524635', '');
INSERT INTO `shopping_area` VALUES ('4524638', '2013-07-30 15:39:56', '', '岳池县', '2', '0', '4524635', '');
INSERT INTO `shopping_area` VALUES ('4524639', '2013-07-30 15:39:56', '', '武胜县', '2', '0', '4524635', '');
INSERT INTO `shopping_area` VALUES ('4524640', '2013-07-30 15:39:56', '', '邻水县', '2', '0', '4524635', '');
INSERT INTO `shopping_area` VALUES ('4524641', '2013-07-30 15:39:56', '', '华蓥市', '2', '0', '4524635', '');
INSERT INTO `shopping_area` VALUES ('4524642', '2013-07-30 15:39:56', '', '达州市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524643', '2013-07-30 15:39:57', '', '市辖区', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524644', '2013-07-30 15:39:57', '', '通川区', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524645', '2013-07-30 15:39:57', '', '达县', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524646', '2013-07-30 15:39:57', '', '宣汉县', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524647', '2013-07-30 15:39:57', '', '开江县', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524648', '2013-07-30 15:39:57', '', '大竹县', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524649', '2013-07-30 15:39:57', '', '渠县', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524650', '2013-07-30 15:39:57', '', '万源市', '2', '0', '4524642', '');
INSERT INTO `shopping_area` VALUES ('4524651', '2013-07-30 15:39:57', '', '雅安市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524652', '2013-07-30 15:39:57', '', '市辖区', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524653', '2013-07-30 15:39:57', '', '雨城区', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524654', '2013-07-30 15:39:57', '', '名山县', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524655', '2013-07-30 15:39:58', '', '荥经县', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524656', '2013-07-30 15:39:58', '', '汉源县', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524657', '2013-07-30 15:39:58', '', '石棉县', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524658', '2013-07-30 15:39:58', '', '天全县', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524659', '2013-07-30 15:39:58', '', '芦山县', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524660', '2013-07-30 15:39:58', '', '宝兴县', '2', '0', '4524651', '');
INSERT INTO `shopping_area` VALUES ('4524661', '2013-07-30 15:39:58', '', '巴中市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524662', '2013-07-30 15:39:58', '', '市辖区', '2', '0', '4524661', '');
INSERT INTO `shopping_area` VALUES ('4524663', '2013-07-30 15:39:58', '', '巴州区', '2', '0', '4524661', '');
INSERT INTO `shopping_area` VALUES ('4524664', '2013-07-30 15:39:58', '', '通江县', '2', '0', '4524661', '');
INSERT INTO `shopping_area` VALUES ('4524665', '2013-07-30 15:39:58', '', '南江县', '2', '0', '4524661', '');
INSERT INTO `shopping_area` VALUES ('4524666', '2013-07-30 15:39:58', '', '平昌县', '2', '0', '4524661', '');
INSERT INTO `shopping_area` VALUES ('4524667', '2013-07-30 15:39:59', '', '资阳市', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524668', '2013-07-30 15:39:59', '', '市辖区', '2', '0', '4524667', '');
INSERT INTO `shopping_area` VALUES ('4524669', '2013-07-30 15:39:59', '', '雁江区', '2', '0', '4524667', '');
INSERT INTO `shopping_area` VALUES ('4524670', '2013-07-30 15:39:59', '', '安岳县', '2', '0', '4524667', '');
INSERT INTO `shopping_area` VALUES ('4524671', '2013-07-30 15:39:59', '', '乐至县', '2', '0', '4524667', '');
INSERT INTO `shopping_area` VALUES ('4524672', '2013-07-30 15:39:59', '', '简阳市', '2', '0', '4524667', '');
INSERT INTO `shopping_area` VALUES ('4524673', '2013-07-30 15:39:59', '', '阿坝藏族羌族自治州', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524674', '2013-07-30 15:39:59', '', '汶川县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524675', '2013-07-30 15:39:59', '', '理县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524676', '2013-07-30 15:39:59', '', '茂县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524677', '2013-07-30 15:39:59', '', '松潘县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524678', '2013-07-30 15:39:59', '', '九寨沟县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524679', '2013-07-30 15:40:00', '', '金川县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524680', '2013-07-30 15:40:00', '', '小金县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524681', '2013-07-30 15:40:00', '', '黑水县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524682', '2013-07-30 15:40:00', '', '马尔康县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524683', '2013-07-30 15:40:00', '', '壤塘县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524684', '2013-07-30 15:40:00', '', '阿坝县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524685', '2013-07-30 15:40:00', '', '若尔盖县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524686', '2013-07-30 15:40:00', '', '红原县', '2', '0', '4524673', '');
INSERT INTO `shopping_area` VALUES ('4524687', '2013-07-30 15:40:00', '', '甘孜藏族自治州', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524688', '2013-07-30 15:40:00', '', '康定县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524689', '2013-07-30 15:40:00', '', '泸定县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524690', '2013-07-30 15:40:00', '', '丹巴县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524691', '2013-07-30 15:40:01', '', '九龙县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524692', '2013-07-30 15:40:01', '', '雅江县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524693', '2013-07-30 15:40:01', '', '道孚县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524694', '2013-07-30 15:40:01', '', '炉霍县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524695', '2013-07-30 15:40:01', '', '甘孜县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524696', '2013-07-30 15:40:01', '', '新龙县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524697', '2013-07-30 15:40:01', '', '德格县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524698', '2013-07-30 15:40:01', '', '白玉县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524699', '2013-07-30 15:40:01', '', '石渠县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524700', '2013-07-30 15:40:01', '', '色达县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524701', '2013-07-30 15:40:01', '', '理塘县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524702', '2013-07-30 15:40:01', '', '巴塘县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524703', '2013-07-30 15:40:02', '', '乡城县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524704', '2013-07-30 15:40:02', '', '稻城县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524705', '2013-07-30 15:40:02', '', '得荣县', '2', '0', '4524687', '');
INSERT INTO `shopping_area` VALUES ('4524706', '2013-07-30 15:40:02', '', '凉山彝族自治州', '1', '0', '4524503', '');
INSERT INTO `shopping_area` VALUES ('4524707', '2013-07-30 15:40:02', '', '西昌市', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524708', '2013-07-30 15:40:02', '', '木里藏族自治县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524709', '2013-07-30 15:40:02', '', '盐源县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524710', '2013-07-30 15:40:02', '', '德昌县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524711', '2013-07-30 15:40:02', '', '会理县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524712', '2013-07-30 15:40:02', '', '会东县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524713', '2013-07-30 15:40:02', '', '宁南县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524714', '2013-07-30 15:40:02', '', '普格县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524715', '2013-07-30 15:40:03', '', '布拖县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524716', '2013-07-30 15:40:03', '', '金阳县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524717', '2013-07-30 15:40:03', '', '昭觉县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524718', '2013-07-30 15:40:03', '', '喜德县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524719', '2013-07-30 15:40:03', '', '冕宁县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524720', '2013-07-30 15:40:03', '', '越西县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524721', '2013-07-30 15:40:03', '', '甘洛县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524722', '2013-07-30 15:40:03', '', '美姑县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524723', '2013-07-30 15:40:03', '', '雷波县', '2', '0', '4524706', '');
INSERT INTO `shopping_area` VALUES ('4524724', '2013-07-30 15:40:03', '', '贵州省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524725', '2013-07-30 15:40:03', '', '贵阳市', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524726', '2013-07-30 15:40:03', '', '市辖区', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524727', '2013-07-30 15:40:04', '', '南明区', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524728', '2013-07-30 15:40:04', '', '云岩区', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524729', '2013-07-30 15:40:04', '', '花溪区', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524730', '2013-07-30 15:40:04', '', '乌当区', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524731', '2013-07-30 15:40:04', '', '白云区', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524732', '2013-07-30 15:40:04', '', '小河区', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524733', '2013-07-30 15:40:04', '', '开阳县', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524734', '2013-07-30 15:40:04', '', '息烽县', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524735', '2013-07-30 15:40:04', '', '修文县', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524736', '2013-07-30 15:40:04', '', '清镇市', '2', '0', '4524725', '');
INSERT INTO `shopping_area` VALUES ('4524737', '2013-07-30 15:40:05', '', '六盘水市', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524738', '2013-07-30 15:40:05', '', '钟山区', '2', '0', '4524737', '');
INSERT INTO `shopping_area` VALUES ('4524739', '2013-07-30 15:40:05', '', '六枝特区', '2', '0', '4524737', '');
INSERT INTO `shopping_area` VALUES ('4524740', '2013-07-30 15:40:05', '', '水城县', '2', '0', '4524737', '');
INSERT INTO `shopping_area` VALUES ('4524741', '2013-07-30 15:40:05', '', '盘县', '2', '0', '4524737', '');
INSERT INTO `shopping_area` VALUES ('4524742', '2013-07-30 15:40:05', '', '遵义市', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524743', '2013-07-30 15:40:05', '', '市辖区', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524744', '2013-07-30 15:40:05', '', '红花岗区', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524745', '2013-07-30 15:40:05', '', '汇川区', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524746', '2013-07-30 15:40:05', '', '遵义县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524747', '2013-07-30 15:40:05', '', '桐梓县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524748', '2013-07-30 15:40:05', '', '绥阳县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524749', '2013-07-30 15:40:06', '', '正安县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524750', '2013-07-30 15:40:06', '', '道真仡佬族苗族自治县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524751', '2013-07-30 15:40:06', '', '务川仡佬族苗族自治县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524752', '2013-07-30 15:40:06', '', '凤冈县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524753', '2013-07-30 15:40:06', '', '湄潭县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524754', '2013-07-30 15:40:06', '', '余庆县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524755', '2013-07-30 15:40:06', '', '习水县', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524756', '2013-07-30 15:40:06', '', '赤水市', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524757', '2013-07-30 15:40:06', '', '仁怀市', '2', '0', '4524742', '');
INSERT INTO `shopping_area` VALUES ('4524758', '2013-07-30 15:40:06', '', '安顺市', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524759', '2013-07-30 15:40:06', '', '市辖区', '2', '0', '4524758', '');
INSERT INTO `shopping_area` VALUES ('4524760', '2013-07-30 15:40:07', '', '西秀区', '2', '0', '4524758', '');
INSERT INTO `shopping_area` VALUES ('4524761', '2013-07-30 15:40:07', '', '平坝县', '2', '0', '4524758', '');
INSERT INTO `shopping_area` VALUES ('4524762', '2013-07-30 15:40:07', '', '普定县', '2', '0', '4524758', '');
INSERT INTO `shopping_area` VALUES ('4524763', '2013-07-30 15:40:07', '', '镇宁布依族苗族自治县', '2', '0', '4524758', '');
INSERT INTO `shopping_area` VALUES ('4524764', '2013-07-30 15:40:07', '', '关岭布依族苗族自治县', '2', '0', '4524758', '');
INSERT INTO `shopping_area` VALUES ('4524765', '2013-07-30 15:40:07', '', '紫云苗族布依族自治县', '2', '0', '4524758', '');
INSERT INTO `shopping_area` VALUES ('4524766', '2013-07-30 15:40:07', '', '铜仁地区', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524767', '2013-07-30 15:40:07', '', '铜仁市', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524768', '2013-07-30 15:40:07', '', '江口县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524769', '2013-07-30 15:40:07', '', '玉屏侗族自治县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524770', '2013-07-30 15:40:07', '', '石阡县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524771', '2013-07-30 15:40:07', '', '思南县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524772', '2013-07-30 15:40:08', '', '印江土家族苗族自治县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524773', '2013-07-30 15:40:08', '', '德江县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524774', '2013-07-30 15:40:08', '', '沿河土家族自治县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524775', '2013-07-30 15:40:08', '', '松桃苗族自治县', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524776', '2013-07-30 15:40:08', '', '万山特区', '2', '0', '4524766', '');
INSERT INTO `shopping_area` VALUES ('4524777', '2013-07-30 15:40:08', '', '黔西南布依族苗族自治州', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524778', '2013-07-30 15:40:08', '', '兴义市', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524779', '2013-07-30 15:40:08', '', '兴仁县', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524780', '2013-07-30 15:40:08', '', '普安县', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524781', '2013-07-30 15:40:08', '', '晴隆县', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524782', '2013-07-30 15:40:08', '', '贞丰县', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524783', '2013-07-30 15:40:08', '', '望谟县', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524784', '2013-07-30 15:40:09', '', '册亨县', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524785', '2013-07-30 15:40:09', '', '安龙县', '2', '0', '4524777', '');
INSERT INTO `shopping_area` VALUES ('4524786', '2013-07-30 15:40:09', '', '毕节地区', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524787', '2013-07-30 15:40:09', '', '毕节市', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524788', '2013-07-30 15:40:09', '', '大方县', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524789', '2013-07-30 15:40:09', '', '黔西县', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524790', '2013-07-30 15:40:09', '', '金沙县', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524791', '2013-07-30 15:40:09', '', '织金县', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524792', '2013-07-30 15:40:09', '', '纳雍县', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524793', '2013-07-30 15:40:09', '', '威宁彝族回族苗族自治县', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524794', '2013-07-30 15:40:09', '', '赫章县', '2', '0', '4524786', '');
INSERT INTO `shopping_area` VALUES ('4524795', '2013-07-30 15:40:10', '', '黔东南苗族侗族自治州', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524796', '2013-07-30 15:40:10', '', '凯里市', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524797', '2013-07-30 15:40:10', '', '黄平县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524798', '2013-07-30 15:40:10', '', '施秉县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524799', '2013-07-30 15:40:10', '', '三穗县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524800', '2013-07-30 15:40:10', '', '镇远县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524801', '2013-07-30 15:40:10', '', '岑巩县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524802', '2013-07-30 15:40:10', '', '天柱县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524803', '2013-07-30 15:40:10', '', '锦屏县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524804', '2013-07-30 15:40:10', '', '剑河县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524805', '2013-07-30 15:40:10', '', '台江县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524806', '2013-07-30 15:40:10', '', '黎平县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524807', '2013-07-30 15:40:11', '', '榕江县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524808', '2013-07-30 15:40:11', '', '从江县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524809', '2013-07-30 15:40:11', '', '雷山县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524810', '2013-07-30 15:40:11', '', '麻江县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524811', '2013-07-30 15:40:11', '', '丹寨县', '2', '0', '4524795', '');
INSERT INTO `shopping_area` VALUES ('4524812', '2013-07-30 15:40:11', '', '黔南布依族苗族自治州', '1', '0', '4524724', '');
INSERT INTO `shopping_area` VALUES ('4524813', '2013-07-30 15:40:11', '', '都匀市', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524814', '2013-07-30 15:40:11', '', '福泉市', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524815', '2013-07-30 15:40:11', '', '荔波县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524816', '2013-07-30 15:40:11', '', '贵定县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524817', '2013-07-30 15:40:11', '', '瓮安县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524818', '2013-07-30 15:40:12', '', '独山县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524819', '2013-07-30 15:40:12', '', '平塘县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524820', '2013-07-30 15:40:12', '', '罗甸县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524821', '2013-07-30 15:40:12', '', '长顺县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524822', '2013-07-30 15:40:12', '', '龙里县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524823', '2013-07-30 15:40:12', '', '惠水县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524824', '2013-07-30 15:40:12', '', '三都水族自治县', '2', '0', '4524812', '');
INSERT INTO `shopping_area` VALUES ('4524825', '2013-07-30 15:40:12', '', '云南省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524826', '2013-07-30 15:40:12', '', '昆明市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524827', '2013-07-30 15:40:12', '', '市辖区', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524828', '2013-07-30 15:40:12', '', '五华区', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524829', '2013-07-30 15:40:13', '', '盘龙区', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524830', '2013-07-30 15:40:13', '', '官渡区', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524831', '2013-07-30 15:40:13', '', '西山区', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524832', '2013-07-30 15:40:13', '', '东川区', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524833', '2013-07-30 15:40:13', '', '呈贡县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524834', '2013-07-30 15:40:13', '', '晋宁县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524835', '2013-07-30 15:40:13', '', '富民县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524836', '2013-07-30 15:40:13', '', '宜良县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524837', '2013-07-30 15:40:13', '', '石林彝族自治县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524838', '2013-07-30 15:40:13', '', '嵩明县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524839', '2013-07-30 15:40:13', '', '禄劝彝族苗族自治县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524840', '2013-07-30 15:40:13', '', '寻甸回族彝族自治县', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524841', '2013-07-30 15:40:14', '', '安宁市', '2', '0', '4524826', '');
INSERT INTO `shopping_area` VALUES ('4524842', '2013-07-30 15:40:14', '', '曲靖市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524843', '2013-07-30 15:40:14', '', '市辖区', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524844', '2013-07-30 15:40:14', '', '麒麟区', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524845', '2013-07-30 15:40:14', '', '马龙县', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524846', '2013-07-30 15:40:14', '', '陆良县', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524847', '2013-07-30 15:40:14', '', '师宗县', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524848', '2013-07-30 15:40:14', '', '罗平县', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524849', '2013-07-30 15:40:14', '', '富源县', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524850', '2013-07-30 15:40:14', '', '会泽县', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524851', '2013-07-30 15:40:14', '', '沾益县', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524852', '2013-07-30 15:40:15', '', '宣威市', '2', '0', '4524842', '');
INSERT INTO `shopping_area` VALUES ('4524853', '2013-07-30 15:40:15', '', '玉溪市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524854', '2013-07-30 15:40:15', '', '市辖区', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524855', '2013-07-30 15:40:15', '', '红塔区', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524856', '2013-07-30 15:40:15', '', '江川县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524857', '2013-07-30 15:40:15', '', '澄江县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524858', '2013-07-30 15:40:15', '', '通海县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524859', '2013-07-30 15:40:15', '', '华宁县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524860', '2013-07-30 15:40:15', '', '易门县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524861', '2013-07-30 15:40:15', '', '峨山彝族自治县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524862', '2013-07-30 15:40:15', '', '新平彝族傣族自治县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524863', '2013-07-30 15:40:16', '', '元江哈尼族彝族傣族自治县', '2', '0', '4524853', '');
INSERT INTO `shopping_area` VALUES ('4524864', '2013-07-30 15:40:16', '', '保山市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524865', '2013-07-30 15:40:16', '', '市辖区', '2', '0', '4524864', '');
INSERT INTO `shopping_area` VALUES ('4524866', '2013-07-30 15:40:16', '', '隆阳区', '2', '0', '4524864', '');
INSERT INTO `shopping_area` VALUES ('4524867', '2013-07-30 15:40:16', '', '施甸县', '2', '0', '4524864', '');
INSERT INTO `shopping_area` VALUES ('4524868', '2013-07-30 15:40:16', '', '腾冲县', '2', '0', '4524864', '');
INSERT INTO `shopping_area` VALUES ('4524869', '2013-07-30 15:40:16', '', '龙陵县', '2', '0', '4524864', '');
INSERT INTO `shopping_area` VALUES ('4524870', '2013-07-30 15:40:16', '', '昌宁县', '2', '0', '4524864', '');
INSERT INTO `shopping_area` VALUES ('4524871', '2013-07-30 15:40:16', '', '昭通市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524872', '2013-07-30 15:40:16', '', '市辖区', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524873', '2013-07-30 15:40:16', '', '昭阳区', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524874', '2013-07-30 15:40:17', '', '鲁甸县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524875', '2013-07-30 15:40:17', '', '巧家县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524876', '2013-07-30 15:40:17', '', '盐津县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524877', '2013-07-30 15:40:17', '', '大关县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524878', '2013-07-30 15:40:17', '', '永善县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524879', '2013-07-30 15:40:17', '', '绥江县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524880', '2013-07-30 15:40:17', '', '镇雄县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524881', '2013-07-30 15:40:17', '', '彝良县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524882', '2013-07-30 15:40:17', '', '威信县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524883', '2013-07-30 15:40:17', '', '水富县', '2', '0', '4524871', '');
INSERT INTO `shopping_area` VALUES ('4524884', '2013-07-30 15:40:17', '', '丽江市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524885', '2013-07-30 15:40:18', '', '市辖区', '2', '0', '4524884', '');
INSERT INTO `shopping_area` VALUES ('4524886', '2013-07-30 15:40:18', '', '古城区', '2', '0', '4524884', '');
INSERT INTO `shopping_area` VALUES ('4524887', '2013-07-30 15:40:18', '', '玉龙纳西族自治县', '2', '0', '4524884', '');
INSERT INTO `shopping_area` VALUES ('4524888', '2013-07-30 15:40:18', '', '永胜县', '2', '0', '4524884', '');
INSERT INTO `shopping_area` VALUES ('4524889', '2013-07-30 15:40:18', '', '华坪县', '2', '0', '4524884', '');
INSERT INTO `shopping_area` VALUES ('4524890', '2013-07-30 15:40:18', '', '宁蒗彝族自治县', '2', '0', '4524884', '');
INSERT INTO `shopping_area` VALUES ('4524891', '2013-07-30 15:40:18', '', '普洱市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524892', '2013-07-30 15:40:18', '', '市辖区', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524893', '2013-07-30 15:40:18', '', '思茅区', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524894', '2013-07-30 15:40:18', '', '宁洱哈尼族彝族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524895', '2013-07-30 15:40:19', '', '墨江哈尼族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524896', '2013-07-30 15:40:19', '', '景东彝族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524897', '2013-07-30 15:40:19', '', '景谷傣族彝族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524898', '2013-07-30 15:40:19', '', '镇沅彝族哈尼族拉祜族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524899', '2013-07-30 15:40:19', '', '江城哈尼族彝族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524900', '2013-07-30 15:40:19', '', '孟连傣族拉祜族佤族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524901', '2013-07-30 15:40:19', '', '澜沧拉祜族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524902', '2013-07-30 15:40:19', '', '西盟佤族自治县', '2', '0', '4524891', '');
INSERT INTO `shopping_area` VALUES ('4524903', '2013-07-30 15:40:19', '', '临沧市', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524904', '2013-07-30 15:40:19', '', '市辖区', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524905', '2013-07-30 15:40:19', '', '临翔区', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524906', '2013-07-30 15:40:20', '', '凤庆县', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524907', '2013-07-30 15:40:20', '', '云县', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524908', '2013-07-30 15:40:20', '', '永德县', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524909', '2013-07-30 15:40:20', '', '镇康县', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524910', '2013-07-30 15:40:20', '', '双江拉祜族佤族布朗族傣族自治县', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524911', '2013-07-30 15:40:20', '', '耿马傣族佤族自治县', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524912', '2013-07-30 15:40:20', '', '沧源佤族自治县', '2', '0', '4524903', '');
INSERT INTO `shopping_area` VALUES ('4524913', '2013-07-30 15:40:20', '', '楚雄彝族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524914', '2013-07-30 15:40:20', '', '楚雄市', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524915', '2013-07-30 15:40:20', '', '双柏县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524916', '2013-07-30 15:40:20', '', '牟定县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524917', '2013-07-30 15:40:21', '', '南华县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524918', '2013-07-30 15:40:21', '', '姚安县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524919', '2013-07-30 15:40:21', '', '大姚县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524920', '2013-07-30 15:40:21', '', '永仁县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524921', '2013-07-30 15:40:21', '', '元谋县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524922', '2013-07-30 15:40:21', '', '武定县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524923', '2013-07-30 15:40:21', '', '禄丰县', '2', '0', '4524913', '');
INSERT INTO `shopping_area` VALUES ('4524924', '2013-07-30 15:40:21', '', '红河哈尼族彝族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524925', '2013-07-30 15:40:21', '', '个旧市', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524926', '2013-07-30 15:40:21', '', '开远市', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524927', '2013-07-30 15:40:21', '', '蒙自市', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524928', '2013-07-30 15:40:22', '', '屏边苗族自治县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524929', '2013-07-30 15:40:22', '', '建水县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524930', '2013-07-30 15:40:22', '', '石屏县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524931', '2013-07-30 15:40:22', '', '弥勒县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524932', '2013-07-30 15:40:22', '', '泸西县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524933', '2013-07-30 15:40:22', '', '元阳县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524934', '2013-07-30 15:40:22', '', '红河县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524935', '2013-07-30 15:40:22', '', '金平苗族瑶族傣族自治县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524936', '2013-07-30 15:40:22', '', '绿春县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524937', '2013-07-30 15:40:22', '', '河口瑶族自治县', '2', '0', '4524924', '');
INSERT INTO `shopping_area` VALUES ('4524938', '2013-07-30 15:40:22', '', '文山壮族苗族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524939', '2013-07-30 15:40:23', '', '文山县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524940', '2013-07-30 15:40:23', '', '砚山县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524941', '2013-07-30 15:40:23', '', '西畴县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524942', '2013-07-30 15:40:23', '', '麻栗坡县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524943', '2013-07-30 15:40:23', '', '马关县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524944', '2013-07-30 15:40:23', '', '丘北县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524945', '2013-07-30 15:40:23', '', '广南县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524946', '2013-07-30 15:40:23', '', '富宁县', '2', '0', '4524938', '');
INSERT INTO `shopping_area` VALUES ('4524947', '2013-07-30 15:40:23', '', '西双版纳傣族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524948', '2013-07-30 15:40:23', '', '景洪市', '2', '0', '4524947', '');
INSERT INTO `shopping_area` VALUES ('4524949', '2013-07-30 15:40:23', '', '勐海县', '2', '0', '4524947', '');
INSERT INTO `shopping_area` VALUES ('4524950', '2013-07-30 15:40:24', '', '勐腊县', '2', '0', '4524947', '');
INSERT INTO `shopping_area` VALUES ('4524951', '2013-07-30 15:40:24', '', '大理白族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524952', '2013-07-30 15:40:24', '', '大理市', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524953', '2013-07-30 15:40:24', '', '漾濞彝族自治县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524954', '2013-07-30 15:40:24', '', '祥云县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524955', '2013-07-30 15:40:24', '', '宾川县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524956', '2013-07-30 15:40:24', '', '弥渡县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524957', '2013-07-30 15:40:24', '', '南涧彝族自治县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524958', '2013-07-30 15:40:24', '', '巍山彝族回族自治县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524959', '2013-07-30 15:40:24', '', '永平县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524960', '2013-07-30 15:40:25', '', '云龙县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524961', '2013-07-30 15:40:25', '', '洱源县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524962', '2013-07-30 15:40:25', '', '剑川县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524963', '2013-07-30 15:40:25', '', '鹤庆县', '2', '0', '4524951', '');
INSERT INTO `shopping_area` VALUES ('4524964', '2013-07-30 15:40:25', '', '德宏傣族景颇族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524965', '2013-07-30 15:40:25', '', '瑞丽市', '2', '0', '4524964', '');
INSERT INTO `shopping_area` VALUES ('4524966', '2013-07-30 15:40:25', '', '芒市', '2', '0', '4524964', '');
INSERT INTO `shopping_area` VALUES ('4524967', '2013-07-30 15:40:25', '', '梁河县', '2', '0', '4524964', '');
INSERT INTO `shopping_area` VALUES ('4524968', '2013-07-30 15:40:25', '', '盈江县', '2', '0', '4524964', '');
INSERT INTO `shopping_area` VALUES ('4524969', '2013-07-30 15:40:25', '', '陇川县', '2', '0', '4524964', '');
INSERT INTO `shopping_area` VALUES ('4524970', '2013-07-30 15:40:25', '', '怒江傈僳族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524971', '2013-07-30 15:40:26', '', '泸水县', '2', '0', '4524970', '');
INSERT INTO `shopping_area` VALUES ('4524972', '2013-07-30 15:40:26', '', '福贡县', '2', '0', '4524970', '');
INSERT INTO `shopping_area` VALUES ('4524973', '2013-07-30 15:40:26', '', '贡山独龙族怒族自治县', '2', '0', '4524970', '');
INSERT INTO `shopping_area` VALUES ('4524974', '2013-07-30 15:40:26', '', '兰坪白族普米族自治县', '2', '0', '4524970', '');
INSERT INTO `shopping_area` VALUES ('4524975', '2013-07-30 15:40:26', '', '迪庆藏族自治州', '1', '0', '4524825', '');
INSERT INTO `shopping_area` VALUES ('4524976', '2013-07-30 15:40:26', '', '香格里拉县', '2', '0', '4524975', '');
INSERT INTO `shopping_area` VALUES ('4524977', '2013-07-30 15:40:26', '', '德钦县', '2', '0', '4524975', '');
INSERT INTO `shopping_area` VALUES ('4524978', '2013-07-30 15:40:26', '', '维西傈僳族自治县', '2', '0', '4524975', '');
INSERT INTO `shopping_area` VALUES ('4524979', '2013-07-30 15:40:26', '', '西藏自治区', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4524980', '2013-07-30 15:40:26', '', '拉萨市', '1', '0', '4524979', '');
INSERT INTO `shopping_area` VALUES ('4524981', '2013-07-30 15:40:26', '', '市辖区', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524982', '2013-07-30 15:40:27', '', '城关区', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524983', '2013-07-30 15:40:27', '', '林周县', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524984', '2013-07-30 15:40:27', '', '当雄县', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524985', '2013-07-30 15:40:27', '', '尼木县', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524986', '2013-07-30 15:40:27', '', '曲水县', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524987', '2013-07-30 15:40:27', '', '堆龙德庆县', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524988', '2013-07-30 15:40:27', '', '达孜县', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524989', '2013-07-30 15:40:27', '', '墨竹工卡县', '2', '0', '4524980', '');
INSERT INTO `shopping_area` VALUES ('4524990', '2013-07-30 15:40:27', '', '昌都地区', '1', '0', '4524979', '');
INSERT INTO `shopping_area` VALUES ('4524991', '2013-07-30 15:40:27', '', '昌都县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524992', '2013-07-30 15:40:27', '', '江达县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524993', '2013-07-30 15:40:28', '', '贡觉县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524994', '2013-07-30 15:40:28', '', '类乌齐县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524995', '2013-07-30 15:40:28', '', '丁青县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524996', '2013-07-30 15:40:28', '', '察雅县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524997', '2013-07-30 15:40:28', '', '八宿县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524998', '2013-07-30 15:40:28', '', '左贡县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4524999', '2013-07-30 15:40:28', '', '芒康县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4525000', '2013-07-30 15:40:28', '', '洛隆县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4525001', '2013-07-30 15:40:28', '', '边坝县', '2', '0', '4524990', '');
INSERT INTO `shopping_area` VALUES ('4525002', '2013-07-30 15:40:28', '', '山南地区', '1', '0', '4524979', '');
INSERT INTO `shopping_area` VALUES ('4525003', '2013-07-30 15:40:28', '', '乃东县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525004', '2013-07-30 15:40:29', '', '扎囊县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525005', '2013-07-30 15:40:29', '', '贡嘎县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525006', '2013-07-30 15:40:29', '', '桑日县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525007', '2013-07-30 15:40:29', '', '琼结县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525008', '2013-07-30 15:40:29', '', '曲松县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525009', '2013-07-30 15:40:29', '', '措美县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525010', '2013-07-30 15:40:29', '', '洛扎县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525011', '2013-07-30 15:40:29', '', '加查县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525012', '2013-07-30 15:40:29', '', '隆子县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525013', '2013-07-30 15:40:29', '', '错那县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525014', '2013-07-30 15:40:29', '', '浪卡子县', '2', '0', '4525002', '');
INSERT INTO `shopping_area` VALUES ('4525015', '2013-07-30 15:40:30', '', '日喀则地区', '1', '0', '4524979', '');
INSERT INTO `shopping_area` VALUES ('4525016', '2013-07-30 15:40:30', '', '日喀则市', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525017', '2013-07-30 15:40:30', '', '南木林县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525018', '2013-07-30 15:40:30', '', '江孜县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525019', '2013-07-30 15:40:30', '', '定日县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525020', '2013-07-30 15:40:30', '', '萨迦县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525021', '2013-07-30 15:40:30', '', '拉孜县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525022', '2013-07-30 15:40:30', '', '昂仁县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525023', '2013-07-30 15:40:30', '', '谢通门县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525024', '2013-07-30 15:40:30', '', '白朗县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525025', '2013-07-30 15:40:30', '', '仁布县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525026', '2013-07-30 15:40:31', '', '康马县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525027', '2013-07-30 15:40:31', '', '定结县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525028', '2013-07-30 15:40:31', '', '仲巴县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525029', '2013-07-30 15:40:31', '', '亚东县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525030', '2013-07-30 15:40:31', '', '吉隆县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525031', '2013-07-30 15:40:31', '', '聂拉木县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525032', '2013-07-30 15:40:31', '', '萨嘎县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525033', '2013-07-30 15:40:31', '', '岗巴县', '2', '0', '4525015', '');
INSERT INTO `shopping_area` VALUES ('4525034', '2013-07-30 15:40:31', '', '那曲地区', '1', '0', '4524979', '');
INSERT INTO `shopping_area` VALUES ('4525035', '2013-07-30 15:40:31', '', '那曲县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525036', '2013-07-30 15:40:32', '', '嘉黎县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525037', '2013-07-30 15:40:32', '', '比如县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525038', '2013-07-30 15:40:32', '', '聂荣县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525039', '2013-07-30 15:40:32', '', '安多县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525040', '2013-07-30 15:40:32', '', '申扎县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525041', '2013-07-30 15:40:32', '', '索县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525042', '2013-07-30 15:40:32', '', '班戈县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525043', '2013-07-30 15:40:32', '', '巴青县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525044', '2013-07-30 15:40:32', '', '尼玛县', '2', '0', '4525034', '');
INSERT INTO `shopping_area` VALUES ('4525045', '2013-07-30 15:40:32', '', '阿里地区', '1', '0', '4524979', '');
INSERT INTO `shopping_area` VALUES ('4525046', '2013-07-30 15:40:32', '', '普兰县', '2', '0', '4525045', '');
INSERT INTO `shopping_area` VALUES ('4525047', '2013-07-30 15:40:33', '', '札达县', '2', '0', '4525045', '');
INSERT INTO `shopping_area` VALUES ('4525048', '2013-07-30 15:40:33', '', '噶尔县', '2', '0', '4525045', '');
INSERT INTO `shopping_area` VALUES ('4525049', '2013-07-30 15:40:33', '', '日土县', '2', '0', '4525045', '');
INSERT INTO `shopping_area` VALUES ('4525050', '2013-07-30 15:40:33', '', '革吉县', '2', '0', '4525045', '');
INSERT INTO `shopping_area` VALUES ('4525051', '2013-07-30 15:40:33', '', '改则县', '2', '0', '4525045', '');
INSERT INTO `shopping_area` VALUES ('4525052', '2013-07-30 15:40:33', '', '措勤县', '2', '0', '4525045', '');
INSERT INTO `shopping_area` VALUES ('4525053', '2013-07-30 15:40:33', '', '林芝地区', '1', '0', '4524979', '');
INSERT INTO `shopping_area` VALUES ('4525054', '2013-07-30 15:40:33', '', '林芝县', '2', '0', '4525053', '');
INSERT INTO `shopping_area` VALUES ('4525055', '2013-07-30 15:40:33', '', '工布江达县', '2', '0', '4525053', '');
INSERT INTO `shopping_area` VALUES ('4525056', '2013-07-30 15:40:33', '', '米林县', '2', '0', '4525053', '');
INSERT INTO `shopping_area` VALUES ('4525057', '2013-07-30 15:40:34', '', '墨脱县', '2', '0', '4525053', '');
INSERT INTO `shopping_area` VALUES ('4525058', '2013-07-30 15:40:34', '', '波密县', '2', '0', '4525053', '');
INSERT INTO `shopping_area` VALUES ('4525059', '2013-07-30 15:40:34', '', '察隅县', '2', '0', '4525053', '');
INSERT INTO `shopping_area` VALUES ('4525060', '2013-07-30 15:40:34', '', '朗县', '2', '0', '4525053', '');
INSERT INTO `shopping_area` VALUES ('4525061', '2013-07-30 15:40:34', '', '陕西省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4525062', '2013-07-30 15:40:34', '', '西安市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525063', '2013-07-30 15:40:34', '', '市辖区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525064', '2013-07-30 15:40:34', '', '新城区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525065', '2013-07-30 15:40:34', '', '碑林区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525066', '2013-07-30 15:40:34', '', '莲湖区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525067', '2013-07-30 15:40:35', '', '灞桥区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525068', '2013-07-30 15:40:35', '', '未央区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525069', '2013-07-30 15:40:35', '', '雁塔区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525070', '2013-07-30 15:40:35', '', '阎良区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525071', '2013-07-30 15:40:35', '', '临潼区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525072', '2013-07-30 15:40:35', '', '长安区', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525073', '2013-07-30 15:40:35', '', '蓝田县', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525074', '2013-07-30 15:40:35', '', '周至县', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525075', '2013-07-30 15:40:35', '', '户县', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525076', '2013-07-30 15:40:35', '', '高陵县', '2', '0', '4525062', '');
INSERT INTO `shopping_area` VALUES ('4525077', '2013-07-30 15:40:35', '', '铜川市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525078', '2013-07-30 15:40:36', '', '市辖区', '2', '0', '4525077', '');
INSERT INTO `shopping_area` VALUES ('4525079', '2013-07-30 15:40:36', '', '王益区', '2', '0', '4525077', '');
INSERT INTO `shopping_area` VALUES ('4525080', '2013-07-30 15:40:36', '', '印台区', '2', '0', '4525077', '');
INSERT INTO `shopping_area` VALUES ('4525081', '2013-07-30 15:40:36', '', '耀州区', '2', '0', '4525077', '');
INSERT INTO `shopping_area` VALUES ('4525082', '2013-07-30 15:40:36', '', '宜君县', '2', '0', '4525077', '');
INSERT INTO `shopping_area` VALUES ('4525083', '2013-07-30 15:40:36', '', '宝鸡市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525084', '2013-07-30 15:40:36', '', '市辖区', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525085', '2013-07-30 15:40:36', '', '渭滨区', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525086', '2013-07-30 15:40:36', '', '金台区', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525087', '2013-07-30 15:40:36', '', '陈仓区', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525088', '2013-07-30 15:40:37', '', '凤翔县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525089', '2013-07-30 15:40:37', '', '岐山县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525090', '2013-07-30 15:40:37', '', '扶风县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525091', '2013-07-30 15:40:37', '', '眉县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525092', '2013-07-30 15:40:37', '', '陇县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525093', '2013-07-30 15:40:37', '', '千阳县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525094', '2013-07-30 15:40:37', '', '麟游县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525095', '2013-07-30 15:40:37', '', '凤县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525096', '2013-07-30 15:40:37', '', '太白县', '2', '0', '4525083', '');
INSERT INTO `shopping_area` VALUES ('4525097', '2013-07-30 15:40:37', '', '咸阳市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525098', '2013-07-30 15:40:38', '', '市辖区', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525099', '2013-07-30 15:40:38', '', '秦都区', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525100', '2013-07-30 15:40:38', '', '杨陵区', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525101', '2013-07-30 15:40:38', '', '渭城区', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525102', '2013-07-30 15:40:38', '', '三原县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525103', '2013-07-30 15:40:38', '', '泾阳县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525104', '2013-07-30 15:40:38', '', '乾县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525105', '2013-07-30 15:40:38', '', '礼泉县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525106', '2013-07-30 15:40:38', '', '永寿县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525107', '2013-07-30 15:40:38', '', '彬县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525108', '2013-07-30 15:40:38', '', '长武县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525109', '2013-07-30 15:40:39', '', '旬邑县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525110', '2013-07-30 15:40:39', '', '淳化县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525111', '2013-07-30 15:40:39', '', '武功县', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525112', '2013-07-30 15:40:39', '', '兴平市', '2', '0', '4525097', '');
INSERT INTO `shopping_area` VALUES ('4525113', '2013-07-30 15:40:39', '', '渭南市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525114', '2013-07-30 15:40:39', '', '市辖区', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525115', '2013-07-30 15:40:39', '', '临渭区', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525116', '2013-07-30 15:40:39', '', '华县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525117', '2013-07-30 15:40:39', '', '潼关县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525118', '2013-07-30 15:40:39', '', '大荔县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525119', '2013-07-30 15:40:40', '', '合阳县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525120', '2013-07-30 15:40:40', '', '澄城县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525121', '2013-07-30 15:40:40', '', '蒲城县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525122', '2013-07-30 15:40:40', '', '白水县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525123', '2013-07-30 15:40:40', '', '富平县', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525124', '2013-07-30 15:40:40', '', '韩城市', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525125', '2013-07-30 15:40:40', '', '华阴市', '2', '0', '4525113', '');
INSERT INTO `shopping_area` VALUES ('4525126', '2013-07-30 15:40:40', '', '延安市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525127', '2013-07-30 15:40:40', '', '市辖区', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525128', '2013-07-30 15:40:40', '', '宝塔区', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525129', '2013-07-30 15:40:40', '', '延长县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525130', '2013-07-30 15:40:41', '', '延川县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525131', '2013-07-30 15:40:41', '', '子长县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525132', '2013-07-30 15:40:41', '', '安塞县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525133', '2013-07-30 15:40:41', '', '志丹县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525134', '2013-07-30 15:40:41', '', '吴起县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525135', '2013-07-30 15:40:41', '', '甘泉县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525136', '2013-07-30 15:40:41', '', '富县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525137', '2013-07-30 15:40:41', '', '洛川县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525138', '2013-07-30 15:40:41', '', '宜川县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525139', '2013-07-30 15:40:41', '', '黄龙县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525140', '2013-07-30 15:40:42', '', '黄陵县', '2', '0', '4525126', '');
INSERT INTO `shopping_area` VALUES ('4525141', '2013-07-30 15:40:42', '', '汉中市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525142', '2013-07-30 15:40:42', '', '市辖区', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525143', '2013-07-30 15:40:42', '', '汉台区', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525144', '2013-07-30 15:40:42', '', '南郑县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525145', '2013-07-30 15:40:42', '', '城固县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525146', '2013-07-30 15:40:42', '', '洋县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525147', '2013-07-30 15:40:42', '', '西乡县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525148', '2013-07-30 15:40:42', '', '勉县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525149', '2013-07-30 15:40:42', '', '宁强县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525150', '2013-07-30 15:40:43', '', '略阳县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525151', '2013-07-30 15:40:43', '', '镇巴县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525152', '2013-07-30 15:40:43', '', '留坝县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525153', '2013-07-30 15:40:43', '', '佛坪县', '2', '0', '4525141', '');
INSERT INTO `shopping_area` VALUES ('4525154', '2013-07-30 15:40:43', '', '榆林市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525155', '2013-07-30 15:40:43', '', '市辖区', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525156', '2013-07-30 15:40:43', '', '榆阳区', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525157', '2013-07-30 15:40:43', '', '神木县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525158', '2013-07-30 15:40:43', '', '府谷县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525159', '2013-07-30 15:40:43', '', '横山县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525160', '2013-07-30 15:40:43', '', '靖边县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525161', '2013-07-30 15:40:44', '', '定边县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525162', '2013-07-30 15:40:44', '', '绥德县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525163', '2013-07-30 15:40:44', '', '米脂县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525164', '2013-07-30 15:40:44', '', '佳县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525165', '2013-07-30 15:40:44', '', '吴堡县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525166', '2013-07-30 15:40:44', '', '清涧县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525167', '2013-07-30 15:40:44', '', '子洲县', '2', '0', '4525154', '');
INSERT INTO `shopping_area` VALUES ('4525168', '2013-07-30 15:40:44', '', '安康市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525169', '2013-07-30 15:40:44', '', '市辖区', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525170', '2013-07-30 15:40:44', '', '汉滨区', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525171', '2013-07-30 15:40:45', '', '汉阴县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525172', '2013-07-30 15:40:45', '', '石泉县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525173', '2013-07-30 15:40:45', '', '宁陕县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525174', '2013-07-30 15:40:45', '', '紫阳县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525175', '2013-07-30 15:40:45', '', '岚皋县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525176', '2013-07-30 15:40:45', '', '平利县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525177', '2013-07-30 15:40:45', '', '镇坪县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525178', '2013-07-30 15:40:45', '', '旬阳县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525179', '2013-07-30 15:40:45', '', '白河县', '2', '0', '4525168', '');
INSERT INTO `shopping_area` VALUES ('4525180', '2013-07-30 15:40:45', '', '商洛市', '1', '0', '4525061', '');
INSERT INTO `shopping_area` VALUES ('4525181', '2013-07-30 15:40:46', '', '市辖区', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525182', '2013-07-30 15:40:46', '', '商州区', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525183', '2013-07-30 15:40:46', '', '洛南县', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525184', '2013-07-30 15:40:46', '', '丹凤县', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525185', '2013-07-30 15:40:46', '', '商南县', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525186', '2013-07-30 15:40:46', '', '山阳县', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525187', '2013-07-30 15:40:46', '', '镇安县', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525188', '2013-07-30 15:40:46', '', '柞水县', '2', '0', '4525180', '');
INSERT INTO `shopping_area` VALUES ('4525189', '2013-07-30 15:40:46', '', '甘肃省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4525190', '2013-07-30 15:40:46', '', '兰州市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525191', '2013-07-30 15:40:47', '', '市辖区', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525192', '2013-07-30 15:40:47', '', '城关区', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525193', '2013-07-30 15:40:47', '', '七里河区', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525194', '2013-07-30 15:40:47', '', '西固区', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525195', '2013-07-30 15:40:47', '', '安宁区', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525196', '2013-07-30 15:40:47', '', '红古区', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525197', '2013-07-30 15:40:47', '', '永登县', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525198', '2013-07-30 15:40:47', '', '皋兰县', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525199', '2013-07-30 15:40:47', '', '榆中县', '2', '0', '4525190', '');
INSERT INTO `shopping_area` VALUES ('4525200', '2013-07-30 15:40:47', '', '嘉峪关市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525201', '2013-07-30 15:40:47', '', '市辖区', '2', '0', '4525200', '');
INSERT INTO `shopping_area` VALUES ('4525202', '2013-07-30 15:40:48', '', '金昌市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525203', '2013-07-30 15:40:48', '', '市辖区', '2', '0', '4525202', '');
INSERT INTO `shopping_area` VALUES ('4525204', '2013-07-30 15:40:48', '', '金川区', '2', '0', '4525202', '');
INSERT INTO `shopping_area` VALUES ('4525205', '2013-07-30 15:40:48', '', '永昌县', '2', '0', '4525202', '');
INSERT INTO `shopping_area` VALUES ('4525206', '2013-07-30 15:40:48', '', '白银市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525207', '2013-07-30 15:40:48', '', '市辖区', '2', '0', '4525206', '');
INSERT INTO `shopping_area` VALUES ('4525208', '2013-07-30 15:40:48', '', '白银区', '2', '0', '4525206', '');
INSERT INTO `shopping_area` VALUES ('4525209', '2013-07-30 15:40:48', '', '平川区', '2', '0', '4525206', '');
INSERT INTO `shopping_area` VALUES ('4525210', '2013-07-30 15:40:48', '', '靖远县', '2', '0', '4525206', '');
INSERT INTO `shopping_area` VALUES ('4525211', '2013-07-30 15:40:48', '', '会宁县', '2', '0', '4525206', '');
INSERT INTO `shopping_area` VALUES ('4525212', '2013-07-30 15:40:49', '', '景泰县', '2', '0', '4525206', '');
INSERT INTO `shopping_area` VALUES ('4525213', '2013-07-30 15:40:49', '', '天水市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525214', '2013-07-30 15:40:49', '', '市辖区', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525215', '2013-07-30 15:40:49', '', '秦州区', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525216', '2013-07-30 15:40:49', '', '麦积区', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525217', '2013-07-30 15:40:49', '', '清水县', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525218', '2013-07-30 15:40:49', '', '秦安县', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525219', '2013-07-30 15:40:49', '', '甘谷县', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525220', '2013-07-30 15:40:49', '', '武山县', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525221', '2013-07-30 15:40:49', '', '张家川回族自治县', '2', '0', '4525213', '');
INSERT INTO `shopping_area` VALUES ('4525222', '2013-07-30 15:40:50', '', '武威市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525223', '2013-07-30 15:40:50', '', '市辖区', '2', '0', '4525222', '');
INSERT INTO `shopping_area` VALUES ('4525224', '2013-07-30 15:40:50', '', '凉州区', '2', '0', '4525222', '');
INSERT INTO `shopping_area` VALUES ('4525225', '2013-07-30 15:40:50', '', '民勤县', '2', '0', '4525222', '');
INSERT INTO `shopping_area` VALUES ('4525226', '2013-07-30 15:40:50', '', '古浪县', '2', '0', '4525222', '');
INSERT INTO `shopping_area` VALUES ('4525227', '2013-07-30 15:40:50', '', '天祝藏族自治县', '2', '0', '4525222', '');
INSERT INTO `shopping_area` VALUES ('4525228', '2013-07-30 15:40:50', '', '张掖市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525229', '2013-07-30 15:40:50', '', '市辖区', '2', '0', '4525228', '');
INSERT INTO `shopping_area` VALUES ('4525230', '2013-07-30 15:40:50', '', '甘州区', '2', '0', '4525228', '');
INSERT INTO `shopping_area` VALUES ('4525231', '2013-07-30 15:40:50', '', '肃南裕固族自治县', '2', '0', '4525228', '');
INSERT INTO `shopping_area` VALUES ('4525232', '2013-07-30 15:40:51', '', '民乐县', '2', '0', '4525228', '');
INSERT INTO `shopping_area` VALUES ('4525233', '2013-07-30 15:40:51', '', '临泽县', '2', '0', '4525228', '');
INSERT INTO `shopping_area` VALUES ('4525234', '2013-07-30 15:40:51', '', '高台县', '2', '0', '4525228', '');
INSERT INTO `shopping_area` VALUES ('4525235', '2013-07-30 15:40:51', '', '山丹县', '2', '0', '4525228', '');
INSERT INTO `shopping_area` VALUES ('4525236', '2013-07-30 15:40:51', '', '平凉市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525237', '2013-07-30 15:40:51', '', '市辖区', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525238', '2013-07-30 15:40:51', '', '崆峒区', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525239', '2013-07-30 15:40:51', '', '泾川县', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525240', '2013-07-30 15:40:51', '', '灵台县', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525241', '2013-07-30 15:40:51', '', '崇信县', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525242', '2013-07-30 15:40:52', '', '华亭县', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525243', '2013-07-30 15:40:52', '', '庄浪县', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525244', '2013-07-30 15:40:52', '', '静宁县', '2', '0', '4525236', '');
INSERT INTO `shopping_area` VALUES ('4525245', '2013-07-30 15:40:52', '', '酒泉市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525246', '2013-07-30 15:40:52', '', '市辖区', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525247', '2013-07-30 15:40:52', '', '肃州区', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525248', '2013-07-30 15:40:52', '', '金塔县', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525249', '2013-07-30 15:40:52', '', '瓜州县', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525250', '2013-07-30 15:40:52', '', '肃北蒙古族自治县', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525251', '2013-07-30 15:40:52', '', '阿克塞哈萨克族自治县', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525252', '2013-07-30 15:40:52', '', '玉门市', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525253', '2013-07-30 15:40:53', '', '敦煌市', '2', '0', '4525245', '');
INSERT INTO `shopping_area` VALUES ('4525254', '2013-07-30 15:40:53', '', '庆阳市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525255', '2013-07-30 15:40:53', '', '市辖区', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525256', '2013-07-30 15:40:53', '', '西峰区', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525257', '2013-07-30 15:40:53', '', '庆城县', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525258', '2013-07-30 15:40:53', '', '环县', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525259', '2013-07-30 15:40:53', '', '华池县', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525260', '2013-07-30 15:40:53', '', '合水县', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525261', '2013-07-30 15:40:53', '', '正宁县', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525262', '2013-07-30 15:40:53', '', '宁县', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525263', '2013-07-30 15:40:54', '', '镇原县', '2', '0', '4525254', '');
INSERT INTO `shopping_area` VALUES ('4525264', '2013-07-30 15:40:54', '', '定西市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525265', '2013-07-30 15:40:54', '', '市辖区', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525266', '2013-07-30 15:40:54', '', '安定区', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525267', '2013-07-30 15:40:54', '', '通渭县', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525268', '2013-07-30 15:40:54', '', '陇西县', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525269', '2013-07-30 15:40:54', '', '渭源县', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525270', '2013-07-30 15:40:54', '', '临洮县', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525271', '2013-07-30 15:40:54', '', '漳县', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525272', '2013-07-30 15:40:54', '', '岷县', '2', '0', '4525264', '');
INSERT INTO `shopping_area` VALUES ('4525273', '2013-07-30 15:40:55', '', '陇南市', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525274', '2013-07-30 15:40:55', '', '市辖区', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525275', '2013-07-30 15:40:55', '', '武都区', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525276', '2013-07-30 15:40:55', '', '成县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525277', '2013-07-30 15:40:55', '', '文县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525278', '2013-07-30 15:40:55', '', '宕昌县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525279', '2013-07-30 15:40:55', '', '康县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525280', '2013-07-30 15:40:55', '', '西和县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525281', '2013-07-30 15:40:55', '', '礼县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525282', '2013-07-30 15:40:55', '', '徽县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525283', '2013-07-30 15:40:56', '', '两当县', '2', '0', '4525273', '');
INSERT INTO `shopping_area` VALUES ('4525284', '2013-07-30 15:40:56', '', '临夏回族自治州', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525285', '2013-07-30 15:40:56', '', '临夏市', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525286', '2013-07-30 15:40:56', '', '临夏县', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525287', '2013-07-30 15:40:56', '', '康乐县', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525288', '2013-07-30 15:40:56', '', '永靖县', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525289', '2013-07-30 15:40:56', '', '广河县', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525290', '2013-07-30 15:40:56', '', '和政县', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525291', '2013-07-30 15:40:56', '', '东乡族自治县', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525292', '2013-07-30 15:40:56', '', '积石山保安族东乡族撒拉族自治县', '2', '0', '4525284', '');
INSERT INTO `shopping_area` VALUES ('4525293', '2013-07-30 15:40:57', '', '甘南藏族自治州', '1', '0', '4525189', '');
INSERT INTO `shopping_area` VALUES ('4525294', '2013-07-30 15:40:57', '', '合作市', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525295', '2013-07-30 15:40:57', '', '临潭县', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525296', '2013-07-30 15:40:57', '', '卓尼县', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525297', '2013-07-30 15:40:57', '', '舟曲县', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525298', '2013-07-30 15:40:57', '', '迭部县', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525299', '2013-07-30 15:40:57', '', '玛曲县', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525300', '2013-07-30 15:40:57', '', '碌曲县', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525301', '2013-07-30 15:40:57', '', '夏河县', '2', '0', '4525293', '');
INSERT INTO `shopping_area` VALUES ('4525302', '2013-07-30 15:40:57', '', '青海省', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4525303', '2013-07-30 15:40:58', '', '西宁市', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525304', '2013-07-30 15:40:58', '', '市辖区', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525305', '2013-07-30 15:40:58', '', '城东区', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525306', '2013-07-30 15:40:58', '', '城中区', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525307', '2013-07-30 15:40:58', '', '城西区', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525308', '2013-07-30 15:40:58', '', '城北区', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525309', '2013-07-30 15:40:58', '', '大通回族土族自治县', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525310', '2013-07-30 15:40:58', '', '湟中县', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525311', '2013-07-30 15:40:58', '', '湟源县', '2', '0', '4525303', '');
INSERT INTO `shopping_area` VALUES ('4525312', '2013-07-30 15:40:58', '', '海东地区', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525313', '2013-07-30 15:40:59', '', '平安县', '2', '0', '4525312', '');
INSERT INTO `shopping_area` VALUES ('4525314', '2013-07-30 15:40:59', '', '民和回族土族自治县', '2', '0', '4525312', '');
INSERT INTO `shopping_area` VALUES ('4525315', '2013-07-30 15:40:59', '', '乐都县', '2', '0', '4525312', '');
INSERT INTO `shopping_area` VALUES ('4525316', '2013-07-30 15:40:59', '', '互助土族自治县', '2', '0', '4525312', '');
INSERT INTO `shopping_area` VALUES ('4525317', '2013-07-30 15:40:59', '', '化隆回族自治县', '2', '0', '4525312', '');
INSERT INTO `shopping_area` VALUES ('4525318', '2013-07-30 15:40:59', '', '循化撒拉族自治县', '2', '0', '4525312', '');
INSERT INTO `shopping_area` VALUES ('4525319', '2013-07-30 15:40:59', '', '海北藏族自治州', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525320', '2013-07-30 15:40:59', '', '门源回族自治县', '2', '0', '4525319', '');
INSERT INTO `shopping_area` VALUES ('4525321', '2013-07-30 15:40:59', '', '祁连县', '2', '0', '4525319', '');
INSERT INTO `shopping_area` VALUES ('4525322', '2013-07-30 15:40:59', '', '海晏县', '2', '0', '4525319', '');
INSERT INTO `shopping_area` VALUES ('4525323', '2013-07-30 15:41:00', '', '刚察县', '2', '0', '4525319', '');
INSERT INTO `shopping_area` VALUES ('4525324', '2013-07-30 15:41:00', '', '黄南藏族自治州', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525325', '2013-07-30 15:41:00', '', '同仁县', '2', '0', '4525324', '');
INSERT INTO `shopping_area` VALUES ('4525326', '2013-07-30 15:41:00', '', '尖扎县', '2', '0', '4525324', '');
INSERT INTO `shopping_area` VALUES ('4525327', '2013-07-30 15:41:00', '', '泽库县', '2', '0', '4525324', '');
INSERT INTO `shopping_area` VALUES ('4525328', '2013-07-30 15:41:00', '', '河南蒙古族自治县', '2', '0', '4525324', '');
INSERT INTO `shopping_area` VALUES ('4525329', '2013-07-30 15:41:00', '', '海南藏族自治州', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525330', '2013-07-30 15:41:00', '', '共和县', '2', '0', '4525329', '');
INSERT INTO `shopping_area` VALUES ('4525331', '2013-07-30 15:41:00', '', '同德县', '2', '0', '4525329', '');
INSERT INTO `shopping_area` VALUES ('4525332', '2013-07-30 15:41:00', '', '贵德县', '2', '0', '4525329', '');
INSERT INTO `shopping_area` VALUES ('4525333', '2013-07-30 15:41:01', '', '兴海县', '2', '0', '4525329', '');
INSERT INTO `shopping_area` VALUES ('4525334', '2013-07-30 15:41:01', '', '贵南县', '2', '0', '4525329', '');
INSERT INTO `shopping_area` VALUES ('4525335', '2013-07-30 15:41:01', '', '果洛藏族自治州', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525336', '2013-07-30 15:41:01', '', '玛沁县', '2', '0', '4525335', '');
INSERT INTO `shopping_area` VALUES ('4525337', '2013-07-30 15:41:01', '', '班玛县', '2', '0', '4525335', '');
INSERT INTO `shopping_area` VALUES ('4525338', '2013-07-30 15:41:01', '', '甘德县', '2', '0', '4525335', '');
INSERT INTO `shopping_area` VALUES ('4525339', '2013-07-30 15:41:01', '', '达日县', '2', '0', '4525335', '');
INSERT INTO `shopping_area` VALUES ('4525340', '2013-07-30 15:41:01', '', '久治县', '2', '0', '4525335', '');
INSERT INTO `shopping_area` VALUES ('4525341', '2013-07-30 15:41:01', '', '玛多县', '2', '0', '4525335', '');
INSERT INTO `shopping_area` VALUES ('4525342', '2013-07-30 15:41:01', '', '玉树藏族自治州', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525343', '2013-07-30 15:41:01', '', '玉树县', '2', '0', '4525342', '');
INSERT INTO `shopping_area` VALUES ('4525344', '2013-07-30 15:41:02', '', '杂多县', '2', '0', '4525342', '');
INSERT INTO `shopping_area` VALUES ('4525345', '2013-07-30 15:41:02', '', '称多县', '2', '0', '4525342', '');
INSERT INTO `shopping_area` VALUES ('4525346', '2013-07-30 15:41:02', '', '治多县', '2', '0', '4525342', '');
INSERT INTO `shopping_area` VALUES ('4525347', '2013-07-30 15:41:02', '', '囊谦县', '2', '0', '4525342', '');
INSERT INTO `shopping_area` VALUES ('4525348', '2013-07-30 15:41:02', '', '曲麻莱县', '2', '0', '4525342', '');
INSERT INTO `shopping_area` VALUES ('4525349', '2013-07-30 15:41:02', '', '海西蒙古族藏族自治州', '1', '0', '4525302', '');
INSERT INTO `shopping_area` VALUES ('4525350', '2013-07-30 15:41:02', '', '格尔木市', '2', '0', '4525349', '');
INSERT INTO `shopping_area` VALUES ('4525351', '2013-07-30 15:41:02', '', '德令哈市', '2', '0', '4525349', '');
INSERT INTO `shopping_area` VALUES ('4525352', '2013-07-30 15:41:02', '', '乌兰县', '2', '0', '4525349', '');
INSERT INTO `shopping_area` VALUES ('4525353', '2013-07-30 15:41:02', '', '都兰县', '2', '0', '4525349', '');
INSERT INTO `shopping_area` VALUES ('4525354', '2013-07-30 15:41:03', '', '天峻县', '2', '0', '4525349', '');
INSERT INTO `shopping_area` VALUES ('4525355', '2013-07-30 15:41:03', '', '宁夏回族自治区', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4525356', '2013-07-30 15:41:03', '', '银川市', '1', '0', '4525355', '');
INSERT INTO `shopping_area` VALUES ('4525357', '2013-07-30 15:41:03', '', '市辖区', '2', '0', '4525356', '');
INSERT INTO `shopping_area` VALUES ('4525358', '2013-07-30 15:41:03', '', '兴庆区', '2', '0', '4525356', '');
INSERT INTO `shopping_area` VALUES ('4525359', '2013-07-30 15:41:03', '', '西夏区', '2', '0', '4525356', '');
INSERT INTO `shopping_area` VALUES ('4525360', '2013-07-30 15:41:03', '', '金凤区', '2', '0', '4525356', '');
INSERT INTO `shopping_area` VALUES ('4525361', '2013-07-30 15:41:03', '', '永宁县', '2', '0', '4525356', '');
INSERT INTO `shopping_area` VALUES ('4525362', '2013-07-30 15:41:03', '', '贺兰县', '2', '0', '4525356', '');
INSERT INTO `shopping_area` VALUES ('4525363', '2013-07-30 15:41:04', '', '灵武市', '2', '0', '4525356', '');
INSERT INTO `shopping_area` VALUES ('4525364', '2013-07-30 15:41:04', '', '石嘴山市', '1', '0', '4525355', '');
INSERT INTO `shopping_area` VALUES ('4525365', '2013-07-30 15:41:04', '', '市辖区', '2', '0', '4525364', '');
INSERT INTO `shopping_area` VALUES ('4525366', '2013-07-30 15:41:04', '', '大武口区', '2', '0', '4525364', '');
INSERT INTO `shopping_area` VALUES ('4525367', '2013-07-30 15:41:04', '', '惠农区', '2', '0', '4525364', '');
INSERT INTO `shopping_area` VALUES ('4525368', '2013-07-30 15:41:04', '', '平罗县', '2', '0', '4525364', '');
INSERT INTO `shopping_area` VALUES ('4525369', '2013-07-30 15:41:04', '', '吴忠市', '1', '0', '4525355', '');
INSERT INTO `shopping_area` VALUES ('4525370', '2013-07-30 15:41:04', '', '市辖区', '2', '0', '4525369', '');
INSERT INTO `shopping_area` VALUES ('4525371', '2013-07-30 15:41:04', '', '利通区', '2', '0', '4525369', '');
INSERT INTO `shopping_area` VALUES ('4525372', '2013-07-30 15:41:04', '', '红寺堡区', '2', '0', '4525369', '');
INSERT INTO `shopping_area` VALUES ('4525373', '2013-07-30 15:41:05', '', '盐池县', '2', '0', '4525369', '');
INSERT INTO `shopping_area` VALUES ('4525374', '2013-07-30 15:41:05', '', '同心县', '2', '0', '4525369', '');
INSERT INTO `shopping_area` VALUES ('4525375', '2013-07-30 15:41:05', '', '青铜峡市', '2', '0', '4525369', '');
INSERT INTO `shopping_area` VALUES ('4525376', '2013-07-30 15:41:05', '', '固原市', '1', '0', '4525355', '');
INSERT INTO `shopping_area` VALUES ('4525377', '2013-07-30 15:41:05', '', '市辖区', '2', '0', '4525376', '');
INSERT INTO `shopping_area` VALUES ('4525378', '2013-07-30 15:41:05', '', '原州区', '2', '0', '4525376', '');
INSERT INTO `shopping_area` VALUES ('4525379', '2013-07-30 15:41:05', '', '西吉县', '2', '0', '4525376', '');
INSERT INTO `shopping_area` VALUES ('4525380', '2013-07-30 15:41:05', '', '隆德县', '2', '0', '4525376', '');
INSERT INTO `shopping_area` VALUES ('4525381', '2013-07-30 15:41:05', '', '泾源县', '2', '0', '4525376', '');
INSERT INTO `shopping_area` VALUES ('4525382', '2013-07-30 15:41:06', '', '彭阳县', '2', '0', '4525376', '');
INSERT INTO `shopping_area` VALUES ('4525383', '2013-07-30 15:41:06', '', '中卫市', '1', '0', '4525355', '');
INSERT INTO `shopping_area` VALUES ('4525384', '2013-07-30 15:41:06', '', '市辖区', '2', '0', '4525383', '');
INSERT INTO `shopping_area` VALUES ('4525385', '2013-07-30 15:41:06', '', '沙坡头区', '2', '0', '4525383', '');
INSERT INTO `shopping_area` VALUES ('4525386', '2013-07-30 15:41:06', '', '中宁县', '2', '0', '4525383', '');
INSERT INTO `shopping_area` VALUES ('4525387', '2013-07-30 15:41:06', '', '海原县', '2', '0', '4525383', '');
INSERT INTO `shopping_area` VALUES ('4525388', '2013-07-30 15:41:06', '', '新疆维吾尔自治区', '0', '0', null, '');
INSERT INTO `shopping_area` VALUES ('4525389', '2013-07-30 15:41:06', '', '乌鲁木齐市', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525390', '2013-07-30 15:41:06', '', '市辖区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525391', '2013-07-30 15:41:06', '', '天山区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525392', '2013-07-30 15:41:07', '', '沙依巴克区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525393', '2013-07-30 15:41:07', '', '新市区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525394', '2013-07-30 15:41:07', '', '水磨沟区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525395', '2013-07-30 15:41:07', '', '头屯河区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525396', '2013-07-30 15:41:07', '', '达坂城区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525397', '2013-07-30 15:41:07', '', '米东区', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525398', '2013-07-30 15:41:07', '', '乌鲁木齐县', '2', '0', '4525389', '');
INSERT INTO `shopping_area` VALUES ('4525399', '2013-07-30 15:41:07', '', '克拉玛依市', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525400', '2013-07-30 15:41:07', '', '市辖区', '2', '0', '4525399', '');
INSERT INTO `shopping_area` VALUES ('4525401', '2013-07-30 15:41:07', '', '独山子区', '2', '0', '4525399', '');
INSERT INTO `shopping_area` VALUES ('4525402', '2013-07-30 15:41:08', '', '克拉玛依区', '2', '0', '4525399', '');
INSERT INTO `shopping_area` VALUES ('4525403', '2013-07-30 15:41:08', '', '白碱滩区', '2', '0', '4525399', '');
INSERT INTO `shopping_area` VALUES ('4525404', '2013-07-30 15:41:08', '', '乌尔禾区', '2', '0', '4525399', '');
INSERT INTO `shopping_area` VALUES ('4525405', '2013-07-30 15:41:08', '', '吐鲁番地区', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525406', '2013-07-30 15:41:08', '', '吐鲁番市', '2', '0', '4525405', '');
INSERT INTO `shopping_area` VALUES ('4525407', '2013-07-30 15:41:08', '', '鄯善县', '2', '0', '4525405', '');
INSERT INTO `shopping_area` VALUES ('4525408', '2013-07-30 15:41:08', '', '托克逊县', '2', '0', '4525405', '');
INSERT INTO `shopping_area` VALUES ('4525409', '2013-07-30 15:41:08', '', '哈密地区', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525410', '2013-07-30 15:41:08', '', '哈密市', '2', '0', '4525409', '');
INSERT INTO `shopping_area` VALUES ('4525411', '2013-07-30 15:41:08', '', '巴里坤哈萨克自治县', '2', '0', '4525409', '');
INSERT INTO `shopping_area` VALUES ('4525412', '2013-07-30 15:41:09', '', '伊吾县', '2', '0', '4525409', '');
INSERT INTO `shopping_area` VALUES ('4525413', '2013-07-30 15:41:09', '', '昌吉回族自治州', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525414', '2013-07-30 15:41:09', '', '昌吉市', '2', '0', '4525413', '');
INSERT INTO `shopping_area` VALUES ('4525415', '2013-07-30 15:41:09', '', '阜康市', '2', '0', '4525413', '');
INSERT INTO `shopping_area` VALUES ('4525416', '2013-07-30 15:41:09', '', '呼图壁县', '2', '0', '4525413', '');
INSERT INTO `shopping_area` VALUES ('4525417', '2013-07-30 15:41:09', '', '玛纳斯县', '2', '0', '4525413', '');
INSERT INTO `shopping_area` VALUES ('4525418', '2013-07-30 15:41:09', '', '奇台县', '2', '0', '4525413', '');
INSERT INTO `shopping_area` VALUES ('4525419', '2013-07-30 15:41:09', '', '吉木萨尔县', '2', '0', '4525413', '');
INSERT INTO `shopping_area` VALUES ('4525420', '2013-07-30 15:41:09', '', '木垒哈萨克自治县', '2', '0', '4525413', '');
INSERT INTO `shopping_area` VALUES ('4525421', '2013-07-30 15:41:09', '', '博尔塔拉蒙古自治州', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525422', '2013-07-30 15:41:10', '', '博乐市', '2', '0', '4525421', '');
INSERT INTO `shopping_area` VALUES ('4525423', '2013-07-30 15:41:10', '', '精河县', '2', '0', '4525421', '');
INSERT INTO `shopping_area` VALUES ('4525424', '2013-07-30 15:41:10', '', '温泉县', '2', '0', '4525421', '');
INSERT INTO `shopping_area` VALUES ('4525425', '2013-07-30 15:41:10', '', '巴音郭楞蒙古自治州', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525426', '2013-07-30 15:41:10', '', '库尔勒市', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525427', '2013-07-30 15:41:10', '', '轮台县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525428', '2013-07-30 15:41:10', '', '尉犁县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525429', '2013-07-30 15:41:10', '', '若羌县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525430', '2013-07-30 15:41:10', '', '且末县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525431', '2013-07-30 15:41:11', '', '焉耆回族自治县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525432', '2013-07-30 15:41:11', '', '和静县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525433', '2013-07-30 15:41:11', '', '和硕县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525434', '2013-07-30 15:41:11', '', '博湖县', '2', '0', '4525425', '');
INSERT INTO `shopping_area` VALUES ('4525435', '2013-07-30 15:41:11', '', '阿克苏地区', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525436', '2013-07-30 15:41:11', '', '阿克苏市', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525437', '2013-07-30 15:41:11', '', '温宿县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525438', '2013-07-30 15:41:11', '', '库车县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525439', '2013-07-30 15:41:11', '', '沙雅县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525440', '2013-07-30 15:41:11', '', '新和县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525441', '2013-07-30 15:41:12', '', '拜城县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525442', '2013-07-30 15:41:12', '', '乌什县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525443', '2013-07-30 15:41:12', '', '阿瓦提县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525444', '2013-07-30 15:41:12', '', '柯坪县', '2', '0', '4525435', '');
INSERT INTO `shopping_area` VALUES ('4525445', '2013-07-30 15:41:12', '', '克孜勒苏柯尔克孜自治州', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525446', '2013-07-30 15:41:12', '', '阿图什市', '2', '0', '4525445', '');
INSERT INTO `shopping_area` VALUES ('4525447', '2013-07-30 15:41:12', '', '阿克陶县', '2', '0', '4525445', '');
INSERT INTO `shopping_area` VALUES ('4525448', '2013-07-30 15:41:12', '', '阿合奇县', '2', '0', '4525445', '');
INSERT INTO `shopping_area` VALUES ('4525449', '2013-07-30 15:41:12', '', '乌恰县', '2', '0', '4525445', '');
INSERT INTO `shopping_area` VALUES ('4525450', '2013-07-30 15:41:13', '', '喀什地区', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525451', '2013-07-30 15:41:13', '', '喀什市', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525452', '2013-07-30 15:41:13', '', '疏附县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525453', '2013-07-30 15:41:13', '', '疏勒县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525454', '2013-07-30 15:41:13', '', '英吉沙县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525455', '2013-07-30 15:41:13', '', '泽普县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525456', '2013-07-30 15:41:13', '', '莎车县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525457', '2013-07-30 15:41:13', '', '叶城县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525458', '2013-07-30 15:41:13', '', '麦盖提县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525459', '2013-07-30 15:41:13', '', '岳普湖县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525460', '2013-07-30 15:41:14', '', '伽师县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525461', '2013-07-30 15:41:14', '', '巴楚县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525462', '2013-07-30 15:41:14', '', '塔什库尔干塔吉克自治县', '2', '0', '4525450', '');
INSERT INTO `shopping_area` VALUES ('4525463', '2013-07-30 15:41:14', '', '和田地区', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525464', '2013-07-30 15:41:14', '', '和田市', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525465', '2013-07-30 15:41:14', '', '和田县', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525466', '2013-07-30 15:41:14', '', '墨玉县', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525467', '2013-07-30 15:41:14', '', '皮山县', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525468', '2013-07-30 15:41:14', '', '洛浦县', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525469', '2013-07-30 15:41:14', '', '策勒县', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525470', '2013-07-30 15:41:15', '', '于田县', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525471', '2013-07-30 15:41:15', '', '民丰县', '2', '0', '4525463', '');
INSERT INTO `shopping_area` VALUES ('4525472', '2013-07-30 15:41:15', '', '伊犁哈萨克自治州', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525473', '2013-07-30 15:41:15', '', '伊宁市', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525474', '2013-07-30 15:41:15', '', '奎屯市', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525475', '2013-07-30 15:41:15', '', '伊宁县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525476', '2013-07-30 15:41:15', '', '察布查尔锡伯自治县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525477', '2013-07-30 15:41:15', '', '霍城县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525478', '2013-07-30 15:41:15', '', '巩留县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525479', '2013-07-30 15:41:16', '', '新源县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525480', '2013-07-30 15:41:16', '', '昭苏县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525481', '2013-07-30 15:41:16', '', '特克斯县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525482', '2013-07-30 15:41:16', '', '尼勒克县', '2', '0', '4525472', '');
INSERT INTO `shopping_area` VALUES ('4525483', '2013-07-30 15:41:16', '', '塔城地区', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525484', '2013-07-30 15:41:16', '', '塔城市', '2', '0', '4525483', '');
INSERT INTO `shopping_area` VALUES ('4525485', '2013-07-30 15:41:16', '', '乌苏市', '2', '0', '4525483', '');
INSERT INTO `shopping_area` VALUES ('4525486', '2013-07-30 15:41:16', '', '额敏县', '2', '0', '4525483', '');
INSERT INTO `shopping_area` VALUES ('4525487', '2013-07-30 15:41:16', '', '沙湾县', '2', '0', '4525483', '');
INSERT INTO `shopping_area` VALUES ('4525488', '2013-07-30 15:41:17', '', '托里县', '2', '0', '4525483', '');
INSERT INTO `shopping_area` VALUES ('4525489', '2013-07-30 15:41:17', '', '裕民县', '2', '0', '4525483', '');
INSERT INTO `shopping_area` VALUES ('4525490', '2013-07-30 15:41:17', '', '和布克赛尔蒙古自治县', '2', '0', '4525483', '');
INSERT INTO `shopping_area` VALUES ('4525491', '2013-07-30 15:41:17', '', '阿勒泰地区', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525492', '2013-07-30 15:41:17', '', '阿勒泰市', '2', '0', '4525491', '');
INSERT INTO `shopping_area` VALUES ('4525493', '2013-07-30 15:41:17', '', '布尔津县', '2', '0', '4525491', '');
INSERT INTO `shopping_area` VALUES ('4525494', '2013-07-30 15:41:17', '', '富蕴县', '2', '0', '4525491', '');
INSERT INTO `shopping_area` VALUES ('4525495', '2013-07-30 15:41:17', '', '福海县', '2', '0', '4525491', '');
INSERT INTO `shopping_area` VALUES ('4525496', '2013-07-30 15:41:17', '', '哈巴河县', '2', '0', '4525491', '');
INSERT INTO `shopping_area` VALUES ('4525497', '2013-07-30 15:41:17', '', '青河县', '2', '0', '4525491', '');
INSERT INTO `shopping_area` VALUES ('4525498', '2013-07-30 15:41:18', '', '吉木乃县', '2', '0', '4525491', '');
INSERT INTO `shopping_area` VALUES ('4525499', '2013-07-30 15:41:18', '', '自治区直辖县级行政区划', '1', '0', '4525388', '');
INSERT INTO `shopping_area` VALUES ('4525500', '2013-07-30 15:41:18', '', '石河子市', '2', '0', '4525499', '');
INSERT INTO `shopping_area` VALUES ('4525501', '2013-07-30 15:41:18', '', '阿拉尔市', '2', '0', '4525499', '');
INSERT INTO `shopping_area` VALUES ('4525502', '2013-07-30 15:41:18', '', '图木舒克市', '2', '0', '4525499', '');
INSERT INTO `shopping_area` VALUES ('4525503', '2013-07-30 15:41:18', '', '五家渠市', '2', '0', '4525499', '');

-- ----------------------------
-- Table structure for `shopping_article`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_article`;
CREATE TABLE `shopping_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `display` bit(1) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `articleClass_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK226D0CC544EDEDD1` (`articleClass_id`),
  KEY `FK8DAC7D1F34A1CF82` (`articleClass_id`),
  CONSTRAINT `FK226D0CC544EDEDD1` FOREIGN KEY (`articleClass_id`) REFERENCES `shopping_articleclass` (`id`),
  CONSTRAINT `FK8DAC7D1F34A1CF82` FOREIGN KEY (`articleClass_id`) REFERENCES `shopping_articleclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196624 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_article
-- ----------------------------
INSERT INTO `shopping_article` VALUES ('196618', '2016-03-31 14:53:37', '', '微信WAP版上线，欢迎广大顾客围观', '', '', '0', '微信WAP版上线，欢迎广大顾客围观', '', '1');
INSERT INTO `shopping_article` VALUES ('196619', '2016-03-31 14:54:22', '', '关于安装问题，技术人员会详细解决的', '', '', '0', '关于安装问题，技术人员会详细解决', '', '1');
INSERT INTO `shopping_article` VALUES ('196620', '2016-03-31 14:55:18', '', '近期修复相关bug', '', '', '0', '近期修复bug，您可在演示环境测试', '', '1');
INSERT INTO `shopping_article` VALUES ('196622', '2016-03-31 14:56:19', '', '代码中新增部分注释', '', '', '0', '代码中新增部分注释', '', '1');
INSERT INTO `shopping_article` VALUES ('196623', '2016-03-31 15:04:26', '', '近期会加入微信扫码支付，新增pc支付方式', '', '', '0', '近期会加入微信扫码，新增pc支付', '', '1');

-- ----------------------------
-- Table structure for `shopping_articleclass`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_articleclass`;
CREATE TABLE `shopping_articleclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `sysClass` bit(1) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK29AACFD3987F7269` (`parent_id`),
  KEY `FKA62587B98833541A` (`parent_id`),
  CONSTRAINT `FK29AACFD3987F7269` FOREIGN KEY (`parent_id`) REFERENCES `shopping_articleclass` (`id`),
  CONSTRAINT `FKA62587B98833541A` FOREIGN KEY (`parent_id`) REFERENCES `shopping_articleclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163844 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_articleclass
-- ----------------------------
INSERT INTO `shopping_articleclass` VALUES ('1', '2013-08-23 16:13:51', '', '商城新闻', '0', 'news', '1', '', null);
INSERT INTO `shopping_articleclass` VALUES ('98304', '2013-08-25 10:18:49', '', '帮助中心 ', '0', 'help', '2', '', null);
INSERT INTO `shopping_articleclass` VALUES ('98306', '2013-08-25 10:21:10', '', '店主之家', '0', 'seller', '3', '', null);
INSERT INTO `shopping_articleclass` VALUES ('98307', '2013-08-25 10:21:26', '', '支付方式', '0', 'pay', '4', '', null);
INSERT INTO `shopping_articleclass` VALUES ('131072', '2013-08-25 10:23:18', '', '售后服务 ', '0', 'sold', '5', '', null);
INSERT INTO `shopping_articleclass` VALUES ('163840', '2013-08-25 10:29:55', '', '客服中心', '0', 'service', '6', '', null);
INSERT INTO `shopping_articleclass` VALUES ('163841', '2013-08-25 10:30:08', '', '关于我们', '0', 'about', '8', '', null);
INSERT INTO `shopping_articleclass` VALUES ('163842', '2015-02-26 10:15:06', '', '新手上路', '0', 'newuser', '0', '', null);
INSERT INTO `shopping_articleclass` VALUES ('163843', '2015-02-26 10:25:33', '', '特色服务', '0', 'feature', '7', '', null);

-- ----------------------------
-- Table structure for `shopping_bargain`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_bargain`;
CREATE TABLE `shopping_bargain` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `bargain_time` date DEFAULT NULL,
  `maximum` int(11) DEFAULT '0',
  `rebate` decimal(3,2) DEFAULT NULL,
  `state` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_bargain
-- ----------------------------
INSERT INTO `shopping_bargain` VALUES ('2', '2014-09-26 16:59:50', '', '2014-09-29', '300', '6.00', '国庆六折大酬宾');

-- ----------------------------
-- Table structure for `shopping_bargain_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_bargain_goods`;
CREATE TABLE `shopping_bargain_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `bg_price` decimal(12,2) DEFAULT NULL,
  `bg_status` int(11) NOT NULL,
  `bg_time` date DEFAULT NULL,
  `bg_admin_user_id` bigint(20) DEFAULT NULL,
  `bg_goods_id` bigint(20) DEFAULT NULL,
  `bg_count` int(11) DEFAULT '1',
  `bg_rebate` decimal(3,1) DEFAULT NULL,
  `audit_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKECBE5852AB0DFB98` (`bg_admin_user_id`),
  KEY `FKECBE585282133C8C` (`bg_goods_id`),
  CONSTRAINT `FKECBE585282133C8C` FOREIGN KEY (`bg_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKECBE5852AB0DFB98` FOREIGN KEY (`bg_admin_user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_bargain_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_brandcategory`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_brandcategory`;
CREATE TABLE `shopping_brandcategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_brandcategory
-- ----------------------------
INSERT INTO `shopping_brandcategory` VALUES ('1', '2013-12-24 09:50:45', '', '男装', '0');
INSERT INTO `shopping_brandcategory` VALUES ('2', '2013-12-24 09:59:10', '', '女装', '0');
INSERT INTO `shopping_brandcategory` VALUES ('3', '2013-12-24 10:07:10', '', '数码', '0');
INSERT INTO `shopping_brandcategory` VALUES ('4', '2013-12-24 10:09:05', '', '运动', '0');

-- ----------------------------
-- Table structure for `shopping_cart_gsp`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_gsp`;
CREATE TABLE `shopping_cart_gsp` (
  `cart_id` bigint(20) NOT NULL,
  `gsp_id` bigint(20) NOT NULL,
  KEY `FK718B005C6B9FD208` (`cart_id`),
  KEY `FK718B005C2F8BE734` (`gsp_id`),
  CONSTRAINT `FK718B005C2F8BE734` FOREIGN KEY (`gsp_id`) REFERENCES `shopping_goodsspecproperty` (`id`),
  CONSTRAINT `FK718B005C6B9FD208` FOREIGN KEY (`cart_id`) REFERENCES `shopping_goodscart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_cart_gsp
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_chatting`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_chatting`;
CREATE TABLE `shopping_chatting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `type` int(11) DEFAULT '0',
  `user1_id` bigint(20) DEFAULT NULL,
  `user2_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKC6DDCF3D16F36727` (`user1_id`),
  KEY `FKC6DDCF3D16F3DB86` (`user2_id`),
  CONSTRAINT `FKC6DDCF3D16F36727` FOREIGN KEY (`user1_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKC6DDCF3D16F3DB86` FOREIGN KEY (`user2_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_chatting
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_chattingfriend`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_chattingfriend`;
CREATE TABLE `shopping_chattingfriend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `type` int(11) DEFAULT '1',
  `friend_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `friendUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK9DBC61B5537B6C51` (`user_id`),
  KEY `FK9DBC61B516CF789E` (`friend_id`),
  KEY `FK9DBC61B584EFD3F3` (`friendUser_id`),
  KEY `FKE668B81B1E208F02` (`user_id`),
  KEY `FKE668B81B4F94F6A4` (`friendUser_id`),
  CONSTRAINT `FK9DBC61B516CF789E` FOREIGN KEY (`friend_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK9DBC61B5537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK9DBC61B584EFD3F3` FOREIGN KEY (`friendUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKE668B81B1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKE668B81B4F94F6A4` FOREIGN KEY (`friendUser_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_chattingfriend
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_chattinglog`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_chattinglog`;
CREATE TABLE `shopping_chattinglog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `User_id` bigint(20) DEFAULT NULL,
  `chatting_id` bigint(20) DEFAULT NULL,
  `mark` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4E392EE73236E522` (`chatting_id`),
  KEY `FK4E392EE71E208F02` (`User_id`),
  CONSTRAINT `FK4E392EE71E208F02` FOREIGN KEY (`User_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK4E392EE73236E522` FOREIGN KEY (`chatting_id`) REFERENCES `shopping_chatting` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_chattinglog
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_combin_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_combin_log`;
CREATE TABLE `shopping_combin_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1CEAE93C920D7683` (`store_id`),
  KEY `FKA85E62A21C0CA9F2` (`store_id`),
  CONSTRAINT `FK1CEAE93C920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FKA85E62A21C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_combin_log
-- ----------------------------
INSERT INTO `shopping_combin_log` VALUES ('1', '2014-10-09 12:13:35', '', '2014-10-09 12:13:35', '2015-08-09 12:13:35', '600', '1');

-- ----------------------------
-- Table structure for `shopping_complaint`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_complaint`;
CREATE TABLE `shopping_complaint` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `appeal_time` datetime DEFAULT NULL,
  `from_user_content` longtext,
  `handle_content` longtext,
  `handle_time` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `talk_content` longtext,
  `to_user_content` longtext,
  `type` varchar(255) DEFAULT NULL,
  `cs_id` bigint(20) DEFAULT NULL,
  `from_acc1_id` bigint(20) DEFAULT NULL,
  `from_acc2_id` bigint(20) DEFAULT NULL,
  `from_acc3_id` bigint(20) DEFAULT NULL,
  `from_user_id` bigint(20) DEFAULT NULL,
  `handle_user_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `to_acc1_id` bigint(20) DEFAULT NULL,
  `to_acc2_id` bigint(20) DEFAULT NULL,
  `to_acc3_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5F874694BAA5A510` (`to_acc1_id`),
  KEY `FK5F874694D215FBEB` (`handle_user_id`),
  KEY `FK5F874694A5A3993E` (`to_user_id`),
  KEY `FK5F8746942B4D839E` (`from_acc2_id`),
  KEY `FK5F8746942B4D0F3F` (`from_acc1_id`),
  KEY `FK5F874694BAA68DCE` (`to_acc3_id`),
  KEY `FK5F8746942B4DF7FD` (`from_acc3_id`),
  KEY `FK5F874694CCC27273` (`cs_id`),
  KEY `FK5F874694BAA6196F` (`to_acc2_id`),
  KEY `FK5F874694164B036D` (`from_user_id`),
  KEY `FK5F874694E66AF58D` (`of_id`),
  CONSTRAINT `FK5F874694164B036D` FOREIGN KEY (`from_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK5F8746942B4D0F3F` FOREIGN KEY (`from_acc1_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK5F8746942B4D839E` FOREIGN KEY (`from_acc2_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK5F8746942B4DF7FD` FOREIGN KEY (`from_acc3_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK5F874694A5A3993E` FOREIGN KEY (`to_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK5F874694BAA5A510` FOREIGN KEY (`to_acc1_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK5F874694BAA6196F` FOREIGN KEY (`to_acc2_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK5F874694BAA68DCE` FOREIGN KEY (`to_acc3_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK5F874694CCC27273` FOREIGN KEY (`cs_id`) REFERENCES `shopping_complaint_subject` (`id`),
  CONSTRAINT `FK5F874694D215FBEB` FOREIGN KEY (`handle_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK5F874694E66AF58D` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_complaint_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_complaint_goods`;
CREATE TABLE `shopping_complaint_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `complaint_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8F9101EB339519D2` (`goods_id`),
  KEY `FK8F9101EBA599F1B2` (`complaint_id`),
  CONSTRAINT `FK8F9101EB339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK8F9101EBA599F1B2` FOREIGN KEY (`complaint_id`) REFERENCES `shopping_complaint` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_complaint_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_complaint_subject`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_complaint_subject`;
CREATE TABLE `shopping_complaint_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_complaint_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_consult`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_consult`;
CREATE TABLE `shopping_consult` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `consult_content` longtext,
  `consult_email` varchar(255) DEFAULT NULL,
  `consult_reply` longtext,
  `reply` bit(1) NOT NULL,
  `reply_time` datetime DEFAULT NULL,
  `consult_user_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `reply_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK86CB3BBB66DC9BFC` (`reply_user_id`),
  KEY `FK86CB3BBBA995E663` (`goods_id`),
  KEY `FK86CB3BBBCAAD62FE` (`consult_user_id`),
  KEY `FKF20AAC153181BEAD` (`reply_user_id`),
  KEY `FKF20AAC15339519D2` (`goods_id`),
  KEY `FKF20AAC15955285AF` (`consult_user_id`),
  CONSTRAINT `FK86CB3BBB66DC9BFC` FOREIGN KEY (`reply_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK86CB3BBBA995E663` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK86CB3BBBCAAD62FE` FOREIGN KEY (`consult_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF20AAC153181BEAD` FOREIGN KEY (`reply_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF20AAC15339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKF20AAC15955285AF` FOREIGN KEY (`consult_user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_consult
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_coupon`;
CREATE TABLE `shopping_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `coupon_amount` decimal(12,2) DEFAULT NULL,
  `coupon_begin_time` date DEFAULT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_end_time` date DEFAULT NULL,
  `coupon_name` varchar(255) DEFAULT NULL,
  `coupon_order_amount` decimal(12,2) DEFAULT NULL,
  `coupon_acc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1013FEDD31C9FEBC` (`coupon_acc_id`),
  CONSTRAINT `FK1013FEDD31C9FEBC` FOREIGN KEY (`coupon_acc_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_coupon
-- ----------------------------
INSERT INTO `shopping_coupon` VALUES ('1', '2014-09-23 16:42:45', '', '5.00', '2014-09-01', '10', '2014-12-31', '5元优惠券', '100.00', '425993');
INSERT INTO `shopping_coupon` VALUES ('2', '2014-09-23 19:52:36', '', '10.00', '2014-09-01', '100', '2014-12-31', '10元优惠券', '100.00', '425994');
INSERT INTO `shopping_coupon` VALUES ('3', '2014-09-24 10:39:07', '', '20.00', '2014-09-01', '10', '2014-12-31', '20元优惠券', '200.00', '425995');

-- ----------------------------
-- Table structure for `shopping_coupon_info`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_coupon_info`;
CREATE TABLE `shopping_coupon_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `coupon_sn` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `coupon_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE4A2D7682F288B1` (`coupon_id`),
  KEY `FKE4A2D76537B6C51` (`user_id`),
  KEY `FKF145E0D038D9C322` (`coupon_id`),
  KEY `FKF145E0D01E208F02` (`user_id`),
  CONSTRAINT `FKE4A2D76537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKE4A2D7682F288B1` FOREIGN KEY (`coupon_id`) REFERENCES `shopping_coupon` (`id`),
  CONSTRAINT `FKF145E0D01E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF145E0D038D9C322` FOREIGN KEY (`coupon_id`) REFERENCES `shopping_coupon` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_coupon_info
-- ----------------------------
INSERT INTO `shopping_coupon_info` VALUES ('1', '2014-09-23 16:42:59', '', '3eec33f0-a548-4768-b0d0-3dc152129c03', '1', '1', '1');

-- ----------------------------
-- Table structure for `shopping_delivery_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_delivery_goods`;
CREATE TABLE `shopping_delivery_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `d_status` int(11) NOT NULL,
  `d_admin_user_id` bigint(20) DEFAULT NULL,
  `d_delivery_goods_id` bigint(20) DEFAULT NULL,
  `d_goods_id` bigint(20) DEFAULT NULL,
  `d_begin_time` date DEFAULT NULL,
  `d_end_time` date DEFAULT NULL,
  `d_audit_time` datetime DEFAULT NULL,
  `d_refuse_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK858B789CC3254733` (`d_delivery_goods_id`),
  KEY `FK858B789C1BAB47DE` (`d_goods_id`),
  KEY `FK858B789C78FFAAC6` (`d_admin_user_id`),
  KEY `FKCE37CF024D247AA2` (`d_delivery_goods_id`),
  KEY `FKCE37CF02A5AA7B4D` (`d_goods_id`),
  KEY `FKCE37CF0243A4CD77` (`d_admin_user_id`),
  CONSTRAINT `FK858B789C1BAB47DE` FOREIGN KEY (`d_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK858B789C78FFAAC6` FOREIGN KEY (`d_admin_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK858B789CC3254733` FOREIGN KEY (`d_delivery_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKCE37CF0243A4CD77` FOREIGN KEY (`d_admin_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKCE37CF024D247AA2` FOREIGN KEY (`d_delivery_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKCE37CF02A5AA7B4D` FOREIGN KEY (`d_goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_delivery_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_delivery_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_delivery_log`;
CREATE TABLE `shopping_delivery_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK69A11E0A920D7683` (`store_id`),
  KEY `FKE61BD5F01C0CA9F2` (`store_id`),
  CONSTRAINT `FK69A11E0A920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FKE61BD5F01C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_delivery_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_document`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_document`;
CREATE TABLE `shopping_document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `mark` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65538 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_document
-- ----------------------------
INSERT INTO `shopping_document` VALUES ('1', '2014-02-21 18:26:18', '', '<p>\r\n	一、团购的所有权和运作权归本公司。\r\n</p>\r\n<p>\r\n	二、本公司有权在必要时修改本协议，本协议一旦发生变更，将会在相关页面上公布。如果您不同意所改动的内容，您应主动停止使用团购服务。如果您继续使用服务，则视为接受本协议的变更。\r\n</p>\r\n<p>\r\n	三、如发生下列任何一种情形，本公司有权中断或终止向您提供的服务而无需通知您：\r\n</p>\r\n1、 您提供的个人资料不真实；<br />\r\n2、您违反本协议的规定；<br />\r\n3、 按照政府主管部门的监管要求；<br />\r\n4、本公司认为您的行为违反团购服务性质或需求的特殊情形。\r\n<p>\r\n	四、尽管本协议可能另有其他规定，本公司仍然可以随时终止本协议。\r\n</p>\r\n<p>\r\n	五、本公司终止本协议的权利不会妨害本公司可能拥有的在本协议终止前因您违反本协议或本公司本应享有的任何其他权利。\r\n</p>\r\n<p>\r\n	六、您理解并完全接受，本公司有权自行对团购资源作下线处理。\r\n</p>', 'group', '团购协议');
INSERT INTO `shopping_document` VALUES ('32768', '2013-09-17 23:24:19', '', '<p>\r\n	特别提醒用户认真阅读本《用户服务协议》(下称《协议》) 中各条款。除非您接受本《协议》条款，否则您无权使用本网站提供的相关服务。您的使用行为将视为对本《协议》的接受，并同意接受本《协议》各项条款的约束。 <br />\r\n<br />\r\n<strong>一、定义</strong>\r\n</p>\r\n<ol>\r\n	<li>\r\n		\"用户\"指符合本协议所规定的条件，同意遵守本网站各种规则、条款（包括但不限于本协议），并使用本网站的个人或机构。\r\n	</li>\r\n	<li>\r\n		\"卖家\"是指在本网站上出售物品的用户。\"买家\"是指在本网站购买物品的用户。\r\n	</li>\r\n	<li>\r\n		\"成交\"指买家根据卖家所刊登的交易要求，在特定时间内提出最优的交易条件，因而取得依其提出的条件购买该交易物品的权利。\r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n<br />\r\n<strong>二、用户资格</strong><br />\r\n<br />\r\n只有符合下列条件之一的人员或实体才能申请成为本网站用户，可以使用本网站的服务。\r\n</p>\r\n<ol>\r\n	<li>\r\n		年满十八岁，并具有民事权利能力和民事行为能力的自然人；\r\n	</li>\r\n	<li>\r\n		未满十八岁，但监护人（包括但不仅限于父母）予以书面同意的自然人；\r\n	</li>\r\n	<li>\r\n		根据中国法律或设立地法律、法规和/或规章成立并合法存在的公司、企事业单位、社团组织和其他组织。\r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n无民事行为能力人、限制民事行为能力人以及无经营或特定经营资格的组织不当注册为本网站用户或超过其民事权利或行为能力范围从事交易的，其与本网站之间的协议自始无效，本网站一经发现，有权立即注销该用户，并追究其使用本网站\"服务\"的一切法律责任。<br />\r\n<br />\r\n<strong>三.用户的权利和义务</strong>\r\n</p>\r\n<ol>\r\n	<li>\r\n		用户有权根据本协议的规定及本网站发布的相关规则，利用本网站网上交易平台登录物品、发布交易信息、查询物品信息、购买物品、与其他用户订立物品买卖合同、在本网站社区发帖、参加本网站的有关活动及有权享受本网站提供的其他的有关资讯及信息服务。\r\n	</li>\r\n	<li>\r\n		用户有权根据需要更改密码和交易密码。用户应对以该用户名进行的所有活动和事件负全部责任。\r\n	</li>\r\n	<li>\r\n		用户有义务确保向本网站提供的任何资料、注册信息真实准确，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等。保证本网站及其他用户可以通过上述联系方式与自己进行联系。同时，用户也有义务在相关资料实际变更时及时更新有关注册资料。\r\n	</li>\r\n	<li>\r\n		用户不得以任何形式擅自转让或授权他人使用自己在本网站的用户帐号。\r\n	</li>\r\n	<li>\r\n		用户有义务确保在本网站网上交易平台上登录物品、发布的交易信息真实、准确，无误导性。\r\n	</li>\r\n	<li>\r\n		用户不得在本网站网上交易平台买卖国家禁止销售的或限制销售的物品、不得买卖侵犯他人知识产权或其他合法权益的物品，也不得买卖违背社会公共利益或公共道德的物品。\r\n	</li>\r\n	<li>\r\n		用户不得在本网站发布各类违法或违规信息。包括但不限于物品信息、交易信息、社区帖子、物品留言，店铺留言，评价内容等。\r\n	</li>\r\n	<li>\r\n		用户在本网站交易中应当遵守诚实信用原则，不得以干预或操纵物品价格等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为，不得在交易平台上发布任何违法信息。\r\n	</li>\r\n	<li>\r\n		用户不应采取不正当手段（包括但不限于虚假交易、互换好评等方式）提高自身或他人信用度，或采用不正当手段恶意评价其他用户，降低其他用户信用度。\r\n	</li>\r\n	<li>\r\n		用户承诺自己在使用本网站网上交易平台实施的所有行为遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，用户将以自己的名义独立承担所有相应的法律责任。\r\n	</li>\r\n	<li>\r\n		用户在本网站网上交易过程中如与其他用户因交易产生纠纷，可以请求本网站从中予以协调。用户如发现其他用户有违法或违反本协议的行为，可以向本网站举报。如用户因网上交易与其他用户产生诉讼的，用户有权通过司法部门要求本网站提供相关资料。\r\n	</li>\r\n	<li>\r\n		用户应自行承担因交易产生的相关费用，并依法纳税。\r\n	</li>\r\n	<li>\r\n		未经本网站书面允许，用户不得将本网站资料以及在交易平台上所展示的任何信息以复制、修改、翻译等形式制作衍生作品、分发或公开展示。\r\n	</li>\r\n	<li>\r\n		用户同意接收来自本网站的信息，包括但不限于活动信息、交易信息、促销信息等。\r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n<br />\r\n<strong>四、 本网站的权利和义务</strong>\r\n</p>\r\n<ol>\r\n	<li>\r\n		本\r\n网站不是传统意义上的\"拍卖商\"，仅为用户提供一个信息交流、进行物品买卖的平台，充当买卖双方之间的交流媒介，而非买主或卖主的代理商、合伙  \r\n人、雇员或雇主等经营关系人。公布在本网站上的交易物品是用户自行上传进行交易的物品，并非本网站所有。对于用户刊登物品、提供的信息或参与竞标的过程，\r\n本网站均不加以监视或控制，亦不介入物品的交易过程，包括运送、付款、退款、瑕疵担保及其它交易事项，且不承担因交易物品存在品质、权利上的瑕疵以及交易\r\n  方履行交易协议的能力而产生的任何责任，对于出现在拍卖上的物品品质、安全性或合法性，本网站均不予保证。\r\n	</li>\r\n	<li>\r\n		本网站有义务在现有技术水平的基础上努力确保整个网上交易平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。\r\n	</li>\r\n	<li>\r\n		本网站有义务对用户在注册使用本网站网上交易平台中所遇到的问题及反映的情况及时作出回复。\r\n	</li>\r\n	<li>\r\n		本网站有权对用户的注册资料进行查阅，对存在任何问题或怀疑的注册资料，本网站有权发出通知询问用户并要求用户做出解释、改正，或直接做出处罚、删除等处理。\r\n	</li>\r\n	<li>\r\n		用\r\n户因在本网站网上交易与其他用户产生纠纷的，用户通过司法部门或行政部门依照法定程序要求本网站提供相关资料，本网站将积极配合并提供有关资料；用户将纠\r\n纷告知本网站，或本网站知悉纠纷情况的，经审核后，本网站有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对 \r\n 方。\r\n	</li>\r\n	<li>\r\n		因网上交易平台的特殊性，本网站没有义务对所有用户的注册资料、所有的交易行为以及与交易有关的其他事项进行事先审查，但如发生以下情形，本网站有权限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期地中止及拒绝向该用户提供服务：\r\n		<ul>\r\n			<li>\r\n				用户违反本协议或因被提及而纳入本协议的文件；\r\n			</li>\r\n			<li>\r\n				存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而本网站无法联系到该用户核证或验证该用户向本网站提供的任何资料；\r\n			</li>\r\n			<li>\r\n				存在用户或其他第三方通知本网站，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。本网站以普通非专业交易者的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对本网站用户或本网站造成财务损失或法律责任。\r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		在反网络欺诈行动中，本着保护广大用户利益的原则，当用户举报自己交易可能存在欺诈而产生交易争议时，本网站有权通过表面判断暂时冻结相关用户账号，并有权核对当事人身份资料及要求提供交易相关证明材料。\r\n	</li>\r\n	<li>\r\n		根据国家法律法规、本协议的内容和本网站所掌握的事实依据，可以认定用户存在违法或违反本协议行为以及在本网站交易平台上的其他不当行为，本网站有权在本网站交易平台及所在网站上以网络发布形式公布用户的违法行为，并有权随时作出删除相关信息，而无须征得用户的同意。\r\n	</li>\r\n	<li>\r\n		本\r\n网站有权在不通知用户的前提下删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的；以炒作信用为目的；存在欺诈等恶意或虚假内容；与网\r\n  上交易无关或不是以交易为目的；存在恶意竞价或其他试图扰乱正常交易秩序因素；该信息违反公共利益或可能严重损害本网站和其他用户合法利益的。\r\n	</li>\r\n	<li>\r\n		用\r\n  户授予本网站独家的、全球通用的、永久的、免费的信息许可使用权利，本网站有权对该权利进行再授权，依此授权本网站有权(全部或部份地)  \r\n使用、复制、修订、改写、发布、翻译、分发、执行和展示用户公示于网站的各类信息或制作其派生作品，以现在已知或日后开发的任何形式、媒体或技术，将上述\r\n  信息纳入其他作品内。\r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n<br />\r\n<strong>五、服务的中断和终止</strong>\r\n</p>\r\n<ol>\r\n	<li>\r\n		在\r\n  本网站未向用户收取相关服务费用的情况下，本网站可自行全权决定以任何理由  \r\n(包括但不限于本网站认为用户已违反本协议的字面意义和精神，或用户在超过180天内未登录本网站等)  \r\n终止对用户的服务，并不再保存用户在本网站的全部资料（包括但不限于用户信息、商品信息、交易信息等）。同时本网站可自行全权决定，在发出通知或不发出通\r\n知的情况下，随时停止提供全部或部分服务。服务终止后，本网站没有义务为用户保留原用户资料或与之相关的任何信息，或转发任何未曾阅读或发送的信息给用户\r\n  或第三方。此外，本网站不就终止对用户的服务而对用户或任何第三方承担任何责任。\r\n	</li>\r\n	<li>\r\n		如用户向本网站提出注销本网站注册用户身份，需经本网站审核同意，由本网站注销该注册用户，用户即解除与本网站的协议关系，但本网站仍保留下列权利：\r\n		<ul>\r\n			<li>\r\n				用户注销后，本网站有权保留该用户的资料,包括但不限于以前的用户资料、店铺资料、商品资料和交易记录等。\r\n			</li>\r\n			<li>\r\n				用户注销后，如用户在注销前在本网站交易平台上存在违法行为或违反本协议的行为，本网站仍可行使本协议所规定的权利。\r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		如存在下列情况，本网站可以通过注销用户的方式终止服务：\r\n		<ul>\r\n			<li>\r\n				在用户违反本协议相关规定时，本网站有权终止向该用户提供服务。本网站将在中断服务时通知用户。但如该用户在被本网站终止提供服务后，再一次直接或间接或以他人名义注册为本网站用户的，本网站有权再次单方面终止为该用户提供服务；\r\n			</li>\r\n			<li>\r\n				一旦本网站发现用户注册资料中主要内容是虚假的，本网站有权随时终止为该用户提供服务；\r\n			</li>\r\n			<li>\r\n				本协议终止或更新时，用户未确认新的协议的。\r\n			</li>\r\n			<li>\r\n				其它本网站认为需终止服务的情况。\r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		因用户违反相关法律法规或者违反本协议规定等原因而致使本网站中断、终止对用户服务的，对于服务中断、终止之前用户交易行为依下列原则处理：\r\n		<ul>\r\n			<li>\r\n				本网站有权决定是否在中断、终止对用户服务前将用户被中断或终止服务的情况和原因通知用户交易关系方，包括但不限于对该交易有意向但尚未达成交易的用户,参与该交易竞价的用户，已达成交易要约用户。\r\n			</li>\r\n			<li>\r\n				服务中断、终止之前，用户已经上传至本网站的物品尚未交易或交易尚未完成的，本网站有权在中断、终止服务的同时删除此项物品的相关信息。\r\n			</li>\r\n			<li>\r\n				服务中断、终止之前，用户已经就其他用户出售的具体物品作出要约，但交易尚未结束，本网站有权在中断或终止服务的同时删除该用户的相关要约和信息。\r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		本网站若因用户的行为（包括但不限于刊登的商品、在本网站社区发帖等）侵害了第三方的权利或违反了相关规定，而受到第三方的追偿或受到主管机关的处分时，用户应赔偿本网站因此所产生的一切损失及费用。\r\n	</li>\r\n	<li>\r\n		对违反相关法律法规或者违反本协议规定，且情节严重的用户，本网站有权终止该用户的其它服务。\r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n<br />\r\n<strong>六、协议的修订</strong><br />\r\n<br />\r\n本协议可由本网站随时修订，并将修订后的协议公告于本网站之上，修订后的条款内容自公告时起生效，并成为本协议的一部分。用户若在本协议修改之后，仍继续使用本网站，则视为用户接受和自愿遵守修订后的协议。本网站行使修改或中断服务时，不需对任何第三方负责。<br />\r\n<br />\r\n<strong>七、 本网站的责任范围 </strong><br />\r\n<br />\r\n当用户接受该协议时，用户应明确了解并同意∶\r\n</p>\r\n<ol>\r\n	<li>\r\n		是否经由本网站下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。\r\n	</li>\r\n	<li>\r\n		用户经由本网站取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。\r\n	</li>\r\n	<li>\r\n		基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，本网站不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使本网站已被告知前款赔偿的可能性）：\r\n		<ul>\r\n			<li>\r\n				本网站的使用或无法使用。\r\n			</li>\r\n			<li>\r\n				经由或通过本网站购买或取得的任何物品，或接收之信息，或进行交易所随之产生的替代物品及服务的购买成本。\r\n			</li>\r\n			<li>\r\n				用户的传输或资料遭到未获授权的存取或变更。\r\n			</li>\r\n			<li>\r\n				本网站中任何第三方之声明或行为。\r\n			</li>\r\n			<li>\r\n				本网站其它相关事宜。\r\n			</li>\r\n		</ul>\r\n	</li>\r\n	<li>\r\n		本网站只是为用户提供一个交易的平台，对于用户所刊登的交易物品的合法性、真实性及其品质，以及用户履行交易的能力等，本网站一律不负任何担保责任。用户如果因使用本网站，或因购买刊登于本网站的任何物品，而受有损害时，本网站不负任何补偿或赔偿责任。\r\n	</li>\r\n	<li>\r\n		本\r\n网站提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示本网站与这些运营商有任何关系。其它运营商经营的网站均\r\n由各经营者自行负责，不属于本网站控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、产品或其它资料，本网站亦不予保证或负责。因使\r\n  用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，本网站不负任何直接或间接的责任。\r\n	</li>\r\n</ol>\r\n<p>\r\n	<br />\r\n<br />\r\n<strong>八.、不可抗力</strong><br />\r\n<br />\r\n因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的\r\n客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人\r\n  为造成的灾难等客观情况。<br />\r\n<br />\r\n<strong>九、争议解决方式</strong>\r\n</p>\r\n<ol>\r\n	<li>\r\n		本协议及其修订本的有效性、履行和与本协议及其修订本效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。\r\n	</li>\r\n	<li>\r\n		因\r\n使用本网站服务所引起与本网站的任何争议，均应提交深圳仲裁委员会按照该会届时有效的仲裁规则进行仲裁。相关争议应单独仲裁，不得与任何其它方的争议在任\r\n  何仲裁中合并处理，该仲裁裁决是终局，对各方均有约束力。如果所涉及的争议不适于仲裁解决，用户同意一切争议由人民法院管辖。\r\n	</li>\r\n</ol>\r\n<br />', 'agree', '用户服务协议');
INSERT INTO `shopping_document` VALUES ('32769', '2013-09-17 23:25:05', '', '<p>\r\n	<strong>什么是实名认证？</strong>\r\n</p>\r\n<p>\r\n	“认证店铺”服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。\r\n</p>\r\n<p>\r\n	通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。\r\n</p>\r\n<p>\r\n	<strong>认证申请的方式：</strong>\r\n</p>\r\n<p>\r\n	Email：XXXX@XX.com\r\n</p>\r\n<p>\r\n	管理员：XXXXXX\r\n</p>\r\n<br />', 'realname', '什么是实名认证');
INSERT INTO `shopping_document` VALUES ('65536', '2013-09-17 23:26:20', '', '<p>\r\n	<strong>什么是实体店铺认证？</strong>\r\n</p>\r\n<p>\r\n	“认证店铺”服务是一项对店主身份真实性识别服务。店主可以通过站内PM、电话或管理员EMail的方式 联系并申请该项认证。经过管理员审核确认了店主的真实身份，就可以开通该项认证。\r\n</p>\r\n<p>\r\n	通过该认证，可以说明店主身份的真实有效性，为买家在网络交易的过程中提供一定的信心和保证。\r\n</p>\r\n<p>\r\n	<strong>认证申请的方式：</strong>\r\n</p>\r\n<p>\r\n	Email：XXXX@XX.com\r\n</p>\r\n<p>\r\n	管理员：XXXXXX\r\n</p>\r\n<br />', 'realstore', '什么是实体店铺认证');
INSERT INTO `shopping_document` VALUES ('65537', '2013-09-17 23:26:43', '', '<p>\r\n	使用本公司服务所须遵守的条款和条件。<br />\r\n<br />\r\n1.用户资格<br />\r\n本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并\r\n仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的\r\n帐户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的帐户的权利。<br />\r\n<br />\r\n2.您的资料（包括但不限于所添加的任何商品）不得：<br />\r\n*具有欺诈性、虚假、不准确或具误导性；<br />\r\n*侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；<br />\r\n*违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；<br />\r\n*有侮辱或者诽谤他人，侵害他人合法权益的内容；<br />\r\n*有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；<br />\r\n*包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；<br />\r\n<br />\r\n3.违约<br />\r\n如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：<br />\r\n(a)您违反本协议或纳入本协议的文件；<br />\r\n(b)本公司无法核证或验证您向本公司提供的任何资料；<br />\r\n(c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。<br />\r\n<br />\r\n4.责任限制<br />\r\n本\r\n公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接\r\n或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关\r\n实体对本公司用户的行为的合法性及产生的任何结果不承担责任。<br />\r\n<br />\r\n5.无代理关系<br />\r\n用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。<br />\r\n<br />\r\n6.一般规定<br />\r\n本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。\r\n</p>', 'store', '开店协议');

-- ----------------------------
-- Table structure for `shopping_dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_dynamic`;
CREATE TABLE `shopping_dynamic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `discussNum` int(11) DEFAULT '0',
  `praiseNum` int(11) DEFAULT '0',
  `turnNum` int(11) DEFAULT '0',
  `dissParent_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `turnParent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `locked` bit(1) DEFAULT b'0',
  `img_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `display` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKCCB9A00EA995E663` (`goods_id`),
  KEY `FKCCB9A00E6ABCD333` (`dissParent_id`),
  KEY `FKCCB9A00E537B6C51` (`user_id`),
  KEY `FKCCB9A00E54ED135B` (`turnParent_id`),
  KEY `FKCCB9A00EEB7ECE12` (`img_id`),
  KEY `FKCCB9A00E920D7683` (`store_id`),
  KEY `FK37F91068339519D2` (`goods_id`),
  KEY `FK37F9106832C8B201` (`img_id`),
  KEY `FK37F9106871BCE6E2` (`dissParent_id`),
  KEY `FK37F910681E208F02` (`user_id`),
  KEY `FK37F910685BED270A` (`turnParent_id`),
  KEY `FK37F910681C0CA9F2` (`store_id`),
  CONSTRAINT `FK37F910681C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK37F910681E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK37F9106832C8B201` FOREIGN KEY (`img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK37F91068339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK37F910685BED270A` FOREIGN KEY (`turnParent_id`) REFERENCES `shopping_dynamic` (`id`),
  CONSTRAINT `FK37F9106871BCE6E2` FOREIGN KEY (`dissParent_id`) REFERENCES `shopping_dynamic` (`id`),
  CONSTRAINT `FKCCB9A00E537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKCCB9A00E54ED135B` FOREIGN KEY (`turnParent_id`) REFERENCES `shopping_dynamic` (`id`),
  CONSTRAINT `FKCCB9A00E6ABCD333` FOREIGN KEY (`dissParent_id`) REFERENCES `shopping_dynamic` (`id`),
  CONSTRAINT `FKCCB9A00E920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FKCCB9A00EA995E663` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKCCB9A00EEB7ECE12` FOREIGN KEY (`img_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_evaluate`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_evaluate`;
CREATE TABLE `shopping_evaluate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `evaluate_admin_info` longtext,
  `evaluate_buyer_val` int(11) NOT NULL,
  `evaluate_info` longtext,
  `evaluate_seller_info` longtext,
  `evaluate_seller_time` datetime DEFAULT NULL,
  `evaluate_seller_val` int(11) NOT NULL,
  `evaluate_status` int(11) NOT NULL,
  `evaluate_type` varchar(255) DEFAULT NULL,
  `goods_spec` longtext,
  `evaluate_goods_id` bigint(20) DEFAULT NULL,
  `evaluate_seller_user_id` bigint(20) DEFAULT NULL,
  `evaluate_user_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `description_evaluate` decimal(12,2) DEFAULT NULL,
  `service_evaluate` decimal(12,2) DEFAULT NULL,
  `ship_evaluate` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7AC70190D56B72A8` (`evaluate_seller_user_id`),
  KEY `FK7AC701901FBBBAB8` (`evaluate_goods_id`),
  KEY `FK7AC7019067CF395C` (`evaluate_user_id`),
  KEY `FK7AC70190E66AF58D` (`of_id`),
  CONSTRAINT `FK7AC701901FBBBAB8` FOREIGN KEY (`evaluate_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK7AC7019067CF395C` FOREIGN KEY (`evaluate_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK7AC70190D56B72A8` FOREIGN KEY (`evaluate_seller_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK7AC70190E66AF58D` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_evaluate
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_express_company`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_express_company`;
CREATE TABLE `shopping_express_company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `company_mark` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_status` int(11) DEFAULT '0',
  `company_sequence` int(11) DEFAULT '0',
  `company_type` varchar(255) DEFAULT 'EXPRESS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_express_company
-- ----------------------------
INSERT INTO `shopping_express_company` VALUES ('1', '2014-08-12 11:49:16', '', 'shunfeng', '顺丰速递', '0', '0', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('2', '2014-08-12 11:51:18', '', 'shentong', '申通', '0', '1', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('3', '2014-08-12 11:52:55', '', 'tiantian', '天天快递', '0', '2', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('4', '2014-08-12 11:53:27', '', 'youzhengguonei', '包裹/平邮/挂号信', '0', '4', 'POST');
INSERT INTO `shopping_express_company` VALUES ('6', '2014-08-12 11:55:31', '', 'bangsongwuliu', '邦送物流', '0', '5', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('7', '2014-08-12 12:01:12', '', 'cces', '希伊艾斯（CCES）', '0', '6', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('8', '2014-08-12 12:01:37', '', 'coe', '中国东方（COE）', '0', '7', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('9', '2014-08-12 12:02:10', '', 'city100', '城市100', '0', '8', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('10', '2014-08-12 12:02:27', '', 'chuanxiwuliu', '传喜物流', '0', '9', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('11', '2014-08-12 12:02:46', '', 'datianwuliu', '大田物流', '0', '10', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('12', '2014-08-12 12:03:02', '', 'debangwuliu', '德邦物流', '0', '11', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('13', '2014-08-12 12:03:19', '', 'dsukuaidi', 'D速快递', '0', '12', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('14', '2014-08-12 12:03:37', '', 'disifang', '递四方', '0', '13', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('15', '2014-08-12 12:04:02', '', 'ems', 'EMS', '0', '14', 'EMS');
INSERT INTO `shopping_express_company` VALUES ('16', '2014-08-12 12:04:20', '', 'feikangda', '飞康达物流', '0', '15', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('17', '2014-08-12 12:04:36', '', 'feikuaida', '飞快达', '0', '16', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('18', '2014-08-12 12:04:53', '', 'rufengda', '凡客如风达', '0', '17', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('19', '2014-08-12 12:05:12', '', 'fengxingtianxia', '风行天下', '0', '18', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('20', '2014-08-12 12:05:26', '', 'feibaokuaidi', '飞豹快递', '0', '19', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('21', '2014-08-12 12:05:59', '', 'ganzhongnengda', '港中能达', '0', '20', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('22', '2014-08-12 12:06:21', '', 'guotongkuaidi', '国通快递', '0', '21', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('23', '2014-08-12 12:06:43', '', 'guangdongyouzhengwuliu', '广东邮政', '0', '22', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('24', '2014-08-12 12:07:07', '', 'gls', 'GLS', '0', '23', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('25', '2014-08-12 12:07:33', '', 'gongsuda', '共速达', '0', '24', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('26', '2014-08-12 12:08:05', '', 'huitongkuaidi', '汇通快运', '0', '25', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('27', '2014-08-12 12:08:31', '', 'huiqiangkuaidi', '汇强快递', '0', '26', 'EXPRESS');
INSERT INTO `shopping_express_company` VALUES ('28', '2014-08-12 12:08:51', '', 'tiandihuayu', '华宇物流', '0', '27', 'EXPRESS');

-- ----------------------------
-- Table structure for `shopping_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_favorite`;
CREATE TABLE `shopping_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `type` int(11) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAFC41E93339519D2` (`goods_id`),
  KEY `FKAFC41E931E208F02` (`user_id`),
  KEY `FKAFC41E931C0CA9F2` (`store_id`),
  CONSTRAINT `FKAFC41E931C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FKAFC41E931E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKAFC41E93339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_gold_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_gold_log`;
CREATE TABLE `shopping_gold_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gl_admin_content` longtext,
  `gl_admin_time` datetime DEFAULT NULL,
  `gl_content` longtext,
  `gl_count` int(11) NOT NULL,
  `gl_money` int(11) NOT NULL,
  `gl_payment` varchar(255) DEFAULT NULL,
  `gl_type` int(11) NOT NULL,
  `gl_admin_id` bigint(20) DEFAULT NULL,
  `gl_user_id` bigint(20) DEFAULT NULL,
  `gr_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEA8877DC9FBF00E8` (`gr_id`),
  KEY `FKEA8877DCE986EF18` (`gl_admin_id`),
  KEY `FKEA8877DC811B8DA8` (`gl_user_id`),
  CONSTRAINT `FKEA8877DC811B8DA8` FOREIGN KEY (`gl_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKEA8877DC9FBF00E8` FOREIGN KEY (`gr_id`) REFERENCES `shopping_gold_record` (`id`),
  CONSTRAINT `FKEA8877DCE986EF18` FOREIGN KEY (`gl_admin_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_gold_log
-- ----------------------------
INSERT INTO `shopping_gold_log` VALUES ('1', '2014-09-27 17:34:00', '', null, null, '线下支付', '10000', '1000', 'outline', '0', null, '1', '1');
INSERT INTO `shopping_gold_log` VALUES ('2', '2014-09-27 17:34:30', '', '管理员审核金币', '2014-09-27 17:34:30', '管理员审核金币记录', '10000', '1000', 'outline', '0', '1', '1', null);
INSERT INTO `shopping_gold_log` VALUES ('3', '2014-09-27 17:36:37', '', null, null, '线下支付', '10000', '1000', 'outline', '0', null, '32768', '2');
INSERT INTO `shopping_gold_log` VALUES ('4', '2014-09-27 17:38:09', '', '管理员审核金币', '2014-09-27 17:38:09', '管理员审核金币记录', '10000', '1000', 'outline', '0', '1', '32768', null);
INSERT INTO `shopping_gold_log` VALUES ('5', '2014-09-28 10:51:35', '', null, null, '购买买就送套餐', '60', '0', null, '-1', null, '32768', null);
INSERT INTO `shopping_gold_log` VALUES ('6', '2014-10-09 12:13:35', '', null, null, '购买组合销售套餐', '600', '0', null, '-1', null, '32768', null);
INSERT INTO `shopping_gold_log` VALUES ('7', '2014-11-12 15:51:53', '', null, null, '购买微信商城', '50', '0', null, '-1', null, '32768', null);
INSERT INTO `shopping_gold_log` VALUES ('8', '2014-11-12 16:19:45', '', null, null, '购买微信商城', '50', '0', null, '-1', null, '32768', null);
INSERT INTO `shopping_gold_log` VALUES ('9', '2014-11-29 12:06:44', '', null, null, '购买买就送套餐', '360', '0', null, '-1', null, '32768', null);
INSERT INTO `shopping_gold_log` VALUES ('10', '2015-02-28 19:28:15', '', null, null, '购买微信商城', '50', '0', null, '-1', null, '32768', null);
INSERT INTO `shopping_gold_log` VALUES ('11', '2015-03-01 12:36:02', '', null, null, '购买微信商城', '250', '0', null, '-1', null, '32768', null);

-- ----------------------------
-- Table structure for `shopping_gold_record`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_gold_record`;
CREATE TABLE `shopping_gold_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gold_admin_info` longtext,
  `gold_admin_time` datetime DEFAULT NULL,
  `gold_count` int(11) NOT NULL,
  `gold_exchange_info` longtext,
  `gold_money` int(11) NOT NULL,
  `gold_pay_status` int(11) NOT NULL,
  `gold_payment` varchar(255) DEFAULT NULL,
  `gold_sn` varchar(255) DEFAULT NULL,
  `gold_status` int(11) NOT NULL,
  `gold_admin_id` bigint(20) DEFAULT NULL,
  `gold_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE8A430B97C7135FD` (`gold_admin_id`),
  KEY `FKE8A430B94C0A5623` (`gold_user_id`),
  CONSTRAINT `FKE8A430B94C0A5623` FOREIGN KEY (`gold_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKE8A430B97C7135FD` FOREIGN KEY (`gold_admin_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_gold_record
-- ----------------------------
INSERT INTO `shopping_gold_record` VALUES ('1', '2014-09-27 17:34:00', '', '管理员审核金币', '2014-09-27 17:34:29', '10000', '兑换金币10000', '1000', '2', 'outline', 'gold201409271734001', '1', '1', '1');
INSERT INTO `shopping_gold_record` VALUES ('2', '2014-09-27 17:36:36', '', '管理员审核金币', '2014-09-27 17:38:09', '10000', '', '1000', '2', 'outline', 'gold2014092717363632768', '1', '1', '32768');

-- ----------------------------
-- Table structure for `shopping_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods`;
CREATE TABLE `shopping_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `goods_click` int(11) NOT NULL,
  `goods_details` longtext,
  `goods_fee` varchar(255) DEFAULT NULL,
  `goods_inventory` int(11) NOT NULL,
  `goods_inventory_detail` longtext,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_price` decimal(12,2) DEFAULT NULL,
  `goods_property` longtext,
  `goods_recommend` bit(1) NOT NULL,
  `goods_salenum` int(11) NOT NULL,
  `goods_seller_time` datetime DEFAULT NULL,
  `goods_serial` varchar(255) DEFAULT NULL,
  `goods_status` int(11) NOT NULL,
  `goods_transfee` int(11) NOT NULL,
  `goods_weight` decimal(12,2) DEFAULT NULL,
  `inventory_type` varchar(255) DEFAULT NULL,
  `seo_description` longtext,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `store_price` decimal(12,2) DEFAULT NULL,
  `store_recommend` bit(1) NOT NULL,
  `store_recommend_time` datetime DEFAULT NULL,
  `ztc_admin_content` longtext,
  `ztc_apply_time` datetime DEFAULT NULL,
  `ztc_begin_time` date DEFAULT NULL,
  `ztc_click_num` int(11) NOT NULL,
  `ztc_dredge_price` int(11) NOT NULL,
  `ztc_gold` int(11) NOT NULL,
  `ztc_pay_status` int(11) NOT NULL,
  `ztc_price` int(11) NOT NULL,
  `ztc_status` int(11) NOT NULL,
  `gc_id` bigint(20) DEFAULT NULL,
  `goods_brand_id` bigint(20) DEFAULT NULL,
  `goods_main_photo_id` bigint(20) DEFAULT NULL,
  `goods_store_id` bigint(20) DEFAULT NULL,
  `ztc_admin_id` bigint(20) DEFAULT NULL,
  `goods_collect` int(11) DEFAULT '0',
  `group_buy` int(11) DEFAULT '0',
  `goods_choice_type` int(11) DEFAULT '0',
  `group_id` bigint(20) DEFAULT NULL,
  `activity_status` int(11) DEFAULT '0',
  `bargain_status` int(11) DEFAULT '0',
  `delivery_status` int(11) DEFAULT '0',
  `goods_current_price` decimal(12,2) DEFAULT NULL,
  `goods_volume` decimal(12,2) DEFAULT NULL,
  `ems_trans_fee` decimal(12,2) DEFAULT NULL,
  `express_trans_fee` decimal(12,2) DEFAULT NULL,
  `mail_trans_fee` decimal(12,2) DEFAULT NULL,
  `transport_id` bigint(20) DEFAULT NULL,
  `combin_status` int(11) DEFAULT '0',
  `combin_begin_time` date DEFAULT NULL,
  `combin_end_time` date DEFAULT NULL,
  `combin_price` decimal(12,2) DEFAULT NULL,
  `description_evaluate` decimal(10,0) DEFAULT '5',
  `weixin_shop_hot` bit(1) DEFAULT b'0',
  `weixin_shop_hotTime` date DEFAULT NULL,
  `weixin_shop_recommend` bit(1) DEFAULT b'0',
  `weixin_shop_recommendTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK304F7EE5AD5743E0` (`goods_main_photo_id`),
  KEY `FK304F7EE56BDDCC57` (`gc_id`),
  KEY `FK304F7EE51ED8F14C` (`goods_store_id`),
  KEY `FK304F7EE5F140A6A4` (`goods_brand_id`),
  KEY `FK304F7EE5C292B563` (`ztc_admin_id`),
  KEY `FK304F7EE5493829C3` (`group_id`),
  KEY `FK304F7EE5914F1503` (`transport_id`),
  KEY `FK19833DBFF4A127CF` (`goods_main_photo_id`),
  KEY `FK19833DBFDD06648` (`gc_id`),
  KEY `FK19833DBFA8D824BB` (`goods_store_id`),
  KEY `FK19833DBFD898F8F2` (`transport_id`),
  KEY `FK19833DBF93334095` (`goods_brand_id`),
  KEY `FK19833DBFD3375D32` (`group_id`),
  KEY `FK19833DBF8D37D814` (`ztc_admin_id`),
  CONSTRAINT `FK19833DBF8D37D814` FOREIGN KEY (`ztc_admin_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK19833DBF93334095` FOREIGN KEY (`goods_brand_id`) REFERENCES `shopping_goodsbrand` (`id`),
  CONSTRAINT `FK19833DBFA8D824BB` FOREIGN KEY (`goods_store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK19833DBFD3375D32` FOREIGN KEY (`group_id`) REFERENCES `shopping_group` (`id`),
  CONSTRAINT `FK19833DBFD898F8F2` FOREIGN KEY (`transport_id`) REFERENCES `shopping_transport` (`id`),
  CONSTRAINT `FK19833DBFDD06648` FOREIGN KEY (`gc_id`) REFERENCES `shopping_goodsclass` (`id`),
  CONSTRAINT `FK19833DBFF4A127CF` FOREIGN KEY (`goods_main_photo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK304F7EE51ED8F14C` FOREIGN KEY (`goods_store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK304F7EE5493829C3` FOREIGN KEY (`group_id`) REFERENCES `shopping_group` (`id`),
  CONSTRAINT `FK304F7EE56BDDCC57` FOREIGN KEY (`gc_id`) REFERENCES `shopping_goodsclass` (`id`),
  CONSTRAINT `FK304F7EE5914F1503` FOREIGN KEY (`transport_id`) REFERENCES `shopping_transport` (`id`),
  CONSTRAINT `FK304F7EE5AD5743E0` FOREIGN KEY (`goods_main_photo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK304F7EE5C292B563` FOREIGN KEY (`ztc_admin_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK304F7EE5F140A6A4` FOREIGN KEY (`goods_brand_id`) REFERENCES `shopping_goodsbrand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goodsbrand`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodsbrand`;
CREATE TABLE `shopping_goodsbrand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `audit` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `recommend` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `brandLogo_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `remark` longtext,
  `userStatus` int(11) DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL,
  `weixin_shop_recommend` bit(1) DEFAULT b'0',
  `weixin_shop_recommendTime` date DEFAULT NULL,
  `first_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK380F53C292ACC22` (`category_id`),
  KEY `FK380F53C25F95F5C3` (`brandLogo_id`),
  KEY `FK380F53C2537B6C51` (`user_id`),
  KEY `FKC382CD281E208F02` (`user_id`),
  KEY `FKC382CD2813E0E513` (`category_id`),
  KEY `FKC382CD28A6DFD9B2` (`brandLogo_id`),
  CONSTRAINT `FK380F53C2537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK380F53C25F95F5C3` FOREIGN KEY (`brandLogo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK380F53C292ACC22` FOREIGN KEY (`category_id`) REFERENCES `shopping_brandcategory` (`id`),
  CONSTRAINT `FKC382CD2813E0E513` FOREIGN KEY (`category_id`) REFERENCES `shopping_brandcategory` (`id`),
  CONSTRAINT `FKC382CD281E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKC382CD28A6DFD9B2` FOREIGN KEY (`brandLogo_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodsbrand
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goodscart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodscart`;
CREATE TABLE `shopping_goodscart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `count` int(11) NOT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `spec_info` longtext,
  `goods_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `cart_type` varchar(255) DEFAULT NULL,
  `sc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6D29FF859F21119E` (`of_id`),
  KEY `FK64EC15F339519D2` (`goods_id`),
  KEY `FK64EC15F62D0D4E3` (`sc_id`),
  CONSTRAINT `FK64EC15F339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK64EC15F62D0D4E3` FOREIGN KEY (`sc_id`) REFERENCES `shopping_storecart` (`id`),
  CONSTRAINT `FK6D29FF859F21119E` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodscart
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goodsclass`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodsclass`;
CREATE TABLE `shopping_goodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `display` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `goodsType_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seo_description` longtext,
  `seo_keywords` longtext,
  `icon_sys` varchar(255) DEFAULT NULL,
  `icon_type` int(11) DEFAULT '0',
  `icon_acc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC38E2B193CA4A709` (`icon_acc_id`),
  KEY `FKC38E2B194020BFB2` (`goodsType_id`),
  KEY `FKC38E2B19835D2FBA` (`parent_id`),
  CONSTRAINT `FKC38E2B193CA4A709` FOREIGN KEY (`icon_acc_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKC38E2B194020BFB2` FOREIGN KEY (`goodsType_id`) REFERENCES `shopping_goodstype` (`id`),
  CONSTRAINT `FKC38E2B19835D2FBA` FOREIGN KEY (`parent_id`) REFERENCES `shopping_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65748 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodsclass
-- ----------------------------
INSERT INTO `shopping_goodsclass` VALUES ('69', '2013-12-24 11:19:43', '', '女性保健系列', '', '0', '', '1', null, null, '', '', '5', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('70', '2013-12-24 11:20:08', '', '缓解衰老', '', '1', '', '0', null, '69', null, null, null, '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('71', '2013-12-24 11:20:19', '', '纤体塑身', '', '1', '', '0', null, '69', null, null, null, '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('73', '2013-12-24 11:21:12', '', '调节内分泌', '', '1', '', '0', null, '69', null, null, null, '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('74', '2013-12-24 11:21:55', '', '美容养颜', '', '1', '', '0', null, '69', null, null, null, '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('95', '2013-12-24 11:28:46', '', '男性保健系列', '', '0', '', '2', null, null, '男性保健系列', '男性保健系列', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('96', '2013-12-24 11:29:20', '', '补血养血', '', '1', '', '0', null, '69', null, null, null, '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('141', '2013-12-24 11:42:06', '', '老年保健系列', '', '0', '', '3', null, null, '', '', '7', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('180', '2013-12-24 11:51:27', '', '儿童营养补充', '', '0', '', '4', null, null, '', '', '40', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('181', '2013-12-24 11:51:47', '', '基础保健系列', '', '0', '', '5', null, null, '', '', '8', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('182', '2013-12-24 11:52:13', '', '亚健康系列', '', '0', '', '6', null, null, '', '', '9', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('183', '2013-12-24 11:52:49', '', '健康食品系列', '', '0', '', '7', null, null, '', '', '13', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65564', '2015-02-08 11:53:02', '', '传统滋补系列', '', '0', '', '8', null, null, '', '', '27', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65565', '2015-02-08 11:53:17', '', '日化个护', '', '0', '', '9', null, null, '', '', '15', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65566', '2015-02-08 11:53:41', '', '母婴用品', '', '0', '', '10', null, null, '', '', '14', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65619', '2015-03-01 13:00:13', '', '汽车零配', '', '2', '', '3', null, '65619', '', '', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65680', '2018-05-19 12:53:39', '', '更年期调养', '', '1', '', '0', null, '69', '更年期调养', '更年期调养', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65681', '2018-05-19 12:54:02', '', '泌尿系统呵护', '', '1', '', '0', null, '69', '泌尿系统呵护', '泌尿系统呵护', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65682', '2018-05-19 12:58:17', '', '提升精力', '', '1', '', '0', null, '95', '提升精力', '提升精力', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65683', '2018-05-19 12:58:44', '', '缓解疲劳', '', '1', '', '0', null, '95', '缓解疲劳', '缓解疲劳', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65684', '2018-05-19 12:59:00', '', '解酒护肝', '', '1', '', '0', null, '95', '解酒护肝', '解酒护肝', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65685', '2018-05-19 12:59:22', '', '前列腺养护', '', '1', '', '0', null, '95', '前列腺养护', '前列腺养护', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65686', '2018-05-19 12:59:46', '', '强身增肌', '', '1', '', '0', null, '95', '强身增肌', '强身增肌', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65687', '2018-05-19 13:00:12', '', '清肺润肺', '', '1', '', '0', null, '95', '清肺润肺', '清肺润肺', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65688', '2018-05-19 13:04:50', '', '心脑血管', '', '1', '', '0', null, '141', '心脑血管', '心脑血管', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65689', '2018-05-19 13:05:02', '', '调节血糖', '', '1', '', '0', null, '141', '调节血糖', '调节血糖', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65690', '2018-05-19 13:05:16', '', '肠胃养护', '', '1', '', '0', null, '141', '肠胃养护', '肠胃养护', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65691', '2018-05-19 13:05:28', '', '肝肾养护', '', '1', '', '0', null, '141', '肝肾养护', '肝肾养护', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65692', '2018-05-19 13:05:43', '', '调节血脂', '', '1', '', '0', null, '141', '调节血脂', '调节血脂', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65693', '2018-05-19 13:05:56', '', '关节养护', '', '1', '', '0', null, '141', '关节养护', '关节养护', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65695', '2018-05-19 13:08:43', '', '血压调节', '', '1', '', '0', null, '141', '血压调节', '血压调节', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65696', '2018-05-19 13:26:57', '', '补充钙质', '', '1', '', '0', null, '180', '补充钙质', '补充钙质', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65697', '2018-05-19 13:27:09', '', '健脑益智', '', '1', '', '0', null, '180', '健脑益智', '健脑益智', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65698', '2018-05-19 13:27:22', '', '促进生长', '', '1', '', '0', null, '180', '促进生长', '促进生长', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65699', '2018-05-19 13:29:21', '', '蛋白质类', '', '1', '', '0', null, '181', '蛋白质类', '蛋白质类', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65700', '2018-05-19 13:29:32', '', '植物提取类', '', '1', '', '0', null, '181', '植物提取类', '植物提取类', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65701', '2018-05-19 13:29:45', '', '钙铁锌硒', '', '1', '', '0', null, '181', '钙铁锌硒', '钙铁锌硒', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65702', '2018-05-19 13:31:07', '', '改善视力', '', '1', '', '0', null, '182', '改善视力', '改善视力', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65703', '2018-05-19 13:31:19', '', '改善睡眠', '', '1', '', '0', null, '182', '改善睡眠', '改善睡眠', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65704', '2018-05-19 13:31:32', '', '缓解过敏', '', '1', '', '0', null, '182', '缓解过敏', '缓解过敏', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65705', '2018-05-19 13:31:46', '', '调节免疫力', '', '1', '', '0', null, '182', '调节免疫力', '调节免疫力', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65706', '2018-05-19 13:31:59', '', '营养补充剂', '', '1', '', '0', null, '182', '营养补充剂', '营养补充剂', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65707', '2018-05-19 13:34:26', '', '橄榄油', '', '1', '', '0', null, '183', '橄榄油', '橄榄油', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65708', '2018-05-19 13:34:43', '', '茶饮类', '', '1', '', '0', null, '183', '茶饮类', '茶饮类', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65709', '2018-05-19 13:34:54', '', '坚果类', '', '1', '', '0', null, '183', '坚果类', '坚果类', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65710', '2018-05-19 13:35:06', '', '地方特产', '', '1', '', '0', null, '183', '地方特产', '地方特产', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65711', '2018-05-19 13:35:19', '', '奶粉', '', '1', '', '0', null, '183', '奶粉', '奶粉', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65712', '2018-05-19 13:35:31', '', '果汁', '', '1', '', '0', null, '183', '果汁', '果汁', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65713', '2018-05-19 13:35:44', '', '其他食用油', '', '1', '', '0', null, '183', '其他食用油', '其他食用油', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65714', '2018-05-19 13:35:54', '', '冲调饮品', '', '1', '', '0', null, '183', '冲调饮品', '冲调饮品', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65715', '2018-05-19 13:36:04', '', '宝宝食品', '', '1', '', '0', null, '183', '宝宝食品', '宝宝食品', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65716', '2018-05-19 13:36:16', '', '水果', '', '1', '', '0', null, '183', '水果', '水果', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65717', '2018-05-19 13:36:29', '', '红酒', '', '1', '', '0', null, '183', '红酒', '红酒', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65718', '2018-05-19 13:41:46', '', '虫草', '', '1', '', '0', null, '65564', '虫草', '虫草', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65719', '2018-05-19 13:41:58', '', '阿胶', '', '1', '', '0', null, '65564', '阿胶', '阿胶', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65720', '2018-05-19 13:42:16', '', '菌类', '', '1', '', '0', null, '65564', '菌类', '菌类', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65721', '2018-05-19 13:42:29', '', '蜂产品', '', '1', '', '0', null, '65564', '蜂产品', '蜂产品', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65722', '2018-05-19 13:42:42', '', '海参', '', '1', '', '0', null, '65564', '海参', '海参', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65723', '2018-05-19 13:42:54', '', '参茸类', '', '1', '', '0', null, '65564', '参茸类', '参茸类', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65724', '2018-05-19 13:43:05', '', '其他', '', '1', '', '0', null, '65564', '其他', '其他', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65725', '2018-05-19 13:44:24', '', '眼部护理', '', '1', '', '0', null, '65565', '眼部护理', '眼部护理', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65726', '2018-05-19 13:44:36', '', 'T区护理', '', '1', '', '0', null, '65565', 'T区护理', 'T区护理', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65727', '2018-05-19 13:44:48', '', '洁面乳', '', '1', '', '0', null, '65565', '洁面乳', '洁面乳', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65728', '2018-05-19 13:44:58', '', '爽肤水', '', '1', '', '0', null, '65565', '爽肤水', '爽肤水', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65729', '2018-05-19 13:45:12', '', '精华露(霜）', '', '1', '', '0', null, '65565', '精华露(霜）', '精华露(霜）', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65730', '2018-05-19 13:45:23', '', '乳液面霜', '', '1', '', '0', null, '65565', '乳液面霜', '乳液面霜', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65731', '2018-05-19 13:45:34', '', '面膜', '', '1', '', '0', null, '65565', '面膜', '面膜', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65732', '2018-05-19 13:45:47', '', '护肤套装', '', '1', '', '0', null, '65565', '护肤套装', '护肤套装', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65733', '2018-05-19 13:45:56', '', '颈部护理', '', '1', '', '0', null, '65565', '颈部护理', '颈部护理', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65734', '2018-05-19 13:46:07', '', '洗发护发', '', '1', '', '0', null, '65565', '洗发护发', '洗发护发', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65735', '2018-05-19 13:46:17', '', '沐浴清洁', '', '1', '', '0', null, '65565', '沐浴清洁', '沐浴清洁', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65736', '2018-05-19 13:46:26', '', '身体乳', '', '1', '', '0', null, '65565', '身体乳', '身体乳', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65737', '2018-05-19 13:46:36', '', '手工皂', '', '1', '', '0', null, '65565', '手工皂', '手工皂', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65738', '2018-05-19 13:46:45', '', '香薰精油', '', '1', '', '0', null, '65565', '香薰精油', '香薰精油', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65739', '2018-05-19 13:46:59', '', '按摩霜', '', '1', '', '0', null, '65565', '按摩霜', '按摩霜', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65740', '2018-05-19 13:47:11', '', '手足护理', '', '1', '', '0', null, '65565', '手足护理', '手足护理', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65741', '2018-05-19 13:47:22', '', '脱毛膏', '', '1', '', '0', null, '65565', '脱毛膏', '脱毛膏', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65742', '2018-05-19 13:47:33', '', '牙齿美白液', '', '1', '', '0', null, '65565', '牙齿美白液', '牙齿美白液', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65743', '2018-05-19 13:47:43', '', '家庭消毒', '', '1', '', '0', null, '65565', '家庭消毒', '家庭消毒', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65744', '2018-05-19 13:47:54', '', '宝宝护肤', '', '1', '', '0', null, '65565', '宝宝护肤', '宝宝护肤', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65745', '2018-05-19 13:48:04', '', '清洁用品', '', '1', '', '0', null, '65565', '清洁用品', '清洁用品', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65746', '2018-05-19 13:48:16', '', '牙膏牙粉', '', '1', '', '0', null, '65565', '牙膏牙粉', '牙膏牙粉', '', '0', null);
INSERT INTO `shopping_goodsclass` VALUES ('65747', '2018-05-19 13:48:29', '', '纸尿裤', '', '1', '', '0', null, '65566', '纸尿裤', '纸尿裤', '', '0', null);

-- ----------------------------
-- Table structure for `shopping_goodsclassstaple`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodsclassstaple`;
CREATE TABLE `shopping_goodsclassstaple` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gc_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK335B1F3C6BDDCC57` (`gc_id`),
  KEY `FK335B1F3C920D7683` (`store_id`),
  KEY `FK24B7422DD06648` (`gc_id`),
  KEY `FK24B74221C0CA9F2` (`store_id`),
  CONSTRAINT `FK24B74221C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK24B7422DD06648` FOREIGN KEY (`gc_id`) REFERENCES `shopping_goodsclass` (`id`),
  CONSTRAINT `FK335B1F3C6BDDCC57` FOREIGN KEY (`gc_id`) REFERENCES `shopping_goodsclass` (`id`),
  CONSTRAINT `FK335B1F3C920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodsclassstaple
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goodsrecommend`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodsrecommend`;
CREATE TABLE `shopping_goodsrecommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `browseNum` int(11) NOT NULL,
  `code` longtext,
  `goodsNum` int(11) NOT NULL,
  `imageHeight` int(11) NOT NULL,
  `imageWidth` int(11) NOT NULL,
  `remarkInfo` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `showNum` int(11) NOT NULL,
  `styleName` varchar(255) DEFAULT NULL,
  `typeName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodsrecommend
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goodsspecification`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodsspecification`;
CREATE TABLE `shopping_goodsspecification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32769 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodsspecification
-- ----------------------------
INSERT INTO `shopping_goodsspecification` VALUES ('1', '2013-12-24 08:57:34', '', '鞋码', '0', 'text');
INSERT INTO `shopping_goodsspecification` VALUES ('2', '2013-12-24 08:59:56', '', '尺码', '1', 'text');
INSERT INTO `shopping_goodsspecification` VALUES ('32768', '2013-12-24 09:41:36', '', '颜色', '3', 'img');

-- ----------------------------
-- Table structure for `shopping_goodsspecproperty`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodsspecproperty`;
CREATE TABLE `shopping_goodsspecproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `specImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1F5139F54F314235` (`specImage_id`),
  KEY `FK1F5139F574A287A3` (`spec_id`),
  KEY `FK2E6B81CF967B2624` (`specImage_id`),
  KEY `FK2E6B81CF7F58A094` (`spec_id`),
  CONSTRAINT `FK1F5139F54F314235` FOREIGN KEY (`specImage_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK1F5139F574A287A3` FOREIGN KEY (`spec_id`) REFERENCES `shopping_goodsspecification` (`id`),
  CONSTRAINT `FK2E6B81CF7F58A094` FOREIGN KEY (`spec_id`) REFERENCES `shopping_goodsspecification` (`id`),
  CONSTRAINT `FK2E6B81CF967B2624` FOREIGN KEY (`specImage_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32775 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodsspecproperty
-- ----------------------------
INSERT INTO `shopping_goodsspecproperty` VALUES ('1', '2013-12-24 08:57:34', '', '1', '35', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('2', '2013-12-24 08:57:34', '', '2', '36', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('3', '2013-12-24 08:57:34', '', '3', '37', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('4', '2013-12-24 08:57:34', '', '4', '38', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('5', '2013-12-24 08:57:34', '', '5', '39', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('6', '2013-12-24 08:57:34', '', '6', '40', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('7', '2013-12-24 08:57:34', '', '7', '41', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('8', '2013-12-24 08:57:34', '', '8', '42', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('9', '2013-12-24 08:57:34', '', '9', '43', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('10', '2013-12-24 08:57:35', '', '10', '44', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('11', '2013-12-24 08:57:35', '', '11', '45', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('12', '2013-12-24 08:57:35', '', '12', '47', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('13', '2013-12-24 08:57:35', '', '13', '特号', '1', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('14', '2013-12-24 08:59:56', '', '1', '均码', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('15', '2013-12-24 08:59:56', '', '2', 'XXS', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('16', '2013-12-24 08:59:56', '', '3', 'XS', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('17', '2013-12-24 08:59:56', '', '4', 'S', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('18', '2013-12-24 08:59:56', '', '5', 'M', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('19', '2013-12-24 08:59:56', '', '6', 'L', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('20', '2013-12-24 08:59:56', '', '7', 'XL', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('21', '2013-12-24 08:59:56', '', '8', 'XXL', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('22', '2013-12-24 08:59:56', '', '9', 'XXXL', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('23', '2013-12-24 08:59:56', '', '10', '特体', '2', null);
INSERT INTO `shopping_goodsspecproperty` VALUES ('32768', '2013-12-24 09:43:19', '', '0', '白色', '32768', '32768');
INSERT INTO `shopping_goodsspecproperty` VALUES ('32769', '2013-12-24 09:43:19', '', '1', '黑色', '32768', '32769');
INSERT INTO `shopping_goodsspecproperty` VALUES ('32770', '2013-12-24 09:43:19', '', '2', '红色', '32768', '32770');
INSERT INTO `shopping_goodsspecproperty` VALUES ('32771', '2013-12-24 09:43:19', '', '3', '紫色', '32768', '32771');
INSERT INTO `shopping_goodsspecproperty` VALUES ('32772', '2013-12-24 09:43:19', '', '4', '桔色', '32768', '32772');
INSERT INTO `shopping_goodsspecproperty` VALUES ('32773', '2013-12-24 09:43:19', '', '5', '蓝色', '32768', '32773');
INSERT INTO `shopping_goodsspecproperty` VALUES ('32774', '2013-12-24 09:43:19', '', '6', '透明', '32768', '32774');

-- ----------------------------
-- Table structure for `shopping_goodstype`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodstype`;
CREATE TABLE `shopping_goodstype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodstype
-- ----------------------------
INSERT INTO `shopping_goodstype` VALUES ('1', '2013-12-24 10:17:33', '', '服装', '0');
INSERT INTO `shopping_goodstype` VALUES ('2', '2013-12-24 10:18:13', '', '鞋号', '1');

-- ----------------------------
-- Table structure for `shopping_goodstypeproperty`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodstypeproperty`;
CREATE TABLE `shopping_goodstypeproperty` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `display` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `goodsType_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKABDE274F8D6DBC3` (`goodsType_id`),
  KEY `FK19D82A4E4020BFB2` (`goodsType_id`),
  CONSTRAINT `FK19D82A4E4020BFB2` FOREIGN KEY (`goodsType_id`) REFERENCES `shopping_goodstype` (`id`),
  CONSTRAINT `FKABDE274F8D6DBC3` FOREIGN KEY (`goodsType_id`) REFERENCES `shopping_goodstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodstypeproperty
-- ----------------------------
INSERT INTO `shopping_goodstypeproperty` VALUES ('1', '2014-08-27 14:13:57', '', '', '款式', '1', '长袖,短袖,七分/五分袖,无袖,两件套,宽松', '1');
INSERT INTO `shopping_goodstypeproperty` VALUES ('2', '2014-08-27 14:13:57', '', '', '材质', '2', '纯棉,真丝,聚酯,棉+氨伦,氨伦（卡莱）,人造棉,其他', '1');
INSERT INTO `shopping_goodstypeproperty` VALUES ('3', '2014-08-27 14:13:57', '', '', '衣长', '3', '短款（衣长35-50CM）,中长款（衣长50-70CM）,长款（衣长70-100CM）', '1');

-- ----------------------------
-- Table structure for `shopping_goodstype_brand`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodstype_brand`;
CREATE TABLE `shopping_goodstype_brand` (
  `type_id` bigint(20) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  KEY `FKA5ABC541667C5CC` (`brand_id`),
  KEY `FKA5ABC54117C323C8` (`type_id`),
  CONSTRAINT `FKA5ABC54117C323C8` FOREIGN KEY (`type_id`) REFERENCES `shopping_goodstype` (`id`),
  CONSTRAINT `FKA5ABC541667C5CC` FOREIGN KEY (`brand_id`) REFERENCES `shopping_goodsbrand` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodstype_brand
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goodstype_spec`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goodstype_spec`;
CREATE TABLE `shopping_goodstype_spec` (
  `type_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  KEY `FK82E5085B74A287A3` (`spec_id`),
  KEY `FK82E5085BD0793FD9` (`type_id`),
  KEY `FKCB915EC17F58A094` (`spec_id`),
  KEY `FKCB915EC117C323C8` (`type_id`),
  CONSTRAINT `FK82E5085B74A287A3` FOREIGN KEY (`spec_id`) REFERENCES `shopping_goodsspecification` (`id`),
  CONSTRAINT `FK82E5085BD0793FD9` FOREIGN KEY (`type_id`) REFERENCES `shopping_goodstype` (`id`),
  CONSTRAINT `FKCB915EC117C323C8` FOREIGN KEY (`type_id`) REFERENCES `shopping_goodstype` (`id`),
  CONSTRAINT `FKCB915EC17F58A094` FOREIGN KEY (`spec_id`) REFERENCES `shopping_goodsspecification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goodstype_spec
-- ----------------------------
INSERT INTO `shopping_goodstype_spec` VALUES ('2', '1');
INSERT INTO `shopping_goodstype_spec` VALUES ('2', '32768');
INSERT INTO `shopping_goodstype_spec` VALUES ('1', '2');
INSERT INTO `shopping_goodstype_spec` VALUES ('1', '32768');

-- ----------------------------
-- Table structure for `shopping_goods_combin`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_combin`;
CREATE TABLE `shopping_goods_combin` (
  `shopping_goods_id` bigint(20) NOT NULL,
  `combin_goods_id` bigint(20) NOT NULL,
  KEY `FK367D9A66A4B76EC9` (`shopping_goods_id`),
  KEY `FK367D9A667125CE0B` (`combin_goods_id`),
  CONSTRAINT `FK367D9A667125CE0B` FOREIGN KEY (`combin_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK367D9A66A4B76EC9` FOREIGN KEY (`shopping_goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_combin
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goods_floor`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_floor`;
CREATE TABLE `shopping_goods_floor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gf_css` varchar(255) DEFAULT NULL,
  `gf_display` bit(1) NOT NULL,
  `gf_goods_count` int(11) NOT NULL,
  `gf_level` int(11) NOT NULL,
  `gf_name` varchar(255) DEFAULT NULL,
  `gf_sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `gf_gc_goods` longtext,
  `gf_gc_list` longtext,
  `gf_left_adv` longtext,
  `gf_list_goods` longtext,
  `gf_right_adv` longtext,
  `gf_brand_list` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA714398C8387AA4E` (`parent_id`),
  CONSTRAINT `FKA714398C8387AA4E` FOREIGN KEY (`parent_id`) REFERENCES `shopping_goods_floor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131082 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_floor
-- ----------------------------
INSERT INTO `shopping_goods_floor` VALUES ('2', '2014-02-22 21:44:30', '', 'floor_orange', '', '0', '0', '流行服饰', '0', null, null, '[{\"gc_id6\":\"10\",\"gc_count\":6,\"gc_id1\":\"8\",\"pid\":\"2\",\"gc_id4\":\"6\",\"gc_id5\":\"9\",\"gc_id2\":\"5\",\"gc_id3\":\"7\"}, {\"gc_id6\":\"18\",\"gc_count\":6,\"gc_id1\":\"13\",\"pid\":\"3\",\"gc_id4\":\"16\",\"gc_id5\":\"17\",\"gc_id2\":\"14\",\"gc_id3\":\"15\"}, {\"gc_id6\":\"20\",\"gc_count\":6,\"gc_id1\":\"19\",\"pid\":\"4\",\"gc_id4\":\"23\",\"gc_id5\":\"24\",\"gc_id2\":\"21\",\"gc_id3\":\"22\"}]', '{\"acc_url\":\"\",\"adv_id\":\"2\",\"acc_id\":\"\"}', '{\"goods_id4\":\"98308\",\"goods_id5\":\"65539\",\"goods_id3\":\"98307\",\"goods_id2\":\"65538\",\"goods_id1\":\"65537\",\"list_title\":\"商品排行\"}', '{\"acc_url\":\"#\",\"adv_id\":\"\",\"acc_id\":327682}', '{\"brand_id9\":\"4\",\"brand_id8\":\"7\",\"brand_id7\":\"3\",\"brand_id6\":\"2\",\"brand_id5\":\"1\",\"brand_id4\":\"6\",\"brand_id3\":\"5\",\"brand_id1\":\"8\",\"brand_id2\":\"9\"}');
INSERT INTO `shopping_goods_floor` VALUES ('32768', '2014-02-22 22:08:01', '', '', '', '0', '1', '男装', '0', '2', '{\"goods_id6\":\"8\",\"goods_id7\":\"4\",\"goods_id4\":\"3\",\"goods_id5\":\"32768\",\"goods_id8\":\"7\",\"goods_id9\":\"6\",\"goods_id3\":\"32769\",\"goods_id2\":\"9\",\"goods_id10\":\"5\",\"goods_id1\":\"1\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('65536', '2014-02-22 22:21:30', '', '', '', '0', '1', '女装', '1', '2', '{\"goods_id6\":\"98304\",\"goods_id7\":\"65536\",\"goods_id4\":\"98307\",\"goods_id5\":\"98305\",\"goods_id8\":\"65537\",\"goods_id9\":\"65540\",\"goods_id3\":\"98306\",\"goods_id2\":\"65538\",\"goods_id10\":\"65539\",\"goods_id1\":\"98308\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('98304', '2014-02-25 11:33:09', '', 'floor_blue', '', '0', '0', '家电数码', '2', null, null, '[{\"gc_count\":4,\"gc_id1\":\"75\",\"pid\":\"70\",\"gc_id4\":\"78\",\"gc_id2\":\"76\",\"gc_id3\":\"77\"}, {\"gc_id6\":\"87\",\"gc_id7\":\"88\",\"gc_count\":7,\"gc_id1\":\"65542\",\"pid\":\"73\",\"gc_id4\":\"85\",\"gc_id5\":\"86\",\"gc_id2\":\"83\",\"gc_id3\":\"84\"}, {\"gc_id6\":\"94\",\"gc_count\":6,\"gc_id1\":\"89\",\"pid\":\"74\",\"gc_id4\":\"92\",\"gc_id5\":\"93\",\"gc_id2\":\"90\",\"gc_id3\":\"91\"}]', '{\"acc_url\":\"\",\"adv_id\":\"32770\",\"acc_id\":\"\"}', '{\"goods_id6\":\"98451\",\"goods_id4\":\"98448\",\"goods_id5\":\"98447\",\"goods_id3\":\"98449\",\"goods_id2\":\"98456\",\"goods_id1\":\"98454\",\"list_title\":\"商品排行\"}', '{\"acc_url\":\"#\",\"adv_id\":\"\",\"acc_id\":360449}', '{\"brand_id9\":\"11\",\"brand_id8\":\"8\",\"brand_id7\":\"7\",\"brand_id6\":\"5\",\"brand_id5\":\"6\",\"brand_id4\":\"2\",\"brand_id3\":\"3\",\"brand_id1\":\"14\",\"brand_id2\":\"13\"}');
INSERT INTO `shopping_goods_floor` VALUES ('131072', '2014-02-25 17:49:51', '', '', '', '0', '1', '手机', '0', '98304', '{\"goods_id6\":\"98409\",\"goods_id7\":\"98401\",\"goods_id4\":\"98413\",\"goods_id5\":\"98411\",\"goods_id8\":\"98403\",\"goods_id9\":\"98407\",\"goods_id3\":\"98414\",\"goods_id2\":\"98415\",\"goods_id10\":\"98405\",\"goods_id1\":\"98416\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('131073', '2014-02-25 17:51:17', '', 'floor_green', '', '0', '0', '鞋包配饰', '1', null, null, '[{\"gc_count\":4,\"gc_id1\":\"31\",\"pid\":\"27\",\"gc_id4\":\"30\",\"gc_id2\":\"32\",\"gc_id3\":\"33\"}, {\"gc_count\":5,\"gc_id1\":\"40\",\"pid\":\"28\",\"gc_id4\":\"43\",\"gc_id5\":\"44\",\"gc_id2\":\"41\",\"gc_id3\":\"42\"}, {\"gc_id8\":\"49\",\"gc_id6\":\"47\",\"gc_id7\":\"48\",\"gc_count\":8,\"gc_id1\":\"65536\",\"pid\":\"29\",\"gc_id4\":\"45\",\"gc_id5\":\"46\",\"gc_id2\":\"65537\",\"gc_id3\":\"65538\"}]', '{\"acc_url\":\"\",\"adv_id\":\"32769\",\"acc_id\":\"\"}', '{\"goods_id6\":\"98382\",\"goods_id4\":\"98391\",\"goods_id5\":\"98410\",\"goods_id3\":\"98406\",\"goods_id2\":\"98408\",\"goods_id1\":\"98402\",\"list_title\":\"商品排行\"}', '{\"acc_url\":\"#\",\"adv_id\":\"\",\"acc_id\":360448}', '{\"brand_id9\":\"1\",\"brand_id8\":\"2\",\"brand_id7\":\"4\",\"brand_id6\":\"3\",\"brand_id5\":\"10\",\"brand_id4\":\"9\",\"brand_id3\":\"5\",\"brand_id1\":\"6\",\"brand_id2\":\"7\"}');
INSERT INTO `shopping_goods_floor` VALUES ('131074', '2014-02-25 17:53:41', '', null, '', '0', '1', '男鞋', '0', '131073', '{\"goods_id6\":\"98326\",\"goods_id7\":\"98325\",\"goods_id4\":\"98329\",\"goods_id5\":\"98328\",\"goods_id8\":\"98322\",\"goods_id9\":\"98320\",\"goods_id3\":\"98331\",\"goods_id2\":\"98333\",\"goods_id10\":\"98319\",\"goods_id1\":\"98408\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('131075', '2014-02-25 17:57:12', '', null, '', '0', '1', '女鞋', '1', '131073', '{\"goods_id6\":\"98341\",\"goods_id7\":\"98337\",\"goods_id4\":\"98346\",\"goods_id5\":\"98335\",\"goods_id8\":\"98340\",\"goods_id9\":\"98357\",\"goods_id3\":\"98359\",\"goods_id2\":\"98360\",\"goods_id10\":\"98344\",\"goods_id1\":\"98361\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('131076', '2014-02-25 17:57:30', '', null, '', '0', '1', '数码', '1', '98304', '{\"goods_id6\":\"98442\",\"goods_id7\":\"98441\",\"goods_id4\":\"98444\",\"goods_id5\":\"98443\",\"goods_id8\":\"98440\",\"goods_id9\":\"98439\",\"goods_id3\":\"98445\",\"goods_id2\":\"98446\",\"goods_id10\":\"98428\",\"goods_id1\":\"98447\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('131077', '2014-02-25 18:02:45', '', null, '', '0', '1', '其他', '2', '98304', '{\"goods_id6\":\"98428\",\"goods_id7\":\"98409\",\"goods_id4\":\"98424\",\"goods_id5\":\"98422\",\"goods_id8\":\"98417\",\"goods_id9\":\"98438\",\"goods_id3\":\"98436\",\"goods_id2\":\"98454\",\"goods_id10\":\"98437\",\"goods_id1\":\"98448\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('131078', '2014-02-25 18:07:11', '', 'floor_purple', '', '0', '0', '运动户外', '3', null, null, '[{\"gc_count\":3,\"gc_id1\":\"54\",\"pid\":\"51\",\"gc_id2\":\"55\",\"gc_id3\":\"56\"}, {\"gc_id8\":\"63\",\"gc_id6\":\"61\",\"gc_id7\":\"62\",\"gc_count\":8,\"gc_id1\":\"65539\",\"pid\":\"52\",\"gc_id4\":\"59\",\"gc_id5\":\"60\",\"gc_id2\":\"57\",\"gc_id3\":\"58\"}, {\"gc_id6\":\"68\",\"gc_count\":6,\"gc_id1\":\"65540\",\"pid\":\"53\",\"gc_id4\":\"66\",\"gc_id5\":\"67\",\"gc_id2\":\"65541\",\"gc_id3\":\"64\"}]', '{\"acc_url\":\"\",\"adv_id\":\"32770\",\"acc_id\":\"\"}', '{\"goods_id6\":\"98393\",\"goods_id4\":\"98400\",\"goods_id5\":\"98383\",\"goods_id3\":\"98397\",\"goods_id2\":\"98395\",\"goods_id1\":\"98374\",\"list_title\":\"商品排行\"}', '{\"acc_url\":\"#\",\"adv_id\":\"\",\"acc_id\":360450}', '{\"brand_id9\":\"6\",\"brand_id8\":\"1\",\"brand_id7\":\"5\",\"brand_id6\":\"2\",\"brand_id5\":\"7\",\"brand_id10\":\"14\",\"brand_id4\":\"3\",\"brand_id11\":\"13\",\"brand_id3\":\"4\",\"brand_id1\":\"10\",\"brand_id2\":\"8\"}');
INSERT INTO `shopping_goods_floor` VALUES ('131079', '2014-02-25 18:07:32', '', null, '', '0', '1', '鞋服', '0', '131078', '{\"goods_id6\":\"98345\",\"goods_id7\":\"98347\",\"goods_id4\":\"98352\",\"goods_id5\":\"98351\",\"goods_id8\":\"98348\",\"goods_id9\":\"98375\",\"goods_id3\":\"98353\",\"goods_id2\":\"98354\",\"goods_id10\":\"98322\",\"goods_id1\":\"98355\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('131080', '2014-02-25 18:07:40', '', '', '', '0', '1', '装备', '1', '131078', '{\"goods_id6\":\"98358\",\"goods_id7\":\"98363\",\"goods_id4\":\"98366\",\"goods_id5\":\"98362\",\"goods_id8\":\"98369\",\"goods_id9\":\"98365\",\"goods_id3\":\"98368\",\"goods_id2\":\"98364\",\"goods_id10\":\"98371\",\"goods_id1\":\"98374\"}', null, null, null, null, null);
INSERT INTO `shopping_goods_floor` VALUES ('131081', '2014-02-25 18:07:49', '', '', '', '0', '1', '杂项', '2', '131078', '{\"goods_id6\":\"98388\",\"goods_id7\":\"98385\",\"goods_id4\":\"98393\",\"goods_id5\":\"98390\",\"goods_id8\":\"98383\",\"goods_id9\":\"98379\",\"goods_id3\":\"98395\",\"goods_id2\":\"98397\",\"goods_id10\":\"98376\",\"goods_id1\":\"98400\"}', null, null, null, null, null);

-- ----------------------------
-- Table structure for `shopping_goods_photo`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_photo`;
CREATE TABLE `shopping_goods_photo` (
  `goods_id` bigint(20) NOT NULL,
  `photo_id` bigint(20) NOT NULL,
  KEY `FKA79F53B2339519D2` (`goods_id`),
  KEY `FKA79F53B22D77C132` (`photo_id`),
  CONSTRAINT `FKA79F53B22D77C132` FOREIGN KEY (`photo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKA79F53B2339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_photo
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goods_return`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_return`;
CREATE TABLE `shopping_goods_return` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `return_id` varchar(255) DEFAULT NULL,
  `return_info` longtext,
  `of_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD3121FCA537B6C51` (`user_id`),
  KEY `FKD3121FCA9F21119E` (`of_id`),
  KEY `FK4F8CD7B01E208F02` (`user_id`),
  KEY `FK4F8CD7B0E66AF58D` (`of_id`),
  CONSTRAINT `FK4F8CD7B01E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK4F8CD7B0E66AF58D` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`),
  CONSTRAINT `FKD3121FCA537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKD3121FCA9F21119E` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_return
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goods_returnitem`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_returnitem`;
CREATE TABLE `shopping_goods_returnitem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `count` int(11) NOT NULL,
  `spec_info` longtext,
  `goods_id` bigint(20) DEFAULT NULL,
  `gr_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA3AA5DD79982ABE` (`gr_id`),
  KEY `FKBA3AA5DDA995E663` (`goods_id`),
  KEY `FK892AFAC315F8CEED` (`gr_id`),
  KEY `FK892AFAC3339519D2` (`goods_id`),
  CONSTRAINT `FK892AFAC315F8CEED` FOREIGN KEY (`gr_id`) REFERENCES `shopping_goods_return` (`id`),
  CONSTRAINT `FK892AFAC3339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKBA3AA5DD79982ABE` FOREIGN KEY (`gr_id`) REFERENCES `shopping_goods_return` (`id`),
  CONSTRAINT `FKBA3AA5DDA995E663` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_returnitem
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goods_returnlog`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_returnlog`;
CREATE TABLE `shopping_goods_returnlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gr_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `return_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8A22F73A79982ABE` (`gr_id`),
  KEY `FK8A22F73A95A12042` (`return_user_id`),
  KEY `FK8A22F73A9F21119E` (`of_id`),
  KEY `FK57016D9415F8CEED` (`gr_id`),
  KEY `FK57016D94604642F3` (`return_user_id`),
  KEY `FK57016D94E66AF58D` (`of_id`),
  CONSTRAINT `FK57016D9415F8CEED` FOREIGN KEY (`gr_id`) REFERENCES `shopping_goods_return` (`id`),
  CONSTRAINT `FK57016D94604642F3` FOREIGN KEY (`return_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK57016D94E66AF58D` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`),
  CONSTRAINT `FK8A22F73A79982ABE` FOREIGN KEY (`gr_id`) REFERENCES `shopping_goods_return` (`id`),
  CONSTRAINT `FK8A22F73A95A12042` FOREIGN KEY (`return_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK8A22F73A9F21119E` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_returnlog
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goods_spec`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_spec`;
CREATE TABLE `shopping_goods_spec` (
  `goods_id` bigint(20) NOT NULL,
  `spec_id` bigint(20) NOT NULL,
  KEY `FKC359323B339519D2` (`goods_id`),
  KEY `FKC359323B188F11D` (`spec_id`),
  CONSTRAINT `FKC359323B188F11D` FOREIGN KEY (`spec_id`) REFERENCES `shopping_goodsspecproperty` (`id`),
  CONSTRAINT `FKC359323B339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_spec
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_goods_ugc`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_goods_ugc`;
CREATE TABLE `shopping_goods_ugc` (
  `goods_id` bigint(20) NOT NULL,
  `class_id` bigint(20) NOT NULL,
  KEY `FK64D399181752657` (`class_id`),
  KEY `FK64D3991339519D2` (`goods_id`),
  CONSTRAINT `FK64D3991339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK64D399181752657` FOREIGN KEY (`class_id`) REFERENCES `shopping_usergoodsclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_goods_ugc
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_group`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_group`;
CREATE TABLE `shopping_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `joinEndTime` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_group
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_group_area`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_group_area`;
CREATE TABLE `shopping_group_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ga_level` int(11) NOT NULL,
  `ga_name` varchar(255) DEFAULT NULL,
  `ga_sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKFE49BD841A75D854` (`parent_id`),
  CONSTRAINT `FKFE49BD841A75D854` FOREIGN KEY (`parent_id`) REFERENCES `shopping_group_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_group_area
-- ----------------------------
INSERT INTO `shopping_group_area` VALUES ('1', '2014-02-26 11:42:46', '', '0', '沈阳', '0', null);
INSERT INTO `shopping_group_area` VALUES ('2', '2014-02-26 11:42:55', '', '0', '北京', '1', null);
INSERT INTO `shopping_group_area` VALUES ('3', '2014-02-26 11:43:04', '', '0', '重庆', '2', null);
INSERT INTO `shopping_group_area` VALUES ('4', '2014-02-26 11:43:11', '', '0', '成都', '2', null);
INSERT INTO `shopping_group_area` VALUES ('5', '2014-02-26 11:43:20', '', '0', '武汉', '4', null);
INSERT INTO `shopping_group_area` VALUES ('6', '2014-02-26 11:43:43', '', '0', '上海', '5', null);
INSERT INTO `shopping_group_area` VALUES ('7', '2014-02-26 11:43:52', '', '0', '哈尔滨', '6', null);

-- ----------------------------
-- Table structure for `shopping_group_class`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_group_class`;
CREATE TABLE `shopping_group_class` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gc_level` int(11) NOT NULL,
  `gc_name` varchar(255) DEFAULT NULL,
  `gc_sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE80BA8071C634840` (`parent_id`),
  KEY `FKCB075B61BE55E231` (`parent_id`),
  CONSTRAINT `FKCB075B61BE55E231` FOREIGN KEY (`parent_id`) REFERENCES `shopping_group_class` (`id`),
  CONSTRAINT `FKE80BA8071C634840` FOREIGN KEY (`parent_id`) REFERENCES `shopping_group_class` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_group_class
-- ----------------------------
INSERT INTO `shopping_group_class` VALUES ('1', '2014-02-26 11:41:17', '', '0', '手机数码', '0', null);
INSERT INTO `shopping_group_class` VALUES ('2', '2014-02-26 11:41:34', '', '0', '流行服饰', '1', null);
INSERT INTO `shopping_group_class` VALUES ('3', '2014-02-26 11:42:06', '', '0', '美食天下', '2', null);
INSERT INTO `shopping_group_class` VALUES ('4', '2014-02-26 11:42:23', '', '0', '最新电影', '3', null);

-- ----------------------------
-- Table structure for `shopping_group_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_group_goods`;
CREATE TABLE `shopping_group_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gg_audit_time` datetime DEFAULT NULL,
  `gg_content` longtext,
  `gg_count` int(11) NOT NULL,
  `gg_def_count` int(11) NOT NULL,
  `gg_group_count` int(11) NOT NULL,
  `gg_max_count` int(11) NOT NULL,
  `gg_min_count` int(11) NOT NULL,
  `gg_name` varchar(255) DEFAULT NULL,
  `gg_price` decimal(12,2) DEFAULT NULL,
  `gg_rebate` decimal(12,2) DEFAULT NULL,
  `gg_recommend` int(11) NOT NULL,
  `gg_recommend_time` datetime DEFAULT NULL,
  `gg_status` int(11) NOT NULL,
  `gg_vir_count` int(11) NOT NULL,
  `gg_ga_id` bigint(20) DEFAULT NULL,
  `gg_gc_id` bigint(20) DEFAULT NULL,
  `gg_goods_id` bigint(20) DEFAULT NULL,
  `gg_img_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `weixin_shop_recommend` bit(1) DEFAULT b'0',
  `weixin_shop_recommendTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKE84595E5108251` (`gg_img_id`),
  KEY `FKE84595E55D2DC6AF` (`gg_gc_id`),
  KEY `FKE84595E5493829C3` (`group_id`),
  KEY `FKE84595E5E08B86E2` (`gg_goods_id`),
  KEY `FKE84595E513F58A16` (`gg_ga_id`),
  KEY `FKCB41493F475A6640` (`gg_img_id`),
  KEY `FKCB41493FFF2060A0` (`gg_gc_id`),
  KEY `FKCB41493FD3375D32` (`group_id`),
  KEY `FKCB41493F6A8ABA51` (`gg_goods_id`),
  KEY `FKCB41493F5B3F6E05` (`gg_ga_id`),
  CONSTRAINT `FKCB41493F475A6640` FOREIGN KEY (`gg_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKCB41493F5B3F6E05` FOREIGN KEY (`gg_ga_id`) REFERENCES `shopping_group_area` (`id`),
  CONSTRAINT `FKCB41493F6A8ABA51` FOREIGN KEY (`gg_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKCB41493FD3375D32` FOREIGN KEY (`group_id`) REFERENCES `shopping_group` (`id`),
  CONSTRAINT `FKCB41493FFF2060A0` FOREIGN KEY (`gg_gc_id`) REFERENCES `shopping_group_class` (`id`),
  CONSTRAINT `FKE84595E5108251` FOREIGN KEY (`gg_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKE84595E513F58A16` FOREIGN KEY (`gg_ga_id`) REFERENCES `shopping_group_area` (`id`),
  CONSTRAINT `FKE84595E5493829C3` FOREIGN KEY (`group_id`) REFERENCES `shopping_group` (`id`),
  CONSTRAINT `FKE84595E55D2DC6AF` FOREIGN KEY (`gg_gc_id`) REFERENCES `shopping_group_class` (`id`),
  CONSTRAINT `FKE84595E5E08B86E2` FOREIGN KEY (`gg_goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_group_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_group_price_range`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_group_price_range`;
CREATE TABLE `shopping_group_price_range` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `gpr_begin` int(11) NOT NULL,
  `gpr_end` int(11) NOT NULL,
  `gpr_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_group_price_range
-- ----------------------------
INSERT INTO `shopping_group_price_range` VALUES ('1', '2014-02-26 11:45:27', '', '0', '100', '100元以下');
INSERT INTO `shopping_group_price_range` VALUES ('2', '2014-02-26 11:45:40', '', '101', '500', '101元-500元');
INSERT INTO `shopping_group_price_range` VALUES ('3', '2014-02-26 11:45:58', '', '501', '1000', '501元-1000元');
INSERT INTO `shopping_group_price_range` VALUES ('4', '2014-02-26 11:46:13', '', '1001', '3000', '1001元-3000元');
INSERT INTO `shopping_group_price_range` VALUES ('5', '2014-02-26 11:46:27', '', '3001', '8000', '3001元-8000元');

-- ----------------------------
-- Table structure for `shopping_homepage`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_homepage`;
CREATE TABLE `shopping_homepage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK578589FFBF621C69` (`owner_id`),
  KEY `FK543424E58A073F1A` (`owner_id`),
  CONSTRAINT `FK543424E58A073F1A` FOREIGN KEY (`owner_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK578589FFBF621C69` FOREIGN KEY (`owner_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_homepage
-- ----------------------------
INSERT INTO `shopping_homepage` VALUES ('1', '2014-08-15 11:00:37', '', '1');
INSERT INTO `shopping_homepage` VALUES ('3', '2014-08-27 09:54:10', '', '1');
INSERT INTO `shopping_homepage` VALUES ('4', '2014-08-27 09:56:33', '', '1');
INSERT INTO `shopping_homepage` VALUES ('5', '2014-08-27 09:58:15', '', '1');
INSERT INTO `shopping_homepage` VALUES ('6', '2014-08-27 09:59:12', '', '1');
INSERT INTO `shopping_homepage` VALUES ('7', '2014-08-29 13:03:45', '', '32768');

-- ----------------------------
-- Table structure for `shopping_homepage_goodsclass`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_homepage_goodsclass`;
CREATE TABLE `shopping_homepage_goodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `gc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKF301D77CDD06648` (`gc_id`),
  KEY `FKF301D77C1E208F02` (`user_id`),
  CONSTRAINT `FKF301D77C1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF301D77CDD06648` FOREIGN KEY (`gc_id`) REFERENCES `shopping_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_homepage_goodsclass
-- ----------------------------
INSERT INTO `shopping_homepage_goodsclass` VALUES ('1', '2014-10-10 16:44:25', '', '1', null);

-- ----------------------------
-- Table structure for `shopping_homepage_goodsclass_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_homepage_goodsclass_log`;
CREATE TABLE `shopping_homepage_goodsclass_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `goodsClass_id` bigint(20) DEFAULT NULL,
  `homepageGoodsClass_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAD270FA765403E11` (`homepageGoodsClass_id`),
  KEY `FKAD270FA7729F7B91` (`goodsClass_id`),
  CONSTRAINT `FKAD270FA765403E11` FOREIGN KEY (`homepageGoodsClass_id`) REFERENCES `shopping_homepage_goodsclass` (`id`),
  CONSTRAINT `FKAD270FA7729F7B91` FOREIGN KEY (`goodsClass_id`) REFERENCES `shopping_goodsclass` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_homepage_goodsclass_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_home_addention`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_home_addention`;
CREATE TABLE `shopping_home_addention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `attention_homepage_id` bigint(20) DEFAULT NULL,
  `attentioned_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKD4036D0F78D5D162` (`attentioned_id`),
  KEY `FKD4036D0FF2DAF870` (`attention_homepage_id`),
  CONSTRAINT `FKD4036D0F78D5D162` FOREIGN KEY (`attentioned_id`) REFERENCES `shopping_homepage` (`id`),
  CONSTRAINT `FKD4036D0FF2DAF870` FOREIGN KEY (`attention_homepage_id`) REFERENCES `shopping_homepage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_home_addention
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_integrallog`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_integrallog`;
CREATE TABLE `shopping_integrallog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `integral` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `integral_user_id` bigint(20) DEFAULT NULL,
  `operate_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEC2A9E67F65B7CBE` (`integral_user_id`),
  KEY `FKEC2A9E67C8F25896` (`operate_user_id`),
  KEY `FKCF2651C1C1009F6F` (`integral_user_id`),
  KEY `FKCF2651C193977B47` (`operate_user_id`),
  CONSTRAINT `FKCF2651C193977B47` FOREIGN KEY (`operate_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKCF2651C1C1009F6F` FOREIGN KEY (`integral_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKEC2A9E67C8F25896` FOREIGN KEY (`operate_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKEC2A9E67F65B7CBE` FOREIGN KEY (`integral_user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_integrallog
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_integral_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_integral_goods`;
CREATE TABLE `shopping_integral_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `ig_begin_time` datetime DEFAULT NULL,
  `ig_click_count` int(11) NOT NULL,
  `ig_content` varchar(255) DEFAULT NULL,
  `ig_end_time` datetime DEFAULT NULL,
  `ig_exchange_count` int(11) NOT NULL,
  `ig_goods_count` int(11) NOT NULL,
  `ig_goods_integral` int(11) NOT NULL,
  `ig_goods_name` varchar(255) DEFAULT NULL,
  `ig_goods_price` decimal(12,2) DEFAULT NULL,
  `ig_goods_sn` varchar(255) DEFAULT NULL,
  `ig_goods_tag` varchar(255) DEFAULT NULL,
  `ig_limit_count` int(11) NOT NULL,
  `ig_limit_type` bit(1) NOT NULL,
  `ig_recommend` bit(1) NOT NULL,
  `ig_seo_description` varchar(255) DEFAULT NULL,
  `ig_seo_keywords` varchar(255) DEFAULT NULL,
  `ig_sequence` int(11) NOT NULL,
  `ig_show` bit(1) NOT NULL,
  `ig_time_type` bit(1) NOT NULL,
  `ig_transfee` decimal(12,2) DEFAULT NULL,
  `ig_transfee_type` int(11) NOT NULL,
  `ig_goods_img_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDCFD0854F326849C` (`ig_goods_img_id`),
  KEY `FK25A95EBA3A70688B` (`ig_goods_img_id`),
  CONSTRAINT `FK25A95EBA3A70688B` FOREIGN KEY (`ig_goods_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKDCFD0854F326849C` FOREIGN KEY (`ig_goods_img_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_integral_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_integral_goodscart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_integral_goodscart`;
CREATE TABLE `shopping_integral_goodscart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `count` int(11) NOT NULL,
  `integral` int(11) NOT NULL,
  `trans_fee` decimal(12,2) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6035ECDAC034A786` (`goods_id`),
  KEY `FK6035ECDA9F6D3F38` (`order_id`),
  CONSTRAINT `FK6035ECDA9F6D3F38` FOREIGN KEY (`order_id`) REFERENCES `shopping_integral_goodsorder` (`id`),
  CONSTRAINT `FK6035ECDAC034A786` FOREIGN KEY (`goods_id`) REFERENCES `shopping_integral_goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_integral_goodscart
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_integral_goodsorder`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_integral_goodsorder`;
CREATE TABLE `shopping_integral_goodsorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `igo_msg` longtext,
  `igo_order_sn` varchar(255) DEFAULT NULL,
  `igo_pay_msg` longtext,
  `igo_pay_time` datetime DEFAULT NULL,
  `igo_payment` varchar(255) DEFAULT NULL,
  `igo_ship_code` varchar(255) DEFAULT NULL,
  `igo_ship_content` longtext,
  `igo_ship_time` date DEFAULT NULL,
  `igo_status` int(11) NOT NULL,
  `igo_total_integral` int(11) NOT NULL,
  `igo_trans_fee` decimal(12,2) DEFAULT NULL,
  `igo_addr_id` bigint(20) DEFAULT NULL,
  `igo_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF590937A26B00318` (`igo_addr_id`),
  KEY `FKF590937A85110923` (`igo_user_id`),
  KEY `FKA7384CD42DB016C7` (`igo_addr_id`),
  KEY `FKA7384CD44FB62BD4` (`igo_user_id`),
  CONSTRAINT `FKA7384CD42DB016C7` FOREIGN KEY (`igo_addr_id`) REFERENCES `shopping_address` (`id`),
  CONSTRAINT `FKA7384CD44FB62BD4` FOREIGN KEY (`igo_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF590937A26B00318` FOREIGN KEY (`igo_addr_id`) REFERENCES `shopping_address` (`id`),
  CONSTRAINT `FKF590937A85110923` FOREIGN KEY (`igo_user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_integral_goodsorder
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_message`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_message`;
CREATE TABLE `shopping_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `fromUser_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `toUser_id` bigint(20) DEFAULT NULL,
  `reply_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK86FF3FD68D202D76` (`toUser_id`),
  KEY `FK86FF3FD6323CF700` (`parent_id`),
  KEY `FK86FF3FD6F3DB4167` (`fromUser_id`),
  KEY `FKF23EB03057C55027` (`toUser_id`),
  KEY `FKF23EB030393D0AAF` (`parent_id`),
  KEY `FKF23EB030BE806418` (`fromUser_id`),
  CONSTRAINT `FK86FF3FD6323CF700` FOREIGN KEY (`parent_id`) REFERENCES `shopping_message` (`id`),
  CONSTRAINT `FK86FF3FD68D202D76` FOREIGN KEY (`toUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK86FF3FD6F3DB4167` FOREIGN KEY (`fromUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF23EB030393D0AAF` FOREIGN KEY (`parent_id`) REFERENCES `shopping_message` (`id`),
  CONSTRAINT `FKF23EB03057C55027` FOREIGN KEY (`toUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF23EB030BE806418` FOREIGN KEY (`fromUser_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_message
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_mobileverifycode`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_mobileverifycode`;
CREATE TABLE `shopping_mobileverifycode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_mobileverifycode
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_navigation`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_navigation`;
CREATE TABLE `shopping_navigation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `display` bit(1) NOT NULL,
  `location` int(11) NOT NULL,
  `new_win` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `sysNav` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `original_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229383 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_navigation
-- ----------------------------
INSERT INTO `shopping_navigation` VALUES ('2', '2013-12-30 19:08:13', '', '', '0', '1', '2', '', '积分', 'diy', null, 'integral.htm', 'integral.htm');
INSERT INTO `shopping_navigation` VALUES ('32768', '2014-01-06 11:16:13', '', '', '0', '1', '4', '', '专题', 'activity', '1', 'activity_1.htm', 'activity.htm?id=1');
INSERT INTO `shopping_navigation` VALUES ('65536', '2014-02-21 18:14:23', '', '', '0', '1', '3', '', '团购', 'diy', null, 'group.htm', 'group.htm');
INSERT INTO `shopping_navigation` VALUES ('65537', '2013-09-04 18:04:37', '', '', '0', '1', '0', '', '首页', 'diy', null, 'index.htm', 'index.htm');
INSERT INTO `shopping_navigation` VALUES ('65538', '2013-09-04 18:04:57', '', '', '0', '1', '1', '', '品牌', 'diy', null, 'brand.htm', 'brand.htm');
INSERT INTO `shopping_navigation` VALUES ('196608', '2013-12-18 14:37:16', '', '', '1', '1', '1', '', '招聘英才', 'diy', null, 'article_join.htm', 'article_join.htm');
INSERT INTO `shopping_navigation` VALUES ('196609', '2013-12-18 14:37:43', '', '', '1', '1', '2', '', '广告合作', 'diy', null, 'article_adver.htm', 'article_adver.htm');
INSERT INTO `shopping_navigation` VALUES ('196610', '2013-12-18 14:38:33', '', '', '1', '1', '3', '', '联系我们', 'diy', null, 'article_contact.htm', 'article_contact.htm');
INSERT INTO `shopping_navigation` VALUES ('196611', '2013-12-18 14:39:42', '', '', '1', '1', '4', '', '关于健康币', 'diy', null, 'article_about.htm', 'article_about.htm');
INSERT INTO `shopping_navigation` VALUES ('229376', '2013-12-18 14:42:24', '', '', '1', '0', '0', '', '首页', 'diy', null, 'index.htm', 'index.htm');
INSERT INTO `shopping_navigation` VALUES ('229377', '2014-09-25 18:40:03', '', '', '0', '1', '5', '', '特价', 'diy', null, 'bargain.htm', 'bargain.htm');
INSERT INTO `shopping_navigation` VALUES ('229379', '2014-09-27 10:50:01', '', '', '0', '1', '6', '', '买就送', 'diy', null, 'delivery.htm', 'delivery.htm');
INSERT INTO `shopping_navigation` VALUES ('229380', '2014-10-09 14:31:44', '', '', '0', '1', '7', '', '闲置', 'diy', null, 'sparegoods.htm', 'sparegoods.htm');
INSERT INTO `shopping_navigation` VALUES ('229381', '2014-10-14 17:33:52', '', '', '0', '1', '0', '', '首页', 'sparegoods', null, 'index.htm', 'index.htm');
INSERT INTO `shopping_navigation` VALUES ('229382', '2014-10-14 17:34:34', '', '', '0', '1', '8', '', '闲置数码', 'sparegoods', null, 'sparegoods_search.htm?cid=1', 'sparegoods_search.htm?cid=1');

-- ----------------------------
-- Table structure for `shopping_orderform`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_orderform`;
CREATE TABLE `shopping_orderform` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `finishTime` datetime DEFAULT NULL,
  `goods_amount` decimal(12,2) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `invoiceType` int(11) NOT NULL,
  `msg` longtext,
  `order_id` varchar(255) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payTime` datetime DEFAULT NULL,
  `pay_msg` longtext,
  `refund` decimal(12,2) DEFAULT NULL,
  `refund_type` varchar(255) DEFAULT NULL,
  `shipCode` varchar(255) DEFAULT NULL,
  `shipTime` datetime DEFAULT NULL,
  `ship_price` decimal(12,2) DEFAULT NULL,
  `totalPrice` decimal(12,2) DEFAULT NULL,
  `addr_id` bigint(20) DEFAULT NULL,
  `payment_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `auto_confirm_email` bit(1) DEFAULT b'0',
  `auto_confirm_sms` bit(1) DEFAULT b'0',
  `transport` varchar(255) DEFAULT NULL,
  `out_order_id` varchar(255) DEFAULT NULL,
  `ec_id` bigint(20) DEFAULT NULL,
  `ci_id` bigint(20) DEFAULT NULL,
  `order_seller_intro` longtext,
  `return_shipCode` varchar(255) DEFAULT NULL,
  `return_ec_id` bigint(20) DEFAULT NULL,
  `return_content` longtext,
  `return_shipTime` datetime DEFAULT NULL,
  `order_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9BD986FBB62A45D2` (`payment_id`),
  KEY `FK9BD986FB2201A8B0` (`ci_id`),
  KEY `FK9BD986FBF8442271` (`ec_id`),
  KEY `FK9BD986FB1E208F02` (`user_id`),
  KEY `FK9BD986FB37781EA2` (`return_ec_id`),
  KEY `FK9BD986FBFC1A79F5` (`addr_id`),
  KEY `FK9BD986FB1C0CA9F2` (`store_id`),
  CONSTRAINT `FK9BD986FB1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK9BD986FB1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK9BD986FB2201A8B0` FOREIGN KEY (`ci_id`) REFERENCES `shopping_coupon_info` (`id`),
  CONSTRAINT `FK9BD986FB37781EA2` FOREIGN KEY (`return_ec_id`) REFERENCES `shopping_express_company` (`id`),
  CONSTRAINT `FK9BD986FBB62A45D2` FOREIGN KEY (`payment_id`) REFERENCES `shopping_payment` (`id`),
  CONSTRAINT `FK9BD986FBF8442271` FOREIGN KEY (`ec_id`) REFERENCES `shopping_express_company` (`id`),
  CONSTRAINT `FK9BD986FBFC1A79F5` FOREIGN KEY (`addr_id`) REFERENCES `shopping_address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_orderform
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_order_log`;
CREATE TABLE `shopping_order_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `log_info` varchar(255) DEFAULT NULL,
  `state_info` longtext,
  `log_user_id` bigint(20) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2B18AE29F21119E` (`of_id`),
  KEY `FK9BD64CBCE8C5507` (`log_user_id`),
  CONSTRAINT `FK2B18AE29F21119E` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`),
  CONSTRAINT `FK9BD64CBCE8C5507` FOREIGN KEY (`log_user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_partner`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_partner`;
CREATE TABLE `shopping_partner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8A108CF1462F1969` (`image_id`),
  CONSTRAINT `FK8A108CF1462F1969` FOREIGN KEY (`image_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_partner
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_payment`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_payment`;
CREATE TABLE `shopping_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `chinabank_account` varchar(255) DEFAULT NULL,
  `chinabank_key` varchar(255) DEFAULT NULL,
  `content` longtext,
  `install` bit(1) NOT NULL,
  `interfaceType` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `merchantAcctId` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `partner` varchar(255) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `rmbKey` varchar(255) DEFAULT NULL,
  `safeKey` varchar(255) DEFAULT NULL,
  `seller_email` varchar(255) DEFAULT NULL,
  `spname` varchar(255) DEFAULT NULL,
  `tenpay_key` varchar(255) DEFAULT NULL,
  `tenpay_partner` varchar(255) DEFAULT NULL,
  `trade_mode` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `alipay_divide_rate` decimal(12,2) DEFAULT NULL,
  `alipay_rate` decimal(12,2) DEFAULT NULL,
  `balance_divide_rate` decimal(12,2) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `paypal_userId` varchar(255) DEFAULT NULL,
  `poundage` decimal(12,2) DEFAULT NULL,
  `lzbank_key` varchar(255) DEFAULT NULL,
  `lzbank_partner` varchar(255) DEFAULT NULL,
  `lzbank_trade_mode` varchar(255) DEFAULT NULL,
  `weixin_appId` longtext,
  `weixin_appSecret` longtext,
  `weixin_partnerId` longtext,
  `weixin_partnerKey` longtext,
  `weixin_paySignKey` longtext,
  PRIMARY KEY (`id`),
  KEY `FK8A6FE22F1C0CA9F2` (`store_id`),
  CONSTRAINT `FK8A6FE22F1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_payment
-- ----------------------------
INSERT INTO `shopping_payment` VALUES ('1', '2014-01-02 14:30:41', '', null, null, '', '', '0', 'alipay', null, null, '2088111998914580', null, null, '1kwnjaqfo9ssv663z4e8rti7w9d4bycr', 'admin@shopping.com', null, null, null, '0', 'user', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('2', '2014-01-02 14:30:53', '', null, null, '', '', '0', 'outline', null, null, null, null, null, null, null, null, null, null, '0', 'user', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('3', '2014-03-15 17:12:11', '', null, null, '', '', '0', 'balance', null, null, null, null, null, null, null, null, null, null, '0', 'user', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('4', '2014-09-25 12:05:41', '', null, null, '', '', '1', 'alipay', null, null, '4sfs3423sdfdsfdsf', null, null, 'sdfsw23sdfs3242sdfsd', 'erikchang@163.com', null, null, null, '0', 'user', '32769', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('5', '2014-09-25 14:29:59', '', null, null, '', '', '0', 'outline', null, null, null, null, null, null, null, null, null, null, '0', 'user', '32769', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('6', '2017-10-31 21:54:50', '', null, null, null, '', '0', 'outline', null, '线下支付', null, null, null, null, null, null, null, null, '0', 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('9', '2014-10-31 12:33:04', '', null, null, '', '', '0', 'paypal', null, null, null, null, null, null, null, null, null, null, '0', 'user', '1', null, null, null, 'USD', 'erikchang@163.com', null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('11', '2014-11-30 18:18:04', '', null, null, null, '', '0', 'alipay_wap', null, '支付宝手机网页支付', '', null, null, '', '', null, null, null, '0', 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('12', '2014-12-02 12:16:30', '', null, null, '', '', '0', 'alipay_wap', null, null, '2088111998914580', null, null, '1kwnjaqfo9ssv663z4e8rti7w9d4bycr', 'admin@shopping.com', null, null, null, '0', 'user', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `shopping_payment` VALUES ('13', '2016-03-17 18:49:10', '', null, null, null, '', '0', 'weixin_wap', null, '微信公众号支付', null, null, null, null, null, null, null, null, '0', 'admin', null, null, null, null, null, null, null, null, null, null, 'wx54fe06bd789a0cfb', '334aeb4ab6ccaff38f21a1a8b92151d2', '1294039901', '00000000123456781234567800000000', '00000000123456781234567800000000');
INSERT INTO `shopping_payment` VALUES ('16', '2016-04-07 11:04:37', '', null, null, null, '', '0', 'wxcodepay', null, '微信扫码支付', null, null, null, null, null, null, null, null, '0', 'admin', null, null, null, null, null, null, null, null, null, null, 'wx54fe06bd789a0cfb', '334aeb4ab6ccaff38f21a1a8b92151d2', '1294039901', null, '00000000123456781234567800000000');
INSERT INTO `shopping_payment` VALUES ('17', '2017-10-31 21:54:53', '', null, null, null, '', '0', 'alipay', null, '支付宝', null, null, null, null, null, null, null, null, '0', 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `shopping_predeposit`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_predeposit`;
CREATE TABLE `shopping_predeposit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `pd_admin_info` longtext,
  `pd_amount` decimal(12,2) DEFAULT NULL,
  `pd_pay_status` int(11) NOT NULL,
  `pd_payment` varchar(255) DEFAULT NULL,
  `pd_remittance_bank` varchar(255) DEFAULT NULL,
  `pd_remittance_info` longtext,
  `pd_remittance_time` date DEFAULT NULL,
  `pd_remittance_user` varchar(255) DEFAULT NULL,
  `pd_sn` varchar(255) DEFAULT NULL,
  `pd_status` int(11) NOT NULL,
  `pd_admin_id` bigint(20) DEFAULT NULL,
  `pd_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF0F9A9D28345AEE9` (`pd_admin_id`),
  KEY `FKF0F9A9D2758D0FB7` (`pd_user_id`),
  CONSTRAINT `FKF0F9A9D2758D0FB7` FOREIGN KEY (`pd_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKF0F9A9D28345AEE9` FOREIGN KEY (`pd_admin_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_predeposit
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_predeposit_cash`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_predeposit_cash`;
CREATE TABLE `shopping_predeposit_cash` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `cash_account` varchar(255) DEFAULT NULL,
  `cash_admin_info` longtext,
  `cash_amount` decimal(12,2) DEFAULT NULL,
  `cash_bank` varchar(255) DEFAULT NULL,
  `cash_info` longtext,
  `cash_pay_status` int(11) NOT NULL,
  `cash_payment` varchar(255) DEFAULT NULL,
  `cash_sn` varchar(255) DEFAULT NULL,
  `cash_status` int(11) NOT NULL,
  `cash_userName` varchar(255) DEFAULT NULL,
  `cash_admin_id` bigint(20) DEFAULT NULL,
  `cash_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK916ADD807D5CDF6` (`cash_user_id`),
  KEY `FK916ADD803A14B88A` (`cash_admin_id`),
  CONSTRAINT `FK916ADD803A14B88A` FOREIGN KEY (`cash_admin_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK916ADD807D5CDF6` FOREIGN KEY (`cash_user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_predeposit_cash
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_predeposit_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_predeposit_log`;
CREATE TABLE `shopping_predeposit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `pd_log_amount` decimal(12,2) DEFAULT NULL,
  `pd_log_info` longtext,
  `pd_op_type` varchar(255) DEFAULT NULL,
  `pd_type` varchar(255) DEFAULT NULL,
  `pd_log_admin_id` bigint(20) DEFAULT NULL,
  `pd_log_user_id` bigint(20) DEFAULT NULL,
  `predeposit_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDD0C74D11B0A508B` (`pd_log_user_id`),
  KEY `FKDD0C74D1321DC511` (`predeposit_id`),
  KEY `FKDD0C74D14CCA9953` (`pd_log_admin_id`),
  KEY `FK25B8CB37E5AF733C` (`pd_log_user_id`),
  KEY `FK25B8CB37D4105F02` (`predeposit_id`),
  KEY `FK25B8CB37176FBC04` (`pd_log_admin_id`),
  CONSTRAINT `FK25B8CB37176FBC04` FOREIGN KEY (`pd_log_admin_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK25B8CB37D4105F02` FOREIGN KEY (`predeposit_id`) REFERENCES `shopping_predeposit` (`id`),
  CONSTRAINT `FK25B8CB37E5AF733C` FOREIGN KEY (`pd_log_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKDD0C74D11B0A508B` FOREIGN KEY (`pd_log_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKDD0C74D1321DC511` FOREIGN KEY (`predeposit_id`) REFERENCES `shopping_predeposit` (`id`),
  CONSTRAINT `FKDD0C74D14CCA9953` FOREIGN KEY (`pd_log_admin_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_predeposit_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_refund_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_refund_log`;
CREATE TABLE `shopping_refund_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `refund` decimal(12,2) DEFAULT NULL,
  `refund_id` varchar(255) DEFAULT NULL,
  `refund_log` varchar(255) DEFAULT NULL,
  `refund_type` varchar(255) DEFAULT NULL,
  `of_id` bigint(20) DEFAULT NULL,
  `refund_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC075AFCE8E17FA8A` (`refund_user_id`),
  KEY `FKC075AFCE9F21119E` (`of_id`),
  KEY `FK4BE9293458BD1D3B` (`refund_user_id`),
  KEY `FK4BE92934E66AF58D` (`of_id`),
  CONSTRAINT `FK4BE9293458BD1D3B` FOREIGN KEY (`refund_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK4BE92934E66AF58D` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`),
  CONSTRAINT `FKC075AFCE8E17FA8A` FOREIGN KEY (`refund_user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKC075AFCE9F21119E` FOREIGN KEY (`of_id`) REFERENCES `shopping_orderform` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_refund_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_report`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_report`;
CREATE TABLE `shopping_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `handle_Time` datetime DEFAULT NULL,
  `handle_info` longtext,
  `result` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `acc1_id` bigint(20) DEFAULT NULL,
  `acc2_id` bigint(20) DEFAULT NULL,
  `acc3_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `subject_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEBD95F85A995E663` (`goods_id`),
  KEY `FKEBD95F85C84755CF` (`subject_id`),
  KEY `FKEBD95F85EBD92B44` (`acc2_id`),
  KEY `FKEBD95F85537B6C51` (`user_id`),
  KEY `FKEBD95F85EBD99FA3` (`acc3_id`),
  KEY `FKEBD95F85EBD8B6E5` (`acc1_id`),
  KEY `FK291D7BEB339519D2` (`goods_id`),
  KEY `FK291D7BEBCF0FAA3E` (`subject_id`),
  KEY `FK291D7BEB33230F33` (`acc2_id`),
  KEY `FK291D7BEB1E208F02` (`user_id`),
  KEY `FK291D7BEB33238392` (`acc3_id`),
  KEY `FK291D7BEB33229AD4` (`acc1_id`),
  CONSTRAINT `FK291D7BEB1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK291D7BEB33229AD4` FOREIGN KEY (`acc1_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK291D7BEB33230F33` FOREIGN KEY (`acc2_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK291D7BEB33238392` FOREIGN KEY (`acc3_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK291D7BEB339519D2` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FK291D7BEBCF0FAA3E` FOREIGN KEY (`subject_id`) REFERENCES `shopping_report_subject` (`id`),
  CONSTRAINT `FKEBD95F85537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKEBD95F85A995E663` FOREIGN KEY (`goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKEBD95F85C84755CF` FOREIGN KEY (`subject_id`) REFERENCES `shopping_report_subject` (`id`),
  CONSTRAINT `FKEBD95F85EBD8B6E5` FOREIGN KEY (`acc1_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKEBD95F85EBD92B44` FOREIGN KEY (`acc2_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKEBD95F85EBD99FA3` FOREIGN KEY (`acc3_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_report
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_report_subject`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_report_subject`;
CREATE TABLE `shopping_report_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8CD20672965F1C05` (`type_id`),
  KEY `FKD57E5CD83851B5F6` (`type_id`),
  CONSTRAINT `FK8CD20672965F1C05` FOREIGN KEY (`type_id`) REFERENCES `shopping_report_type` (`id`),
  CONSTRAINT `FKD57E5CD83851B5F6` FOREIGN KEY (`type_id`) REFERENCES `shopping_report_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_report_subject
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_report_type`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_report_type`;
CREATE TABLE `shopping_report_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_report_type
-- ----------------------------
INSERT INTO `shopping_report_type` VALUES ('1', '2015-03-02 20:02:54', '', '抄袭图片和内容', '抄袭举报');

-- ----------------------------
-- Table structure for `shopping_res`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_res`;
CREATE TABLE `shopping_res` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `resName` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=779 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_res
-- ----------------------------
INSERT INTO `shopping_res` VALUES ('1', '2015-02-26 14:59:09', '', null, '商城后台管理', '0', 'URL', '/admin/index.htm*');
INSERT INTO `shopping_res` VALUES ('2', '2015-02-26 14:59:09', '', null, '欢迎页面', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('3', '2015-02-26 14:59:09', '', null, '关于我们', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('4', '2015-02-26 14:59:09', '', null, '站点设置', '0', 'URL', '/admin/set_site.htm*');
INSERT INTO `shopping_res` VALUES ('5', '2015-02-26 14:59:09', '', null, '上传设置', '0', 'URL', '/admin/set_image.htm*');
INSERT INTO `shopping_res` VALUES ('6', '2015-02-26 14:59:09', '', null, 'Email设置', '0', 'URL', '/admin/set_email.htm*');
INSERT INTO `shopping_res` VALUES ('7', '2015-02-26 14:59:09', '', null, '短信设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('8', '2015-02-26 14:59:09', '', null, 'SEO设置', '0', 'URL', '/admin/set_seo.htm*');
INSERT INTO `shopping_res` VALUES ('9', '2015-02-26 14:59:09', '', null, 'QQ互联登录', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('10', '2015-02-26 14:59:09', '', null, '分润设置', '0', 'URL', '/admin/set_fenrun.htm*');
INSERT INTO `shopping_res` VALUES ('11', '2015-02-26 14:59:10', '', null, '保存商城配置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('12', '2015-02-26 14:59:10', '', null, '二级域名设置', '0', 'URL', '/admin/set_second_domain.htm*');
INSERT INTO `shopping_res` VALUES ('13', '2015-02-26 14:59:10', '', null, '二级域名设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('14', '2015-02-26 14:59:10', '', null, '保存分润设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('15', '2015-02-26 14:59:10', '', null, 'websiteCss设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('16', '2015-02-26 14:59:10', '', null, '支付方式列表', '0', 'URL', '/admin/payment_list.htm*');
INSERT INTO `shopping_res` VALUES ('17', '2015-02-26 14:59:10', '', null, '支付方式设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('18', '2015-02-26 14:59:10', '', null, '支付方式编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('19', '2015-02-26 14:59:10', '', null, '支付方式保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('20', '2015-02-26 14:59:10', '', null, '平台支付方式设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('21', '2015-02-26 14:59:10', '', null, '模板保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('22', '2015-02-26 14:59:10', '', null, '模板编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('23', '2015-02-26 14:59:11', '', null, '模板开启', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('24', '2015-02-26 14:59:11', '', null, '模板列表', '0', 'URL', '/admin/template_list.htm*');
INSERT INTO `shopping_res` VALUES ('25', '2015-02-26 14:59:11', '', null, '模板AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('26', '2015-02-26 14:59:11', '', null, '模板添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('27', '2015-02-26 14:59:11', '', null, '模板编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('28', '2015-02-26 14:59:11', '', null, '地区列表', '0', 'URL', '/admin/area_list.htm*');
INSERT INTO `shopping_res` VALUES ('29', '2015-02-26 14:59:11', '', null, '地区保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('30', '2015-02-26 14:59:11', '', null, '地区删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('31', '2015-02-26 14:59:11', '', null, '地区导入', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('32', '2015-02-26 14:59:11', '', null, '地区Ajax编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('33', '2015-02-26 14:59:11', '', null, '运费地区列表', '0', 'URL', '/admin/trans_area_list.htm*');
INSERT INTO `shopping_res` VALUES ('34', '2015-02-26 14:59:11', '', null, '运费地区保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('35', '2015-02-26 14:59:11', '', null, '运费地区删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('36', '2015-02-26 14:59:11', '', null, '运费地区Ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('37', '2015-02-26 14:59:12', '', null, '商品AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('38', '2015-02-26 14:59:12', '', null, '商品添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('39', '2015-02-26 14:59:12', '', null, '违规商品列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('40', '2015-02-26 14:59:12', '', null, '商品列表', '0', 'URL', '/admin/goods_list.htm*');
INSERT INTO `shopping_res` VALUES ('41', '2015-02-26 14:59:12', '', null, '商品编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('42', '2015-02-26 14:59:12', '', null, '商品保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('43', '2015-02-26 14:59:12', '', null, '商品删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('44', '2015-02-26 14:59:12', '', null, '商品分类列表', '0', 'URL', '/admin/goods_class_list.htm*');
INSERT INTO `shopping_res` VALUES ('45', '2015-02-26 14:59:12', '', null, '商品分类添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('46', '2015-02-26 14:59:12', '', null, '商品分类编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('47', '2015-02-26 14:59:12', '', null, '商品分类保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('48', '2015-02-26 14:59:12', '', null, '商品分类下级加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('49', '2015-02-26 14:59:13', '', null, '商品分类Ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('50', '2015-02-26 14:59:13', '', null, '商品分类批量推荐', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('51', '2015-02-26 14:59:13', '', null, '商品分类批量删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('52', '2015-02-26 14:59:13', '', null, '商品品牌添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('53', '2015-02-26 14:59:13', '', null, '商品品牌列表', '0', 'URL', '/admin/goods_brand_list.htm*');
INSERT INTO `shopping_res` VALUES ('54', '2015-02-26 14:59:13', '', null, '商品品牌保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('55', '2015-02-26 14:59:13', '', null, '商品品牌删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('56', '2015-02-26 14:59:13', '', null, '商品品牌待审核列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('57', '2015-02-26 14:59:13', '', null, '商品品牌AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('58', '2015-02-26 14:59:13', '', null, '商品品牌编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('59', '2015-02-26 14:59:14', '', null, '商品品牌审核通过', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('60', '2015-02-26 14:59:14', '', null, '商品品牌审核拒绝', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('61', '2015-02-26 14:59:14', '', null, '商品类型添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('62', '2015-02-26 14:59:14', '', null, '商品类型列表', '0', 'URL', '/admin/goods_type_list.htm*');
INSERT INTO `shopping_res` VALUES ('63', '2015-02-26 14:59:14', '', null, '商品类型保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('64', '2015-02-26 14:59:14', '', null, '商品类型删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('65', '2015-02-26 14:59:14', '', null, '商品类型AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('66', '2015-02-26 14:59:14', '', null, '商品类型属性AJAX删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('67', '2015-02-26 14:59:14', '', null, '商品类型编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('68', '2015-02-26 14:59:14', '', null, '商品规格添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('69', '2015-02-26 14:59:14', '', null, '商品规格列表', '0', 'URL', '/admin/goods_spec_list.htm*');
INSERT INTO `shopping_res` VALUES ('70', '2015-02-26 14:59:14', '', null, '商品规格保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('71', '2015-02-26 14:59:15', '', null, '商品规格删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('72', '2015-02-26 14:59:15', '', null, '商品规格AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('73', '2015-02-26 14:59:15', '', null, '商品规格属性AJAX删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('74', '2015-02-26 14:59:15', '', null, '商品规格编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('75', '2015-02-26 14:59:15', '', null, '闲置商品列表', '0', 'URL', '/admin/sparegoods_list.htm*');
INSERT INTO `shopping_res` VALUES ('76', '2015-02-26 14:59:15', '', null, '闲置商品下架上架切换', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('77', '2015-02-26 14:59:15', '', null, '闲置商品信息删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('78', '2015-02-26 14:59:15', '', null, '闲置商品AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('79', '2015-02-26 14:59:15', '', null, '闲置商品分类列表', '0', 'URL', '/admin/sparegoods_class_list.htm*');
INSERT INTO `shopping_res` VALUES ('80', '2015-02-26 14:59:15', '', null, '闲置商品分类添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('81', '2015-02-26 14:59:15', '', null, '闲置商品分类编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('82', '2015-02-26 14:59:16', '', null, '闲置商品分类保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('83', '2015-02-26 14:59:16', '', null, '闲置商品分类删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('84', '2015-02-26 14:59:16', '', null, '闲置商品分类Ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('85', '2015-02-26 14:59:16', '', null, '闲置商品分类下级加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('86', '2015-02-26 14:59:16', '', null, '闲置商品分类验证是否存在', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('87', '2015-02-26 14:59:16', '', null, '店铺列表', '0', 'URL', '/admin/store_list.htm*');
INSERT INTO `shopping_res` VALUES ('88', '2015-02-26 14:59:16', '', null, '店铺添加1', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('89', '2015-02-26 14:59:16', '', null, '店铺编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('90', '2015-02-26 14:59:16', '', null, '店铺保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('91', '2015-02-26 14:59:16', '', null, '店铺添加2', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('92', '2015-02-26 14:59:17', '', null, '店铺删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('93', '2015-02-26 14:59:17', '', null, '店铺AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('94', '2015-02-26 14:59:17', '', null, '卖家信用', '0', 'URL', '/admin/store_base.htm*');
INSERT INTO `shopping_res` VALUES ('95', '2015-02-26 14:59:17', '', null, '卖家信用保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('96', '2015-02-26 14:59:17', '', null, '店铺模板', '0', 'URL', '/admin/store_template.htm*');
INSERT INTO `shopping_res` VALUES ('97', '2015-02-26 14:59:17', '', null, '店铺模板增加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('98', '2015-02-26 14:59:17', '', null, '店铺模板保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('99', '2015-02-26 14:59:17', '', null, '店铺升级列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('100', '2015-02-26 14:59:17', '', null, '店铺升级编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('101', '2015-02-26 14:59:17', '', null, '店铺升级保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('102', '2015-02-26 14:59:18', '', null, '店铺升级日志查看', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('103', '2015-02-26 14:59:18', '', null, '店铺等级列表', '0', 'URL', '/admin/storegrade_list.htm*');
INSERT INTO `shopping_res` VALUES ('104', '2015-02-26 14:59:18', '', null, '店铺等级添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('105', '2015-02-26 14:59:18', '', null, '店铺等级编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('106', '2015-02-26 14:59:18', '', null, '店铺等级保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('107', '2015-02-26 14:59:18', '', null, '店铺等级删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('108', '2015-02-26 14:59:18', '', null, '店铺等级AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('109', '2015-02-26 14:59:18', '', null, '店铺等级模板设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('110', '2015-02-26 14:59:18', '', null, '店铺等级模板保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('111', '2015-02-26 14:59:18', '', null, '店铺分类添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('112', '2015-02-26 14:59:19', '', null, '店铺分类列表', '0', 'URL', '/admin/storeclass_list.htm*');
INSERT INTO `shopping_res` VALUES ('113', '2015-02-26 14:59:19', '', null, '店铺分类保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('114', '2015-02-26 14:59:19', '', null, '店铺分类删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('115', '2015-02-26 14:59:19', '', null, '店铺分类AJAX保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('116', '2015-02-26 14:59:19', '', null, '店铺分类下级数据加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('117', '2015-02-26 14:59:19', '', null, '店铺分类编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('118', '2015-02-26 14:59:19', '', null, '会员列表', '0', 'URL', '/admin/user_list.htm*');
INSERT INTO `shopping_res` VALUES ('119', '2015-02-26 14:59:19', '', null, '会员信用', '0', 'URL', '/admin/user_creditrule.htm*');
INSERT INTO `shopping_res` VALUES ('120', '2015-02-26 14:59:19', '', null, '买家信用保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('121', '2015-02-26 14:59:19', '', null, '会员编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('122', '2015-02-26 14:59:19', '', null, '会员添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('123', '2015-02-26 14:59:19', '', null, '会员删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('124', '2015-02-26 14:59:20', '', null, '会员保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('125', '2015-02-26 14:59:20', '', null, '会员通知', '0', 'URL', '/admin/user_msg.htm*');
INSERT INTO `shopping_res` VALUES ('126', '2015-02-26 14:59:20', '', null, '会员通知发送', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('127', '2015-02-26 14:59:20', '', null, '预存款手动修改', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('128', '2015-02-26 14:59:20', '', null, '加载用户预存款信息', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('129', '2015-02-26 14:59:20', '', null, '预存款手动修改保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('130', '2015-02-26 14:59:20', '', null, '预存款列表', '0', 'URL', '/admin/predeposit_list.htm*');
INSERT INTO `shopping_res` VALUES ('131', '2015-02-26 14:59:20', '', null, '预存款编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('132', '2015-02-26 14:59:20', '', null, '预存款保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('133', '2015-02-26 14:59:20', '', null, '预存款明细列表', '0', 'URL', '/admin/predepositlog_list.htm*');
INSERT INTO `shopping_res` VALUES ('134', '2015-02-26 14:59:20', '', null, '管理员编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('135', '2015-02-26 14:59:20', '', null, '管理员列表', '0', 'URL', '/admin/admin_list.htm');
INSERT INTO `shopping_res` VALUES ('136', '2015-02-26 14:59:21', '', null, '管理员保存', '0', 'URL', '/admin/admin_save.htm');
INSERT INTO `shopping_res` VALUES ('137', '2015-02-26 14:59:21', '', null, '管理员添加', '0', 'URL', '/admin/admin_add.htm');
INSERT INTO `shopping_res` VALUES ('138', '2015-02-26 14:59:21', '', null, '管理员删除', '0', 'URL', '/admin/admin_del.htm');
INSERT INTO `shopping_res` VALUES ('139', '2015-02-26 14:59:21', '', null, '管理员修改密码', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('140', '2015-02-26 14:59:21', '', null, '管理员密码保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('141', '2015-02-26 14:59:21', '', null, '订单列表', '0', 'URL', '/admin/order_list.htm*');
INSERT INTO `shopping_res` VALUES ('142', '2015-02-26 14:59:21', '', null, '订单详情', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('143', '2015-02-26 14:59:21', '', null, '订单设置', '0', 'URL', '/admin/set_order_confirm.htm*');
INSERT INTO `shopping_res` VALUES ('144', '2015-02-26 14:59:21', '', null, '订单设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('145', '2015-02-26 14:59:21', '', null, '咨询列表', '0', 'URL', '/admin/consult_list.htm*');
INSERT INTO `shopping_res` VALUES ('146', '2015-02-26 14:59:22', '', null, '咨询删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('147', '2015-02-26 14:59:22', '', null, '举报处理', '0', 'URL', '/admin/report_list.htm*');
INSERT INTO `shopping_res` VALUES ('148', '2015-02-26 14:59:22', '', null, '未处理举报列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('149', '2015-02-26 14:59:22', '', null, '已处理举报列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('150', '2015-02-26 14:59:22', '', null, '举报处理', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('151', '2015-02-26 14:59:22', '', null, '举报主题增加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('152', '2015-02-26 14:59:22', '', null, '举报主题列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('153', '2015-02-26 14:59:22', '', null, '举报主题保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('154', '2015-02-26 14:59:22', '', null, '举报主题删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('155', '2015-02-26 14:59:22', '', null, '举报主题编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('156', '2015-02-26 14:59:22', '', null, '举报类型增加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('157', '2015-02-26 14:59:22', '', null, '举报类型列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('158', '2015-02-26 14:59:23', '', null, '举报类型保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('159', '2015-02-26 14:59:23', '', null, '举报类型删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('160', '2015-02-26 14:59:23', '', null, '举报类型编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('161', '2015-02-26 14:59:23', '', null, '商品评价编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('162', '2015-02-26 14:59:23', '', null, '商品评价编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('163', '2015-02-26 14:59:23', '', null, '商品评价列表', '0', 'URL', '/admin/evaluate_list.htm*');
INSERT INTO `shopping_res` VALUES ('164', '2015-02-26 14:59:23', '', null, '投诉设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('165', '2015-02-26 14:59:23', '', null, '投诉图片', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('166', '2015-02-26 14:59:23', '', null, '投诉列表', '0', 'URL', '/admin/complaint_list.htm*');
INSERT INTO `shopping_res` VALUES ('167', '2015-02-26 14:59:23', '', null, '投诉设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('168', '2015-02-26 14:59:23', '', null, '投诉详情', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('169', '2015-02-26 14:59:24', '', null, '投诉审核', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('170', '2015-02-26 14:59:24', '', null, '投诉关闭', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('171', '2015-02-26 14:59:24', '', null, '发布投诉对话', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('172', '2015-02-26 14:59:24', '', null, '投诉仲裁', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('173', '2015-02-26 14:59:24', '', null, '投诉主题添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('174', '2015-02-26 14:59:24', '', null, '投诉主题列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('175', '2015-02-26 14:59:24', '', null, '投诉主题保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('176', '2015-02-26 14:59:24', '', null, '投诉主题删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('177', '2015-02-26 14:59:24', '', null, '投诉主题编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('178', '2015-02-26 14:59:24', '', null, '文章添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('179', '2015-02-26 14:59:24', '', null, '文章列表', '0', 'URL', '/admin/article_list.htm*');
INSERT INTO `shopping_res` VALUES ('180', '2015-02-26 14:59:25', '', null, '文章保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('181', '2015-02-26 14:59:25', '', null, '文章删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('182', '2015-02-26 14:59:25', '', null, '文章AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('183', '2015-02-26 14:59:25', '', null, '文章编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('184', '2015-02-26 14:59:25', '', null, '文章分类添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('185', '2015-02-26 14:59:25', '', null, '文章分类列表', '0', 'URL', '/admin/articleclass_list.htm*');
INSERT INTO `shopping_res` VALUES ('186', '2015-02-26 14:59:25', '', null, '文章分类保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('187', '2015-02-26 14:59:25', '', null, '文章分类删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('188', '2015-02-26 14:59:25', '', null, '文章分类AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('189', '2015-02-26 14:59:25', '', null, '文章下级分类', '0', 'URL', '/admin/articleclass_data.htm*');
INSERT INTO `shopping_res` VALUES ('190', '2015-02-26 14:59:26', '', null, '文章分类编辑', '0', 'URL', '/admin/articleclass_edit.htm*');
INSERT INTO `shopping_res` VALUES ('191', '2015-02-26 14:59:26', '', null, '合作伙伴添加', '0', 'URL', '/admin/partner_add.htm*');
INSERT INTO `shopping_res` VALUES ('192', '2015-02-26 14:59:26', '', null, '合作伙伴列表', '0', 'URL', '/admin/partner_list.htm*');
INSERT INTO `shopping_res` VALUES ('193', '2015-02-26 14:59:26', '', null, '合作伙伴保存', '0', 'URL', '/admin/partner_save.htm*');
INSERT INTO `shopping_res` VALUES ('194', '2015-02-26 14:59:26', '', null, '合作伙伴删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('195', '2015-02-26 14:59:26', '', null, '合作伙伴编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('196', '2015-02-26 14:59:26', '', null, '系统文章新增', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('197', '2015-02-26 14:59:26', '', null, '系统文章列表', '0', 'URL', '/admin/document_list.htm*');
INSERT INTO `shopping_res` VALUES ('198', '2015-02-26 14:59:26', '', null, '系统文章保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('199', '2015-02-26 14:59:26', '', null, '系统文章删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('200', '2015-02-26 14:59:27', '', null, '系统文章AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('201', '2015-02-26 14:59:27', '', null, '系统文章编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('202', '2015-02-26 14:59:27', '', null, '页面导航添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('203', '2015-02-26 14:59:27', '', null, '页面导航列表', '0', 'URL', '/admin/navigation_list.htm*');
INSERT INTO `shopping_res` VALUES ('204', '2015-02-26 14:59:27', '', null, '页面导航保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('205', '2015-02-26 14:59:27', '', null, '页面导航删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('206', '2015-02-26 14:59:27', '', null, '页面导航AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('207', '2015-02-26 14:59:27', '', null, '页面导航编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('208', '2015-02-26 14:59:27', '', null, '基本设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('209', '2015-02-26 14:59:27', '', null, '积分规则', '0', 'URL', '/admin/operation_integral_rule.htm*');
INSERT INTO `shopping_res` VALUES ('210', '2015-02-26 14:59:28', '', null, '基本设置', '0', 'URL', '/admin/operation_base_set.htm*');
INSERT INTO `shopping_res` VALUES ('211', '2015-02-26 14:59:28', '', null, '积分规则保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('212', '2015-02-26 14:59:28', '', null, '金币购买记录', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('213', '2015-02-26 14:59:28', '', null, '金币日志列表', '0', 'URL', '/admin/gold_record.htm*');
INSERT INTO `shopping_res` VALUES ('214', '2015-02-26 14:59:28', '', null, '金币购买记录编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('215', '2015-02-26 14:59:28', '', null, '金币购买记录', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('216', '2015-02-26 14:59:28', '', null, '金币购买记录删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('217', '2015-02-26 14:59:28', '', null, '金币购买记录', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('218', '2015-02-26 14:59:28', '', null, '积分明细', '0', 'URL', '/admin/integrallog_list.htm*');
INSERT INTO `shopping_res` VALUES ('219', '2015-02-26 14:59:29', '', null, '积分管理', '0', 'URL', '/admin/user_integral.htm*');
INSERT INTO `shopping_res` VALUES ('220', '2015-02-26 14:59:29', '', null, '积分动态获取', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('221', '2015-02-26 14:59:29', '', null, '积分管理保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('222', '2015-02-26 14:59:29', '', null, '直通车商品审核', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('223', '2015-02-26 14:59:29', '', null, '直通车商品查看', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('224', '2015-02-26 14:59:29', '', null, '直通车商品审核保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('225', '2015-02-26 14:59:29', '', null, '直通车设置', '0', 'URL', '/admin/ztc_set.htm*');
INSERT INTO `shopping_res` VALUES ('226', '2015-02-26 14:59:29', '', null, '直通车设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('227', '2015-02-26 14:59:29', '', null, '直通车商品', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('228', '2015-02-26 14:59:30', '', null, '直通车申请列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('229', '2015-02-26 14:59:30', '', null, '直通车金币日志', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('230', '2015-02-26 14:59:30', '', null, '优惠券添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('231', '2015-02-26 14:59:30', '', null, '优惠券保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('232', '2015-02-26 14:59:30', '', null, '优惠券列表', '0', 'URL', '/admin/coupon_list.htm*');
INSERT INTO `shopping_res` VALUES ('233', '2015-02-26 14:59:30', '', null, '优惠券发放', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('234', '2015-02-26 14:59:30', '', null, '优惠券AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('235', '2015-02-26 14:59:30', '', null, '优惠券保存成功', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('236', '2015-02-26 14:59:30', '', null, '优惠券发放保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('237', '2015-02-26 14:59:30', '', null, '广告列表', '0', 'URL', '/admin/advert_list.htm*');
INSERT INTO `shopping_res` VALUES ('238', '2015-02-26 14:59:30', '', null, '广告增加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('239', '2015-02-26 14:59:31', '', null, '广告查看', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('240', '2015-02-26 14:59:31', '', null, '广告审核', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('241', '2015-02-26 14:59:31', '', null, '广告编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('242', '2015-02-26 14:59:31', '', null, '广告保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('243', '2015-02-26 14:59:31', '', null, '广告删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('244', '2015-02-26 14:59:31', '', null, '广告位添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('245', '2015-02-26 14:59:31', '', null, '广告位保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('246', '2015-02-26 14:59:31', '', null, '广告位列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('247', '2015-02-26 14:59:31', '', null, '广告位编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('248', '2015-02-26 14:59:31', '', null, '广告位删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('249', '2015-02-26 14:59:32', '', null, '待审批广告列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('250', '2015-02-26 14:59:32', '', null, '积分礼品列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('251', '2015-02-26 14:59:32', '', null, '积分礼品添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('252', '2015-02-26 14:59:32', '', null, '积分礼品编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('253', '2015-02-26 14:59:32', '', null, '积分礼品保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('254', '2015-02-26 14:59:32', '', null, '积分礼品删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('255', '2015-02-26 14:59:32', '', null, '积分礼品兑换列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('256', '2015-02-26 14:59:32', '', null, '积分礼品兑换详情', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('257', '2015-02-26 14:59:32', '', null, '取消积分订单', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('258', '2015-02-26 14:59:32', '', null, '订单确认付款', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('259', '2015-02-26 14:59:32', '', null, '订单删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('260', '2015-02-26 14:59:33', '', null, '订单费用调整', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('261', '2015-02-26 14:59:33', '', null, '订单费用调整保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('262', '2015-02-26 14:59:33', '', null, '发货设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('263', '2015-02-26 14:59:33', '', null, '发货设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('264', '2015-02-26 14:59:33', '', null, '团购区域增加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('265', '2015-02-26 14:59:33', '', null, '团购区域列表', '0', 'URL', '/admin/group_list.htm*');
INSERT INTO `shopping_res` VALUES ('266', '2015-02-26 14:59:33', '', null, '团购区域保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('267', '2015-02-26 14:59:33', '', null, '团购区域删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('268', '2015-02-26 14:59:33', '', null, '团购区域Ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('269', '2015-02-26 14:59:34', '', null, '团购区域下级加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('270', '2015-02-26 14:59:34', '', null, '团购区域编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('271', '2015-02-26 14:59:34', '', null, '团购分类增加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('272', '2015-02-26 14:59:34', '', null, '团购分类列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('273', '2015-02-26 14:59:34', '', null, '团购分类保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('274', '2015-02-26 14:59:34', '', null, '团购分类删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('275', '2015-02-26 14:59:34', '', null, '团购分类Ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('276', '2015-02-26 14:59:34', '', null, '团购分类下级加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('277', '2015-02-26 14:59:34', '', null, '团购分类编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('278', '2015-02-26 14:59:34', '', null, '团购增加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('279', '2015-02-26 14:59:34', '', null, '团购列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('280', '2015-02-26 14:59:35', '', null, '团购编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('281', '2015-02-26 14:59:35', '', null, '团购保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('282', '2015-02-26 14:59:35', '', null, '团购删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('283', '2015-02-26 14:59:35', '', null, '团购关闭', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('284', '2015-02-26 14:59:35', '', null, '团购申请列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('285', '2015-02-26 14:59:35', '', null, '团购商品审核通过', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('286', '2015-02-26 14:59:35', '', null, '团购商品审核拒绝', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('287', '2015-02-26 14:59:35', '', null, '团购商品审核推荐', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('288', '2015-02-26 14:59:35', '', null, '团购价格区间列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('289', '2015-02-26 14:59:36', '', null, '团购价格区间列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('290', '2015-02-26 14:59:36', '', null, '团购价格区间保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('291', '2015-02-26 14:59:36', '', null, '团购价格区间删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('292', '2015-02-26 14:59:36', '', null, '团购价格区间列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('293', '2015-02-26 14:59:36', '', null, '楼层分类列表', '0', 'URL', '/admin/goods_floor_list.htm*');
INSERT INTO `shopping_res` VALUES ('294', '2015-02-26 14:59:36', '', null, '楼层分类添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('295', '2015-02-26 14:59:36', '', null, '楼层分类编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('296', '2015-02-26 14:59:36', '', null, '楼层分类保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('297', '2015-02-26 14:59:36', '', null, '楼层分类删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('298', '2015-02-26 14:59:36', '', null, '楼层分类Ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('299', '2015-02-26 14:59:36', '', null, '楼层分类下级加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('300', '2015-02-26 14:59:37', '', null, '楼层模板编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('301', '2015-02-26 14:59:37', '', null, '楼层模板商品分类编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('302', '2015-02-26 14:59:37', '', null, '楼层模板商品分类加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('303', '2015-02-26 14:59:37', '', null, '楼层模板商品分类保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('304', '2015-02-26 14:59:37', '', null, '楼层模板分类商品编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('305', '2015-02-26 14:59:37', '', null, '楼层模板分类商品保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('306', '2015-02-26 14:59:37', '', null, '楼层模板右侧商品列表编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('307', '2015-02-26 14:59:37', '', null, '楼层模板右侧商品列表保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('308', '2015-02-26 14:59:38', '', null, '楼层模板左下方广告编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('309', '2015-02-26 14:59:38', '', null, '楼层模板左下方广告保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('310', '2015-02-26 14:59:38', '', null, '楼层模板右下方广告编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('311', '2015-02-26 14:59:38', '', null, '楼层模板右下方广告保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('312', '2015-02-26 14:59:38', '', null, '楼层模板品牌编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('313', '2015-02-26 14:59:38', '', null, '楼层模板品牌保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('314', '2015-02-26 14:59:38', '', null, '楼层模板品牌加载', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('315', '2015-02-26 14:59:38', '', null, '楼层模板分类商品编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('316', '2015-02-26 14:59:38', '', null, '数据库备份', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('317', '2015-02-26 14:59:38', '', null, '数据库备份列表', '0', 'URL', '/admin/database_add.htm*');
INSERT INTO `shopping_res` VALUES ('318', '2015-02-26 14:59:39', '', null, '数据库备份删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('319', '2015-02-26 14:59:39', '', null, '数据库备份保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('320', '2015-02-26 14:59:39', '', null, '数据库分卷备份', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('321', '2015-02-26 14:59:39', '', null, '数据库导入引导', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('322', '2015-02-26 14:59:39', '', null, '数据库分卷导入', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('323', '2015-02-26 14:59:39', '', null, '更新缓存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('324', '2015-02-26 14:59:39', '', null, '缓存列表', '0', 'URL', '/admin/cache_list.htm*');
INSERT INTO `shopping_res` VALUES ('325', '2015-02-26 14:59:39', '', null, '全文检索设置', '0', 'URL', '/admin/lucene.htm*');
INSERT INTO `shopping_res` VALUES ('326', '2015-02-26 14:59:39', '', null, '全文检索更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('327', '2015-02-26 14:59:39', '', null, '全文检索关键字保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('328', '2015-02-26 14:59:39', '', null, '活动删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('329', '2015-02-26 14:59:40', '', null, '活动AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('330', '2015-02-26 14:59:40', '', null, '活动列表', '0', 'URL', '/admin/activity_list.htm*');
INSERT INTO `shopping_res` VALUES ('331', '2015-02-26 14:59:40', '', null, '活动添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('332', '2015-02-26 14:59:40', '', null, '活动编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('333', '2015-02-26 14:59:40', '', null, '活动保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('334', '2015-02-26 14:59:40', '', null, '活动商品列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('335', '2015-02-26 14:59:40', '', null, '活动通过', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('336', '2015-02-26 14:59:40', '', null, '活动拒绝', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('337', '2015-02-26 14:59:40', '', null, '特价列表', '0', 'URL', '/admin/set_bargain.htm*');
INSERT INTO `shopping_res` VALUES ('338', '2015-02-26 14:59:40', '', null, '特价保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('339', '2015-02-26 14:59:40', '', null, '特价添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('340', '2015-02-26 14:59:41', '', null, '特价删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('341', '2015-02-26 14:59:41', '', null, '今日特价ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('342', '2015-02-26 14:59:41', '', null, '系统特价设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('343', '2015-02-26 14:59:41', '', null, '时间查询设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('344', '2015-02-26 14:59:41', '', null, '通用特价设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('345', '2015-02-26 14:59:41', '', null, '特价商品列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('346', '2015-02-26 14:59:41', '', null, '特价商品通过', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('347', '2015-02-26 14:59:41', '', null, '特价商品审核数超出', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('348', '2015-02-26 14:59:41', '', null, '特价拒绝', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('349', '2015-02-26 14:59:41', '', null, '买就送设置', '0', 'URL', '/admin/set_delivery.htm*');
INSERT INTO `shopping_res` VALUES ('350', '2015-02-26 14:59:41', '', null, '买就送设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('351', '2015-02-26 14:59:42', '', null, '买就送商品列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('352', '2015-02-26 14:59:42', '', null, '买就送商品审核', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('353', '2015-02-26 14:59:42', '', null, '买就送拒绝', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('354', '2015-02-26 14:59:42', '', null, '快递设置', '0', 'URL', '/admin/set_kuaidi.htm*');
INSERT INTO `shopping_res` VALUES ('355', '2015-02-26 14:59:42', '', null, '保存快递设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('356', '2015-02-26 14:59:42', '', null, '快递公司列表', '0', 'URL', '/admin/express_company_list.htm*');
INSERT INTO `shopping_res` VALUES ('357', '2015-02-26 14:59:42', '', null, '快递公司添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('358', '2015-02-26 14:59:42', '', null, '快递公司编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('359', '2015-02-26 14:59:42', '', null, '快递公司保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('360', '2015-02-26 14:59:42', '', null, '快递公司删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('361', '2015-02-26 14:59:42', '', null, '快递公司Ajax更新数据', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('362', '2015-02-26 14:59:42', '', null, 'UC配置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('363', '2015-02-26 14:59:42', '', null, 'UC信息保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('364', '2015-02-26 14:59:43', '', null, '闲置商品楼层保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('365', '2015-02-26 14:59:43', '', null, '闲置商品楼层编辑', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('366', '2015-02-26 14:59:43', '', null, '闲置商品楼层列表', '0', 'URL', '/admin/sparegoodsfloor_list.htm*');
INSERT INTO `shopping_res` VALUES ('367', '2015-02-26 14:59:43', '', null, '闲置商品楼层添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('368', '2015-02-26 14:59:43', '', null, '闲置商品楼层ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('369', '2015-02-26 14:59:43', '', null, '闲置商品楼层删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('370', '2015-02-26 14:59:43', '', null, '闲置商品楼层分类设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('371', '2015-02-26 14:59:43', '', null, '商品楼层分类ajax更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('372', '2015-02-26 14:59:43', '', null, '闲置商品楼层分类设置是否显示', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('373', '2015-02-26 14:59:43', '', null, '闲置商品楼层商品设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('374', '2015-02-26 14:59:43', '', null, '闲置商品楼层商品设置是否显示', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('375', '2015-02-26 14:59:44', '', null, '会员动态删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('376', '2015-02-26 14:59:44', '', null, '店铺动态列表', '0', 'URL', '/admin/sns_store.htm*');
INSERT INTO `shopping_res` VALUES ('377', '2015-02-26 14:59:44', '', null, '店铺动态删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('378', '2015-02-26 14:59:44', '', null, '会员动态列表', '0', 'URL', '/admin/sns_user.htm*');
INSERT INTO `shopping_res` VALUES ('379', '2015-02-26 14:59:44', '', null, 'sns动态设置可见度', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('380', '2015-02-26 14:59:44', '', null, '会员相册图片删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('381', '2015-02-26 14:59:44', '', null, '会员相册图片列表', '0', 'URL', '/admin/user_photo_list.htm*');
INSERT INTO `shopping_res` VALUES ('382', '2015-02-26 14:59:44', '', null, '会员相册列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('383', '2015-02-26 14:59:44', '', null, '会员相册删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('384', '2015-02-26 14:59:44', '', null, '组合销售设置', '0', 'URL', '/admin/set_combin.htm*');
INSERT INTO `shopping_res` VALUES ('385', '2015-02-26 14:59:44', '', null, '组合销售设置', '0', 'URL', '/admin/set_combin.htm*');
INSERT INTO `shopping_res` VALUES ('386', '2015-02-26 14:59:45', '', null, '组合销售设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('387', '2015-02-26 14:59:45', '', null, '组合销售商品审核', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('388', '2015-02-26 14:59:45', '', null, '组合销售商品拒绝', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('389', '2015-02-26 14:59:45', '', null, '微信店铺设置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('390', '2015-02-26 14:59:45', '', null, '微信店铺违规关闭', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('391', '2015-02-26 14:59:45', '', null, '微信店铺开通', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('392', '2015-02-26 14:59:45', '', null, '商品列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('393', '2015-02-26 14:59:45', '', null, '微信商品AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('394', '2015-02-26 14:59:45', '', null, '团购商品列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('395', '2015-02-26 14:59:45', '', null, '微信团购商品AJAX更新', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('396', '2015-02-26 14:59:45', '', null, '微信商品品牌列表', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('397', '2015-02-26 14:59:46', '', null, '品牌微信商城推荐', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('398', '2015-02-26 14:59:46', '', null, '微商城配置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('399', '2015-02-26 14:59:46', '', null, '微商城配置保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('400', '2015-02-26 14:59:46', '', null, '微商城菜单配置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('401', '2015-02-26 14:59:46', '', null, '微商城菜单添加', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('402', '2015-02-26 14:59:46', '', null, '微商城菜单保存', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('403', '2015-02-26 14:59:46', '', null, '微商城菜单删除', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('404', '2015-02-26 14:59:46', '', null, '微商城菜单创建', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('405', '2015-02-26 14:59:46', '', null, '微商城菜单验证', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('406', '2015-02-26 14:59:46', '', null, '微信店铺', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('407', '2015-02-26 14:59:47', '', null, '微信店铺设置', '0', 'URL', null);
INSERT INTO `shopping_res` VALUES ('408', '2015-02-26 14:59:47', '', null, '出售中的商品列表', '0', 'URL', '/seller/goods.htm*');
INSERT INTO `shopping_res` VALUES ('409', '2015-02-26 14:59:47', '', null, '商品编辑', '0', 'URL', '/seller/goods_edit.htm*');
INSERT INTO `shopping_res` VALUES ('410', '2015-02-26 14:59:47', '', null, '商品删除', '0', 'URL', '/seller/goods_del.htm*');
INSERT INTO `shopping_res` VALUES ('411', '2015-02-26 14:59:47', '', null, '发布商品第一步', '0', 'URL', '/seller/add_goods_first.htm*');
INSERT INTO `shopping_res` VALUES ('412', '2015-02-26 14:59:47', '', null, '商品运费模板分页显示', '0', 'URL', '/seller/goods_transport.htm*');
INSERT INTO `shopping_res` VALUES ('413', '2015-02-26 14:59:47', '', null, '发布商品第二步', '0', 'URL', '/seller/add_goods_second.htm*');
INSERT INTO `shopping_res` VALUES ('414', '2015-02-26 14:59:47', '', null, '产品规格显示', '0', 'URL', '/seller/goods_inventory.htm*');
INSERT INTO `shopping_res` VALUES ('415', '2015-02-26 14:59:47', '', null, '商品图片删除', '0', 'URL', '/seller/goods_image_del.htm*');
INSERT INTO `shopping_res` VALUES ('416', '2015-02-26 14:59:47', '', null, '发布商品第三步', '0', 'URL', '/seller/add_goods_finish.htm*');
INSERT INTO `shopping_res` VALUES ('417', '2015-02-26 14:59:47', '', null, '加载商品分类', '0', 'URL', '/seller/load_goods_class.htm*');
INSERT INTO `shopping_res` VALUES ('418', '2015-02-26 14:59:48', '', null, '删除用户常用商品分类', '0', 'URL', '/seller/del_goods_class_staple.htm*');
INSERT INTO `shopping_res` VALUES ('419', '2015-02-26 14:59:48', '', null, '仓库中的商品列表', '0', 'URL', '/seller/goods_storage.htm*');
INSERT INTO `shopping_res` VALUES ('420', '2015-02-26 14:59:48', '', null, '违规下架商品', '0', 'URL', '/seller/goods_out.htm*');
INSERT INTO `shopping_res` VALUES ('421', '2015-02-26 14:59:48', '', null, '商品上下架', '0', 'URL', '/seller/goods_sale.htm*');
INSERT INTO `shopping_res` VALUES ('422', '2015-02-26 14:59:48', '', null, '被举报禁售商品', '0', 'URL', '/seller/goods_report.htm*');
INSERT INTO `shopping_res` VALUES ('423', '2015-02-26 14:59:48', '', null, '举报图片查看', '0', 'URL', '/seller/report_img.htm*');
INSERT INTO `shopping_res` VALUES ('424', '2015-02-26 14:59:48', '', null, '卖家商品分类列表', '0', 'URL', '/seller/usergoodsclass_list.htm*');
INSERT INTO `shopping_res` VALUES ('425', '2015-02-26 14:59:48', '', null, '卖家商品分类保存', '0', 'URL', '/seller/usergoodsclass_save.htm*');
INSERT INTO `shopping_res` VALUES ('426', '2015-02-26 14:59:48', '', null, '卖家商品分类删除', '0', 'URL', '/seller/usergoodsclass_del.htm*');
INSERT INTO `shopping_res` VALUES ('427', '2015-02-26 14:59:48', '', null, '新增卖家商品分类', '0', 'URL', '/seller/address_add.htm*');
INSERT INTO `shopping_res` VALUES ('428', '2015-02-26 14:59:48', '', null, '编辑卖家商品分类', '0', 'URL', '/seller/usergoodsclass_edit.htm*');
INSERT INTO `shopping_res` VALUES ('429', '2015-02-26 14:59:49', '', null, '导入淘宝CSV', '0', 'URL', '/seller/taobao_import_csv.htm*');
INSERT INTO `shopping_res` VALUES ('430', '2015-02-26 14:59:49', '', null, '上传淘宝图片', '0', 'URL', '/seller/taobao_img_upload.htm*');
INSERT INTO `shopping_res` VALUES ('431', '2015-02-26 14:59:49', '', null, '淘宝导入完成', '0', 'URL', '/seller/taobao_import_finish.htm*');
INSERT INTO `shopping_res` VALUES ('432', '2015-02-26 14:59:49', '', null, '导入淘宝CSV', '0', 'URL', '/seller/taobao.htm*');
INSERT INTO `shopping_res` VALUES ('433', '2015-02-26 14:59:49', '', null, '卖家订单列表', '0', 'URL', '/seller/order.htm*');
INSERT INTO `shopping_res` VALUES ('434', '2015-02-26 14:59:49', '', null, '卖家订单详情', '0', 'URL', '/seller/order_view.htm*');
INSERT INTO `shopping_res` VALUES ('435', '2015-02-26 14:59:49', '', null, '卖家调整订单费用保存', '0', 'URL', '/seller/order_fee_save.htm*');
INSERT INTO `shopping_res` VALUES ('436', '2015-02-26 14:59:49', '', null, '线下付款确认', '0', 'URL', '/seller/seller_order_outline.htm*');
INSERT INTO `shopping_res` VALUES ('437', '2015-02-26 14:59:49', '', null, '线下付款确认保存', '0', 'URL', '/seller/seller_order_outline_save.htm*');
INSERT INTO `shopping_res` VALUES ('438', '2015-02-26 14:59:50', '', null, '卖家确认发货保存', '0', 'URL', '/seller/order_shipping_save.htm*');
INSERT INTO `shopping_res` VALUES ('439', '2015-02-26 14:59:50', '', null, '卖家修改物流', '0', 'URL', '/seller/order_shipping_code.htm*');
INSERT INTO `shopping_res` VALUES ('440', '2015-02-26 14:59:50', '', null, '卖家修改物流保存', '0', 'URL', '/seller/order_shipping_code_save.htm*');
INSERT INTO `shopping_res` VALUES ('441', '2015-02-26 14:59:50', '', null, '卖家退款保存', '0', 'URL', '/seller/order_refund_save.htm*');
INSERT INTO `shopping_res` VALUES ('442', '2015-02-26 14:59:50', '', null, '卖家退货保存', '0', 'URL', '/seller/order_return_save.htm*');
INSERT INTO `shopping_res` VALUES ('443', '2015-02-26 14:59:50', '', null, '卖家物流详情', '0', 'URL', '/seller/order_query_userinfor.htm*');
INSERT INTO `shopping_res` VALUES ('444', '2015-02-26 14:59:50', '', null, '卖家保存退货申请', '0', 'URL', '/seller/seller_order_return.htm*');
INSERT INTO `shopping_res` VALUES ('445', '2015-02-26 14:59:50', '', null, '确认买家退货', '0', 'URL', '/seller/seller_order_return_confirm.htm*');
INSERT INTO `shopping_res` VALUES ('446', '2015-02-26 14:59:50', '', null, '买家退货物流详情', '0', 'URL', '/seller/seller_order_return_ship_view.htm*');
INSERT INTO `shopping_res` VALUES ('447', '2015-02-26 14:59:50', '', null, '卖家确认发货', '0', 'URL', '/seller/order_shipping.htm*');
INSERT INTO `shopping_res` VALUES ('448', '2015-02-26 14:59:50', '', null, '卖家取消订单保存', '0', 'URL', '/seller/order_cancel_save.htm*');
INSERT INTO `shopping_res` VALUES ('449', '2015-02-26 14:59:51', '', null, '卖家评价', '0', 'URL', '/seller/order_evaluate.htm*');
INSERT INTO `shopping_res` VALUES ('450', '2015-02-26 14:59:51', '', null, '卖家评价保存', '0', 'URL', '/seller/order_evaluate_save.htm*');
INSERT INTO `shopping_res` VALUES ('451', '2015-02-26 14:59:51', '', null, '卖家物流详情', '0', 'URL', '/seller/ship_view.htm*');
INSERT INTO `shopping_res` VALUES ('452', '2015-02-26 14:59:51', '', null, '卖家取消订单', '0', 'URL', '/seller/order_cancel.htm*');
INSERT INTO `shopping_res` VALUES ('453', '2015-02-26 14:59:51', '', null, '卖家调整订单费用', '0', 'URL', '/seller/order_fee.htm*');
INSERT INTO `shopping_res` VALUES ('454', '2015-02-26 14:59:51', '', null, '卖家退款', '0', 'URL', '/seller/order_refund.htm*');
INSERT INTO `shopping_res` VALUES ('455', '2015-02-26 14:59:51', '', null, '卖家退货', '0', 'URL', '/seller/order_return.htm*');
INSERT INTO `shopping_res` VALUES ('456', '2015-02-26 14:59:51', '', null, '打印订单', '0', 'URL', '/seller/order_print.htm*');
INSERT INTO `shopping_res` VALUES ('457', '2015-02-26 14:59:51', '', null, '买家退货申请详情', '0', 'URL', '/seller/seller_order_return_apply_view.htm*');
INSERT INTO `shopping_res` VALUES ('458', '2015-02-26 14:59:51', '', null, '支付方式列表', '0', 'URL', '/seller/payment.htm*');
INSERT INTO `shopping_res` VALUES ('459', '2015-02-26 14:59:52', '', null, '支付方式编辑', '0', 'URL', '/seller/payment_edit.htm*');
INSERT INTO `shopping_res` VALUES ('460', '2015-02-26 14:59:52', '', null, '支付方式保存', '0', 'URL', '/seller/payment_save.htm*');
INSERT INTO `shopping_res` VALUES ('461', '2015-02-26 14:59:52', '', null, '支付方式安装', '0', 'URL', '/seller/payment_install.htm*');
INSERT INTO `shopping_res` VALUES ('462', '2015-02-26 14:59:52', '', null, '支付方式卸载', '0', 'URL', '/seller/payment_uninstall.htm*');
INSERT INTO `shopping_res` VALUES ('463', '2015-02-26 14:59:52', '', null, '卖家运费模板列表', '0', 'URL', '/seller/transport_list.htm*');
INSERT INTO `shopping_res` VALUES ('464', '2015-02-26 14:59:52', '', null, '卖家运费模板编辑', '0', 'URL', '/seller/transport_edit.htm*');
INSERT INTO `shopping_res` VALUES ('465', '2015-02-26 14:59:52', '', null, '卖家运费模板复制', '0', 'URL', '/seller/transport_copy.htm*');
INSERT INTO `shopping_res` VALUES ('466', '2015-02-26 14:59:52', '', null, '卖家运费模板保存', '0', 'URL', '/seller/transport_save.htm*');
INSERT INTO `shopping_res` VALUES ('467', '2015-02-26 14:59:52', '', null, '卖家运费模板保存成功', '0', 'URL', '/seller/transport_success.htm*');
INSERT INTO `shopping_res` VALUES ('468', '2015-02-26 14:59:52', '', null, '卖家运费模板详细信息', '0', 'URL', '/seller/transport_info.htm*');
INSERT INTO `shopping_res` VALUES ('469', '2015-02-26 14:59:53', '', null, '卖家运费模板区域编辑', '0', 'URL', '/seller/transport_area.htm*');
INSERT INTO `shopping_res` VALUES ('470', '2015-02-26 14:59:53', '', null, '卖家运费模板删除', '0', 'URL', '/seller/transport_del.htm*');
INSERT INTO `shopping_res` VALUES ('471', '2015-02-26 14:59:53', '', null, '卖家运费模板添加', '0', 'URL', '/seller/transport_add.htm*');
INSERT INTO `shopping_res` VALUES ('472', '2015-02-26 14:59:53', '', null, '店铺升级', '0', 'URL', '/seller/store_grade.htm*');
INSERT INTO `shopping_res` VALUES ('473', '2015-02-26 14:59:53', '', null, '申请店铺第一步', '0', 'URL', '/seller/store_create_first.htm*');
INSERT INTO `shopping_res` VALUES ('474', '2015-02-26 14:59:53', '', null, '申请店铺第二步', '0', 'URL', '/seller/store_create_second.htm*');
INSERT INTO `shopping_res` VALUES ('475', '2015-02-26 14:59:53', '', null, '申请店铺完成', '0', 'URL', '/seller/store_create_finish.htm*');
INSERT INTO `shopping_res` VALUES ('476', '2015-02-26 14:59:53', '', null, '店铺设置保存', '0', 'URL', '/seller/store_set_save.htm*');
INSERT INTO `shopping_res` VALUES ('477', '2015-02-26 14:59:53', '', null, '店铺地图保存', '0', 'URL', '/seller/store_map_save.htm*');
INSERT INTO `shopping_res` VALUES ('478', '2015-02-26 14:59:54', '', null, '主题设置', '0', 'URL', '/seller/store_theme_save.htm*');
INSERT INTO `shopping_res` VALUES ('479', '2015-02-26 14:59:54', '', null, '店铺认证保存', '0', 'URL', '/seller/store_approve_save.htm*');
INSERT INTO `shopping_res` VALUES ('480', '2015-02-26 14:59:54', '', null, '店铺升级申请完成', '0', 'URL', '/seller/store_grade_finish.htm*');
INSERT INTO `shopping_res` VALUES ('481', '2015-02-26 14:59:54', '', null, '店铺幻灯保存', '0', 'URL', '/seller/store_slide_save.htm*');
INSERT INTO `shopping_res` VALUES ('482', '2015-02-26 14:59:54', '', null, '店铺设置', '0', 'URL', '/seller/store_set.htm*');
INSERT INTO `shopping_res` VALUES ('483', '2015-02-26 14:59:54', '', null, '店铺地图', '0', 'URL', '/seller/store_map.htm*');
INSERT INTO `shopping_res` VALUES ('484', '2015-02-26 14:59:54', '', null, '主题设置', '0', 'URL', '/seller/store_theme.htm*');
INSERT INTO `shopping_res` VALUES ('485', '2015-02-26 14:59:54', '', null, '店铺认证', '0', 'URL', '/seller/store_approve.htm*');
INSERT INTO `shopping_res` VALUES ('486', '2015-02-26 14:59:54', '', null, '店铺幻灯', '0', 'URL', '/seller/store_slide.htm*');
INSERT INTO `shopping_res` VALUES ('487', '2015-02-26 14:59:54', '', null, '子账户列表', '0', 'URL', '/seller/sub_account_list.htm*');
INSERT INTO `shopping_res` VALUES ('488', '2015-02-26 14:59:55', '', null, '子账户添加', '0', 'URL', '/seller/sub_account_add.htm*');
INSERT INTO `shopping_res` VALUES ('489', '2015-02-26 14:59:55', '', null, '子账户编辑', '0', 'URL', '/seller/sub_account_edit.htm*');
INSERT INTO `shopping_res` VALUES ('490', '2015-02-26 14:59:55', '', null, '子账户保存', '0', 'URL', '/seller/sub_account_save.htm*');
INSERT INTO `shopping_res` VALUES ('491', '2015-02-26 14:59:55', '', null, '子账户删除', '0', 'URL', '/seller/sub_account_del.htm*');
INSERT INTO `shopping_res` VALUES ('492', '2015-02-26 14:59:55', '', null, '卖家导航编辑', '0', 'URL', '/seller/store_nav_edit.htm*');
INSERT INTO `shopping_res` VALUES ('493', '2015-02-26 14:59:55', '', null, '卖家导航保存', '0', 'URL', '/seller/store_nav_save.htm*');
INSERT INTO `shopping_res` VALUES ('494', '2015-02-26 14:59:55', '', null, '卖家导航删除', '0', 'URL', '/seller/store_nav_del.htm*');
INSERT INTO `shopping_res` VALUES ('495', '2015-02-26 14:59:55', '', null, '卖家导航添加', '0', 'URL', '/seller/store_nav_add.htm*');
INSERT INTO `shopping_res` VALUES ('496', '2015-02-26 14:59:55', '', null, '卖家导航管理', '0', 'URL', '/seller/store_nav.htm*');
INSERT INTO `shopping_res` VALUES ('497', '2015-02-26 14:59:55', '', null, '卖家合作伙伴添加', '0', 'URL', '/seller/store_partner_add.htm*');
INSERT INTO `shopping_res` VALUES ('498', '2015-02-26 14:59:55', '', null, '卖家合作伙伴编辑', '0', 'URL', '/seller/store_partner_edit.htm*');
INSERT INTO `shopping_res` VALUES ('499', '2015-02-26 14:59:56', '', null, '卖家合作伙伴保存', '0', 'URL', '/seller/store_partner_save.htm*');
INSERT INTO `shopping_res` VALUES ('500', '2015-02-26 14:59:56', '', null, '卖家合作伙伴删除', '0', 'URL', '/seller/store_partner_del.htm*');
INSERT INTO `shopping_res` VALUES ('501', '2015-02-26 14:59:56', '', null, '卖家合作伙伴列表', '0', 'URL', '/seller/store_partner.htm*');
INSERT INTO `shopping_res` VALUES ('502', '2015-02-26 14:59:56', '', null, '卖家退款列表', '0', 'URL', '/seller/refund.htm*');
INSERT INTO `shopping_res` VALUES ('503', '2015-02-26 14:59:56', '', null, '卖家退款列表', '0', 'URL', '/seller/refund_view.htm*');
INSERT INTO `shopping_res` VALUES ('504', '2015-02-26 14:59:56', '', null, '卖家退货列表', '0', 'URL', '/seller/goods_return.htm*');
INSERT INTO `shopping_res` VALUES ('505', '2015-02-26 14:59:56', '', null, '卖家退款列表', '0', 'URL', '/seller/return_view.htm*');
INSERT INTO `shopping_res` VALUES ('506', '2015-02-26 14:59:56', '', null, '卖家查看投诉详情', '0', 'URL', '/seller/complaint_view.htm*');
INSERT INTO `shopping_res` VALUES ('507', '2015-02-26 14:59:56', '', null, '卖家被投诉列表', '0', 'URL', '/seller/complaint.htm*');
INSERT INTO `shopping_res` VALUES ('508', '2015-02-26 14:59:56', '', null, '卖家查看投诉详情', '0', 'URL', '/seller/complaint_appeal.htm*');
INSERT INTO `shopping_res` VALUES ('509', '2015-02-26 14:59:57', '', null, '卖家投诉发起', '0', 'URL', '/seller/complaint_handle.htm*');
INSERT INTO `shopping_res` VALUES ('510', '2015-02-26 14:59:57', '', null, '卖家咨询列表', '0', 'URL', '/seller/consult.htm*');
INSERT INTO `shopping_res` VALUES ('511', '2015-02-26 14:59:57', '', null, '卖家咨询回复保存', '0', 'URL', '/seller/consult_reply_save.htm*');
INSERT INTO `shopping_res` VALUES ('512', '2015-02-26 14:59:57', '', null, '卖家咨询回复', '0', 'URL', '/seller/consult_reply.htm*');
INSERT INTO `shopping_res` VALUES ('513', '2015-02-26 14:59:57', '', null, '卖家咨询删除', '0', 'URL', '/seller/consult_del.htm*');
INSERT INTO `shopping_res` VALUES ('514', '2015-02-26 14:59:57', '', null, '直通车申请列表', '0', 'URL', '/seller/ztc_apply_list.htm*');
INSERT INTO `shopping_res` VALUES ('515', '2015-02-26 14:59:57', '', null, '直通车申请查看', '0', 'URL', '/seller/ztc_apply_view.htm*');
INSERT INTO `shopping_res` VALUES ('516', '2015-02-26 14:59:57', '', null, '直通车申请保存', '0', 'URL', '/seller/ztc_apply_save.htm*');
INSERT INTO `shopping_res` VALUES ('517', '2015-02-26 14:59:57', '', null, '直通车商品加载', '0', 'URL', '/seller/ztc_goods.htm*');
INSERT INTO `shopping_res` VALUES ('518', '2015-02-26 14:59:57', '', null, '直通车申请', '0', 'URL', '/seller/ztc_apply.htm*');
INSERT INTO `shopping_res` VALUES ('519', '2015-02-26 14:59:58', '', null, '直通车商品列表', '0', 'URL', '/seller/ztc_list.htm*');
INSERT INTO `shopping_res` VALUES ('520', '2015-02-26 14:59:58', '', null, '申请参加活动', '0', 'URL', '/seller/activity_apply.htm*');
INSERT INTO `shopping_res` VALUES ('521', '2015-02-26 14:59:58', '', null, '活动商品加载', '0', 'URL', '/seller/activity_goods.htm*');
INSERT INTO `shopping_res` VALUES ('522', '2015-02-26 14:59:58', '', null, '申请参加活动', '0', 'URL', '/seller/activity_apply_save.htm*');
INSERT INTO `shopping_res` VALUES ('523', '2015-02-26 14:59:58', '', null, '活动列表', '0', 'URL', '/seller/activity.htm*');
INSERT INTO `shopping_res` VALUES ('524', '2015-02-26 14:59:58', '', null, '活动商品列表', '0', 'URL', '/seller/activity_goods_list.htm*');
INSERT INTO `shopping_res` VALUES ('525', '2015-02-26 14:59:58', '', null, '卖家团购列表', '0', 'URL', '/seller/group.htm*');
INSERT INTO `shopping_res` VALUES ('526', '2015-02-26 14:59:58', '', null, '卖家团购添加', '0', 'URL', '/seller/group_add.htm*');
INSERT INTO `shopping_res` VALUES ('527', '2015-02-26 14:59:58', '', null, '卖家团购编辑', '0', 'URL', '/seller/group_edit.htm*');
INSERT INTO `shopping_res` VALUES ('528', '2015-02-26 14:59:58', '', null, '团购商品删除', '0', 'URL', '/seller/group_del.htm*');
INSERT INTO `shopping_res` VALUES ('529', '2015-02-26 14:59:58', '', null, '团购商品保存', '0', 'URL', '/seller/group_goods_save.htm*');
INSERT INTO `shopping_res` VALUES ('530', '2015-02-26 14:59:59', '', null, '卖家团购商品', '0', 'URL', '/seller/group_goods.htm*');
INSERT INTO `shopping_res` VALUES ('531', '2015-02-26 14:59:59', '', null, '今日特价', '0', 'URL', '/seller/bargain.htm*');
INSERT INTO `shopping_res` VALUES ('532', '2015-02-26 14:59:59', '', null, '商品保存', '0', 'URL', '/seller/bargain_apply_save.htm*');
INSERT INTO `shopping_res` VALUES ('533', '2015-02-26 14:59:59', '', null, '商品保存成功', '0', 'URL', '/seller/bargain_apply_success.htm*');
INSERT INTO `shopping_res` VALUES ('534', '2015-02-26 14:59:59', '', null, '商品保存失败', '0', 'URL', '/seller/bargain_apply_error.htm*');
INSERT INTO `shopping_res` VALUES ('535', '2015-02-26 14:59:59', '', null, '特价商品列表', '0', 'URL', '/seller/bargain_goods_list.htm*');
INSERT INTO `shopping_res` VALUES ('536', '2015-02-26 14:59:59', '', null, '添加商品', '0', 'URL', '/seller/bargain_goods.htm*');
INSERT INTO `shopping_res` VALUES ('537', '2015-02-26 14:59:59', '', null, '申请今日特价', '0', 'URL', '/seller/bargain_apply.htm*');
INSERT INTO `shopping_res` VALUES ('538', '2015-02-26 15:00:00', '', null, '买就送套餐购买保存', '0', 'URL', '/seller/delivery_buy_save.htm*');
INSERT INTO `shopping_res` VALUES ('539', '2015-02-26 15:00:00', '', null, '买就送套餐购买成功', '0', 'URL', '/seller/delivery_buy_success.htm*');
INSERT INTO `shopping_res` VALUES ('540', '2015-02-26 15:00:00', '', null, '买就送套餐购买失败', '0', 'URL', '/seller/delivery_buy_error.htm*');
INSERT INTO `shopping_res` VALUES ('541', '2015-02-26 15:00:00', '', null, '申请买就送', '0', 'URL', '/seller/delivery_apply.htm*');
INSERT INTO `shopping_res` VALUES ('542', '2015-02-26 15:00:00', '', null, '加载买就送商品', '0', 'URL', '/seller/delivery_goods.htm*');
INSERT INTO `shopping_res` VALUES ('543', '2015-02-26 15:00:00', '', null, '买就送商品保存', '0', 'URL', '/seller/delivery_apply_save.htm*');
INSERT INTO `shopping_res` VALUES ('544', '2015-02-26 15:00:00', '', null, '买就送删除', '0', 'URL', '/seller/delivery_del.htm*');
INSERT INTO `shopping_res` VALUES ('545', '2015-02-26 15:00:00', '', null, '买就送套餐购买', '0', 'URL', '/seller/delivery_buy.htm*');
INSERT INTO `shopping_res` VALUES ('546', '2015-02-26 15:00:00', '', null, '买就送', '0', 'URL', '/seller/delivery.htm*');
INSERT INTO `shopping_res` VALUES ('547', '2015-02-26 15:00:00', '', null, '买就送套餐购买日志', '0', 'URL', '/seller/delivery_log.htm*');
INSERT INTO `shopping_res` VALUES ('548', '2015-02-26 15:00:00', '', null, '金币兑换', '0', 'URL', '/seller/gold_record.htm*');
INSERT INTO `shopping_res` VALUES ('549', '2015-02-26 15:00:01', '', null, '兑换日志', '0', 'URL', '/seller/gold_log.htm*');
INSERT INTO `shopping_res` VALUES ('550', '2015-02-26 15:00:01', '', null, '金币兑换', '0', 'URL', '/seller/gold_record_list.htm*');
INSERT INTO `shopping_res` VALUES ('551', '2015-02-26 15:00:01', '', null, '金币兑换保存', '0', 'URL', '/buyer/gold_record_save.htm*');
INSERT INTO `shopping_res` VALUES ('552', '2015-02-26 15:00:01', '', null, '金币兑换支付', '0', 'URL', '/seller/gold_pay.htm*');
INSERT INTO `shopping_res` VALUES ('553', '2015-02-26 15:00:01', '', null, '金币兑换详情', '0', 'URL', '/seller/gold_view.htm*');
INSERT INTO `shopping_res` VALUES ('554', '2015-02-26 15:00:01', '', null, '广告列表', '0', 'URL', '/seller/advert_list.htm*');
INSERT INTO `shopping_res` VALUES ('555', '2015-02-26 15:00:01', '', null, '广告购买保存', '0', 'URL', '/seller/advert_apply_save.htm*');
INSERT INTO `shopping_res` VALUES ('556', '2015-02-26 15:00:01', '', null, '广告编辑', '0', 'URL', '/seller/advert_apply_edit.htm*');
INSERT INTO `shopping_res` VALUES ('557', '2015-02-26 15:00:01', '', null, '广告购买保存', '0', 'URL', '/seller/advert_delay_save.htm*');
INSERT INTO `shopping_res` VALUES ('558', '2015-02-26 15:00:01', '', null, '我的广告', '0', 'URL', '/seller/advert_my.htm*');
INSERT INTO `shopping_res` VALUES ('559', '2015-02-26 15:00:02', '', null, '广告购买', '0', 'URL', '/seller/advert_apply.htm*');
INSERT INTO `shopping_res` VALUES ('560', '2015-02-26 15:00:02', '', null, '广告延时', '0', 'URL', '/seller/advert_delay.htm*');
INSERT INTO `shopping_res` VALUES ('561', '2015-02-26 15:00:02', '', null, '图片水印保存', '0', 'URL', '/seller/watermark_save.htm*');
INSERT INTO `shopping_res` VALUES ('562', '2015-02-26 15:00:02', '', null, '图片水印', '0', 'URL', '/seller/watermark.htm*');
INSERT INTO `shopping_res` VALUES ('563', '2015-02-26 15:00:02', '', null, '相册列表', '0', 'URL', '/seller/album.htm*');
INSERT INTO `shopping_res` VALUES ('564', '2015-02-26 15:00:02', '', null, '相册转移', '0', 'URL', '/seller/album_transfer.htm*');
INSERT INTO `shopping_res` VALUES ('565', '2015-02-26 15:00:02', '', null, '图片转移相册', '0', 'URL', '/seller/album_transfer_save.htm*');
INSERT INTO `shopping_res` VALUES ('566', '2015-02-26 15:00:02', '', null, '图片转移相册', '0', 'URL', '/seller/album_watermark.htm*');
INSERT INTO `shopping_res` VALUES ('567', '2015-02-26 15:00:02', '', null, '新增相册', '0', 'URL', '/seller/album_add.htm*');
INSERT INTO `shopping_res` VALUES ('568', '2015-02-26 15:00:02', '', null, '图片列表', '0', 'URL', '/seller/album_image.htm*');
INSERT INTO `shopping_res` VALUES ('569', '2015-02-26 15:00:02', '', null, '相册保存', '0', 'URL', '/seller/album_save.htm*');
INSERT INTO `shopping_res` VALUES ('570', '2015-02-26 15:00:03', '', null, '图片上传', '0', 'URL', '/seller/album_upload.htm*');
INSERT INTO `shopping_res` VALUES ('571', '2015-02-26 15:00:03', '', null, '相册封面设置', '0', 'URL', '/seller/album_cover.htm*');
INSERT INTO `shopping_res` VALUES ('572', '2015-02-26 15:00:03', '', null, '新增相册', '0', 'URL', '/seller/album_edit.htm*');
INSERT INTO `shopping_res` VALUES ('573', '2015-02-26 15:00:03', '', null, '相册删除', '0', 'URL', '/seller/album_del.htm*');
INSERT INTO `shopping_res` VALUES ('574', '2015-02-26 15:00:03', '', null, '图片幻灯查看', '0', 'URL', '/seller/image_slide.htm*');
INSERT INTO `shopping_res` VALUES ('575', '2015-02-26 15:00:03', '', null, '相册内图片删除', '0', 'URL', '/seller/album_img_del.htm*');
INSERT INTO `shopping_res` VALUES ('576', '2015-02-26 15:00:03', '', null, '卖家中心', '0', 'URL', '/seller/index.htm*');
INSERT INTO `shopping_res` VALUES ('577', '2015-02-26 15:00:03', '', null, '卖家中心导航', '0', 'URL', '/seller/nav.htm*');
INSERT INTO `shopping_res` VALUES ('578', '2015-02-26 15:00:03', '', null, '卖家中心快捷功能设置', '0', 'URL', '/seller/store_quick_menu.htm*');
INSERT INTO `shopping_res` VALUES ('579', '2015-02-26 15:00:03', '', null, '卖家中心快捷功能设置保存', '0', 'URL', '/seller/store_quick_menu_save.htm*');
INSERT INTO `shopping_res` VALUES ('580', '2015-02-26 15:00:03', '', null, '卖家中心导航', '0', 'URL', '/seller/head.htm*');
INSERT INTO `shopping_res` VALUES ('581', '2015-02-26 15:00:04', '', null, '卖家品牌列表', '0', 'URL', '/seller/usergoodsbrand_list.htm*');
INSERT INTO `shopping_res` VALUES ('582', '2015-02-26 15:00:04', '', null, '卖家品牌申请', '0', 'URL', '/seller/usergoodsbrand_add.htm*');
INSERT INTO `shopping_res` VALUES ('583', '2015-02-26 15:00:04', '', null, '卖家品牌编辑', '0', 'URL', '/seller/usergoodsbrand_edit.htm*');
INSERT INTO `shopping_res` VALUES ('584', '2015-02-26 15:00:04', '', null, '卖家品牌删除', '0', 'URL', '/seller/usergoodsbrand_dele.htm*');
INSERT INTO `shopping_res` VALUES ('585', '2015-02-26 15:00:04', '', null, '卖家品牌保存', '0', 'URL', '/seller/usergoodsbrand_save.htm*');
INSERT INTO `shopping_res` VALUES ('586', '2015-02-26 15:00:04', '', null, '闲置商品列表', '0', 'URL', '/seller/spare_goods.htm*');
INSERT INTO `shopping_res` VALUES ('587', '2015-02-26 15:00:04', '', null, '发布闲置商品', '0', 'URL', '/seller/add_spare_goods.htm*');
INSERT INTO `shopping_res` VALUES ('588', '2015-02-26 15:00:04', '', null, '闲置商品信息编辑', '0', 'URL', '/seller/spare_goods_edit.htm*');
INSERT INTO `shopping_res` VALUES ('589', '2015-02-26 15:00:04', '', null, '闲置商品信息删除', '0', 'URL', '/seller/spare_goods_dele.htm*');
INSERT INTO `shopping_res` VALUES ('590', '2015-02-26 15:00:04', '', null, '闲置商品下架上架操作', '0', 'URL', '/seller/spare_goods_updown.htm*');
INSERT INTO `shopping_res` VALUES ('591', '2015-02-26 15:00:04', '', null, '闲置商品保存', '0', 'URL', '/seller/spare_goods_save.htm*');
INSERT INTO `shopping_res` VALUES ('592', '2015-02-26 15:00:05', '', null, '闲置商品发布页Ajax加载下级地区信息', '0', 'URL', '/seller/sparegoods_area_data.htm*');
INSERT INTO `shopping_res` VALUES ('593', '2015-02-26 15:00:05', '', null, '图片删除', '0', 'URL', '/seller/sparegoods_removeimg.htm*');
INSERT INTO `shopping_res` VALUES ('594', '2015-02-26 15:00:05', '', null, '加载商品', '0', 'URL', '/seller/combin_goods.htm*');
INSERT INTO `shopping_res` VALUES ('595', '2015-02-26 15:00:05', '', null, '组合销售套餐购买保存', '0', 'URL', '/seller/combin_buy_save.htm*');
INSERT INTO `shopping_res` VALUES ('596', '2015-02-26 15:00:05', '', null, '组合销售套餐购买成功', '0', 'URL', '/seller/combin_buy_success.htm*');
INSERT INTO `shopping_res` VALUES ('597', '2015-02-26 15:00:05', '', null, '组合销售套餐购买失败', '0', 'URL', '/seller/combin_buy_error.htm*');
INSERT INTO `shopping_res` VALUES ('598', '2015-02-26 15:00:05', '', null, '组合销售', '0', 'URL', '/seller/combin.htm*');
INSERT INTO `shopping_res` VALUES ('599', '2015-02-26 15:00:05', '', null, '申请组合销售', '0', 'URL', '/seller/combin_apply.htm*');
INSERT INTO `shopping_res` VALUES ('600', '2015-02-26 15:00:05', '', null, '组合销售购买日志', '0', 'URL', '/seller/combin_log.htm*');
INSERT INTO `shopping_res` VALUES ('601', '2015-02-26 15:00:05', '', null, '组合销售保存', '0', 'URL', '/seller/combin_save.htm*');
INSERT INTO `shopping_res` VALUES ('602', '2015-02-26 15:00:06', '', null, '销售组合编辑', '0', 'URL', '/seller/combin_edit.htm*');
INSERT INTO `shopping_res` VALUES ('603', '2015-02-26 15:00:06', '', null, '组合销售删除', '0', 'URL', '/seller/combin_del.htm*');
INSERT INTO `shopping_res` VALUES ('604', '2015-02-26 15:00:06', '', null, '组合销售套餐购买', '0', 'URL', '/seller/combin_buy.htm*');
INSERT INTO `shopping_res` VALUES ('605', '2015-02-26 15:00:06', '', null, '微信商城数据保存', '0', 'URL', '/seller/weixin_store_save.htm*');
INSERT INTO `shopping_res` VALUES ('606', '2015-02-26 15:00:06', '', null, '微信商城', '0', 'URL', '/seller/weixin_store_buy.htm*');
INSERT INTO `shopping_res` VALUES ('607', '2015-02-26 15:00:06', '', null, '微信商城购买保存', '0', 'URL', '/seller/weixin_store_buy_save.htm*');
INSERT INTO `shopping_res` VALUES ('608', '2015-02-26 15:00:06', '', null, '微信商城购买成功', '0', 'URL', '/seller/weixin_store_buy_success.htm*');
INSERT INTO `shopping_res` VALUES ('609', '2015-02-26 15:00:06', '', null, '微信商城购买失败', '0', 'URL', '/seller/weixin_store_buy_error.htm*');
INSERT INTO `shopping_res` VALUES ('610', '2015-02-26 15:00:06', '', null, '微信商城购买日志', '0', 'URL', '/seller/weixin_store_log.htm*');
INSERT INTO `shopping_res` VALUES ('611', '2015-02-26 15:00:06', '', null, '微信商城菜单配置页面', '0', 'URL', '/seller/weixin_store_menu.htm*');
INSERT INTO `shopping_res` VALUES ('612', '2015-02-26 15:00:07', '', null, '微信商城菜单配置', '0', 'URL', '/seller/weixin_store_menu_add.htm*');
INSERT INTO `shopping_res` VALUES ('613', '2015-02-26 15:00:07', '', null, '微信商城菜单保存', '0', 'URL', '/seller/weixin_store_menu_save.htm*');
INSERT INTO `shopping_res` VALUES ('614', '2015-02-26 15:00:07', '', null, '微信商城菜单删除', '0', 'URL', '/seller/weixin_store_menu_delete.htm*');
INSERT INTO `shopping_res` VALUES ('615', '2015-02-26 15:00:07', '', null, '微信菜单创建', '0', 'URL', '/seller/weixin_store_menu_create.htm*');
INSERT INTO `shopping_res` VALUES ('616', '2015-02-26 15:00:07', '', null, '微信商城', '0', 'URL', '/seller/weixin_store.htm*');
INSERT INTO `shopping_res` VALUES ('617', '2015-02-26 15:00:07', '', null, '微信消息', '0', 'URL', '/seller/weixin_msg.htm*');
INSERT INTO `shopping_res` VALUES ('618', '2015-02-26 15:00:07', '', null, '买家中心', '0', 'URL', '/buyer/index.htm*');
INSERT INTO `shopping_res` VALUES ('619', '2015-02-26 15:00:07', '', null, '买家中心导航', '0', 'URL', '/buyer/head.htm*');
INSERT INTO `shopping_res` VALUES ('620', '2015-02-26 15:00:07', '', null, '买家中心导航', '0', 'URL', '/buyer/nav.htm*');
INSERT INTO `shopping_res` VALUES ('621', '2015-02-26 15:00:07', '', null, '删除动态', '0', 'URL', '/buyer/dynamic_del.htm*');
INSERT INTO `shopping_res` VALUES ('622', '2015-02-26 15:00:08', '', null, 'ajax回复保存方法', '0', 'URL', '/buyer/dynamic_ajax_reply.htm*');
INSERT INTO `shopping_res` VALUES ('623', '2015-02-26 15:00:08', '', null, 'ajax赞动态方法', '0', 'URL', '/buyer/dynamic_ajax_praise.htm*');
INSERT INTO `shopping_res` VALUES ('624', '2015-02-26 15:00:08', '', null, 'ajax转发动态保存方法', '0', 'URL', '/buyer/dynamic_ajax_turn.htm*');
INSERT INTO `shopping_res` VALUES ('625', '2015-02-26 15:00:08', '', null, '删除动态下方自己发布的评论', '0', 'URL', '/buyer/dynamic_reply_del.htm*');
INSERT INTO `shopping_res` VALUES ('626', '2015-02-26 15:00:08', '', null, '用户分享收藏店铺列表', '0', 'URL', '/buyer/fav_store_list.htm*');
INSERT INTO `shopping_res` VALUES ('627', '2015-02-26 15:00:08', '', null, '用户分享收藏店铺ajax列表', '0', 'URL', '/buyer/fav_store_list_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('628', '2015-02-26 15:00:08', '', null, '用户分享收藏商品列表', '0', 'URL', '/buyer/fav_goods_list.htm*');
INSERT INTO `shopping_res` VALUES ('629', '2015-02-26 15:00:08', '', null, '用户分享收藏商品ajax列表', '0', 'URL', '/buyer/fav_goods_list_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('630', '2015-02-26 15:00:08', '', null, '动态发布保存', '0', 'URL', '/buyer/dynamic_save.htm*');
INSERT INTO `shopping_res` VALUES ('631', '2015-02-26 15:00:08', '', null, '个人信息获取下级地区ajax', '0', 'URL', '/buyer/account_getAreaChilds.htm*');
INSERT INTO `shopping_res` VALUES ('632', '2015-02-26 15:00:09', '', null, '密码修改', '0', 'URL', '/buyer/account_password.htm*');
INSERT INTO `shopping_res` VALUES ('633', '2015-02-26 15:00:09', '', null, '密码修改保存', '0', 'URL', '/buyer/account_password_save.htm*');
INSERT INTO `shopping_res` VALUES ('634', '2015-02-26 15:00:09', '', null, '邮箱修改保存', '0', 'URL', '/buyer/account_email_save.htm*');
INSERT INTO `shopping_res` VALUES ('635', '2015-02-26 15:00:09', '', null, '图像修改', '0', 'URL', '/buyer/account_avatar.htm*');
INSERT INTO `shopping_res` VALUES ('636', '2015-02-26 15:00:09', '', null, '手机号码修改', '0', 'URL', '/buyer/account_mobile.htm*');
INSERT INTO `shopping_res` VALUES ('637', '2015-02-26 15:00:09', '', null, '手机号码保存', '0', 'URL', '/buyer/account_mobile_save.htm*');
INSERT INTO `shopping_res` VALUES ('638', '2015-02-26 15:00:09', '', null, '手机短信发送', '0', 'URL', '/buyer/account_mobile_sms.htm*');
INSERT INTO `shopping_res` VALUES ('639', '2015-02-26 15:00:09', '', null, '好友管理', '0', 'URL', '/buyer/friend.htm*');
INSERT INTO `shopping_res` VALUES ('640', '2015-02-26 15:00:10', '', null, '好友添加', '0', 'URL', '/buyer/friend_add_save.htm*');
INSERT INTO `shopping_res` VALUES ('641', '2015-02-26 15:00:10', '', null, '账号解除绑定', '0', 'URL', '/buyer/account_bind_cancel.htm*');
INSERT INTO `shopping_res` VALUES ('642', '2015-02-26 15:00:10', '', null, '个人信息导航', '0', 'URL', '/buyer/account_nav.htm*');
INSERT INTO `shopping_res` VALUES ('643', '2015-02-26 15:00:10', '', null, '个人信息', '0', 'URL', '/buyer/account.htm*');
INSERT INTO `shopping_res` VALUES ('644', '2015-02-26 15:00:10', '', null, '个人信息保存', '0', 'URL', '/buyer/account_save.htm*');
INSERT INTO `shopping_res` VALUES ('645', '2015-02-26 15:00:10', '', null, '邮箱修改', '0', 'URL', '/buyer/account_email.htm*');
INSERT INTO `shopping_res` VALUES ('646', '2015-02-26 15:00:10', '', null, '图像上传', '0', 'URL', '/buyer/upload_avatar.htm*');
INSERT INTO `shopping_res` VALUES ('647', '2015-02-26 15:00:10', '', null, '好友添加', '0', 'URL', '/buyer/friend_add.htm*');
INSERT INTO `shopping_res` VALUES ('648', '2015-02-26 15:00:10', '', null, '搜索用户', '0', 'URL', '/buyer/account_friend_search.htm*');
INSERT INTO `shopping_res` VALUES ('649', '2015-02-26 15:00:11', '', null, '好友删除', '0', 'URL', '/buyer/friend_del.htm*');
INSERT INTO `shopping_res` VALUES ('650', '2015-02-26 15:00:11', '', null, '账号绑定', '0', 'URL', '/buyer/account_bind.htm*');
INSERT INTO `shopping_res` VALUES ('651', '2015-02-26 15:00:11', '', null, '站内短信', '0', 'URL', '/buyer/message.htm*');
INSERT INTO `shopping_res` VALUES ('652', '2015-02-26 15:00:11', '', null, '站内短信保存', '0', 'URL', '/buyer/message_save.htm*');
INSERT INTO `shopping_res` VALUES ('653', '2015-02-26 15:00:11', '', null, '站内短信回复', '0', 'URL', '/buyer/message_reply.htm*');
INSERT INTO `shopping_res` VALUES ('654', '2015-02-26 15:00:11', '', null, '站内短信查看', '0', 'URL', '/buyer/message_info.htm*');
INSERT INTO `shopping_res` VALUES ('655', '2015-02-26 15:00:11', '', null, '站内短信发送', '0', 'URL', '/buyer/message_send.htm*');
INSERT INTO `shopping_res` VALUES ('656', '2015-02-26 15:00:11', '', null, '站内短信删除', '0', 'URL', '/buyer/message_del.htm*');
INSERT INTO `shopping_res` VALUES ('657', '2015-02-26 15:00:11', '', null, '收货地址列表', '0', 'URL', '/buyer/address.htm*');
INSERT INTO `shopping_res` VALUES ('658', '2015-02-26 15:00:12', '', null, '新增收货地址', '0', 'URL', '/buyer/address_edit.htm*');
INSERT INTO `shopping_res` VALUES ('659', '2015-02-26 15:00:12', '', null, '收货地址保存', '0', 'URL', '/buyer/address_save.htm*');
INSERT INTO `shopping_res` VALUES ('660', '2015-02-26 15:00:12', '', null, '收货地址删除', '0', 'URL', '/buyer/address_del.htm*');
INSERT INTO `shopping_res` VALUES ('661', '2015-02-26 15:00:12', '', null, '新增收货地址', '0', 'URL', '/buyer/address_add.htm*');
INSERT INTO `shopping_res` VALUES ('662', '2015-02-26 15:00:12', '', null, '用户商品收藏', '0', 'URL', '/buyer/favorite_goods.htm*');
INSERT INTO `shopping_res` VALUES ('663', '2015-02-26 15:00:12', '', null, '用户店铺收藏', '0', 'URL', '/buyer/favorite_store.htm*');
INSERT INTO `shopping_res` VALUES ('664', '2015-02-26 15:00:12', '', null, '用户收藏删除', '0', 'URL', '/buyer/favorite_del.htm*');
INSERT INTO `shopping_res` VALUES ('665', '2015-02-26 15:00:12', '', null, '买家举报列表', '0', 'URL', '/buyer/report.htm*');
INSERT INTO `shopping_res` VALUES ('666', '2015-02-26 15:00:12', '', null, '买家举报商品', '0', 'URL', '/buyer/report_add.htm*');
INSERT INTO `shopping_res` VALUES ('667', '2015-02-26 15:00:12', '', null, '保存买家举报商品', '0', 'URL', '/buyer/report_save.htm*');
INSERT INTO `shopping_res` VALUES ('668', '2015-02-26 15:00:13', '', null, '买家举报详情', '0', 'URL', '/buyer/report_view.htm*');
INSERT INTO `shopping_res` VALUES ('669', '2015-02-26 15:00:13', '', null, '买家取消举报', '0', 'URL', '/buyer/report_cancel.htm*');
INSERT INTO `shopping_res` VALUES ('670', '2015-02-26 15:00:13', '', null, '买家订单列表', '0', 'URL', '/buyer/order.htm*');
INSERT INTO `shopping_res` VALUES ('671', '2015-02-26 15:00:13', '', null, '买家订单详情', '0', 'URL', '/buyer/order_view.htm*');
INSERT INTO `shopping_res` VALUES ('672', '2015-02-26 15:00:13', '', null, '订单取消', '0', 'URL', '/buyer/order_cancel_save.htm*');
INSERT INTO `shopping_res` VALUES ('673', '2015-02-26 15:00:13', '', null, '收货确认保存', '0', 'URL', '/buyer/order_cofirm_save.htm*');
INSERT INTO `shopping_res` VALUES ('674', '2015-02-26 15:00:13', '', null, '买家评价', '0', 'URL', '/buyer/order_evaluate.htm*');
INSERT INTO `shopping_res` VALUES ('675', '2015-02-26 15:00:13', '', null, '买家评价保存', '0', 'URL', '/buyer/order_evaluate_save.htm*');
INSERT INTO `shopping_res` VALUES ('676', '2015-02-26 15:00:13', '', null, '买家物流详情', '0', 'URL', '/buyer/ship_view.htm*');
INSERT INTO `shopping_res` VALUES ('677', '2015-02-26 15:00:14', '', null, '虚拟商品信息', '0', 'URL', '/buyer/order_seller_intro.htm*');
INSERT INTO `shopping_res` VALUES ('678', '2015-02-26 15:00:14', '', null, '买家退货申请', '0', 'URL', '/buyer/order_return_apply.htm*');
INSERT INTO `shopping_res` VALUES ('679', '2015-02-26 15:00:14', '', null, '买家退货申请保存', '0', 'URL', '/buyer/order_return_apply_save.htm*');
INSERT INTO `shopping_res` VALUES ('680', '2015-02-26 15:00:14', '', null, '买家退货物流信息', '0', 'URL', '/buyer/order_return_ship.htm*');
INSERT INTO `shopping_res` VALUES ('681', '2015-02-26 15:00:14', '', null, '买家退货物流信息保存', '0', 'URL', '/buyer/order_return_ship_save.htm*');
INSERT INTO `shopping_res` VALUES ('682', '2015-02-26 15:00:14', '', null, '订单取消', '0', 'URL', '/buyer/order_cancel.htm*');
INSERT INTO `shopping_res` VALUES ('683', '2015-02-26 15:00:14', '', null, '收货确认', '0', 'URL', '/buyer/order_cofirm.htm*');
INSERT INTO `shopping_res` VALUES ('684', '2015-02-26 15:00:14', '', null, '删除订单信息', '0', 'URL', '/buyer/order_delete.htm*');
INSERT INTO `shopping_res` VALUES ('685', '2015-02-26 15:00:14', '', null, '物流跟踪查询', '0', 'URL', '/buyer/query_ship.htm*');
INSERT INTO `shopping_res` VALUES ('686', '2015-02-26 15:00:14', '', null, '买家咨询列表', '0', 'URL', '/buyer/consult.htm*');
INSERT INTO `shopping_res` VALUES ('687', '2015-02-26 15:00:15', '', null, '会员充值', '0', 'URL', '/buyer/predeposit.htm*');
INSERT INTO `shopping_res` VALUES ('688', '2015-02-26 15:00:15', '', null, '会员充值支付', '0', 'URL', '/buyer/predeposit_pay.htm*');
INSERT INTO `shopping_res` VALUES ('689', '2015-02-26 15:00:15', '', null, '会员收入明细', '0', 'URL', '/buyer/predeposit_log.htm*');
INSERT INTO `shopping_res` VALUES ('690', '2015-02-26 15:00:15', '', null, '会员充值列表', '0', 'URL', '/buyer/predeposit_list.htm*');
INSERT INTO `shopping_res` VALUES ('691', '2015-02-26 15:00:15', '', null, '会员充值详情', '0', 'URL', '/buyer/predeposit_view.htm*');
INSERT INTO `shopping_res` VALUES ('692', '2015-02-26 15:00:15', '', null, '会员充值保存', '0', 'URL', '/buyer/predeposit_save.htm*');
INSERT INTO `shopping_res` VALUES ('693', '2015-02-26 15:00:15', '', null, '提现管理保存', '0', 'URL', '/buyer/buyer_cash_save.htm*');
INSERT INTO `shopping_res` VALUES ('694', '2015-02-26 15:00:15', '', null, '提现管理', '0', 'URL', '/buyer/buyer_cash_list.htm*');
INSERT INTO `shopping_res` VALUES ('695', '2015-02-26 15:00:15', '', null, '会员提现详情', '0', 'URL', '/buyer/buyer_cash_view.htm*');
INSERT INTO `shopping_res` VALUES ('696', '2015-02-26 15:00:15', '', null, '提现管理', '0', 'URL', '/buyer/buyer_cash.htm*');
INSERT INTO `shopping_res` VALUES ('697', '2015-02-26 15:00:16', '', null, '投诉图片', '0', 'URL', '/buyer/complaint_img.htm*');
INSERT INTO `shopping_res` VALUES ('698', '2015-02-26 15:00:16', '', null, '买家查看投诉详情', '0', 'URL', '/buyer/complaint_view.htm*');
INSERT INTO `shopping_res` VALUES ('699', '2015-02-26 15:00:16', '', null, '发布投诉对话', '0', 'URL', '/buyer/complaint_talk.htm*');
INSERT INTO `shopping_res` VALUES ('700', '2015-02-26 15:00:16', '', null, '买家投诉发起', '0', 'URL', '/buyer/complaint_handle.htm*');
INSERT INTO `shopping_res` VALUES ('701', '2015-02-26 15:00:16', '', null, '买家投诉列表', '0', 'URL', '/buyer/complaint_save.htm*');
INSERT INTO `shopping_res` VALUES ('702', '2015-02-26 15:00:16', '', null, '买家取消投诉', '0', 'URL', '/buyer/complaint_cancel.htm*');
INSERT INTO `shopping_res` VALUES ('703', '2015-02-26 15:00:16', '', null, '申诉提交仲裁', '0', 'URL', '/buyer/complaint_arbitrate.htm*');
INSERT INTO `shopping_res` VALUES ('704', '2015-02-26 15:00:16', '', null, '买家投诉列表', '0', 'URL', '/buyer/complaint.htm*');
INSERT INTO `shopping_res` VALUES ('705', '2015-02-26 15:00:16', '', null, '积分兑换第一步', '0', 'URL', '/integral_exchange1.htm*');
INSERT INTO `shopping_res` VALUES ('706', '2015-02-26 15:00:16', '', null, '积分兑换第二步', '0', 'URL', '/integral_exchange2.htm*');
INSERT INTO `shopping_res` VALUES ('707', '2015-02-26 15:00:17', '', null, '积分兑换第三步', '0', 'URL', '/integral_exchange3.htm*');
INSERT INTO `shopping_res` VALUES ('708', '2015-02-26 15:00:17', '', null, '积分订单支付', '0', 'URL', '/integral_order_pay.htm*');
INSERT INTO `shopping_res` VALUES ('709', '2015-02-26 15:00:17', '', null, '订单线下支付', '0', 'URL', '/integral_order_pay_outline.htm*');
INSERT INTO `shopping_res` VALUES ('710', '2015-02-26 15:00:17', '', null, '订单预付款支付', '0', 'URL', '/integral_order_pay_balance.htm*');
INSERT INTO `shopping_res` VALUES ('711', '2015-02-26 15:00:17', '', null, '积分订单支付结果', '0', 'URL', '/integral_order_finish.htm*');
INSERT INTO `shopping_res` VALUES ('712', '2015-02-26 15:00:17', '', null, '订单支付详情', '0', 'URL', '/integral_order_pay_view.htm*');
INSERT INTO `shopping_res` VALUES ('713', '2015-02-26 15:00:17', '', null, '买家订单列表', '0', 'URL', '/buyer/integral_order_list.htm*');
INSERT INTO `shopping_res` VALUES ('714', '2015-02-26 15:00:17', '', null, '确认收货', '0', 'URL', '/buyer/integral_order_cofirm.htm*');
INSERT INTO `shopping_res` VALUES ('715', '2015-02-26 15:00:17', '', null, '确认收货保存', '0', 'URL', '/buyer/integral_order_cofirm_save.htm*');
INSERT INTO `shopping_res` VALUES ('716', '2015-02-26 15:00:18', '', null, '积分订单详情', '0', 'URL', '/buyer/integral_order_view.htm*');
INSERT INTO `shopping_res` VALUES ('717', '2015-02-26 15:00:18', '', null, '取消订单', '0', 'URL', '/buyer/integral_order_cancel.htm*');
INSERT INTO `shopping_res` VALUES ('718', '2015-02-26 15:00:18', '', null, '个人主页删除动态', '0', 'URL', '/buyer/homepage_dynamic_del.htm*');
INSERT INTO `shopping_res` VALUES ('719', '2015-02-26 15:00:18', '', null, '个人主页新鲜事加密', '0', 'URL', '/buyer/homepage_dynamic_lock.htm*');
INSERT INTO `shopping_res` VALUES ('720', '2015-02-26 15:00:18', '', null, '个人主页添加关注', '0', 'URL', '/buyer/homepage_add_attention.htm*');
INSERT INTO `shopping_res` VALUES ('721', '2015-02-26 15:00:18', '', null, '个人主页添加关注', '0', 'URL', '/buyer/homepage_remove_attention.htm*');
INSERT INTO `shopping_res` VALUES ('722', '2015-02-26 15:00:18', '', null, '好友列表', '0', 'URL', '/buyer/homepage/myfriends.htm*');
INSERT INTO `shopping_res` VALUES ('723', '2015-02-26 15:00:18', '', null, '关注列表', '0', 'URL', '/buyer/homepage/myattention.htm*');
INSERT INTO `shopping_res` VALUES ('724', '2015-02-26 15:00:19', '', null, '关注列表', '0', 'URL', '/buyer/homepage/myfans.htm*');
INSERT INTO `shopping_res` VALUES ('725', '2015-02-26 15:00:19', '', null, '最近访客', '0', 'URL', '/buyer/homepage_visit.htm*');
INSERT INTO `shopping_res` VALUES ('726', '2015-02-26 15:00:19', '', null, '删除访客ajax', '0', 'URL', '/buyer/homepage_visit_dele.htm*');
INSERT INTO `shopping_res` VALUES ('727', '2015-02-26 15:00:19', '', null, '查询已经购买宝贝和已经收藏宝贝', '0', 'URL', '/buyer/homepage_query_goods.htm*');
INSERT INTO `shopping_res` VALUES ('728', '2015-02-26 15:00:19', '', null, '查询已经收藏店铺', '0', 'URL', '/buyer/homepage_query_stores.htm*');
INSERT INTO `shopping_res` VALUES ('729', '2015-02-26 15:00:19', '', null, '查询已关注店铺ajax分页', '0', 'URL', '/buyer/homepage_query_stores_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('730', '2015-02-26 15:00:19', '', null, '个人主页添加关注', '0', 'URL', '/buyer/homepage_goods_url_add.htm*');
INSERT INTO `shopping_res` VALUES ('731', '2015-02-26 15:00:20', '', null, '查询收藏宝贝ajax分页', '0', 'URL', '/buyer/homepage_query_goods_favorite_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('732', '2015-02-26 15:00:20', '', null, '查询已经购买宝贝ajax分页', '0', 'URL', '/buyer/homepage_query_goods_order_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('733', '2015-02-26 15:00:20', '', null, '个人主页', '0', 'URL', '/buyer/homepage.htm*');
INSERT INTO `shopping_res` VALUES ('734', '2015-02-26 15:00:20', '', null, '个人主页头部', '0', 'URL', '/buyer/homepage_head.htm*');
INSERT INTO `shopping_res` VALUES ('735', '2015-02-26 15:00:20', '', null, '买家优惠券列表', '0', 'URL', '/buyer/coupon.htm*');
INSERT INTO `shopping_res` VALUES ('736', '2015-02-26 15:00:20', '', null, '微信用户惠券列表', '0', 'URL', '/weixin/buyer/coupon.htm*');
INSERT INTO `shopping_res` VALUES ('737', '2015-02-26 15:00:21', '', null, '用户中心', '0', 'URL', '/weixin/buyer/account.htm*');
INSERT INTO `shopping_res` VALUES ('738', '2015-02-26 15:00:21', '', null, '微信用户我的收藏', '0', 'URL', '/weixin/buyer/favorite_goods.htm*');
INSERT INTO `shopping_res` VALUES ('739', '2015-02-26 15:00:21', '', null, '微信用户我的收藏', '0', 'URL', '/weixin/buyer/favorite_goods_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('740', '2015-02-26 15:00:21', '', null, '微信用户惠券列表ajax加载', '0', 'URL', '/weixin/buyer/coupon_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('741', '2015-02-26 15:00:21', '', null, '微信用户收货地址', '0', 'URL', '/weixin/buyer/address.htm*');
INSERT INTO `shopping_res` VALUES ('742', '2015-02-26 15:00:21', '', null, '收货地址添加', '0', 'URL', '/weixin/buyer/address_add.htm*');
INSERT INTO `shopping_res` VALUES ('743', '2015-02-26 15:00:21', '', null, '收货地址编辑', '0', 'URL', '/weixin/buyer/address_edit.htm*');
INSERT INTO `shopping_res` VALUES ('744', '2015-02-26 15:00:21', '', null, '收货地址保存', '0', 'URL', '/weixin/buyer/address_save.htm*');
INSERT INTO `shopping_res` VALUES ('745', '2015-02-26 15:00:21', '', null, '收货地址删除', '0', 'URL', '/weixin/buyer/address_del.htm*');
INSERT INTO `shopping_res` VALUES ('746', '2015-02-26 15:00:22', '', null, '订单列表', '0', 'URL', '/weixin/buyer/order.htm*');
INSERT INTO `shopping_res` VALUES ('747', '2015-02-26 15:00:22', '', null, '订单列表ajax加载', '0', 'URL', '/weixin/buyer/order_ajax.htm*');
INSERT INTO `shopping_res` VALUES ('748', '2015-02-26 15:00:22', '', null, '订单详情', '0', 'URL', '/weixin/buyer/order_view.htm*');
INSERT INTO `shopping_res` VALUES ('749', '2015-02-26 15:00:22', '', null, '订单取消', '0', 'URL', '/weixin/buyer/order_cancel.htm*');
INSERT INTO `shopping_res` VALUES ('750', '2015-02-26 15:00:22', '', null, '订单取消', '0', 'URL', '/weixin/buyer/order_cancel_save.htm*');
INSERT INTO `shopping_res` VALUES ('751', '2015-02-26 15:00:22', '', null, '收货确认保存', '0', 'URL', '/weixin/buyer/order_cofirm_save.htm*');
INSERT INTO `shopping_res` VALUES ('752', '2015-02-26 15:00:22', '', null, '买家评价', '0', 'URL', '/weixin/buyer/order_evaluate.htm*');
INSERT INTO `shopping_res` VALUES ('753', '2015-02-26 15:00:22', '', null, '买家评价保存', '0', 'URL', '/weixin/buyer/order_evaluate_save.htm*');
INSERT INTO `shopping_res` VALUES ('754', '2015-02-26 15:00:22', '', null, '订单列表', '0', 'URL', '/weixin/buyer/ship_view.htm*');
INSERT INTO `shopping_res` VALUES ('755', '2015-02-26 15:00:22', '', null, '订单支付详情', '0', 'URL', '/order_pay_view.htm*');
INSERT INTO `shopping_res` VALUES ('756', '2015-02-26 15:00:23', '', null, '订单线下支付', '0', 'URL', '/order_pay_outline.htm*');
INSERT INTO `shopping_res` VALUES ('757', '2015-02-26 15:00:23', '', null, '订单货到付款', '0', 'URL', '/order_pay_payafter.htm*');
INSERT INTO `shopping_res` VALUES ('758', '2015-02-26 15:00:23', '', null, '订单预付款支付', '0', 'URL', '/order_pay_balance.htm*');
INSERT INTO `shopping_res` VALUES ('759', '2015-02-26 15:00:23', '', null, '购物车中收货地址保存', '0', 'URL', '/cart_address_save.htm*');
INSERT INTO `shopping_res` VALUES ('760', '2015-02-26 15:00:23', '', null, '订单支付结果', '0', 'URL', '/order_finish.htm*');
INSERT INTO `shopping_res` VALUES ('761', '2015-02-26 15:00:23', '', null, '订单支付', '0', 'URL', '/order_pay.htm*');
INSERT INTO `shopping_res` VALUES ('762', '2015-02-26 15:00:23', '', null, '查看购物车', '0', 'URL', '/goods_cart1.htm*');
INSERT INTO `shopping_res` VALUES ('763', '2015-02-26 15:00:23', '', null, '确认购物车填写地址', '0', 'URL', '/goods_cart2.htm*');
INSERT INTO `shopping_res` VALUES ('764', '2015-02-26 15:00:23', '', null, '完成订单提交进入支付', '0', 'URL', '/goods_cart3.htm*');
INSERT INTO `shopping_res` VALUES ('765', '2015-02-26 15:00:23', '', null, '地址新增', '0', 'URL', '/cart_address.htm*');
INSERT INTO `shopping_res` VALUES ('766', '2015-02-26 15:00:24', '', null, '地址切换', '0', 'URL', '/order_address.htm*');
INSERT INTO `shopping_res` VALUES ('767', '2015-02-26 15:00:24', '', null, '购物车中收货地址保存', '0', 'URL', '/weixin/cart_address_save.htm*');
INSERT INTO `shopping_res` VALUES ('768', '2015-02-26 15:00:24', '', null, '查看购物车', '0', 'URL', '/weixin/goods_cart1.htm*');
INSERT INTO `shopping_res` VALUES ('769', '2015-02-26 15:00:24', '', null, '确认购物车填写地址', '0', 'URL', '/weixin/goods_cart2.htm*');
INSERT INTO `shopping_res` VALUES ('770', '2015-02-26 15:00:24', '', null, '完成订单提交进入支付', '0', 'URL', '/weixin/goods_cart3.htm*');
INSERT INTO `shopping_res` VALUES ('771', '2015-02-26 15:00:24', '', null, '订单支付详情', '0', 'URL', '/weixin/order_pay_view.htm*');
INSERT INTO `shopping_res` VALUES ('772', '2015-02-26 15:00:24', '', null, '订单支付', '0', 'URL', '/weixin/order_pay.htm*');
INSERT INTO `shopping_res` VALUES ('773', '2015-02-26 15:00:24', '', null, '订单线下支付', '0', 'URL', '/weixin/order_pay_outline.htm*');
INSERT INTO `shopping_res` VALUES ('774', '2015-02-26 15:00:24', '', null, '订单预付款支付', '0', 'URL', '/weixin/order_pay_balance.htm*');
INSERT INTO `shopping_res` VALUES ('775', '2015-02-26 15:00:25', '', null, '订单货到付款', '0', 'URL', '/weixin/order_pay_payafter.htm*');
INSERT INTO `shopping_res` VALUES ('776', '2015-02-26 15:00:25', '', null, '订单支付结果', '0', 'URL', '/weixin/order_finish.htm*');
INSERT INTO `shopping_res` VALUES ('777', '2015-02-26 15:00:25', '', null, '地址新增', '0', 'URL', '/weixin/cart_address.htm*');
INSERT INTO `shopping_res` VALUES ('778', '2015-02-26 15:00:25', '', null, '地址切换', '0', 'URL', '/weixin/order_address.htm*');

-- ----------------------------
-- Table structure for `shopping_return_gsp`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_return_gsp`;
CREATE TABLE `shopping_return_gsp` (
  `item_id` bigint(20) NOT NULL,
  `gsp_id` bigint(20) NOT NULL,
  KEY `FK199D8ACF8468FF8` (`item_id`),
  KEY `FK199D8AC2F8BE734` (`gsp_id`),
  CONSTRAINT `FK199D8AC2F8BE734` FOREIGN KEY (`gsp_id`) REFERENCES `shopping_goodsspecproperty` (`id`),
  CONSTRAINT `FK199D8ACF8468FF8` FOREIGN KEY (`item_id`) REFERENCES `shopping_goods_returnitem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_return_gsp
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_role`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_role`;
CREATE TABLE `shopping_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `display` bit(1) NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `roleCode` varchar(255) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `rg_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9DBEE8ED10A75EE6` (`rg_id`),
  CONSTRAINT `FK9DBEE8ED10A75EE6` FOREIGN KEY (`rg_id`) REFERENCES `shopping_rolegroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_role
-- ----------------------------
INSERT INTO `shopping_role` VALUES ('1', '2015-02-26 14:59:21', '', '', null, 'ROLE_ADMIN_INDEX', '商城后台管理', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('2', '2015-02-26 14:59:09', '', '', null, 'ROLE_ADMIN_SET_SITE', '站点设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('3', '2015-02-26 14:59:09', '', '', null, 'ROLE_ADMIN_SET_IMAGE', '上传设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('4', '2015-02-26 14:59:09', '', '', null, 'ROLE_ADMIN_SET_EMAIL', 'Email设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('5', '2015-02-26 14:59:09', '', '', null, 'ROLE_ADMIN_SET_SMS', '短信设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('6', '2015-02-26 14:59:09', '', '', null, 'ROLE_ADMIN_SET_SEO', 'SEO设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('7', '2015-02-26 14:59:10', '', '', null, 'ROLE_ADMIN_SET_SECOND_DOMAIN', '二级域名设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('8', '2015-02-26 14:59:10', '', '', null, 'ROLE_ADMIN_SET_FENRUN', '分润管理', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('9', '2015-02-26 14:59:10', '', '', null, 'ROLE_ADMIN_CONFIG_SAVE', '保存商城配置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('10', '2015-02-26 14:59:10', '', '', null, 'ROLE_ADMIN_SET_WEBSITECSS', 'Email设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('11', '2015-02-26 14:59:10', '', '', null, 'ROLE_PAYMENT_SET', '支付方式', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('12', '2015-02-26 14:59:11', '', '', null, 'ROLE_TEMPLATE_SET', '通知模板', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('13', '2015-02-26 14:59:11', '', '', null, 'ROLE_ADMIN_AREA_SET', '常用地区', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('14', '2015-02-26 14:59:12', '', '', null, 'ROLE_ADMIN_TRANS_AREA', '运费区域', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('15', '2015-02-26 14:59:12', '', '', null, 'ROLE_ADMIN_GOODS', '商品管理', '0', 'ADMIN', '2');
INSERT INTO `shopping_role` VALUES ('16', '2015-02-26 14:59:36', '', '', null, 'ROLE_GOODS_CLASS', '分类管理', '0', 'ADMIN', '2');
INSERT INTO `shopping_role` VALUES ('17', '2015-02-26 14:59:14', '', '', null, 'ROLE_GOODS_BRAND', '品牌管理', '0', 'ADMIN', '2');
INSERT INTO `shopping_role` VALUES ('18', '2015-02-26 14:59:14', '', '', null, 'ROLE_GOODS_TYPE', '类型管理', '0', 'ADMIN', '2');
INSERT INTO `shopping_role` VALUES ('19', '2015-02-26 14:59:15', '', '', null, 'ROLE_GOODS_SPEC', '规格管理', '0', 'ADMIN', '2');
INSERT INTO `shopping_role` VALUES ('20', '2015-02-26 14:59:15', '', '', null, 'ROLE_SPAREGOODS_ADMIN', '闲置商品', '0', 'ADMIN', '3');
INSERT INTO `shopping_role` VALUES ('21', '2015-02-26 14:59:16', '', '', null, 'ROLE_SPAREGOODS_CLASS_ADMIN', '闲置分类', '0', 'ADMIN', '3');
INSERT INTO `shopping_role` VALUES ('22', '2015-02-26 14:59:18', '', '', null, 'ROLE_ADMIN_STORE_SET', '店铺管理', '0', 'ADMIN', '4');
INSERT INTO `shopping_role` VALUES ('23', '2015-02-26 14:59:17', '', '', null, 'ROLE_ADMIN_STORE_BASE', '基本设置', '0', 'ADMIN', '4');
INSERT INTO `shopping_role` VALUES ('24', '2015-02-26 14:59:17', '', '', null, 'ROLE_ADMIN_STORE_TEMPLATE', '店铺模板', '0', 'ADMIN', '4');
INSERT INTO `shopping_role` VALUES ('25', '2015-02-26 14:59:18', '', '', null, 'ROLE_STORE_GRADE', '店铺等级', '0', 'ADMIN', '4');
INSERT INTO `shopping_role` VALUES ('26', '2015-02-26 14:59:19', '', '', null, 'ROLE_STORE_CLASS', '店铺分类', '0', 'ADMIN', '4');
INSERT INTO `shopping_role` VALUES ('27', '2015-02-26 14:59:44', '', '', null, 'ROLE_USER_MANAGE', '会员管理', '0', 'ADMIN', '5');
INSERT INTO `shopping_role` VALUES ('28', '2015-02-26 14:59:19', '', '', null, 'ROLE_USER_CREDITRULE', '会员信用', '0', 'ADMIN', '5');
INSERT INTO `shopping_role` VALUES ('29', '2015-02-26 14:59:20', '', '', null, 'ROLE_USER_MSG', '会员通知', '0', 'ADMIN', '5');
INSERT INTO `shopping_role` VALUES ('30', '2015-02-26 14:59:20', '', '', null, 'ROLE_PREDEPOSIT', '预存款管理', '0', 'ADMIN', '5');
INSERT INTO `shopping_role` VALUES ('31', '2015-02-26 14:59:21', '', '', null, 'ROLE_ADMIN_MANAGE', '管理员管理', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('32', '2015-02-26 14:59:21', '', '', null, 'ROLE_ORDER_ADMIN', '订单管理', '0', 'ADMIN', '6');
INSERT INTO `shopping_role` VALUES ('33', '2015-02-26 14:59:21', '', '', null, 'ROLE_SET_ORDER_CONFIRM', '订单设置', '0', 'ADMIN', '6');
INSERT INTO `shopping_role` VALUES ('34', '2015-02-26 14:59:22', '', '', null, 'ROLE_CONSULT_ADMIN', '咨询管理', '0', 'ADMIN', '6');
INSERT INTO `shopping_role` VALUES ('35', '2015-02-26 14:59:23', '', '', null, 'ROLE_REPORT_MANAGE', '举报管理', '0', 'ADMIN', '6');
INSERT INTO `shopping_role` VALUES ('36', '2015-02-26 14:59:23', '', '', null, 'ROLE_EVALUATE_ADMIN', '商品评价', '0', 'ADMIN', '6');
INSERT INTO `shopping_role` VALUES ('37', '2015-02-26 14:59:24', '', '', null, 'ROLE_COMPLAINT_MANAGE', '投诉管理', '0', 'ADMIN', '6');
INSERT INTO `shopping_role` VALUES ('38', '2015-02-26 14:59:25', '', '', null, 'ROLE_ARTICLE', '文章管理', '0', 'ADMIN', '7');
INSERT INTO `shopping_role` VALUES ('39', '2015-02-26 14:59:26', '', '', null, 'ROLE_ARTICLE_CLASS', '文章分类', '0', 'ADMIN', '7');
INSERT INTO `shopping_role` VALUES ('40', '2015-02-26 14:59:26', '', '', null, 'ROLE_PARTNER_MANAGE', '合作伙伴', '0', 'ADMIN', '7');
INSERT INTO `shopping_role` VALUES ('41', '2015-02-26 14:59:27', '', '', null, 'ROLE_DOCUMENT_MANAGE', '系统文章', '0', 'ADMIN', '7');
INSERT INTO `shopping_role` VALUES ('42', '2015-02-26 14:59:27', '', '', null, 'ROLE_NAV_MANAGE', '页面导航', '0', 'ADMIN', '7');
INSERT INTO `shopping_role` VALUES ('43', '2015-02-26 14:59:28', '', '', null, 'ROLE_OPERATION_BASE', '基本设置', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('44', '2015-02-26 14:59:28', '', '', null, 'ROLE_INTEGRAL_RULE', '积分规则', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('45', '2015-02-26 14:59:28', '', '', null, 'ROLE_GOLD_RECORD_ADMIN', '金币管理', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('46', '2015-02-26 14:59:29', '', '', null, 'ROLE_USER_INTEGRAL', '积分明细', '0', 'ADMIN', '5');
INSERT INTO `shopping_role` VALUES ('47', '2015-02-26 14:59:30', '', '', null, 'ROLE_ZTC_SET', '竞价直通车', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('48', '2015-02-26 14:59:30', '', '', null, 'ROLE_COUPON_ADMIN', '优惠券管理', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('49', '2015-02-26 14:59:32', '', '', null, 'ROLE_ADVERT_ADMIN', '广告管理', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('50', '2015-02-26 14:59:33', '', '', null, 'ROLE_INTEGRAL_GOODS_ADMIN', '积分商城', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('51', '2015-02-26 14:59:36', '', '', null, 'ROLE_GROUP_ADMIN', '团购管理', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('52', '2015-02-26 14:59:38', '', '', null, 'ROLE_GOODS_FLOOR', '首页楼层', '0', 'ADMIN', '2');
INSERT INTO `shopping_role` VALUES ('53', '2015-02-26 14:59:39', '', '', null, 'ROLE_DATA_MANAGE', '数据库管理', '0', 'ADMIN', '9');
INSERT INTO `shopping_role` VALUES ('54', '2015-02-26 14:59:39', '', '', null, 'ROLE_CACHE_MANAGE', '更新缓存', '0', 'ADMIN', '9');
INSERT INTO `shopping_role` VALUES ('55', '2015-02-26 14:59:39', '', '', null, 'ROLE_LUENCE_MANAGE', '全文检索', '0', 'ADMIN', '9');
INSERT INTO `shopping_role` VALUES ('56', '2015-02-26 14:59:40', '', '', null, 'ROLE_ACTIVITY_ADMIN', '活动管理', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('57', '2015-02-26 14:59:41', '', '', null, 'ROLE_BARGAIN_ADMIN', '天天特价', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('58', '2015-02-26 14:59:42', '', '', null, 'ROLE_DELIVERY_ADMIN', '买就送', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('59', '2015-02-26 14:59:42', '', '', null, 'ROLE_ADMIN_SET_KUAIDI', '快递设置', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('60', '2015-02-26 14:59:42', '', '', null, 'ROLE_ADMIN_EXPRESS_COMPANY', '快递公司', '0', 'ADMIN', '1');
INSERT INTO `shopping_role` VALUES ('61', '2015-02-26 14:59:43', '', '', null, 'ROLE_ADMIN_BBS', 'UC整合', '0', 'ADMIN', '9');
INSERT INTO `shopping_role` VALUES ('62', '2015-02-26 14:59:43', '', '', null, 'ROLE_SPAREGOODSFLOOR_ADMIN', '闲置楼层', '0', 'ADMIN', '3');
INSERT INTO `shopping_role` VALUES ('63', '2015-02-26 14:59:46', '', '', null, 'ROLE_COMBIN_ADMIN', '组合销售', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('64', '2015-02-26 14:59:47', '', '', null, 'ROLE_WEIXIN_ADMIN', '微信店铺', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('65', '2015-02-26 14:59:45', '', '', null, 'ROLE_ADMIN_WEIXIN_GOODS', '微信商品', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('66', '2015-02-26 14:59:46', '', '', null, 'ROLE_ADMIN_WEIXIN_BRAND', '微信品牌', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('67', '2015-02-26 14:59:46', '', '', null, 'ROLE_WEIXIN_PLAT_ADMIN', '微商城配置', '0', 'ADMIN', '8');
INSERT INTO `shopping_role` VALUES ('68', '2015-02-26 14:59:47', '', '', null, 'ROLE_GOODS_LIST_SELLER', '出售中的商品', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('69', '2015-02-26 14:59:47', '', '', null, 'ROLE_GOODS_EDIT_SELLER', '商品编辑', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('70', '2015-02-26 14:59:47', '', '', null, 'ROLE_GOODS_DEL_SELLER', '商品删除', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('71', '2015-02-26 14:59:48', '', '', null, 'ROLE_GOODS_SELLER', '商品发布', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('72', '2015-02-26 14:59:48', '', '', null, 'ROLE_GOODS_STORAGE_SELLER', '仓库中的商品', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('73', '2015-02-26 14:59:48', '', '', null, 'ROLE_GOODS_OUT_SELLER', '违规下架商品', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('74', '2015-02-26 14:59:48', '', '', null, 'ROLE_GOODS_SALE_SELLER', '商品上下架', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('75', '2015-02-26 14:59:48', '', '', null, 'ROLE_GOODS_REPORT_SELLER', '被举报禁售商品', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('76', '2015-02-26 14:59:48', '', '', null, 'ROLE_USERGOODSCLASS_SELLER', '商品分类', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('77', '2015-02-26 14:59:49', '', '', null, 'ROLE_TAOBAO_SELLER', '淘宝导入', '0', 'SELLER', '11');
INSERT INTO `shopping_role` VALUES ('78', '2015-02-26 14:59:51', '', '', null, 'ROLE_ORDER_SELLER', '订单管理', '0', 'SELLER', '12');
INSERT INTO `shopping_role` VALUES ('79', '2015-02-26 14:59:52', '', '', null, 'ROLE_PAYMENT_SELLER', '支付方式', '0', 'SELLER', '12');
INSERT INTO `shopping_role` VALUES ('80', '2015-02-26 14:59:53', '', '', null, 'ROLE_TRANSPORT_SELLER', '物流工具', '0', 'SELLER', '12');
INSERT INTO `shopping_role` VALUES ('81', '2015-02-26 14:59:54', '', '', null, 'ROLE_STORE_SET_SELLER', '店铺设置', '0', 'SELLER', '13');
INSERT INTO `shopping_role` VALUES ('82', '2015-02-26 14:59:53', '', '', null, 'ROLE_CREATE_STORE', '申请店铺', '0', 'BUYER', '14');
INSERT INTO `shopping_role` VALUES ('83', '2015-02-26 14:59:54', '', '', null, 'ROLE_STORE_THEME_SELLER', '主题设置', '0', 'SELLER', '13');
INSERT INTO `shopping_role` VALUES ('84', '2015-02-26 14:59:55', '', '', null, 'ROLE_SUB_ACCOUNT_SELLER', '子账户管理', '0', 'SELLER', '13');
INSERT INTO `shopping_role` VALUES ('85', '2015-02-26 14:59:55', '', '', null, 'ROLE_STORE_NAV', '导航管理', '0', 'SELLER', '13');
INSERT INTO `shopping_role` VALUES ('86', '2015-02-26 14:59:55', '', '', null, 'ROLE_STORE_NAV_SELLER', '导航管理', '0', 'SELLER', '13');
INSERT INTO `shopping_role` VALUES ('87', '2015-02-26 14:59:56', '', '', null, 'ROLE_STORE_PARTNER_SELLER', '友情链接', '0', 'SELLER', '13');
INSERT INTO `shopping_role` VALUES ('88', '2015-02-26 14:59:56', '', '', null, 'ROLE_REFUND_SELLER', '退款管理', '0', 'SELLER', '15');
INSERT INTO `shopping_role` VALUES ('89', '2015-02-26 14:59:56', '', '', null, 'ROLE_GOODS_RETURN_SELLER', '退货管理', '0', 'SELLER', '15');
INSERT INTO `shopping_role` VALUES ('90', '2015-02-26 14:59:57', '', '', null, 'ROLE_COMPLAINT_SELLER', '投诉管理', '0', 'SELLER', '15');
INSERT INTO `shopping_role` VALUES ('91', '2015-02-26 14:59:57', '', '', null, 'ROLE_CONSULT_SELLER', '咨询管理', '0', 'SELLER', '15');
INSERT INTO `shopping_role` VALUES ('92', '2015-02-26 14:59:58', '', '', null, 'ROLE_ZTC_SELLER', '竞价直通车', '0', 'SELLER', '16');
INSERT INTO `shopping_role` VALUES ('93', '2015-02-26 14:59:58', '', '', null, 'ROLE_ACTIVITY_SELLER', '活动管理', '0', 'SELLER', '16');
INSERT INTO `shopping_role` VALUES ('94', '2015-02-26 14:59:59', '', '', null, 'ROLE_GROUP_SELLER', '团购管理', '0', 'SELLER', '16');
INSERT INTO `shopping_role` VALUES ('95', '2015-02-26 14:59:59', '', '', null, 'ROLE_BARGAIN_SELLER', '今日特价', '0', 'SELLER', '16');
INSERT INTO `shopping_role` VALUES ('96', '2015-02-26 15:00:00', '', '', null, 'ROLE_DELIVERY_SELLER', '买就送', '0', 'SELLER', '16');
INSERT INTO `shopping_role` VALUES ('97', '2015-02-26 15:00:01', '', '', null, 'ROLE_GOLD_SELLER', '金币管理', '0', 'SELLER', '17');
INSERT INTO `shopping_role` VALUES ('98', '2015-02-26 15:00:02', '', '', null, 'ROLE_ADVERT_SELLER', '广告管理', '0', 'SELLER', '17');
INSERT INTO `shopping_role` VALUES ('99', '2015-02-26 15:00:03', '', '', null, 'ROLE_ALBUM_SELLER', '图片管理', '0', 'SELLER', '17');
INSERT INTO `shopping_role` VALUES ('100', '2015-02-26 15:00:20', '', '', null, 'ROLE_USER_CENTER', '卖家中心', '0', 'BUYER', '18');
INSERT INTO `shopping_role` VALUES ('101', '2015-02-26 15:00:03', '', '', null, 'ROLE_USER_CENTER_SELLER', '用户中心', '0', 'SELLER', '18');
INSERT INTO `shopping_role` VALUES ('102', '2015-02-26 15:00:04', '', '', null, 'ROLE_USERGOODSBRAND_SELLER', '品牌申请', '0', 'SELLER', '10');
INSERT INTO `shopping_role` VALUES ('103', '2015-02-26 15:00:06', '', '', null, 'ROLE_COMBIN_SELLER', '组合销售', '0', 'SELLER', '16');
INSERT INTO `shopping_role` VALUES ('104', '2015-02-26 15:00:07', '', '', null, 'ROLE_WEIXIN_STORE_SELLER', '微信商城', '0', 'SELLER', '19');
INSERT INTO `shopping_role` VALUES ('105', '2015-02-26 15:00:16', '', '', null, 'ROLE_PREDEPOSIT_SET', '预存款管理', '0', 'BUYER', '18');
INSERT INTO `shopping_role` VALUES ('106', '2015-02-26 15:00:17', '', '', null, 'ROLE_INTEGRAL_EXCHANGE', '积分兑换', '0', 'BUYER', '20');
INSERT INTO `shopping_role` VALUES ('107', '2015-02-26 15:00:24', '', '', null, 'ROLE_GOODS_CART', '购物流程3', '0', 'BUYER', '21');
INSERT INTO `shopping_role` VALUES ('108', '2015-02-26 15:00:22', '', '', null, 'ROLE_WEIXIN_USER_CENTER', '微信用户中心', '0', 'BUYER', '22');
INSERT INTO `shopping_role` VALUES ('109', '2015-02-26 15:00:25', '', '', null, 'ROLE_WEIXIN_GOODS_CART', '微信购物流程3', '0', 'BUYER', '23');

-- ----------------------------
-- Table structure for `shopping_rolegroup`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_rolegroup`;
CREATE TABLE `shopping_rolegroup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_rolegroup
-- ----------------------------
INSERT INTO `shopping_rolegroup` VALUES ('1', '2015-02-26 14:59:09', '', '设置', '0', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('2', '2015-02-26 14:59:12', '', '商品', '5', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('3', '2015-02-26 14:59:15', '', '闲置', '10', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('4', '2015-02-26 14:59:16', '', '店铺', '11', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('5', '2015-02-26 14:59:19', '', '会员', '14', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('6', '2015-02-26 14:59:21', '', '交易', '18', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('7', '2015-02-26 14:59:24', '', '网站', '26', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('8', '2015-02-26 14:59:27', '', '运营', '31', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('9', '2015-02-26 14:59:38', '', '工具', '43', 'ADMIN');
INSERT INTO `shopping_rolegroup` VALUES ('10', '2015-02-26 14:59:47', '', '商品管理', '58', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('11', '2015-02-26 14:59:49', '', '淘宝管理', '60', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('12', '2015-02-26 14:59:49', '', '交易管理', '61', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('13', '2015-02-26 14:59:53', '', '店铺设置', '64', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('14', '2015-02-26 14:59:53', '', '申请店铺', '64', 'BUYER');
INSERT INTO `shopping_rolegroup` VALUES ('15', '2015-02-26 14:59:56', '', '客户服务', '68', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('16', '2015-02-26 14:59:57', '', '促销管理', '73', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('17', '2015-02-26 15:00:01', '', '其他设置', '78', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('18', '2015-02-26 15:00:03', '', '用户中心', '82', 'BUYER');
INSERT INTO `shopping_rolegroup` VALUES ('19', '2015-02-26 15:00:06', '', '微信管理', '86', 'SELLER');
INSERT INTO `shopping_rolegroup` VALUES ('20', '2015-02-26 15:00:16', '', '积分兑换', '98', 'BUYER');
INSERT INTO `shopping_rolegroup` VALUES ('21', '2015-02-26 15:00:17', '', '在线购物', '98', 'BUYER');
INSERT INTO `shopping_rolegroup` VALUES ('22', '2015-02-26 15:00:20', '', '微信用户中心', '102', 'BUYER');
INSERT INTO `shopping_rolegroup` VALUES ('23', '2015-02-26 15:00:24', '', '微信在线购物', '106', 'BUYER');

-- ----------------------------
-- Table structure for `shopping_role_res`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_role_res`;
CREATE TABLE `shopping_role_res` (
  `role_id` bigint(20) NOT NULL,
  `res_id` bigint(20) NOT NULL,
  KEY `FK6494F768261DF063` (`res_id`),
  KEY `FK6494F768AE50A871` (`role_id`),
  KEY `FK6143924E13E13392` (`res_id`),
  KEY `FK6143924E78F5CB22` (`role_id`),
  CONSTRAINT `FK6143924E13E13392` FOREIGN KEY (`res_id`) REFERENCES `shopping_res` (`id`),
  CONSTRAINT `FK6143924E78F5CB22` FOREIGN KEY (`role_id`) REFERENCES `shopping_role` (`id`),
  CONSTRAINT `FK6494F768261DF063` FOREIGN KEY (`res_id`) REFERENCES `shopping_res` (`id`),
  CONSTRAINT `FK6494F768AE50A871` FOREIGN KEY (`role_id`) REFERENCES `shopping_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_role_res
-- ----------------------------
INSERT INTO `shopping_role_res` VALUES ('2', '4');
INSERT INTO `shopping_role_res` VALUES ('3', '5');
INSERT INTO `shopping_role_res` VALUES ('4', '6');
INSERT INTO `shopping_role_res` VALUES ('5', '7');
INSERT INTO `shopping_role_res` VALUES ('6', '8');
INSERT INTO `shopping_role_res` VALUES ('9', '11');
INSERT INTO `shopping_role_res` VALUES ('7', '9');
INSERT INTO `shopping_role_res` VALUES ('7', '12');
INSERT INTO `shopping_role_res` VALUES ('7', '13');
INSERT INTO `shopping_role_res` VALUES ('8', '10');
INSERT INTO `shopping_role_res` VALUES ('8', '14');
INSERT INTO `shopping_role_res` VALUES ('10', '15');
INSERT INTO `shopping_role_res` VALUES ('11', '16');
INSERT INTO `shopping_role_res` VALUES ('11', '17');
INSERT INTO `shopping_role_res` VALUES ('11', '18');
INSERT INTO `shopping_role_res` VALUES ('11', '19');
INSERT INTO `shopping_role_res` VALUES ('11', '20');
INSERT INTO `shopping_role_res` VALUES ('12', '21');
INSERT INTO `shopping_role_res` VALUES ('12', '22');
INSERT INTO `shopping_role_res` VALUES ('12', '23');
INSERT INTO `shopping_role_res` VALUES ('12', '24');
INSERT INTO `shopping_role_res` VALUES ('12', '25');
INSERT INTO `shopping_role_res` VALUES ('12', '26');
INSERT INTO `shopping_role_res` VALUES ('12', '27');
INSERT INTO `shopping_role_res` VALUES ('13', '28');
INSERT INTO `shopping_role_res` VALUES ('13', '29');
INSERT INTO `shopping_role_res` VALUES ('13', '30');
INSERT INTO `shopping_role_res` VALUES ('13', '31');
INSERT INTO `shopping_role_res` VALUES ('13', '32');
INSERT INTO `shopping_role_res` VALUES ('14', '33');
INSERT INTO `shopping_role_res` VALUES ('14', '34');
INSERT INTO `shopping_role_res` VALUES ('14', '35');
INSERT INTO `shopping_role_res` VALUES ('14', '36');
INSERT INTO `shopping_role_res` VALUES ('15', '37');
INSERT INTO `shopping_role_res` VALUES ('15', '38');
INSERT INTO `shopping_role_res` VALUES ('15', '39');
INSERT INTO `shopping_role_res` VALUES ('15', '40');
INSERT INTO `shopping_role_res` VALUES ('15', '41');
INSERT INTO `shopping_role_res` VALUES ('15', '42');
INSERT INTO `shopping_role_res` VALUES ('15', '43');
INSERT INTO `shopping_role_res` VALUES ('17', '52');
INSERT INTO `shopping_role_res` VALUES ('17', '53');
INSERT INTO `shopping_role_res` VALUES ('17', '54');
INSERT INTO `shopping_role_res` VALUES ('17', '55');
INSERT INTO `shopping_role_res` VALUES ('17', '56');
INSERT INTO `shopping_role_res` VALUES ('17', '57');
INSERT INTO `shopping_role_res` VALUES ('17', '58');
INSERT INTO `shopping_role_res` VALUES ('17', '59');
INSERT INTO `shopping_role_res` VALUES ('17', '60');
INSERT INTO `shopping_role_res` VALUES ('18', '61');
INSERT INTO `shopping_role_res` VALUES ('18', '62');
INSERT INTO `shopping_role_res` VALUES ('18', '63');
INSERT INTO `shopping_role_res` VALUES ('18', '64');
INSERT INTO `shopping_role_res` VALUES ('18', '65');
INSERT INTO `shopping_role_res` VALUES ('18', '66');
INSERT INTO `shopping_role_res` VALUES ('18', '67');
INSERT INTO `shopping_role_res` VALUES ('19', '68');
INSERT INTO `shopping_role_res` VALUES ('19', '69');
INSERT INTO `shopping_role_res` VALUES ('19', '70');
INSERT INTO `shopping_role_res` VALUES ('19', '71');
INSERT INTO `shopping_role_res` VALUES ('19', '72');
INSERT INTO `shopping_role_res` VALUES ('19', '73');
INSERT INTO `shopping_role_res` VALUES ('19', '74');
INSERT INTO `shopping_role_res` VALUES ('20', '75');
INSERT INTO `shopping_role_res` VALUES ('20', '76');
INSERT INTO `shopping_role_res` VALUES ('20', '77');
INSERT INTO `shopping_role_res` VALUES ('20', '78');
INSERT INTO `shopping_role_res` VALUES ('21', '79');
INSERT INTO `shopping_role_res` VALUES ('21', '80');
INSERT INTO `shopping_role_res` VALUES ('21', '81');
INSERT INTO `shopping_role_res` VALUES ('21', '82');
INSERT INTO `shopping_role_res` VALUES ('21', '83');
INSERT INTO `shopping_role_res` VALUES ('21', '84');
INSERT INTO `shopping_role_res` VALUES ('21', '85');
INSERT INTO `shopping_role_res` VALUES ('21', '86');
INSERT INTO `shopping_role_res` VALUES ('23', '94');
INSERT INTO `shopping_role_res` VALUES ('23', '95');
INSERT INTO `shopping_role_res` VALUES ('24', '96');
INSERT INTO `shopping_role_res` VALUES ('24', '97');
INSERT INTO `shopping_role_res` VALUES ('24', '98');
INSERT INTO `shopping_role_res` VALUES ('22', '87');
INSERT INTO `shopping_role_res` VALUES ('22', '88');
INSERT INTO `shopping_role_res` VALUES ('22', '89');
INSERT INTO `shopping_role_res` VALUES ('22', '90');
INSERT INTO `shopping_role_res` VALUES ('22', '91');
INSERT INTO `shopping_role_res` VALUES ('22', '92');
INSERT INTO `shopping_role_res` VALUES ('22', '93');
INSERT INTO `shopping_role_res` VALUES ('22', '99');
INSERT INTO `shopping_role_res` VALUES ('22', '100');
INSERT INTO `shopping_role_res` VALUES ('22', '101');
INSERT INTO `shopping_role_res` VALUES ('22', '102');
INSERT INTO `shopping_role_res` VALUES ('25', '103');
INSERT INTO `shopping_role_res` VALUES ('25', '104');
INSERT INTO `shopping_role_res` VALUES ('25', '105');
INSERT INTO `shopping_role_res` VALUES ('25', '106');
INSERT INTO `shopping_role_res` VALUES ('25', '107');
INSERT INTO `shopping_role_res` VALUES ('25', '108');
INSERT INTO `shopping_role_res` VALUES ('25', '109');
INSERT INTO `shopping_role_res` VALUES ('25', '110');
INSERT INTO `shopping_role_res` VALUES ('26', '111');
INSERT INTO `shopping_role_res` VALUES ('26', '112');
INSERT INTO `shopping_role_res` VALUES ('26', '113');
INSERT INTO `shopping_role_res` VALUES ('26', '114');
INSERT INTO `shopping_role_res` VALUES ('26', '115');
INSERT INTO `shopping_role_res` VALUES ('26', '116');
INSERT INTO `shopping_role_res` VALUES ('26', '117');
INSERT INTO `shopping_role_res` VALUES ('28', '119');
INSERT INTO `shopping_role_res` VALUES ('28', '120');
INSERT INTO `shopping_role_res` VALUES ('29', '125');
INSERT INTO `shopping_role_res` VALUES ('29', '126');
INSERT INTO `shopping_role_res` VALUES ('30', '127');
INSERT INTO `shopping_role_res` VALUES ('30', '128');
INSERT INTO `shopping_role_res` VALUES ('30', '129');
INSERT INTO `shopping_role_res` VALUES ('30', '130');
INSERT INTO `shopping_role_res` VALUES ('30', '131');
INSERT INTO `shopping_role_res` VALUES ('30', '132');
INSERT INTO `shopping_role_res` VALUES ('30', '133');
INSERT INTO `shopping_role_res` VALUES ('31', '134');
INSERT INTO `shopping_role_res` VALUES ('31', '135');
INSERT INTO `shopping_role_res` VALUES ('31', '136');
INSERT INTO `shopping_role_res` VALUES ('31', '137');
INSERT INTO `shopping_role_res` VALUES ('31', '138');
INSERT INTO `shopping_role_res` VALUES ('1', '1');
INSERT INTO `shopping_role_res` VALUES ('1', '2');
INSERT INTO `shopping_role_res` VALUES ('1', '3');
INSERT INTO `shopping_role_res` VALUES ('1', '139');
INSERT INTO `shopping_role_res` VALUES ('1', '140');
INSERT INTO `shopping_role_res` VALUES ('32', '141');
INSERT INTO `shopping_role_res` VALUES ('32', '142');
INSERT INTO `shopping_role_res` VALUES ('33', '143');
INSERT INTO `shopping_role_res` VALUES ('33', '144');
INSERT INTO `shopping_role_res` VALUES ('34', '145');
INSERT INTO `shopping_role_res` VALUES ('34', '146');
INSERT INTO `shopping_role_res` VALUES ('35', '147');
INSERT INTO `shopping_role_res` VALUES ('35', '148');
INSERT INTO `shopping_role_res` VALUES ('35', '149');
INSERT INTO `shopping_role_res` VALUES ('35', '150');
INSERT INTO `shopping_role_res` VALUES ('35', '151');
INSERT INTO `shopping_role_res` VALUES ('35', '152');
INSERT INTO `shopping_role_res` VALUES ('35', '153');
INSERT INTO `shopping_role_res` VALUES ('35', '154');
INSERT INTO `shopping_role_res` VALUES ('35', '155');
INSERT INTO `shopping_role_res` VALUES ('35', '156');
INSERT INTO `shopping_role_res` VALUES ('35', '157');
INSERT INTO `shopping_role_res` VALUES ('35', '158');
INSERT INTO `shopping_role_res` VALUES ('35', '159');
INSERT INTO `shopping_role_res` VALUES ('35', '160');
INSERT INTO `shopping_role_res` VALUES ('36', '161');
INSERT INTO `shopping_role_res` VALUES ('36', '162');
INSERT INTO `shopping_role_res` VALUES ('36', '163');
INSERT INTO `shopping_role_res` VALUES ('37', '164');
INSERT INTO `shopping_role_res` VALUES ('37', '165');
INSERT INTO `shopping_role_res` VALUES ('37', '166');
INSERT INTO `shopping_role_res` VALUES ('37', '167');
INSERT INTO `shopping_role_res` VALUES ('37', '168');
INSERT INTO `shopping_role_res` VALUES ('37', '169');
INSERT INTO `shopping_role_res` VALUES ('37', '170');
INSERT INTO `shopping_role_res` VALUES ('37', '171');
INSERT INTO `shopping_role_res` VALUES ('37', '172');
INSERT INTO `shopping_role_res` VALUES ('37', '173');
INSERT INTO `shopping_role_res` VALUES ('37', '174');
INSERT INTO `shopping_role_res` VALUES ('37', '175');
INSERT INTO `shopping_role_res` VALUES ('37', '176');
INSERT INTO `shopping_role_res` VALUES ('37', '177');
INSERT INTO `shopping_role_res` VALUES ('38', '178');
INSERT INTO `shopping_role_res` VALUES ('38', '179');
INSERT INTO `shopping_role_res` VALUES ('38', '180');
INSERT INTO `shopping_role_res` VALUES ('38', '181');
INSERT INTO `shopping_role_res` VALUES ('38', '182');
INSERT INTO `shopping_role_res` VALUES ('38', '183');
INSERT INTO `shopping_role_res` VALUES ('39', '184');
INSERT INTO `shopping_role_res` VALUES ('39', '185');
INSERT INTO `shopping_role_res` VALUES ('39', '186');
INSERT INTO `shopping_role_res` VALUES ('39', '187');
INSERT INTO `shopping_role_res` VALUES ('39', '188');
INSERT INTO `shopping_role_res` VALUES ('39', '189');
INSERT INTO `shopping_role_res` VALUES ('39', '190');
INSERT INTO `shopping_role_res` VALUES ('40', '191');
INSERT INTO `shopping_role_res` VALUES ('40', '192');
INSERT INTO `shopping_role_res` VALUES ('40', '193');
INSERT INTO `shopping_role_res` VALUES ('40', '194');
INSERT INTO `shopping_role_res` VALUES ('40', '195');
INSERT INTO `shopping_role_res` VALUES ('41', '196');
INSERT INTO `shopping_role_res` VALUES ('41', '197');
INSERT INTO `shopping_role_res` VALUES ('41', '198');
INSERT INTO `shopping_role_res` VALUES ('41', '199');
INSERT INTO `shopping_role_res` VALUES ('41', '200');
INSERT INTO `shopping_role_res` VALUES ('41', '201');
INSERT INTO `shopping_role_res` VALUES ('42', '202');
INSERT INTO `shopping_role_res` VALUES ('42', '203');
INSERT INTO `shopping_role_res` VALUES ('42', '204');
INSERT INTO `shopping_role_res` VALUES ('42', '205');
INSERT INTO `shopping_role_res` VALUES ('42', '206');
INSERT INTO `shopping_role_res` VALUES ('42', '207');
INSERT INTO `shopping_role_res` VALUES ('43', '208');
INSERT INTO `shopping_role_res` VALUES ('43', '210');
INSERT INTO `shopping_role_res` VALUES ('44', '209');
INSERT INTO `shopping_role_res` VALUES ('44', '211');
INSERT INTO `shopping_role_res` VALUES ('45', '212');
INSERT INTO `shopping_role_res` VALUES ('45', '213');
INSERT INTO `shopping_role_res` VALUES ('45', '214');
INSERT INTO `shopping_role_res` VALUES ('45', '215');
INSERT INTO `shopping_role_res` VALUES ('45', '216');
INSERT INTO `shopping_role_res` VALUES ('45', '217');
INSERT INTO `shopping_role_res` VALUES ('46', '218');
INSERT INTO `shopping_role_res` VALUES ('46', '219');
INSERT INTO `shopping_role_res` VALUES ('46', '220');
INSERT INTO `shopping_role_res` VALUES ('46', '221');
INSERT INTO `shopping_role_res` VALUES ('47', '222');
INSERT INTO `shopping_role_res` VALUES ('47', '223');
INSERT INTO `shopping_role_res` VALUES ('47', '224');
INSERT INTO `shopping_role_res` VALUES ('47', '225');
INSERT INTO `shopping_role_res` VALUES ('47', '226');
INSERT INTO `shopping_role_res` VALUES ('47', '227');
INSERT INTO `shopping_role_res` VALUES ('47', '228');
INSERT INTO `shopping_role_res` VALUES ('47', '229');
INSERT INTO `shopping_role_res` VALUES ('48', '230');
INSERT INTO `shopping_role_res` VALUES ('48', '231');
INSERT INTO `shopping_role_res` VALUES ('48', '232');
INSERT INTO `shopping_role_res` VALUES ('48', '233');
INSERT INTO `shopping_role_res` VALUES ('48', '234');
INSERT INTO `shopping_role_res` VALUES ('48', '235');
INSERT INTO `shopping_role_res` VALUES ('48', '236');
INSERT INTO `shopping_role_res` VALUES ('49', '237');
INSERT INTO `shopping_role_res` VALUES ('49', '238');
INSERT INTO `shopping_role_res` VALUES ('49', '239');
INSERT INTO `shopping_role_res` VALUES ('49', '240');
INSERT INTO `shopping_role_res` VALUES ('49', '241');
INSERT INTO `shopping_role_res` VALUES ('49', '242');
INSERT INTO `shopping_role_res` VALUES ('49', '243');
INSERT INTO `shopping_role_res` VALUES ('49', '244');
INSERT INTO `shopping_role_res` VALUES ('49', '245');
INSERT INTO `shopping_role_res` VALUES ('49', '246');
INSERT INTO `shopping_role_res` VALUES ('49', '247');
INSERT INTO `shopping_role_res` VALUES ('49', '248');
INSERT INTO `shopping_role_res` VALUES ('49', '249');
INSERT INTO `shopping_role_res` VALUES ('50', '250');
INSERT INTO `shopping_role_res` VALUES ('50', '251');
INSERT INTO `shopping_role_res` VALUES ('50', '252');
INSERT INTO `shopping_role_res` VALUES ('50', '253');
INSERT INTO `shopping_role_res` VALUES ('50', '254');
INSERT INTO `shopping_role_res` VALUES ('50', '255');
INSERT INTO `shopping_role_res` VALUES ('50', '256');
INSERT INTO `shopping_role_res` VALUES ('50', '257');
INSERT INTO `shopping_role_res` VALUES ('50', '258');
INSERT INTO `shopping_role_res` VALUES ('50', '259');
INSERT INTO `shopping_role_res` VALUES ('50', '260');
INSERT INTO `shopping_role_res` VALUES ('50', '261');
INSERT INTO `shopping_role_res` VALUES ('50', '262');
INSERT INTO `shopping_role_res` VALUES ('50', '263');
INSERT INTO `shopping_role_res` VALUES ('51', '264');
INSERT INTO `shopping_role_res` VALUES ('51', '265');
INSERT INTO `shopping_role_res` VALUES ('51', '266');
INSERT INTO `shopping_role_res` VALUES ('51', '267');
INSERT INTO `shopping_role_res` VALUES ('51', '268');
INSERT INTO `shopping_role_res` VALUES ('51', '270');
INSERT INTO `shopping_role_res` VALUES ('51', '271');
INSERT INTO `shopping_role_res` VALUES ('51', '272');
INSERT INTO `shopping_role_res` VALUES ('51', '273');
INSERT INTO `shopping_role_res` VALUES ('51', '274');
INSERT INTO `shopping_role_res` VALUES ('51', '275');
INSERT INTO `shopping_role_res` VALUES ('51', '277');
INSERT INTO `shopping_role_res` VALUES ('51', '278');
INSERT INTO `shopping_role_res` VALUES ('51', '279');
INSERT INTO `shopping_role_res` VALUES ('51', '280');
INSERT INTO `shopping_role_res` VALUES ('51', '281');
INSERT INTO `shopping_role_res` VALUES ('51', '282');
INSERT INTO `shopping_role_res` VALUES ('51', '283');
INSERT INTO `shopping_role_res` VALUES ('51', '284');
INSERT INTO `shopping_role_res` VALUES ('51', '285');
INSERT INTO `shopping_role_res` VALUES ('51', '286');
INSERT INTO `shopping_role_res` VALUES ('51', '287');
INSERT INTO `shopping_role_res` VALUES ('51', '288');
INSERT INTO `shopping_role_res` VALUES ('51', '289');
INSERT INTO `shopping_role_res` VALUES ('51', '290');
INSERT INTO `shopping_role_res` VALUES ('51', '291');
INSERT INTO `shopping_role_res` VALUES ('51', '292');
INSERT INTO `shopping_role_res` VALUES ('16', '44');
INSERT INTO `shopping_role_res` VALUES ('16', '45');
INSERT INTO `shopping_role_res` VALUES ('16', '46');
INSERT INTO `shopping_role_res` VALUES ('16', '47');
INSERT INTO `shopping_role_res` VALUES ('16', '48');
INSERT INTO `shopping_role_res` VALUES ('16', '49');
INSERT INTO `shopping_role_res` VALUES ('16', '50');
INSERT INTO `shopping_role_res` VALUES ('16', '51');
INSERT INTO `shopping_role_res` VALUES ('16', '269');
INSERT INTO `shopping_role_res` VALUES ('16', '276');
INSERT INTO `shopping_role_res` VALUES ('16', '299');
INSERT INTO `shopping_role_res` VALUES ('52', '293');
INSERT INTO `shopping_role_res` VALUES ('52', '294');
INSERT INTO `shopping_role_res` VALUES ('52', '295');
INSERT INTO `shopping_role_res` VALUES ('52', '296');
INSERT INTO `shopping_role_res` VALUES ('52', '297');
INSERT INTO `shopping_role_res` VALUES ('52', '298');
INSERT INTO `shopping_role_res` VALUES ('52', '300');
INSERT INTO `shopping_role_res` VALUES ('52', '301');
INSERT INTO `shopping_role_res` VALUES ('52', '302');
INSERT INTO `shopping_role_res` VALUES ('52', '303');
INSERT INTO `shopping_role_res` VALUES ('52', '304');
INSERT INTO `shopping_role_res` VALUES ('52', '305');
INSERT INTO `shopping_role_res` VALUES ('52', '306');
INSERT INTO `shopping_role_res` VALUES ('52', '307');
INSERT INTO `shopping_role_res` VALUES ('52', '308');
INSERT INTO `shopping_role_res` VALUES ('52', '309');
INSERT INTO `shopping_role_res` VALUES ('52', '310');
INSERT INTO `shopping_role_res` VALUES ('52', '311');
INSERT INTO `shopping_role_res` VALUES ('52', '312');
INSERT INTO `shopping_role_res` VALUES ('52', '313');
INSERT INTO `shopping_role_res` VALUES ('52', '314');
INSERT INTO `shopping_role_res` VALUES ('52', '315');
INSERT INTO `shopping_role_res` VALUES ('53', '316');
INSERT INTO `shopping_role_res` VALUES ('53', '317');
INSERT INTO `shopping_role_res` VALUES ('53', '318');
INSERT INTO `shopping_role_res` VALUES ('53', '319');
INSERT INTO `shopping_role_res` VALUES ('53', '320');
INSERT INTO `shopping_role_res` VALUES ('53', '321');
INSERT INTO `shopping_role_res` VALUES ('53', '322');
INSERT INTO `shopping_role_res` VALUES ('54', '323');
INSERT INTO `shopping_role_res` VALUES ('54', '324');
INSERT INTO `shopping_role_res` VALUES ('55', '325');
INSERT INTO `shopping_role_res` VALUES ('55', '326');
INSERT INTO `shopping_role_res` VALUES ('55', '327');
INSERT INTO `shopping_role_res` VALUES ('56', '328');
INSERT INTO `shopping_role_res` VALUES ('56', '329');
INSERT INTO `shopping_role_res` VALUES ('56', '330');
INSERT INTO `shopping_role_res` VALUES ('56', '331');
INSERT INTO `shopping_role_res` VALUES ('56', '332');
INSERT INTO `shopping_role_res` VALUES ('56', '333');
INSERT INTO `shopping_role_res` VALUES ('56', '334');
INSERT INTO `shopping_role_res` VALUES ('56', '335');
INSERT INTO `shopping_role_res` VALUES ('56', '336');
INSERT INTO `shopping_role_res` VALUES ('57', '337');
INSERT INTO `shopping_role_res` VALUES ('57', '338');
INSERT INTO `shopping_role_res` VALUES ('57', '339');
INSERT INTO `shopping_role_res` VALUES ('57', '340');
INSERT INTO `shopping_role_res` VALUES ('57', '341');
INSERT INTO `shopping_role_res` VALUES ('57', '342');
INSERT INTO `shopping_role_res` VALUES ('57', '343');
INSERT INTO `shopping_role_res` VALUES ('57', '344');
INSERT INTO `shopping_role_res` VALUES ('57', '345');
INSERT INTO `shopping_role_res` VALUES ('57', '346');
INSERT INTO `shopping_role_res` VALUES ('57', '347');
INSERT INTO `shopping_role_res` VALUES ('57', '348');
INSERT INTO `shopping_role_res` VALUES ('58', '349');
INSERT INTO `shopping_role_res` VALUES ('58', '350');
INSERT INTO `shopping_role_res` VALUES ('58', '351');
INSERT INTO `shopping_role_res` VALUES ('58', '352');
INSERT INTO `shopping_role_res` VALUES ('58', '353');
INSERT INTO `shopping_role_res` VALUES ('59', '354');
INSERT INTO `shopping_role_res` VALUES ('59', '355');
INSERT INTO `shopping_role_res` VALUES ('60', '356');
INSERT INTO `shopping_role_res` VALUES ('60', '357');
INSERT INTO `shopping_role_res` VALUES ('60', '358');
INSERT INTO `shopping_role_res` VALUES ('60', '359');
INSERT INTO `shopping_role_res` VALUES ('60', '360');
INSERT INTO `shopping_role_res` VALUES ('60', '361');
INSERT INTO `shopping_role_res` VALUES ('61', '362');
INSERT INTO `shopping_role_res` VALUES ('61', '363');
INSERT INTO `shopping_role_res` VALUES ('62', '364');
INSERT INTO `shopping_role_res` VALUES ('62', '365');
INSERT INTO `shopping_role_res` VALUES ('62', '366');
INSERT INTO `shopping_role_res` VALUES ('62', '367');
INSERT INTO `shopping_role_res` VALUES ('62', '368');
INSERT INTO `shopping_role_res` VALUES ('62', '369');
INSERT INTO `shopping_role_res` VALUES ('62', '370');
INSERT INTO `shopping_role_res` VALUES ('62', '371');
INSERT INTO `shopping_role_res` VALUES ('62', '372');
INSERT INTO `shopping_role_res` VALUES ('62', '373');
INSERT INTO `shopping_role_res` VALUES ('62', '374');
INSERT INTO `shopping_role_res` VALUES ('27', '118');
INSERT INTO `shopping_role_res` VALUES ('27', '121');
INSERT INTO `shopping_role_res` VALUES ('27', '122');
INSERT INTO `shopping_role_res` VALUES ('27', '123');
INSERT INTO `shopping_role_res` VALUES ('27', '124');
INSERT INTO `shopping_role_res` VALUES ('27', '375');
INSERT INTO `shopping_role_res` VALUES ('27', '376');
INSERT INTO `shopping_role_res` VALUES ('27', '377');
INSERT INTO `shopping_role_res` VALUES ('27', '378');
INSERT INTO `shopping_role_res` VALUES ('27', '379');
INSERT INTO `shopping_role_res` VALUES ('27', '380');
INSERT INTO `shopping_role_res` VALUES ('27', '381');
INSERT INTO `shopping_role_res` VALUES ('27', '382');
INSERT INTO `shopping_role_res` VALUES ('27', '383');
INSERT INTO `shopping_role_res` VALUES ('65', '392');
INSERT INTO `shopping_role_res` VALUES ('65', '393');
INSERT INTO `shopping_role_res` VALUES ('65', '394');
INSERT INTO `shopping_role_res` VALUES ('65', '395');
INSERT INTO `shopping_role_res` VALUES ('66', '396');
INSERT INTO `shopping_role_res` VALUES ('66', '397');
INSERT INTO `shopping_role_res` VALUES ('67', '398');
INSERT INTO `shopping_role_res` VALUES ('67', '399');
INSERT INTO `shopping_role_res` VALUES ('67', '400');
INSERT INTO `shopping_role_res` VALUES ('67', '401');
INSERT INTO `shopping_role_res` VALUES ('67', '402');
INSERT INTO `shopping_role_res` VALUES ('67', '403');
INSERT INTO `shopping_role_res` VALUES ('67', '404');
INSERT INTO `shopping_role_res` VALUES ('67', '405');
INSERT INTO `shopping_role_res` VALUES ('63', '384');
INSERT INTO `shopping_role_res` VALUES ('63', '385');
INSERT INTO `shopping_role_res` VALUES ('63', '386');
INSERT INTO `shopping_role_res` VALUES ('63', '387');
INSERT INTO `shopping_role_res` VALUES ('63', '388');
INSERT INTO `shopping_role_res` VALUES ('63', '390');
INSERT INTO `shopping_role_res` VALUES ('63', '391');
INSERT INTO `shopping_role_res` VALUES ('63', '406');
INSERT INTO `shopping_role_res` VALUES ('64', '389');
INSERT INTO `shopping_role_res` VALUES ('64', '407');
INSERT INTO `shopping_role_res` VALUES ('68', '408');
INSERT INTO `shopping_role_res` VALUES ('69', '409');
INSERT INTO `shopping_role_res` VALUES ('70', '410');
INSERT INTO `shopping_role_res` VALUES ('71', '411');
INSERT INTO `shopping_role_res` VALUES ('71', '412');
INSERT INTO `shopping_role_res` VALUES ('71', '413');
INSERT INTO `shopping_role_res` VALUES ('71', '414');
INSERT INTO `shopping_role_res` VALUES ('71', '415');
INSERT INTO `shopping_role_res` VALUES ('71', '416');
INSERT INTO `shopping_role_res` VALUES ('71', '417');
INSERT INTO `shopping_role_res` VALUES ('71', '418');
INSERT INTO `shopping_role_res` VALUES ('72', '419');
INSERT INTO `shopping_role_res` VALUES ('73', '420');
INSERT INTO `shopping_role_res` VALUES ('74', '421');
INSERT INTO `shopping_role_res` VALUES ('75', '422');
INSERT INTO `shopping_role_res` VALUES ('75', '423');
INSERT INTO `shopping_role_res` VALUES ('76', '424');
INSERT INTO `shopping_role_res` VALUES ('76', '425');
INSERT INTO `shopping_role_res` VALUES ('76', '426');
INSERT INTO `shopping_role_res` VALUES ('76', '427');
INSERT INTO `shopping_role_res` VALUES ('76', '428');
INSERT INTO `shopping_role_res` VALUES ('77', '429');
INSERT INTO `shopping_role_res` VALUES ('77', '430');
INSERT INTO `shopping_role_res` VALUES ('77', '431');
INSERT INTO `shopping_role_res` VALUES ('77', '432');
INSERT INTO `shopping_role_res` VALUES ('78', '433');
INSERT INTO `shopping_role_res` VALUES ('78', '434');
INSERT INTO `shopping_role_res` VALUES ('78', '435');
INSERT INTO `shopping_role_res` VALUES ('78', '436');
INSERT INTO `shopping_role_res` VALUES ('78', '437');
INSERT INTO `shopping_role_res` VALUES ('78', '438');
INSERT INTO `shopping_role_res` VALUES ('78', '439');
INSERT INTO `shopping_role_res` VALUES ('78', '440');
INSERT INTO `shopping_role_res` VALUES ('78', '441');
INSERT INTO `shopping_role_res` VALUES ('78', '442');
INSERT INTO `shopping_role_res` VALUES ('78', '443');
INSERT INTO `shopping_role_res` VALUES ('78', '444');
INSERT INTO `shopping_role_res` VALUES ('78', '445');
INSERT INTO `shopping_role_res` VALUES ('78', '446');
INSERT INTO `shopping_role_res` VALUES ('78', '447');
INSERT INTO `shopping_role_res` VALUES ('78', '448');
INSERT INTO `shopping_role_res` VALUES ('78', '449');
INSERT INTO `shopping_role_res` VALUES ('78', '450');
INSERT INTO `shopping_role_res` VALUES ('78', '451');
INSERT INTO `shopping_role_res` VALUES ('78', '452');
INSERT INTO `shopping_role_res` VALUES ('78', '453');
INSERT INTO `shopping_role_res` VALUES ('78', '454');
INSERT INTO `shopping_role_res` VALUES ('78', '455');
INSERT INTO `shopping_role_res` VALUES ('78', '456');
INSERT INTO `shopping_role_res` VALUES ('78', '457');
INSERT INTO `shopping_role_res` VALUES ('79', '458');
INSERT INTO `shopping_role_res` VALUES ('79', '459');
INSERT INTO `shopping_role_res` VALUES ('79', '460');
INSERT INTO `shopping_role_res` VALUES ('79', '461');
INSERT INTO `shopping_role_res` VALUES ('79', '462');
INSERT INTO `shopping_role_res` VALUES ('80', '463');
INSERT INTO `shopping_role_res` VALUES ('80', '464');
INSERT INTO `shopping_role_res` VALUES ('80', '465');
INSERT INTO `shopping_role_res` VALUES ('80', '466');
INSERT INTO `shopping_role_res` VALUES ('80', '467');
INSERT INTO `shopping_role_res` VALUES ('80', '468');
INSERT INTO `shopping_role_res` VALUES ('80', '469');
INSERT INTO `shopping_role_res` VALUES ('80', '470');
INSERT INTO `shopping_role_res` VALUES ('80', '471');
INSERT INTO `shopping_role_res` VALUES ('82', '473');
INSERT INTO `shopping_role_res` VALUES ('82', '474');
INSERT INTO `shopping_role_res` VALUES ('82', '475');
INSERT INTO `shopping_role_res` VALUES ('83', '478');
INSERT INTO `shopping_role_res` VALUES ('83', '484');
INSERT INTO `shopping_role_res` VALUES ('81', '472');
INSERT INTO `shopping_role_res` VALUES ('81', '476');
INSERT INTO `shopping_role_res` VALUES ('81', '477');
INSERT INTO `shopping_role_res` VALUES ('81', '479');
INSERT INTO `shopping_role_res` VALUES ('81', '480');
INSERT INTO `shopping_role_res` VALUES ('81', '481');
INSERT INTO `shopping_role_res` VALUES ('81', '482');
INSERT INTO `shopping_role_res` VALUES ('81', '483');
INSERT INTO `shopping_role_res` VALUES ('81', '485');
INSERT INTO `shopping_role_res` VALUES ('81', '486');
INSERT INTO `shopping_role_res` VALUES ('84', '487');
INSERT INTO `shopping_role_res` VALUES ('84', '488');
INSERT INTO `shopping_role_res` VALUES ('84', '489');
INSERT INTO `shopping_role_res` VALUES ('84', '490');
INSERT INTO `shopping_role_res` VALUES ('84', '491');
INSERT INTO `shopping_role_res` VALUES ('85', '492');
INSERT INTO `shopping_role_res` VALUES ('85', '493');
INSERT INTO `shopping_role_res` VALUES ('85', '494');
INSERT INTO `shopping_role_res` VALUES ('85', '495');
INSERT INTO `shopping_role_res` VALUES ('86', '496');
INSERT INTO `shopping_role_res` VALUES ('87', '497');
INSERT INTO `shopping_role_res` VALUES ('87', '498');
INSERT INTO `shopping_role_res` VALUES ('87', '499');
INSERT INTO `shopping_role_res` VALUES ('87', '500');
INSERT INTO `shopping_role_res` VALUES ('87', '501');
INSERT INTO `shopping_role_res` VALUES ('88', '502');
INSERT INTO `shopping_role_res` VALUES ('88', '503');
INSERT INTO `shopping_role_res` VALUES ('89', '504');
INSERT INTO `shopping_role_res` VALUES ('89', '505');
INSERT INTO `shopping_role_res` VALUES ('90', '506');
INSERT INTO `shopping_role_res` VALUES ('90', '507');
INSERT INTO `shopping_role_res` VALUES ('90', '508');
INSERT INTO `shopping_role_res` VALUES ('90', '509');
INSERT INTO `shopping_role_res` VALUES ('91', '510');
INSERT INTO `shopping_role_res` VALUES ('91', '511');
INSERT INTO `shopping_role_res` VALUES ('91', '512');
INSERT INTO `shopping_role_res` VALUES ('91', '513');
INSERT INTO `shopping_role_res` VALUES ('92', '514');
INSERT INTO `shopping_role_res` VALUES ('92', '515');
INSERT INTO `shopping_role_res` VALUES ('92', '516');
INSERT INTO `shopping_role_res` VALUES ('92', '517');
INSERT INTO `shopping_role_res` VALUES ('92', '518');
INSERT INTO `shopping_role_res` VALUES ('92', '519');
INSERT INTO `shopping_role_res` VALUES ('93', '520');
INSERT INTO `shopping_role_res` VALUES ('93', '521');
INSERT INTO `shopping_role_res` VALUES ('93', '522');
INSERT INTO `shopping_role_res` VALUES ('93', '523');
INSERT INTO `shopping_role_res` VALUES ('93', '524');
INSERT INTO `shopping_role_res` VALUES ('94', '525');
INSERT INTO `shopping_role_res` VALUES ('94', '526');
INSERT INTO `shopping_role_res` VALUES ('94', '527');
INSERT INTO `shopping_role_res` VALUES ('94', '528');
INSERT INTO `shopping_role_res` VALUES ('94', '529');
INSERT INTO `shopping_role_res` VALUES ('94', '530');
INSERT INTO `shopping_role_res` VALUES ('95', '531');
INSERT INTO `shopping_role_res` VALUES ('95', '532');
INSERT INTO `shopping_role_res` VALUES ('95', '533');
INSERT INTO `shopping_role_res` VALUES ('95', '534');
INSERT INTO `shopping_role_res` VALUES ('95', '535');
INSERT INTO `shopping_role_res` VALUES ('95', '536');
INSERT INTO `shopping_role_res` VALUES ('95', '537');
INSERT INTO `shopping_role_res` VALUES ('96', '538');
INSERT INTO `shopping_role_res` VALUES ('96', '539');
INSERT INTO `shopping_role_res` VALUES ('96', '540');
INSERT INTO `shopping_role_res` VALUES ('96', '541');
INSERT INTO `shopping_role_res` VALUES ('96', '542');
INSERT INTO `shopping_role_res` VALUES ('96', '543');
INSERT INTO `shopping_role_res` VALUES ('96', '544');
INSERT INTO `shopping_role_res` VALUES ('96', '545');
INSERT INTO `shopping_role_res` VALUES ('96', '546');
INSERT INTO `shopping_role_res` VALUES ('96', '547');
INSERT INTO `shopping_role_res` VALUES ('97', '548');
INSERT INTO `shopping_role_res` VALUES ('97', '549');
INSERT INTO `shopping_role_res` VALUES ('97', '550');
INSERT INTO `shopping_role_res` VALUES ('97', '551');
INSERT INTO `shopping_role_res` VALUES ('97', '552');
INSERT INTO `shopping_role_res` VALUES ('97', '553');
INSERT INTO `shopping_role_res` VALUES ('98', '554');
INSERT INTO `shopping_role_res` VALUES ('98', '555');
INSERT INTO `shopping_role_res` VALUES ('98', '556');
INSERT INTO `shopping_role_res` VALUES ('98', '557');
INSERT INTO `shopping_role_res` VALUES ('98', '558');
INSERT INTO `shopping_role_res` VALUES ('98', '559');
INSERT INTO `shopping_role_res` VALUES ('98', '560');
INSERT INTO `shopping_role_res` VALUES ('99', '561');
INSERT INTO `shopping_role_res` VALUES ('99', '562');
INSERT INTO `shopping_role_res` VALUES ('99', '563');
INSERT INTO `shopping_role_res` VALUES ('99', '564');
INSERT INTO `shopping_role_res` VALUES ('99', '565');
INSERT INTO `shopping_role_res` VALUES ('99', '566');
INSERT INTO `shopping_role_res` VALUES ('99', '567');
INSERT INTO `shopping_role_res` VALUES ('99', '568');
INSERT INTO `shopping_role_res` VALUES ('99', '569');
INSERT INTO `shopping_role_res` VALUES ('99', '570');
INSERT INTO `shopping_role_res` VALUES ('99', '571');
INSERT INTO `shopping_role_res` VALUES ('99', '572');
INSERT INTO `shopping_role_res` VALUES ('99', '573');
INSERT INTO `shopping_role_res` VALUES ('99', '574');
INSERT INTO `shopping_role_res` VALUES ('99', '575');
INSERT INTO `shopping_role_res` VALUES ('101', '578');
INSERT INTO `shopping_role_res` VALUES ('101', '579');
INSERT INTO `shopping_role_res` VALUES ('102', '581');
INSERT INTO `shopping_role_res` VALUES ('102', '582');
INSERT INTO `shopping_role_res` VALUES ('102', '583');
INSERT INTO `shopping_role_res` VALUES ('102', '584');
INSERT INTO `shopping_role_res` VALUES ('102', '585');
INSERT INTO `shopping_role_res` VALUES ('103', '594');
INSERT INTO `shopping_role_res` VALUES ('103', '595');
INSERT INTO `shopping_role_res` VALUES ('103', '596');
INSERT INTO `shopping_role_res` VALUES ('103', '597');
INSERT INTO `shopping_role_res` VALUES ('103', '598');
INSERT INTO `shopping_role_res` VALUES ('103', '599');
INSERT INTO `shopping_role_res` VALUES ('103', '600');
INSERT INTO `shopping_role_res` VALUES ('103', '601');
INSERT INTO `shopping_role_res` VALUES ('103', '602');
INSERT INTO `shopping_role_res` VALUES ('103', '603');
INSERT INTO `shopping_role_res` VALUES ('103', '604');
INSERT INTO `shopping_role_res` VALUES ('104', '605');
INSERT INTO `shopping_role_res` VALUES ('104', '606');
INSERT INTO `shopping_role_res` VALUES ('104', '607');
INSERT INTO `shopping_role_res` VALUES ('104', '608');
INSERT INTO `shopping_role_res` VALUES ('104', '609');
INSERT INTO `shopping_role_res` VALUES ('104', '610');
INSERT INTO `shopping_role_res` VALUES ('104', '611');
INSERT INTO `shopping_role_res` VALUES ('104', '612');
INSERT INTO `shopping_role_res` VALUES ('104', '613');
INSERT INTO `shopping_role_res` VALUES ('104', '614');
INSERT INTO `shopping_role_res` VALUES ('104', '615');
INSERT INTO `shopping_role_res` VALUES ('104', '616');
INSERT INTO `shopping_role_res` VALUES ('104', '617');
INSERT INTO `shopping_role_res` VALUES ('105', '687');
INSERT INTO `shopping_role_res` VALUES ('105', '688');
INSERT INTO `shopping_role_res` VALUES ('105', '689');
INSERT INTO `shopping_role_res` VALUES ('105', '690');
INSERT INTO `shopping_role_res` VALUES ('105', '691');
INSERT INTO `shopping_role_res` VALUES ('105', '692');
INSERT INTO `shopping_role_res` VALUES ('105', '693');
INSERT INTO `shopping_role_res` VALUES ('105', '694');
INSERT INTO `shopping_role_res` VALUES ('105', '695');
INSERT INTO `shopping_role_res` VALUES ('105', '696');
INSERT INTO `shopping_role_res` VALUES ('106', '705');
INSERT INTO `shopping_role_res` VALUES ('106', '706');
INSERT INTO `shopping_role_res` VALUES ('106', '707');
INSERT INTO `shopping_role_res` VALUES ('106', '708');
INSERT INTO `shopping_role_res` VALUES ('106', '711');
INSERT INTO `shopping_role_res` VALUES ('100', '576');
INSERT INTO `shopping_role_res` VALUES ('100', '577');
INSERT INTO `shopping_role_res` VALUES ('100', '580');
INSERT INTO `shopping_role_res` VALUES ('100', '586');
INSERT INTO `shopping_role_res` VALUES ('100', '587');
INSERT INTO `shopping_role_res` VALUES ('100', '588');
INSERT INTO `shopping_role_res` VALUES ('100', '589');
INSERT INTO `shopping_role_res` VALUES ('100', '590');
INSERT INTO `shopping_role_res` VALUES ('100', '591');
INSERT INTO `shopping_role_res` VALUES ('100', '592');
INSERT INTO `shopping_role_res` VALUES ('100', '593');
INSERT INTO `shopping_role_res` VALUES ('100', '618');
INSERT INTO `shopping_role_res` VALUES ('100', '619');
INSERT INTO `shopping_role_res` VALUES ('100', '620');
INSERT INTO `shopping_role_res` VALUES ('100', '621');
INSERT INTO `shopping_role_res` VALUES ('100', '622');
INSERT INTO `shopping_role_res` VALUES ('100', '623');
INSERT INTO `shopping_role_res` VALUES ('100', '624');
INSERT INTO `shopping_role_res` VALUES ('100', '625');
INSERT INTO `shopping_role_res` VALUES ('100', '626');
INSERT INTO `shopping_role_res` VALUES ('100', '627');
INSERT INTO `shopping_role_res` VALUES ('100', '628');
INSERT INTO `shopping_role_res` VALUES ('100', '629');
INSERT INTO `shopping_role_res` VALUES ('100', '630');
INSERT INTO `shopping_role_res` VALUES ('100', '631');
INSERT INTO `shopping_role_res` VALUES ('100', '632');
INSERT INTO `shopping_role_res` VALUES ('100', '633');
INSERT INTO `shopping_role_res` VALUES ('100', '634');
INSERT INTO `shopping_role_res` VALUES ('100', '635');
INSERT INTO `shopping_role_res` VALUES ('100', '636');
INSERT INTO `shopping_role_res` VALUES ('100', '637');
INSERT INTO `shopping_role_res` VALUES ('100', '638');
INSERT INTO `shopping_role_res` VALUES ('100', '639');
INSERT INTO `shopping_role_res` VALUES ('100', '640');
INSERT INTO `shopping_role_res` VALUES ('100', '641');
INSERT INTO `shopping_role_res` VALUES ('100', '642');
INSERT INTO `shopping_role_res` VALUES ('100', '643');
INSERT INTO `shopping_role_res` VALUES ('100', '644');
INSERT INTO `shopping_role_res` VALUES ('100', '645');
INSERT INTO `shopping_role_res` VALUES ('100', '646');
INSERT INTO `shopping_role_res` VALUES ('100', '647');
INSERT INTO `shopping_role_res` VALUES ('100', '648');
INSERT INTO `shopping_role_res` VALUES ('100', '649');
INSERT INTO `shopping_role_res` VALUES ('100', '650');
INSERT INTO `shopping_role_res` VALUES ('100', '651');
INSERT INTO `shopping_role_res` VALUES ('100', '652');
INSERT INTO `shopping_role_res` VALUES ('100', '653');
INSERT INTO `shopping_role_res` VALUES ('100', '654');
INSERT INTO `shopping_role_res` VALUES ('100', '655');
INSERT INTO `shopping_role_res` VALUES ('100', '656');
INSERT INTO `shopping_role_res` VALUES ('100', '657');
INSERT INTO `shopping_role_res` VALUES ('100', '658');
INSERT INTO `shopping_role_res` VALUES ('100', '659');
INSERT INTO `shopping_role_res` VALUES ('100', '660');
INSERT INTO `shopping_role_res` VALUES ('100', '661');
INSERT INTO `shopping_role_res` VALUES ('100', '662');
INSERT INTO `shopping_role_res` VALUES ('100', '663');
INSERT INTO `shopping_role_res` VALUES ('100', '664');
INSERT INTO `shopping_role_res` VALUES ('100', '665');
INSERT INTO `shopping_role_res` VALUES ('100', '666');
INSERT INTO `shopping_role_res` VALUES ('100', '667');
INSERT INTO `shopping_role_res` VALUES ('100', '668');
INSERT INTO `shopping_role_res` VALUES ('100', '669');
INSERT INTO `shopping_role_res` VALUES ('100', '670');
INSERT INTO `shopping_role_res` VALUES ('100', '671');
INSERT INTO `shopping_role_res` VALUES ('100', '672');
INSERT INTO `shopping_role_res` VALUES ('100', '673');
INSERT INTO `shopping_role_res` VALUES ('100', '674');
INSERT INTO `shopping_role_res` VALUES ('100', '675');
INSERT INTO `shopping_role_res` VALUES ('100', '676');
INSERT INTO `shopping_role_res` VALUES ('100', '677');
INSERT INTO `shopping_role_res` VALUES ('100', '678');
INSERT INTO `shopping_role_res` VALUES ('100', '679');
INSERT INTO `shopping_role_res` VALUES ('100', '680');
INSERT INTO `shopping_role_res` VALUES ('100', '681');
INSERT INTO `shopping_role_res` VALUES ('100', '682');
INSERT INTO `shopping_role_res` VALUES ('100', '683');
INSERT INTO `shopping_role_res` VALUES ('100', '684');
INSERT INTO `shopping_role_res` VALUES ('100', '685');
INSERT INTO `shopping_role_res` VALUES ('100', '686');
INSERT INTO `shopping_role_res` VALUES ('100', '697');
INSERT INTO `shopping_role_res` VALUES ('100', '698');
INSERT INTO `shopping_role_res` VALUES ('100', '699');
INSERT INTO `shopping_role_res` VALUES ('100', '700');
INSERT INTO `shopping_role_res` VALUES ('100', '701');
INSERT INTO `shopping_role_res` VALUES ('100', '702');
INSERT INTO `shopping_role_res` VALUES ('100', '703');
INSERT INTO `shopping_role_res` VALUES ('100', '704');
INSERT INTO `shopping_role_res` VALUES ('100', '713');
INSERT INTO `shopping_role_res` VALUES ('100', '714');
INSERT INTO `shopping_role_res` VALUES ('100', '715');
INSERT INTO `shopping_role_res` VALUES ('100', '716');
INSERT INTO `shopping_role_res` VALUES ('100', '717');
INSERT INTO `shopping_role_res` VALUES ('100', '718');
INSERT INTO `shopping_role_res` VALUES ('100', '719');
INSERT INTO `shopping_role_res` VALUES ('100', '720');
INSERT INTO `shopping_role_res` VALUES ('100', '721');
INSERT INTO `shopping_role_res` VALUES ('100', '722');
INSERT INTO `shopping_role_res` VALUES ('100', '723');
INSERT INTO `shopping_role_res` VALUES ('100', '724');
INSERT INTO `shopping_role_res` VALUES ('100', '725');
INSERT INTO `shopping_role_res` VALUES ('100', '726');
INSERT INTO `shopping_role_res` VALUES ('100', '727');
INSERT INTO `shopping_role_res` VALUES ('100', '728');
INSERT INTO `shopping_role_res` VALUES ('100', '729');
INSERT INTO `shopping_role_res` VALUES ('100', '730');
INSERT INTO `shopping_role_res` VALUES ('100', '731');
INSERT INTO `shopping_role_res` VALUES ('100', '732');
INSERT INTO `shopping_role_res` VALUES ('100', '733');
INSERT INTO `shopping_role_res` VALUES ('100', '734');
INSERT INTO `shopping_role_res` VALUES ('100', '735');
INSERT INTO `shopping_role_res` VALUES ('108', '736');
INSERT INTO `shopping_role_res` VALUES ('108', '737');
INSERT INTO `shopping_role_res` VALUES ('108', '738');
INSERT INTO `shopping_role_res` VALUES ('108', '739');
INSERT INTO `shopping_role_res` VALUES ('108', '740');
INSERT INTO `shopping_role_res` VALUES ('108', '741');
INSERT INTO `shopping_role_res` VALUES ('108', '742');
INSERT INTO `shopping_role_res` VALUES ('108', '743');
INSERT INTO `shopping_role_res` VALUES ('108', '744');
INSERT INTO `shopping_role_res` VALUES ('108', '745');
INSERT INTO `shopping_role_res` VALUES ('108', '746');
INSERT INTO `shopping_role_res` VALUES ('108', '747');
INSERT INTO `shopping_role_res` VALUES ('108', '748');
INSERT INTO `shopping_role_res` VALUES ('108', '749');
INSERT INTO `shopping_role_res` VALUES ('108', '750');
INSERT INTO `shopping_role_res` VALUES ('108', '751');
INSERT INTO `shopping_role_res` VALUES ('108', '752');
INSERT INTO `shopping_role_res` VALUES ('108', '753');
INSERT INTO `shopping_role_res` VALUES ('108', '754');
INSERT INTO `shopping_role_res` VALUES ('107', '709');
INSERT INTO `shopping_role_res` VALUES ('107', '710');
INSERT INTO `shopping_role_res` VALUES ('107', '712');
INSERT INTO `shopping_role_res` VALUES ('107', '755');
INSERT INTO `shopping_role_res` VALUES ('107', '756');
INSERT INTO `shopping_role_res` VALUES ('107', '757');
INSERT INTO `shopping_role_res` VALUES ('107', '758');
INSERT INTO `shopping_role_res` VALUES ('107', '759');
INSERT INTO `shopping_role_res` VALUES ('107', '760');
INSERT INTO `shopping_role_res` VALUES ('107', '761');
INSERT INTO `shopping_role_res` VALUES ('107', '762');
INSERT INTO `shopping_role_res` VALUES ('107', '763');
INSERT INTO `shopping_role_res` VALUES ('107', '764');
INSERT INTO `shopping_role_res` VALUES ('107', '765');
INSERT INTO `shopping_role_res` VALUES ('107', '766');
INSERT INTO `shopping_role_res` VALUES ('109', '767');
INSERT INTO `shopping_role_res` VALUES ('109', '768');
INSERT INTO `shopping_role_res` VALUES ('109', '769');
INSERT INTO `shopping_role_res` VALUES ('109', '770');
INSERT INTO `shopping_role_res` VALUES ('109', '771');
INSERT INTO `shopping_role_res` VALUES ('109', '772');
INSERT INTO `shopping_role_res` VALUES ('109', '773');
INSERT INTO `shopping_role_res` VALUES ('109', '774');
INSERT INTO `shopping_role_res` VALUES ('109', '775');
INSERT INTO `shopping_role_res` VALUES ('109', '776');
INSERT INTO `shopping_role_res` VALUES ('109', '777');
INSERT INTO `shopping_role_res` VALUES ('109', '778');

-- ----------------------------
-- Table structure for `shopping_shipping`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_shipping`;
CREATE TABLE `shopping_shipping` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `shipping_add_fee` decimal(12,2) DEFAULT NULL,
  `shipping_add_weight` int(11) NOT NULL,
  `shipping_fee` decimal(12,2) DEFAULT NULL,
  `shipping_info` longtext,
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_weight` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK55AE97BF920D7683` (`store_id`),
  CONSTRAINT `FK55AE97BF920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_shipping
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_spare_goods`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_spare_goods`;
CREATE TABLE `shopping_spare_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `content` longtext,
  `errorMessage` varchar(255) DEFAULT NULL,
  `goods_old_price` int(11) DEFAULT '0',
  `goods_price` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `oldAndnew` int(11) DEFAULT '0',
  `sellMethod` int(11) DEFAULT '0',
  `seodescribe` longtext,
  `seokeyword` longtext,
  `status` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `img_id` bigint(20) DEFAULT NULL,
  `spareGoodsClass_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `img1_id` bigint(20) DEFAULT NULL,
  `img2_id` bigint(20) DEFAULT NULL,
  `img3_id` bigint(20) DEFAULT NULL,
  `img4_id` bigint(20) DEFAULT NULL,
  `main_img_id` bigint(20) DEFAULT NULL,
  `img5_id` bigint(20) DEFAULT NULL,
  `viewInFloor` bit(1) DEFAULT b'0',
  `sgf_id` bigint(20) DEFAULT NULL,
  `QQ` varchar(255) DEFAULT NULL,
  `recommend` bit(1) DEFAULT b'0',
  `down` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK6124F03D2FB91D11` (`area_id`),
  KEY `FK6124F03DEB7ECE12` (`img_id`),
  KEY `FK6124F03D537B6C51` (`user_id`),
  KEY `FK6124F03D557BFC43` (`spareGoodsClass_id`),
  KEY `FK6124F03DF4F59358` (`main_img_id`),
  KEY `FK6124F03DA454C244` (`img4_id`),
  KEY `FK6124F03DA4544DE5` (`img3_id`),
  KEY `FK6124F03DA4536527` (`img1_id`),
  KEY `FK6124F03DA453D986` (`img2_id`),
  KEY `FK6124F03DA45536A3` (`img5_id`),
  KEY `FK6124F03DE2CED19E` (`sgf_id`),
  KEY `FK4420A39758D3C64D` (`sgf_id`),
  KEY `FK4420A397FA5E3FC2` (`area_id`),
  KEY `FK4420A3973C3F7747` (`main_img_id`),
  KEY `FK4420A397EB9EA633` (`img4_id`),
  KEY `FK4420A397EB9E31D4` (`img3_id`),
  KEY `FK4420A397EB9D4916` (`img1_id`),
  KEY `FK4420A3971E208F02` (`user_id`),
  KEY `FK4420A397EB9F1A92` (`img5_id`),
  KEY `FK4420A397EB9DBD75` (`img2_id`),
  KEY `FK4420A397CB80F0F2` (`spareGoodsClass_id`),
  CONSTRAINT `FK4420A3971E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK4420A3973C3F7747` FOREIGN KEY (`main_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK4420A39758D3C64D` FOREIGN KEY (`sgf_id`) REFERENCES `shopping_spare_goodsfloor` (`id`),
  CONSTRAINT `FK4420A397CB80F0F2` FOREIGN KEY (`spareGoodsClass_id`) REFERENCES `shopping_spare_goodsclass` (`id`),
  CONSTRAINT `FK4420A397EB9D4916` FOREIGN KEY (`img1_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK4420A397EB9DBD75` FOREIGN KEY (`img2_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK4420A397EB9E31D4` FOREIGN KEY (`img3_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK4420A397EB9EA633` FOREIGN KEY (`img4_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK4420A397EB9F1A92` FOREIGN KEY (`img5_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK4420A397FA5E3FC2` FOREIGN KEY (`area_id`) REFERENCES `shopping_area` (`id`),
  CONSTRAINT `FK6124F03D2FB91D11` FOREIGN KEY (`area_id`) REFERENCES `shopping_area` (`id`),
  CONSTRAINT `FK6124F03D537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK6124F03D557BFC43` FOREIGN KEY (`spareGoodsClass_id`) REFERENCES `shopping_spare_goodsclass` (`id`),
  CONSTRAINT `FK6124F03DA4536527` FOREIGN KEY (`img1_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK6124F03DA453D986` FOREIGN KEY (`img2_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK6124F03DA4544DE5` FOREIGN KEY (`img3_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK6124F03DA454C244` FOREIGN KEY (`img4_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK6124F03DA45536A3` FOREIGN KEY (`img5_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK6124F03DE2CED19E` FOREIGN KEY (`sgf_id`) REFERENCES `shopping_spare_goodsfloor` (`id`),
  CONSTRAINT `FK6124F03DEB7ECE12` FOREIGN KEY (`img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK6124F03DF4F59358` FOREIGN KEY (`main_img_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_spare_goods
-- ----------------------------
INSERT INTO `shopping_spare_goods` VALUES ('1', '2014-10-09 17:13:49', '', null, '', null, '2800', '1700', '李大勇', '0', '0', null, null, '0', '八成新冰龙GTX670显卡 低价出售 需要尽快联系', '4522489', null, '21', '1', '024-87618871', '426014', null, '426016', '426017', '426014', null, '', '2', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('2', '2014-10-10 10:43:46', '', null, '<ul style=\"font-size:12.0px;color:#666666;\">\r\n	<li>\r\n		1. 使用时长：2\r\n	</li>\r\n	<li>\r\n		2. 新旧程度描述：9\r\n	</li>\r\n	<li>\r\n		3. 存在的问题：0\r\n	</li>\r\n	<li>\r\n		4. 到手时间/有效期/适用条件： 48\r\n	</li>\r\n</ul>\r\n<div>\r\n	<span><span style=\"font-size:12.0px;line-height:24.0px;\">原装挡板，光主板，无CPU。 &nbsp;无病午修。 &nbsp;48小时确认退运费10元。</span></span>\r\n</div>', null, '289', '148', '白先生', '0', '0', null, null, '0', '华硕M2N-SLI Deluxe（570芯片）豪华版 铜管散热', '4522220', null, '19', '1', '18609890912', '426018', null, null, null, '426018', null, '', '2', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('3', '2014-10-10 10:58:42', '', null, '<ul style=\"color:#666666;font-size:12.0px;\">\r\n	<li>\r\n		<p>\r\n			<span style=\"font-size:16.0px;\">原来是2*2G升级IBM t400笔记本换下来的,huancheng换成2*4g了。手里就两条，每条80。不好用双倍赔付，运费多退少补。</span>\r\n		</p>\r\n	</li>\r\n</ul>', null, '150', '80', '李小姐', '0', '0', null, null, '0', '二手DDR3 2G内存条 1066HZ', '4522888', null, '21', '1', '18309890912', '426019', null, null, null, '426019', null, '', '2', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('4', '2014-10-10 11:01:22', '', null, '<div>\r\n	<ul>\r\n		<li>\r\n			<span>品牌</span> <span>Dell/戴尔</span> \r\n		</li>\r\n	</ul>\r\n</div>\r\n<ul style=\"font-size:12.0px;color:#666666;\">\r\n	<li>\r\n		1. 使用时长：使用半年\r\n	</li>\r\n	<li>\r\n		2. 新旧程度描述：九五成新 几乎全新&nbsp;\r\n	</li>\r\n	<li>\r\n		3. 存在的问题：没有任何问题 &nbsp;没有出过故障 没拆过\r\n	</li>\r\n	<li>\r\n		4. 到手时间/有效期/适用条件： 去年买的 &nbsp;&nbsp;\r\n	</li>\r\n	<li>\r\n		<br />\r\n	</li>\r\n</ul>\r\n<table>\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					主体\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					品牌\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					戴尔&nbsp;DELL\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					型号\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					Inspiron&nbsp;M102z\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					颜色\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					枚红色\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					平台\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					AMD\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					软件\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					随机系统\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					正版&nbsp;Windows&nbsp;7&nbsp;Home&nbsp;Basic&nbsp;64&nbsp;位\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					处理器\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					CPU类型\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					AMD\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					CPU型号\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					C50\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					CPU速度\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					1.0GHz\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					系统总线\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					1066MHz\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					二级缓存\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					1MB\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					内存\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					内存容量\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					2GB\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					内存类型\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					DDR3\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					硬盘\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					硬盘容量\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					320GB\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					转速\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					7200转/分钟\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					显卡\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					类型\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					集成显卡\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					显示芯片\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					ATI&nbsp;Mobility&nbsp;Radeon&nbsp;HD&nbsp;6310\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					显存容量\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					共享系统内存（集成）\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					光驱\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					光驱类型\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					无光驱\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					显示器\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					屏幕规格\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					11.1英寸\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					显示比例\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					宽屏16：9\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					物理分辨率\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					1366&nbsp;x&nbsp;768\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					屏幕类型\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					WLED,&nbsp;Truelife\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					通信\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					调制解调器modem\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					无\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					内置蓝牙\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					Dell&nbsp;Wireless&nbsp;365&nbsp;Bluetooth&nbsp;Internal&nbsp;mini-card\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					无线局域网\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					Dell&nbsp;WirelessTM&nbsp;1501&nbsp;802.11b/g/n\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					内置3G\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					无\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					端口\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					RJ45\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					1个\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					音效系统\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					扬声器\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					2个集成立体声扬声器（4欧姆2瓦&nbsp;x&nbsp;2）\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					内置麦克风\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					有\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					输入设备\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					键盘\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					全尺寸键盘\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					触摸板\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					有\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					其它设备\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					网络摄像头\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					有\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					摄像头像素\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					130万\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					指纹识别\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					无\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					读卡器\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					8合1读卡器\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					电源\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					电池\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					6芯&nbsp;锂离子电池\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					续航时间\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					6-9小时，具体时间视使用环境而定\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					电源适配器\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					100-240V自适应交流电源适配器\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"2\">\r\n				<p>\r\n					机器规格\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					尺寸\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					205*292*24.3/35\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<p>\r\n					重量\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<p>\r\n					3.44lbs&nbsp;/&nbsp;1.56kg\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', null, '5000', '2000', '吴小姐', '0', '0', null, null, '0', '戴尔Inspiron 灵越 M102z系列笔记本电脑极致轻薄本', '4522921', null, '19', '1', '18309890912', '426020', '426021', null, null, '426020', null, '', '2', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('5', '2014-10-14 12:18:01', '', null, '<div>\r\n	又入了自动的那个镜头 这个变焦的 和另一个定焦的饼干头都转了 这个几乎没用过 饼干头用的多一些 这里是变焦的价格\r\n</div>', null, '799', '500', '白先生', '0', '0', null, null, '0', '松下LUMIX G 14-42MM/F3.5-5.6镜头GF2', '4522005', null, '15', '1', '13309889098', '426023', '426024', '426025', '426026', '426023', null, '', '2', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('6', '2014-10-14 16:40:46', '', null, '<p>\r\n	成色自己看，有大图。估计8-9成新AB屏贴膜\r\n</p>\r\n<p>\r\n	拒绝到手刀。已经很低价了。不接刀了\r\n</p>\r\n<p>\r\n	屏幕完美，无线。光驱。摄像头，硬盘全都没有问题。\r\n</p>\r\n<p>\r\n	使用中的笔记本，二手的东西肯定有些少使用痕迹，完美党绕道\r\n</p>\r\n<p>\r\n	退货请支付来回运费，带保价邮寄。\r\n</p>\r\n<p>\r\n	配件 带电池 充电器 鼠标 HP包包 键盘膜 。\r\n</p>', null, '3500', '1700', '黄女士', '0', '0', null, null, '0', '9新高配HP G42 I 3 4G 640G GT520', '4521987', null, '19', '1', '13107551099', '426028', '426029', '426030', '426031', '426028', null, '', '2', '18762861', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('7', '2014-10-14 16:43:18', '', null, '<div>\r\n	<ul style=\"font-size:12.0px;color:#666666;\">\r\n		<li>\r\n			1. 使用时长：1年多&nbsp; 买来就没怎么用&nbsp;\r\n		</li>\r\n		<li>\r\n			2. 新旧程度描述： 9新\r\n		</li>\r\n		<li>\r\n			3. 存在的问题： 无质量问题\r\n		</li>\r\n		<li>\r\n			4. 到手时间/有效期/适用条件： 无线上网 放口袋方便 低功耗 待机好\r\n		</li>\r\n	</ul>\r\n	<p>\r\n		&nbsp;闲置全套成色新配2个电池(电池很贵2个就值400多了）5寸xp小电脑win7小电脑全键盘触屏3gnet三巨网mi13&nbsp;&nbsp; 玩物低价处理 注：充电器非原配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3g网卡原来买来没有配&nbsp;（ 其实用不上）现在手机都可以代替了&nbsp;。\r\n	</p>\r\n	<p>\r\n		&nbsp;高配版：<span>屏幕&nbsp;1024*600&nbsp; 处理器Intel Atom Z515 1.2 &nbsp;内存1GB&nbsp;&nbsp;集显256 &nbsp;固态16GB&nbsp;&nbsp; 价格见底了</span><br />\r\n限识货爽快的买家！\r\n	</p>\r\n</div>', null, '2000', '900', '白先生', '0', '0', null, null, '0', '5寸xp小电脑win7全键盘触屏3gnet三巨网mi13同s515超n5翻盖口袋本', '4522485', null, '19', '1', '13309889098', '426032', '426033', '426034', '426035', '426032', null, '', '2', '18762861', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('8', '2014-10-14 16:54:03', '', null, '出售各类显示器', null, '800', '200', '黄女士', '0', '0', null, null, '0', '显示器 内存 主板 硬盘 键盘 显卡 光驱 电源 cpu 华硕 三星 戴尔', '4522362', null, '22', '1', '13107551099', '426036', null, null, null, '426036', null, '', '2', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('9', '2014-10-14 16:55:38', '', null, '<div>\r\n	<h2>\r\n		<b>宝贝介绍</b>\r\n	</h2>\r\n	<div>\r\n		<ul style=\"color:#666666;font-size:12.0px;\">\r\n			<li>\r\n				1. 使用时长：1年&nbsp;\r\n			</li>\r\n			<li>\r\n				2. 新旧程度描述：几乎全新\r\n			</li>\r\n			<li>\r\n				3. 存在的问题： 无\r\n			</li>\r\n			<li>\r\n				4. 到手时间/有效期/适用条件：\r\n			</li>\r\n		</ul>\r\n&nbsp;\r\n		<p>\r\n			ASUS X44L &nbsp;配置是i3 2310 2.1主频 内存4G 硬盘320G 独立1G显卡14寸LED 高清摄像头。成色性能都不错。需要速度。收到机器 必须12小时确认。机器质保1一个月 。避免不良买家恶意推迟确认\r\n		</p>\r\n<span style=\"color:#ff0000;font-size:16.0px;\"> \r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;color:#404040;font-size:12.0px;\">\r\n			<span style=\"color:#ff0000;font-size:16.0px;\"></span>\r\n		</p>\r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;color:#404040;font-size:12.0px;\">\r\n			<span style=\"color:#ff0000;\"><span style=\"font-size:16.0px;\">顺丰+保价，务必请当快递面签收</span></span>\r\n		</p>\r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;color:#404040;font-size:12.0px;\">\r\n			<span style=\"color:#ff0000;\"><span style=\"font-size:16.0px;\"></span></span>\r\n		</p>\r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;color:#404040;font-size:12.0px;\">\r\n			<span style=\"color:#ff0000;\"><span style=\"font-size:16.0px;\">因周转资金，所以支付宝交易的，签收24小时内必须确认</span></span>\r\n		</p>\r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;color:#404040;font-size:12.0px;\">\r\n			&nbsp;\r\n		</p>\r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;color:#404040;font-size:12.0px;\">\r\n			<span style=\"color:#ff0000;\"><span style=\"font-size:16.0px;\"></span></span>\r\n		</p>\r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;color:#404040;font-size:12.0px;\">\r\n			&nbsp;\r\n		</p>\r\n		<p style=\"font-family:tahoma helvetica arial 宋体 sans-serif;\">\r\n			<span style=\"color:#ff0000;\"><span>二手物品，不接受退货，请三思。</span></span>\r\n		</p>\r\n</span>\r\n	</div>\r\n</div>', null, '4399', '1388', '何先生', '0', '0', null, null, '0', 'ASUS 非常大气的笔记本', '4521988', null, '19', '1', '18901078900', '426037', null, null, null, '426037', null, '', '2', '87686232', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('10', '2014-10-14 17:00:42', '', null, '帮朋友发布 需要的加旺旺：echo艳色馆<br />\r\n<br />\r\n机子95新 国行 白色 没有暗病 无硬伤 无拆.无修.无进水<br />\r\n<br />\r\n收到机子可自行检查 正反面都贴了膜 功能都正常 女孩自用机保养的很好哦<br />\r\n<br />\r\n版本 6.1.2(10B146) 联通/移动可用 非合约机,定制机<br />\r\n<br />\r\n购买日期2014年2月25日&nbsp; 保修到2015年2月25日<br />\r\n<br />\r\n购买地中国&nbsp; 已激活 无锁 插卡就可以用 配件发票齐全<br />\r\n<br />\r\n配件(数据线,剪卡器,膜一张,耳机,充电器,保修卡,包装盒,发票,等)<br />\r\n<br />\r\n机子和我的描述都是符合的 发现不符亲们可以直接退货 邮费我出<br />\r\n<br />\r\n全国联保 支持苹果检测 支持7天试用 试用期间有任何问题都可以退 邮费我出<br />\r\n<br />\r\n由于工作比较忙&nbsp; 诚心要的来 最好是同城的可以当面交易 <br />\r\n<br />\r\n机子不预留 确定要的加旺旺 包邮', null, '2800', '1600', '白先生', '1', '0', null, null, '0', 'iphone4s 16G 国行在保', '4522053', null, '7', '1', '13309889098', '426038', null, null, null, '426038', null, '', '2', '18762861', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('11', '2014-10-14 17:03:00', '', null, '<ul style=\"font-size:12.0px;color:#666666;\">\r\n	<li>\r\n		1. 使用时长：两个月~\r\n	</li>\r\n	<li>\r\n		2. 新旧程度描述：九成新以上！\r\n	</li>\r\n	<li>\r\n		3. 存在的问题：无\r\n	</li>\r\n	<li>\r\n		4. 到手时间/有效期/适用条件： <br />\r\n	</li>\r\n</ul>', null, '900', '480', '白先生', '0', '0', null, null, '0', '低价出售电信三星I739手机-白色！！！', '4522626', null, '7', '1', '13107551099', '426039', null, null, null, '426039', null, '', '2', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('12', '2014-10-14 17:11:45', '', null, '<p style=\"text-align:center;\">\r\n	<span style=\"color:#9900ff;\"><strong><span style=\"font-size:24.0px;\">春装新款上市，蘑菇兔子女宝宝夹衣三件套，很可爱的一款衣衣，纯棉质地，软软的，穿着舒适，喜欢的妈妈不要错过哦！&nbsp;</span></strong></span>\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">品牌</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">心爱园（本款属于薄棉款）</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">单重/Kg</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">0.46</span>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">颜色</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">粉、果绿、西红</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">尺码</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">8# 10#</span>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">材质说明</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">100%纯棉</span>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;text-align:center;\">\r\n				<br />\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				&nbsp;\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">尺码数据</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">单位：cm，平铺手工测得，误差1-2cm左右属正常</span></strong></span>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">尺码</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">衣长</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">袖长</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">胸围*2</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">裤长</span></strong></span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\"><strong><span style=\"font-family:微软雅黑;\">裆高/裆部结构</span></strong></span>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;80</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;31</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;25</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;26*2</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;42</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;20两用裆 还有2套</span>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;90</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;33</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;27</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;27*2</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">&nbsp;44</span>\r\n			</td>\r\n			<td style=\"background-color:#ffffff;\">\r\n				<span style=\"color:#008000;font-size:16.0pt;\">21&nbsp;两用裆 还有1套</span>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	<img src=\"http://img01.taobaocdn.com/imgextra/i1/499955589/T2HMmiXhRXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/499955589/T2i3miXitXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/499955589/T2NwiiXjpXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/499955589/T2kwiiXkXXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/499955589/T26MeiXkFXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/499955589/T2LgeiXlXXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/499955589/T2s3aiXnlXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img03.taobaocdn.com/imgextra/i3/499955589/T2D29iXoBXXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/499955589/T2ef9iXXXaXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/499955589/T2Qf5iXXVaXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/499955589/T2r25iXataXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/499955589/T27f1iXaVaXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img02.taobaocdn.com/imgextra/i2/499955589/T2H21iXbBaXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img02.taobaocdn.com/imgextra/i2/499955589/T2hv1iXb8aXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/499955589/T2W2WiXcJaXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" /><img src=\"http://img03.taobaocdn.com/imgextra/i3/499955589/T2A2WiXdhaXXXXXXXX_%21%21499955589.jpg\" align=\"absmiddle\" />因\r\n店铺转让，特价处理一批童装。喜欢的妈妈不要错过，全新，专柜正品，有细节图亲们可以仔细看看，不是样品，带吊牌，数量有限，先到先得。当天拍下的第2天\r\n发货，因为萱萱妈妈还要上班，晚上回到家才能看到信息，所以请各位妈妈见谅。特价处理的童装，不议价，不退换，谢谢理解。\r\n</p>', null, '80', '20', '陈小姐', '1', '0', null, null, '0', '2014最新春装0-2岁女童薄棉衣三件套装 蘑菇兔子女宝宝夹衣三件套', '4521987', null, '36', '1', '15200123423', '426040', null, null, null, '426040', null, '', '3', '451655121', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('13', '2014-10-14 17:13:16', '', null, '<div>\r\n	<ul style=\"font-size:12.0px;color:#666666;\">\r\n		<li>\r\n			全新带吊牌转让（连试穿都没有），这件羽绒服是在专柜购买，本打算过年回老家穿，但是现在计划有变，广东这边又穿不上，所以转让，别家还卖628呢。亲们，不议价了哦。\r\n		</li>\r\n	</ul>\r\n</div>', null, '560', '300', '黄女士', '1', '0', null, null, '0', '正品2013冬男童装防风镜占袋羽绒服D4212206', '4522489', null, '30', '1', '13309889098', '426041', '426042', null, null, '426041', null, '', '3', '18762861', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('14', '2014-10-14 17:16:14', '', null, '<ul style=\"color:#666666;font-size:12.0px;\">\r\n	<li>\r\n		1. 使用时长：\r\n	</li>\r\n	<li>\r\n		2. 新旧程度描述：\r\n	</li>\r\n	<li>\r\n		3. 存在的问题：\r\n	</li>\r\n	<li>\r\n		4. 到手时间/有效期/适用条件：\r\n	</li>\r\n</ul>\r\n9成新的薄款棉袄。正红色，下水1次。，适合身高80-105的宝宝。', null, '133', '65', '白先生', '1', '0', null, null, '0', '【爆款】红色格纹口袋袖口补丁纽扣外套', '4522487', null, '30', '1', '13309889098', '426043', '426044', '426045', null, '426043', null, '', '3', '18762861', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('15', '2014-10-14 17:20:12', '', null, '<ul style=\"color:#666666;font-size:12.0px;\">\r\n	<li>\r\n		1. 使用时长：\r\n	</li>\r\n	<li>\r\n		2. 新旧程度描述：\r\n	</li>\r\n	<li>\r\n		3. 存在的问题：\r\n	</li>\r\n	<li>\r\n		4. 到手时间/有效期/适用条件：\r\n	</li>\r\n</ul>\r\n全新，羽绒服，适合80-100的宝宝穿。。。有2件哦', null, '234', '80', '何先生', '1', '0', null, null, '0', '【日系】女童卡通可爱花花拉链羽绒服', '4522005', null, '30', '1', '13107551099', '426046', '426047', '426048', null, '426046', null, '', '3', '451655121', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('16', '2014-10-14 17:23:20', '', null, '<div>\r\n	<p>\r\n		米色，全新，110，非B品，前后布料不一样的，有弹性，软绵，小熊是刺绣的，很精致，裤脚翻遍，实惠好看~~~\r\n	</p>\r\n</div>', null, '500', '280', '何先生', '1', '0', null, null, '0', 'mikihouse米色长裤', '4522692', null, '34', '1', '13107551099', '426049', null, null, null, '426049', null, '', '3', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('17', '2014-10-14 17:25:12', '', null, '<div>\r\n	<ul style=\"color:#666666;font-size:12.0px;\">\r\n		<li>\r\n			1. 使用时长：\r\n		</li>\r\n		<li>\r\n			2. 新旧程度描述：\r\n		</li>\r\n		<li>\r\n			3. 存在的问题：\r\n		</li>\r\n		<li>\r\n			4. 到手时间/有效期/适用条件：\r\n		</li>\r\n	</ul>\r\n	<p>\r\n		9成新的橘色皮草毛领棉袄，有口袋设计，韩国正品实体店买的，下过一次水。。。没有任何质量问题。\r\n	</p>\r\n</div>', null, '890', '299', '黄女士', '1', '0', null, null, '0', '【爆款】女童韩货正品橘色毛毛领拉链洋气棉袄', '4523272', null, '30', '1', '15200123423', '426050', '426051', '426052', null, '426050', null, '', '3', '451655121', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('18', '2014-10-14 17:26:47', '', null, '<ul style=\"font-size:12.0px;color:#666666;\">\r\n	<li>\r\n		1. 使用时长：拍照用了一次\r\n	</li>\r\n	<li>\r\n		2. 新旧程度描述：99成新\r\n	</li>\r\n	<li>\r\n		3. 存在的问题：败家妈妈，宝宝大了，家里太多用不着的了\r\n	</li>\r\n	<li>\r\n		4. 到手时间/有效期/适用条件： 拍照用了之后就洗干净放起来了 东东没有任何改变 求收留！\r\n	</li>\r\n</ul>', null, '247', '44', '黄女士', '0', '0', null, null, '0', '[转卖]包邮儿童摄影服装 影楼童装 摄影 满月百天宝宝米奇老鼠', '4521987', null, '30', '1', '13309889098', '426053', null, null, null, '426053', null, '', '3', '123456', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('19', '2014-10-14 17:28:25', '', null, '<div>\r\n	<ul style=\"font-size:12.0px;color:#666666;\">\r\n		<li>\r\n			这件无袖T恤穿过一次就小了，基本上是新的，小女孩穿很可爱的。\r\n		</li>\r\n	</ul>\r\n</div>', null, '94', '30', '陈小姐', '1', '0', null, null, '0', '韩国进口童装代购个性波浪时尚无袖T恤', '4522375', null, '29', '1', '15200123423', '426054', null, null, null, '426054', null, '', '3', '451655121', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('20', '2014-10-14 17:30:48', '', null, '<ul style=\"font-size:12.0px;color:#666666;\">\r\n	<li>\r\n		全新小白熊奶瓶消毒器，别人送了2个，所以重复了，闲置在家中，现在便宜卖掉！\r\n	</li>\r\n</ul>', null, '280', '120', '黄女士', '1', '0', null, null, '0', '小白熊奶瓶消毒器', '4522235', null, '40', '1', '15200123423', '426055', '426056', '426057', null, '426055', null, '', '3', '87686232', '', '0');
INSERT INTO `shopping_spare_goods` VALUES ('21', '2014-10-14 17:32:35', '', null, '<ul style=\"color:#666666;font-size:12.0px;\">\r\n	<li>\r\n		1. 使用时长： 全新\r\n	</li>\r\n	<li>\r\n		2. 新旧程度描述： 全新\r\n	</li>\r\n	<li>\r\n		3. 存在的问题：无\r\n	</li>\r\n	<li>\r\n		4. 到手时间： 2014年10月12日\r\n	</li>\r\n</ul>', null, '200', '120', '何先生', '1', '0', null, null, '0', '全新 海淘comotomo可么多么奶瓶250ml 粉色 附美国亚马逊购物凭证', '4522005', null, '40', '1', '18901078900', '426058', '426059', '426060', null, '426058', null, '', '3', '451655121', '', '0');

-- ----------------------------
-- Table structure for `shopping_spare_goodsclass`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_spare_goodsclass`;
CREATE TABLE `shopping_spare_goodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `sequence` int(11) DEFAULT '0',
  `parent_id` bigint(20) DEFAULT NULL,
  `viewInFloor` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAC6B673B93F273F2` (`parent_id`),
  KEY `FK7B5BBC219F768A1` (`parent_id`),
  CONSTRAINT `FK7B5BBC219F768A1` FOREIGN KEY (`parent_id`) REFERENCES `shopping_spare_goodsclass` (`id`),
  CONSTRAINT `FKAC6B673B93F273F2` FOREIGN KEY (`parent_id`) REFERENCES `shopping_spare_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_spare_goodsclass
-- ----------------------------
INSERT INTO `shopping_spare_goodsclass` VALUES ('1', '2014-09-22 19:28:37', '', '闲置数码', '1', '1', null, '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('2', '2014-09-22 19:28:52', '', '闲置母婴', '1', '2', null, '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('3', '2014-09-22 19:29:43', '', '家居日用', '1', '3', null, '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('4', '2014-09-22 19:29:54', '', '影音家电 ', '1', '4', null, '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('5', '2014-09-22 19:30:06', '', '鞋服配饰', '1', '5', null, '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('6', '2014-09-22 19:30:18', '', '珠宝收藏 ', '1', '6', null, '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('7', '2014-09-22 19:30:28', '', '手机', '2', '0', '1', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('8', '2014-09-22 19:30:52', '', '相机/摄像机', '2', '1', '1', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('9', '2014-09-22 19:31:37', '', '手机壳', '3', '1', '7', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('10', '2014-10-09 15:25:29', '', '充电器', '3', '0', '7', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('11', '2014-10-09 15:25:58', '', '电池', '3', '0', '7', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('12', '2014-10-09 15:26:34', '', '耳机', '3', '0', '7', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('13', '2014-10-09 15:26:47', '', '数据线', '3', '0', '7', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('14', '2014-10-09 15:30:31', '', '相机', '3', '0', '8', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('15', '2014-10-09 15:30:46', '', '镜头', '3', '0', '8', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('16', '2014-10-09 15:31:00', '', '单反', '3', '0', '8', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('17', '2014-10-09 15:31:16', '', '胶片', '3', '0', '8', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('18', '2014-10-09 15:31:52', '', '电脑/电脑周边', '2', '3', '1', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('19', '2014-10-09 15:33:34', '', '笔记本', '3', '0', '18', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('20', '2014-10-09 15:33:52', '', '平板电脑', '3', '0', '18', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('21', '2014-10-09 15:34:13', '', '台式机', '3', '0', '18', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('22', '2014-10-09 15:34:23', '', '显示器', '3', '0', '18', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('23', '2014-10-09 15:34:54', '', '鼠标', '3', '0', '18', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('24', '2014-10-09 15:35:05', '', '硬盘', '3', '0', '18', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('25', '2014-10-09 15:35:16', '', '电源', '3', '0', '18', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('26', '2014-10-09 15:49:32', '', '童装', '2', '0', '2', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('27', '2014-10-09 15:49:51', '', '婴儿服', '2', '1', '2', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('28', '2014-10-09 15:50:10', '', '宝宝用品', '2', '2', '2', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('29', '2014-10-09 15:51:28', '', 'T恤', '3', '0', '26', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('30', '2014-10-09 15:51:37', '', '外套', '3', '0', '26', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('31', '2014-10-09 15:51:47', '', '棉袄', '3', '0', '26', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('32', '2014-10-09 15:51:59', '', '毛衣', '3', '0', '26', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('33', '2014-10-09 15:52:09', '', '羽绒', '3', '0', '26', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('34', '2014-10-09 15:52:18', '', '套装', '3', '0', '26', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('35', '2014-10-09 15:52:29', '', '童鞋', '3', '0', '26', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('36', '2014-10-09 15:53:13', '', '哈衣', '3', '0', '27', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('37', '2014-10-09 15:53:31', '', '新生儿礼盒', '3', '0', '27', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('38', '2014-10-09 15:53:40', '', '肚兜', '3', '0', '27', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('39', '2014-10-09 15:53:55', '', '斗篷', '3', '0', '27', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('40', '2014-10-09 15:55:17', '', '奶瓶', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('41', '2014-10-09 15:55:31', '', '奶嘴', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('42', '2014-10-09 16:19:26', '', '婴儿推车', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('43', '2014-10-09 16:20:04', '', '婴儿床', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('44', '2014-10-09 16:20:31', '', '纸尿裤', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('45', '2014-10-09 16:20:57', '', '游泳池', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('46', '2014-10-09 16:21:08', '', '学步带', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('47', '2014-10-09 16:21:26', '', '尿布', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('48', '2014-10-09 16:21:36', '', '湿巾', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('49', '2014-10-09 16:21:46', '', '沐浴', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('50', '2014-10-09 16:21:59', '', '毛毯', '3', '0', '28', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('51', '2014-10-09 16:23:19', '', '家具', '2', '0', '3', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('52', '2014-10-09 16:23:34', '', '家纺家饰 ', '2', '0', '3', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('53', '2014-10-09 16:23:46', '', '日用日化', '2', '0', '3', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('54', '2014-10-09 16:24:17', '', '床', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('55', '2014-10-09 16:24:26', '', '沙发', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('56', '2014-10-09 16:24:34', '', '茶几', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('57', '2014-10-09 16:24:59', '', '餐桌', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('58', '2014-10-09 16:25:09', '', '椅子', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('59', '2014-10-09 16:25:16', '', '衣柜', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('60', '2014-10-09 16:25:23', '', '鞋柜', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('61', '2014-10-09 16:25:32', '', '床头柜', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('62', '2014-10-09 16:25:40', '', '置物架', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('63', '2014-10-09 16:25:48', '', '鞋架', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('64', '2014-10-09 16:25:56', '', '书架', '3', '0', '51', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('65', '2014-10-09 16:30:35', '', '四件套', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('66', '2014-10-09 16:30:59', '', '枕头', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('67', '2014-10-09 16:31:07', '', '床单', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('68', '2014-10-09 16:31:15', '', '被套', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('69', '2014-10-09 16:31:22', '', '被子', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('70', '2014-10-09 16:31:29', '', '窗帘', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('71', '2014-10-09 16:33:14', '', '地毯', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('72', '2014-10-09 16:33:21', '', '地垫', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('73', '2014-10-09 16:33:54', '', '靠垫', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('74', '2014-10-09 16:34:01', '', '桌布', '3', '0', '52', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('75', '2014-10-09 16:34:27', '', '毛巾', '3', '0', '53', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('76', '2014-10-09 16:34:35', '', '洗衣液', '3', '0', '53', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('77', '2014-10-09 16:34:42', '', '洗衣粉', '3', '0', '53', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('78', '2014-10-09 16:34:49', '', '伞', '3', '0', '53', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('79', '2014-10-09 16:34:56', '', '雨衣', '3', '0', '53', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('80', '2014-10-09 16:35:14', '', '垃圾桶', '3', '0', '53', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('81', '2014-10-09 16:36:16', '', '大家电', '2', '0', '4', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('82', '2014-10-09 16:36:26', '', '生活小家电', '2', '0', '4', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('83', '2014-10-09 16:36:41', '', '厨房电器', '2', '0', '4', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('84', '2014-10-09 16:37:30', '', '影音/耳机/HIFI ', '2', '0', '4', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('85', '2014-10-09 16:38:37', '', '电视机', '3', '0', '81', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('86', '2014-10-09 16:38:55', '', '洗衣机', '3', '0', '81', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('87', '2014-10-09 16:39:10', '', '空调', '3', '0', '81', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('88', '2014-10-09 16:39:24', '', '冰箱', '3', '0', '81', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('89', '2014-10-09 16:39:32', '', '热水器', '3', '0', '81', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('90', '2014-10-09 16:40:09', '', '吹风机', '3', '0', '82', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('91', '2014-10-09 16:40:19', '', '剃须刀', '3', '0', '82', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('92', '2014-10-09 16:40:26', '', '风扇', '3', '0', '82', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('93', '2014-10-09 16:40:33', '', '加湿器', '3', '0', '82', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('94', '2014-10-09 16:40:40', '', '挂烫机', '3', '0', '82', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('95', '2014-10-09 16:41:13', '', '豆浆机', '3', '0', '83', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('96', '2014-10-09 16:41:21', '', '榨汁机', '3', '0', '83', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('97', '2014-10-09 16:41:29', '', '酸奶机', '3', '0', '83', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('98', '2014-10-09 16:41:36', '', '面包机', '3', '0', '83', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('99', '2014-10-09 16:41:45', '', '冰淇淋机', '3', '0', '83', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('100', '2014-10-09 16:42:02', '', '电饭煲', '3', '0', '83', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('101', '2014-10-09 16:42:30', '', '耳机', '3', '0', '84', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('102', '2014-10-09 16:42:38', '', '音箱', '3', '0', '84', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('103', '2014-10-09 16:42:45', '', '功放', '3', '0', '84', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('104', '2014-10-09 16:42:54', '', '低音炮', '3', '0', '84', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('105', '2014-10-09 16:43:33', '', '麦克风', '3', '0', '84', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('106', '2014-10-09 16:43:50', '', '女装', '2', '0', '5', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('107', '2014-10-09 16:44:06', '', '女鞋', '2', '0', '5', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('108', '2014-10-09 16:44:16', '', '箱包', '2', '0', '5', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('109', '2014-10-09 16:44:25', '', '配饰', '2', '0', '5', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('110', '2014-10-09 16:45:20', '', '连衣裙', '3', '0', '106', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('111', '2014-10-09 16:45:29', '', '半身裙', '3', '0', '106', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('112', '2014-10-09 16:45:36', '', 'T恤', '3', '0', '106', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('113', '2014-10-09 16:46:33', '', '衬衫', '3', '0', '106', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('114', '2014-10-09 16:46:40', '', '卫衣', '3', '0', '106', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('115', '2014-10-09 16:48:25', '', '运动鞋', '3', '0', '107', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('116', '2014-10-09 16:48:33', '', '单鞋', '3', '0', '107', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('117', '2014-10-09 16:48:43', '', '皮鞋', '3', '0', '107', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('118', '2014-10-09 16:49:00', '', '帆布鞋', '3', '0', '107', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('119', '2014-10-09 16:49:21', '', '女包', '3', '0', '108', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('120', '2014-10-09 16:50:30', '', '男包', '3', '0', '108', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('121', '2014-10-09 16:50:39', '', '旅行箱', '3', '0', '108', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('122', '2014-10-09 16:51:02', '', '腰带', '3', '0', '109', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('123', '2014-10-09 16:51:09', '', '皮带', '3', '0', '109', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('124', '2014-10-09 16:51:25', '', '帽子', '2', '0', '5', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('125', '2014-10-09 16:51:32', '', '围巾', '2', '0', '5', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('126', '2014-10-09 16:51:41', '', '丝巾', '2', '0', '5', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('127', '2014-10-09 16:52:03', '', '珠宝', '2', '0', '6', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('128', '2014-10-09 16:52:12', '', '手表', '2', '0', '6', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('129', '2014-10-09 16:52:20', '', '饰品', '2', '0', '6', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('130', '2014-10-09 16:52:28', '', '收藏品', '2', '0', '6', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('131', '2014-10-09 16:53:06', '', '翡翠', '3', '0', '127', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('132', '2014-10-09 16:53:14', '', '黄金', '3', '0', '127', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('133', '2014-10-09 16:53:20', '', '钻石', '3', '0', '127', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('134', '2014-10-09 16:53:28', '', '珍珠', '3', '0', '127', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('135', '2014-10-09 16:53:35', '', '碧玺', '3', '0', '127', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('136', '2014-10-09 16:53:43', '', '铂金', '3', '0', '127', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('137', '2014-10-09 16:53:50', '', '琥珀', '3', '0', '127', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('138', '2014-10-09 16:54:12', '', '机械表', '3', '0', '128', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('139', '2014-10-09 16:54:26', '', '石英表', '3', '0', '128', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('140', '2014-10-09 16:54:33', '', '电子表', '3', '0', '128', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('141', '2014-10-09 16:55:05', '', '眼镜', '3', '0', '129', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('142', '2014-10-09 16:56:16', '', '手链', '3', '0', '129', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('143', '2014-10-09 16:57:18', '', '项链', '3', '0', '129', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('144', '2014-10-09 17:05:23', '', '吊坠', '3', '0', '129', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('145', '2014-10-09 17:05:34', '', '手镯', '3', '0', '129', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('146', '2014-10-09 17:05:42', '', '戒指', '3', '0', '129', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('147', '2014-10-09 17:05:49', '', '水晶', '3', '0', '129', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('148', '2014-10-09 17:06:10', '', '古玩', '3', '0', '130', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('149', '2014-10-09 17:06:51', '', '邮票', '3', '0', '130', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('150', '2014-10-09 17:06:58', '', '钱币', '3', '0', '130', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('151', '2014-10-09 17:07:05', '', '和田玉', '3', '0', '130', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('152', '2014-10-09 17:07:13', '', '古玉', '3', '0', '130', '');
INSERT INTO `shopping_spare_goodsclass` VALUES ('153', '2014-10-09 17:07:20', '', '陶瓷', '3', '0', '130', '');

-- ----------------------------
-- Table structure for `shopping_spare_goodsfloor`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_spare_goodsfloor`;
CREATE TABLE `shopping_spare_goodsfloor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `adver_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `visable` int(11) DEFAULT '1',
  `sgc_id` bigint(20) DEFAULT NULL,
  `adver_type` int(11) DEFAULT '0',
  `advert_url` varchar(255) DEFAULT NULL,
  `advert_id` bigint(20) DEFAULT NULL,
  `advert_img_id` bigint(20) DEFAULT NULL,
  `display` bit(1) DEFAULT b'1',
  `adp_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKAC95E1CFE2A2F9ED` (`sgc_id`),
  KEY `FKAC95E1CF8DEA4DD` (`advert_img_id`),
  KEY `FKAC95E1CF20641F1` (`advert_id`),
  KEY `FKAC95E1CF26BE20C1` (`adp_id`),
  KEY `FK7B8636B5F9005A32` (`adp_id`),
  KEY `FK7B8636B558A7EE9C` (`sgc_id`),
  KEY `FK7B8636B5502888CC` (`advert_img_id`),
  CONSTRAINT `FK7B8636B5502888CC` FOREIGN KEY (`advert_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK7B8636B558A7EE9C` FOREIGN KEY (`sgc_id`) REFERENCES `shopping_spare_goodsclass` (`id`),
  CONSTRAINT `FK7B8636B5F9005A32` FOREIGN KEY (`adp_id`) REFERENCES `shopping_adv_pos` (`id`),
  CONSTRAINT `FKAC95E1CF20641F1` FOREIGN KEY (`advert_id`) REFERENCES `shopping_advert` (`id`),
  CONSTRAINT `FKAC95E1CF26BE20C1` FOREIGN KEY (`adp_id`) REFERENCES `shopping_adv_pos` (`id`),
  CONSTRAINT `FKAC95E1CF8DEA4DD` FOREIGN KEY (`advert_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKAC95E1CFE2A2F9ED` FOREIGN KEY (`sgc_id`) REFERENCES `shopping_spare_goodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_spare_goodsfloor
-- ----------------------------
INSERT INTO `shopping_spare_goodsfloor` VALUES ('2', '2014-10-10 10:17:41', '', '1222', '0', '数码控.土豪来袭', '1', '1', '0', '#', null, '426022', '', null);
INSERT INTO `shopping_spare_goodsfloor` VALUES ('3', '2014-10-14 12:30:23', '', null, '1', '少女&辣妈都是我', '1', '2', '0', '#', null, '426027', '', null);

-- ----------------------------
-- Table structure for `shopping_store`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_store`;
CREATE TABLE `shopping_store` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `card_approve` bit(1) NOT NULL,
  `realstore_approve` bit(1) NOT NULL,
  `store_address` varchar(255) DEFAULT NULL,
  `store_credit` int(11) NOT NULL,
  `store_info` longtext,
  `store_msn` varchar(255) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `store_ower` varchar(255) DEFAULT NULL,
  `store_ower_card` varchar(255) DEFAULT NULL,
  `store_qq` varchar(255) DEFAULT NULL,
  `store_recommend` bit(1) NOT NULL,
  `store_recommend_time` datetime DEFAULT NULL,
  `store_seo_description` longtext,
  `store_seo_keywords` longtext,
  `store_status` int(11) NOT NULL,
  `store_telephone` varchar(255) DEFAULT NULL,
  `store_zip` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `validity` datetime DEFAULT NULL,
  `violation_reseaon` longtext,
  `area_id` bigint(20) DEFAULT NULL,
  `card_id` bigint(20) DEFAULT NULL,
  `grade_id` bigint(20) DEFAULT NULL,
  `sc_id` bigint(20) DEFAULT NULL,
  `store_banner_id` bigint(20) DEFAULT NULL,
  `store_license_id` bigint(20) DEFAULT NULL,
  `store_logo_id` bigint(20) DEFAULT NULL,
  `update_grade_id` bigint(20) DEFAULT NULL,
  `domain_modify_count` int(11) DEFAULT '0',
  `store_second_domain` varchar(255) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT '0',
  `store_lat` decimal(6,2) DEFAULT NULL,
  `store_lng` decimal(6,2) DEFAULT NULL,
  `store_ww` varchar(255) DEFAULT NULL,
  `map_type` varchar(255) DEFAULT 'baidu',
  `delivery_begin_time` datetime DEFAULT NULL,
  `delivery_end_time` datetime DEFAULT NULL,
  `combin_begin_time` datetime DEFAULT NULL,
  `combin_end_time` datetime DEFAULT NULL,
  `weixin_begin_time` date DEFAULT NULL,
  `weixin_end_time` date DEFAULT NULL,
  `weixin_status` int(11) DEFAULT '0',
  `weixin_appId` varchar(255) DEFAULT NULL,
  `weixin_appSecret` varchar(255) DEFAULT NULL,
  `weixin_token` varchar(255) DEFAULT NULL,
  `weixin_welecome_content` longtext,
  `weixin_qr_img_id` bigint(20) DEFAULT NULL,
  `weixin_account` varchar(255) DEFAULT NULL,
  `store_weixin_logo_id` bigint(20) DEFAULT NULL,
  `weixin_store_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1A2E9F4AFA5E3FC2` (`area_id`),
  KEY `FK1A2E9F4A8D04BD7` (`update_grade_id`),
  KEY `FK1A2E9F4A33028121` (`grade_id`),
  KEY `FK1A2E9F4A11D81442` (`weixin_qr_img_id`),
  KEY `FK1A2E9F4A929E09BB` (`store_logo_id`),
  KEY `FK1A2E9F4A7CE341A` (`store_banner_id`),
  KEY `FK1A2E9F4A9A6FEF94` (`card_id`),
  KEY `FK1A2E9F4AC98DF95A` (`store_weixin_logo_id`),
  KEY `FK1A2E9F4A33F45DA9` (`sc_id`),
  KEY `FK1A2E9F4AA10642E1` (`store_license_id`),
  CONSTRAINT `FK1A2E9F4A11D81442` FOREIGN KEY (`weixin_qr_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4A33028121` FOREIGN KEY (`grade_id`) REFERENCES `shopping_storegrade` (`id`),
  CONSTRAINT `FK1A2E9F4A33F45DA9` FOREIGN KEY (`sc_id`) REFERENCES `shopping_storeclass` (`id`),
  CONSTRAINT `FK1A2E9F4A7CE341A` FOREIGN KEY (`store_banner_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4A8D04BD7` FOREIGN KEY (`update_grade_id`) REFERENCES `shopping_storegrade` (`id`),
  CONSTRAINT `FK1A2E9F4A929E09BB` FOREIGN KEY (`store_logo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4A9A6FEF94` FOREIGN KEY (`card_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4AA10642E1` FOREIGN KEY (`store_license_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4AC98DF95A` FOREIGN KEY (`store_weixin_logo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK1A2E9F4AFA5E3FC2` FOREIGN KEY (`area_id`) REFERENCES `shopping_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32770 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_store
-- ----------------------------
INSERT INTO `shopping_store` VALUES ('1', '2013-12-24 12:55:25', '', '', '', 'xxxxx', '1801', '', '88888888@qq.con', '平台自营店', 'shopping', '123456789012345678', '88888888', '', '2015-03-02 20:05:48', '', '', '2', '024-32323528', '110003', 'blue', null, '', '4522485', null, '1', '1', '426498', null, null, null, '3', 'shopping', '1', '41.79', '123.37', '', 'baidu', '2014-09-28 10:51:35', '2020-11-28 10:51:35', '2014-10-09 12:13:35', '2010-08-09 12:13:35', '2014-11-12', '2015-07-12', '2', 'wx9c8421965912b0f5', '390fc5d329489a203df74407109ea46c', 'shopping_c2c', '<p>\r\n	欢迎来到shopping商城</p>', '426061', 'shopping_c2c商城', null, null);
INSERT INTO `shopping_store` VALUES ('32769', '2014-09-25 11:26:36', '', '', '', 'xxxx', '0', null, null, '宏达通信', '宏达', '', null, '', '2014-09-25 12:16:43', null, null, '2', null, '110020', 'pink', null, null, '4522489', null, '1', '20', null, null, null, null, '0', 'shop32769', '0', null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `shopping_storecart`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_storecart`;
CREATE TABLE `shopping_storecart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `cart_session_id` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `sc_status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7EE3A390537B6C51` (`user_id`),
  KEY `FK1808656A1C0CA9F2` (`store_id`),
  KEY `FK1808656A1E208F02` (`user_id`),
  CONSTRAINT `FK1808656A1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK1808656A1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK7EE3A390537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_storecart
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_storeclass`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_storeclass`;
CREATE TABLE `shopping_storeclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `description_evaluate` decimal(4,1) DEFAULT NULL,
  `service_evaluate` decimal(4,1) DEFAULT NULL,
  `ship_evaluate` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE909086EA8D80D0F` (`parent_id`),
  CONSTRAINT `FKE909086EA8D80D0F` FOREIGN KEY (`parent_id`) REFERENCES `shopping_storeclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_storeclass
-- ----------------------------
INSERT INTO `shopping_storeclass` VALUES ('1', '2013-12-24 10:22:29', '', '????', '0', '0', null, '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('2', '2013-12-24 10:22:46', '', '男装', '1', '1', '1', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('3', '2013-12-24 10:22:55', '', '女装', '1', '2', '1', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('4', '2013-12-24 10:23:12', '', '童装', '1', '3', '1', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('5', '2013-12-24 10:24:38', '', '家居内衣', '1', '4', '1', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('6', '2013-12-24 10:24:56', '', '鞋包配饰', '0', '1', null, '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('7', '2013-12-24 10:25:12', '', '男鞋', '1', '1', '6', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('8', '2013-12-24 10:25:22', '', '女鞋', '1', '2', '6', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('9', '2013-12-24 10:25:47', '', '男包/女包', '1', '3', '6', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('10', '2013-12-24 10:26:06', '', '旅行箱包', '1', '4', '6', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('11', '2013-12-24 10:26:26', '', '时尚配饰', '1', '5', '6', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('12', '2013-12-24 10:26:56', '', '户外运动', '0', '3', null, '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('13', '2013-12-24 10:27:24', '', '运动服/运动鞋', '1', '1', '12', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('14', '2013-12-24 10:27:37', '', '户外装备', '1', '1', '12', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('15', '2013-12-24 10:27:47', '', '运动健身', '1', '2', '12', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('16', '2013-12-24 10:28:09', '', '数码电子', '0', '4', null, '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('17', '2013-12-24 10:28:26', '', '笔记本电脑', '1', '1', '16', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('18', '2013-12-24 10:28:36', '', '摄像照相', '1', '1', '16', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('19', '2013-12-24 10:28:48', '', '办公数码', '1', '2', '16', '0.0', '0.0', '0.0');
INSERT INTO `shopping_storeclass` VALUES ('20', '2013-12-24 10:29:01', '', '数码配件', '1', '4', '16', '0.0', '0.0', '0.0');

-- ----------------------------
-- Table structure for `shopping_storegrade`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_storegrade`;
CREATE TABLE `shopping_storegrade` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `add_funciton` varchar(255) DEFAULT NULL,
  `audit` bit(1) NOT NULL,
  `content` longtext,
  `goodsCount` int(11) NOT NULL,
  `gradeLevel` int(11) NOT NULL,
  `gradeName` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `sequence` int(11) NOT NULL,
  `spaceSize` float NOT NULL,
  `sysGrade` bit(1) NOT NULL,
  `templates` varchar(255) DEFAULT NULL,
  `acount_num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_storegrade
-- ----------------------------
INSERT INTO `shopping_storegrade` VALUES ('1', '2013-12-24 10:20:27', '', 'editor_multimedia', '', '免费店铺', '300', '0', '默认等级', '免费店铺', '0', '0', '', 'tea,violet,black,green,pink,blue,default,', '2');
INSERT INTO `shopping_storegrade` VALUES ('2', '2013-12-24 10:20:59', '', 'editor_multimedia', '', '每月100元', '500', '1', '蓝钻级', '每月100元', '1', '0', '', 'green,pink,blue,default,', '0');
INSERT INTO `shopping_storegrade` VALUES ('3', '2013-12-24 10:21:31', '', 'editor_multimedia', '', '每月200元', '1000', '2', '黄钻级', '每月200元', '2', '0', '', 'wood,clothes,china,beach,violet,black,green,pink,blue,default,', '0');

-- ----------------------------
-- Table structure for `shopping_storegrade_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_storegrade_log`;
CREATE TABLE `shopping_storegrade_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `log_edit` bit(1) NOT NULL,
  `store_grade_info` varchar(255) DEFAULT NULL,
  `store_grade_status` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK10CE6C6C920D7683` (`store_id`),
  KEY `FK597AC2D21C0CA9F2` (`store_id`),
  CONSTRAINT `FK10CE6C6C920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK597AC2D21C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_storegrade_log
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_store_nav`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_store_nav`;
CREATE TABLE `shopping_store_nav` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `display` bit(1) NOT NULL,
  `sequence` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `win_type` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1806C2AE1C0CA9F2` (`store_id`),
  CONSTRAINT `FK1806C2AE1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_store_nav
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_store_partner`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_store_partner`;
CREATE TABLE `shopping_store_partner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `sequence` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC63438D31C0CA9F2` (`store_id`),
  CONSTRAINT `FKC63438D31C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_store_partner
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_store_point`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_store_point`;
CREATE TABLE `shopping_store_point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `description_evaluate` decimal(4,1) DEFAULT NULL,
  `description_evaluate_halfyear` decimal(4,1) DEFAULT NULL,
  `description_evaluate_halfyear_count1` int(11) NOT NULL,
  `description_evaluate_halfyear_count2` int(11) NOT NULL,
  `description_evaluate_halfyear_count3` int(11) NOT NULL,
  `description_evaluate_halfyear_count4` int(11) NOT NULL,
  `description_evaluate_halfyear_count5` int(11) NOT NULL,
  `service_evaluate` decimal(4,1) DEFAULT NULL,
  `service_evaluate_halfyear` decimal(4,1) DEFAULT NULL,
  `service_evaluate_halfyear_count1` int(11) NOT NULL,
  `service_evaluate_halfyear_count2` int(11) NOT NULL,
  `service_evaluate_halfyear_count3` int(11) NOT NULL,
  `service_evaluate_halfyear_count4` int(11) NOT NULL,
  `service_evaluate_halfyear_count5` int(11) NOT NULL,
  `ship_evaluate` decimal(4,1) DEFAULT NULL,
  `ship_evaluate_halfyear` decimal(4,1) DEFAULT NULL,
  `ship_evaluate_halfyear_count1` int(11) NOT NULL,
  `ship_evaluate_halfyear_count2` int(11) NOT NULL,
  `ship_evaluate_halfyear_count3` int(11) NOT NULL,
  `ship_evaluate_halfyear_count4` int(11) NOT NULL,
  `ship_evaluate_halfyear_count5` int(11) NOT NULL,
  `store_evaluate1` decimal(4,1) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `statTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK3183385B1C0CA9F2` (`store_id`),
  CONSTRAINT `FK3183385B1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32770 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_store_point
-- ----------------------------
INSERT INTO `shopping_store_point` VALUES ('1', '2014-01-05 15:07:48', '', '0.0', '0.0', '0', '0', '0', '0', '0', '0.0', '0.0', '0', '0', '0', '0', '0', '0.0', '0.0', '0', '0', '0', '0', '0', '0.0', '1', '2018-05-19 21:30:00');
INSERT INTO `shopping_store_point` VALUES ('32769', null, '', '0.0', '0.0', '0', '0', '0', '0', '0', '0.0', '0.0', '0', '0', '0', '0', '0', '0.0', '0.0', '0', '0', '0', '0', '0', '0.0', '32769', '2018-05-19 21:30:00');

-- ----------------------------
-- Table structure for `shopping_store_slide`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_store_slide`;
CREATE TABLE `shopping_store_slide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `acc_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31AC207C1C0CA9F2` (`store_id`),
  KEY `FK31AC207C24933083` (`acc_id`),
  CONSTRAINT `FK31AC207C1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK31AC207C24933083` FOREIGN KEY (`acc_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_store_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_store_stat`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_store_stat`;
CREATE TABLE `shopping_store_stat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `all_goods` int(11) NOT NULL,
  `all_store` int(11) NOT NULL,
  `all_user` int(11) NOT NULL,
  `next_time` datetime DEFAULT NULL,
  `order_amount` decimal(12,2) DEFAULT NULL,
  `store_update` int(11) NOT NULL,
  `week_complaint` int(11) NOT NULL,
  `week_goods` int(11) NOT NULL,
  `week_order` int(11) NOT NULL,
  `week_report` int(11) NOT NULL,
  `week_store` int(11) NOT NULL,
  `week_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_store_stat
-- ----------------------------
INSERT INTO `shopping_store_stat` VALUES ('1', '2018-05-19 21:30:00', '', '0', '2', '2', '2018-05-19 22:00:00', '0.00', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `shopping_sysconfig`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_sysconfig`;
CREATE TABLE `shopping_sysconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `bigHeight` int(11) NOT NULL,
  `bigWidth` int(11) NOT NULL,
  `closeReason` longtext,
  `codeStat` longtext,
  `complaint_time` int(11) NOT NULL,
  `consumptionRatio` int(11) NOT NULL,
  `copyRight` varchar(255) DEFAULT NULL,
  `creditrule` longtext,
  `deposit` bit(1) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `emailEnable` bit(1) NOT NULL,
  `emailHost` varchar(255) DEFAULT NULL,
  `emailPort` int(11) NOT NULL,
  `emailPws` varchar(255) DEFAULT NULL,
  `emailTest` varchar(255) DEFAULT NULL,
  `emailUser` varchar(255) DEFAULT NULL,
  `emailUserName` varchar(255) DEFAULT NULL,
  `everyIndentLimit` int(11) NOT NULL,
  `gold` bit(1) NOT NULL,
  `goldMarketValue` int(11) NOT NULL,
  `groupBuy` bit(1) NOT NULL,
  `hotSearch` varchar(255) DEFAULT NULL,
  `imageFilesize` int(11) NOT NULL,
  `imageSaveType` varchar(255) DEFAULT NULL,
  `imageSuffix` varchar(255) DEFAULT NULL,
  `indentComment` int(11) NOT NULL,
  `integral` bit(1) NOT NULL,
  `integralRate` int(11) NOT NULL,
  `integralStore` bit(1) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `memberDayLogin` int(11) NOT NULL,
  `memberRegister` int(11) NOT NULL,
  `middleHeight` int(11) NOT NULL,
  `middleWidth` int(11) NOT NULL,
  `securityCodeConsult` bit(1) NOT NULL,
  `securityCodeLogin` bit(1) NOT NULL,
  `securityCodeRegister` bit(1) NOT NULL,
  `securityCodeType` varchar(255) DEFAULT NULL,
  `share_code` longtext,
  `smallHeight` int(11) NOT NULL,
  `smallWidth` int(11) NOT NULL,
  `smsEnbale` bit(1) NOT NULL,
  `smsPassword` varchar(255) DEFAULT NULL,
  `smsTest` varchar(255) DEFAULT NULL,
  `smsURL` varchar(255) DEFAULT NULL,
  `smsUserName` varchar(255) DEFAULT NULL,
  `store_allow` bit(1) NOT NULL,
  `store_payment` longtext,
  `sysLanguage` varchar(255) DEFAULT NULL,
  `templates` longtext,
  `title` varchar(255) DEFAULT NULL,
  `uploadFilePath` varchar(255) DEFAULT NULL,
  `user_creditrule` longtext,
  `visitorConsult` bit(1) NOT NULL,
  `voucher` bit(1) NOT NULL,
  `websiteName` varchar(255) DEFAULT NULL,
  `websiteState` bit(1) NOT NULL,
  `ztc_price` int(11) NOT NULL,
  `ztc_status` bit(1) NOT NULL,
  `goodsImage_id` bigint(20) DEFAULT NULL,
  `memberIcon_id` bigint(20) DEFAULT NULL,
  `storeImage_id` bigint(20) DEFAULT NULL,
  `websiteLogo_id` bigint(20) DEFAULT NULL,
  `domain_allow_count` int(11) DEFAULT '0',
  `second_domain_open` bit(1) DEFAULT b'0',
  `sys_domain` longtext,
  `qq_login` bit(1) DEFAULT b'0',
  `qq_login_id` varchar(255) DEFAULT NULL,
  `qq_login_key` varchar(255) DEFAULT NULL,
  `qq_domain_code` longtext,
  `sina_domain_code` longtext,
  `sina_login` bit(1) DEFAULT b'0',
  `sina_login_id` varchar(255) DEFAULT NULL,
  `sina_login_key` varchar(255) DEFAULT NULL,
  `imageWebServer` varchar(255) DEFAULT NULL,
  `lucene_update` datetime DEFAULT NULL,
  `alipay_fenrun` int(11) DEFAULT '0',
  `balance_fenrun` int(11) DEFAULT '0',
  `auto_order_confirm` int(11) DEFAULT '7',
  `auto_order_notice` int(11) DEFAULT '3',
  `bargain_maximum` int(11) DEFAULT '0',
  `bargain_rebate` decimal(3,2) DEFAULT NULL,
  `bargain_state` longtext,
  `bargain_status` int(11) DEFAULT '0',
  `bargain_title` varchar(255) DEFAULT NULL,
  `service_qq_list` longtext,
  `service_telphone_list` longtext,
  `sys_delivery_maximum` int(11) DEFAULT '0',
  `uc_bbs` bit(1) DEFAULT b'0',
  `kuaidi_id` longtext,
  `uc_api` varchar(255) DEFAULT NULL,
  `uc_appid` varchar(255) DEFAULT NULL,
  `uc_database` varchar(255) DEFAULT NULL,
  `uc_database_port` varchar(255) DEFAULT NULL,
  `uc_database_pws` varchar(255) DEFAULT NULL,
  `uc_database_url` varchar(255) DEFAULT NULL,
  `uc_database_username` varchar(255) DEFAULT NULL,
  `uc_ip` varchar(255) DEFAULT NULL,
  `uc_key` varchar(255) DEFAULT NULL,
  `uc_table_preffix` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT '¥',
  `bargain_validity` int(11) DEFAULT '3',
  `delivery_amount` int(11) DEFAULT '50',
  `delivery_status` int(11) DEFAULT '0',
  `delivery_title` varchar(255) DEFAULT NULL,
  `websiteCss` varchar(255) DEFAULT 'blue',
  `combin_amount` int(11) DEFAULT '50',
  `combin_count` int(11) DEFAULT '3',
  `ztc_goods_view` int(11) DEFAULT '0',
  `auto_order_evaluate` int(11) DEFAULT '7',
  `auto_order_return` int(11) DEFAULT '7',
  `weixin_store` bit(1) DEFAULT b'0',
  `weixin_amount` int(11) DEFAULT '50',
  `config_payment_type` int(11) DEFAULT '0',
  `weixin_account` varchar(255) DEFAULT NULL,
  `weixin_appId` varchar(255) DEFAULT NULL,
  `weixin_appSecret` varchar(255) DEFAULT NULL,
  `weixin_token` varchar(255) DEFAULT NULL,
  `weixin_welecome_content` longtext,
  `store_weixin_logo_id` bigint(20) DEFAULT NULL,
  `weixin_qr_img_id` bigint(20) DEFAULT NULL,
  `site_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDA007E38D756261E` (`websiteLogo_id`),
  KEY `FKDA007E38BE67A14A` (`storeImage_id`),
  KEY `FKDA007E3811D81442` (`weixin_qr_img_id`),
  KEY `FKDA007E381CBC7DB1` (`memberIcon_id`),
  KEY `FKDA007E38C98DF95A` (`store_weixin_logo_id`),
  KEY `FKDA007E382984FABF` (`goodsImage_id`),
  CONSTRAINT `FKDA007E3811D81442` FOREIGN KEY (`weixin_qr_img_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKDA007E381CBC7DB1` FOREIGN KEY (`memberIcon_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKDA007E382984FABF` FOREIGN KEY (`goodsImage_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKDA007E38BE67A14A` FOREIGN KEY (`storeImage_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKDA007E38C98DF95A` FOREIGN KEY (`store_weixin_logo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FKDA007E38D756261E` FOREIGN KEY (`websiteLogo_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_sysconfig
-- ----------------------------
INSERT INTO `shopping_sysconfig` VALUES ('1', '2016-03-08 19:56:41', '', '', '1024', '1024', '?????...', '<script type=\"text/javascript\">var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");document.write(unescape(\"%3Cspan id=\'cnzz_stat_icon_1257547103\'%3E%3C/span%3E%3Cscript src=\'\" + cnzz_protocol + \"s11.cnzz.com/z_stat.php%3Fid%3D1257547103\' type=\'text/javascript\'%3E%3C/script%3E\"));</script>', '30', '10', null, '{\"creditrule29\":1500,\"creditrule28\":1401,\"creditrule27\":1400,\"creditrule26\":1301,\"creditrule25\":1300,\"creditrule24\":1201,\"creditrule23\":1200,\"creditrule22\":1101,\"creditrule21\":1100,\"creditrule20\":1001,\"creditrule2\":101,\"creditrule1\":100,\"creditrule4\":201,\"creditrule3\":200,\"creditrule0\":1,\"creditrule19\":1000,\"creditrule18\":901,\"creditrule9\":500,\"creditrule7\":400,\"creditrule15\":800,\"creditrule8\":401,\"creditrule14\":701,\"creditrule5\":300,\"creditrule17\":900,\"creditrule6\":301,\"creditrule16\":801,\"creditrule11\":600,\"creditrule10\":501,\"creditrule13\":700,\"creditrule12\":601}', '', 'shopping,health,??,???,???,???,???', '', 'smtp.163.com', '25', 'healthcoin132', 'healthcoin@163.com', 'healthcoin@163.com', '????', '0', '', '10', '', '????,????,????,????,???', '1024', 'sidYearMonthDayImg', 'gif|jpg|jpeg|bmp|png|tbi', '1', '', '0', '', 'shopping,health,??,???,???,???,???', '1', '10', '300', '300', '', '', '', 'normal', '<div id=\"bdshare\" class=\"bdshare_t bds_tools get-codes-bdshare\">\r\n<a class=\"bds_tsina\"></a>\r\n<a class=\"bds_tqq\"></a>\r\n<span class=\"bds_more\">??</span>\r\n<a class=\"shareCount\"></a>\r\n</div>\r\n<script type=\"text/javascript\" id=\"bdshare_js\" data=\"type=tools&uid=5015224\" ></script>\r\n<script type=\"text/javascript\" id=\"bdshell_js\"></script>\r\n<script type=\"text/javascript\">\r\ndocument.getElementById(\"bdshell_js\").src = \"http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=\" + Math.ceil(new Date()/3600000)\r\n</script>', '160', '160', '', '123456', '13641194411', null, 'shopping_admin', '', '{\"alipay_wap\":true,\"balance\":true,\"payafter\":true,\"weixin\":true,\"alipay\":true,\"paypal\":true,\"outline\":true}', 'zh_cn', 'default\r\nblue\r\npink\r\ngreen\r\nblack\r\nviolet\r\nbeach\r\nchina\r\nclothes\r\nwood\r\nlovely\r\nembossed\r\ntea\r\nclassic_black\r\nredware\r\ncoloured_glaze\r\norange\r\nchocolate\r\nbamboo\r\nflax', 'health', 'upload', '{\"creditrule29\":800,\"creditrule28\":751,\"creditrule27\":700,\"creditrule26\":651,\"creditrule25\":650,\"creditrule24\":601,\"creditrule23\":600,\"creditrule22\":551,\"creditrule21\":550,\"creditrule20\":501,\"creditrule2\":51,\"creditrule1\":50,\"creditrule4\":101,\"creditrule3\":100,\"creditrule0\":1,\"creditrule19\":500,\"creditrule18\":451,\"creditrule9\":250,\"creditrule7\":200,\"creditrule15\":400,\"creditrule8\":201,\"creditrule14\":351,\"creditrule5\":150,\"creditrule17\":450,\"creditrule6\":151,\"creditrule16\":401,\"creditrule11\":300,\"creditrule10\":251,\"creditrule13\":350,\"creditrule12\":301}', '', '', 'health', '', '30', '', '1', '2', '3', '426500', '3', '', 'bbs\r\nforum', '', '', '', '', '<meta property=\"wb:webmaster\" content=\"3c0d2bedd819ab1c\" />', '', '857824403', 'c64298f7b04d0a56613b327791d0fa0f', null, '2018-05-19 00:00:04', '0', '0', '7', '3', '20', '8.00', '', '1', '????', '508188494', '13910227615', '0', '', '4c68365adbe58d72', '', '', '', '', '', '', '', '', '', '', '¥', '3', '30', '1', '???', 'blue', '60', '5', '0', '7', '7', '', '50', '1', 'shopping_c2c???', 'jkdserdfger3dfgdfgvbd54dfgdf', '34sdfsdfsdge34sdgsdgdshtgf657sdfgsd43sdfsdgsd', 'shopping_c2c', '???????\r\n          \r\n          \r\n          \r\n          ', null, '426063', '');

-- ----------------------------
-- Table structure for `shopping_syslog`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_syslog`;
CREATE TABLE `shopping_syslog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `ip` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEEA95FA8537B6C51` (`user_id`),
  KEY `FK2BED7C0E1E208F02` (`user_id`),
  CONSTRAINT `FK2BED7C0E1E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKEEA95FA8537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_syslog
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_template`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_template`;
CREATE TABLE `shopping_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `info` varchar(255) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `open` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229416 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_template
-- ----------------------------
INSERT INTO `shopping_template` VALUES ('229384', '2013-09-03 10:32:50', '', '$!user.userName,您好，您的店铺因违规被关闭！原因是:$!reason<br />', '[给卖家]店铺被管理员关闭时的通知', 'msg_toseller_store_closed_notify', '', '店铺违规关闭', 'msg');
INSERT INTO `shopping_template` VALUES ('229385', '2013-12-21 13:44:33', '', '尊敬的用户，您的店铺已被关闭，原因是：店铺已到期', '[给卖家]店铺过期被自动关闭时的通知', 'msg_toseller_store_auto_closed_notify', '', '店铺过期被自动关闭时的通知', 'msg');
INSERT INTO `shopping_template` VALUES ('229386', '2013-12-21 14:43:06', '', '<p>\r\n	$!user.userName,您好!\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp; 您的商品$!{goods.goods_name}被管理员删除！原因是:$!reason\r\n</p>', '[给卖家]商品被管理员删除时的通知', 'msg_toseller_goods_delete_by_admin_notify', '', '商品被管理员删除时的通知', 'msg');
INSERT INTO `shopping_template` VALUES ('229387', '2013-12-21 14:45:53', '', '<p>\r\n	$!user.userName,您好！\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp; 您的店铺$!{store.store_name}被申请通过！\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队\r\n</p>', '[给卖家]开店申请被通过时的通知', 'msg_toseller_store_update_allow_notify', '', '开店申请通过', 'msg');
INSERT INTO `shopping_template` VALUES ('229388', '2013-12-21 14:59:19', '', '$!user.userName,您好！<br />\r\n<br />\r\n&nbsp;&nbsp; 您的店铺$!{store.store_name}被拒绝通过！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队', '[给卖家]开店申请被拒绝时的通知', 'msg_toseller_store_update_refuse_notify', '', '开店申请被拒绝', 'msg');
INSERT INTO `shopping_template` VALUES ('229389', '2013-12-21 15:02:50', '', '<p>\r\n	$!{buyer.userName},您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 您的订单$!{order.order_id}支付费用被卖家$!{seller.userName}调整为$!{order.totalPrice}！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '[给买家]店铺调整了订单费用的邮件通知', 'email_tobuyer_order_update_fee_notify', '', '店铺调整了订单费用', 'email');
INSERT INTO `shopping_template` VALUES ('229390', '2013-12-21 15:07:29', '', '$!{buyer.userName},您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 您的订单$!{order.order_id}已经发货，物流信息为:$!{order.ship.shipping_name}，物流单号为:$!{order.shipCode},发货时间为:$!{order.shipTime}！<br />\r\n<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{seller_time}\r\n</p>', '[给买家]订单已发货的邮件通知', 'email_tobuyer_order_ship_notify', '', '订单已发货的邮件通知', 'email');
INSERT INTO `shopping_template` VALUES ('229391', '2013-12-21 15:09:38', '', '$!{buyer.userName},您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 您的订单$!{order.order_id}已经被取消！<br />\r\n<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}\r\n</p>', '[给买家]订单被取消的邮件通知', 'email_tobuyer_order_cancel_notify', '', '订单被取消的通知', 'email');
INSERT INTO `shopping_template` VALUES ('229392', '2013-12-21 15:16:36', '', '$!{buyer.userName},您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 您的订单$!{order.order_id}已经收到线下付款，我们会及时发货哦！<br />\r\n<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}\r\n</p>', '[给买家]店铺确认收到线下支付的邮件通知', 'email_tobuyer_order_outline_pay_ok_notify', '', '店铺确认收到线下支付', 'email');
INSERT INTO `shopping_template` VALUES ('229393', '2013-12-21 15:21:13', '', '$!{buyer.userName},您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 您的订单$!{order.order_id}已经提交成功，请及时付款哦！<br />\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队\r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}\r\n</p>', '[给买家]订单提交成功的邮件通知', 'email_tobuyer_order_submit_ok_notify', '', '订单提交成功的邮件通知', 'email');
INSERT INTO `shopping_template` VALUES ('229394', '2013-12-21 15:28:09', '', '$!{buyer.userName},您好！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp; 您的对$!{goods.goods_name}的咨询，有了回复，详情见:$!{webPath}/goods_view_$!{goods.id}.htm<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}', '[给买家]商品咨询得到了回复的邮件通知', 'email_tobuyer_cousult_reply_notify', '', '商品咨询得到了回复', 'email');
INSERT INTO `shopping_template` VALUES ('229395', '2013-12-21 16:11:06', '', '$!{seller.userName},您好！<br />\r\n&nbsp;&nbsp;&nbsp; $!{buyer.userName}取消了订单号为:$!{order.order_id}的订单！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}', '[给卖家]买家取消了订单的邮件通知', 'email_toseller_order_cancel_notify', '', '买家取消了订单', 'email');
INSERT INTO `shopping_template` VALUES ('229396', '2013-12-21 16:13:34', '', '$!{seller.userName},您好！<br />\r\n&nbsp;&nbsp;&nbsp; $!{buyer.userName}对订单号为:$!{order.order_id}的订单完成了线下付款，请及时审核！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}', '[给卖家]买家已经完成线下付款的邮件通知', 'email_toseller_outline_pay_ok_notify', '', '买家已经完成线下付款', 'email');
INSERT INTO `shopping_template` VALUES ('229397', '2013-12-21 16:16:51', '', '$!{seller.userName},您好！<br />\r\n&nbsp;&nbsp;&nbsp; $!{buyer.userName}已经确认订单号为:$!{order.order_id}的订单收货！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}', '[给卖家]买家确认收货的邮件通知', 'email_toseller_order_receive_ok_notify', '', '买家确认收货', 'email');
INSERT INTO `shopping_template` VALUES ('229398', '2013-12-21 16:18:42', '', '$!{seller.userName},您好！<br />\r\n&nbsp;&nbsp;&nbsp; $!{buyer.userName}已经对订单号为:$!{order.order_id}的订单完成评价！<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}运营团队<br />\r\n<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}<br />', '[给卖家]买家完成评价的邮件通知', 'email_toseller_evaluate_ok_notify', '', '买家完成评价的邮件通知', 'email');
INSERT INTO `shopping_template` VALUES ('229399', '2013-12-21 16:29:06', '', '$!{buyer.userName}，您好，您的订单$!{order.order_id}费用调整为$!{order.totalPrice}。$!{config.title}$!{send_time}', '[给买家]店铺调整了订单费用的短信通知', 'sms_tobuyer_order_fee_notify', '', '店铺调整了订单费用的短信', 'sms');
INSERT INTO `shopping_template` VALUES ('229400', '2013-12-21 16:30:47', '', '$!{buyer.userName}，您好，您的订单$!{order.order_id}已经发货，详情请登录$!{webPath}买家后台查看。$!{config.title}$!{send_time}', '[给买家]订单已发货的短信通知', 'sms_tobuyer_order_ship_notify', '', '订单已发货的短信', 'sms');
INSERT INTO `shopping_template` VALUES ('229401', '2013-12-21 16:33:07', '', '$!{buyer.userName}，您好，您的订单$!{order.order_id}已经取消，详情请登录$!{webPath}买家后台查看。$!{config.title}$!{send_time}', '[给买家]订单被取消的短信通知', 'sms_tobuyer_order_cancel_notify', '', '订单被取消的短信', 'sms');
INSERT INTO `shopping_template` VALUES ('229402', '2013-12-21 16:33:59', '', '$!{buyer.userName}，您好，您的订单$!{order.order_id}已经收到线下付款，详情请登录$!{webPath}买家后台查看。$!{config.title}$!{send_time}', '[给买家]卖家确认收到线下支付的短信通知', 'sms_tobuyer_order_outline_pay_ok_notify', '', '卖家确认收到线下支付的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229403', '2013-12-21 16:36:31', '', '$!{buyer.userName}，您好，您的订单$!{order.order_id}已经提交成功，详情请登录“$!{config.title}”买家后台查看，$!{config.title}。$!{send_time}', '[给买家]订单提交成功的短信通知', 'sms_tobuyer_order_submit_ok_notify', '', '订单提交成功的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229404', '2013-12-21 16:38:34', '', '$!{seller.userName}，您好，$!{buyer.userName}取消了订单$!{order.order_id}，详情请登录$!{webPath}卖家后台查看。$!{config.title}$!{send_time}', '[给卖家]买家取消了订单的短信通知', 'sms_toseller_order_cancel_notify', '', '买家取消了订单的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229405', '2013-12-21 16:40:07', '', '$!{seller.userName}，您好，$!{buyer.userName}提交了订单$!{order.order_id}线下付款，详情请登录$!{webPath}卖家后台查看。$!{config.title}$!{send_time}', '[给卖家]买家已经完成线下付款的短信通知', 'sms_toseller_outline_pay_ok_notify', '', '买家已经完成线下付款的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229406', '2013-12-21 16:41:19', '', '$!{seller.userName}，您好，$!{buyer.userName}确认了订单$!{order.order_id}线下收货，详情请登录$!{webPath}卖家后台查看。$!{config.title}$!{send_time}', '[给卖家]买家确认收货的短信通知', 'sms_toseller_order_receive_ok_notify', '', '买家确认收货的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229407', '2014-03-25 16:35:25', '', '$!{user.userName}，您好！您在$!{config.title}用户名为$!{user.userName},于$!{send_time}绑定手机号$!{user.mobile},如有疑问，请及时与$!{config.title}联系！', '[给买家]用户绑定手机号码的短信提示', 'sms_tobuyer_mobilebind_notify', '', '用户绑定手机号码的短信提示', 'sms');
INSERT INTO `shopping_template` VALUES ('229408', '2014-03-25 16:53:13', '', '$!{user.userName}，您好！您于$!{send_time}密码修改成功！$!{config.title}', '[给买家]用户密码修改成功的短信提示', 'sms_tobuyer_pws_modify_notify', '', '用户密码修改成功的短信提示', 'sms');
INSERT INTO `shopping_template` VALUES ('229409', '2014-03-25 17:02:45', '', '$!{seller.userName}，您好，$!{buyer.userName}订单$!{order.order_id}使用预存款付款成功，请及时发货。$!{config.title}$!{send_time}', '[给卖家]买家已经完成预存款付款的短信通知', 'sms_toseller_balance_pay_ok_notify', '', '买家已经完成预存款付款的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229410', '2014-03-25 17:04:43', '', '$!{buyer.userName}，您好，您的订单$!{order.order_id}使用预存款向卖家$!{seller.store.store_name}付款成功，请等待卖家发货。$!{config.title}$!{send_time}', '[给买家]买家完成预存款付款的短信通知', 'sms_tobuyer_balance_pay_ok_notify', '', '买家完成预存款付款的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229411', '2014-03-25 17:06:43', '', '$!{seller.userName}，您好，$!{buyer.userName}订单$!{order.order_id}使用预存款付款成功，请及时发货。<br />\r\n<p>\r\n	<span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}\r\n</p>\r\n<p>\r\n	<span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}\r\n</p>', '[给卖家]买家已经完成预存款付款的邮件通知', 'email_toseller_balance_pay_ok_notify', '', '买家已经完成预存款付款的邮件通知', 'email');
INSERT INTO `shopping_template` VALUES ('229412', '2014-03-25 17:07:36', '', '<p>\r\n	$!{buyer.userName}，您好，您的订单$!{order.order_id}使用$!{order.payment.name}向卖家$!{seller.store.store_name}付款成功，请等待卖家发货。\r\n</p>\r\n<p align=\"right\">\r\n	$!{config.title}\r\n</p>\r\n<p align=\"right\">\r\n	$!{send_time}\r\n</p>', '[给买家]买家完成在线付款的邮件通知', 'email_tobuyer_online_pay_ok_notify', '', '买家完成在线付款的邮件通知', 'email');
INSERT INTO `shopping_template` VALUES ('229413', '2014-03-25 18:02:16', '', '$!{seller.userName}，您好，$!{buyer.userName}订单$!{order.order_id}使用$!{order.payment.name}付款成功，请及时发货。<br />\r\n<p>\r\n	<span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{config.title}\r\n</p>\r\n<p>\r\n	<span></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $!{send_time}\r\n</p>', '[给卖家]买家已经完成在线付款的邮件通知', 'email_toseller_online_pay_ok_notify', '', '买家已经完成在线付款的邮件通知', 'email');
INSERT INTO `shopping_template` VALUES ('229414', '2014-03-25 18:03:03', '', '$!{buyer.userName}，您好，您的订单$!{order.order_id}使用$!{order.payment.name}向卖家$!{seller.store.store_name}付款成功，请等待卖家发货。$!{config.title}$!{send_time}', '[给买家]买家完成在线付款的短信通知', 'sms_tobuyer_online_pay_ok_notify', '', '买家完成在线付款的短信通知', 'sms');
INSERT INTO `shopping_template` VALUES ('229415', '2014-03-25 18:03:58', '', '$!{seller.userName}，您好，$!{buyer.userName}订单$!{order.order_id}使用$!{order.payment.name}付款成功，请及时发货。$!{config.title} $!{send_time}', '[给卖家]买家已经完成在线付款的短信通知', 'sms_toseller_online_pay_ok_notify', '', '买家已经完成在线付款的短信通知', 'sms');

-- ----------------------------
-- Table structure for `shopping_transport`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_transport`;
CREATE TABLE `shopping_transport` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `trans_ems` bit(1) NOT NULL,
  `trans_ems_info` longtext,
  `trans_express` bit(1) NOT NULL,
  `trans_express_info` longtext,
  `trans_mail` bit(1) NOT NULL,
  `trans_mail_info` longtext,
  `trans_name` varchar(255) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `trans_time` int(11) DEFAULT '0',
  `trans_type` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK58C67F38920D7683` (`store_id`),
  KEY `FKF1EB41121C0CA9F2` (`store_id`),
  CONSTRAINT `FK58C67F38920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FKF1EB41121C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_transport
-- ----------------------------
INSERT INTO `shopping_transport` VALUES ('2', '2014-09-24 16:44:08', '', '', '[{\"city_id\":\"-1\",\"city_name\":\"全国\",\"trans_add_fee\":5.0,\"trans_fee\":20.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,\",\"city_name\":\"景德镇、萍乡、抚州、赣州、南昌、吉安、宜春、新余、上饶、九江、鹰潭、阜阳、六安、宿州、安庆、池州、亳州、宣城、合肥、黄山、淮南、马鞍山、铜陵、淮北、蚌埠、芜湖、滁州、台州、丽水、嘉兴、湖州、温州、宁波、金华、绍兴、杭州、衢州、舟山、扬州、苏州、常州、泰州、镇江、南通、宿迁、连云港、无锡、徐州、盐城、淮安、南京、上海、\",\"trans_add_fee\":4.0,\"trans_fee\":20.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"287,286,285,284,283,282,281,280,279,278,277,276,275,274,273,272,271,270,269,268,267,266,265,264,263,262,261,260,259,258,257,256,255,254,253,252,\",\"city_name\":\"七台河、双鸭山、鹤岗、哈尔滨、牡丹江、佳木斯、齐齐哈尔、鸡西、绥化、伊春、大庆、黑河、大兴安岭、长春、白山、松原、通化、辽源、白城、四平、吉林、延边朝鲜族、丹东、锦州、盘锦、铁岭、葫芦岛、辽阳、朝阳、本溪、抚顺、营口、阜新、沈阳、大连、鞍山、\",\"trans_add_fee\":3.0,\"trans_fee\":20.0,\"trans_add_weight\":1,\"trans_weight\":1}]', '', '[{\"city_id\":\"-1\",\"city_name\":\"全国\",\"trans_add_fee\":2.0,\"trans_fee\":12.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"353,74,16,\",\"city_name\":\"重庆、北京、上海、\",\"trans_add_fee\":3.0,\"trans_fee\":13.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"274,273,272,271,270,269,268,267,266,265,264,263,262,261,260,259,258,257,256,255,254,253,252,\",\"city_name\":\"长春、白山、松原、通化、辽源、白城、四平、吉林、延边朝鲜族、丹东、锦州、盘锦、铁岭、葫芦岛、辽阳、朝阳、本溪、抚顺、营口、阜新、沈阳、大连、鞍山、\",\"trans_add_fee\":4.0,\"trans_fee\":14.0,\"trans_add_weight\":1,\"trans_weight\":1}]', '', '[{\"city_id\":\"-1\",\"city_name\":\"全国\",\"trans_add_fee\":2.0,\"trans_fee\":10.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"74,16,\",\"city_name\":\"北京、上海、\",\"trans_add_fee\":3.0,\"trans_fee\":10.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"265,264,263,262,261,260,259,258,257,256,255,254,253,252,\",\"city_name\":\"丹东、锦州、盘锦、铁岭、葫芦岛、辽阳、朝阳、本溪、抚顺、营口、阜新、沈阳、大连、鞍山、\",\"trans_add_fee\":3.0,\"trans_fee\":10.0,\"trans_add_weight\":1,\"trans_weight\":1}]', '顺丰物流', '1', '24', '0');
INSERT INTO `shopping_transport` VALUES ('4', '2014-09-25 13:49:37', '', '', '[{\"city_id\":\"-1\",\"city_name\":\"全国\",\"trans_add_fee\":5.0,\"trans_fee\":20.0,\"trans_add_weight\":1,\"trans_weight\":1}]', '', '[{\"city_id\":\"-1\",\"city_name\":\"全国\",\"trans_add_fee\":2.0,\"trans_fee\":15.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"127,126,125,124,123,122,121,120,119,118,117,116,115,114,113,112,111,110,109,108,107,106,105,104,103,102,101,100,99,98,97,96,95,94,93,92,91,90,89,88,86,85,84,83,82,81,80,79,78,77,76,75,74,67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,\",\"city_name\":\"乌兰察布、阿拉善、兴安、锡林郭勒、鄂尔多斯、通辽、呼伦贝尔、巴彦淖尔、赤峰、乌海、呼和浩特、包头、秦皇岛、石家庄、沧州、保定、邢台、唐山、承德、张家口、邯郸、衡水、廊坊、日照、德州、聊城、滨州、菏泽、莱芜、济南、威海、泰安、东营、烟台、济宁、枣庄、青岛、潍坊、淄博、临沂、朔州、晋城、长治、阳泉、吕梁、晋中、运城、忻州、太原、大同、临汾、天津、北京、景德镇、萍乡、抚州、赣州、南昌、吉安、宜春、新余、上饶、九江、鹰潭、阜阳、六安、宿州、安庆、池州、亳州、宣城、合肥、黄山、淮南、马鞍山、铜陵、淮北、蚌埠、芜湖、滁州、台州、丽水、嘉兴、湖州、温州、宁波、金华、绍兴、杭州、衢州、舟山、扬州、苏州、常州、泰州、镇江、南通、宿迁、连云港、无锡、徐州、盐城、淮安、南京、上海、\",\"trans_add_fee\":3.0,\"trans_fee\":15.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"287,286,285,284,283,282,281,280,279,278,277,276,275,274,273,272,271,270,269,268,267,266,265,264,263,262,261,260,259,258,257,256,255,254,253,252,179,178,177,176,175,174,173,172,171,170,169,168,167,166,165,164,163,162,161,160,159,158,157,156,155,154,153,152,151,150,149,148,147,146,145,144,143,142,141,140,139,138,137,136,135,134,133,132,131,\",\"city_name\":\"七台河、双鸭山、鹤岗、哈尔滨、牡丹江、佳木斯、齐齐哈尔、鸡西、绥化、伊春、大庆、黑河、大兴安岭、长春、白山、松原、通化、辽源、白城、四平、吉林、延边朝鲜族、丹东、锦州、盘锦、铁岭、葫芦岛、辽阳、朝阳、本溪、抚顺、营口、阜新、沈阳、大连、鞍山、焦作、鹤壁、济源、新乡、许昌、漯河、三门峡、周口、商丘、平顶山、驻马店、南阳、洛阳、开封、信阳、安阳、郑州、濮阳、襄阳、黄石、孝感、仙桃、潜江、天门、宜昌、武汉、荆门、神农架、随州、十堰、荆州、咸宁、黄冈、恩施、鄂州、湘潭、衡阳、株洲、郴州、怀化、常德、娄底、岳阳、张家界、邵阳、益阳、长沙、永州、湘西、\",\"trans_add_fee\":4.0,\"trans_fee\":16.0,\"trans_add_weight\":1,\"trans_weight\":1}]', '', '[{\"city_id\":\"-1\",\"city_name\":\"全国\",\"trans_add_fee\":2.0,\"trans_fee\":10.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"74,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,\",\"city_name\":\"北京、阜阳、六安、宿州、安庆、池州、亳州、宣城、合肥、黄山、淮南、马鞍山、铜陵、淮北、蚌埠、芜湖、滁州、台州、丽水、嘉兴、湖州、温州、宁波、金华、绍兴、杭州、衢州、舟山、扬州、苏州、常州、泰州、镇江、南通、宿迁、连云港、无锡、徐州、盐城、淮安、南京、上海、\",\"trans_add_fee\":2.0,\"trans_fee\":10.0,\"trans_add_weight\":1,\"trans_weight\":1}, {\"city_id\":\"265,264,263,262,261,260,259,258,257,256,255,254,253,252,104,103,102,101,100,99,98,97,96,95,94,93,92,91,90,89,88,86,85,84,83,82,81,80,79,78,77,76,75,\",\"city_name\":\"丹东、锦州、盘锦、铁岭、葫芦岛、辽阳、朝阳、本溪、抚顺、营口、阜新、沈阳、大连、鞍山、日照、德州、聊城、滨州、菏泽、莱芜、济南、威海、泰安、东营、烟台、济宁、枣庄、青岛、潍坊、淄博、临沂、朔州、晋城、长治、阳泉、吕梁、晋中、运城、忻州、太原、大同、临汾、天津、\",\"trans_add_fee\":3.0,\"trans_fee\":12.0,\"trans_add_weight\":1,\"trans_weight\":1}]', '顺丰按重量物流', '32769', '0', '1');

-- ----------------------------
-- Table structure for `shopping_trans_area`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_trans_area`;
CREATE TABLE `shopping_trans_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `areaName` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK4A86F2FBB19097FD` (`parent_id`),
  CONSTRAINT `FK4A86F2FBB19097FD` FOREIGN KEY (`parent_id`) REFERENCES `shopping_trans_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_trans_area
-- ----------------------------
INSERT INTO `shopping_trans_area` VALUES ('1', '2014-09-02 12:03:41', '', '华东', '0', '1', null);
INSERT INTO `shopping_trans_area` VALUES ('2', '2014-09-02 12:03:41', '', '华北', '0', '2', null);
INSERT INTO `shopping_trans_area` VALUES ('3', '2014-09-02 12:03:41', '', '华中', '0', '3', null);
INSERT INTO `shopping_trans_area` VALUES ('4', '2014-09-02 12:03:42', '', '华南', '0', '4', null);
INSERT INTO `shopping_trans_area` VALUES ('5', '2014-09-02 12:03:42', '', '东北', '0', '5', null);
INSERT INTO `shopping_trans_area` VALUES ('6', '2014-09-02 12:03:42', '', '西北', '0', '6', null);
INSERT INTO `shopping_trans_area` VALUES ('7', '2014-09-02 12:03:42', '', '西南', '0', '7', null);
INSERT INTO `shopping_trans_area` VALUES ('8', '2014-09-02 12:03:42', '', '港澳台', '0', '8', null);
INSERT INTO `shopping_trans_area` VALUES ('9', '2014-09-02 12:03:42', '', '海外', '0', '9', null);
INSERT INTO `shopping_trans_area` VALUES ('11', '2014-09-02 12:04:28', '', '上海', '1', '1', '1');
INSERT INTO `shopping_trans_area` VALUES ('12', '2014-09-02 12:04:28', '', '江苏', '1', '2', '1');
INSERT INTO `shopping_trans_area` VALUES ('13', '2014-09-02 12:04:28', '', '浙江', '1', '3', '1');
INSERT INTO `shopping_trans_area` VALUES ('14', '2014-09-02 12:04:28', '', '安徽', '1', '4', '1');
INSERT INTO `shopping_trans_area` VALUES ('15', '2014-09-02 12:04:28', '', '江西', '1', '5', '1');
INSERT INTO `shopping_trans_area` VALUES ('16', '2014-09-02 12:04:50', '', '上海市', '2', '1', '11');
INSERT INTO `shopping_trans_area` VALUES ('17', '2014-09-02 12:06:50', '', '南京市', '2', '1', '12');
INSERT INTO `shopping_trans_area` VALUES ('18', '2014-09-02 12:06:50', '', '淮安市', '2', '2', '12');
INSERT INTO `shopping_trans_area` VALUES ('19', '2014-09-02 12:06:50', '', '盐城市', '2', '3', '12');
INSERT INTO `shopping_trans_area` VALUES ('20', '2014-09-02 12:06:50', '', '徐州市', '2', '4', '12');
INSERT INTO `shopping_trans_area` VALUES ('21', '2014-09-02 12:06:50', '', '无锡市', '2', '5', '12');
INSERT INTO `shopping_trans_area` VALUES ('22', '2014-09-02 12:06:50', '', '连云港市', '2', '6', '12');
INSERT INTO `shopping_trans_area` VALUES ('23', '2014-09-02 12:06:50', '', '宿迁市', '2', '7', '12');
INSERT INTO `shopping_trans_area` VALUES ('24', '2014-09-02 12:06:50', '', '南通市', '2', '8', '12');
INSERT INTO `shopping_trans_area` VALUES ('25', '2014-09-02 12:06:50', '', '镇江市', '2', '9', '12');
INSERT INTO `shopping_trans_area` VALUES ('26', '2014-09-02 12:06:50', '', '泰州市', '2', '10', '12');
INSERT INTO `shopping_trans_area` VALUES ('27', '2014-09-02 12:06:50', '', '常州市', '2', '11', '12');
INSERT INTO `shopping_trans_area` VALUES ('28', '2014-09-02 12:06:50', '', '苏州市', '2', '12', '12');
INSERT INTO `shopping_trans_area` VALUES ('29', '2014-09-02 12:06:50', '', '扬州', '2', '13', '12');
INSERT INTO `shopping_trans_area` VALUES ('30', '2014-09-02 12:22:28', '', '舟山市', '2', '1', '13');
INSERT INTO `shopping_trans_area` VALUES ('31', '2014-09-02 12:22:29', '', '衢州市', '2', '2', '13');
INSERT INTO `shopping_trans_area` VALUES ('32', '2014-09-02 12:22:29', '', '杭州市', '2', '3', '13');
INSERT INTO `shopping_trans_area` VALUES ('33', '2014-09-02 12:22:29', '', '绍兴市', '2', '4', '13');
INSERT INTO `shopping_trans_area` VALUES ('34', '2014-09-02 12:22:29', '', '金华市', '2', '5', '13');
INSERT INTO `shopping_trans_area` VALUES ('35', '2014-09-02 12:22:29', '', '宁波市', '2', '6', '13');
INSERT INTO `shopping_trans_area` VALUES ('36', '2014-09-02 12:22:29', '', '温州市', '2', '7', '13');
INSERT INTO `shopping_trans_area` VALUES ('37', '2014-09-02 12:22:29', '', '湖州市', '2', '8', '13');
INSERT INTO `shopping_trans_area` VALUES ('38', '2014-09-02 12:22:29', '', '嘉兴市', '2', '9', '13');
INSERT INTO `shopping_trans_area` VALUES ('39', '2014-09-02 12:22:29', '', '丽水市', '2', '10', '13');
INSERT INTO `shopping_trans_area` VALUES ('40', '2014-09-02 12:22:29', '', '台州市', '2', '11', '13');
INSERT INTO `shopping_trans_area` VALUES ('41', '2014-09-02 12:25:37', '', '滁州', '2', '1', '14');
INSERT INTO `shopping_trans_area` VALUES ('42', '2014-09-02 12:25:37', '', '芜湖', '2', '2', '14');
INSERT INTO `shopping_trans_area` VALUES ('43', '2014-09-02 12:25:37', '', '蚌埠市', '2', '3', '14');
INSERT INTO `shopping_trans_area` VALUES ('44', '2014-09-02 12:25:37', '', '淮北市', '2', '4', '14');
INSERT INTO `shopping_trans_area` VALUES ('45', '2014-09-02 12:25:37', '', '铜陵市', '2', '5', '14');
INSERT INTO `shopping_trans_area` VALUES ('46', '2014-09-02 12:25:37', '', '马鞍山市', '2', '6', '14');
INSERT INTO `shopping_trans_area` VALUES ('47', '2014-09-02 12:25:37', '', '淮南市', '2', '7', '14');
INSERT INTO `shopping_trans_area` VALUES ('48', '2014-09-02 12:25:37', '', '黄山市', '2', '8', '14');
INSERT INTO `shopping_trans_area` VALUES ('49', '2014-09-02 12:25:37', '', '合肥市', '2', '9', '14');
INSERT INTO `shopping_trans_area` VALUES ('50', '2014-09-02 12:25:37', '', '宣城市', '2', '10', '14');
INSERT INTO `shopping_trans_area` VALUES ('51', '2014-09-02 12:25:37', '', '亳州市', '2', '11', '14');
INSERT INTO `shopping_trans_area` VALUES ('52', '2014-09-02 12:25:37', '', '池州市', '2', '12', '14');
INSERT INTO `shopping_trans_area` VALUES ('53', '2014-09-02 12:25:37', '', '安庆', '2', '13', '14');
INSERT INTO `shopping_trans_area` VALUES ('54', '2014-09-02 12:25:37', '', '宿州', '2', '14', '14');
INSERT INTO `shopping_trans_area` VALUES ('55', '2014-09-02 12:25:38', '', '六安市', '2', '15', '14');
INSERT INTO `shopping_trans_area` VALUES ('56', '2014-09-02 12:25:38', '', '阜阳市', '2', '16', '14');
INSERT INTO `shopping_trans_area` VALUES ('57', '2014-09-05 13:42:05', '', '鹰潭市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('58', '2014-09-05 13:42:05', '', '九江市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('59', '2014-09-05 13:42:05', '', '上饶市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('60', '2014-09-05 13:42:05', '', '新余市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('61', '2014-09-05 13:42:05', '', '宜春市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('62', '2014-09-05 13:42:05', '', '吉安市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('63', '2014-09-05 13:42:05', '', '南昌市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('64', '2014-09-05 13:42:05', '', '赣州市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('65', '2014-09-05 13:42:05', '', '抚州市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('66', '2014-09-05 13:42:05', '', '萍乡市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('67', '2014-09-05 13:42:05', '', '景德镇市', '2', '0', '15');
INSERT INTO `shopping_trans_area` VALUES ('68', '2014-09-05 13:59:29', '', '北京', '1', '1', '2');
INSERT INTO `shopping_trans_area` VALUES ('69', '2014-09-05 13:59:29', '', '天津', '1', '2', '2');
INSERT INTO `shopping_trans_area` VALUES ('70', '2014-09-05 13:59:29', '', '山西', '1', '3', '2');
INSERT INTO `shopping_trans_area` VALUES ('71', '2014-09-05 13:59:29', '', '山东', '1', '4', '2');
INSERT INTO `shopping_trans_area` VALUES ('72', '2014-09-05 13:59:29', '', '河北', '1', '5', '2');
INSERT INTO `shopping_trans_area` VALUES ('73', '2014-09-05 13:59:29', '', '内蒙古', '1', '6', '2');
INSERT INTO `shopping_trans_area` VALUES ('74', '2014-09-05 13:59:54', '', '北京', '2', '1', '68');
INSERT INTO `shopping_trans_area` VALUES ('75', '2014-09-05 14:00:08', '', '天津市', '2', '1', '69');
INSERT INTO `shopping_trans_area` VALUES ('76', '2014-09-05 16:44:45', '', '临汾市', '2', '1', '70');
INSERT INTO `shopping_trans_area` VALUES ('77', '2014-09-05 16:44:45', '', '大同市', '2', '2', '70');
INSERT INTO `shopping_trans_area` VALUES ('78', '2014-09-05 16:44:45', '', '太原市', '2', '3', '70');
INSERT INTO `shopping_trans_area` VALUES ('79', '2014-09-05 16:44:45', '', '忻州市', '2', '4', '70');
INSERT INTO `shopping_trans_area` VALUES ('80', '2014-09-05 16:44:45', '', '运城市', '2', '5', '70');
INSERT INTO `shopping_trans_area` VALUES ('81', '2014-09-05 16:44:45', '', '晋中市', '2', '6', '70');
INSERT INTO `shopping_trans_area` VALUES ('82', '2014-09-05 16:44:45', '', '吕梁市', '2', '7', '70');
INSERT INTO `shopping_trans_area` VALUES ('83', '2014-09-05 16:44:45', '', '阳泉市', '2', '8', '70');
INSERT INTO `shopping_trans_area` VALUES ('84', '2014-09-05 16:44:45', '', '长治市', '2', '9', '70');
INSERT INTO `shopping_trans_area` VALUES ('85', '2014-09-05 16:44:45', '', '晋城市', '2', '10', '70');
INSERT INTO `shopping_trans_area` VALUES ('86', '2014-09-05 16:44:45', '', '朔州市', '2', '11', '70');
INSERT INTO `shopping_trans_area` VALUES ('88', '2014-09-05 16:47:34', '', '临沂', '2', '1', '71');
INSERT INTO `shopping_trans_area` VALUES ('89', '2014-09-05 16:47:34', '', '淄博', '2', '2', '71');
INSERT INTO `shopping_trans_area` VALUES ('90', '2014-09-05 16:47:34', '', '潍坊市', '2', '3', '71');
INSERT INTO `shopping_trans_area` VALUES ('91', '2014-09-05 16:47:34', '', '青岛', '2', '4', '71');
INSERT INTO `shopping_trans_area` VALUES ('92', '2014-09-05 16:47:34', '', '枣庄市', '2', '5', '71');
INSERT INTO `shopping_trans_area` VALUES ('93', '2014-09-05 16:47:34', '', '济宁市', '2', '6', '71');
INSERT INTO `shopping_trans_area` VALUES ('94', '2014-09-05 16:47:34', '', '烟台', '2', '7', '71');
INSERT INTO `shopping_trans_area` VALUES ('95', '2014-09-05 16:47:34', '', '东营', '2', '8', '71');
INSERT INTO `shopping_trans_area` VALUES ('96', '2014-09-05 16:47:34', '', '泰安市', '2', '9', '71');
INSERT INTO `shopping_trans_area` VALUES ('97', '2014-09-05 16:47:34', '', '威海市', '2', '10', '71');
INSERT INTO `shopping_trans_area` VALUES ('98', '2014-09-05 16:47:34', '', '济南市', '2', '11', '71');
INSERT INTO `shopping_trans_area` VALUES ('99', '2014-09-05 16:47:34', '', '莱芜市', '2', '12', '71');
INSERT INTO `shopping_trans_area` VALUES ('100', '2014-09-05 16:47:35', '', '菏泽市', '2', '13', '71');
INSERT INTO `shopping_trans_area` VALUES ('101', '2014-09-05 16:47:35', '', '滨州市', '2', '14', '71');
INSERT INTO `shopping_trans_area` VALUES ('102', '2014-09-05 16:47:35', '', '聊城市', '2', '15', '71');
INSERT INTO `shopping_trans_area` VALUES ('103', '2014-09-05 16:47:35', '', '德州市', '2', '16', '71');
INSERT INTO `shopping_trans_area` VALUES ('104', '2014-09-05 16:47:35', '', '日照市', '2', '17', '71');
INSERT INTO `shopping_trans_area` VALUES ('105', '2014-09-05 16:50:58', '', '廊坊市', '2', '1', '72');
INSERT INTO `shopping_trans_area` VALUES ('106', '2014-09-05 16:50:58', '', '衡水市', '2', '2', '72');
INSERT INTO `shopping_trans_area` VALUES ('107', '2014-09-05 16:50:58', '', '邯郸市', '2', '3', '72');
INSERT INTO `shopping_trans_area` VALUES ('108', '2014-09-05 16:50:58', '', '张家口市', '2', '4', '72');
INSERT INTO `shopping_trans_area` VALUES ('109', '2014-09-05 16:50:58', '', '承德市', '2', '5', '72');
INSERT INTO `shopping_trans_area` VALUES ('110', '2014-09-05 16:50:58', '', '唐山市', '2', '6', '72');
INSERT INTO `shopping_trans_area` VALUES ('111', '2014-09-05 16:50:58', '', '邢台市', '2', '7', '72');
INSERT INTO `shopping_trans_area` VALUES ('112', '2014-09-05 16:50:58', '', '保定市', '2', '8', '72');
INSERT INTO `shopping_trans_area` VALUES ('113', '2014-09-05 16:50:58', '', '沧州市', '2', '9', '72');
INSERT INTO `shopping_trans_area` VALUES ('114', '2014-09-05 16:50:58', '', '石家庄市', '2', '10', '72');
INSERT INTO `shopping_trans_area` VALUES ('115', '2014-09-05 16:50:58', '', '秦皇岛市', '2', '11', '72');
INSERT INTO `shopping_trans_area` VALUES ('116', '2014-09-05 16:55:35', '', '包头市', '2', '1', '73');
INSERT INTO `shopping_trans_area` VALUES ('117', '2014-09-05 16:55:35', '', '呼和浩特市', '2', '2', '73');
INSERT INTO `shopping_trans_area` VALUES ('118', '2014-09-05 16:55:35', '', '乌海市', '2', '3', '73');
INSERT INTO `shopping_trans_area` VALUES ('119', '2014-09-05 16:55:35', '', '赤峰市', '2', '4', '73');
INSERT INTO `shopping_trans_area` VALUES ('120', '2014-09-05 16:55:35', '', '巴彦淖尔市', '2', '5', '73');
INSERT INTO `shopping_trans_area` VALUES ('121', '2014-09-05 16:55:35', '', '呼伦贝尔市', '2', '6', '73');
INSERT INTO `shopping_trans_area` VALUES ('122', '2014-09-05 16:55:35', '', '通辽市', '2', '7', '73');
INSERT INTO `shopping_trans_area` VALUES ('123', '2014-09-05 16:55:35', '', '鄂尔多斯市', '2', '8', '73');
INSERT INTO `shopping_trans_area` VALUES ('124', '2014-09-05 16:55:35', '', '锡林郭勒盟', '2', '9', '73');
INSERT INTO `shopping_trans_area` VALUES ('125', '2014-09-05 16:55:35', '', '兴安盟', '2', '10', '73');
INSERT INTO `shopping_trans_area` VALUES ('126', '2014-09-05 16:55:36', '', '阿拉善盟', '2', '11', '73');
INSERT INTO `shopping_trans_area` VALUES ('127', '2014-09-05 16:55:36', '', '乌兰察布', '2', '12', '73');
INSERT INTO `shopping_trans_area` VALUES ('128', '2014-09-05 16:59:58', '', '湖南', '1', '1', '3');
INSERT INTO `shopping_trans_area` VALUES ('129', '2014-09-05 16:59:58', '', '湖北', '1', '2', '3');
INSERT INTO `shopping_trans_area` VALUES ('130', '2014-09-05 16:59:58', '', '河南', '1', '3', '3');
INSERT INTO `shopping_trans_area` VALUES ('131', '2014-09-05 17:09:11', '', '湘西', '2', '1', '128');
INSERT INTO `shopping_trans_area` VALUES ('132', '2014-09-05 17:09:12', '', '永州市', '2', '2', '128');
INSERT INTO `shopping_trans_area` VALUES ('133', '2014-09-05 17:09:12', '', '长沙市', '2', '3', '128');
INSERT INTO `shopping_trans_area` VALUES ('134', '2014-09-05 17:09:12', '', '益阳市', '2', '4', '128');
INSERT INTO `shopping_trans_area` VALUES ('135', '2014-09-05 17:09:12', '', '邵阳市', '2', '5', '128');
INSERT INTO `shopping_trans_area` VALUES ('136', '2014-09-05 17:09:12', '', '张家界市', '2', '6', '128');
INSERT INTO `shopping_trans_area` VALUES ('137', '2014-09-05 17:09:12', '', '岳阳市', '2', '7', '128');
INSERT INTO `shopping_trans_area` VALUES ('138', '2014-09-05 17:09:12', '', '娄底市', '2', '8', '128');
INSERT INTO `shopping_trans_area` VALUES ('139', '2014-09-05 17:09:12', '', '常德市', '2', '9', '128');
INSERT INTO `shopping_trans_area` VALUES ('140', '2014-09-05 17:09:12', '', '怀化市', '2', '10', '128');
INSERT INTO `shopping_trans_area` VALUES ('141', '2014-09-05 17:09:12', '', '郴州市', '2', '11', '128');
INSERT INTO `shopping_trans_area` VALUES ('142', '2014-09-05 17:09:12', '', '株洲市', '2', '12', '128');
INSERT INTO `shopping_trans_area` VALUES ('143', '2014-09-05 17:09:12', '', '衡阳', '2', '13', '128');
INSERT INTO `shopping_trans_area` VALUES ('144', '2014-09-05 17:09:12', '', '湘潭市', '2', '14', '128');
INSERT INTO `shopping_trans_area` VALUES ('145', '2014-09-05 17:19:27', '', '鄂州', '2', '1', '129');
INSERT INTO `shopping_trans_area` VALUES ('146', '2014-09-05 17:19:27', '', '恩施市', '2', '2', '129');
INSERT INTO `shopping_trans_area` VALUES ('147', '2014-09-05 17:19:27', '', '黄冈市', '2', '3', '129');
INSERT INTO `shopping_trans_area` VALUES ('148', '2014-09-05 17:19:27', '', '咸宁市', '2', '4', '129');
INSERT INTO `shopping_trans_area` VALUES ('149', '2014-09-05 17:19:27', '', '荆州市', '2', '5', '129');
INSERT INTO `shopping_trans_area` VALUES ('150', '2014-09-05 17:19:27', '', '十堰市', '2', '6', '129');
INSERT INTO `shopping_trans_area` VALUES ('151', '2014-09-05 17:19:27', '', '随州市', '2', '7', '129');
INSERT INTO `shopping_trans_area` VALUES ('152', '2014-09-05 17:19:27', '', '神农架林区', '2', '8', '129');
INSERT INTO `shopping_trans_area` VALUES ('153', '2014-09-05 17:19:27', '', '荆门市', '2', '9', '129');
INSERT INTO `shopping_trans_area` VALUES ('154', '2014-09-05 17:19:27', '', '武汉市', '2', '10', '129');
INSERT INTO `shopping_trans_area` VALUES ('155', '2014-09-05 17:19:27', '', '宜昌市', '2', '11', '129');
INSERT INTO `shopping_trans_area` VALUES ('156', '2014-09-05 17:19:27', '', '天门市', '2', '12', '129');
INSERT INTO `shopping_trans_area` VALUES ('157', '2014-09-05 17:19:27', '', '潜江', '2', '13', '129');
INSERT INTO `shopping_trans_area` VALUES ('158', '2014-09-05 17:19:27', '', '仙桃', '2', '14', '129');
INSERT INTO `shopping_trans_area` VALUES ('159', '2014-09-05 17:19:27', '', '孝感', '2', '15', '129');
INSERT INTO `shopping_trans_area` VALUES ('160', '2014-09-05 17:19:27', '', '黄石', '2', '16', '129');
INSERT INTO `shopping_trans_area` VALUES ('161', '2014-09-05 17:19:27', '', '襄阳市', '2', '17', '129');
INSERT INTO `shopping_trans_area` VALUES ('162', '2014-09-05 17:59:20', '', '濮阳', '2', '1', '130');
INSERT INTO `shopping_trans_area` VALUES ('163', '2014-09-05 17:59:20', '', '郑州市', '2', '2', '130');
INSERT INTO `shopping_trans_area` VALUES ('164', '2014-09-05 17:59:20', '', '安阳市', '2', '3', '130');
INSERT INTO `shopping_trans_area` VALUES ('165', '2014-09-05 17:59:20', '', '信阳市', '2', '4', '130');
INSERT INTO `shopping_trans_area` VALUES ('166', '2014-09-05 17:59:20', '', '开封市', '2', '5', '130');
INSERT INTO `shopping_trans_area` VALUES ('167', '2014-09-05 17:59:20', '', '洛阳市', '2', '6', '130');
INSERT INTO `shopping_trans_area` VALUES ('168', '2014-09-05 17:59:20', '', '南阳市', '2', '7', '130');
INSERT INTO `shopping_trans_area` VALUES ('169', '2014-09-05 17:59:20', '', '驻马店市', '2', '8', '130');
INSERT INTO `shopping_trans_area` VALUES ('170', '2014-09-05 17:59:20', '', '平顶山市', '2', '9', '130');
INSERT INTO `shopping_trans_area` VALUES ('171', '2014-09-05 17:59:20', '', '商丘市', '2', '10', '130');
INSERT INTO `shopping_trans_area` VALUES ('172', '2014-09-05 17:59:20', '', '周口市', '2', '11', '130');
INSERT INTO `shopping_trans_area` VALUES ('173', '2014-09-05 17:59:20', '', '三门峡市', '2', '12', '130');
INSERT INTO `shopping_trans_area` VALUES ('174', '2014-09-05 17:59:20', '', '漯河', '2', '13', '130');
INSERT INTO `shopping_trans_area` VALUES ('175', '2014-09-05 17:59:20', '', '许昌', '2', '14', '130');
INSERT INTO `shopping_trans_area` VALUES ('176', '2014-09-05 17:59:20', '', '新乡', '2', '15', '130');
INSERT INTO `shopping_trans_area` VALUES ('177', '2014-09-05 17:59:20', '', '济源', '2', '16', '130');
INSERT INTO `shopping_trans_area` VALUES ('178', '2014-09-05 17:59:20', '', '鹤壁', '2', '17', '130');
INSERT INTO `shopping_trans_area` VALUES ('179', '2014-09-05 17:59:20', '', '焦作市', '2', '18', '130');
INSERT INTO `shopping_trans_area` VALUES ('180', '2014-09-05 18:00:21', '', '广东', '1', '1', '4');
INSERT INTO `shopping_trans_area` VALUES ('181', '2014-09-05 18:00:21', '', '广西', '1', '2', '4');
INSERT INTO `shopping_trans_area` VALUES ('182', '2014-09-05 18:00:21', '', '福建', '1', '3', '4');
INSERT INTO `shopping_trans_area` VALUES ('183', '2014-09-05 18:00:21', '', '海南', '1', '4', '4');
INSERT INTO `shopping_trans_area` VALUES ('184', '2014-09-05 18:04:53', '', '汕尾', '2', '1', '180');
INSERT INTO `shopping_trans_area` VALUES ('185', '2014-09-05 18:04:53', '', '河源市', '2', '2', '180');
INSERT INTO `shopping_trans_area` VALUES ('186', '2014-09-05 18:04:53', '', '潮州市', '2', '3', '180');
INSERT INTO `shopping_trans_area` VALUES ('187', '2014-09-05 18:04:53', '', '云浮市', '2', '4', '180');
INSERT INTO `shopping_trans_area` VALUES ('188', '2014-09-05 18:04:53', '', '梅州市', '2', '5', '180');
INSERT INTO `shopping_trans_area` VALUES ('189', '2014-09-05 18:04:53', '', '深圳市', '2', '6', '180');
INSERT INTO `shopping_trans_area` VALUES ('190', '2014-09-05 18:04:53', '', '汕头市', '2', '7', '180');
INSERT INTO `shopping_trans_area` VALUES ('191', '2014-09-05 18:04:53', '', '茂名市', '2', '8', '180');
INSERT INTO `shopping_trans_area` VALUES ('192', '2014-09-05 18:04:53', '', '东莞市', '2', '9', '180');
INSERT INTO `shopping_trans_area` VALUES ('193', '2014-09-05 18:04:53', '', '广州市', '2', '10', '180');
INSERT INTO `shopping_trans_area` VALUES ('194', '2014-09-05 18:04:53', '', '佛山市', '2', '11', '180');
INSERT INTO `shopping_trans_area` VALUES ('195', '2014-09-05 18:04:53', '', '珠海市', '2', '12', '180');
INSERT INTO `shopping_trans_area` VALUES ('196', '2014-09-05 18:04:53', '', '湛江', '2', '13', '180');
INSERT INTO `shopping_trans_area` VALUES ('197', '2014-09-05 18:04:53', '', '清远', '2', '14', '180');
INSERT INTO `shopping_trans_area` VALUES ('198', '2014-09-05 18:04:53', '', '韶关', '2', '15', '180');
INSERT INTO `shopping_trans_area` VALUES ('199', '2014-09-05 18:04:53', '', '中山', '2', '16', '180');
INSERT INTO `shopping_trans_area` VALUES ('200', '2014-09-05 18:04:53', '', '肇庆', '2', '17', '180');
INSERT INTO `shopping_trans_area` VALUES ('201', '2014-09-05 18:04:53', '', '江门', '2', '18', '180');
INSERT INTO `shopping_trans_area` VALUES ('202', '2014-09-05 18:04:53', '', '揭阳', '2', '19', '180');
INSERT INTO `shopping_trans_area` VALUES ('203', '2014-09-05 18:04:53', '', '阳江', '2', '20', '180');
INSERT INTO `shopping_trans_area` VALUES ('204', '2014-09-05 18:04:53', '', '惠州市', '2', '21', '180');
INSERT INTO `shopping_trans_area` VALUES ('205', '2014-09-05 18:06:37', '', '贺州', '2', '1', '181');
INSERT INTO `shopping_trans_area` VALUES ('206', '2014-09-05 18:06:37', '', '贵港市', '2', '2', '181');
INSERT INTO `shopping_trans_area` VALUES ('207', '2014-09-05 18:06:37', '', '防城港市', '2', '3', '181');
INSERT INTO `shopping_trans_area` VALUES ('208', '2014-09-05 18:06:37', '', '钦州市', '2', '4', '181');
INSERT INTO `shopping_trans_area` VALUES ('209', '2014-09-05 18:06:37', '', '桂林市', '2', '5', '181');
INSERT INTO `shopping_trans_area` VALUES ('210', '2014-09-05 18:06:37', '', '来宾市', '2', '6', '181');
INSERT INTO `shopping_trans_area` VALUES ('211', '2014-09-05 18:06:37', '', '河池市', '2', '7', '181');
INSERT INTO `shopping_trans_area` VALUES ('212', '2014-09-05 18:06:37', '', '柳州市', '2', '8', '181');
INSERT INTO `shopping_trans_area` VALUES ('213', '2014-09-05 18:06:37', '', '梧州市', '2', '9', '181');
INSERT INTO `shopping_trans_area` VALUES ('214', '2014-09-05 18:06:37', '', '崇左市', '2', '10', '181');
INSERT INTO `shopping_trans_area` VALUES ('215', '2014-09-05 18:06:37', '', '玉林市', '2', '11', '181');
INSERT INTO `shopping_trans_area` VALUES ('216', '2014-09-05 18:06:37', '', '百色市', '2', '12', '181');
INSERT INTO `shopping_trans_area` VALUES ('217', '2014-09-05 18:06:37', '', '北海', '2', '13', '181');
INSERT INTO `shopping_trans_area` VALUES ('218', '2014-09-05 18:06:37', '', '南宁市', '2', '14', '181');
INSERT INTO `shopping_trans_area` VALUES ('219', '2014-09-05 18:07:50', '', '莆田市', '2', '1', '182');
INSERT INTO `shopping_trans_area` VALUES ('220', '2014-09-05 18:07:50', '', '厦门市', '2', '2', '182');
INSERT INTO `shopping_trans_area` VALUES ('221', '2014-09-05 18:07:50', '', '南平市', '2', '3', '182');
INSERT INTO `shopping_trans_area` VALUES ('222', '2014-09-05 18:07:50', '', '漳州市', '2', '4', '182');
INSERT INTO `shopping_trans_area` VALUES ('223', '2014-09-05 18:07:50', '', '龙岩市', '2', '5', '182');
INSERT INTO `shopping_trans_area` VALUES ('224', '2014-09-05 18:07:50', '', '宁德市', '2', '6', '182');
INSERT INTO `shopping_trans_area` VALUES ('225', '2014-09-05 18:07:50', '', '福州市', '2', '7', '182');
INSERT INTO `shopping_trans_area` VALUES ('226', '2014-09-05 18:07:50', '', '三明市', '2', '8', '182');
INSERT INTO `shopping_trans_area` VALUES ('227', '2014-09-05 18:07:50', '', '泉州市', '2', '9', '182');
INSERT INTO `shopping_trans_area` VALUES ('241', '2014-09-05 18:10:33', '', '三亚市', '2', '1', '183');
INSERT INTO `shopping_trans_area` VALUES ('247', '2014-09-05 18:10:33', '', '海口市', '2', '2', '183');
INSERT INTO `shopping_trans_area` VALUES ('249', '2014-09-05 18:11:02', '', '辽宁', '1', '1', '5');
INSERT INTO `shopping_trans_area` VALUES ('250', '2014-09-05 18:11:02', '', '吉林', '1', '2', '5');
INSERT INTO `shopping_trans_area` VALUES ('251', '2014-09-05 18:11:02', '', '黑龙江', '1', '3', '5');
INSERT INTO `shopping_trans_area` VALUES ('252', '2014-09-05 18:12:30', '', '鞍山', '2', '1', '249');
INSERT INTO `shopping_trans_area` VALUES ('253', '2014-09-05 18:12:30', '', '大连市', '2', '2', '249');
INSERT INTO `shopping_trans_area` VALUES ('254', '2014-09-05 18:12:30', '', '沈阳市', '2', '3', '249');
INSERT INTO `shopping_trans_area` VALUES ('255', '2014-09-05 18:12:30', '', '阜新市', '2', '4', '249');
INSERT INTO `shopping_trans_area` VALUES ('256', '2014-09-05 18:12:30', '', '营口市', '2', '5', '249');
INSERT INTO `shopping_trans_area` VALUES ('257', '2014-09-05 18:12:30', '', '抚顺市', '2', '6', '249');
INSERT INTO `shopping_trans_area` VALUES ('258', '2014-09-05 18:12:30', '', '本溪市', '2', '7', '249');
INSERT INTO `shopping_trans_area` VALUES ('259', '2014-09-05 18:12:30', '', '朝阳市', '2', '8', '249');
INSERT INTO `shopping_trans_area` VALUES ('260', '2014-09-05 18:12:30', '', '辽阳市', '2', '9', '249');
INSERT INTO `shopping_trans_area` VALUES ('261', '2014-09-05 18:12:30', '', '葫芦岛市', '2', '10', '249');
INSERT INTO `shopping_trans_area` VALUES ('262', '2014-09-05 18:12:30', '', '铁岭市', '2', '11', '249');
INSERT INTO `shopping_trans_area` VALUES ('263', '2014-09-05 18:12:30', '', '盘锦市', '2', '12', '249');
INSERT INTO `shopping_trans_area` VALUES ('264', '2014-09-05 18:12:30', '', '锦州', '2', '13', '249');
INSERT INTO `shopping_trans_area` VALUES ('265', '2014-09-05 18:12:30', '', '丹东市', '2', '14', '249');
INSERT INTO `shopping_trans_area` VALUES ('266', '2014-09-05 18:13:39', '', '延边朝鲜族自治州', '2', '1', '250');
INSERT INTO `shopping_trans_area` VALUES ('267', '2014-09-05 18:13:39', '', '吉林市', '2', '2', '250');
INSERT INTO `shopping_trans_area` VALUES ('268', '2014-09-05 18:13:39', '', '四平市', '2', '3', '250');
INSERT INTO `shopping_trans_area` VALUES ('269', '2014-09-05 18:13:39', '', '白城市', '2', '4', '250');
INSERT INTO `shopping_trans_area` VALUES ('270', '2014-09-05 18:13:39', '', '辽源市', '2', '5', '250');
INSERT INTO `shopping_trans_area` VALUES ('271', '2014-09-05 18:13:39', '', '通化市', '2', '6', '250');
INSERT INTO `shopping_trans_area` VALUES ('272', '2014-09-05 18:13:39', '', '松原市', '2', '7', '250');
INSERT INTO `shopping_trans_area` VALUES ('273', '2014-09-05 18:13:39', '', '白山市', '2', '8', '250');
INSERT INTO `shopping_trans_area` VALUES ('274', '2014-09-05 18:13:40', '', '长春市', '2', '9', '250');
INSERT INTO `shopping_trans_area` VALUES ('275', '2014-09-05 18:14:56', '', '大兴安岭地区', '2', '1', '251');
INSERT INTO `shopping_trans_area` VALUES ('276', '2014-09-05 18:14:57', '', '黑河市', '2', '2', '251');
INSERT INTO `shopping_trans_area` VALUES ('277', '2014-09-05 18:14:57', '', '大庆市', '2', '3', '251');
INSERT INTO `shopping_trans_area` VALUES ('278', '2014-09-05 18:14:57', '', '伊春市', '2', '4', '251');
INSERT INTO `shopping_trans_area` VALUES ('279', '2014-09-05 18:14:57', '', '绥化市', '2', '5', '251');
INSERT INTO `shopping_trans_area` VALUES ('280', '2014-09-05 18:14:57', '', '鸡西市', '2', '6', '251');
INSERT INTO `shopping_trans_area` VALUES ('281', '2014-09-05 18:14:57', '', '齐齐哈尔市', '2', '7', '251');
INSERT INTO `shopping_trans_area` VALUES ('282', '2014-09-05 18:14:57', '', '佳木斯市', '2', '8', '251');
INSERT INTO `shopping_trans_area` VALUES ('283', '2014-09-05 18:14:57', '', '牡丹江市', '2', '9', '251');
INSERT INTO `shopping_trans_area` VALUES ('284', '2014-09-05 18:14:57', '', '哈尔滨市', '2', '10', '251');
INSERT INTO `shopping_trans_area` VALUES ('285', '2014-09-05 18:14:57', '', '鹤岗市', '2', '11', '251');
INSERT INTO `shopping_trans_area` VALUES ('286', '2014-09-05 18:14:57', '', '双鸭山市', '2', '12', '251');
INSERT INTO `shopping_trans_area` VALUES ('287', '2014-09-05 18:14:57', '', '七台河市', '2', '13', '251');
INSERT INTO `shopping_trans_area` VALUES ('288', '2014-09-05 18:20:07', '', '陕西', '1', '1', '6');
INSERT INTO `shopping_trans_area` VALUES ('289', '2014-09-05 18:20:07', '', '新疆', '1', '2', '6');
INSERT INTO `shopping_trans_area` VALUES ('290', '2014-09-05 18:20:07', '', '甘肃', '1', '3', '6');
INSERT INTO `shopping_trans_area` VALUES ('291', '2014-09-05 18:20:07', '', '宁夏', '1', '4', '6');
INSERT INTO `shopping_trans_area` VALUES ('292', '2014-09-05 18:20:07', '', '青海', '1', '5', '6');
INSERT INTO `shopping_trans_area` VALUES ('293', '2014-09-05 18:21:21', '', '榆林市', '2', '1', '288');
INSERT INTO `shopping_trans_area` VALUES ('294', '2014-09-05 18:21:21', '', '安康市', '2', '2', '288');
INSERT INTO `shopping_trans_area` VALUES ('295', '2014-09-05 18:21:21', '', '汉中市', '2', '3', '288');
INSERT INTO `shopping_trans_area` VALUES ('296', '2014-09-05 18:21:21', '', '延安市', '2', '4', '288');
INSERT INTO `shopping_trans_area` VALUES ('297', '2014-09-05 18:21:21', '', '商洛市', '2', '5', '288');
INSERT INTO `shopping_trans_area` VALUES ('298', '2014-09-05 18:21:21', '', '渭南市', '2', '6', '288');
INSERT INTO `shopping_trans_area` VALUES ('299', '2014-09-05 18:21:21', '', '咸阳市', '2', '7', '288');
INSERT INTO `shopping_trans_area` VALUES ('300', '2014-09-05 18:21:21', '', '宝鸡市', '2', '8', '288');
INSERT INTO `shopping_trans_area` VALUES ('301', '2014-09-05 18:21:21', '', '西安市', '2', '9', '288');
INSERT INTO `shopping_trans_area` VALUES ('302', '2014-09-05 18:21:21', '', '铜川市', '2', '10', '288');
INSERT INTO `shopping_trans_area` VALUES ('310', '2014-09-05 18:23:39', '', '昌吉回族自治州', '2', '8', '289');
INSERT INTO `shopping_trans_area` VALUES ('311', '2014-09-05 18:23:39', '', '伊犁哈萨克自治州', '2', '9', '289');
INSERT INTO `shopping_trans_area` VALUES ('312', '2014-09-05 18:23:39', '', '博尔塔拉蒙古自治州', '2', '10', '289');
INSERT INTO `shopping_trans_area` VALUES ('313', '2014-09-05 18:23:39', '', '克孜勒苏柯尔克孜自治州', '2', '11', '289');
INSERT INTO `shopping_trans_area` VALUES ('314', '2014-09-05 18:23:39', '', '喀什地区', '2', '12', '289');
INSERT INTO `shopping_trans_area` VALUES ('315', '2014-09-05 18:23:39', '', '塔城地区', '2', '13', '289');
INSERT INTO `shopping_trans_area` VALUES ('316', '2014-09-05 18:23:39', '', '克拉玛依市', '2', '14', '289');
INSERT INTO `shopping_trans_area` VALUES ('317', '2014-09-05 18:23:39', '', '阿勒泰地区', '2', '15', '289');
INSERT INTO `shopping_trans_area` VALUES ('318', '2014-09-05 18:23:39', '', '和田地区', '2', '16', '289');
INSERT INTO `shopping_trans_area` VALUES ('319', '2014-09-05 18:23:39', '', '巴音郭楞蒙古自治州', '2', '17', '289');
INSERT INTO `shopping_trans_area` VALUES ('320', '2014-09-05 18:23:39', '', '乌鲁木齐市', '2', '18', '289');
INSERT INTO `shopping_trans_area` VALUES ('321', '2014-09-05 18:25:54', '', '庆阳市', '2', '1', '290');
INSERT INTO `shopping_trans_area` VALUES ('322', '2014-09-05 18:25:54', '', '陇南市', '2', '2', '290');
INSERT INTO `shopping_trans_area` VALUES ('323', '2014-09-05 18:25:54', '', '金昌市', '2', '3', '290');
INSERT INTO `shopping_trans_area` VALUES ('324', '2014-09-05 18:25:54', '', '定西市', '2', '4', '290');
INSERT INTO `shopping_trans_area` VALUES ('325', '2014-09-05 18:25:54', '', '甘南藏族自治州', '2', '5', '290');
INSERT INTO `shopping_trans_area` VALUES ('326', '2014-09-05 18:25:54', '', '临夏回族自治州', '2', '6', '290');
INSERT INTO `shopping_trans_area` VALUES ('327', '2014-09-05 18:25:54', '', '嘉峪关市', '2', '7', '290');
INSERT INTO `shopping_trans_area` VALUES ('329', '2014-09-05 18:25:54', '', '酒泉市', '2', '9', '290');
INSERT INTO `shopping_trans_area` VALUES ('330', '2014-09-05 18:25:54', '', '平凉市', '2', '10', '290');
INSERT INTO `shopping_trans_area` VALUES ('331', '2014-09-05 18:25:54', '', '天水市', '2', '11', '290');
INSERT INTO `shopping_trans_area` VALUES ('332', '2014-09-05 18:25:54', '', '白银市', '2', '12', '290');
INSERT INTO `shopping_trans_area` VALUES ('333', '2014-09-05 18:25:54', '', '武威市', '2', '13', '290');
INSERT INTO `shopping_trans_area` VALUES ('334', '2014-09-05 18:25:54', '', '张掖市', '2', '14', '290');
INSERT INTO `shopping_trans_area` VALUES ('335', '2014-09-05 18:26:29', '', '固原市', '2', '1', '291');
INSERT INTO `shopping_trans_area` VALUES ('336', '2014-09-05 18:26:29', '', '中卫市', '2', '2', '291');
INSERT INTO `shopping_trans_area` VALUES ('337', '2014-09-05 18:26:29', '', '吴忠市', '2', '3', '291');
INSERT INTO `shopping_trans_area` VALUES ('338', '2014-09-05 18:26:29', '', '石嘴山市', '2', '4', '291');
INSERT INTO `shopping_trans_area` VALUES ('339', '2014-09-05 18:26:29', '', '银川市', '2', '5', '291');
INSERT INTO `shopping_trans_area` VALUES ('340', '2014-09-05 18:27:27', '', '黄南藏族自治州', '2', '1', '292');
INSERT INTO `shopping_trans_area` VALUES ('341', '2014-09-05 18:27:27', '', '西宁市', '2', '2', '292');
INSERT INTO `shopping_trans_area` VALUES ('342', '2014-09-05 18:27:27', '', '海西蒙古族藏族自治州', '2', '3', '292');
INSERT INTO `shopping_trans_area` VALUES ('343', '2014-09-05 18:27:27', '', '果洛藏族自治州', '2', '4', '292');
INSERT INTO `shopping_trans_area` VALUES ('344', '2014-09-05 18:27:27', '', '海东地区', '2', '5', '292');
INSERT INTO `shopping_trans_area` VALUES ('345', '2014-09-05 18:27:27', '', '海南藏族自治州', '2', '6', '292');
INSERT INTO `shopping_trans_area` VALUES ('346', '2014-09-05 18:27:27', '', '玉树藏族自治州', '2', '7', '292');
INSERT INTO `shopping_trans_area` VALUES ('347', '2014-09-05 18:27:27', '', '海北藏族自治州', '2', '8', '292');
INSERT INTO `shopping_trans_area` VALUES ('348', '2014-09-05 18:28:10', '', '重庆', '1', '1', '7');
INSERT INTO `shopping_trans_area` VALUES ('349', '2014-09-05 18:28:10', '', '云南', '1', '2', '7');
INSERT INTO `shopping_trans_area` VALUES ('350', '2014-09-05 18:28:10', '', '贵州', '1', '3', '7');
INSERT INTO `shopping_trans_area` VALUES ('351', '2014-09-05 18:28:10', '', '西藏', '1', '4', '7');
INSERT INTO `shopping_trans_area` VALUES ('352', '2014-09-05 18:28:10', '', '四川', '1', '5', '7');
INSERT INTO `shopping_trans_area` VALUES ('353', '2014-09-05 18:28:26', '', '重庆市', '2', '1', '348');
INSERT INTO `shopping_trans_area` VALUES ('354', '2014-09-05 18:30:22', '', '昆明市', '2', '1', '349');
INSERT INTO `shopping_trans_area` VALUES ('355', '2014-09-05 18:30:22', '', '曲靖市', '2', '2', '349');
INSERT INTO `shopping_trans_area` VALUES ('356', '2014-09-05 18:30:22', '', '玉溪市', '2', '3', '349');
INSERT INTO `shopping_trans_area` VALUES ('357', '2014-09-05 18:30:22', '', '保山市', '2', '4', '349');
INSERT INTO `shopping_trans_area` VALUES ('358', '2014-09-05 18:30:22', '', '昭通市', '2', '5', '349');
INSERT INTO `shopping_trans_area` VALUES ('359', '2014-09-05 18:30:23', '', '楚雄彝族自治州', '2', '6', '349');
INSERT INTO `shopping_trans_area` VALUES ('360', '2014-09-05 18:30:23', '', '红河哈尼族彝族自治州', '2', '7', '349');
INSERT INTO `shopping_trans_area` VALUES ('361', '2014-09-05 18:30:23', '', '文山壮族苗族自治州', '2', '8', '349');
INSERT INTO `shopping_trans_area` VALUES ('362', '2014-09-05 18:30:23', '', '西双版纳傣族自治州', '2', '9', '349');
INSERT INTO `shopping_trans_area` VALUES ('363', '2014-09-05 18:30:23', '', '大理白族自治州', '2', '10', '349');
INSERT INTO `shopping_trans_area` VALUES ('364', '2014-09-05 18:30:23', '', '怒江傈僳族自治州', '2', '11', '349');
INSERT INTO `shopping_trans_area` VALUES ('365', '2014-09-05 18:30:23', '', '德宏傣族景颇族自治州', '2', '12', '349');
INSERT INTO `shopping_trans_area` VALUES ('366', '2014-09-05 18:30:23', '', '丽江市', '2', '13', '349');
INSERT INTO `shopping_trans_area` VALUES ('367', '2014-09-05 18:30:23', '', '迪庆藏族自治州', '2', '14', '349');
INSERT INTO `shopping_trans_area` VALUES ('368', '2014-09-05 18:30:23', '', '普洱市', '2', '15', '349');
INSERT INTO `shopping_trans_area` VALUES ('369', '2014-09-05 18:30:23', '', '临沧市', '2', '16', '349');
INSERT INTO `shopping_trans_area` VALUES ('370', '2014-09-05 18:31:16', '', '黔南布依族苗族自治州', '2', '1', '350');
INSERT INTO `shopping_trans_area` VALUES ('371', '2014-09-05 18:31:16', '', '黔东南苗族侗族自治州', '2', '2', '350');
INSERT INTO `shopping_trans_area` VALUES ('372', '2014-09-05 18:31:16', '', '毕节地区', '2', '3', '350');
INSERT INTO `shopping_trans_area` VALUES ('373', '2014-09-05 18:31:16', '', '黔西南布依族苗族自治州', '2', '4', '350');
INSERT INTO `shopping_trans_area` VALUES ('374', '2014-09-05 18:31:16', '', '铜仁地区', '2', '5', '350');
INSERT INTO `shopping_trans_area` VALUES ('375', '2014-09-05 18:31:16', '', '安顺市', '2', '6', '350');
INSERT INTO `shopping_trans_area` VALUES ('376', '2014-09-05 18:31:16', '', '六盘水市', '2', '7', '350');
INSERT INTO `shopping_trans_area` VALUES ('377', '2014-09-05 18:31:16', '', '遵义市', '2', '8', '350');
INSERT INTO `shopping_trans_area` VALUES ('378', '2014-09-05 18:31:16', '', '贵阳市', '2', '9', '350');
INSERT INTO `shopping_trans_area` VALUES ('379', '2014-09-05 18:32:22', '', '拉萨市', '2', '1', '351');
INSERT INTO `shopping_trans_area` VALUES ('380', '2014-09-05 18:32:22', '', '山南地区', '2', '2', '351');
INSERT INTO `shopping_trans_area` VALUES ('381', '2014-09-05 18:32:22', '', '昌都地区', '2', '3', '351');
INSERT INTO `shopping_trans_area` VALUES ('382', '2014-09-05 18:32:22', '', '日喀则地区', '2', '4', '351');
INSERT INTO `shopping_trans_area` VALUES ('383', '2014-09-05 18:32:22', '', '林芝地区', '2', '5', '351');
INSERT INTO `shopping_trans_area` VALUES ('384', '2014-09-05 18:32:22', '', '那曲地区', '2', '6', '351');
INSERT INTO `shopping_trans_area` VALUES ('385', '2014-09-05 18:32:22', '', '阿里地区', '2', '7', '351');
INSERT INTO `shopping_trans_area` VALUES ('386', '2014-09-05 18:35:14', '', '成都市', '2', '1', '352');
INSERT INTO `shopping_trans_area` VALUES ('387', '2014-09-05 18:35:14', '', '自贡市', '2', '2', '352');
INSERT INTO `shopping_trans_area` VALUES ('388', '2014-09-05 18:35:14', '', '攀枝花市', '2', '3', '352');
INSERT INTO `shopping_trans_area` VALUES ('389', '2014-09-05 18:35:15', '', '内江市', '2', '4', '352');
INSERT INTO `shopping_trans_area` VALUES ('390', '2014-09-05 18:35:15', '', '遂宁市', '2', '5', '352');
INSERT INTO `shopping_trans_area` VALUES ('391', '2014-09-05 18:35:15', '', '广元市', '2', '6', '352');
INSERT INTO `shopping_trans_area` VALUES ('392', '2014-09-05 18:35:15', '', '德阳市', '2', '7', '352');
INSERT INTO `shopping_trans_area` VALUES ('393', '2014-09-05 18:35:15', '', '绵阳市', '2', '8', '352');
INSERT INTO `shopping_trans_area` VALUES ('394', '2014-09-05 18:35:15', '', '泸州市', '2', '9', '352');
INSERT INTO `shopping_trans_area` VALUES ('395', '2014-09-05 18:35:15', '', '阿坝藏族羌族自治州', '2', '10', '352');
INSERT INTO `shopping_trans_area` VALUES ('396', '2014-09-05 18:35:15', '', '资阳市', '2', '11', '352');
INSERT INTO `shopping_trans_area` VALUES ('397', '2014-09-05 18:35:15', '', '甘孜藏族自治州', '2', '12', '352');
INSERT INTO `shopping_trans_area` VALUES ('398', '2014-09-05 18:35:15', '', '广元', '2', '13', '352');
INSERT INTO `shopping_trans_area` VALUES ('399', '2014-09-05 18:35:15', '', '凉山彝族自治州', '2', '14', '352');
INSERT INTO `shopping_trans_area` VALUES ('400', '2014-09-05 18:35:15', '', '内江市', '2', '15', '352');
INSERT INTO `shopping_trans_area` VALUES ('401', '2014-09-05 18:35:15', '', '遂宁', '2', '16', '352');
INSERT INTO `shopping_trans_area` VALUES ('402', '2014-09-05 18:35:15', '', '泸州', '2', '17', '352');
INSERT INTO `shopping_trans_area` VALUES ('403', '2014-09-05 18:35:15', '', '阿坝', '2', '18', '352');
INSERT INTO `shopping_trans_area` VALUES ('404', '2014-09-05 18:35:15', '', '凉山', '2', '19', '352');
INSERT INTO `shopping_trans_area` VALUES ('405', '2014-09-05 18:35:15', '', '德阳', '2', '20', '352');
INSERT INTO `shopping_trans_area` VALUES ('406', '2014-09-05 18:35:15', '', '南充市', '2', '21', '352');
INSERT INTO `shopping_trans_area` VALUES ('435', '2014-09-05 18:40:05', '', '海外', '1', '1', '9');
INSERT INTO `shopping_trans_area` VALUES ('436', '2014-09-06 09:52:06', '', '海外', '2', '1', '435');
INSERT INTO `shopping_trans_area` VALUES ('437', '2016-03-31 15:48:45', '', '省直辖县级行政区划', '2', '3', '183');
INSERT INTO `shopping_trans_area` VALUES ('438', '2016-03-31 15:50:04', '', '市辖区', '3', '0', '247');
INSERT INTO `shopping_trans_area` VALUES ('439', '2016-03-31 15:50:04', '', '秀英区', '3', '0', '247');
INSERT INTO `shopping_trans_area` VALUES ('440', '2016-03-31 15:50:04', '', '龙华区', '3', '0', '247');
INSERT INTO `shopping_trans_area` VALUES ('441', '2016-03-31 15:50:04', '', '琼山区', '3', '0', '247');
INSERT INTO `shopping_trans_area` VALUES ('442', '2016-03-31 15:50:04', '', '美兰区', '3', '0', '247');
INSERT INTO `shopping_trans_area` VALUES ('443', '2016-03-31 15:55:06', '', '中沙群岛的岛礁及其海域', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('444', '2016-03-31 16:24:33', '', '陵水黎族自治县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('445', '2016-03-31 16:24:33', '', '昌江黎族自治县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('446', '2016-03-31 16:24:33', '', '白沙黎族自治县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('447', '2016-03-31 16:24:33', '', '临高县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('448', '2016-03-31 16:24:33', '', '澄迈县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('449', '2016-03-31 16:24:33', '', '屯昌县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('450', '2016-03-31 16:24:33', '', '定安县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('451', '2016-03-31 16:24:33', '', '东方市', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('452', '2016-03-31 16:24:33', '', '西沙群岛', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('453', '2016-03-31 16:24:33', '', '琼中黎族苗族自治县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('454', '2016-03-31 16:24:33', '', '保亭黎族苗族自治县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('455', '2016-03-31 16:24:33', '', '定安县', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('456', '2016-03-31 16:24:33', '', '东方市', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('457', '2016-03-31 16:24:33', '', '万宁市', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('458', '2016-03-31 16:24:33', '', '文昌市', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('459', '2016-03-31 16:24:33', '', '儋州市', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('460', '2016-03-31 16:24:33', '', '琼海市', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('461', '2016-03-31 16:24:33', '', '五指山市', '3', '0', '437');
INSERT INTO `shopping_trans_area` VALUES ('462', '2016-03-31 16:42:35', '', '自治区直辖县级行政区划', '2', '0', '289');
INSERT INTO `shopping_trans_area` VALUES ('463', '2016-03-31 16:44:25', '', '吐鲁番地区', '2', '0', '289');
INSERT INTO `shopping_trans_area` VALUES ('464', '2016-03-31 16:45:46', '', '阿克苏地区', '2', '9', '289');
INSERT INTO `shopping_trans_area` VALUES ('465', '2016-03-31 16:52:30', '', '兰州市', '2', '0', '290');

-- ----------------------------
-- Table structure for `shopping_user`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_user`;
CREATE TABLE `shopping_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `MSN` varchar(255) DEFAULT NULL,
  `QQ` varchar(255) DEFAULT NULL,
  `WW` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `availableBalance` decimal(12,2) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `freezeBlance` decimal(12,2) DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `integral` int(11) NOT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginIp` varchar(255) DEFAULT NULL,
  `loginCount` int(11) NOT NULL,
  `loginDate` datetime DEFAULT NULL,
  `loginIp` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `report` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `userRole` varchar(255) DEFAULT NULL,
  `user_credit` int(11) NOT NULL,
  `photo_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `qq_openid` varchar(255) DEFAULT NULL,
  `sina_openid` varchar(255) DEFAULT NULL,
  `store_quick_menu` longtext,
  `parent_id` bigint(20) DEFAULT NULL,
  `years` int(11) DEFAULT '0',
  `area_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9DC05442FA5E3FC2` (`area_id`),
  KEY `FK9DC05442A24C51C3` (`parent_id`),
  KEY `FK9DC054421C0CA9F2` (`store_id`),
  KEY `FK9DC054422D77C132` (`photo_id`),
  CONSTRAINT `FK9DC054421C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK9DC054422D77C132` FOREIGN KEY (`photo_id`) REFERENCES `shopping_accessory` (`id`),
  CONSTRAINT `FK9DC05442A24C51C3` FOREIGN KEY (`parent_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK9DC05442FA5E3FC2` FOREIGN KEY (`area_id`) REFERENCES `shopping_area` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32770 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_user
-- ----------------------------
INSERT INTO `shopping_user` VALUES ('1', null, '', '', '', '', null, '9620.00', null, null, '-33440.00', '10000', '0', '2018-05-19 14:07:55', '114.249.225.96', '886', '2018-05-19 21:00:27', '127.0.0.1', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '1', '0', null, '', 'admin', 'ADMIN', '0', null, null, '', '1651674012', '[{\"menu_url\":\"http://localhost/seller/add_goods_first.htm\",\"menu_name\":\"????\"}, {\"menu_url\":\"http://localhost/seller/order.htm\",\"menu_name\":\"????\"}]', null, '0', '4522489');
INSERT INTO `shopping_user` VALUES ('32768', '2013-12-24 12:52:13', '', null, null, null, null, '33820.00', null, 'admin@shopping.com', null, '2580', '0', '2016-05-16 14:43:40', '127.0.0.1', '504', '2018-01-20 16:56:11', '0:0:0:0:0:0:0:1', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', null, null, 'shopping', 'BUYER_SELLER', '0', null, '1', '9A6383AD4B58E8B1ACF65DC68E0B3B68', null, '[{\"menu_url\":\"http://demo.shopping.com/seller/store_set.htm\",\"menu_name\":\"店铺设置\"}, {\"menu_url\":\"http://demo.shopping.com/seller/refund.htm\",\"menu_name\":\"退款记录\"}, {\"menu_url\":\"http://demo.shopping.com/seller/gold_record.htm\",\"menu_name\":\"金币管理\"}, {\"menu_url\":\"http://demo.shopping.com/seller/advert_list.htm\",\"menu_name\":\"广告管理\"}]', null, '0', null);
INSERT INTO `shopping_user` VALUES ('32769', '2014-09-25 11:20:35', '', null, null, null, null, null, null, 'hdtx@shopping.com', null, '0', '0', '2016-04-07 19:27:12', '127.0.0.1', '20', '2016-06-02 15:59:16', '127.0.0.1', null, 'e10adc3949ba59abbe56e057f20f883e', '0', '0', '0', null, null, 'hdtx', 'BUYER_SELLER', '0', null, '32769', null, null, '[{\"menu_url\":\"http://localhost/seller/order.htm\",\"menu_name\":\"订单管理\"}, {\"menu_url\":\"http://localhost/seller/payment.htm\",\"menu_name\":\"支付方式\"}]', null, '0', null);

-- ----------------------------
-- Table structure for `shopping_userconfig`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_userconfig`;
CREATE TABLE `shopping_userconfig` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FKA058A49E537B6C51` (`user_id`),
  KEY `FK2BCC1E041E208F02` (`user_id`),
  CONSTRAINT `FK2BCC1E041E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKA058A49E537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_userconfig
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_usergoodsclass`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_usergoodsclass`;
CREATE TABLE `shopping_usergoodsclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `className` varchar(255) DEFAULT NULL,
  `display` bit(1) NOT NULL,
  `level` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA45E4B3E537B6C51` (`user_id`),
  KEY `FKA45E4B3E153E874` (`parent_id`),
  KEY `FKED0AA1A41E208F02` (`user_id`),
  KEY `FKED0AA1A4D39621E5` (`parent_id`),
  CONSTRAINT `FKA45E4B3E153E874` FOREIGN KEY (`parent_id`) REFERENCES `shopping_usergoodsclass` (`id`),
  CONSTRAINT `FKA45E4B3E537B6C51` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKED0AA1A41E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKED0AA1A4D39621E5` FOREIGN KEY (`parent_id`) REFERENCES `shopping_usergoodsclass` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32777 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_usergoodsclass
-- ----------------------------
INSERT INTO `shopping_usergoodsclass` VALUES ('1', '2013-12-24 12:58:33', '', '男女服装', '', '0', '0', null, '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('2', '2013-12-24 13:00:17', '', '男装', '', '0', '1', '1', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('3', '2013-12-24 13:00:28', '', '女装', '', '0', '1', '1', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('4', '2013-12-24 13:00:53', '', '内衣', '', '0', '2', '1', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('5', '2013-12-24 13:00:59', '', '童装', '', '0', '0', '1', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('6', '2013-12-24 13:01:48', '', '鞋包配饰', '', '0', '1', null, '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('7', '2013-12-24 13:02:13', '', '男鞋', '', '0', '0', '6', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('8', '2013-12-24 13:02:18', '', '女鞋', '', '0', '0', '6', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('9', '2013-12-24 13:02:49', '', '数码家电', '', '0', '2', null, '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('10', '2013-12-24 13:03:00', '', '笔记本', '', '0', '0', '9', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('11', '2013-12-24 13:03:12', '', '手机', '', '0', '0', '9', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('12', '2013-12-24 13:05:30', '', '个人护理', '', '0', '0', '9', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('13', '2013-12-24 13:05:49', '', '户外运动', '', '0', '3', null, '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('14', '2013-12-24 13:05:59', '', '户外服饰', '', '0', '0', '13', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('15', '2013-12-24 13:06:09', '', '户外装备', '', '0', '0', '13', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('16', '2013-12-24 13:06:25', '', '体育健身', '', '0', '0', '13', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('32768', '2013-12-24 16:01:45', '', '饰品', '', '0', '0', '6', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('32769', '2013-12-24 16:15:29', '', '箱包', '', '0', '0', '6', '32768');
INSERT INTO `shopping_usergoodsclass` VALUES ('32770', '2014-09-25 11:27:30', '', '手机充值卡', '', '0', '0', null, '32769');
INSERT INTO `shopping_usergoodsclass` VALUES ('32771', '2014-09-25 11:27:45', '', '移动充值卡', '', '0', '0', '32770', '32769');
INSERT INTO `shopping_usergoodsclass` VALUES ('32772', '2014-09-25 11:27:58', '', '联通充值卡', '', '0', '0', '32770', '32769');
INSERT INTO `shopping_usergoodsclass` VALUES ('32773', '2014-09-25 11:28:09', '', '电信充值卡', '', '0', '0', '32770', '32769');
INSERT INTO `shopping_usergoodsclass` VALUES ('32774', '2014-09-25 11:28:25', '', '手机电源', '', '0', '1', null, '32769');
INSERT INTO `shopping_usergoodsclass` VALUES ('32775', '2014-09-25 11:28:55', '', '移动充电宝', '', '0', '0', '32774', '32769');
INSERT INTO `shopping_usergoodsclass` VALUES ('32776', '2014-09-25 11:29:12', '', '手机锂电池', '', '0', '0', '32774', '32769');

-- ----------------------------
-- Table structure for `shopping_user_attention`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_user_attention`;
CREATE TABLE `shopping_user_attention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `fromUser_id` bigint(20) DEFAULT NULL,
  `toUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK6D85856157C55027` (`toUser_id`),
  KEY `FK6D858561BE806418` (`fromUser_id`),
  CONSTRAINT `FK6D85856157C55027` FOREIGN KEY (`toUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK6D858561BE806418` FOREIGN KEY (`fromUser_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_user_attention
-- ----------------------------
INSERT INTO `shopping_user_attention` VALUES ('2', '2014-09-09 17:48:23', '', '1', '32768');
INSERT INTO `shopping_user_attention` VALUES ('3', '2014-09-23 19:45:56', '', '32768', '1');

-- ----------------------------
-- Table structure for `shopping_user_friend`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_user_friend`;
CREATE TABLE `shopping_user_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `fromUser_id` bigint(20) DEFAULT NULL,
  `toUser_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK880111E18D202D76` (`toUser_id`),
  KEY `FK880111E1F3DB4167` (`fromUser_id`),
  KEY `FK6AFCC53B57C55027` (`toUser_id`),
  KEY `FK6AFCC53BBE806418` (`fromUser_id`),
  CONSTRAINT `FK6AFCC53B57C55027` FOREIGN KEY (`toUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK6AFCC53BBE806418` FOREIGN KEY (`fromUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK880111E18D202D76` FOREIGN KEY (`toUser_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK880111E1F3DB4167` FOREIGN KEY (`fromUser_id`) REFERENCES `shopping_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_user_friend
-- ----------------------------
INSERT INTO `shopping_user_friend` VALUES ('1', '2014-09-03 16:33:50', '', '1', '32768');

-- ----------------------------
-- Table structure for `shopping_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_user_role`;
CREATE TABLE `shopping_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKC7643E5378F5CB22` (`role_id`),
  KEY `FKC7643E531E208F02` (`user_id`),
  CONSTRAINT `FKC7643E531E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FKC7643E5378F5CB22` FOREIGN KEY (`role_id`) REFERENCES `shopping_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_user_role
-- ----------------------------
INSERT INTO `shopping_user_role` VALUES ('1', '1');
INSERT INTO `shopping_user_role` VALUES ('1', '2');
INSERT INTO `shopping_user_role` VALUES ('1', '3');
INSERT INTO `shopping_user_role` VALUES ('1', '4');
INSERT INTO `shopping_user_role` VALUES ('1', '5');
INSERT INTO `shopping_user_role` VALUES ('1', '6');
INSERT INTO `shopping_user_role` VALUES ('1', '7');
INSERT INTO `shopping_user_role` VALUES ('1', '8');
INSERT INTO `shopping_user_role` VALUES ('1', '9');
INSERT INTO `shopping_user_role` VALUES ('1', '10');
INSERT INTO `shopping_user_role` VALUES ('1', '11');
INSERT INTO `shopping_user_role` VALUES ('1', '12');
INSERT INTO `shopping_user_role` VALUES ('1', '13');
INSERT INTO `shopping_user_role` VALUES ('1', '14');
INSERT INTO `shopping_user_role` VALUES ('1', '15');
INSERT INTO `shopping_user_role` VALUES ('1', '16');
INSERT INTO `shopping_user_role` VALUES ('1', '17');
INSERT INTO `shopping_user_role` VALUES ('1', '18');
INSERT INTO `shopping_user_role` VALUES ('1', '19');
INSERT INTO `shopping_user_role` VALUES ('1', '20');
INSERT INTO `shopping_user_role` VALUES ('1', '21');
INSERT INTO `shopping_user_role` VALUES ('1', '22');
INSERT INTO `shopping_user_role` VALUES ('1', '23');
INSERT INTO `shopping_user_role` VALUES ('1', '24');
INSERT INTO `shopping_user_role` VALUES ('1', '25');
INSERT INTO `shopping_user_role` VALUES ('1', '26');
INSERT INTO `shopping_user_role` VALUES ('1', '27');
INSERT INTO `shopping_user_role` VALUES ('1', '28');
INSERT INTO `shopping_user_role` VALUES ('1', '29');
INSERT INTO `shopping_user_role` VALUES ('1', '30');
INSERT INTO `shopping_user_role` VALUES ('1', '31');
INSERT INTO `shopping_user_role` VALUES ('1', '32');
INSERT INTO `shopping_user_role` VALUES ('1', '33');
INSERT INTO `shopping_user_role` VALUES ('1', '34');
INSERT INTO `shopping_user_role` VALUES ('1', '35');
INSERT INTO `shopping_user_role` VALUES ('1', '36');
INSERT INTO `shopping_user_role` VALUES ('1', '37');
INSERT INTO `shopping_user_role` VALUES ('1', '38');
INSERT INTO `shopping_user_role` VALUES ('1', '39');
INSERT INTO `shopping_user_role` VALUES ('1', '40');
INSERT INTO `shopping_user_role` VALUES ('1', '41');
INSERT INTO `shopping_user_role` VALUES ('1', '42');
INSERT INTO `shopping_user_role` VALUES ('1', '43');
INSERT INTO `shopping_user_role` VALUES ('1', '44');
INSERT INTO `shopping_user_role` VALUES ('1', '45');
INSERT INTO `shopping_user_role` VALUES ('1', '46');
INSERT INTO `shopping_user_role` VALUES ('1', '47');
INSERT INTO `shopping_user_role` VALUES ('1', '48');
INSERT INTO `shopping_user_role` VALUES ('1', '49');
INSERT INTO `shopping_user_role` VALUES ('1', '50');
INSERT INTO `shopping_user_role` VALUES ('1', '51');
INSERT INTO `shopping_user_role` VALUES ('1', '52');
INSERT INTO `shopping_user_role` VALUES ('1', '53');
INSERT INTO `shopping_user_role` VALUES ('1', '54');
INSERT INTO `shopping_user_role` VALUES ('1', '55');
INSERT INTO `shopping_user_role` VALUES ('1', '56');
INSERT INTO `shopping_user_role` VALUES ('1', '57');
INSERT INTO `shopping_user_role` VALUES ('1', '58');
INSERT INTO `shopping_user_role` VALUES ('1', '59');
INSERT INTO `shopping_user_role` VALUES ('1', '60');
INSERT INTO `shopping_user_role` VALUES ('1', '61');
INSERT INTO `shopping_user_role` VALUES ('1', '62');
INSERT INTO `shopping_user_role` VALUES ('1', '63');
INSERT INTO `shopping_user_role` VALUES ('1', '64');
INSERT INTO `shopping_user_role` VALUES ('1', '65');
INSERT INTO `shopping_user_role` VALUES ('1', '66');
INSERT INTO `shopping_user_role` VALUES ('1', '67');
INSERT INTO `shopping_user_role` VALUES ('32768', '68');
INSERT INTO `shopping_user_role` VALUES ('32768', '69');
INSERT INTO `shopping_user_role` VALUES ('32768', '70');
INSERT INTO `shopping_user_role` VALUES ('32768', '71');
INSERT INTO `shopping_user_role` VALUES ('32768', '72');
INSERT INTO `shopping_user_role` VALUES ('32768', '73');
INSERT INTO `shopping_user_role` VALUES ('32768', '74');
INSERT INTO `shopping_user_role` VALUES ('32768', '75');
INSERT INTO `shopping_user_role` VALUES ('32768', '76');
INSERT INTO `shopping_user_role` VALUES ('32768', '77');
INSERT INTO `shopping_user_role` VALUES ('32768', '78');
INSERT INTO `shopping_user_role` VALUES ('32768', '79');
INSERT INTO `shopping_user_role` VALUES ('32768', '80');
INSERT INTO `shopping_user_role` VALUES ('32768', '81');
INSERT INTO `shopping_user_role` VALUES ('1', '82');
INSERT INTO `shopping_user_role` VALUES ('32768', '82');
INSERT INTO `shopping_user_role` VALUES ('32768', '83');
INSERT INTO `shopping_user_role` VALUES ('32768', '84');
INSERT INTO `shopping_user_role` VALUES ('32768', '85');
INSERT INTO `shopping_user_role` VALUES ('32768', '86');
INSERT INTO `shopping_user_role` VALUES ('32768', '87');
INSERT INTO `shopping_user_role` VALUES ('32768', '88');
INSERT INTO `shopping_user_role` VALUES ('32768', '89');
INSERT INTO `shopping_user_role` VALUES ('32768', '90');
INSERT INTO `shopping_user_role` VALUES ('32768', '91');
INSERT INTO `shopping_user_role` VALUES ('32768', '92');
INSERT INTO `shopping_user_role` VALUES ('32768', '93');
INSERT INTO `shopping_user_role` VALUES ('32768', '94');
INSERT INTO `shopping_user_role` VALUES ('32768', '95');
INSERT INTO `shopping_user_role` VALUES ('32768', '96');
INSERT INTO `shopping_user_role` VALUES ('32768', '97');
INSERT INTO `shopping_user_role` VALUES ('32768', '98');
INSERT INTO `shopping_user_role` VALUES ('32768', '99');
INSERT INTO `shopping_user_role` VALUES ('1', '100');
INSERT INTO `shopping_user_role` VALUES ('32768', '100');
INSERT INTO `shopping_user_role` VALUES ('32768', '101');
INSERT INTO `shopping_user_role` VALUES ('32768', '102');
INSERT INTO `shopping_user_role` VALUES ('32768', '103');
INSERT INTO `shopping_user_role` VALUES ('32768', '104');
INSERT INTO `shopping_user_role` VALUES ('1', '105');
INSERT INTO `shopping_user_role` VALUES ('32768', '105');
INSERT INTO `shopping_user_role` VALUES ('1', '106');
INSERT INTO `shopping_user_role` VALUES ('32768', '106');
INSERT INTO `shopping_user_role` VALUES ('1', '107');
INSERT INTO `shopping_user_role` VALUES ('32768', '107');
INSERT INTO `shopping_user_role` VALUES ('1', '108');
INSERT INTO `shopping_user_role` VALUES ('32768', '108');
INSERT INTO `shopping_user_role` VALUES ('1', '109');
INSERT INTO `shopping_user_role` VALUES ('32768', '109');

-- ----------------------------
-- Table structure for `shopping_visit`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_visit`;
CREATE TABLE `shopping_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `visitTime` datetime DEFAULT NULL,
  `homepage_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK1891039451589842` (`homepage_id`),
  KEY `FK189103941E208F02` (`user_id`),
  CONSTRAINT `FK189103941E208F02` FOREIGN KEY (`user_id`) REFERENCES `shopping_user` (`id`),
  CONSTRAINT `FK1891039451589842` FOREIGN KEY (`homepage_id`) REFERENCES `shopping_homepage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_visit
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_vlog`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_vlog`;
CREATE TABLE `shopping_vlog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `gold` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK7D74B19F920D7683` (`store_id`),
  CONSTRAINT `FK7D74B19F920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_vlog
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_vmenu`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_vmenu`;
CREATE TABLE `shopping_vmenu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `menu_key` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_type` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `menu_sequence` int(11) DEFAULT '0',
  `menu_key_content` longtext,
  `menu_cat` varchar(255) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK3121D264AA91F874` (`parent_id`),
  KEY `FK3121D264920D7683` (`store_id`),
  CONSTRAINT `FK3121D264920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FK3121D264AA91F874` FOREIGN KEY (`parent_id`) REFERENCES `shopping_vmenu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_vmenu
-- ----------------------------
INSERT INTO `shopping_vmenu` VALUES ('2', null, '', '', '推荐精品', 'view', '#', null, '1', '1', null, 'user');
INSERT INTO `shopping_vmenu` VALUES ('7', null, '', '', '双十一推荐', 'view', '#', '2', '1', '0', null, 'user');
INSERT INTO `shopping_vmenu` VALUES ('8', null, '', '', '羽绒系列', 'view', '#', '2', '1', '0', null, 'user');
INSERT INTO `shopping_vmenu` VALUES ('10', null, '', '', '商城首页', 'view', 'http://demo.shopping.com/weixin/index.htm?store_id=1', null, '1', '0', '', 'user');
INSERT INTO `shopping_vmenu` VALUES ('11', null, '', '', '商城首页', 'view', 'http://localhost/weixin/platform/index.htm', null, null, '0', '', 'admin');
INSERT INTO `shopping_vmenu` VALUES ('12', null, '', '', '推荐新品', 'view', 'http://localhost/weixin/platform/index.htm', null, null, '1', '', 'admin');
INSERT INTO `shopping_vmenu` VALUES ('13', null, '', '', '热卖商品', 'view', 'http://localhost/weixin/platform/index.htm', null, null, '3', '', 'admin');
INSERT INTO `shopping_vmenu` VALUES ('14', null, '', 'ABOUT', '关于我们', 'click', '', null, '1', '3', '欢迎来到shopping微信商城，shopping多用户商城系统是shopping公司旗下的一款Java 多商户商城系统，内置多用户微信商城', null);

-- ----------------------------
-- Table structure for `shopping_vmessage`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_vmessage`;
CREATE TABLE `shopping_vmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `content` longtext,
  `store_id` bigint(20) DEFAULT NULL,
  `FromUserName` varchar(255) DEFAULT NULL,
  `MsgType` varchar(255) DEFAULT NULL,
  `json_map` varchar(255) DEFAULT NULL,
  `reply` longtext,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK8F2968E2920D7683` (`store_id`),
  CONSTRAINT `FK8F2968E2920D7683` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_vmessage
-- ----------------------------
INSERT INTO `shopping_vmessage` VALUES ('1', '2015-02-28 15:28:32', '', '商城', '1', 'oUpcuuAujM9urqOwXtq-bfllu8TM', null, '{\"MsgId\":\"5985348363844656969\",\"FromUserName\":\"oUpcuuAujM9urqOwXtq-bfllu8TM\",\"EventKey\":\"\",\"Event\":\"\",\"CreateTime\":\"1393572512\",\"Content\":\"商城\",\"ToUserName\":\"gh_bdc2187cfd3d\",\"MsgType\":\"text\"}', null, '0');
INSERT INTO `shopping_vmessage` VALUES ('2', '2015-03-01 12:35:38', '', '', '1', null, null, '{}', null, '0');
INSERT INTO `shopping_vmessage` VALUES ('3', '2015-03-01 18:34:37', '', '0', '1', 'oUpcuuHHm9bd4IXXPypzCKcAVKOg', null, '{\"MsgId\":\"5985767398033927371\",\"FromUserName\":\"oUpcuuHHm9bd4IXXPypzCKcAVKOg\",\"EventKey\":\"\",\"Event\":\"\",\"CreateTime\":\"1393670076\",\"Content\":\"0\",\"ToUserName\":\"gh_bdc2187cfd3d\",\"MsgType\":\"text\"}', null, '0');
INSERT INTO `shopping_vmessage` VALUES ('4', '2015-03-01 18:34:51', '', '1', '1', 'oUpcuuHHm9bd4IXXPypzCKcAVKOg', null, '{\"MsgId\":\"5985767458163469517\",\"FromUserName\":\"oUpcuuHHm9bd4IXXPypzCKcAVKOg\",\"EventKey\":\"\",\"Event\":\"\",\"CreateTime\":\"1393670090\",\"Content\":\"1\",\"ToUserName\":\"gh_bdc2187cfd3d\",\"MsgType\":\"text\"}', null, '0');
INSERT INTO `shopping_vmessage` VALUES ('5', '2015-03-02 21:36:13', '', '', '1', null, null, '{}', null, '0');

-- ----------------------------
-- Table structure for `shopping_watermark`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_watermark`;
CREATE TABLE `shopping_watermark` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `wm_image_alpha` float NOT NULL,
  `wm_image_open` bit(1) NOT NULL,
  `wm_image_pos` int(11) NOT NULL,
  `wm_text` varchar(255) DEFAULT NULL,
  `wm_text_color` varchar(255) DEFAULT NULL,
  `wm_text_font` varchar(255) DEFAULT NULL,
  `wm_text_font_size` int(11) NOT NULL,
  `wm_text_open` bit(1) NOT NULL,
  `wm_text_pos` int(11) NOT NULL,
  `store_id` bigint(20) DEFAULT NULL,
  `wm_image_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA66FB24D85288CB2` (`wm_image_id`),
  KEY `FKA66FB24D1C0CA9F2` (`store_id`),
  CONSTRAINT `FKA66FB24D1C0CA9F2` FOREIGN KEY (`store_id`) REFERENCES `shopping_store` (`id`),
  CONSTRAINT `FKA66FB24D85288CB2` FOREIGN KEY (`wm_image_id`) REFERENCES `shopping_accessory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_watermark
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_ztc_gold_log`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_ztc_gold_log`;
CREATE TABLE `shopping_ztc_gold_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addTime` datetime DEFAULT NULL,
  `deleteStatus` bit(1) NOT NULL,
  `zgl_content` varchar(255) DEFAULT NULL,
  `zgl_gold` int(11) NOT NULL,
  `zgl_type` int(11) NOT NULL,
  `zgl_goods_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5A722B8C50A38BC3` (`zgl_goods_id`),
  KEY `FKD6ECE372DAA2BF32` (`zgl_goods_id`),
  CONSTRAINT `FK5A722B8C50A38BC3` FOREIGN KEY (`zgl_goods_id`) REFERENCES `shopping_goods1` (`id`),
  CONSTRAINT `FKD6ECE372DAA2BF32` FOREIGN KEY (`zgl_goods_id`) REFERENCES `shopping_goods1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_ztc_gold_log
-- ----------------------------
