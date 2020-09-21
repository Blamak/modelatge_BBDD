-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2020 a las 12:30:19
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `culampolla`
--
CREATE DATABASE IF NOT EXISTS `culampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `culampolla`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `direccio` varchar(254) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `data_registre` timestamp NULL DEFAULT current_timestamp(),
  `recomanat_per` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom`, `direccio`, `telefon`, `email`, `data_registre`, `recomanat_per`) VALUES
(1, 'Aretha', 'Respect St. 25 55444 SF', '01999887455', 'rescueme@arms.hold', '2020-09-21 09:55:33', NULL),
(2, 'Etta', 'Ratherbe St. 25 122545 LA', '01669845', 'radabiblaind@james.so', '2020-09-21 09:57:30', 1),
(3, 'Nina', 'Feelingood 15 25515 Tryon, North Carolina', '015554899654', 'sinnerman@spell.you', '2020-09-21 10:01:56', 2),
(4, 'Lady Day', 'Holiday 87 38915 Philly', '017522314', 'strange@fruit.com', '2020-09-21 10:04:22', 3),
(5, 'Amy', 'Norehab 151 157315 London', '004417522314', 'blacktoblack@wineho.use', '2020-09-21 10:07:16', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marques`
--

CREATE TABLE `marques` (
  `nom` varchar(20) NOT NULL,
  `proveidor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marques`
--

INSERT INTO `marques` (`nom`, `proveidor_id`) VALUES
('Calbo & Clay', 1),
('Vos Sos Hugo', 1),
('Acunove', 2),
('Cure Vision', 2),
('Oucli', 3),
('Rall Van', 3),
('Gimmy Two', 4),
('Gucci Luz', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidors`
--

CREATE TABLE `proveidors` (
  `id_proveidor` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `carrer` varchar(80) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `pis` int(11) DEFAULT NULL,
  `porta` varchar(5) DEFAULT NULL,
  `ciutat` varchar(20) NOT NULL,
  `codi_postal` char(6) DEFAULT NULL,
  `pais` varchar(20) NOT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `nif` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidors`
--

INSERT INTO `proveidors` (`id_proveidor`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES
(1, 'Aquaman Gluglu', 'Bajoelmar', NULL, NULL, NULL, 'Atlantis', NULL, 'Seven Kingdoms', NULL, NULL, '1111119'),
(2, 'Rompetechos S.L.', 'Lorompoto', 9, 9, 'B', 'Barcelona', '08025', 'Españistan', '99999999', '9999999', '45611194D'),
(3, 'Okulus Prime', 'Autobot', 55, 5, NULL, 'Detroit', '10005', 'USA', '555889977', '555996644', 'AD456756565'),
(4, 'Grace Hopper Ltd.', 'Cobolian', 54, 9, 'R', 'New York City', '17355', 'USA', '10101010', '10101010', 'LT456444');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ullera` int(11) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `graduacio_esquerra` double DEFAULT NULL,
  `graduacio_dreta` double DEFAULT NULL,
  `muntura` set('FLOTANT','PASTA','METALICA','') NOT NULL,
  `color_muntura` set('negre','blau','vermell','groc','marro','blanc','') NOT NULL,
  `color_vidre_esq` set('negre','blau','vermell','groc','marro','blanc','') NOT NULL,
  `color_vidre_dret` set('negre','blau','vermell','groc','marro','blanc','') NOT NULL,
  `preu` double NOT NULL,
  `empleat` varchar(10) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ullera`, `marca`, `graduacio_esquerra`, `graduacio_dreta`, `muntura`, `color_muntura`, `color_vidre_esq`, `color_vidre_dret`, `preu`, `empleat`, `client_id`) VALUES
(1, 'Oucli', 1.5, 1.8, 'FLOTANT', 'negre', 'blau', 'vermell', 250, 'Jimmy', 4),
(2, 'Gimmy Two', 4, 3.1, 'METALICA', 'marro', 'groc', 'groc', 300.99, 'Jimmy', 5),
(3, 'Cure Vision', 8.9, 9.78, 'METALICA', 'negre', 'negre', 'negre', 1250, 'John', 4),
(4, 'Rall Van', NULL, NULL, 'PASTA', 'marro', 'groc', 'blanc', 150, 'John Paul', 1),
(5, 'Gucci Luz', 2.1, 1.2, 'METALICA', 'vermell', 'vermell', 'vermell', 450, 'John Paul', 2),
(6, 'Acunove', 0, 0, 'METALICA', 'blanc', 'vermell', 'blau', 321, 'Robert', 3),
(7, 'Vos Sos Hugo', 5, 5, 'FLOTANT', 'blau', 'blanc', 'marro', 59.78, 'Robert', 1),
(20, 'Calbo & Clay', 0, 0, 'PASTA', 'negre', 'blanc', 'blanc', 324, 'John', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `marques`
--
ALTER TABLE `marques`
  ADD PRIMARY KEY (`nom`),
  ADD KEY `marques_ibfk_1` (`proveidor_id`);

--
-- Indices de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `nif` (`nif`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ullera`),
  ADD KEY `ulleres_ibfk_1` (`client_id`),
  ADD KEY `ulleres_ibfk_2` (`marca`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveidors`
--
ALTER TABLE `proveidors`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ullera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `marques`
--
ALTER TABLE `marques`
  ADD CONSTRAINT `marques_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidors` (`id_proveidor`) ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`marca`) REFERENCES `marques` (`nom`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
