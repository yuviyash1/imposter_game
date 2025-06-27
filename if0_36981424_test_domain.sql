-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql205.infinityfree.com
-- Generation Time: Jun 27, 2025 at 05:07 AM
-- Server version: 11.4.7-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_36981424_test_domain`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(100) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `details`, `room_id`, `created_at`) VALUES
(1, 4, 'room_auto_removed', 'Room was deleted while user was inside', 13, '2025-06-26 07:37:39'),
(2, 2, 'room_auto_removed', 'Room was deleted while user was inside', 13, '2025-06-26 07:37:42'),
(3, 18, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 27, '2025-06-26 18:54:27'),
(4, 16, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 26, '2025-06-26 18:54:27'),
(5, 17, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 26, '2025-06-26 18:54:27'),
(6, 18, 'room_auto_removed', 'Room deleted while in lobby', 27, '2025-06-26 18:54:35'),
(7, 1, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 30, '2025-06-26 19:02:31'),
(8, 1, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 34, '2025-06-26 19:30:22'),
(9, 18, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 35, '2025-06-26 19:30:22'),
(10, 19, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 36, '2025-06-26 19:37:53'),
(11, 1, 'room_auto_removed', 'Room deleted while in lobby', 34, '2025-06-26 19:43:53'),
(12, 17, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 39, '2025-06-26 21:37:57'),
(13, 21, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 40, '2025-06-27 08:44:45'),
(14, 1, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 40, '2025-06-27 08:44:45'),
(15, 25, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 41, '2025-06-27 08:51:08'),
(16, 23, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 41, '2025-06-27 08:51:08'),
(17, 24, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 41, '2025-06-27 08:51:08'),
(18, 26, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 41, '2025-06-27 08:51:08'),
(19, 22, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 41, '2025-06-27 08:51:08'),
(20, 27, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 41, '2025-06-27 08:51:08'),
(21, 21, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 41, '2025-06-27 08:51:08'),
(22, 25, 'room_auto_removed', 'Room deleted while in lobby', 41, '2025-06-27 08:53:26'),
(23, 26, 'room_auto_removed', 'Room deleted while in lobby', 41, '2025-06-27 08:53:27'),
(24, 24, 'room_auto_removed', 'Room deleted while in lobby', 41, '2025-06-27 08:53:36'),
(25, 22, 'room_auto_removed', 'Room deleted while in lobby', 41, '2025-06-27 08:53:37'),
(26, 27, 'room_auto_removed', 'Room deleted while in lobby', 41, '2025-06-27 08:53:48'),
(27, 29, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 42, '2025-06-27 08:57:16'),
(28, 27, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 43, '2025-06-27 08:58:36'),
(29, 22, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 43, '2025-06-27 08:58:36'),
(30, 24, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 43, '2025-06-27 08:58:36'),
(31, 26, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 43, '2025-06-27 08:58:36'),
(32, 23, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 43, '2025-06-27 08:58:36'),
(33, 25, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 43, '2025-06-27 08:58:36'),
(34, 21, 'room_auto_cleanup', 'Room was inactive for 5 minutes', 43, '2025-06-27 08:58:36'),
(35, 24, 'room_auto_removed', 'Room deleted while in lobby', 43, '2025-06-27 09:00:29'),
(36, 26, 'room_auto_removed', 'Room deleted while in lobby', 43, '2025-06-27 09:00:40'),
(37, 25, 'room_auto_removed', 'Room deleted while in lobby', 43, '2025-06-27 09:00:46'),
(38, 21, 'room_auto_removed', 'Room deleted while in lobby', 43, '2025-06-27 09:00:50'),
(39, 22, 'room_auto_removed', 'Room deleted while in lobby', 43, '2025-06-27 09:00:53');

-- --------------------------------------------------------

--
-- Table structure for table `game_status`
--

CREATE TABLE `game_status` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `result` enum('crewmates_won','imposter_won','pending') DEFAULT 'pending',
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `game_status`
--

INSERT INTO `game_status` (`id`, `room_id`, `result`, `updated_at`) VALUES
(9, 1, 'imposter_won', '2025-06-25 21:13:29'),
(10, 3, 'crewmates_won', '2025-06-25 21:14:41'),
(12, 4, 'imposter_won', '2025-06-25 21:21:56'),
(13, 6, 'crewmates_won', '2025-06-25 21:42:53'),
(15, 7, 'imposter_won', '2025-06-25 21:54:18'),
(16, 8, 'crewmates_won', '2025-06-26 07:03:09'),
(17, 9, 'pending', '2025-06-26 07:24:06'),
(18, 10, 'imposter_won', '2025-06-26 07:30:47'),
(19, 11, 'pending', '2025-06-26 07:34:18'),
(21, 12, 'pending', '2025-06-26 07:37:10'),
(22, 13, 'imposter_won', '2025-06-26 07:37:39'),
(23, 16, 'pending', '2025-06-26 07:58:14'),
(26, 17, 'pending', '2025-06-26 08:00:43'),
(25, 18, 'pending', '2025-06-26 08:00:38'),
(27, 20, 'imposter_won', '2025-06-26 08:17:45'),
(28, 23, 'crewmates_won', '2025-06-26 09:06:49'),
(29, 24, 'imposter_won', '2025-06-26 09:21:15'),
(30, 25, 'imposter_won', '2025-06-26 11:50:29'),
(61, 44, 'pending', '2025-06-27 09:05:50');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `role` enum('crewmate','imposter') DEFAULT 'crewmate',
  `last_activity` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `user_id`, `room_id`, `role`, `last_activity`, `ip_address`, `user_agent`) VALUES
(61, 14, 25, 'crewmate', '2025-06-26 11:49:25', NULL, NULL),
(60, 5, 25, 'imposter', '2025-06-26 11:49:38', NULL, NULL),
(62, 12, 25, 'crewmate', '2025-06-26 11:49:27', NULL, NULL),
(63, 13, 25, 'crewmate', '2025-06-26 11:49:30', NULL, NULL),
(110, 23, 44, 'crewmate', '2025-06-27 09:00:56', NULL, NULL),
(109, 22, 44, 'crewmate', '2025-06-27 09:00:56', NULL, NULL),
(108, 21, 44, 'crewmate', '2025-06-27 09:00:53', NULL, NULL),
(107, 27, 44, 'imposter', '2025-06-27 09:05:50', NULL, NULL),
(105, 25, 44, 'crewmate', '2025-06-27 09:00:51', NULL, NULL),
(106, 26, 44, 'crewmate', '2025-06-27 09:03:14', NULL, NULL),
(103, 24, 44, 'crewmate', '2025-06-27 09:05:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `status` enum('waiting','started','ended') DEFAULT 'waiting',
  `word` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `code`, `status`, `word`, `created_at`) VALUES
(44, '1CA94C', 'started', 'Scrubber', '2025-06-27 09:00:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `is_admin`, `created_at`, `ip_address`, `user_agent`, `last_login`) VALUES
(1, 'yuvi', 0, '2025-06-26 07:51:49', '103.214.63.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-26 21:37:56'),
(2, 'legend', 0, '2025-06-26 07:51:54', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 08:20:56'),
(3, 'if0_37825984', 0, '2025-06-26 07:51:59', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 07:51:59'),
(4, 'Sasta', 0, '2025-06-26 07:59:01', '103.214.63.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-26 09:03:06'),
(5, 'User1', 0, '2025-06-26 07:59:20', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 11:50:25'),
(6, 'Uv', 0, '2025-06-26 08:01:05', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 08:01:05'),
(7, 'Yashwant', 0, '2025-06-26 08:01:15', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 08:01:15'),
(8, 'sac', 0, '2025-06-26 08:11:36', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 08:11:36'),
(9, 'netoxif865@artgulin.com', 0, '2025-06-26 08:45:33', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-26 08:45:33'),
(10, 'Time test', 0, '2025-06-26 08:55:51', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-26 08:55:51'),
(11, 'AIT22BECS118', 0, '2025-06-26 09:01:09', '103.214.63.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-26 09:01:09'),
(12, 'User2', 0, '2025-06-26 11:49:05', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 11:49:05'),
(13, 'User3', 0, '2025-06-26 11:49:15', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 11:49:15'),
(14, 'User4', 0, '2025-06-26 11:49:21', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36 Edg/137.0.0.0', '2025-06-26 11:49:21'),
(15, 'XXX', 0, '2025-06-26 11:51:54', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 11:51:54'),
(16, 'Sinmin', 0, '2025-06-26 16:09:24', '103.214.63.141', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-26 16:09:24'),
(17, 'AHS22OPTO008', 0, '2025-06-26 16:10:32', '103.214.63.141', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-26 19:46:30'),
(18, 'if0_36981424', 0, '2025-06-26 18:30:52', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 18:30:52'),
(19, 'admin', 0, '2025-06-26 19:30:22', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 19:46:09'),
(20, 'yyuvi.official@gmail.com', 0, '2025-06-26 19:42:41', '103.214.63.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-26 19:42:41'),
(21, 'Swathi', 0, '2025-06-27 08:44:00', '1.7.4.17', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-27 08:44:00'),
(22, 'Kavyanjali', 0, '2025-06-27 08:44:01', '1.7.4.17', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_7_11 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/136.0.7103.56 Mobile/15E148 Safari/604.1', '2025-06-27 08:44:01'),
(23, 'Shruthi', 0, '2025-06-27 08:44:03', '1.7.4.17', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36', '2025-06-27 08:44:03'),
(24, 'sindu', 0, '2025-06-27 08:44:06', '1.7.4.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '2025-06-27 08:44:06'),
(25, 'Sandhya', 0, '2025-06-27 08:44:12', '223.186.81.183', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-27 08:44:12'),
(26, 'Deeksha', 0, '2025-06-27 08:44:17', '152.58.231.220', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-27 08:44:17'),
(27, 'Saloni', 0, '2025-06-27 08:44:32', '171.76.216.142', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.2 Mobile/15E148 Safari/604.1', '2025-06-27 08:44:32'),
(28, 'Mr khan', 0, '2025-06-27 08:50:27', '223.186.111.28', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-27 08:50:27'),
(29, 'Muzammil', 0, '2025-06-27 08:51:39', '223.186.111.28', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36', '2025-06-27 08:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE `words` (
  `id` int(11) NOT NULL,
  `word` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `word`, `created_at`) VALUES
(1, 'Apple', '2025-06-26 09:14:25'),
(2, 'Banana', '2025-06-26 09:14:25'),
(3, 'Orange', '2025-06-26 09:14:25'),
(4, 'Mango', '2025-06-26 09:14:25'),
(5, 'Pineapple', '2025-06-26 09:14:25'),
(6, 'Grapes', '2025-06-26 09:14:25'),
(7, 'Watermelon', '2025-06-26 09:14:25'),
(8, 'Carrot', '2025-06-26 09:14:25'),
(9, 'Potato', '2025-06-26 09:14:25'),
(10, 'Tomato', '2025-06-26 09:14:25'),
(11, 'Laptop', '2025-06-26 09:14:25'),
(12, 'Mobile', '2025-06-26 09:14:25'),
(13, 'Keyboard', '2025-06-26 09:14:25'),
(14, 'Mouse', '2025-06-26 09:14:25'),
(15, 'Speaker', '2025-06-26 09:14:25'),
(16, 'Television', '2025-06-26 09:14:25'),
(17, 'Fridge', '2025-06-26 09:14:25'),
(18, 'Washing Machine', '2025-06-26 09:14:25'),
(19, 'Microwave', '2025-06-26 09:14:25'),
(20, 'Fan', '2025-06-26 09:14:25'),
(21, 'Chair', '2025-06-26 09:14:25'),
(22, 'Table', '2025-06-26 09:14:25'),
(23, 'Sofa', '2025-06-26 09:14:25'),
(24, 'Bed', '2025-06-26 09:14:25'),
(25, 'Pillow', '2025-06-26 09:14:25'),
(26, 'Blanket', '2025-06-26 09:14:25'),
(27, 'Curtain', '2025-06-26 09:14:25'),
(28, 'Window', '2025-06-26 09:14:25'),
(29, 'Door', '2025-06-26 09:14:25'),
(30, 'Ceiling', '2025-06-26 09:14:25'),
(31, 'Wall', '2025-06-26 09:14:25'),
(32, 'Clock', '2025-06-26 09:14:25'),
(33, 'Calendar', '2025-06-26 09:14:25'),
(34, 'Pen', '2025-06-26 09:14:25'),
(35, 'Pencil', '2025-06-26 09:14:25'),
(36, 'Eraser', '2025-06-26 09:14:25'),
(37, 'Notebook', '2025-06-26 09:14:25'),
(38, 'Book', '2025-06-26 09:14:25'),
(39, 'Newspaper', '2025-06-26 09:14:25'),
(40, 'Magazine', '2025-06-26 09:14:25'),
(41, 'School', '2025-06-26 09:14:25'),
(42, 'College', '2025-06-26 09:14:25'),
(43, 'Library', '2025-06-26 09:14:25'),
(44, 'Hospital', '2025-06-26 09:14:25'),
(45, 'Police Station', '2025-06-26 09:14:25'),
(46, 'Restaurant', '2025-06-26 09:14:25'),
(47, 'Mall', '2025-06-26 09:14:25'),
(48, 'Cinema', '2025-06-26 09:14:25'),
(49, 'Park', '2025-06-26 09:14:25'),
(50, 'Zoo', '2025-06-26 09:14:25'),
(51, 'Beach', '2025-06-26 09:14:25'),
(52, 'Mountain', '2025-06-26 09:14:25'),
(53, 'River', '2025-06-26 09:14:25'),
(54, 'Ocean', '2025-06-26 09:14:25'),
(55, 'Lake', '2025-06-26 09:14:25'),
(56, 'Island', '2025-06-26 09:14:25'),
(57, 'Forest', '2025-06-26 09:14:25'),
(58, 'Desert', '2025-06-26 09:14:25'),
(59, 'Jungle', '2025-06-26 09:14:25'),
(60, 'Village', '2025-06-26 09:14:25'),
(61, 'City', '2025-06-26 09:14:25'),
(62, 'Town', '2025-06-26 09:14:25'),
(63, 'Country', '2025-06-26 09:14:25'),
(64, 'Continent', '2025-06-26 09:14:25'),
(65, 'Planet', '2025-06-26 09:14:25'),
(66, 'Sun', '2025-06-26 09:14:25'),
(67, 'Moon', '2025-06-26 09:14:25'),
(68, 'Star', '2025-06-26 09:14:25'),
(69, 'Cloud', '2025-06-26 09:14:25'),
(70, 'Rain', '2025-06-26 09:14:25'),
(71, 'Thunder', '2025-06-26 09:14:25'),
(72, 'Lightning', '2025-06-26 09:14:25'),
(73, 'Snow', '2025-06-26 09:14:25'),
(74, 'Wind', '2025-06-26 09:14:25'),
(75, 'Storm', '2025-06-26 09:14:25'),
(76, 'Tree', '2025-06-26 09:14:25'),
(77, 'Flower', '2025-06-26 09:14:25'),
(78, 'Grass', '2025-06-26 09:14:25'),
(79, 'Bush', '2025-06-26 09:14:25'),
(80, 'Leaf', '2025-06-26 09:14:25'),
(81, 'Root', '2025-06-26 09:14:25'),
(82, 'Stem', '2025-06-26 09:14:25'),
(83, 'Branch', '2025-06-26 09:14:25'),
(84, 'Fruit', '2025-06-26 09:14:25'),
(85, 'Seed', '2025-06-26 09:14:25'),
(86, 'Dog', '2025-06-26 09:14:25'),
(87, 'Cat', '2025-06-26 09:14:25'),
(88, 'Rabbit', '2025-06-26 09:14:25'),
(89, 'Cow', '2025-06-26 09:14:25'),
(90, 'Horse', '2025-06-26 09:14:25'),
(91, 'Sheep', '2025-06-26 09:14:25'),
(92, 'Goat', '2025-06-26 09:14:25'),
(93, 'Pig', '2025-06-26 09:14:25'),
(94, 'Lion', '2025-06-26 09:14:25'),
(95, 'Tiger', '2025-06-26 09:14:25'),
(96, 'Elephant', '2025-06-26 09:14:25'),
(97, 'Monkey', '2025-06-26 09:14:25'),
(98, 'Giraffe', '2025-06-26 09:14:25'),
(99, 'Zebra', '2025-06-26 09:14:25'),
(100, 'Bear', '2025-06-26 09:14:25'),
(101, 'Wolf', '2025-06-26 09:14:25'),
(102, 'Fox', '2025-06-26 09:14:25'),
(103, 'Kangaroo', '2025-06-26 09:14:25'),
(104, 'Panda', '2025-06-26 09:14:25'),
(105, 'Deer', '2025-06-26 09:14:25'),
(106, 'Bird', '2025-06-26 09:14:25'),
(107, 'Fish', '2025-06-26 09:14:25'),
(108, 'Snake', '2025-06-26 09:14:25'),
(109, 'Frog', '2025-06-26 09:14:25'),
(110, 'Turtle', '2025-06-26 09:14:25'),
(111, 'Shark', '2025-06-26 09:14:25'),
(112, 'Dolphin', '2025-06-26 09:14:25'),
(113, 'Whale', '2025-06-26 09:14:25'),
(114, 'Octopus', '2025-06-26 09:14:25'),
(115, 'Crab', '2025-06-26 09:14:25'),
(116, 'Spider', '2025-06-26 09:14:25'),
(117, 'Ant', '2025-06-26 09:14:25'),
(118, 'Bee', '2025-06-26 09:14:25'),
(119, 'Butterfly', '2025-06-26 09:14:25'),
(120, 'Mosquito', '2025-06-26 09:14:25'),
(121, 'Plane', '2025-06-26 09:14:25'),
(122, 'Train', '2025-06-26 09:14:25'),
(123, 'Bus', '2025-06-26 09:14:25'),
(124, 'Car', '2025-06-26 09:14:25'),
(125, 'Bike', '2025-06-26 09:14:25'),
(126, 'Bicycle', '2025-06-26 09:14:25'),
(127, 'Boat', '2025-06-26 09:14:25'),
(128, 'Ship', '2025-06-26 09:14:25'),
(129, 'Rocket', '2025-06-26 09:14:25'),
(130, 'Helicopter', '2025-06-26 09:14:25'),
(131, 'Ticket', '2025-06-26 09:14:25'),
(132, 'Passport', '2025-06-26 09:14:25'),
(133, 'Bag', '2025-06-26 09:14:25'),
(134, 'Wallet', '2025-06-26 09:14:25'),
(135, 'Shoe', '2025-06-26 09:14:25'),
(136, 'Socks', '2025-06-26 09:14:25'),
(137, 'Hat', '2025-06-26 09:14:25'),
(138, 'Cap', '2025-06-26 09:14:25'),
(139, 'Glasses', '2025-06-26 09:14:25'),
(140, 'Umbrella', '2025-06-26 09:14:25'),
(141, 'Mirror', '2025-06-26 09:14:25'),
(142, 'Comb', '2025-06-26 09:14:25'),
(143, 'Brush', '2025-06-26 09:14:25'),
(144, 'Soap', '2025-06-26 09:14:25'),
(145, 'Shampoo', '2025-06-26 09:14:25'),
(146, 'Toothpaste', '2025-06-26 09:14:25'),
(147, 'Toothbrush', '2025-06-26 09:14:25'),
(148, 'Towel', '2025-06-26 09:14:25'),
(149, 'Bucket', '2025-06-26 09:14:25'),
(150, 'Mug', '2025-06-26 09:14:25'),
(151, 'Bottle', '2025-06-26 09:14:25'),
(152, 'Glass', '2025-06-26 09:14:25'),
(153, 'Plate', '2025-06-26 09:14:25'),
(154, 'Spoon', '2025-06-26 09:14:25'),
(155, 'Fork', '2025-06-26 09:14:25'),
(156, 'Knife', '2025-06-26 09:14:25'),
(157, 'Pan', '2025-06-26 09:14:25'),
(158, 'Pot', '2025-06-26 09:14:25'),
(159, 'Stove', '2025-06-26 09:14:25'),
(160, 'Gas', '2025-06-26 09:14:25'),
(161, 'Fire', '2025-06-26 09:14:25'),
(162, 'Smoke', '2025-06-26 09:14:25'),
(163, 'Ash', '2025-06-26 09:14:25'),
(164, 'Coal', '2025-06-26 09:14:25'),
(165, 'Wood', '2025-06-26 09:14:25'),
(166, 'Plastic', '2025-06-26 09:14:25'),
(167, 'Paper', '2025-06-26 09:14:25'),
(168, 'Metal', '2025-06-26 09:14:25'),
(169, 'Iron', '2025-06-26 09:14:25'),
(170, 'Gold', '2025-06-26 09:14:25'),
(171, 'Silver', '2025-06-26 09:14:25'),
(172, 'Diamond', '2025-06-26 09:14:25'),
(173, 'Ring', '2025-06-26 09:14:25'),
(174, 'Chain', '2025-06-26 09:14:25'),
(175, 'Watch', '2025-06-26 09:14:25'),
(176, 'Camera', '2025-06-26 09:14:25'),
(177, 'Phone', '2025-06-26 09:14:25'),
(178, 'Remote', '2025-06-26 09:14:25'),
(179, 'Light', '2025-06-26 09:14:25'),
(180, 'Bulb', '2025-06-26 09:14:25'),
(181, 'Tube', '2025-06-26 09:14:25'),
(182, 'Switch', '2025-06-26 09:14:25'),
(183, 'Socket', '2025-06-26 09:14:25'),
(184, 'Battery', '2025-06-26 09:14:25'),
(185, 'Wire', '2025-06-26 09:14:25'),
(186, 'Cable', '2025-06-26 09:14:25'),
(187, 'Adapter', '2025-06-26 09:14:25'),
(188, 'Code', '2025-06-26 09:14:25'),
(189, 'Bug', '2025-06-26 09:14:25'),
(190, 'Robot', '2025-06-26 09:14:25'),
(191, 'Server', '2025-06-26 09:14:25'),
(192, 'Website', '2025-06-26 09:14:25'),
(193, 'Game', '2025-06-26 09:14:25'),
(194, 'Password', '2025-06-26 09:14:25'),
(195, 'File', '2025-06-26 09:14:25'),
(196, 'Folder', '2025-06-26 09:14:25'),
(197, 'Disk', '2025-06-26 09:14:25'),
(198, 'Email', '2025-06-26 09:14:25'),
(199, 'Chat', '2025-06-26 09:14:25'),
(200, 'Call', '2025-06-26 09:14:25'),
(201, 'Video', '2025-06-26 09:14:25'),
(202, 'Message', '2025-06-26 09:14:25'),
(203, 'Username', '2025-06-26 09:14:25'),
(204, 'Profile', '2025-06-26 09:14:25'),
(205, 'Photo', '2025-06-26 09:14:25'),
(206, 'Screenshot', '2025-06-26 09:14:25'),
(207, 'Settings', '2025-06-26 09:14:25'),
(208, 'Network', '2025-06-26 09:14:25'),
(209, 'Signal', '2025-06-26 09:14:25'),
(210, 'Data', '2025-06-26 09:14:25'),
(211, 'WiFi', '2025-06-26 09:14:25'),
(212, 'Internet', '2025-06-26 09:14:25'),
(213, 'Bluetooth', '2025-06-26 09:14:25'),
(214, 'Download', '2025-06-26 09:14:25'),
(215, 'Upload', '2025-06-26 09:14:25'),
(216, 'Drive', '2025-06-26 09:14:25'),
(217, 'Engine', '2025-06-26 09:14:25'),
(218, 'Battery Pack', '2025-06-26 09:14:25'),
(219, 'Locket', '2025-06-26 09:14:25'),
(220, 'Map', '2025-06-26 09:14:25'),
(221, 'Tunnel', '2025-06-26 09:14:25'),
(222, 'Ladder', '2025-06-26 09:14:25'),
(223, 'Ball', '2025-06-26 09:14:25'),
(224, 'Drum', '2025-06-26 09:14:25'),
(225, 'Paint', '2025-06-26 09:14:25'),
(226, 'Needle', '2025-06-26 09:14:25'),
(227, 'Candle', '2025-06-26 09:14:25'),
(228, 'Cushion', '2025-06-26 09:14:25'),
(229, 'Fence', '2025-06-26 09:14:25'),
(230, 'Ink', '2025-06-26 09:14:25'),
(231, 'Rope', '2025-06-26 09:14:25'),
(232, 'Anchor', '2025-06-26 09:14:25'),
(233, 'Cactus', '2025-06-26 09:14:25'),
(234, 'Lantern', '2025-06-26 09:14:25'),
(235, 'Shadow', '2025-06-26 09:14:25'),
(236, 'Nest', '2025-06-26 09:14:25'),
(237, 'Pebble', '2025-06-26 09:14:25'),
(238, 'Scarf', '2025-06-26 09:14:25'),
(239, 'Helmet Case', '2025-06-26 09:14:25'),
(240, 'Glove', '2025-06-26 09:14:25'),
(241, 'Treasure', '2025-06-26 09:19:28'),
(242, 'Invisible', '2025-06-26 09:19:28'),
(243, 'Magnet', '2025-06-26 09:19:28'),
(244, 'Broomstick', '2025-06-26 09:19:28'),
(245, 'Trophy', '2025-06-26 09:19:28'),
(246, 'Puzzle', '2025-06-26 09:19:28'),
(247, 'Shadowbox', '2025-06-26 09:19:28'),
(248, 'Jacket', '2025-06-26 09:19:28'),
(249, 'Notebook Stand', '2025-06-26 09:19:28'),
(250, 'Fingerprint', '2025-06-26 09:19:28'),
(251, 'Cave', '2025-06-26 09:19:28'),
(252, 'Spaceship', '2025-06-26 09:19:28'),
(253, 'Alien', '2025-06-26 09:19:28'),
(254, 'Knight', '2025-06-26 09:19:28'),
(255, 'Castle', '2025-06-26 09:19:28'),
(256, 'Pirate', '2025-06-26 09:19:28'),
(257, 'Submarine', '2025-06-26 09:19:28'),
(258, 'Balloon', '2025-06-26 09:19:28'),
(259, 'Pyramid', '2025-06-26 09:19:28'),
(260, 'Laser', '2025-06-26 09:19:28'),
(261, 'Robot Arm', '2025-06-26 09:19:28'),
(262, 'Joystick', '2025-06-26 09:19:28'),
(263, 'Sandal', '2025-06-26 09:19:28'),
(264, 'Shell', '2025-06-26 09:19:28'),
(265, 'Candy', '2025-06-26 09:19:28'),
(266, 'Drill', '2025-06-26 09:19:28'),
(267, 'Flashlight', '2025-06-26 09:19:28'),
(269, 'Hoverboard', '2025-06-26 09:19:28'),
(270, 'Jeans', '2025-06-26 09:19:28'),
(271, 'Marble', '2025-06-26 09:19:28'),
(272, 'Telescope', '2025-06-26 09:19:28'),
(273, 'Binoculars', '2025-06-26 09:19:28'),
(274, 'Thermometer', '2025-06-26 09:19:28'),
(275, 'Chainsaw', '2025-06-26 09:19:28'),
(276, 'Battery Charger', '2025-06-26 09:19:28'),
(277, 'Backpack', '2025-06-26 09:19:28'),
(278, 'Sandcastle', '2025-06-26 09:19:28'),
(279, 'Sticker', '2025-06-26 09:19:28'),
(280, 'Whistle', '2025-06-26 09:19:28'),
(281, 'Boomerang', '2025-06-26 09:19:28'),
(282, 'Compass', '2025-06-26 09:19:28'),
(283, 'Slipper', '2025-06-26 09:19:28'),
(284, 'Kite', '2025-06-26 09:19:28'),
(285, 'Glider', '2025-06-26 09:19:28'),
(286, 'Mirror Ball', '2025-06-26 09:19:28'),
(287, 'Chocolate', '2025-06-26 09:19:28'),
(288, 'Pillowcase', '2025-06-26 09:19:28'),
(289, 'Hairdryer', '2025-06-26 09:19:28'),
(290, 'Puzzle Piece', '2025-06-26 09:19:28'),
(291, 'Slinky', '2025-06-26 09:19:28'),
(292, 'Firecracker', '2025-06-26 09:19:28'),
(293, 'Confetti', '2025-06-26 09:19:28'),
(294, 'Ribbon', '2025-06-26 09:19:28'),
(295, 'Tissue', '2025-06-26 09:19:28'),
(296, 'Toothpick', '2025-06-26 09:19:28'),
(297, 'Thread', '2025-06-26 09:19:28'),
(298, 'Button', '2025-06-26 09:19:28'),
(299, 'Coin', '2025-06-26 09:19:28'),
(300, 'Dice', '2025-06-26 09:19:28'),
(301, 'Stapler', '2025-06-26 09:19:28'),
(302, 'Highlighter', '2025-06-26 09:19:28'),
(303, 'Marker', '2025-06-26 09:19:28'),
(304, 'Clipboard', '2025-06-26 09:19:28'),
(305, 'Cork', '2025-06-26 09:19:28'),
(306, 'Skateboard', '2025-06-26 09:19:28'),
(307, 'Trophy Case', '2025-06-26 09:19:28'),
(308, 'Whiteboard', '2025-06-26 09:19:28'),
(309, 'Sketchbook', '2025-06-26 09:19:28'),
(310, 'Zipper', '2025-06-26 09:19:28'),
(311, 'Tent', '2025-06-26 09:19:28'),
(312, 'Sleeping Bag', '2025-06-26 09:19:28'),
(313, 'Campfire', '2025-06-26 09:19:28'),
(314, 'Raincoat', '2025-06-26 09:19:28'),
(315, 'Water Bottle', '2025-06-26 09:19:28'),
(316, 'Keychain', '2025-06-26 09:19:28'),
(317, 'Eyeglasses', '2025-06-26 09:19:28'),
(318, 'Hairband', '2025-06-26 09:19:28'),
(319, 'Bracelet', '2025-06-26 09:19:28'),
(320, 'Locket Chain', '2025-06-26 09:19:28'),
(321, 'Paintbrush', '2025-06-26 09:19:28'),
(322, 'Palette', '2025-06-26 09:19:28'),
(324, 'Helmet Strap', '2025-06-26 09:19:28'),
(326, 'Trampoline', '2025-06-26 09:19:28'),
(327, 'Swing', '2025-06-26 09:19:28'),
(328, 'Seesaw', '2025-06-26 09:19:28'),
(329, 'Slide', '2025-06-26 09:19:28'),
(330, 'Sandbox', '2025-06-26 09:19:28'),
(331, 'Whistle Lanyard', '2025-06-26 09:19:28'),
(332, 'Snowman', '2025-06-26 09:19:28'),
(333, 'Icicle', '2025-06-26 09:19:28'),
(334, 'Skis', '2025-06-26 09:19:28'),
(335, 'Snowboard', '2025-06-26 09:19:28'),
(336, 'Igloo', '2025-06-26 09:19:28'),
(337, 'Yeti', '2025-06-26 09:19:28'),
(338, 'Firewood', '2025-06-26 09:19:28'),
(339, 'Barbecue', '2025-06-26 09:19:28'),
(340, 'Picnic Mat', '2025-06-26 09:19:28'),
(341, 'Thermos', '2025-06-26 09:19:28'),
(342, 'Cooler', '2025-06-26 09:19:28'),
(343, 'Bin', '2025-06-26 09:19:28'),
(344, 'Dustbin', '2025-06-26 09:19:28'),
(345, 'Trash Bag', '2025-06-26 09:19:28'),
(346, 'Mop', '2025-06-26 09:19:28'),
(347, 'Broom', '2025-06-26 09:19:28'),
(348, 'Scrubber', '2025-06-26 09:19:28'),
(349, 'Shovel', '2025-06-26 09:19:28'),
(350, 'Hose', '2025-06-26 09:19:28'),
(351, 'Lawnmower', '2025-06-26 09:19:28'),
(352, 'Wrench', '2025-06-26 09:19:28'),
(353, 'Spanner', '2025-06-26 09:19:28'),
(354, 'Hammer', '2025-06-26 09:19:28'),
(355, 'Saw', '2025-06-26 09:19:28'),
(356, 'Nail', '2025-06-26 09:19:28'),
(357, 'Screwdriver', '2025-06-26 09:19:28'),
(358, 'Toolbox', '2025-06-26 09:19:28'),
(359, 'Paint Can', '2025-06-26 09:19:28'),
(361, 'Extension Cord', '2025-06-26 09:19:28'),
(362, 'Router', '2025-06-26 09:19:28'),
(363, 'Modem', '2025-06-26 09:19:28'),
(364, 'Printer', '2025-06-26 09:19:28'),
(365, 'Scanner', '2025-06-26 09:19:28'),
(366, 'Paper Clip', '2025-06-26 09:19:28'),
(367, 'Notebook Cover', '2025-06-26 09:19:28'),
(368, 'File Folder', '2025-06-26 09:19:28'),
(370, 'Tape Dispenser', '2025-06-26 09:19:28'),
(371, 'Sticky Note', '2025-06-26 09:19:28'),
(372, 'Hole Punch', '2025-06-26 09:19:28'),
(373, 'Desk Lamp', '2025-06-26 09:19:28'),
(374, 'Fan Remote', '2025-06-26 09:19:28'),
(375, 'Curtain Rod', '2025-06-26 09:19:28'),
(376, 'Wall Clock', '2025-06-26 09:19:28'),
(377, 'Photo Frame', '2025-06-26 09:19:28'),
(378, 'Door Mat', '2025-06-26 09:19:28'),
(379, 'Wall Hanger', '2025-06-26 09:19:28'),
(380, 'Mirror Stand', '2025-06-26 09:19:28'),
(381, 'Trophy Shelf', '2025-06-26 09:19:28'),
(382, 'Hat Stand', '2025-06-26 09:19:28'),
(383, 'Coat Rack', '2025-06-26 09:19:28'),
(384, 'Shoehorn', '2025-06-26 09:19:28'),
(385, 'Shoe Polish', '2025-06-26 09:19:28'),
(386, 'Laundry Basket', '2025-06-26 09:19:28'),
(388, 'Drying Rack', '2025-06-26 09:19:28'),
(389, 'Ironing Board', '2025-06-26 09:19:28'),
(390, 'Iron Box', '2025-06-26 09:19:28'),
(391, 'Sewing Machine', '2025-06-26 09:19:28'),
(392, 'Thread Spool', '2025-06-26 09:19:28'),
(393, 'Measuring Tape', '2025-06-26 09:19:28'),
(394, 'Thimble', '2025-06-26 09:19:28'),
(395, 'Fabric Roll', '2025-06-26 09:19:28'),
(396, 'Yarn', '2025-06-26 09:19:28'),
(397, 'Crochet Hook', '2025-06-26 09:19:28'),
(398, 'Knitting Needle', '2025-06-26 09:19:28'),
(400, 'Pattern Paper', '2025-06-26 09:19:28'),
(401, 'Laptop Stand', '2025-06-26 09:19:28'),
(402, 'Mouse Pad', '2025-06-26 09:19:28'),
(403, 'USB Drive', '2025-06-26 09:19:28'),
(404, 'SD Card', '2025-06-26 09:19:28'),
(405, 'External Disk', '2025-06-26 09:19:28'),
(406, 'Power Bank', '2025-06-26 09:19:28'),
(407, 'Earphones', '2025-06-26 09:19:28'),
(408, 'Tripod', '2025-06-26 09:19:28'),
(409, 'Mic Stand', '2025-06-26 09:19:28'),
(410, 'Webcam', '2025-06-26 09:19:28'),
(411, 'Lens Cap', '2025-06-26 09:19:28'),
(412, 'Camera Bag', '2025-06-26 09:19:28'),
(413, 'Flash Mount', '2025-06-26 09:19:28'),
(414, 'Gimbal', '2025-06-26 09:19:28'),
(415, 'Video Light', '2025-06-26 09:19:28'),
(416, 'Streaming Box', '2025-06-26 09:19:28'),
(417, 'HDMI Cable', '2025-06-26 09:19:28'),
(418, 'VGA Cable', '2025-06-26 09:19:28'),
(419, 'Power Cord', '2025-06-26 09:19:28'),
(420, 'Ethernet Cable', '2025-06-26 09:19:28'),
(421, 'SIM Card', '2025-06-26 09:19:28'),
(422, 'SIM Ejector', '2025-06-26 09:19:28'),
(423, 'Phone Case', '2025-06-26 09:19:28'),
(424, 'Screen Guard', '2025-06-26 09:19:28'),
(425, 'Charging Dock', '2025-06-26 09:19:28'),
(426, 'Smartwatch', '2025-06-26 09:19:28'),
(427, 'Fitness Band', '2025-06-26 09:19:28'),
(428, 'Bluetooth Speaker', '2025-06-26 09:19:28'),
(429, 'Smart Bulb', '2025-06-26 09:19:28'),
(430, 'WiFi Extender', '2025-06-26 09:19:28'),
(431, 'Game Controller', '2025-06-26 09:19:28'),
(432, 'VR Headset', '2025-06-26 09:19:28'),
(433, 'Game Disc', '2025-06-26 09:19:28'),
(434, 'Gamepad', '2025-06-26 09:19:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `game_status`
--
ALTER TABLE `game_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `word` (`word`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `game_status`
--
ALTER TABLE `game_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=436;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
