-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 26. Okt 2020 um 12:49
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

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `cli_id` int(11) NOT NULL,
  `cli_last_name` varchar(32) NOT NULL,
  `cli_first_name` varchar(32) NOT NULL,
  `cli_academic_degree` varchar(16) NOT NULL,
  `cli_email` varchar(64) NOT NULL,
  `cli_phone` varchar(32) NOT NULL,
  `cli_street` varchar(32) NOT NULL,
  `cli_zip` varchar(8) NOT NULL,
  `cli_town` varchar(32) NOT NULL,
  `cli_created_at` datetime NOT NULL,
  `cli_updated_at` datetime NOT NULL,
  `cli_deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='cli';

--
-- Daten für Tabelle `clients`
--

INSERT INTO `clients` (`cli_id`, `cli_last_name`, `cli_first_name`, `cli_academic_degree`, `cli_email`, `cli_phone`, `cli_street`, `cli_zip`, `cli_town`, `cli_created_at`, `cli_updated_at`, `cli_deleted_at`) VALUES
(1, 'N', 'Orar anb wa C', 'GtKaa mt ggtglR', 'weta@pid.mq', 'I  t bayauhaat', 'Avt', 'A', 'Nt rnDn', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Mgmath aneaviD', 'Uyha hll', 'Bi i a aaaDvo\'t', 'suzipa@hebebni.bq', '8573137958', 'UabOu ra la', 'GuKrhuaa', 'Arhgmk', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Bytga  ha', 'K', 'IomanamaiaRvan', 'kemir@fu.ax', 'Uiyleg\'aa', 'Ahanl ltaiitaia', 'Aaynkm', 'Ht e', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Blhmk', 'NaayD ht rA', 'Gha a', 'hicuru@biminu.pl', 'Ebaahm  amakn', 'Et\'r hlh tutlr', 'Vbmana', 'M', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'U ygna', 'Nlhlysihnta', 'Nattlhgnhao', 'aruvam@kejjugu.as', 'O', 'Naeabnvnmg t', 'L\'', 'Eo  hhgmaiuvah', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Naomaaaar raa', 'G eo ohgau\' s', 'Bak', 'ni@biahtov.au', 'Ieaboo', 'Mahru', 'Galathk', 'Sl', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Apbu m bm l', 'Aahtt hurhgblhf', 'Tan agnkan\'Dyaa', 'to@oli.cy', '\'', 'AihDhaha\'aR nal', 'G ea eh', 'Eanvma  a', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Apbu m bm l', 'Aahtt hurhgblhf', 'Tan agnkan\'Dyaa', 'to@oli.cy', '\'', 'AihDhaha\'aR nal', 'G ea eh', 'Eanvma  a', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Ratzinger', 'Maria', 'BA', 'maria@ijp.at', '067687837684', 'Assmayerg. 11', '1190', 'WIE', '2020-10-26 12:41:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Ilse ', 'Ratzinger', 'Mag.', 'ratzinger@ijp.at', '067687837688', 'Am Schulberg 22', '2124', 'Niederkreuzstetten', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clients_tags_relations`
--

DROP TABLE IF EXISTS `clients_tags_relations`;
CREATE TABLE `clients_tags_relations` (
  `ctr_id` int(11) NOT NULL,
  `ctr_cli_id` int(11) NOT NULL,
  `ctr_ct_id` int(11) NOT NULL,
  `ctr_created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `clients_tags_relations`
--

INSERT INTO `clients_tags_relations` (`ctr_id`, `ctr_cli_id`, `ctr_ct_id`, `ctr_created_at`) VALUES
(1, 8, 2, '2020-10-26 12:38:10'),
(2, 8, 3, '2020-10-26 12:38:10'),
(4, 5, 1, '2020-10-26 12:43:26'),
(5, 5, 3, '2020-10-26 12:43:26'),
(6, 5, 2, '2020-10-26 12:45:52'),
(7, 10, 3, '2020-10-26 12:47:56');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `clienttags`
--

DROP TABLE IF EXISTS `clienttags`;
CREATE TABLE `clienttags` (
  `ct_id` int(11) NOT NULL,
  `ct_name` varchar(255) NOT NULL,
  `ct_created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `clienttags`
--

INSERT INTO `clienttags` (`ct_id`, `ct_name`, `ct_created_at`) VALUES
(1, 'RaucherIn', '0000-00-00 00:00:00'),
(2, 'Single ', '0000-00-00 00:00:00'),
(3, 'Tierhalter', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `estates`
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
  `est_country` varchar(32) NOT NULL,
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
  `est_title_willhaben` varchar(255) NOT NULL,
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
-- Tabellenstruktur für Tabelle `estate_tags`
--

DROP TABLE IF EXISTS `estate_tags`;
CREATE TABLE `estate_tags` (
  `et_id` int(11) NOT NULL,
  `et_est_id` int(11) NOT NULL,
  `et_t_id` int(11) NOT NULL,
  `et_created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(255) NOT NULL,
  `t_created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `tags`
--

INSERT INTO `tags` (`t_id`, `t_name`, `t_created_at`) VALUES
(1, 'Loggia', '2020-10-24 19:11:25'),
(2, 'Garten', '2020-10-24 19:11:25'),
(3, 'Dachterrasse', '2020-10-24 19:11:25'),
(4, 'Parkett', '2020-10-24 19:11:25'),
(5, 'Lift', '2020-10-24 19:11:25'),
(6, 'Garage', '2020-10-24 19:11:25'),
(7, 'Parkplatz', '2020-10-24 19:11:25'),
(8, 'Abstellraum', '2020-10-24 19:11:25'),
(9, 'Fußbodenheizung', '2020-10-24 19:11:25'),
(10, 'Wohnküche', '2020-10-24 19:11:25'),
(11, 'möbliert', '2020-10-24 19:11:25'),
(12, 'Fahrradraum', '2020-10-24 19:11:25'),
(13, 'Kinderwagenraum', '2020-10-24 19:11:25'),
(14, 'Wannenbad', '2020-10-24 19:11:00'),
(15, 'separates WC', '2020-10-24 19:11:25'),
(16, 'Kunststofffenster', '2020-10-24 19:11:25'),
(17, 'Dusche mit Waschmaschinenanschluss', '2020-10-24 19:11:00'),
(18, 'Abstellraum/begehbarer Schrank', '2020-10-24 19:11:25'),
(19, 'Technikraum mit Heiztherme', '2020-10-24 19:11:25'),
(39, 'Kellerabteil', '2020-10-24 16:38:00'),
(40, 'Fitnessraum', '0000-00-00 00:00:00'),
(41, 'Müllschlucker', '0000-00-00 00:00:00'),
(42, 'Geschirrspüler', '0000-00-00 00:00:00'),
(43, 'Geschirrspüler', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_lastname` varchar(32) NOT NULL,
  `u_firstname` varchar(32) NOT NULL,
  `u_academic_degree` varchar(32) NOT NULL,
  `u_password` varchar(255) NOT NULL,
  `u_email` varchar(64) NOT NULL,
  `u_phone` varchar(32) NOT NULL,
  `u_created_at` datetime NOT NULL,
  `u_updated_at` datetime NOT NULL,
  `u_deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`u_id`, `u_lastname`, `u_firstname`, `u_academic_degree`, `u_password`, `u_email`, `u_phone`, `u_created_at`, `u_updated_at`, `u_deleted_at`) VALUES
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
-- Indizes für die Tabelle `clients_tags_relations`
--
ALTER TABLE `clients_tags_relations`
  ADD PRIMARY KEY (`ctr_id`);

--
-- Indizes für die Tabelle `clienttags`
--
ALTER TABLE `clienttags`
  ADD PRIMARY KEY (`ct_id`);

--
-- Indizes für die Tabelle `estates`
--
ALTER TABLE `estates`
  ADD PRIMARY KEY (`est_id`);

--
-- Indizes für die Tabelle `estate_tags`
--
ALTER TABLE `estate_tags`
  ADD PRIMARY KEY (`et_id`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`t_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `clients`
--
ALTER TABLE `clients`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `clients_tags_relations`
--
ALTER TABLE `clients_tags_relations`
  MODIFY `ctr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `clienttags`
--
ALTER TABLE `clienttags`
  MODIFY `ct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `estates`
--
ALTER TABLE `estates`
  MODIFY `est_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `estate_tags`
--
ALTER TABLE `estate_tags`
  MODIFY `et_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
