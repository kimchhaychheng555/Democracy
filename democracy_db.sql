/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 100424
 Source Host           : localhost:3306
 Source Schema         : democracy_db

 Target Server Type    : MySQL
 Target Server Version : 100424
 File Encoding         : 65001

 Date: 21/07/2022 21:20:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for apartments
-- ----------------------------
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE `apartments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `citizenid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apartments
-- ----------------------------
INSERT INTO `apartments` VALUES (1, 'apartment36899', 'apartment3', 'Integrity Way 6899', 'IDE79913');

-- ----------------------------
-- Table structure for bank_accounts
-- ----------------------------
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE `bank_accounts`  (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businessid` int(11) NULL DEFAULT NULL,
  `gangid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','Business','Gang') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`) USING BTREE,
  UNIQUE INDEX `citizenid`(`citizenid`) USING BTREE,
  INDEX `business`(`business`) USING BTREE,
  INDEX `businessid`(`businessid`) USING BTREE,
  INDEX `gangid`(`gangid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for bank_statements
-- ----------------------------
DROP TABLE IF EXISTS `bank_statements`;
CREATE TABLE `bank_statements`  (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `businessid` int(11) NULL DEFAULT NULL,
  `gangid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deposited` int(11) NULL DEFAULT NULL,
  `withdraw` int(11) NULL DEFAULT NULL,
  `balance` int(11) NULL DEFAULT NULL,
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `business`(`business`) USING BTREE,
  INDEX `businessid`(`businessid`) USING BTREE,
  INDEX `gangid`(`gangid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank_statements
-- ----------------------------

-- ----------------------------
-- Table structure for bans
-- ----------------------------
DROP TABLE IF EXISTS `bans`;
CREATE TABLE `bans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `license` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discord` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `expire` int(11) NULL DEFAULT NULL,
  `bannedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `license`(`license`) USING BTREE,
  INDEX `discord`(`discord`) USING BTREE,
  INDEX `ip`(`ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bans
-- ----------------------------

-- ----------------------------
-- Table structure for crypto
-- ----------------------------
DROP TABLE IF EXISTS `crypto`;
CREATE TABLE `crypto`  (
  `crypto` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`crypto`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crypto
-- ----------------------------
INSERT INTO `crypto` VALUES ('qbit', 1005, '[{\"PreviousWorth\":1000,\"NewWorth\":1006},{\"PreviousWorth\":1006,\"NewWorth\":1005},{\"NewWorth\":1005,\"PreviousWorth\":1005}]');

-- ----------------------------
-- Table structure for crypto_transactions
-- ----------------------------
DROP TABLE IF EXISTS `crypto_transactions`;
CREATE TABLE `crypto_transactions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of crypto_transactions
-- ----------------------------

-- ----------------------------
-- Table structure for dealers
-- ----------------------------
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE `dealers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `createdby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dealers
-- ----------------------------

-- ----------------------------
-- Table structure for gloveboxitems
-- ----------------------------
DROP TABLE IF EXISTS `gloveboxitems`;
CREATE TABLE `gloveboxitems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`plate`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gloveboxitems
-- ----------------------------

-- ----------------------------
-- Table structure for house_plants
-- ----------------------------
DROP TABLE IF EXISTS `house_plants`;
CREATE TABLE `house_plants`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'stage-a',
  `sort` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `food` int(11) NULL DEFAULT 100,
  `health` int(11) NULL DEFAULT 100,
  `progress` int(11) NULL DEFAULT 0,
  `coords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `plantid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `building`(`building`) USING BTREE,
  INDEX `plantid`(`plantid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house_plants
-- ----------------------------

-- ----------------------------
-- Table structure for houselocations
-- ----------------------------
DROP TABLE IF EXISTS `houselocations`;
CREATE TABLE `houselocations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `coords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `owned` tinyint(1) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `tier` tinyint(4) NULL DEFAULT NULL,
  `garage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of houselocations
-- ----------------------------

-- ----------------------------
-- Table structure for lapraces
-- ----------------------------
DROP TABLE IF EXISTS `lapraces`;
CREATE TABLE `lapraces`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `checkpoints` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `records` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `distance` int(11) NULL DEFAULT NULL,
  `raceid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `raceid`(`raceid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lapraces
-- ----------------------------

-- ----------------------------
-- Table structure for management_funds
-- ----------------------------
DROP TABLE IF EXISTS `management_funds`;
CREATE TABLE `management_funds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `job_name`(`job_name`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of management_funds
-- ----------------------------
INSERT INTO `management_funds` VALUES (1, 'police', 0, 'boss');
INSERT INTO `management_funds` VALUES (2, 'ambulance', 0, 'boss');
INSERT INTO `management_funds` VALUES (3, 'realestate', 0, 'boss');
INSERT INTO `management_funds` VALUES (4, 'taxi', 0, 'boss');
INSERT INTO `management_funds` VALUES (5, 'cardealer', 0, 'boss');
INSERT INTO `management_funds` VALUES (6, 'mechanic', 0, 'boss');
INSERT INTO `management_funds` VALUES (7, 'lostmc', 0, 'gang');
INSERT INTO `management_funds` VALUES (8, 'ballas', 0, 'gang');
INSERT INTO `management_funds` VALUES (9, 'vagos', 0, 'gang');
INSERT INTO `management_funds` VALUES (10, 'cartel', 0, 'gang');
INSERT INTO `management_funds` VALUES (11, 'families', 0, 'gang');
INSERT INTO `management_funds` VALUES (12, 'triads', 0, 'gang');

-- ----------------------------
-- Table structure for occasion_vehicles
-- ----------------------------
DROP TABLE IF EXISTS `occasion_vehicles`;
CREATE TABLE `occasion_vehicles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `plate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mods` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `occasionid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `occasionId`(`occasionid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of occasion_vehicles
-- ----------------------------

-- ----------------------------
-- Table structure for phone_gallery
-- ----------------------------
DROP TABLE IF EXISTS `phone_gallery`;
CREATE TABLE `phone_gallery`  (
  `citizenid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp(0) NULL DEFAULT current_timestamp(0)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phone_gallery
-- ----------------------------
INSERT INTO `phone_gallery` VALUES ('IDE79913', 'https://media.discordapp.net/attachments/913437534460182558/999650321833938975/screenshot.jpg', '2022-07-21 19:13:29');

-- ----------------------------
-- Table structure for phone_invoices
-- ----------------------------
DROP TABLE IF EXISTS `phone_invoices`;
CREATE TABLE `phone_invoices`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sender` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sendercitizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phone_invoices
-- ----------------------------

-- ----------------------------
-- Table structure for phone_messages
-- ----------------------------
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE `phone_messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `messages` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE,
  INDEX `number`(`number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phone_messages
-- ----------------------------

-- ----------------------------
-- Table structure for phone_tweets
-- ----------------------------
DROP TABLE IF EXISTS `phone_tweets`;
CREATE TABLE `phone_tweets`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `date` datetime(0) NULL DEFAULT current_timestamp(0),
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `picture` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT './img/default.png',
  `tweetId` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phone_tweets
-- ----------------------------
INSERT INTO `phone_tweets` VALUES (1, 'IDE79913', 'Chhay', 'Low', 'Hello', '2022-07-21 12:13:37', 'https://media.discordapp.net/attachments/913437534460182558/999650321833938975/screenshot.jpg', 'default', 'TWEET-17074962');

-- ----------------------------
-- Table structure for player_contacts
-- ----------------------------
DROP TABLE IF EXISTS `player_contacts`;
CREATE TABLE `player_contacts`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iban` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for player_houses
-- ----------------------------
DROP TABLE IF EXISTS `player_houses`;
CREATE TABLE `player_houses`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `identifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyholders` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `decorations` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `stash` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `outfit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `logout` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `house`(`house`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE,
  INDEX `identifier`(`identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_houses
-- ----------------------------

-- ----------------------------
-- Table structure for player_mails
-- ----------------------------
DROP TABLE IF EXISTS `player_mails`;
CREATE TABLE `player_mails`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sender` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `read` tinyint(4) NULL DEFAULT 0,
  `mailid` int(11) NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT current_timestamp(0),
  `button` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_mails
-- ----------------------------

-- ----------------------------
-- Table structure for player_outfits
-- ----------------------------
DROP TABLE IF EXISTS `player_outfits`;
CREATE TABLE `player_outfits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outfitname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skin` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `outfitId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE,
  INDEX `outfitId`(`outfitId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_outfits
-- ----------------------------

-- ----------------------------
-- Table structure for player_vehicles
-- ----------------------------
DROP TABLE IF EXISTS `player_vehicles`;
CREATE TABLE `player_vehicles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vehicle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `plate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fakeplate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `garage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fuel` int(11) NULL DEFAULT 100,
  `engine` float NULL DEFAULT 1000,
  `body` float NULL DEFAULT 1000,
  `state` int(11) NULL DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) NULL DEFAULT NULL,
  `status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `plate`(`plate`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE,
  INDEX `license`(`license`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_vehicles
-- ----------------------------

-- ----------------------------
-- Table structure for player_warns
-- ----------------------------
DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE `player_warns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `targetIdentifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `warnId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_warns
-- ----------------------------

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cid` int(11) NULL DEFAULT NULL,
  `license` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `charinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `job` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gang` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `position` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `metadata` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `inventory` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `last_updated` timestamp(0) NOT NULL DEFAULT current_timestamp(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`citizenid`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `last_updated`(`last_updated`) USING BTREE,
  INDEX `license`(`license`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (1, 'IDE79913', 1, 'license:fafc6ffb0a479d8c945078bc75ea1cdc5e26d971', 'Chhay Low', '{\"cash\":500,\"bank\":5031,\"crypto\":0}', '{\"firstname\":\"Chhay\",\"nationality\":\"Khmer\",\"lastname\":\"Low\",\"birthdate\":\"2001-05-05\",\"account\":\"US04QBCore6829660039\",\"backstory\":\"placeholder backstory\",\"cid\":\"1\",\"gender\":0,\"phone\":\"6223140200\"}', '{\"isboss\":false,\"onduty\":true,\"label\":\"Civilian\",\"payment\":10,\"name\":\"unemployed\",\"type\":\"none\",\"grade\":{\"name\":\"Freelancer\",\"level\":0}}', '{\"isboss\":false,\"name\":\"none\",\"label\":\"No Gang Affiliaton\",\"grade\":{\"name\":\"none\",\"level\":0}}', '{\"x\":271.8988952636719,\"y\":-616.3516235351563,\"z\":42.018310546875}', '{\"walletid\":\"QB-49186775\",\"inside\":{\"apartment\":[]},\"jailitems\":[],\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":94025392},\"inlaststand\":false,\"armor\":0,\"fingerprint\":\"tl171s80CeO8663\",\"hunger\":57.99999999999996,\"injail\":0,\"craftingrep\":0,\"licences\":{\"weapon\":false,\"business\":false,\"driver\":true},\"thirst\":62.00000000000003,\"criminalrecord\":{\"hasRecord\":false},\"fitbit\":[],\"callsign\":\"NO CALLSIGN\",\"attachmentcraftingrep\":0,\"commandbinds\":[],\"bloodtype\":\"A+\",\"tracker\":false,\"isdead\":false,\"stress\":0,\"jobrep\":{\"trucker\":0,\"hotdog\":0,\"taxi\":0,\"tow\":0},\"dealerrep\":0,\"ishandcuffed\":false,\"status\":[],\"phone\":[]}', '[{\"amount\":1,\"slot\":1,\"name\":\"id_card\",\"type\":\"item\",\"info\":{\"citizenid\":\"IDE79913\",\"birthdate\":\"2001-05-05\",\"gender\":0,\"firstname\":\"Chhay\",\"nationality\":\"Khmer\",\"lastname\":\"Low\"}},{\"amount\":1,\"slot\":2,\"name\":\"phone\",\"type\":\"item\",\"info\":[]},{\"amount\":1,\"created\":1658403369,\"slot\":3,\"name\":\"driver_license\",\"type\":\"item\",\"info\":{\"birthdate\":\"2001-05-05\",\"quality\":100,\"firstname\":\"Chhay\",\"type\":\"Class C Driver License\",\"lastname\":\"Low\"}}]', '2022-07-21 19:14:41');

-- ----------------------------
-- Table structure for playerskins
-- ----------------------------
DROP TABLE IF EXISTS `playerskins`;
CREATE TABLE `playerskins`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `skin` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `citizenid`(`citizenid`) USING BTREE,
  INDEX `active`(`active`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of playerskins
-- ----------------------------
INSERT INTO `playerskins` VALUES (1, 'IDE79913', '1885233650', '{\"makeup\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"moles\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"ageing\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"bag\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"hat\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"lipstick\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"eyebrows\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"chimp_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"jaw_bone_width\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"face\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"arms\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"neck_thikness\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"hair\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_5\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"decals\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"jaw_bone_back_lenght\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"accessory\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"eyebrown_forward\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"shoes\":{\"texture\":0,\"defaultTexture\":0,\"item\":1,\"defaultItem\":1},\"chimp_bone_lenght\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"beard\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1},\"cheek_1\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"bracelet\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"eyebrown_high\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"cheek_3\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"lips_thickness\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"chimp_hole\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_1\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_4\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"cheek_2\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"chimp_bone_lowering\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_3\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"face2\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"t-shirt\":{\"texture\":0,\"defaultTexture\":0,\"item\":1,\"defaultItem\":1},\"nose_0\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"ear\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"pants\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"eye_opening\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"torso2\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"facemix\":{\"defaultShapeMix\":0.0,\"defaultSkinMix\":0.0,\"shapeMix\":0,\"skinMix\":0},\"eye_color\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"mask\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"nose_2\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"watch\":{\"texture\":0,\"defaultTexture\":0,\"item\":-1,\"defaultItem\":-1},\"glass\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"vest\":{\"texture\":0,\"defaultTexture\":0,\"item\":0,\"defaultItem\":0},\"blush\":{\"texture\":1,\"defaultTexture\":1,\"item\":-1,\"defaultItem\":-1}}', 1);

-- ----------------------------
-- Table structure for stashitems
-- ----------------------------
DROP TABLE IF EXISTS `stashitems`;
CREATE TABLE `stashitems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`stash`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stashitems
-- ----------------------------

-- ----------------------------
-- Table structure for trunkitems
-- ----------------------------
DROP TABLE IF EXISTS `trunkitems`;
CREATE TABLE `trunkitems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`plate`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trunkitems
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
