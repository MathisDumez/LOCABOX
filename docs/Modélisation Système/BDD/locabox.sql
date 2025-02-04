-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 04 fév. 2025 à 11:48
-- Version du serveur :  10.4.13-MariaDB
-- Version de PHP : 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `locabox`
--

-- --------------------------------------------------------

--
-- Structure de la table `access_log`
--

CREATE TABLE `access_log` (
  `access_date` datetime NOT NULL DEFAULT current_timestamp(),
  `locked` tinyint(1) NOT NULL,
  `id_box` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `access_log`
--

INSERT INTO `access_log` (`access_date`, `locked`, `id_box`) VALUES
('2025-02-04 11:43:08', 0, 1),
('2025-02-04 11:43:22', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `alarm_log`
--

CREATE TABLE `alarm_log` (
  `alarm_date` datetime NOT NULL DEFAULT current_timestamp(),
  `info` varchar(150) DEFAULT NULL,
  `id_box` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `alarm_log`
--

INSERT INTO `alarm_log` (`alarm_date`, `info`, `id_box`) VALUES
('2025-02-04 11:41:32', 'test', 1);

-- --------------------------------------------------------

--
-- Structure de la table `box`
--

CREATE TABLE `box` (
  `id_box` int(11) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `current_code` varchar(6) NOT NULL,
  `generated_code` varchar(6) NOT NULL,
  `id_warehouse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `box`
--

INSERT INTO `box` (`id_box`, `num`, `size`, `available`, `current_code`, `generated_code`, `id_warehouse`) VALUES
(1, 1, 40, 1, '123456', '000000', 1),
(2, 2, 7, 1, '123456', '000000', 2),
(3, 3, 40, 0, '123456', '000000', 3),
(4, 4, 7, 0, '123456', '000000', 4);

-- --------------------------------------------------------

--
-- Structure de la table `code_log`
--

CREATE TABLE `code_log` (
  `code_date` datetime NOT NULL DEFAULT current_timestamp(),
  `code` varchar(6) DEFAULT NULL,
  `id_box` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `code_log`
--

INSERT INTO `code_log` (`code_date`, `code`, `id_box`) VALUES
('2025-02-04 11:39:42', '123456', 1),
('2025-02-04 11:40:04', '000000', 1);

-- --------------------------------------------------------

--
-- Structure de la table `rent`
--

CREATE TABLE `rent` (
  `id_user_box` int(11) NOT NULL,
  `id_box` int(11) NOT NULL,
  `rent_number` int(11) NOT NULL,
  `start_reservation_date` datetime NOT NULL,
  `end_reservation_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `rent`
--

INSERT INTO `rent` (`id_user_box`, `id_box`, `rent_number`, `start_reservation_date`, `end_reservation_date`) VALUES
(2, 3, 1, '2025-02-04 12:00:00', '2026-02-05 11:00:00'),
(2, 4, 2, '2025-02-07 15:00:00', '2026-06-08 14:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `user_box`
--

CREATE TABLE `user_box` (
  `id_user_box` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user_box`
--

INSERT INTO `user_box` (`id_user_box`, `email`, `password`, `admin`, `level`) VALUES
(1, 'admin@locabox.fr', 'admin1234', 1, 1),
(2, 'test@locabox.fr', 'test1234', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `warehouse`
--

CREATE TABLE `warehouse` (
  `id_warehouse` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `warehouse`
--

INSERT INTO `warehouse` (`id_warehouse`, `name`, `address`) VALUES
(1, 'Bâtiment A', '4 Ty Névez, 29270 Plounévézel'),
(2, 'Bâtiment B', '4 Ty Névez, 29270 Plounévézel'),
(3, 'Bâtiment C', '4 Ty Névez, 29270 Plounévézel'),
(4, 'Bâtiment D', '4 Ty Névez, 29270 Plounévézel');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `access_log`
--
ALTER TABLE `access_log`
  ADD PRIMARY KEY (`access_date`),
  ADD KEY `id_box` (`id_box`);

--
-- Index pour la table `alarm_log`
--
ALTER TABLE `alarm_log`
  ADD PRIMARY KEY (`alarm_date`),
  ADD KEY `id_box` (`id_box`);

--
-- Index pour la table `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`id_box`),
  ADD KEY `id_warehouse` (`id_warehouse`);

--
-- Index pour la table `code_log`
--
ALTER TABLE `code_log`
  ADD PRIMARY KEY (`code_date`),
  ADD KEY `id_box` (`id_box`);

--
-- Index pour la table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`id_user_box`,`id_box`),
  ADD UNIQUE KEY `rent_number` (`rent_number`),
  ADD KEY `id_box` (`id_box`);

--
-- Index pour la table `user_box`
--
ALTER TABLE `user_box`
  ADD PRIMARY KEY (`id_user_box`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id_warehouse`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `box`
--
ALTER TABLE `box`
  MODIFY `id_box` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `rent`
--
ALTER TABLE `rent`
  MODIFY `rent_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_box`
--
ALTER TABLE `user_box`
  MODIFY `id_user_box` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id_warehouse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `access_log`
--
ALTER TABLE `access_log`
  ADD CONSTRAINT `access_log_ibfk_1` FOREIGN KEY (`id_box`) REFERENCES `box` (`id_box`);

--
-- Contraintes pour la table `alarm_log`
--
ALTER TABLE `alarm_log`
  ADD CONSTRAINT `alarm_log_ibfk_1` FOREIGN KEY (`id_box`) REFERENCES `box` (`id_box`);

--
-- Contraintes pour la table `box`
--
ALTER TABLE `box`
  ADD CONSTRAINT `box_ibfk_1` FOREIGN KEY (`id_warehouse`) REFERENCES `warehouse` (`id_warehouse`);

--
-- Contraintes pour la table `code_log`
--
ALTER TABLE `code_log`
  ADD CONSTRAINT `code_log_ibfk_1` FOREIGN KEY (`id_box`) REFERENCES `box` (`id_box`);

--
-- Contraintes pour la table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`id_user_box`) REFERENCES `user_box` (`id_user_box`),
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`id_box`) REFERENCES `box` (`id_box`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
