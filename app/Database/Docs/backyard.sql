-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 24. Okt 2020 um 22:10
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
(14, 'Bad mit Wanne', '2020-10-24 19:11:25'),
(15, 'separates WC', '2020-10-24 19:11:25'),
(16, 'Kunststofffenster', '2020-10-24 19:11:25'),
(17, 'Dusche und Waschmaschinenanschluss', '2020-10-24 19:11:25'),
(18, 'Abstellraum/begehbarer Schrank', '2020-10-24 19:11:25'),
(19, 'Technikraum mit Heiztherme', '2020-10-24 19:11:25');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`t_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
