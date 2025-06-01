-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Jún 01. 16:25
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `library_db`
--
CREATE DATABASE IF NOT EXISTS `library_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `library_db`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `available` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `price`, `available`, `category_id`) VALUES
(1, 'A Gyűrűk Ura', 'J.R.R. Tolkien', 4500, 10, 1),
(2, 'Harry Potter és a Bölcsek Köve', 'J.K. Rowling', 3900, 15, 1),
(3, 'Az Éhezők Viadala', 'Suzanne Collins', 3500, 8, 2),
(4, 'A Marsi', 'Andy Weir', 3200, 7, 2),
(5, 'Szürke Ötven Árnyalata', 'E.L. James', 2800, 12, 3),
(6, 'Büszkeség és balítélet', 'Jane Austen', 3000, 9, 3),
(7, 'Az ember tragédiája', 'Madách Imre', 2700, 5, 4),
(8, 'A Pál utcai fiúk', 'Molnár Ferenc', 3100, 10, 4),
(9, 'A Világ Történelme', 'H.G. Wells', 4200, 6, 5),
(10, 'Az Univerzum Története', 'Stephen Hawking', 4800, 4, 5),
(11, 'Drakula', 'Bram Stoker', 3000, 7, 6),
(12, 'Frankenstein', 'Mary Shelley', 3100, 6, 6),
(13, 'A kincskereső kisködmön', 'Molnár Ferenc', 2800, 5, 7),
(14, 'Robinson Crusoe', 'Daniel Defoe', 3300, 8, 7),
(15, 'Dr. Szöszke kalandjai', 'Jules Verne', 2900, 9, 7),
(16, 'Végtelen történet', 'Michael Ende', 3700, 11, 1),
(17, 'Neuromancer', 'William Gibson', 3400, 6, 2),
(18, 'Szerelem a kolera idején', 'Gabriel Garcia Marquez', 3600, 7, 3),
(19, 'Az óriásölő', 'Terry Pratchett', 3800, 5, 1),
(20, 'A rejtélyes idegen', 'Agatha Christie', 3200, 12, 4),
(21, 'Fekete tükör', 'Stephen King', 3500, 4, 6),
(22, 'Az elveszett világ', 'Arthur Conan Doyle', 3100, 7, 7),
(23, 'Az éjszaka istene', 'H.P. Lovecraft', 3400, 5, 6),
(24, 'Kaland a dzsungelben', 'Edgar Rice Burroughs', 3000, 8, 7),
(25, 'Csillagközi utazások', 'Isaac Asimov', 3900, 9, 2),
(26, 'A szív hídjai', 'Robert James Waller', 2800, 6, 3),
(27, 'Az elveszett kincs', 'Clive Cussler', 3700, 7, 7),
(28, 'Az időutazó felesége', 'Audrey Niffenegger', 3500, 10, 3),
(29, 'Holdbéli történet', 'Philip K. Dick', 3300, 8, 2),
(30, 'A varázsló tanítványa', 'Lev Grossman', 3600, 5, 1),
(31, 'A fáraó titka', 'Nagy László', 3652, 9, 6),
(32, 'Szerelmem, Párizs', 'Farkas Eszter', 3861, 15, 5),
(33, 'A titkos kert', 'Kiss Júlia', 4535, 8, 4),
(34, 'A jég szíve', 'Kovács Béla', 3539, 6, 2),
(35, 'A dzsungel hívása', 'Kiss Júlia', 2951, 15, 5),
(36, 'A dzsungel hívása', 'Tóth Gábor', 2602, 10, 1),
(37, 'A második élet', 'Simon Márk', 4140, 8, 6),
(38, 'Szerelmem, Párizs', 'Balogh Kitti', 4855, 7, 5),
(39, 'A fény gyermekei', 'Nagy László', 4375, 15, 4),
(40, 'Varázslatos utak', 'Simon Márk', 2867, 9, 6),
(41, 'Galaktikus küldetés', 'Szabó Anna', 4108, 15, 3),
(42, 'Túlélők', 'Simon Márk', 3002, 14, 3),
(43, 'Holdfényes éjszakák', 'Simon Márk', 2977, 7, 5),
(44, 'Elveszett kód', 'Tóth Gábor', 4284, 11, 1),
(45, 'Szerelmem, Párizs', 'Kovács Béla', 4284, 15, 3),
(46, 'Mennyei szerződés', 'Molnár Dániel', 4296, 9, 7),
(47, 'A lángoló könyvtár', 'Szabó Anna', 4133, 13, 6),
(48, 'A második élet', 'Kovács Béla', 3653, 10, 4),
(49, 'Az eltűnt expedíció', 'Lukács Petra', 2822, 13, 7),
(50, 'Tüzes égbolt', 'Molnár Dániel', 3053, 9, 6),
(51, 'Harry Potter és a Félvér Herceg', 'J.K. Rowling', 4800, 8, 1),
(52, 'Harry Potter és az Azkabani Fogoly', 'J.K. Rowling', 4200, 11, 1),
(53, 'A végzet ködén át', 'Laura Galvez', 4100, 7, 1),
(54, 'Az elveszett varázsló', 'Zoltán Ákos', 4300, 6, 1),
(55, 'A sárkány éve', 'Kovács Petra', 3900, 8, 1),
(56, 'Az árnyak erdeje', 'Miklós Attila', 3700, 9, 1),
(57, 'Galaktikus örökség', 'Sára Varga', 3600, 7, 2),
(58, 'Az időhurok', 'András Farkas', 3400, 8, 2),
(59, 'Csillagközi kaland', 'János Balogh', 3800, 6, 2),
(60, 'A Mars titka', 'Bence Kovács', 4000, 5, 2),
(61, 'Harry Potter és a Főnix Rendje', 'J.K. Rowling', 4600, 9, 1),
(62, 'Szív dallama', 'Erika Kiss', 3200, 10, 3),
(63, 'Nyári szerelem', 'Anna Molnár', 3100, 11, 3),
(64, 'Tavaszi vágy', 'Réka Nagy', 3000, 12, 3),
(65, 'Csók az esőben', 'Éva Tóth', 3300, 9, 3),
(66, 'Az elfeledett birodalom', 'Péter Szabó', 3500, 8, 4),
(67, 'A király titka', 'Mária Lukács', 3600, 7, 4),
(68, 'Vihar a trónon', 'Zsófia Fodor', 3700, 6, 4),
(69, 'Ősi szövetség', 'Tamás Molnár', 3800, 5, 4),
(70, 'Harry Potter és a Halál Ereklyéi', 'J.K. Rowling', 5000, 7, 1),
(71, 'Az univerzum rejtélyei', 'Dr. Gábor Horváth', 4500, 6, 5),
(72, 'Emberi agy működése', 'Dr. Katalin Szűcs', 4200, 7, 5),
(73, 'Őskor és ember', 'István Farkas', 4300, 5, 5),
(74, 'Földünk csodái', 'Ádám Nagy', 4400, 4, 5),
(75, 'Harry Potter és a Titkok Kamrája', 'J.K. Rowling', 4000, 12, 1),
(76, 'Harry Potter és a Tűz Serlege', 'J.K. Rowling', 4400, 10, 1),
(77, 'Az éjszaka sötét árnyai', 'László Kiss', 3400, 8, 6),
(78, 'A rémálmok háza', 'Judit Varga', 3500, 7, 6),
(79, 'Halálos csend', 'Ferenc Molnár', 3300, 9, 6),
(80, 'Véres nyomok', 'Gábor Szabó', 3600, 6, 6),
(81, 'Az elveszett város nyomában', 'Péter Balogh', 3000, 10, 7),
(82, 'Kincs a mélyben', 'Anna Horváth', 3100, 9, 7),
(83, 'Vadász az őserdőben', 'Tamás Farkas', 3200, 8, 7),
(84, 'Út a titkok szigetére', 'Réka Kovács', 3300, 7, 7),
(85, 'Varázslatok könyve', 'Zoltán Ákos', 4000, 5, 1),
(86, 'Csillagok között', 'János Balogh', 3900, 6, 2),
(87, 'Szívszakadások', 'Anna Molnár', 3000, 9, 3),
(88, 'Árnyak a múltból', 'Tamás Molnár', 3700, 5, 4),
(89, 'Bolygónk titkai', 'Ádám Nagy', 4400, 3, 5),
(90, 'Halál tánca', 'Gábor Szabó', 3500, 4, 6),
(91, 'Kincskeresők kalandjai', 'Péter Balogh', 3200, 8, 7);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Fantasy'),
(2, 'Sci-Fi'),
(3, 'Romantika'),
(4, 'Történelmi'),
(5, 'Ismeretterjesztő'),
(6, 'Horror'),
(7, 'Kaland');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `type` enum('rent','buy') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `book_id`, `type`, `date`) VALUES
(0, 0, 6, 'buy', '2025-06-01 13:55:47'),
(0, 0, 21, 'buy', '2025-06-01 13:55:47'),
(0, 0, 26, 'rent', '2025-06-01 13:59:09'),
(0, 0, 57, 'buy', '2025-06-01 14:15:52'),
(0, 0, 23, 'buy', '2025-06-01 14:15:52'),
(0, 0, 4, 'buy', '2025-06-01 14:20:20');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'AdamBOSS', '1234'),
(0, 'ricsi', '1234');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_books_category` (`category_id`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `fk_books_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
