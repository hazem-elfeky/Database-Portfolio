-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 23, 2025 at 05:08 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_usersid` int NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_city` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address_street` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_user` (`address_usersid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_usersid`, `address_name`, `address_city`, `address_street`, `address_lat`, `address_long`) VALUES
(2, 1, '', '', '', 37.4219983, -122.084);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `cart_usersid` int NOT NULL,
  `cart_itemsid` int NOT NULL,
  `cart_orders` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_id`),
  KEY `cart_usersid` (`cart_usersid`),
  KEY `cart_itemsid` (`cart_itemsid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_usersid`, `cart_itemsid`, `cart_orders`) VALUES
(4, 1, 2, 1),
(5, 1, 2, 2),
(6, 1, 2, 2),
(7, 1, 2, 2),
(8, 1, 2, 2),
(9, 1, 2, 2),
(10, 1, 3, 3),
(11, 1, 1, 3),
(12, 1, 1, 3),
(20, 1, 3, 4),
(21, 1, 3, 4),
(22, 1, 2, 4),
(23, 1, 2, 4),
(24, 1, 3, 4),
(18, 1, 1, 3),
(25, 1, 3, 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `cartview`;
CREATE TABLE IF NOT EXISTS `cartview` (
`cart_id` int
,`cart_itemsid` int
,`cart_orders` int
,`cart_usersid` int
,`countitems` bigint
,`items_active` tinyint
,`items_cat` int
,`items_count` int
,`items_date` timestamp
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_discount` smallint
,`items_id` int
,`items_image` varchar(255)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_price` float
,`itemsprice` double
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int NOT NULL AUTO_INCREMENT,
  `categories_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `categories_name_ar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `categories_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `categories_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_name_ar`, `categories_image`, `categories_datetime`) VALUES
(1, 'laptop', 'لابتوب', 'laptop.svg', '2025-07-02 02:58:46'),
(2, 'camera', 'كاميرا ', 'camera.svg', '2025-07-02 03:08:34'),
(3, 'mobile', 'موبايل ', 'mobile.svg', '2025-07-02 03:08:53'),
(4, 'shoes', 'احذية', 'shoes.svg', '2025-07-02 03:09:13'),
(5, 'dress', 'فستان ', 'dress.svg', '2025-07-02 03:17:50');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `coupon_count` int NOT NULL,
  `coupon_discount` smallint DEFAULT '0',
  `coupon_expiredate` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `coupon_name` (`coupon_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE IF NOT EXISTS `favorite` (
  `favorite_id` int NOT NULL AUTO_INCREMENT,
  `favorite_usersid` int NOT NULL,
  `favorite_itemsid` int NOT NULL,
  PRIMARY KEY (`favorite_id`),
  KEY `favorite_users_id` (`favorite_usersid`),
  KEY `favorite_items_id` (`favorite_itemsid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_usersid`, `favorite_itemsid`) VALUES
(5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `items_id` int NOT NULL AUTO_INCREMENT,
  `items_name` varchar(100) NOT NULL,
  `items_name_ar` varchar(100) NOT NULL,
  `items_desc` varchar(255) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_image` varchar(255) NOT NULL,
  `items_count` int NOT NULL,
  `items_active` tinyint NOT NULL DEFAULT '1',
  `items_price` float NOT NULL,
  `items_discount` smallint NOT NULL,
  `items_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `items_cat` int NOT NULL,
  PRIMARY KEY (`items_id`),
  KEY `fk_items_category` (`items_cat`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_name_ar`, `items_desc`, `items_desc_ar`, `items_image`, `items_count`, `items_active`, `items_price`, `items_discount`, `items_date`, `items_cat`) VALUES
(1, 'laptop PHP', 'لاب توب  بي اتش بي  ', 'laptop amazing core i5 gen 11 Ram 12 ', 'لابتوب مميز انيق رفيع معالج كور اي فايف رام 12', 'laptop.png', 5, 1, 200, 10, '2025-07-08 17:10:05', 1),
(2, 'Samsung s25 ultra ', 'اس 25 الترا سامسونج', 'Samsung s25 ultra Ram 12 Hard 512 GB Camera 100 mega', 'اس 25 الترا سامسونج رام 12 هارد 512 كاميرا 100 ميغا بيكسل', 'smasung.jpg', 22, 1, 300, 0, '2025-07-08 17:12:12', 3),
(3, 'camera 205d canon', 'كاميرا 250 دي كانون', 'camera 22 megapixel 4k 30 frame', 'كاميرا بدقة 22 ميغا بيكسل', 'camera.PNG', 3, 1, 20, 10, '2025-07-08 17:13:38', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `items1view`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `items1view`;
CREATE TABLE IF NOT EXISTS `items1view` (
`categories_datetime` timestamp
,`categories_id` int
,`categories_image` varchar(255)
,`categories_name` varchar(100)
,`categories_name_ar` varchar(100)
,`items_active` tinyint
,`items_cat` int
,`items_count` int
,`items_date` timestamp
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_discount` smallint
,`items_id` int
,`items_image` varchar(255)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_price` float
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemstopselling`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `itemstopselling`;
CREATE TABLE IF NOT EXISTS `itemstopselling` (
`cart_id` int
,`cart_itemsid` int
,`cart_orders` int
,`cart_usersid` int
,`countitems` bigint
,`items_active` tinyint
,`items_cat` int
,`items_count` int
,`items_date` timestamp
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_discount` smallint
,`items_id` int
,`items_image` varchar(255)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_price` float
,`itemspricedisount` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `myfavorite`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `myfavorite`;
CREATE TABLE IF NOT EXISTS `myfavorite` (
`favorite_id` int
,`favorite_itemsid` int
,`favorite_usersid` int
,`items_active` tinyint
,`items_cat` int
,`items_count` int
,`items_date` timestamp
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_discount` smallint
,`items_id` int
,`items_image` varchar(255)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_price` float
,`users_id` int
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(255) NOT NULL,
  `notification_usersid` int NOT NULL,
  `notification_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int NOT NULL AUTO_INCREMENT,
  `orders_usersid` int NOT NULL,
  `orders_address` int NOT NULL,
  `orders_type` tinyint NOT NULL DEFAULT '0',
  `orders_pricedelivery` int NOT NULL DEFAULT '0',
  `orders_price` int NOT NULL,
  `orders_totalprice` double NOT NULL DEFAULT '0',
  `orders_coupon` int NOT NULL DEFAULT '0',
  `orders_rating` tinyint NOT NULL DEFAULT '0',
  `orders_noterating` varchar(255) NOT NULL DEFAULT 'none',
  `orders_paymentmethod` tinyint NOT NULL DEFAULT '0',
  `orders_status` tinyint NOT NULL DEFAULT '0',
  `orders_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orders_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_usersid`, `orders_address`, `orders_type`, `orders_pricedelivery`, `orders_price`, `orders_totalprice`, `orders_coupon`, `orders_rating`, `orders_noterating`, `orders_paymentmethod`, `orders_status`, `orders_datetime`) VALUES
(1, 1, 1, 1, 0, 354, 354, 0, 0, 'none', 1, 0, '2025-08-18 19:03:51'),
(2, 1, 1, 1, 0, 1500, 1500, 0, 0, 'none', 0, 0, '2025-08-18 19:06:19'),
(3, 1, 1, 1, 0, 1458, 1458, 0, 0, 'none', 1, 0, '2025-08-18 21:41:55'),
(4, 1, 1, 1, 0, 672, 672, 0, 0, 'none', 0, 0, '2025-08-18 23:29:14');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersdetailsview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `ordersdetailsview`;
CREATE TABLE IF NOT EXISTS `ordersdetailsview` (
`cart_id` int
,`cart_itemsid` int
,`cart_orders` int
,`cart_usersid` int
,`countitems` bigint
,`items_active` tinyint
,`items_cat` int
,`items_count` int
,`items_date` timestamp
,`items_desc` varchar(255)
,`items_desc_ar` varchar(255)
,`items_discount` smallint
,`items_id` int
,`items_image` varchar(255)
,`items_name` varchar(100)
,`items_name_ar` varchar(100)
,`items_price` float
,`itemsprice` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `ordersview`;
CREATE TABLE IF NOT EXISTS `ordersview` (
`address_city` varchar(255)
,`address_id` int
,`address_street` varchar(255)
,`orders_address` int
,`orders_id` int
,`orders_usersid` int
);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `setting_id` int NOT NULL AUTO_INCREMENT,
  `setting_titlehome` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `setting_bodyhome` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `settings_deliverytime` int NOT NULL DEFAULT '30',
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_id`, `setting_titlehome`, `setting_bodyhome`, `settings_deliverytime`) VALUES
(1, 'Offers and discounts', 'Right and don\'t miss your offer', 30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `users_id` int NOT NULL AUTO_INCREMENT,
  `users_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `users_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `users_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `users_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `users_verfiycode` int NOT NULL,
  `users_approve` tinyint NOT NULL DEFAULT '0',
  `users_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`users_id`, `users_name`, `users_password`, `users_email`, `users_phone`, `users_verfiycode`, `users_approve`, `users_create`) VALUES
(1, 'hazem', '12345678', 'hazem@gmail.com', '324234', 37290, 1, '2025-06-17 20:47:54');

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

DROP VIEW IF EXISTS `cartview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum((`items`.`items_price` - ((`items`.`items_price` * `items`.`items_discount`) / 100))) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on((`items`.`items_id` = `cart`.`cart_itemsid`))) WHERE (`cart`.`cart_orders` = 0) GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `items1view`
--
DROP TABLE IF EXISTS `items1view`;

DROP VIEW IF EXISTS `items1view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `items1view`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name` AS `categories_name`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_datetime` AS `categories_datetime` FROM (`items` join `categories` on((`items`.`items_cat` = `categories`.`categories_id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `itemstopselling`
--
DROP TABLE IF EXISTS `itemstopselling`;

DROP VIEW IF EXISTS `itemstopselling`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemstopselling`  AS SELECT count(`cart`.`cart_id`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, (`items`.`items_price` - ((`items`.`items_price` * `items`.`items_discount`) / 100)) AS `itemspricedisount` FROM (`cart` join `items` on((`items`.`items_id` = `cart`.`cart_itemsid`))) WHERE (`cart`.`cart_orders` <> 0) GROUP BY `cart`.`cart_itemsid` ;

-- --------------------------------------------------------

--
-- Structure for view `myfavorite`
--
DROP TABLE IF EXISTS `myfavorite`;

DROP VIEW IF EXISTS `myfavorite`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `myfavorite`  AS SELECT `favorite`.`favorite_id` AS `favorite_id`, `favorite`.`favorite_usersid` AS `favorite_usersid`, `favorite`.`favorite_itemsid` AS `favorite_itemsid`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat`, `users`.`users_id` AS `users_id` FROM ((`favorite` join `users` on((`users`.`users_id` = `favorite`.`favorite_usersid`))) join `items` on((`items`.`items_id` = `favorite`.`favorite_itemsid`))) ;

-- --------------------------------------------------------

--
-- Structure for view `ordersdetailsview`
--
DROP TABLE IF EXISTS `ordersdetailsview`;

DROP VIEW IF EXISTS `ordersdetailsview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersdetailsview`  AS SELECT sum((`items`.`items_price` - ((`items`.`items_price` * `items`.`items_discount`) / 100))) AS `itemsprice`, count(`cart`.`cart_itemsid`) AS `countitems`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_usersid` AS `cart_usersid`, `cart`.`cart_itemsid` AS `cart_itemsid`, `cart`.`cart_orders` AS `cart_orders`, `items`.`items_id` AS `items_id`, `items`.`items_name` AS `items_name`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_desc` AS `items_desc`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_image` AS `items_image`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_date` AS `items_date`, `items`.`items_cat` AS `items_cat` FROM (`cart` join `items` on((`items`.`items_id` = `cart`.`cart_itemsid`))) WHERE (`cart`.`cart_orders` <> 0) GROUP BY `cart`.`cart_itemsid`, `cart`.`cart_usersid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

DROP VIEW IF EXISTS `ordersview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`orders_id` AS `orders_id`, `orders`.`orders_usersid` AS `orders_usersid`, `orders`.`orders_address` AS `orders_address`, `address`.`address_id` AS `address_id`, `address`.`address_street` AS `address_street`, `address`.`address_city` AS `address_city` FROM (`orders` left join `address` on((`address`.`address_id` = `orders`.`orders_address`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
