-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2024 at 09:07 PM
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
-- Database: `be21_cr6_bigevents_ramyelshorafa`
--
CREATE DATABASE IF NOT EXISTS `be21_cr6_bigevents_ramyelshorafa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be21_cr6_bigevents_ramyelshorafa`;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date_time` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `date_time`, `description`, `picture`, `capacity`, `contact_email`, `contact_number`, `address`, `url`, `type`) VALUES
(11, 'Concert Night', '2024-05-01 19:00:00', 'Enjoy a night of live music and entertainment!', 'music.jpg', 200, 'info@example.com', '1234567890', '123 Main St, Anytown, 12345', 'http://example.com/concert-night', 'music'),
(14, 'Theater Play', '2024-05-04 20:00:00', 'Experience the magic of live theater!', 'theater.jpg', 300, 'tickets@example.com', '7894561230', '101 Maple St, Anytown, 45678', 'http://example.com/theater-play', 'theater'),
(15, 'Art Exhibition', '2024-05-05 10:00:00', 'Explore stunning artworks by local artists!', 'picture.jpg', 100, 'info@example.com', '123456789', '202 Pine St, Anytown, 56789', 'http://example.com/art-exhibition', 'art'),
(16, 'Fitness Workshop', '2024-05-06 09:00:00', 'Get fit and healthy with expert trainers!', 'sport.jpg', 50, 'fitness@example.com', '9876543210', '303 Oak St, Anytown, 67890', 'http://example.com/fitness-workshop', 'sport'),
(17, 'Cooking Class', '2024-05-07 14:00:00', 'Learn to cook delicious meals from professional chefs!', 'picture.jpg', 80, 'chef@example.com', '1234567890', '404 Cedar St, Anytown, 78901', 'http://example.com/cooking-class', 'cooking'),
(18, 'Photography Exhibition', '2024-05-08 11:00:00', 'Discover breathtaking photos by talented photographers!', 'picture.jpg', 120, 'photography@example.com', '7890123456', '505 Birch St, Anytown, 89012', 'http://example.com/photography-exhibition', 'photography'),
(19, 'Tech Conference', '2024-05-09 08:30:00', 'Explore the latest trends in technology and innovation!', 'picture.jpg', 300, 'tech@example.com', '2345678901', '606 Oak St, Anytown, 90123', 'http://example.com/tech-conference', 'technology'),
(27, 'house music party', '1111-11-11 11:11:00', 'dj gutte play', 'music.jpg', 1500, 'ramy_shorafa@hotmail.com', '6607804540', 'Tanbruckgasse 29', NULL, 'music'),
(28, 'Theater Play 1', '2024-05-04 20:00:00', 'Experience the magic of live theater!', 'theater.jpg', 300, 'tickets1@example.com', '7894561230', '101 Maple St, Anytown, 45678', 'http://example.com/theater-play1', 'theater'),
(29, 'Music Concert 1', '2024-05-10 18:00:00', 'Enjoy live music performances!', 'music.jpg', 200, 'tickets2@example.com', '9876543210', '202 Oak St, Anytown, 45678', 'http://example.com/music-concert1', 'music'),
(30, 'Art Exhibition 1', '2024-05-15 12:00:00', 'Explore stunning artworks!', 'picture.jpg', 150, 'tickets3@example.com', '1234567890', '303 Elm St, Anytown, 45678', 'http://example.com/art-exhibition1', 'art');

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
