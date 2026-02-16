-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2025 at 05:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `campus_eats`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `password`, `email`, `created_at`) VALUES
(1, 'admin', 'admin123', 'admin@college.edu', '2025-10-31 19:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `food_id`, `quantity`, `added_at`) VALUES
(68, 9, 111, 1, '2025-11-05 17:27:55'),
(72, 13, 82, 1, '2025-11-05 17:41:28'),
(73, 18, 117, 1, '2025-11-05 17:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Snacks', 'Quick bites and snacks'),
(2, 'Meals', 'Full course meals'),
(3, 'Beverages', 'Drinks and refreshments'),
(4, 'Desserts', 'Sweet treats');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`favorite_id`, `user_id`, `food_id`, `added_at`) VALUES
(27, 7, 119, '2025-11-05 16:40:28'),
(30, 7, 82, '2025-11-05 16:40:42'),
(31, 7, 106, '2025-11-05 17:03:17'),
(34, 11, 119, '2025-11-05 17:14:52'),
(35, 11, 105, '2025-11-05 17:15:04'),
(37, 10, 121, '2025-11-05 17:26:34'),
(38, 9, 111, '2025-11-05 17:27:51'),
(39, 16, 121, '2025-11-05 17:40:26'),
(40, 13, 82, '2025-11-05 17:41:29'),
(41, 13, 106, '2025-11-05 17:41:32'),
(42, 18, 117, '2025-11-05 17:42:58'),
(43, 19, 122, '2025-11-06 07:23:38'),
(44, 19, 121, '2025-11-06 07:23:44'),
(45, 19, 119, '2025-11-06 07:23:47'),
(47, 8, 84, '2025-11-06 07:25:05'),
(48, 8, 119, '2025-11-06 07:25:13');

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `food_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_url` varchar(500) DEFAULT NULL,
  `image_type` enum('url','local') DEFAULT 'local',
  `is_available` tinyint(1) DEFAULT 1,
  `is_special` tinyint(1) DEFAULT 0,
  `special_date` date DEFAULT NULL,
  `avg_rating` decimal(3,2) DEFAULT 0.00,
  `total_ratings` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`food_id`, `name`, `description`, `price`, `category_id`, `image_url`, `image_type`, `is_available`, `is_special`, `special_date`, `avg_rating`, `total_ratings`, `created_at`) VALUES
(82, 'Veg Biryani', 'Classic slow-cooked vegetable rice.', 80.99, 2, '/static/images/veg_biryani.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 08:30:22'),
(83, 'Veg Sandwich', 'Fresh veggies and cheese on whole wheat.', 30.50, 1, '/static/images/veg_sandwich.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 08:30:22'),
(84, 'Coffee', 'Hot brewed coffee.', 25.50, 3, '/static/images/coffee.jpg', 'local', 1, 0, '2025-11-04', 5.00, 1, '2025-10-08 08:30:22'),
(85, 'Idli', 'Steamed savory rice cakes served with sambar and chutney.', 50.00, 1, '/static/images/idli.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(86, 'Upma', 'Thick porridge made from dry-roasted semolina.', 60.00, 1, '/static/images/upma.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(87, 'Sada Dosa', 'Thin, crispy rice crepe served with chutney and sambar.', 70.00, 1, '/static/images/sada_dosa.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(88, 'Masala Dosa', 'Dosa filled with spiced mashed potatoes.', 90.00, 1, '/static/images/masala_dosa.jpg', 'local', 1, 1, '2025-11-06', 0.00, 0, '2025-10-08 11:28:38'),
(89, 'Onion Uttappa', 'Thick savory pancake topped with finely chopped onions.', 85.00, 1, '/static/images/onion_uttappa.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(90, 'Tomato Uttappa', 'Savory pancake topped with fresh tomatoes.', 85.00, 1, '/static/images/tomato_uttappa.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(91, 'Cheese Masala Dosa', 'Masala Dosa topped with melted cheese.', 110.00, 1, '/static/images/cheese_masala_dosa.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(92, 'Cheese Sada Dosa', 'Plain Dosa with a layer of melted cheese.', 90.00, 1, '/static/images/cheese_sada_dosa.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(93, 'Plain Uttappa', 'Simple thick savory rice pancake.', 75.00, 1, '/static/images/plain_uttappa.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(95, 'Medu Vada', 'Savory doughnut-shaped fritters made from lentil batter.', 65.00, 1, '/static/images/medu_vada.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(96, 'Potato Vada Sambar', 'Spicy potato fritter served with sambar.', 70.00, 1, '/static/images/potato_vada_sambar.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(98, 'Egg Bhurji Pav', 'Spicy scrambled eggs served with pav.', 90.00, 1, '/static/images/egg_bhurji_pav.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(99, 'Omelet Pav', 'Egg omelet served inside pav bread.', 65.00, 1, '/static/images/omelet_pav.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(100, 'Vada Pav', 'Spicy potato fritter stuffed in bread bun.', 40.00, 1, '/static/images/vada_pav.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(101, 'Samosa', 'Crispy fried pastry with spiced potato filling.', 45.00, 1, '/static/images/samosa.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(102, 'Cheese Maggi', 'Instant noodles cooked with cheese.', 80.00, 1, '/static/images/cheese_maggi.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(103, 'Veg Hakka Noodles', 'Boiled noodles stir-fried with vegetables and sauces.', 115.00, 1, '/static/images/veg_hakka_noodles.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(104, 'Paneer Chilly', 'Cottage cheese cubes stir-fried in a chili sauce.', 140.00, 2, '/static/images/paneer_chilly.jpg', 'local', 1, 0, '2025-11-05', 0.00, 0, '2025-10-08 11:28:38'),
(105, 'Veg Manchurian', 'Fried vegetable balls in a spicy sauce.', 130.00, 2, '/static/images/veg_manchurian.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(106, 'Veg Fried Rice', 'Fried rice with assorted vegetables.', 110.00, 2, '/static/images/veg_fried_rice.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(108, 'Dal Khichadi', 'Lentil and rice dish served with smoky tempering.', 110.00, 2, '/static/images/dal_khichadi.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(109, 'Poha', 'Flattened rice cooked with spices, onions, and peanuts.', 50.00, 1, '/static/images/poha.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(110, 'Missal Pav', 'Spicy sprouted bean curry served with pav.', 95.00, 1, '/static/images/missal_pav.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(111, 'Chole Bhature', 'Spicy chickpea curry served with large fluffy bhature.', 120.00, 2, '/static/images/chole_bhature.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(112, 'Pani Puri', 'Crispy puris filled with spicy tangy water.', 50.00, 1, '/static/images/pani_puri.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(113, 'Sev Puri', 'Flat puris topped with potatoes, chutneys, and sev.', 60.00, 1, '/static/images/sev_puri.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(114, 'Samosa Chat', 'Samosa topped with yogurt, chutneys, and spices.', 75.00, 1, '/static/images/samosa_chat.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(115, 'Kachori Chat', 'Kachori topped with yogurt, chutneys, and spices.', 70.00, 1, '/static/images/kachori_chat.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(116, 'Ice Cream', 'Vanilla ice cream scoop.', 25.00, 4, '/static/images/ice_cream.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(117, 'Gulab Jamun', 'Sweet milk solid dumplings in sugar syrup.', 40.00, 4, '/static/images/gulab_jamun.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-10-08 11:28:38'),
(119, 'Chai', 'Indian spice Drink', 10.00, 3, 'https://tealise.com/cdn/shop/articles/kitchen-kelley-homemade-chai-tea.jpg?v=1532286387', 'local', 1, 0, '2025-11-04', 4.00, 1, '2025-11-01 20:19:44'),
(121, 'Cold Coffee', 'cold drink ', 45.00, 3, 'https://mytastycurry.com/wp-content/uploads/2020/04/Cafe-style-cold-coffee-with-icecream.jpg', 'local', 1, 0, '2025-11-04', 0.00, 0, '2025-11-02 16:05:05'),
(122, 'LASSI', 'INDIAN DRINK', 35.00, 3, 'https://www.sharmispassions.com/wp-content/uploads/2023/08/sweet-lassi3.jpg', 'local', 0, 0, '2025-11-04', 0.00, 0, '2025-11-02 21:40:10');

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_tickets`
--

CREATE TABLE `helpdesk_tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `issue_type` enum('order','payment','other') DEFAULT 'other',
  `description` text NOT NULL,
  `status` enum('open','in_progress','resolved','closed') DEFAULT 'open',
  `admin_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `helpdesk_tickets`
--

INSERT INTO `helpdesk_tickets` (`ticket_id`, `user_id`, `order_id`, `subject`, `issue_type`, `description`, `status`, `admin_response`, `created_at`, `updated_at`) VALUES
(9, 8, NULL, 'payement porb', 'order', 'hiii\r\n', 'open', NULL, '2025-11-06 07:43:45', '2025-11-06 07:43:45'),
(10, 8, NULL, 'payement porb', 'order', 'hjhj', 'open', 'jijj', '2025-11-06 07:45:30', '2025-11-06 07:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` enum('order','payment','system') DEFAULT 'order',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `order_id`, `title`, `message`, `type`, `is_read`, `created_at`) VALUES
(114, 7, NULL, 'Subscription Activated', 'Your monthly subscription has been activated! Enjoy 10% discount on all orders.', 'order', 1, '2025-11-05 16:41:41'),
(115, 7, 28, 'Order Placed', 'Your order #28 has been placed successfully!', 'order', 1, '2025-11-05 16:42:04'),
(116, 7, 28, 'Order Accepted', 'Your order #28 has been accepted and is being prepared!', 'order', 1, '2025-11-05 16:53:53'),
(117, 7, 29, 'Order Placed', 'Your order #29 has been placed successfully!', 'order', 1, '2025-11-05 16:56:19'),
(118, 7, 28, 'Order Status Update', 'Order #28: Your order is being prepared', 'order', 1, '2025-11-05 16:56:54'),
(119, 7, 28, 'Order Status Update', 'Order #28: Your order is ready for pickup!', 'order', 0, '2025-11-05 16:58:15'),
(120, 7, 29, 'Order Accepted', 'Your order #29 has been accepted and is being prepared!', 'order', 0, '2025-11-05 16:58:19'),
(121, 7, 29, 'Order Cancelled', 'Your order #29 has been cancelled.', 'order', 0, '2025-11-05 16:58:40'),
(122, 7, 29, 'Refund Processed', 'A refund for order #29 has been processed.', 'order', 0, '2025-11-05 16:58:40'),
(123, 7, 28, 'Order Status Update', 'Order #28: Your order has been completed', 'order', 0, '2025-11-05 16:58:50'),
(124, 7, 30, 'Order Placed', 'Your favorite items order #30 has been placed successfully!', 'order', 1, '2025-11-05 17:03:29'),
(125, 7, 30, 'Order Accepted', 'Your order #30 has been accepted and is being prepared!', 'order', 1, '2025-11-05 17:03:39'),
(126, 7, 30, 'Order Status Update', 'Order #30: Your order is being prepared', 'order', 0, '2025-11-05 17:03:45'),
(127, 7, 31, 'Order Placed', 'Your order #31 has been placed successfully!', 'order', 0, '2025-11-05 17:04:32'),
(128, 7, 31, 'Order Accepted', 'Your order #31 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:05:35'),
(129, 7, 31, 'Order Status Update', 'Order #31: Your order is ready for pickup!', 'order', 0, '2025-11-05 17:05:39'),
(130, 11, 32, 'Order Placed', 'Your order #32 has been placed successfully!', 'order', 0, '2025-11-05 17:10:34'),
(131, 11, 32, 'Order Accepted', 'Your order #32 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:11:02'),
(132, 11, 32, 'Order Status Update', 'Order #32: Your order has been completed', 'order', 0, '2025-11-05 17:11:22'),
(133, 11, 33, 'Order Placed', 'Your favorite items order #33 has been placed successfully!', 'order', 0, '2025-11-05 17:11:42'),
(134, 11, 33, 'Order Accepted', 'Your order #33 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:11:48'),
(135, 11, 33, 'Order Status Update', 'Order #33: Your order is ready for pickup!', 'order', 0, '2025-11-05 17:12:07'),
(136, 11, 34, 'Order Placed', 'Your order #34 has been placed successfully!', 'order', 0, '2025-11-05 17:12:37'),
(137, 11, 34, 'Order Accepted', 'Your order #34 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:12:45'),
(138, 11, 34, 'Order Status Update', 'Order #34: Your order is being prepared', 'order', 0, '2025-11-05 17:12:56'),
(139, 11, 35, 'Order Placed', 'Your order #35 has been placed successfully!', 'order', 0, '2025-11-05 17:14:05'),
(140, 11, 35, 'Order Accepted', 'Your order #35 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:14:28'),
(141, 11, 36, 'Order Placed', 'Your order #36 has been placed successfully!', 'order', 0, '2025-11-05 17:15:16'),
(152, 10, 41, 'Order Placed', 'Your order #41 has been placed successfully!', 'order', 0, '2025-11-05 17:26:03'),
(153, 10, 41, 'Order Accepted', 'Your order #41 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:26:21'),
(154, 10, 41, 'Order Status Update', 'Order #41: Your order has been completed', 'order', 0, '2025-11-05 17:26:27'),
(155, 10, 42, 'Order Placed', 'Your favorite items order #42 has been placed successfully!', 'order', 0, '2025-11-05 17:26:38'),
(156, 10, 42, 'Order Accepted', 'Your order #42 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:26:45'),
(157, 10, 42, 'Order Status Update', 'Order #42: Your order has been completed', 'order', 0, '2025-11-05 17:26:49'),
(158, 9, 43, 'Order Placed', 'Your favorite items order #43 has been placed successfully!', 'order', 0, '2025-11-05 17:27:57'),
(159, 9, 43, 'Order Accepted', 'Your order #43 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:28:12'),
(160, 9, 43, 'Order Status Update', 'Order #43: Your order has been completed', 'order', 0, '2025-11-05 17:28:15'),
(161, 17, 44, 'Order Placed', 'Your order #44 has been placed successfully!', 'order', 0, '2025-11-05 17:39:49'),
(162, 16, 45, 'Order Placed', 'Your order #45 has been placed successfully!', 'order', 0, '2025-11-05 17:40:19'),
(163, 12, 46, 'Order Placed', 'Your order #46 has been placed successfully!', 'order', 0, '2025-11-05 17:41:05'),
(164, 13, 47, 'Order Placed', 'Your favorite items order #47 has been placed successfully!', 'order', 0, '2025-11-05 17:41:36'),
(165, 18, 48, 'Order Placed', 'Your favorite items order #48 has been placed successfully!', 'order', 0, '2025-11-05 17:43:05'),
(166, 11, 36, 'Order Accepted', 'Your order #36 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:43:49'),
(167, 13, 47, 'Order Accepted', 'Your order #47 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:43:52'),
(168, 12, 46, 'Order Accepted', 'Your order #46 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:43:54'),
(169, 16, 45, 'Order Accepted', 'Your order #45 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:43:57'),
(170, 17, 44, 'Order Accepted', 'Your order #44 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:43:59'),
(171, 18, 48, 'Order Accepted', 'Your order #48 has been accepted and is being prepared!', 'order', 0, '2025-11-05 17:44:04'),
(172, 13, 47, 'Order Status Update', 'Order #47: Your order has been completed', 'order', 0, '2025-11-05 17:44:52'),
(173, 12, 46, 'Order Status Update', 'Order #46: Your order has been completed', 'order', 0, '2025-11-05 17:44:54'),
(174, 16, 45, 'Order Status Update', 'Order #45: Your order has been completed', 'order', 0, '2025-11-05 17:44:56'),
(175, 17, 44, 'Order Status Update', 'Order #44: Your order has been completed', 'order', 0, '2025-11-05 17:44:59'),
(176, 11, 36, 'Order Status Update', 'Order #36: Your order has been completed', 'order', 0, '2025-11-05 17:45:02'),
(182, 11, 35, 'Order Status Update', 'Order #35: Your order has been completed', 'order', 0, '2025-11-05 19:12:21'),
(183, 18, 48, 'Order Status Update', 'Order #48: Your order has been completed', 'order', 0, '2025-11-05 19:12:24'),
(185, 11, 33, 'Order Status Update', 'Order #33: Your order has been completed', 'order', 0, '2025-11-05 19:13:00'),
(186, 11, 34, 'Order Status Update', 'Order #34: Your order has been cancelled', 'order', 0, '2025-11-05 19:13:09'),
(191, 8, 50, 'Order Placed', 'Your order #50 has been placed successfully!', 'order', 1, '2025-11-06 07:42:46'),
(192, 8, NULL, 'Support Ticket Created', 'Your support ticket #9 has been created', 'order', 0, '2025-11-06 07:43:45'),
(193, 8, NULL, 'Support Ticket Created', 'Your support ticket #10 has been created', 'order', 0, '2025-11-06 07:45:30'),
(194, 8, NULL, 'Support Response', 'Your support ticket #10 has been updated', 'order', 0, '2025-11-06 07:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('placed','pending','preparing','ready','completed','cancelled') DEFAULT 'placed',
  `payment_status` enum('pending','paid','failed') DEFAULT 'pending',
  `payment_method` varchar(50) DEFAULT NULL,
  `is_bulk_order` tinyint(1) DEFAULT 0,
  `event_name` varchar(200) DEFAULT NULL,
  `order_type` enum('immediate','scheduled') DEFAULT 'immediate',
  `scheduled_date` date DEFAULT NULL,
  `scheduled_time` time DEFAULT NULL,
  `priority` enum('normal','high') DEFAULT 'normal',
  `stage_times` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stage_times`)),
  `admin_accepted_at` timestamp NULL DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL,
  `special_instructions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_amount`, `status`, `payment_status`, `payment_method`, `is_bulk_order`, `event_name`, `order_type`, `scheduled_date`, `scheduled_time`, `priority`, `stage_times`, `admin_accepted_at`, `order_date`, `completed_at`, `special_instructions`) VALUES
(28, 7, 9.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', '{\"placed\": \"2025-11-05T22:23:53.628963\", \"pending\": \"2025-11-05T22:38:53.628963\", \"preparing\": \"2025-11-05T22:53:53.628963\", \"ready\": \"2025-11-05T23:08:53.628963\", \"completed\": \"2025-11-05T23:23:53.628963\"}', '2025-11-05 16:53:53', '2025-11-05 16:42:04', '2025-11-05 16:58:50', 'less sugar'),
(29, 7, 126.00, 'cancelled', '', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', '{\"placed\": \"2025-11-05T22:28:19.447416\", \"pending\": \"2025-11-05T22:43:19.447416\", \"preparing\": \"2025-11-05T22:58:19.447416\", \"ready\": \"2025-11-05T23:13:19.447416\", \"completed\": \"2025-11-05T23:28:19.447416\"}', '2025-11-05 16:58:19', '2025-11-05 16:56:19', NULL, ''),
(30, 7, 200.99, 'preparing', 'paid', 'Quick Order', 0, NULL, 'immediate', NULL, NULL, 'normal', '{\"placed\": \"2025-11-05T22:33:39.424494\", \"pending\": \"2025-11-05T22:48:39.424494\", \"preparing\": \"2025-11-05T23:03:39.424494\", \"ready\": \"2025-11-05T23:18:39.424494\", \"completed\": \"2025-11-05T23:33:39.424494\"}', '2025-11-05 17:03:39', '2025-11-05 17:03:28', NULL, NULL),
(31, 7, 351.00, 'ready', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', '{\"placed\": \"2025-11-05T22:35:35.203247\", \"pending\": \"2025-11-05T22:50:35.203247\", \"preparing\": \"2025-11-05T23:05:35.203247\", \"ready\": \"2025-11-05T23:20:35.203247\", \"completed\": \"2025-11-05T23:35:35.203247\"}', '2025-11-05 17:05:34', '2025-11-05 17:04:32', NULL, ''),
(32, 11, 275.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'high', '{\"placed\": \"2025-11-05T22:41:02.066794\", \"pending\": \"2025-11-05T22:56:02.066794\", \"preparing\": \"2025-11-05T23:11:02.066794\", \"ready\": \"2025-11-05T23:26:02.066794\", \"completed\": \"2025-11-05T23:41:02.066794\"}', '2025-11-05 17:11:02', '2025-11-05 17:10:34', '2025-11-05 17:11:22', ''),
(33, 11, 165.00, 'completed', 'paid', 'Quick Order', 0, NULL, 'immediate', NULL, NULL, 'high', '{\"placed\": \"2025-11-05T22:41:48.612617\", \"pending\": \"2025-11-05T22:56:48.612617\", \"preparing\": \"2025-11-05T23:11:48.612617\", \"ready\": \"2025-11-05T23:26:48.612617\", \"completed\": \"2025-11-05T23:41:48.612617\"}', '2025-11-05 17:11:48', '2025-11-05 17:11:41', '2025-11-05 19:13:00', NULL),
(34, 11, 255.00, 'cancelled', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'high', '{\"placed\": \"2025-11-05T22:42:44.793017\", \"pending\": \"2025-11-05T22:57:44.793017\", \"preparing\": \"2025-11-05T23:12:44.793017\", \"ready\": \"2025-11-05T23:27:44.793017\", \"completed\": \"2025-11-05T23:42:44.793017\"}', '2025-11-05 17:12:44', '2025-11-05 17:12:37', NULL, ''),
(35, 11, 285.00, 'completed', 'paid', 'UPI', 0, '', 'scheduled', '2025-11-05', '22:46:00', 'high', '{\"placed\": \"2025-11-05T22:44:28.042719\", \"pending\": \"2025-11-05T22:59:28.042719\", \"preparing\": \"2025-11-05T23:14:28.042719\", \"ready\": \"2025-11-05T23:29:28.042719\", \"completed\": \"2025-11-05T23:44:28.042719\"}', '2025-11-05 17:14:27', '2025-11-05 17:14:05', '2025-11-05 19:12:21', 'extra spicy'),
(36, 11, 10.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'high', '{\"placed\": \"2025-11-05T23:13:49.931821\", \"pending\": \"2025-11-05T23:28:49.931821\", \"preparing\": \"2025-11-05T23:43:49.931821\", \"ready\": \"2025-11-05T23:58:49.931821\", \"completed\": \"2025-11-06T00:13:49.931821\"}', '2025-11-05 17:43:49', '2025-11-05 17:15:15', '2025-11-05 17:45:02', ''),
(37, 8, 140.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', '{\"placed\": \"2025-11-05T22:51:49.656405\", \"pending\": \"2025-11-05T23:06:49.656405\", \"preparing\": \"2025-11-05T23:21:49.656405\", \"ready\": \"2025-11-05T23:36:49.656405\", \"completed\": \"2025-11-05T23:51:49.656405\"}', '2025-11-05 17:21:49', '2025-11-05 17:21:19', '2025-11-05 17:22:18', ''),
(38, 8, 10.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', '{\"placed\": \"2025-11-05T22:52:33.391253\", \"pending\": \"2025-11-05T23:07:33.391253\", \"preparing\": \"2025-11-05T23:22:33.391253\", \"ready\": \"2025-11-05T23:37:33.391253\", \"completed\": \"2025-11-05T23:52:33.391253\"}', '2025-11-05 17:22:33', '2025-11-05 17:22:28', '2025-11-05 19:13:16', ''),
(39, 8, 40.00, 'cancelled', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', '{\"placed\": \"2025-11-05T22:53:20.077323\", \"pending\": \"2025-11-05T23:08:20.077323\", \"preparing\": \"2025-11-05T23:23:20.077323\", \"ready\": \"2025-11-05T23:38:20.077323\", \"completed\": \"2025-11-05T23:53:20.077323\"}', '2025-11-05 17:23:19', '2025-11-05 17:23:11', NULL, ''),
(40, 8, 140.00, 'completed', 'paid', 'Quick Order', 0, NULL, 'immediate', NULL, NULL, 'normal', '{\"placed\": \"2025-11-06T00:29:54.503105\", \"pending\": \"2025-11-06T00:34:54.503105\", \"preparing\": \"2025-11-06T00:34:54.503105\", \"ready\": \"2025-11-06T00:34:54.503105\", \"completed\": \"2025-11-06T00:34:54.503105\"}', '2025-11-05 18:59:54', '2025-11-05 17:23:43', '2025-11-05 19:06:00', NULL),
(41, 10, 150.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', '{\"placed\": \"2025-11-05T22:56:21.210687\", \"pending\": \"2025-11-05T23:11:21.210687\", \"preparing\": \"2025-11-05T23:26:21.210687\", \"ready\": \"2025-11-05T23:41:21.210687\", \"completed\": \"2025-11-05T23:56:21.210687\"}', '2025-11-05 17:26:21', '2025-11-05 17:26:03', '2025-11-05 17:26:27', ''),
(42, 10, 45.00, 'completed', 'paid', 'Quick Order', 0, NULL, 'immediate', NULL, NULL, 'normal', '{\"placed\": \"2025-11-05T22:56:45.026005\", \"pending\": \"2025-11-05T23:11:45.026005\", \"preparing\": \"2025-11-05T23:26:45.026005\", \"ready\": \"2025-11-05T23:41:45.026005\", \"completed\": \"2025-11-05T23:56:45.026005\"}', '2025-11-05 17:26:45', '2025-11-05 17:26:38', '2025-11-05 17:26:49', NULL),
(43, 9, 120.00, 'completed', 'paid', 'Quick Order', 0, NULL, 'immediate', NULL, NULL, 'normal', '{\"placed\": \"2025-11-05T22:58:11.992345\", \"pending\": \"2025-11-05T23:13:11.992345\", \"preparing\": \"2025-11-05T23:28:11.992345\", \"ready\": \"2025-11-05T23:43:11.992345\", \"completed\": \"2025-11-05T23:58:11.992345\"}', '2025-11-05 17:28:11', '2025-11-05 17:27:57', '2025-11-05 17:28:15', NULL),
(44, 17, 10.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'high', '{\"placed\": \"2025-11-05T23:13:59.953105\", \"pending\": \"2025-11-05T23:28:59.953105\", \"preparing\": \"2025-11-05T23:43:59.953105\", \"ready\": \"2025-11-05T23:58:59.953105\", \"completed\": \"2025-11-06T00:13:59.953105\"}', '2025-11-05 17:43:59', '2025-11-05 17:39:49', '2025-11-05 17:44:59', ''),
(45, 16, 30.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'high', '{\"placed\": \"2025-11-05T23:13:57.389627\", \"pending\": \"2025-11-05T23:28:57.389627\", \"preparing\": \"2025-11-05T23:43:57.389627\", \"ready\": \"2025-11-05T23:58:57.389627\", \"completed\": \"2025-11-06T00:13:57.389627\"}', '2025-11-05 17:43:57', '2025-11-05 17:40:19', '2025-11-05 17:44:56', ''),
(46, 12, 120.00, 'completed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'high', '{\"placed\": \"2025-11-05T23:13:54.650914\", \"pending\": \"2025-11-05T23:28:54.650914\", \"preparing\": \"2025-11-05T23:43:54.650914\", \"ready\": \"2025-11-05T23:58:54.650914\", \"completed\": \"2025-11-06T00:13:54.650914\"}', '2025-11-05 17:43:54', '2025-11-05 17:41:05', '2025-11-05 17:44:54', ''),
(47, 13, 190.99, 'completed', 'paid', 'Quick Order', 0, NULL, 'immediate', NULL, NULL, 'high', '{\"placed\": \"2025-11-05T23:13:52.144719\", \"pending\": \"2025-11-05T23:28:52.144719\", \"preparing\": \"2025-11-05T23:43:52.144719\", \"ready\": \"2025-11-05T23:58:52.144719\", \"completed\": \"2025-11-06T00:13:52.144719\"}', '2025-11-05 17:43:52', '2025-11-05 17:41:36', '2025-11-05 17:44:52', NULL),
(48, 18, 40.00, 'completed', 'paid', 'Quick Order', 0, NULL, 'immediate', NULL, NULL, 'normal', '{\"placed\": \"2025-11-05T23:14:04.622728\", \"pending\": \"2025-11-05T23:29:04.622728\", \"preparing\": \"2025-11-05T23:44:04.622728\", \"ready\": \"2025-11-05T23:59:04.622728\", \"completed\": \"2025-11-06T00:14:04.622728\"}', '2025-11-05 17:44:04', '2025-11-05 17:43:05', '2025-11-05 19:12:24', NULL),
(49, 8, 310.00, 'preparing', 'paid', 'Cash', 0, 'Annual', 'immediate', '2025-11-07', '14:58:00', 'normal', '{\"placed\": \"2025-11-06T12:59:29.045433\", \"pending\": \"2025-11-06T13:14:29.045433\", \"preparing\": \"2025-11-06T13:14:29.045433\", \"ready\": \"2025-11-06T13:14:29.045433\", \"completed\": \"2025-11-06T13:14:29.045433\"}', '2025-11-06 07:29:29', '2025-11-06 07:27:39', NULL, 'less sugar'),
(50, 8, 25.50, 'placed', 'paid', 'Cash', 0, '', 'immediate', '0000-00-00', '00:00:00', 'normal', NULL, NULL, '2025-11-06 07:42:46', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `food_id`, `quantity`, `price`) VALUES
(38, 28, 119, 1, 10.00),
(39, 29, 104, 1, 140.00),
(40, 30, 82, 1, 80.99),
(41, 30, 106, 1, 110.00),
(42, 30, 119, 1, 10.00),
(43, 31, 111, 1, 120.00),
(44, 31, 102, 1, 80.00),
(45, 31, 104, 1, 140.00),
(46, 31, 119, 1, 10.00),
(47, 31, 117, 1, 40.00),
(48, 32, 91, 1, 110.00),
(49, 32, 111, 1, 120.00),
(50, 32, 121, 1, 45.00),
(51, 33, 111, 1, 120.00),
(52, 33, 121, 1, 45.00),
(53, 34, 92, 1, 90.00),
(54, 34, 108, 1, 110.00),
(55, 34, 122, 1, 30.00),
(56, 34, 116, 1, 25.00),
(57, 35, 102, 1, 80.00),
(58, 35, 111, 1, 120.00),
(59, 35, 121, 1, 45.00),
(60, 35, 117, 1, 40.00),
(61, 36, 119, 1, 10.00),
(62, 37, 104, 1, 140.00),
(63, 38, 119, 1, 10.00),
(64, 39, 117, 1, 40.00),
(65, 40, 104, 1, 140.00),
(66, 41, 104, 1, 140.00),
(67, 41, 119, 1, 10.00),
(68, 42, 121, 1, 45.00),
(69, 43, 111, 1, 120.00),
(70, 44, 119, 1, 10.00),
(71, 45, 122, 1, 30.00),
(72, 46, 111, 1, 120.00),
(73, 47, 82, 1, 80.99),
(74, 47, 106, 1, 110.00),
(75, 48, 117, 1, 40.00),
(76, 49, 88, 3, 90.00),
(77, 49, 117, 1, 40.00),
(78, 50, 84, 1, 25.50);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(128) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rating_id`, `user_id`, `food_id`, `order_id`, `rating`, `review`, `created_at`) VALUES
(2, 7, 119, 28, 4, '', '2025-11-05 16:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_type` enum('monthly') DEFAULT 'monthly',
  `amount` decimal(10,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','expired','cancelled') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`subscription_id`, `user_id`, `plan_type`, `amount`, `start_date`, `end_date`, `status`, `created_at`) VALUES
(3, 7, 'monthly', 299.00, '2025-11-05', '2025-12-05', 'active', '2025-11-05 16:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `unique_user_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `user_type` enum('student','staff') NOT NULL DEFAULT 'student',
  `subscription_status` enum('none','active','expired') DEFAULT 'none',
  `subscription_start` date DEFAULT NULL,
  `subscription_end` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `unique_user_id`, `name`, `email`, `password`, `phone`, `user_type`, `subscription_status`, `subscription_start`, `subscription_end`, `created_at`) VALUES
(7, 'N01062400047', 'Harshad Dhongade', 'harshaddhongade91@gmail.com', 'scrypt:32768:8:1$BnWKHuZKvPUUMjb6$5ef9bfd08ef6049daa708d3b32f3c454077fcfdf6670b7a94fc46166df0a72f9e89eb771fab6451e27008bf9cbe9407c8e0256bcc15a0284435261e2f34d5915', '9876543210', 'student', 'active', '2025-11-05', '2025-12-05', '2025-11-05 16:33:46'),
(8, 'N01062400048', 'Rahul Howale', 'howalerahul1@gmail.com', 'scrypt:32768:8:1$Ej1fwJl4uSEaEqbg$9ebd986e90075de34fa74033477756848c9a011835c6dd9b293629bea1395bfe4dc4cb0e47b333f1b766d65fbd5d546b952c2642a94c877737815236363ce0a2', '9876543211', 'student', 'none', NULL, NULL, '2025-11-05 16:34:42'),
(9, 'N01062400049', 'yashika chawala', 'yashikachawla1@gmail.com', 'scrypt:32768:8:1$Eln5xaeEhPjxLHYf$c6215b7f26b6bb47ab081048bc9d8605a36ae22e88f6909584b5737abf30f3252e3452a333be83134d7257f0c461bf99e57210ab984379185fa8e3220153828d', '9876543212', 'student', 'none', NULL, NULL, '2025-11-05 16:35:19'),
(10, 'N01062400050', 'Sanjana Bonde', 'sanjanabonde1@gmail.com', 'scrypt:32768:8:1$XupyB2b2M9LeAT2n$3440bcd36353106225565e2b22db10594464b6ccc330039d07fd78fcfa99feee052be0ba0d62326959974f31cc19d45d7bcbc384674f70ce08cbf485b77a48a5', '9876543213', 'student', 'none', NULL, NULL, '2025-11-05 16:36:00'),
(11, 'N01062400051', 'Mehraj I Khan', 'mehrajkhan1@gmail.com', 'scrypt:32768:8:1$lISe1uqNA3zrKlF1$3cc15dde0638d683db52111f7d5f67aa4b803f8cd6fc2cf002fa9893d18b7be39752e3cdb39914ed1bb65a2406b369c30e61a2cd695ce842b143b576b345c299', '9876543214', 'staff', 'none', NULL, NULL, '2025-11-05 17:09:42'),
(12, 'N01062400052', 'P D Jadhav', 'pdjadhav1@gmail.com', 'scrypt:32768:8:1$FuiEREiuVNj3H4IL$d7adefa52188ec24c5b4d3fba423bce808820964fdefce336651aa585eb5ddc50fc69d90816473d0a04495511a0fce39b69112d2074b0df0101890261756b857', '9876543215', 'staff', 'none', NULL, NULL, '2025-11-05 17:32:51'),
(13, 'N01062400053', 'Javed Attar', 'javedattar1@gmail.com', 'scrypt:32768:8:1$2UtGUUya9MGB4q9n$0b924097967ba7c16330c42588d5e3857743dea5b3b60d7e458dfa4a07475f795b9bc1b5c78bf707ccd06578753539c12bc1fbdb398da075c3bdc7e3df32bf93', '9876543216', 'staff', 'none', NULL, NULL, '2025-11-05 17:36:13'),
(16, 'N01062400054', 'Manjusha Khond', 'manjushakhond1@gmail.com', 'scrypt:32768:8:1$q0S3dGCUmfS4vdro$946293884c16a4c9e30b3a9b6f55a8b8ce92578751b2994763df635a3fd495fa6cc44134029a8711f92d5ed3f5f2a154f394606ef92dd3577b1c74f97c19a10d', '9876543217', 'staff', 'none', NULL, NULL, '2025-11-05 17:38:42'),
(17, 'N01062400055', 'Sonali Vidhate', 'sonalividhate1@gmail.com', 'scrypt:32768:8:1$P6lIkdCh1AJ2vVE0$4b9b5d450a3f20392c14e8ba09c2ba828f1c0e3ae4a820d7d9263f911bff31dbab488816425867849137012885b25ce53292a10d241fd16f22220222932b3eb8', '9876543218', 'staff', 'none', NULL, NULL, '2025-11-05 17:39:22'),
(18, 'N01062400056', 'Yash Kamwal', 'yashkamwal1@gmail.com', 'scrypt:32768:8:1$89irzG7C4qLvBA7y$07033a8aacdd828260494cb6c0cfa2c6206a5bf387c62561852cf3a7f5cf59403ffe6699e4d2a838c4385d58b053a4a4f6a8467332946c134568df5717dc0f23', '9876543219', 'student', 'none', NULL, NULL, '2025-11-05 17:42:31'),
(19, 'N23665656544', 'ISHAN SHARMA', 'ishan@gmail.com', 'scrypt:32768:8:1$LPnN0ILqZ3gD7MY7$8780222f586439b55f7729ebdab2c4e4f93d0c289ad495189860c8298b1a80c244765ecc0ff5762443850ace6d2e5b7cd5f545301375571af94733dcfdff0b21', '9088878654', 'staff', 'none', NULL, NULL, '2025-11-06 07:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `user_preferences`
--

CREATE TABLE `user_preferences` (
  `preference_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `theme` enum('light','dark') DEFAULT 'light',
  `email_notifications` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_preferences`
--

INSERT INTO `user_preferences` (`preference_id`, `user_id`, `theme`, `email_notifications`, `created_at`) VALUES
(7, 7, 'light', 1, '2025-11-05 16:33:46'),
(8, 8, 'light', 1, '2025-11-05 16:34:42'),
(9, 9, 'light', 1, '2025-11-05 16:35:19'),
(10, 10, 'light', 1, '2025-11-05 16:36:00'),
(11, 11, 'light', 1, '2025-11-05 17:09:42'),
(12, 12, 'light', 1, '2025-11-05 17:32:51'),
(13, 13, 'light', 1, '2025-11-05 17:36:13'),
(14, 16, 'light', 1, '2025-11-05 17:38:42'),
(15, 17, 'light', 1, '2025-11-05 17:39:22'),
(16, 18, 'light', 1, '2025-11-05 17:42:31'),
(17, 19, 'light', 1, '2025-11-06 07:23:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `unique_user_food` (`user_id`,`food_id`),
  ADD KEY `food_id` (`food_id`),
  ADD KEY `idx_cart_user` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`favorite_id`),
  ADD UNIQUE KEY `unique_user_favorite` (`user_id`,`food_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`food_id`),
  ADD KEY `idx_food_category` (`category_id`),
  ADD KEY `idx_food_special` (`is_special`,`special_date`);

--
-- Indexes for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `idx_helpdesk_status` (`status`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `idx_notification_user` (`user_id`,`is_read`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `idx_order_user` (`user_id`),
  ADD KEY `idx_order_status` (`status`),
  ADD KEY `idx_order_date` (`order_date`),
  ADD KEY `idx_order_scheduled` (`scheduled_date`,`scheduled_time`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD UNIQUE KEY `unique_user_food_rating` (`user_id`,`food_id`,`order_id`),
  ADD KEY `food_id` (`food_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique_user_id` (`unique_user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_user_email` (`email`),
  ADD KEY `idx_user_type` (`user_type`);

--
-- Indexes for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD PRIMARY KEY (`preference_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `food_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user_preferences`
--
ALTER TABLE `user_preferences`
  MODIFY `preference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`) ON DELETE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`) ON DELETE CASCADE;

--
-- Constraints for table `food_items`
--
ALTER TABLE `food_items`
  ADD CONSTRAINT `food_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL;

--
-- Constraints for table `helpdesk_tickets`
--
ALTER TABLE `helpdesk_tickets`
  ADD CONSTRAINT `helpdesk_tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `helpdesk_tickets_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food_items` (`food_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE SET NULL;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_preferences`
--
ALTER TABLE `user_preferences`
  ADD CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
