-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Lip 2022, 17:17
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `janczak`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `baza`
--

CREATE TABLE `baza` (
  `ID` int(11) NOT NULL,
  `Imie i Nazwisko` varchar(35) COLLATE utf8_polish_ci DEFAULT NULL,
  `Data od` date DEFAULT NULL,
  `Data do` date DEFAULT NULL,
  `Miejsce wyjazdu` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `Miejsce przyjazdu` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `baza`
--

INSERT INTO `baza` (`ID`, `Imie i Nazwisko`, `Data od`, `Data do`, `Miejsce wyjazdu`, `Miejsce przyjazdu`) VALUES
(1, 'Tomasz Brzęczek', '2022-05-03', '2022-06-23', 'Bydgoszcz', 'Szczecinek'),
(2, 'Bartłomiej Krysiak', '2021-11-01', '2022-06-29', 'Kalisz', 'Warszawa'),
(4, 'Aleksandra Piotrkowska', '2022-08-12', '2023-04-08', 'Bydgoszcz', 'Szczecinek'),
(5, 'Jan Kowalski', '2021-12-05', '2022-10-27', 'Kraków', 'Złoczew'),
(6, 'Patrycja Kwiecińska', '2022-08-13', '2023-04-08', 'Szczecin', 'Wrocław'),
(7, 'Jakub Nowak', '2021-11-01', '2022-10-27', 'Kraków', 'Łódź');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `danekontrahentow`
--

CREATE TABLE `danekontrahentow` (
  `ID` int(11) NOT NULL,
  `NIP` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `REGON` varchar(14) COLLATE utf8_polish_ci NOT NULL,
  `NAZWA` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `PLATNIKVAT` tinyint(1) DEFAULT NULL,
  `ULICA` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `NUMERDOMU` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `NUMERMIESZKANIA` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `USUNIETY` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `danekontrahentow`
--

INSERT INTO `danekontrahentow` (`ID`, `NIP`, `REGON`, `NAZWA`, `PLATNIKVAT`, `ULICA`, `NUMERDOMU`, `NUMERMIESZKANIA`, `USUNIETY`) VALUES
(1, '1234567891', '121212121212', 'Urzad', 0, 'Skarbowa', '12x', '32', 0),
(2, '1238232138', '8787878', 'Blabla', 1, 'Targowa', '78b', '8', 0),
(4, '22222', '3333', 'test10', 1, 'sraka', '', '44', 0),
(5, '22222', '3333', 'test10', 1, 'sraka', '', '44', 0),
(6, '888', '123', 'jkjk', 1, 'kkkk', '', '20', 0),
(7, 'kookoko', '00909', 'kkklklk', 1, 'ooo', '90', '99', 0),
(8, '00909', '09999', 'Test', 1, 'Testowa', '12', '13', 0),
(9, '00909', '09999', 'Test', 1, 'Testowa', '12', '13', 0),
(10, '00909', '09999', 'Test', 1, 'Testowa', '12', '13', 0),
(11, '00909', '09999', 'Test', 1, 'Testowa', '12', '13', 0),
(12, '555', '666', 'proba', 1, 'proba', '33', '22', 0),
(13, '33', '22', 'ss', 0, 'qq', '09', '99', 0),
(14, '33', '22', 'ss', 0, 'qq', '09', '99', 0),
(15, '33', '22', 'ss', 0, 'qq', '09', '99', 0),
(16, '1', '1', 'n', 0, 'kkkk', '11', '11', 1),
(17, '1', '1', 'n', 0, 'kkkk', '11', '11', 1),
(18, '1', '1', 'n', 0, 'kkkk', '11', '11', 1),
(19, '2', '3', 'op', 1, 'll', '77', '66', 1),
(20, '9', '0', 'kop', 0, 'lop', '1', '2', 1),
(21, '9', '0', 'kop', 0, 'lop', '1', '2', 1),
(22, '9', '0', 'kop', 0, 'lop', '1', '2', 1),
(23, '9', '0', 'kop', 0, 'lop', '1', '2', 1),
(24, '9', '0', 'kop', 0, 'lop', '1', '2', 1),
(25, '1', '2', 'dd', 1, 'jj', '8', '6', 1),
(27, '222', '321', 'ostateczna', 0, 'Jana', '11', '33a', 1),
(28, '1', '13', 'gugu', 1, 'fajna', '22a', '12', 1),
(29, '1', '13', 'gugu', 1, 'fajna', '22a', '12', 1),
(30, '1', '', '', 0, '', '', '', 1);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `baza`
--
ALTER TABLE `baza`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `danekontrahentow`
--
ALTER TABLE `danekontrahentow`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `baza`
--
ALTER TABLE `baza`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `danekontrahentow`
--
ALTER TABLE `danekontrahentow`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
