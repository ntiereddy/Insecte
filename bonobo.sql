-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 22 Janvier 2017 à 18:14
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bonobo`
--

-- --------------------------------------------------------

--
-- Structure de la table `fos_user`
--

CREATE TABLE IF NOT EXISTS `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
  `credentials_expire_at` datetime DEFAULT NULL,
  `age` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `family` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `race` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `food` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Contenu de la table `fos_user`
--

INSERT INTO `fos_user` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `age`, `family`, `race`, `food`) VALUES
(1, 'Bonobo1', 'bonobo1', 'email@gmail.com', 'email@gmail.com', 1, '5bvdpu2qulgk48osoc0ckscggcso00s', '$2y$13$5bvdpu2qulgk48osoc0ckeex/eoHg5k8IQbjZDgdZBOELZC8WDi1O', '2017-01-22 16:17:33', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '6', 'Famille ?', 'Gorilla', 'Vegetable'),
(2, 'Bonobo2', 'bonobo2', 'email2@gmail.com', 'email2@gmail.com', 1, 'pc2r2tt8a680o0okwc8kw8wgggcgkkg', '$2y$13$pc2r2tt8a680o0okwc8kwu13JTLtHTl51dRuR4Or425ow9JAdHCne', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '8', 'Famille', 'Race', 'Sweets'),
(3, 'Bonobo3', 'bonobo3', 'email3@gmail.com', 'email3@gmail.com', 1, 'njqzyhzk7tc8040wwkgwwcwkogc48o0', '$2y$13$njqzyhzk7tc8040wwkgwwOad7qrBhlmBmUOWnsSYNahWmjXQ.tZ6.', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '3', 'Famille', 'Race', 'Un peut de tout');

-- --------------------------------------------------------

--
-- Structure de la table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`friend_user_id`),
  KEY `IDX_21EE7069A76ED395` (`user_id`),
  KEY `IDX_21EE706993D1119E` (`friend_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `friends`
--

INSERT INTO `friends` (`user_id`, `friend_user_id`) VALUES
(1, 2),
(1, 3);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `FK_21EE706993D1119E` FOREIGN KEY (`friend_user_id`) REFERENCES `fos_user` (`id`),
  ADD CONSTRAINT `FK_21EE7069A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
