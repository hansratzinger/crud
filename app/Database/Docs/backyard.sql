-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 23. Okt 2020 um 11:42
-- Server-Version: 10.3.23-MariaDB-0+deb10u1
-- PHP-Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `backyard`
--
CREATE DATABASE IF NOT EXISTS `backyard` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `backyard`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clients`
--
-- Erstellt am: 23. Okt 2020 um 06:05
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `cli_id` int(11) NOT NULL,
  `cli_last_name` varchar(32) NOT NULL,
  `cli_first_name` varchar(32) NOT NULL,
  `cli_academic_degree` varchar(16) NOT NULL,
  `cli_email` varchar(64) NOT NULL,
  `cli_phone` varchar(32) NOT NULL,
  `cli_street` varchar(32) NOT NULL,
  `cli_house_number` varchar(16) NOT NULL,
  `cli_block` varchar(16) NOT NULL,
  `cli_door_number` varchar(16) NOT NULL,
  `cli_zip` varchar(8) NOT NULL,
  `cli_town` varchar(32) NOT NULL,
  `cli_created_at` datetime NOT NULL,
  `cli_updated_at` datetime NOT NULL,
  `cli_deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='cli';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `estates`
--
-- Erstellt am: 23. Okt 2020 um 09:39
--

DROP TABLE IF EXISTS `estates`;
CREATE TABLE `estates` (
  `est_id` int(11) NOT NULL,
  `est_name` varchar(64) NOT NULL,
  `est_street` varchar(32) NOT NULL,
  `est_house_number` varchar(8) NOT NULL,
  `est_block` varchar(8) NOT NULL,
  `est_door_number` varchar(8) NOT NULL,
  `est_zip` varchar(8) NOT NULL,
  `est_town` varchar(64) NOT NULL,
  `est_description` text NOT NULL COMMENT 'Objektbeschreibung',
  `est_status` enum('angelegt','online','erfolgreich vermittelt','geschlossen') NOT NULL,
  `est_type` enum('Wohnung','Haus','Gewerbeobjekt','Grundstück') NOT NULL,
  `est_contract_type` enum('Verkauf','Miete','','') NOT NULL,
  `est_rooms` varchar(16) NOT NULL COMMENT 'Anzahl Zimmer',
  `est_expanse` varchar(16) NOT NULL COMMENT 'Fläche m2',
  `est_floor` varchar(7) NOT NULL,
  `est_available` varchar(32) NOT NULL COMMENT 'sofort oder Datum',
  `est_building_type` enum('Altbau','Neubau') NOT NULL,
  `est_condition` enum('neuwertig','renoviert','sanierungsbedürftig','') NOT NULL,
  `est_price` varchar(16) NOT NULL COMMENT 'Preis für Verkauf oder Miete',
  `est_costs` varchar(16) NOT NULL COMMENT 'Nebenkosten oder Kaution',
  `est_brokerage` varchar(16) NOT NULL COMMENT 'Maklerprovision',
  `est_heating` enum('Gastherme','Hauszentralheizung','Fernwärme','keine') NOT NULL,
  `est_energy_class` enum('A','B','C','D','E') NOT NULL COMMENT 'Energieausweis',
  `est_energy_hwb` varchar(7) NOT NULL,
  `est_information` text NOT NULL COMMENT 'zusätzliche Informationen',
  `est_willhaben_title` varchar(255) NOT NULL,
  `est_url_willhaben` varchar(255) NOT NULL,
  `est_url_website` varchar(255) NOT NULL,
  `est_url_googlemaps` text NOT NULL,
  `est_url_matterport` varchar(255) NOT NULL,
  `est_created_at` datetime NOT NULL,
  `est_updated_at` datetime NOT NULL,
  `est_deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='real estate ';

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--
-- Erstellt am: 11. Okt 2020 um 18:35
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_last_name` varchar(32) NOT NULL,
  `user_first_name` varchar(32) NOT NULL,
  `user_academic_degree` varchar(32) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_email` varchar(64) NOT NULL,
  `user_phone` varchar(32) NOT NULL,
  `user_created_at` datetime NOT NULL,
  `user_updated_at` datetime NOT NULL,
  `user_deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`user_id`, `user_last_name`, `user_first_name`, `user_academic_degree`, `user_password`, `user_email`, `user_phone`, `user_created_at`, `user_updated_at`, `user_deleted_at`) VALUES
(20, 'Ratzinger', 'Hans', '', '$2y$10$G8K7BxtpiWz0rY0xrciV0Ox5lt08noTI5oHF1Yz05AyOmKC8mTr0u', 'hans@ratzinger.com', '067687837602', '2020-10-13 13:50:05', '2020-10-13 16:35:26', '0000-00-00 00:00:00'),
(21, 'Ratzinger', 'Ilse', 'Magister', '$2y$10$adGTQPKi9TOK7PefB1ox6eUntz4GhJRaaHjDRCXssreaDp2sPcdpO', 'ratzinger@ijp.at', '067687837688', '2020-10-13 17:16:38', '2020-10-13 17:52:00', '0000-00-00 00:00:00');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indizes für die Tabelle `estates`
--
ALTER TABLE `estates`
  ADD PRIMARY KEY (`est_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `clients`
--
ALTER TABLE `clients`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `estates`
--
ALTER TABLE `estates`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
