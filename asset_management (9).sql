-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 15, 2025 at 04:36 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asset_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `approvals`
--

DROP TABLE IF EXISTS `approvals`;
CREATE TABLE IF NOT EXISTS `approvals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comparative_id` int NOT NULL,
  `expert_id` int NOT NULL,
  `decision` enum('approved','rejected') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comparative_id` (`comparative_id`),
  KEY `expert_id` (`expert_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `approvals`
--

INSERT INTO `approvals` (`id`, `comparative_id`, `expert_id`, `decision`, `created_at`) VALUES
(27, 42, 68, 'approved', '2025-03-18 08:47:24'),
(26, 42, 66, 'approved', '2025-03-18 08:47:05'),
(25, 41, 68, 'approved', '2025-03-17 20:52:46'),
(24, 41, 66, 'approved', '2025-03-17 20:52:23'),
(23, 40, 66, 'approved', '2025-03-17 19:30:41'),
(22, 40, 68, 'approved', '2025-03-17 19:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cid` text COLLATE utf8mb4_general_ci NOT NULL,
  `category_name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cid`, `category_name`) VALUES
('c', 'consumables'),
('nc', 'non-consumables'),
('f', 'furniture');

-- --------------------------------------------------------

--
-- Table structure for table `comparative_statement`
--

DROP TABLE IF EXISTS `comparative_statement`;
CREATE TABLE IF NOT EXISTS `comparative_statement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lab` varchar(255) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `sr_no_1` varchar(255) DEFAULT NULL,
  `item_1` text,
  `qty_1` int DEFAULT NULL,
  `rate_1` decimal(10,2) DEFAULT NULL,
  `remarks_1` text,
  `rate_2` decimal(10,2) DEFAULT NULL,
  `remarks_2` text,
  `rate_3` decimal(10,2) DEFAULT NULL,
  `remarks_3` text,
  `sr_no_2` varchar(255) DEFAULT NULL,
  `item_2` text,
  `qty_2` int DEFAULT NULL,
  `rate_4` decimal(10,2) DEFAULT NULL,
  `remarks_4` text,
  `rate_5` decimal(10,2) DEFAULT NULL,
  `remarks_5` text,
  `rate_6` decimal(10,2) DEFAULT NULL,
  `remarks_6` text,
  `sr_no_3` varchar(255) DEFAULT NULL,
  `item_3` text,
  `qty_3` int DEFAULT NULL,
  `rate_7` decimal(10,2) DEFAULT NULL,
  `remarks_7` text,
  `rate_8` decimal(10,2) DEFAULT NULL,
  `remarks_8` text,
  `rate_9` decimal(10,2) DEFAULT NULL,
  `remarks_9` text,
  `sr_no_4` varchar(255) DEFAULT NULL,
  `item_4` text,
  `qty_4` int DEFAULT NULL,
  `rate_10` decimal(10,2) DEFAULT NULL,
  `remarks_10` text,
  `rate_11` decimal(10,2) DEFAULT NULL,
  `remarks_11` text,
  `rate_12` decimal(10,2) DEFAULT NULL,
  `remarks_12` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ms_1` varchar(255) DEFAULT NULL,
  `ms_2` varchar(255) DEFAULT NULL,
  `ms_3` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'pending',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comparative_statement`
--

INSERT INTO `comparative_statement` (`id`, `lab`, `dept`, `date`, `ref`, `sr_no_1`, `item_1`, `qty_1`, `rate_1`, `remarks_1`, `rate_2`, `remarks_2`, `rate_3`, `remarks_3`, `sr_no_2`, `item_2`, `qty_2`, `rate_4`, `remarks_4`, `rate_5`, `remarks_5`, `rate_6`, `remarks_6`, `sr_no_3`, `item_3`, `qty_3`, `rate_7`, `remarks_7`, `rate_8`, `remarks_8`, `rate_9`, `remarks_9`, `sr_no_4`, `item_4`, `qty_4`, `rate_10`, `remarks_10`, `rate_11`, `remarks_11`, `rate_12`, `remarks_12`, `created_at`, `ms_1`, `ms_2`, `ms_3`, `status`) VALUES
(42, 'cc', 'comp', '2025-03-18', 'm222', '1', 'book', 10, '100.00', 'non', '200.00', 'non', '300.00', 'non', '', '', 0, '0.00', '', '0.00', '', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-18 08:45:27', 'supplier_1', 'supplier_2', 'supplier_3', 'pending stores approval'),
(41, 'cc', 'comp', '2025-03-18', 'pr1', '1', 'ic300', 10, '100.00', 'non', '200.00', 'non', '300.00', 'non', '', '', 0, '0.00', '', '0.00', '', '0.00', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-17 20:50:14', 'supplier_1', 'supplier_2', 'supplier_3', 'approved by stores'),
(1, 'hfhjm', 'ghdhj', '2025-02-11', 'yrjfjyjfyj', '8', 'gcgj', 765, '7.00', 'ggighg', '86.00', 'hjhjfvj', '75.00', 'kfvjvhm', '2', 'kjkgkv', 97, '7.00', 'yug', '6.00', 'hjj', '78.00', 'hb', '7', 'hgbh', 87, '7.00', 'yhigby', '7.00', 'hb', '98.00', 'uuh', '8', 'uu', 8, '9.00', 'ouoh', '8.00', 'igh', '87.00', 'bj', '2025-02-27 14:36:53', NULL, NULL, NULL, 'pending'),
(2, 'hfhjm', 'ghdhj', '2025-02-11', 'yrjfjyjfyj', '8', 'gcgj', 765, '7.00', 'ggighg', '86.00', 'hjhjfvj', '75.00', 'kfvjvhm', '2', 'kjkgkv', 97, '7.00', 'yug', '6.00', 'hjj', '78.00', 'hb', '7', 'hgbh', 87, '7.00', 'yhigby', '7.00', 'hb', '98.00', 'uuh', '8', 'uu', 8, '9.00', 'ouoh', '8.00', 'igh', '87.00', 'bj', '2025-02-27 14:37:21', NULL, NULL, NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `disposal`
--

DROP TABLE IF EXISTS `disposal`;
CREATE TABLE IF NOT EXISTS `disposal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `disposal_date` date NOT NULL,
  `reason` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `funds lab`
--

DROP TABLE IF EXISTS `funds lab`;
CREATE TABLE IF NOT EXISTS `funds lab` (
  `lab no` int NOT NULL,
  `asset id` varchar(50) NOT NULL,
  `asset name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `category id` varchar(50) NOT NULL,
  `procurement date` date NOT NULL,
  `cost` int NOT NULL,
  `maintenance status` varchar(50) NOT NULL,
  `maintenance date` varchar(50) NOT NULL,
  `supplier id` varchar(50) NOT NULL,
  `condemnation date` date NOT NULL,
  `lab_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`asset id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `funds lab`
--

INSERT INTO `funds lab` (`lab no`, `asset id`, `asset name`, `category`, `category id`, `procurement date`, `cost`, `maintenance status`, `maintenance date`, `supplier id`, `condemnation date`, `lab_name`) VALUES
(1, 'c1', 'chair', 'furniture', 'f01', '2025-01-01', 400, 'yes', '08-08-2024', 'r12', '2025-01-17', 'fundamental_lab'),
(1, 'a1', 'extension board', 'electronics', 'e01', '0000-00-00', 400, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a2', 'dotmatrix printer', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a3', 'pedestal fan', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a4', 'wall_mouting_fan', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a5', '10kba_ups', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a6', 'dell_vostro_laptop', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a7', 'dell_3070_i5_1', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a8', 'dell_3070_i5_2', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a9', 'dell_3070_i5_3', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a10', 'dell_3070_i5_4', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a11', 'dell_3070_i5_5', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a12', 'dell_3070_i5_6', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a13', 'dell_3070_i5_7', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a14', 'dell_3070_i5_8', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a15', 'dell_3070_i5_9', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a16', 'dell_3070_i5_10', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a17', 'dell_3070_i5_11', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a18', 'dell_3070_i5_12', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a19', 'dell_3070_i5_13', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a20', 'dell_3070_i5_14', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a21', 'dell_3070_i5_15', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a22', 'dell_3070_i5_16', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a23', 'dell_3070_i5_17', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a24', 'dell_3070_i5_18', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a25', 'dell_3070_i5_19', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a26', 'dell_3070_i5_20', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a27', 'dell_3070_i5_21', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a28', 'dell_3070_i5_22', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a29', 'dell_3070_i5_23', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a30', 'dell_3070_i5_24', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a31', 'dell_3070_i5_25', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a32', 'ethernet_router', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a33', 'BENQ_multimedia_projector', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a34', 'dlink_24_port_networking_switch', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a35', 'UPS_batteries', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a36', 'batteries_42AA', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a37', 'USB_camera_uniline', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a38', 'speaker_set', 'electronics', 'e01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a39', 'steel_cupboard', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a40', 'steel_rack', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a41', 'plastic_chair_1', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a42', 'plastic_chair_3', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a43', 'plastic_chair_4', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a44', 'plastic_chair_5', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a45', 'plastic_chair_6', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a46', 'plastic_chair_7', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a47', 'plastic_chair_8', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a48', 'plastic_chair_9', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a49', 'plastic_chair_10', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a50', 'plastic_chair_11', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a51', 'plastic_chair_12', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a52', 'plastic_chair_13', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a53', 'plastic_chair_14', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a54', 'plastic_chair_15', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a55', 'plastic_chair_16', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a56', 'plastic_chair_17', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a57', 'plastic_chair_18', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a58', 'plastic_chair_19', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a59', 'plastic_chair_20', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a60', 'plastic_chair_21', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a61', 'plastic_chair_22', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a63', 'plastic_chair_23', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a64', 'plastic_chair_24', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a65', 'plastic_chair_25', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a66', 'plastic_chair_26', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a67', 'plastic_chair_27', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a68', 'plastic_chair_28', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a69', 'plastic_chair_29', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a70', 'plastic_chair_30', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a71', 'plastic_chair_31', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a72', 'plastic_chair_32', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a73', 'plastic_chair_33', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a74', 'plastic_chair_34', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a75', 'plastic_chair_35', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a76', 'plastic_chair_36', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a77', 'plastic_chair_37', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a78', 'plastic_chair_38', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a79', 'plastic_chair_39', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a80', 'plastic_chair_40', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a81', 'plastic_chair_41', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a82', 'plastic_chair_42', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a83', 'plastic_chair_43', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a84', 'plastic_chair_44', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a85', 'plastic_chair_45', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a86', 'plastic_chair_46', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a87', 'plastic_chair_47', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a88', 'plastic_chair_48', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a89', 'plastic_chair_49', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a90', 'plastic_chair_50', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a91', 'steel_table_1', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a92', 'steel_table_2', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a93', 'steel_table_3', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a94', 'steel_lecturer_table_1', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a95', 'steel_lecturer_table_2', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a96', 'computer_table_1', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a97', 'computer_table_3', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a98', 'computer_table_4', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a99', 'computer_table_5', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a100', 'computer_table_6', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a101', 'computer_table_7', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a102', 'computer_table_8', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a103', 'computer_table_9', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a104', 'computer_table_10', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a105', 'computer_table_11', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a106', 'computer_table_12', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a107', 'computer_table_13', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a108', 'computer_table_14', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a109', 'computer_table_15', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a110', 'computer_table_16', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a111', 'computer_table_17', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a112', 'computer_table_18', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a113', 'computer_table_19', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a114', 'computer_table_20', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a115', 'computer_table_21', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a116', 'computer_table_22', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a117', 'computer_table_23', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a118', 'computer_table_24', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a119', 'computer_table_25', 'furniture', 'f01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a120', 'toner_catridge', 'stationary', 's01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a121', 'tool_box', 'stationary', 's01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a122', 'whiteboard_marker', 'stationary', 's01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a123', 'spikeguard', 'stationary', 's01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab'),
(1, 'a124', 'screwdriver_set', 'stationary', 's01', '0000-00-00', 0, '', '', '', '0000-00-00', 'fundamental_lab');

-- --------------------------------------------------------

--
-- Table structure for table `indentbook`
--

DROP TABLE IF EXISTS `indentbook`;
CREATE TABLE IF NOT EXISTS `indentbook` (
  `indent_no` int NOT NULL,
  `material` varchar(255) DEFAULT NULL,
  `quantity_required` int NOT NULL,
  `quantity_issued` int NOT NULL,
  `date` date NOT NULL,
  `department` varchar(50) NOT NULL DEFAULT 'computer',
  `sign` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indent book form`
--

DROP TABLE IF EXISTS `indent book form`;
CREATE TABLE IF NOT EXISTS `indent book form` (
  `indent_no` int NOT NULL,
  `material_name_specification` varchar(100) NOT NULL,
  `quantity_required` int NOT NULL,
  `quantity_issued` int NOT NULL,
  `date` date NOT NULL,
  `department` varchar(50) NOT NULL DEFAULT 'computer',
  `sign` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indent_forms`
--

DROP TABLE IF EXISTS `indent_forms`;
CREATE TABLE IF NOT EXISTS `indent_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indent_no` varchar(50) DEFAULT NULL,
  `material` text,
  `quantity_required` int DEFAULT NULL,
  `quantity_issued` int DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending Approval',
  `hod_approval_time` timestamp NULL DEFAULT NULL,
  `store_approval_time` timestamp NULL DEFAULT NULL,
  `receiver_confirmation_time` timestamp NULL DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `indent_forms`
--

INSERT INTO `indent_forms` (`id`, `indent_no`, `material`, `quantity_required`, `quantity_issued`, `department`, `date`, `status`, `hod_approval_time`, `store_approval_time`, `receiver_confirmation_time`, `otp`, `last_updated`) VALUES
(1, '122', 'mouse', 2, 2, 'computer', '2025-01-30', 'Approved by HOD', '2025-02-02 18:53:17', NULL, NULL, NULL, '2025-02-02 18:53:17'),
(2, '222', 'monitor', 3, 3, 'computer', '2025-02-11', 'Received by Department', NULL, NULL, '2025-02-03 13:11:21', NULL, '2025-02-03 13:11:21'),
(3, '900', 'mouse', 4, 4, 'computer', '2025-01-30', 'Pending Approval', NULL, NULL, NULL, NULL, '2025-02-02 17:21:04'),
(4, '777', 'floppy', 2, 2, 'computer', '2025-02-12', 'Approved by HOD', NULL, NULL, NULL, NULL, '2025-02-02 17:50:29'),
(5, '110', 'keyboard', 4, 4, 'computer', '2025-02-04', 'Approved by HOD', NULL, NULL, NULL, NULL, '2025-02-02 17:54:01'),
(6, '555', 'cell', 2, 2, 'computer', '2025-02-10', 'Approved by HOD', '2025-02-02 18:44:01', NULL, NULL, NULL, '2025-02-02 18:44:01'),
(7, '666', 'cpu', 4, 4, 'computer', '2025-02-06', 'Received by Department', '2025-02-03 12:43:36', '2025-02-03 12:40:52', '2025-02-03 12:55:50', NULL, '2025-02-03 12:55:50'),
(8, '303', 'bag', 2, 2, 'computer', '2025-02-05', 'Approved by HOD', '2025-02-04 13:35:52', '2025-02-03 13:05:14', '2025-02-03 13:10:57', NULL, '2025-02-04 13:35:52'),
(9, '303', 'speaker', 2, 2, 'computer', '2025-02-04', 'Pending Approval', NULL, NULL, NULL, NULL, '2025-02-03 12:57:27'),
(10, '500', 'router', 4, 4, 'computer', '2025-01-30', 'Approved by HOD', '2025-02-04 13:37:37', NULL, NULL, NULL, '2025-02-04 13:37:37'),
(13, '500', NULL, NULL, NULL, NULL, NULL, 'Pending Approval', NULL, NULL, NULL, NULL, '2025-02-04 15:23:44'),
(14, '500', NULL, NULL, NULL, NULL, NULL, 'Pending Approval', NULL, NULL, NULL, NULL, '2025-02-04 15:28:19'),
(15, '223', 'multimeter', 3, 3, 'computer', '2025-02-04', 'Approved by HOD', '2025-02-05 15:45:43', NULL, NULL, NULL, '2025-02-05 15:45:43'),
(16, '656', 'duster', 3, 3, 'computer', '2025-02-04', 'Approved by HOD', '2025-02-06 06:25:07', NULL, NULL, NULL, '2025-02-06 06:25:07'),
(17, '400', 'bat', 2, 2, 'computer', '2025-02-05', 'Approved by HOD', '2025-02-06 06:28:44', NULL, NULL, NULL, '2025-02-06 06:28:44');

-- --------------------------------------------------------

--
-- Table structure for table `labs`
--

DROP TABLE IF EXISTS `labs`;
CREATE TABLE IF NOT EXISTS `labs` (
  `lab_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lab_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`lab_id`(3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `labs`
--

INSERT INTO `labs` (`lab_id`, `lab_name`) VALUES
('ADL', 'Analog & Digital lab'),
('CCL', 'CC lab'),
('CGL', 'Computer Graphics Lab'),
('FDL', 'Fundamentals lab'),
('LXL', 'Linux lab'),
('NWL', 'Networks lab'),
('SSL', 'System Software lab');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_records`
--

DROP TABLE IF EXISTS `maintenance_records`;
CREATE TABLE IF NOT EXISTS `maintenance_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  `maintenance_date` date NOT NULL,
  `status` enum('Pending','Completed') NOT NULL,
  `remarks` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `maintenance_records`
--

INSERT INTO `maintenance_records` (`id`, `item_name`, `maintenance_date`, `status`, `remarks`) VALUES
(1, 'xggvhb', '2025-02-12', 'Pending', 'ytbgtyv');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int NOT NULL,
  `asset_id` int DEFAULT NULL,
  `lab_id` text COLLATE utf8mb4_general_ci,
  `role` enum('LI','HOD') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_general_ci,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
CREATE TABLE IF NOT EXISTS `password_reset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `otp` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires_at` datetime NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`id`, `email`, `otp`, `expires_at`, `token`) VALUES
(77, 'advaitaddu9@gmail.com', '7334', '2025-02-14 07:34:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
CREATE TABLE IF NOT EXISTS `recommendations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comparative_id` int DEFAULT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `item_no` varchar(255) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `recommendation` text,
  `lab_name` varchar(255) DEFAULT NULL,
  `professor_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `expert1` int NOT NULL,
  `expert2` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comparative_id` (`comparative_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recommendations`
--

INSERT INTO `recommendations` (`id`, `comparative_id`, `firm`, `item_no`, `qty`, `rate`, `amount`, `recommendation`, `lab_name`, `professor_name`, `created_at`, `expert1`, `expert2`) VALUES
(31, 42, 'supplier_1', 'rc111', 10, '100.00', '2000.00', 'non', 'cc', 'addu', '2025-03-18 08:46:19', 66, 68),
(30, 41, 'supplier_1', 'ic300', 10, '100.00', '10000.00', 'non', 'cc', 'addu', '2025-03-17 20:51:45', 66, 68),
(29, 40, 'addu', 'ic', 10, '100.00', '10000.00', 'non', 'cc', 'addu', '2025-03-17 19:29:37', 66, 68),
(1, 2, 'cgjvjgjgh', '65', 765, '87.00', '7545.00', 'hvhvjh', 'gcghc', 'khgkh', '2025-02-27 14:37:21', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `sr_no` int NOT NULL AUTO_INCREMENT,
  `lab_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cid` text COLLATE utf8mb4_general_ci NOT NULL,
  `name_of_the_item` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `item_specification` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `indent_no` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `indent_date` date NOT NULL,
  `name_of_supplier` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `qty` int NOT NULL,
  `bill_no` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `bill_date` date NOT NULL,
  `price` int NOT NULL,
  `used_qty` int NOT NULL,
  `balance_qty` int NOT NULL,
  `la_sign` int NOT NULL,
  `li_sign` int NOT NULL,
  `hod_sign` int NOT NULL,
  `remarks` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `asset_type` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`sr_no`, `lab_id`, `cid`, `name_of_the_item`, `date`, `item_specification`, `indent_no`, `indent_date`, `name_of_supplier`, `qty`, `bill_no`, `bill_date`, `price`, `used_qty`, `balance_qty`, `la_sign`, `li_sign`, `hod_sign`, `remarks`, `asset_type`, `status`) VALUES
(2, 'FDL', 'f', 'cpu', '2025-03-12', 'fvfd', '12333', '2025-02-27', 'fgffhfh', 44, '1234', '2025-03-17', 345, 4, 45, 1, 0, 0, 'kai naa', 'Printers', 'Pending'),
(3, 'FDL', 'f', 'cpu', '2025-03-12', 'fvfd', '12333', '2025-02-27', 'fgffhfh', 44, '1234', '2025-03-17', 345, 4, 45, 1, 0, 0, 'kai naa', 'Printers', 'Pending'),
(4, 'FDL', 'f', 'ups', '2025-03-16', 'dffff', '4789', '2025-03-17', 'koosjh', 1, '4565', '2025-03-19', 6000, 1, 6789, 1, 0, 0, 'ggdgdgd', 'Printers', 'Pending'),
(5, 'FDL', 'f', 'bd', '2025-03-06', 'bnnd', 'fvdf', '2025-02-25', 'dvdfv', 44, 'vvsv', '2025-03-17', 56, 66, 34, 1, 0, 0, 'fdbdbd', 'CPU', 'Pending'),
(6, 'FDL', 'f', 'bd', '2025-03-06', 'bnnd', 'fvdf', '2025-02-25', 'dvdfv', 44, 'vvsv', '2025-03-17', 56, 66, 34, 1, 1, 1, 'fdbdbd', 'CPU', 'Pending'),
(7, 'CCL', 'c', 'CATRIDGE', '2025-05-08', 'DKJDDKJKJD', '345', '2025-05-09', 'ponders', 45, 'gc67', '2025-04-30', 3456, 6, 7, 1, 0, 0, 'ttt', 'Printers', 'Pending'),
(8, 'FDL', 'c', 'toner', '2025-05-08', 'gghsbd', '8977898', '0000-00-00', '', 0, '', '0000-00-00', 0, 0, 0, 1, 0, 0, '', 'Toner', 'Pending'),
(9, 'FDL', 'nc', 'lg', '2025-05-08', 'cgg', '6777', '2025-05-01', 'gbgfb', 66, 'bn', '2025-05-08', 6676, 78, 56, 1, 0, 0, 'fnhdndn', 'PC', 'Pending'),
(10, 'FDL', 'nc', 'lg', '2025-05-08', 'cgg', '6777', '2025-05-01', 'gbgfb', 66, 'bn', '2025-05-08', 6676, 78, 56, 1, 0, 0, 'fnhdndn', 'PC', 'Pending'),
(11, 'CCL', 'c', 'pen', '2025-04-28', 'yfhjjhf', '6777', '2025-05-02', 'robin', 78, 'hjjh6', '2025-05-04', 7890, 78, 5, 1, 0, 0, 'ggk', 'Furniture', 'Pending'),
(12, 'CCL', 'c', 'icc', '2025-05-06', 'gugkjgk', '8787', '2025-06-05', '6u6t6gtuu', 678989, 'hjfj', '2025-04-29', 687696968, 67, 9, 1, 0, 0, 'ugkjk', 'IC', 'Pending'),
(13, 'CCL', 'c', 'hhhh', '0000-00-00', '', '', '0000-00-00', '', 0, '', '0000-00-00', 0, 0, 0, 1, 0, 0, '', 'Furniture', 'Pending'),
(14, 'CCL', 'nc', 'fff', '0000-00-00', '', '', '0000-00-00', '', 0, '', '0000-00-00', 0, 0, 0, 1, 0, 0, '', 'IC', 'Pending'),
(15, 'CCL', 'nc', 'icv', '0000-00-00', '', '', '0000-00-00', '', 0, '', '0000-00-00', 0, 0, 0, 1, 0, 0, '', 'IC', 'Pending'),
(16, 'CCL', 'nc', 'fvdf', '2025-05-09', 'bjb', 'khg', '2025-04-29', 'tuttututu', 56, 'vbbnvn66', '2025-05-04', 567, 4, 7, 1, 0, 0, 'hghj', 'Toner', 'Pending'),
(17, 'CCL', 'nc', 'fvdf', '2025-05-09', 'bjb', 'khg', '2025-04-29', 'tuttututu', 56, 'vbbnvn66', '2025-05-04', 567, 4, 7, 1, 1, 0, 'hghj', 'Toner', 'Pending'),
(18, 'CCL', 'f', 'ghxsgxh', '2025-05-25', 'cs', '4656', '2025-04-30', 'cv', 57, '3434r', '2025-04-30', 344, 56, 6, 1, 0, 0, 'hjhj', 'CPU', 'Pending'),
(19, 'CCL', 'c', 'lg', '2025-05-01', 'hjhied', '13225', '2025-05-07', 'ponda suppliers', 7, 'ad465', '2025-04-22', 5000, 5, 2, 1, 1, 1, 'fjkjgrkjg', 'CPU', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `requisition form`
--

DROP TABLE IF EXISTS `requisition form`;
CREATE TABLE IF NOT EXISTS `requisition form` (
  `id` int NOT NULL,
  `lab_name` varchar(50) NOT NULL,
  `storesInward` int DEFAULT NULL,
  `department` varchar(20) NOT NULL DEFAULT 'computer',
  `date` date NOT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `fund` int NOT NULL,
  `previous_purchase` varchar(255) DEFAULT NULL,
  `justification` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `suppliers` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `requisition form`
--

INSERT INTO `requisition form` (`id`, `lab_name`, `storesInward`, `department`, `date`, `specification`, `fund`, `previous_purchase`, `justification`, `quantity`, `cost`, `suppliers`) VALUES
(0, 'rod', NULL, 'computer', '2024-12-30', 'mouse', 2000, 'broke', 'broken', 1, '1500', '0'),
(0, 'rod', NULL, 'computer', '2024-12-04', 'monitor', 15000, 'dont know', 'not in good condition', 2, '15900', '0'),
(0, '', NULL, '', '0000-00-00', '', 0, '', '', 1, '0', '0'),
(0, 'rod', NULL, 'computer', '2024-12-30', 'mouse', 2000, 'broke', 'broken', 1, '1500', '0'),
(0, 'rod', NULL, 'computer', '2024-12-04', 'monitor', 15000, 'dont know', 'not in good condition', 2, '15900', '0'),
(0, '', NULL, '', '0000-00-00', '', 0, '', '', 1, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `requisitions`
--

DROP TABLE IF EXISTS `requisitions`;
CREATE TABLE IF NOT EXISTS `requisitions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(50) NOT NULL,
  `storesInward` int DEFAULT NULL,
  `department` varchar(20) NOT NULL DEFAULT 'computer',
  `date` date NOT NULL,
  `specification` varchar(255) DEFAULT NULL,
  `fund` int NOT NULL,
  `previous_purchase` varchar(255) DEFAULT NULL,
  `justification` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `suppliers` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending Approval - Level 1',
  `expert_email` varchar(255) DEFAULT NULL,
  `rejection_comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `requisitions`
--

INSERT INTO `requisitions` (`id`, `lab_name`, `storesInward`, `department`, `date`, `specification`, `fund`, `previous_purchase`, `justification`, `quantity`, `cost`, `suppliers`, `status`, `expert_email`, `rejection_comment`) VALUES
(1, 'ip', 3469, 'computer', '2025-02-11', 'computer system', 90000, 'condemned', 'require new model', 2, '85000', 'hardware enterprise', 'Pending Stores Officer Processing', NULL, NULL),
(2, 'ip', 3465, 'computer', '2025-02-11', 'mouse', 9000, 'shortage', 'needed', 2, '1500', 'company', 'Approved by Committee', NULL, NULL),
(3, 'ip', 7658, 'computer', '2025-02-11', 'keyboard', 10000, 'shortage', 'needed', 2, '7000', 'typeee', 'Approved by Committee', NULL, NULL),
(4, 'ip', 7651, 'computer', '2025-02-11', 'watch', 10000, 'shortage', 'needed', 1, '7000', 'typeee', 'Approved by Committee', NULL, NULL),
(5, 'cg', 8707, 'computer', '2025-02-11', 'hp monitor', 34000, 'not working', 'cant use', 1, '15900', 'screenspt', 'Approved by Committee', NULL, NULL),
(6, 'cg', 8708, 'computer', '2025-02-11', 'cpu', 34000, 'not working', 'fan not working', 2, '20000', 'brainly', 'Pending Expert Approval', 'rigvednaik22167@gmail.com', NULL),
(7, 'cg', 87045, 'computer', '2025-02-11', 'battery', 34000, 'not working', 'short circuit', 1, '5000', 'brainpower', '', NULL, NULL),
(8, 'ip', 8743, 'computer', '2025-02-11', 'projector', 70000, 'shortage', 'to present in program', 1, '15000', 'videolmt', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(9, 'ip', 8740, 'computer', '2025-02-12', 'projector screen', 70000, 'dont have', 'to present in program', 4, '20000', 'videolmt', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(10, 'ip', 8760, 'computer', '2025-02-13', 'mouse', 50000, 'not applicable', '3 systems need', 3, '5000', 'clcikerscll', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(11, 'cg', 4356, 'computer', '2025-02-14', 'ups', 60000, 'not working', 'battery backup', 2, '13000', 'powerelectr', 'Pending Expert Approval', 'advaitaddu9@gmail.com', NULL),
(12, 'cg', 4357, 'computer', '2025-02-14', 'ups', 60000, 'not working', 'battery backup', 3, '18000', 'powerelectr', 'Pending Expert Approval', 'advaitaddu9@gmail.com', NULL),
(13, 'cg', 4350, 'computer', '2025-02-14', 'cpu', 60000, 'not working', 'ram problem', 3, '30000', 'brainlyy', 'Pending Stores Officer Processing', NULL, NULL),
(14, 'cg', 4359, 'computer', '2025-02-14', 'SPEAKER', 60000, 'not working', 'shortage', 2, '5000', 'sonypvt', 'Pending Expert Approval', 'rigvednaik22167@gmail.com', NULL),
(15, 'ip', 9076, 'computer', '2025-02-13', 'printer', 50000, 'not applicable', 'to print', 2, '25000', 'inkmotr', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(16, 'cg', 4350, 'computer', '2025-02-14', 'headphones', 60000, 'na', 'for experiment', 4, '8000', 'sonypvt', 'Pending Expert Approval', 'rigvednaik22167@gmail.com', NULL),
(17, 'ip', 8745, 'computer', '2025-02-13', 'socket', 50000, 'not applicable', 'need', 2, '1000', 'elelllkm', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(18, 'cg', 4350, 'computer', '2025-02-14', 'cable', 60000, 'na', 'connection', 2, '5000', 'oprettt', 'Pending Expert Approval', 'rigvednaik22167@gmail.com', NULL),
(19, 'ip', 769, 'computer', '2025-02-15', 'table fan', 50000, 'not applicable', 'need', 2, '3200', 'korde', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(20, 'ip', 760, 'computer', '2025-02-15', 'motor', 50000, 'not applicable', 'need', 1, '3000', 'korde', '', NULL, NULL),
(21, 'ip', 761, 'computer', '2025-02-15', 'wire', 50000, 'short circuit', 'connecting devices', 1, '300', 'hjookl', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(22, 'ip', 762, 'computer', '2025-02-15', 'hp monitor', 50000, 'short circuit', 'connecting devices', 1, '15000', 'techllllk', 'Pending Expert Approval', 'advaitaddu9@gmail.com', NULL),
(23, 'cg', 8760, 'computer', '2025-02-14', 'projector screen', 60000, 'na', 'presentation', 2, '5000', 'vieweerty', 'Pending Expert Approval', 'rigvednaik22167@gmail.com', NULL),
(24, 'cg', 8769, 'computer', '2025-02-14', 'pendrive', 60000, 'na', 'distribution', 10, '7000', 'hardhkop', '', NULL, NULL),
(25, 'cg', 8990, 'computer', '2025-02-14', 'cpu', 60000, 'na', 'na', 1, '8000', 'hardhkop', '', NULL, NULL),
(26, 'cg', 8999, 'computer', '2025-02-14', 'ethernet', 60000, 'na', 'internet', 2, '23000', 'wigijhjh', 'Pending Expert Approval', 'rigvednaik22167@gmail.com', NULL),
(27, 'ip', 766, 'computer', '2025-02-15', 'hp laptop', 80000, 'na', 'requirement', 1, '56000', 'techstacpp', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(28, 'ip', 5489, 'computer', '2025-02-16', 'dell monitor', 50000, 'broke', 'shortage', 2, '22000', 'hetuodk', 'Pending Expert Approval', 'rugvednaik6666@gmail.com', NULL),
(29, 'ip', 7690, 'computer', '2025-02-18', 'hcl monitor', 78000, 'empty', 'needed', 2, '22000', 'horsesghj', 'Pending Expert Approval', NULL, NULL),
(30, 'cg', 8905, 'computer', '2025-02-16', 'lg lcd tv', 70000, 'empty', 'course', 1, '55000', 'electrishsj', '', NULL, NULL),
(31, 'cg', 8900, 'computer', '2025-02-16', 'digital voltmeter', 70000, 'empty', 'experiments', 1, '1500', 'electrishsj', 'Pending Expert Approval', 'rigvednaik22167@gmail.com', NULL),
(32, 'cg', 8909, 'computer', '2025-02-16', 'ups ', 70000, 'broken', 'shortage', 2, '15000', 'electrishsj', 'Pending Lab Incharge Approval', NULL, NULL),
(33, 'ip', 9090, 'computer', '2025-02-26', 'hcl monitor', 34000, 'not working', 'needed', 1, '14000', 'tydgdgdh', 'Approved', NULL, NULL),
(34, 'ip', 7609, 'computer', '2025-02-18', 'sony speakers', 40000, 'empty', 'sound exp', 2, '13000', 'sonypvt.lmt', 'Approved by Committee', NULL, NULL),
(35, 'ip', 7689, 'computer', '2025-03-18', 'ic3400', 0, 'broke', 'academics', 4, '6000', 'uuopli', 'Approved by Committee', NULL, NULL),
(39, 'ip', 9066, 'computer', '2025-03-10', 'hightech mouse ', 15000, 'broke', 'experiments', 2, '15900', 'hhhhppkkk', 'Approved by Committee', NULL, NULL),
(36, 'ip', 8705, 'computer', '2025-03-18', 'electric fan', 15000, 'broke', 'rising heat', 1, '5000', 'korde', 'Approved by Committee', NULL, NULL),
(37, 'ip', 9098, 'computer', '2025-03-05', 'hvlll computer', 34000, 'not working', 'jgjhgj', 1, '22000', 'ytytggg', 'Approved by Committee', NULL, NULL),
(38, 'ip', 2573, 'computer', '2025-03-11', 'mouse', 5000, 'not working', 'needed', 1, '6000', 'hjoopp', 'Approved by Committee', NULL, NULL),
(40, 'ip', 9060, 'computer', '2025-03-10', 'dell monitor', 15000, 'broke', 'experiments', 1, '15900', 'koolllhh', 'Approved by Committee', NULL, NULL),
(41, 'ip', 9068, 'computer', '2025-03-10', 'dell printer', 15000, 'broke', 'experiments', 1, '20000', 'koolllhh', 'Approved by Committee', NULL, NULL),
(42, 'ip', 90622, 'computer', '2025-03-12', 'nokia mobile', 15000, 'broke', 'experiments', 1, '10000', 'keysoft', 'Approved by Committee', NULL, NULL),
(43, 'ip', 6500, 'computer', '2025-03-11', 'hp printer', 15000, 'broke', 'printing paper', 1, '13000', 'loprrtt', 'Approved by Committee', NULL, NULL),
(44, 'ip', 6539, 'computer', '2025-03-11', 'hp monitor', 15000, 'broke', 'view', 1, '15000', 'screenmlp', 'Approved by Committee', NULL, NULL),
(45, 'ip', 7609, 'computer', '2025-03-16', 'keyboard logitech', 15000, 'not working', 'typing', 1, '5000', 'joiiytre', 'Approved by Committee', NULL, NULL),
(46, 'ip', 2789, 'computer', '2025-03-17', 'cell phone', 15000, 'not working', 'need', 1, '13000', 'aplleeee', 'Approved by Committee', NULL, NULL),
(47, 'ip', 8700, 'computer', '2025-03-10', 'high tech printer from hp', 34000, 'empty', 'work', 1, '35000', 'inksolnmmpp', 'Sent to Committee (Above 25k)', NULL, NULL),
(48, 'ip', 976, 'computer', '2025-03-11', 'hcl monitor', 15000, 'dont know', 'needed', 1, '22000', 'hello.mkp', 'Approved by Committee', NULL, NULL),
(49, 'ip', 6549, 'computer', '2025-03-13', 'sony speakers', 34000, 'empty', 'for auditorium', 1, '5000', 'soundtech.pvt', 'Rejected by principle', NULL, 'etc dept is hvaing share it'),
(50, 'cg', 9086, 'computer', '2025-03-18', 'hp mouse', 30000, 'not working', 'shortage', 4, '6000', 'jtaggg', 'Pending Lab Incharge Approval', NULL, NULL),
(51, 'ip', 9080, 'computer', '2025-03-18', 'hp mouse', 30000, 'not working', 'shortage', 4, '6000', 'jtaggg', 'Approved by principle', NULL, NULL),
(52, 'ip', 33333, 'computer', '2025-03-03', 'fan', 34000, 'broke', 'tutusgf', 1, '13000', 'gdfhf', 'Sent to Committee', NULL, NULL),
(53, 'ip', 2890, 'computer', '2025-03-16', 'digital wall clock', 15000, 'broke', 'time ', 1, '4000', 'jointreeeqq', 'Approved by principle', NULL, NULL),
(54, 'ip', 111, 'computer', '2025-03-27', 'cpu', 15000, 'empty', 'ttgtgtgtg', 3, '15900', 'pppppppp', 'Approved by principle', NULL, NULL),
(55, 'ip', 111, 'computer', '2025-03-27', 'HP 280 G3 MT Desktop PC', 15000, 'empty', 'new purchases for BE students and ME students.', 1, '15900', 'pppppppp', 'Pending Stores Officer Processing', NULL, NULL),
(56, 'ip', 111, 'computer', '2025-03-27', 'HP 280 G3 MT Desktop PC', 15000, 'empty', 'new purchases for BE students and ME students.', 1, '75000', 'Delta technologies , softech computers', 'Pending Stores Officer Processing', NULL, NULL),
(57, 'ip', 8700, 'computer', '2025-05-13', 'pc desktop', 34000, 'not working', 'reqqq', 2, '22000', 'jjjlllppp', 'Pending HOD Approval', NULL, NULL),
(58, 'ip', 402, 'computer', '2025-05-11', 'systems of hp', 34000, 'empty', 'shortage', 2, '80000', 'jtagsoln.pvt', 'Pending Lab Incharge Approval', NULL, NULL),
(59, 'ip', 2009, 'computer', '2025-04-23', 'micro sd card', 2000, 'broke', 'storage', 4, '2000', 'suppliersof goa', 'Pending Lab Incharge Approval', NULL, NULL),
(60, 'cg', 1088, 'computer', '2025-05-02', 'table fan', 10000, 'broke', 'office use', 2, '5000', 'electricalscompany', 'Pending Lab Incharge Approval', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_issues`
--

DROP TABLE IF EXISTS `student_issues`;
CREATE TABLE IF NOT EXISTS `student_issues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) NOT NULL,
  `issue_description` text NOT NULL,
  `report_date` date NOT NULL,
  `status` enum('Open','Resolved') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `student_issues`
--

INSERT INTO `student_issues` (`id`, `student_name`, `issue_description`, `report_date`, `status`) VALUES
(1, 'hgfdfgh', 'tfvrvtv', '2025-02-03', 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `asset id` varchar(50) NOT NULL,
  `supplier id` varchar(50) NOT NULL,
  `supplier name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone no` int NOT NULL,
  UNIQUE KEY `asset id` (`asset id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`asset id`, `supplier id`, `supplier name`, `address`, `phone no`) VALUES
('c1', 'r12', 'rugved naik', 'house no 72 , panchwadi , goa ,india', 987356);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `role` varchar(20) NOT NULL,
  `lab_name` varchar(255) DEFAULT NULL,
  `lab_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dept` varchar(255) DEFAULT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `token_expiration` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lab_id` (`lab_id`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `role`, `lab_name`, `lab_id`, `dept`, `password_reset_token`, `token_expiration`) VALUES
(49, 'assitant', 'rigvednaik22167@gmail.com', '$2y$10$U8j/bo3d20drhmRf2Ox97uOWafT6nmmouQ9lkqdN7XWwlqENR7SzK', 'Active', 'lab assistant', 'ip', 'FDL', NULL, NULL, NULL),
(45, 'addu', 'advaitaddu9@gmail.com', '$2y$10$Inhl2.QZIupM0f7ritks0.k6djk3Em.Hd/8NYHkbmhTNuGRJMhT3W', 'Active', 'lab faculty incharge', 'funds', 'CCL', NULL, NULL, NULL),
(43, 'hod', 'floydvaz01042003@gmail.com', '$2y$10$aKiETs.LM.1anJPNMZktzuYfjtemHoCw0fRFBvAWXG.lgz5Rh1WXy', 'Active', 'HOD', '', '', NULL, NULL, NULL),
(46, 'admin', 'shreyashdesai60@gmail.com', '$2y$10$6QdhYae6laucRmvemDrdg.aLmQUaJ.9ZAMoJEPJwybUC6kKmYFt8W', 'Active', 'Admin', '', '', NULL, NULL, NULL),
(31, 'assitant2', 'assistant2@gmail.com', '$2y$10$ldmea/xgmm1inOxsya4kyOdjyeN63kKbWNxD0LPm2qV8.VknQnNI6', 'Active', 'lab assistant', 'cg', '', NULL, NULL, NULL),
(50, 'incharge', 'rugvednaik6666@gmail.com', '$2y$10$U41TaovZAlrJHYMbr9ahj.M5kbaZa9neUf8NxA9iwNXW09gR.wqJW', 'Active', 'lab faculty incharge', 'ip', 'FDL', NULL, NULL, NULL),
(47, 'stores officer', 'deptstores21@gmail.com', '$2y$10$T1rdrb9Jy3sv6t8v70mWvOWVhG11uCgDB08mhf/oYSfDGXl26wPWW', 'Active', 'store', '', '', NULL, NULL, NULL),
(48, 'pac', 'timeitissee@gmail.com', '$2y$10$Sns2QBXUkysGJyNHcl4ftem5H9IYE6gl.SQOqDZiegKlYdR7pCM.6', 'Active', 'purchase committee', '', '', NULL, NULL, NULL),
(51, 'john', 'john@gmail.com', '$2y$10$L46VGUuM4oyL9fowtwxXFONpc3ULtZ25Pt7BjvoAoRayggE.QdoOa', 'Active', 'lab assistant', 'funds', 'CCL', NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
