-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Jún 01. 08:30
-- Kiszolgáló verziója: 10.4.6-MariaDB
-- PHP verzió: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `cipobolt`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendelők`
--

CREATE TABLE `megrendelők` (
  `ID` int(11) NOT NULL,
  `Név` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Lakcím` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Cipőméret` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `megrendelők`
--

INSERT INTO `megrendelők` (`ID`, `Név`, `Lakcím`, `Cipőméret`) VALUES
(1, 'Szabó Dávid', 'Kipufogófürdő 66.', 52),
(2, 'Kraszuják Milán', 'Mordor', 73),
(3, 'Faragó Richárd', 'Üzbegisztán 71.', 2),
(4, 'Szempék Milán', 'Tavasz utca 4.', 9),
(5, 'Kiss Dominik', 'Mars TM', 96),
(6, 'Turú Márk', 'Ohio', -128),
(7, 'Lomjánszki Dominik', 'Miskolc', 69),
(8, 'Vári Márton', 'Radiátor mögött', 18),
(9, 'Keresztúri Adrián', 'Ökördi főváros', -69);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelések`
--

CREATE TABLE `rendelések` (
  `ID` int(11) NOT NULL,
  `MegrendelőID` int(11) NOT NULL,
  `TermékID` int(11) NOT NULL,
  `Dátum` date DEFAULT NULL,
  `Kedvezmények` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendelések`
--

INSERT INTO `rendelések` (`ID`, `MegrendelőID`, `TermékID`, `Dátum`, `Kedvezmények`) VALUES
(1, 8, 1, '2013-04-07', NULL),
(2, 4, 1, '0000-00-00', '2323'),
(3, 1, 2, '2005-10-07', NULL),
(4, 2, 3, '2023-02-13', NULL),
(5, 1, 3, '2022-10-07', NULL),
(6, 4, 3, '0000-00-00', '2323'),
(7, 6, 4, '2024-12-24', NULL),
(8, 7, 5, '2023-02-19', NULL),
(9, 9, 6, '2069-06-02', 'igen'),
(10, 8, 6, '2023-04-08', 'Nem occsó, mer\' há\' Lays TM'),
(11, 5, 6, '6969-06-09', 'az egész csomag'),
(12, 5, 7, '2050-06-09', '101%'),
(13, 3, 8, '2222-12-11', NULL),
(14, 8, 9, '2222-12-11', NULL),
(15, 2, 9, '0000-00-00', NULL),
(16, 5, 10, '1111-11-11', NULL),
(17, 2, 10, '1111-11-11', NULL),
(18, 1, 10, '1968-10-07', NULL),
(19, 9, 10, '2096-10-14', '-10%'),
(20, 9, 11, '2070-06-02', NULL),
(21, 7, 11, '1970-06-02', NULL),
(22, 2, 12, '1939-09-07', NULL),
(23, 5, 12, '0001-01-01', 'tobb is kell'),
(24, 3, 12, '1001-10-01', 'Bócsa City'),
(25, 7, 12, '1939-09-07', NULL),
(26, 9, 12, '2096-10-13', '100%'),
(27, 7, 13, '2025-12-24', '420'),
(28, 8, 13, '2023-04-12', NULL),
(29, 3, 14, '2000-12-12', 'Minden'),
(30, 6, 15, '2025-01-11', '69%; Valami: Ohio Edition Csomag része'),
(31, 1, 16, '2023-02-15', '1%'),
(32, 3, 16, '2010-11-02', 'Bódog karácsonyt');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termékek`
--

CREATE TABLE `termékek` (
  `ID` int(11) NOT NULL,
  `Terméknév` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `Ár` int(11) DEFAULT NULL,
  `raktáron_db` int(11) DEFAULT NULL,
  `csom_térf_m^3` int(11) NOT NULL,
  `megj` varchar(255) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `termékek`
--

INSERT INTO `termékek` (`ID`, `Terméknév`, `Ár`, `raktáron_db`, `csom_térf_m^3`, `megj`) VALUES
(1, 'Jojó', 600, 3, 64, NULL),
(2, 'Labda', 4900, 9, 125, NULL),
(3, 'Bugatti', 7100, 8, 343, NULL),
(4, 'Valami: Ohio Edition', 5400, 12, 8000, NULL),
(5, 'Niké Jorden 1', 5300, 6, 2197, NULL),
(6, 'kiscsomagos levegő', 9800, 13, 5832, NULL),
(7, 'Rubik kocka', 2800, 14, 1331, NULL),
(8, 'plutonium', 14000, 1, 729, NULL),
(9, 'Uránium', 1100, 10, 343, NULL),
(10, 'V-Buck', 8300, 3, 216, NULL),
(11, 'compliment ukrán import', 7500, 14, 12167, NULL),
(12, 'Keringetőszivattyú', 12100, 4, 5832, NULL),
(13, 'Snoop Dogg bal cipője', 7500, 7, 9261, NULL),
(14, 'nukleáris bomba', 800, 11, 3375, NULL),
(15, 'Atom bomba+Uránium Csomag', 11100, 1, 15625, NULL),
(16, 'Koenigsegg Regera', 7400, 5, 4913, NULL);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `megrendelők`
--
ALTER TABLE `megrendelők`
  ADD PRIMARY KEY (`ID`);

--
-- A tábla indexei `rendelések`
--
ALTER TABLE `rendelések`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MegrendelőID` (`MegrendelőID`),
  ADD KEY `TermékID` (`TermékID`);

--
-- A tábla indexei `termékek`
--
ALTER TABLE `termékek`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `megrendelők`
--
ALTER TABLE `megrendelők`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `rendelések`
--
ALTER TABLE `rendelések`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT a táblához `termékek`
--
ALTER TABLE `termékek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendelések`
--
ALTER TABLE `rendelések`
  ADD CONSTRAINT `rendelések_ibfk_1` FOREIGN KEY (`MegrendelőID`) REFERENCES `megrendelők` (`ID`),
  ADD CONSTRAINT `rendelések_ibfk_2` FOREIGN KEY (`TermékID`) REFERENCES `termékek` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
