-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 18 Lis 2020, 22:03
-- Wersja serwera: 10.4.14-MariaDB
-- Wersja PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `wyzwalacze2`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Bilety`
--

CREATE TABLE `Bilety` (
  `id` int(11) NOT NULL,
  `idLotu` int(11) NOT NULL,
  `cena` decimal(10,2) NOT NULL,
  `klient` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  `pozostalych_miejsc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Bilety`
--

INSERT INTO `Bilety` (`id`, `idLotu`, `cena`, `klient`, `pozostalych_miejsc`) VALUES
(1, 4, '400.00', 'Abacki J.', NULL),
(2, 4, '400.00', 'Abacka A.', NULL),
(3, 4, '400.00', 'Abacki M.', NULL),
(4, 4, '400.00', 'Babacki L.', NULL),
(5, 4, '400.00', 'Babacka A.', NULL),
(6, 5, '500.00', 'Cacki M.', NULL),
(7, 5, '500.00', 'Cacka Z.', NULL),
(8, 5, '500.00', 'Dacka I.', NULL),
(9, 5, '500.00', 'Dacki P.', NULL),
(10, 6, '400.00', 'Abacki J.', NULL),
(13, 7, '600.00', 'Babacki L.', NULL),
(14, 7, '600.00', 'Babacka A.', NULL),
(16, 8, '500.00', 'Cacka Z.', NULL);

--
-- Wyzwalacze `Bilety`
--
DELIMITER $$
CREATE TRIGGER `dwa` BEFORE INSERT ON `Bilety` FOR EACH ROW BEGIN
DECLARE miejsca_zajete integer;
DECLARE miejsca integer;

SET @miejsca_zajete := (SELECT COUNT(idLotu) FROM `Bilety` WHERE idLotu = NEW.idLotu GROUP BY `Bilety`.idLotu);

SET @miejsca := (SELECT DISTINCT `Samoloty`.iloscMiejsc FROM `Samoloty`
JOIN `Loty` ON `Loty`.idSamolotu = `Samoloty`.id
JOIN `Bilety` ON `Loty`.id = `Bilety`.idLotu
WHERE idLotu = NEW.idLotu );

SET NEW.pozostalych_miejsc = @miejsca - @miejsca_zajete - 1;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `jeden` BEFORE INSERT ON `Bilety` FOR EACH ROW BEGIN
DECLARE nowaCena decimal;

SET @nowaCena := (SELECT `Loty`.aktualnaCena FROM `Loty` WHERE `Loty`.id = NEW.idLotu);
SET NEW.cena = @nowaCena;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `piec` AFTER DELETE ON `Bilety` FOR EACH ROW BEGIN 
DECLARE bilety integer;
	SET	@bilety	:=	(SELECT COUNT(idLotu) FROM Bilety WHERE idLotu = OLD.idLotu GROUP BY Bilety.idLotu);
    IF (@bilety < 3) THEN
    UPDATE Loty
    SET aktualnaCena = aktualnaCena * 0.9 WHERE id = OLD.idLotu;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `helikoptery`
--

CREATE TABLE `helikoptery` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  `iloscMiejsc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `helikoptery`
--

INSERT INTO `helikoptery` (`id`, `nazwa`, `iloscMiejsc`) VALUES
(1, 'lorem', 2),
(2, 'ipsum', 4),
(3, 'dolor', 3),
(4, 'sit', 1),
(5, 'ament', 6),
(123, 'asdasf', 325);

--
-- Wyzwalacze `helikoptery`
--
DELIMITER $$
CREATE TRIGGER `cztery` BEFORE INSERT ON `helikoptery` FOR EACH ROW BEGIN
DECLARE samoloty integer;
SET @samoloty := (SELECT id FROM Samoloty WHERE id = NEW.id);
IF (@samoloty IS NOT NULL) THEN 
SIGNAL SQLSTATE '45000';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Loty`
--

CREATE TABLE `Loty` (
  `id` int(11) NOT NULL,
  `aktualnaCena` decimal(10,2) NOT NULL,
  `cel` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  `idSamolotu` int(11) NOT NULL,
  `dataWylotu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Loty`
--

INSERT INTO `Loty` (`id`, `aktualnaCena`, `cel`, `idSamolotu`, `dataWylotu`) VALUES
(4, '1500.00', 'Warszawa', 1, '2016-10-18'),
(5, '1200.00', 'Poznań', 2, '2016-10-18'),
(6, '1800.00', 'Gdańsk', 3, '2016-10-19'),
(7, '2100.00', 'Lublin', 2, '2016-10-19'),
(8, '1530.00', 'Warszawa', 1, '2016-10-19'),
(9, '2300.00', 'Kraków', 1, '2016-10-20'),
(10, '1300.00', 'Poznań', 3, '2016-10-20'),
(11, '1800.00', 'Gdańsk', 2, '2016-10-20'),
(12, '1500.00', 'Warszawa', 2, '2016-10-21');

--
-- Wyzwalacze `Loty`
--
DELIMITER $$
CREATE TRIGGER `trzy` BEFORE INSERT ON `Loty` FOR EACH ROW BEGIN
DECLARE samoloty integer;
DECLARE helikoptery integer;
SET @samoloty := (SELECT id FROM Samoloty WHERE id = NEW.idSamolotu);
SET @helikoptery := (SELECT id FROM helikoptery WHERE id = NEW.idSamolotu);
IF (@samoloty IS NULL) AND (@helikoptery IS NULL) THEN 
SIGNAL SQLSTATE '45000';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Samoloty`
--

CREATE TABLE `Samoloty` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(256) COLLATE utf8_polish_ci NOT NULL,
  `iloscMiejsc` int(11) NOT NULL,
  `pojemnoscBagazu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `Samoloty`
--

INSERT INTO `Samoloty` (`id`, `nazwa`, `iloscMiejsc`, `pojemnoscBagazu`) VALUES
(1, 'Boeing1', 5, 30),
(2, 'Boeing2', 4, 40),
(3, 'Boeing3', 3, 30),
(4, 'AirBus1', 7, 50),
(5, 'AirBus2', 3, 50);

--
-- Wyzwalacze `Samoloty`
--
DELIMITER $$
CREATE TRIGGER `czteryv2` BEFORE INSERT ON `Samoloty` FOR EACH ROW BEGIN
DECLARE helikoptery integer;
SET @helikoptery := (SELECT id FROM helikoptery WHERE id = NEW.id);
IF (@helikoptery IS NOT NULL) THEN 
SIGNAL SQLSTATE '45000';
END IF;
END
$$
DELIMITER ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Bilety`
--
ALTER TABLE `Bilety`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `helikoptery`
--
ALTER TABLE `helikoptery`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Loty`
--
ALTER TABLE `Loty`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `Samoloty`
--
ALTER TABLE `Samoloty`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
