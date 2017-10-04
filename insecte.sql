-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 04, 2017 at 10:24 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insecte`
--

-- --------------------------------------------------------

--
-- Table structure for table `fos_user`
--

CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) DEFAULT NULL,
  `family` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `age`, `family`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(4, 'ntie', 3, 'hhhhh', 'ntie', 'ntie_reddy2@yahoo.fr', 'ntie_reddy2@yahoo.fr', 1, 'hmwyq2s99qo8kggk08o8wksg4wg0c88', '$2y$13$hmwyq2s99qo8kggk08o8weTk.tcmqRVEIV2gDf/rom2rF3dXEjrJG', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(5, 'nti', NULL, NULL, 'nti', 'nr@yahoo.fr', 'nr@yahoo.fr', 1, '5higsye7144k48cgg8scskwckw4w8ss', '$2y$13$5higsye7144k48cgg8scse.zsoIbZWDx58vyREBULH4TroMtz2p6S', '2017-10-03 18:45:50', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(6, 'user1', 5, 'Famille', 'user1', 'test@mail.com', 'test@mail.com', 1, 'tplxqeq7h2ooc8ccwkwgs0cg0c84s4s', '$2y$13$tplxqeq7h2ooc8ccwkwgsubqQXaHffyhaXJIgfW.XRQxgYa7HmM76', '2017-10-04 08:50:55', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(7, 'user2', 2, 'Larve', 'user2', 'user2@test.fr', 'user2@test.fr', 1, '9gz4dc2o3ww8kg0ock4ko0wkgoogko', '$2y$13$9gz4dc2o3ww8kg0ock4kouyl0ZwBnp/xThmHCPXSqljAlzG6Antfi', '2017-10-04 09:29:58', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL),
(8, 'fourmi', 1, 'fourmi', 'fourmi', 'fourmi@yahoo.fr', 'fourmi@yahoo.fr', 1, 'kj8q191jakg4ww8g0scggkk84g0ogso', '$2y$13$kj8q191jakg4ww8g0scgge5cS04o3Uci7qhvbi1RKC4HFHeMoIOoO', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`user_id`, `friend_user_id`) VALUES
(6, 4),
(7, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fos_user`
--
ALTER TABLE `fos_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`user_id`,`friend_user_id`),
  ADD KEY `IDX_21EE7069A76ED395` (`user_id`),
  ADD KEY `IDX_21EE706993D1119E` (`friend_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fos_user`
--
ALTER TABLE `fos_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `FK_21EE706993D1119E` FOREIGN KEY (`friend_user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_21EE7069A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
