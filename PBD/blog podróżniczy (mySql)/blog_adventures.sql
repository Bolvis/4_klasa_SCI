-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Wrz 2020, 19:06
-- Wersja serwera: 10.4.11-MariaDB
-- Wersja PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `blog_adventures`
--
CREATE DATABASE IF NOT EXISTS `blog_adventures` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `blog_adventures`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `travelling_styles`
--

CREATE TABLE `travelling_styles` (
  `id_style` int(10) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `travelling_styles`
--

INSERT INTO `travelling_styles` (`id_style`, `name`) VALUES
(1, 'Autostop'),
(2, 'Odpoczynek'),
(3, 'Zwiedzanie'),
(4, 'Zawody'),
(5, 'Objazd'),
(6, 'Śladami filmu');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `wiek` date NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `nickname`, `password`, `wiek`, `email`) VALUES
(1, 'kama123', 'zaq12wsx', '2001-02-08', 'kamapodrozuje@gmail.com'),
(2, 'dawideczek', 'qwertyuiop', '2001-02-10', 'dawidwtrasie@gmail.com'),
(3, 'kacper_magik', 'abrakadabraalakazam', '1998-04-28', 'jednorozeczaglady@gmail.com'),
(4, 'kinisaswinia', 'chomiczek123', '2010-07-29', 'pozogachomiczka@gmail.com');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wpis`
--

CREATE TABLE `wpis` (
  `id_wpis` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `wycieczka_id` int(10) NOT NULL,
  `data` date NOT NULL,
  `tytuł` varchar(40) NOT NULL,
  `start` varchar(20) NOT NULL,
  `end` varchar(20) NOT NULL,
  `transport` varchar(40) NOT NULL,
  `opis` text NOT NULL,
  `wrażenia` text NOT NULL,
  `trasa` varchar(60) NOT NULL,
  `photos` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wpis`
--

INSERT INTO `wpis` (`id_wpis`, `user_id`, `wycieczka_id`, `data`, `tytuł`, `start`, `end`, `transport`, `opis`, `wrażenia`, `trasa`, `photos`) VALUES
(1, 1, 1, '2020-09-01', 'Jerozolima dniem i nocą', 'Tel Aviv', 'Jerozolima', 'Autokar, stopy', 'Pierwszy dzień był niesamowity. Jerozolima to piękne miasto pełne historii. Dużo starych budynków. Widziałam górę, na której Jezus był w ogrodzie oliwnym.', 'Góra była wzgórzem co najwyżej. Pyszne falafele. Ludzie bardzo mili. Drogo.', 'https://www.strava.com/', 'https://www.instagram.com/'),
(2, 1, 1, '2020-09-02', 'Jerozolima part 2 - za dużo tu atrakcji', 'Jerozolima', 'Jerozolima', 'Stopy', 'Za dużo się tu dzieje. Omg.', 'Najstarsze studio tatuażu zostawiło mi pamiątkę!', 'https://www.strava.com/', 'https://www.instagram.com/'),
(3, 2, 2, '2020-04-08', 'GRYFFINDORRRRR', 'Peron 9 i 3/4', 'Hogwart', 'Miotła, testrale, pociąg', 'It\'s LeviOsa. Not LeviosA.', 'Prawie umarłem od wbiegania w mur na peronie.', 'https://www.strava.com/', 'https://www.instagram.com/');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wycieczki`
--

CREATE TABLE `wycieczki` (
  `id_wycieczka` int(10) NOT NULL,
  `nazwa` varchar(50) NOT NULL,
  `kilkudniowa` tinyint(1) NOT NULL,
  `styl_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wycieczki`
--

INSERT INTO `wycieczki` (`id_wycieczka`, `nazwa`, `kilkudniowa`, `styl_id`) VALUES
(1, 'Jak zwiedzić ziemię obiecaną w tydzień', 1, 5),
(2, 'Hari Pota i Studio Warner Bros', 1, 6),
(3, 'Nowy Jork w pigułce', 0, 3),
(4, 'Podróż za 1 grosz', 1, 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `travelling_styles`
--
ALTER TABLE `travelling_styles`
  ADD PRIMARY KEY (`id_style`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeksy dla tabeli `wpis`
--
ALTER TABLE `wpis`
  ADD PRIMARY KEY (`id_wpis`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `wycieczka_id` (`wycieczka_id`);

--
-- Indeksy dla tabeli `wycieczki`
--
ALTER TABLE `wycieczki`
  ADD PRIMARY KEY (`id_wycieczka`),
  ADD KEY `styl_id` (`styl_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `wpis`
--
ALTER TABLE `wpis`
  ADD CONSTRAINT `wpis_ibfk_1` FOREIGN KEY (`wycieczka_id`) REFERENCES `wycieczki` (`id_wycieczka`),
  ADD CONSTRAINT `wpis_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`);

--
-- Ograniczenia dla tabeli `wycieczki`
--
ALTER TABLE `wycieczki`
  ADD CONSTRAINT `wycieczki_ibfk_1` FOREIGN KEY (`styl_id`) REFERENCES `travelling_styles` (`id_style`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
