-- phpMyAdmin SQL Dump
-- version 3.3.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 19, 2011 at 08:36 AM
-- Server version: 5.1.54
-- PHP Version: 5.3.5-1ubuntu7.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `leonarte`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Pintura'),
(2, 'Escultura'),
(3, 'Piedras');

-- --------------------------------------------------------

--
-- Table structure for table `creations`
--

CREATE TABLE IF NOT EXISTS `creations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `specifications` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `creations`
--

INSERT INTO `creations` (`id`, `title`, `specifications`) VALUES
(1, 'Esperanza', 'Técnica mixta / 2000'),
(2, 'Juntos', 'Acuarela / 33 x 39 cm / 2002'),
(3, 'Juntos... siete años despues', 'Acrílico sobre canva / 46 x 60 cm / 2009'),
(4, 'Unión vital', 'Acrílico / 42 x 52 cm / 2002'),
(5, 'Reddish', 'Acrílico / 44.5 x 52 cm / 2002'),
(6, 'Cíclope', 'Técnica mixta / 51 x 61 cm / 2002'),
(7, 'Raíces', 'Acrílico / 42 x 52 cm / 2002'),
(8, 'Visualización', 'Acuarela / 25 x 18.5 cm / 2002'),
(9, 'Depressed', 'Acrílico y prismacolor / 48 x 58.5 cm / 2004'),
(10, 'La visión', 'Acrílico sobre canva / 103 x 79 cm / 2006'),
(11, 'Esquizofrenia', 'Acrílico / 43 x 52 cm / 2006'),
(12, 'Beso de piquito', 'Acrílico sobre canva / 60 x 60 cm / 2008'),
(13, 'Besucona', 'Acrílico sobre canva / 60 x 60 cm / 2009'),
(14, 'Caos', 'Grafito / 34 x 29 cm / 2009'),
(15, 'Emoción jícarandosa', 'Jícara de base, papel, alambre, vendas de yeso, pegamento, pintura acrílica / 18 x 20 x 22cm / 2009'),
(16, 'Estresado', 'Papel, alambre, goma epóxica ready mix, pintura acrílica / 36 x 15 x 27cm / 2003'),
(17, 'Moon lovers', 'Papel, alambre, metal, ready mix, madera, pintura acrílica / 35 x 21.5 x 32 cm / 2007'),
(18, 'Boca Compartida', 'Acrílico sobre piedra / 2009'),
(19, 'Bocotas', 'Acrílico sobre piedra / 2009'),
(20, 'Buho', 'Acrílico sobre piedra / 2009'),
(21, 'Comepecado', 'Acrílico sobre piedra / 2009'),
(22, 'Metamorfosis', 'Acrílico sobre piedra / 2009'),
(23, 'Monarca', 'Acrílico sobre piedra / 2009'),
(24, 'Sonriente', 'Acrílico sobre piedra / 2009'),
(25, 'Aquamarine', 'Acrílico sobre piedra / 2009'),
(26, 'Bluemoon', 'Acrílico sobre piedra / 2009'),
(27, 'Dos caras', 'Acrílico sobre piedra / 2009'),
(28, 'Dos sexos', 'Acrílico sobre piedra / 2009'),
(29, 'El sacrificio', 'Acrílico sobre piedra / 2009'),
(30, 'Frankenstone', 'Acrílico sobre piedra / 2009'),
(31, 'Pareja', 'Acrílico sobre piedra / 2009'),
(32, 'Rosa masculino', 'Acrílico sobre piedra / 2009'),
(33, 'Sexy girl', 'Acrílico sobre piedra / 2009'),
(34, 'Sin título', 'Acrílico sobre piedra / 2009'),
(35, 'Sweetheart', 'Acrílico sobre piedra / 2009');

-- --------------------------------------------------------

--
-- Table structure for table `creation_categories`
--

CREATE TABLE IF NOT EXISTS `creation_categories` (
  `creation_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`creation_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creation_categories`
--

INSERT INTO `creation_categories` (`creation_id`, `category_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 2),
(16, 2),
(17, 2),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3);

-- --------------------------------------------------------

--
-- Table structure for table `creation_images`
--

CREATE TABLE IF NOT EXISTS `creation_images` (
  `creation_id` int(10) unsigned NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`creation_id`,`image_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creation_images`
--

INSERT INTO `creation_images` (`creation_id`, `image_id`) VALUES
(12, 1),
(13, 2),
(14, 3),
(6, 4),
(9, 5),
(1, 6),
(11, 7),
(2, 8),
(3, 9),
(10, 10),
(7, 11),
(5, 12),
(4, 13),
(8, 14),
(17, 15),
(17, 16),
(17, 17),
(17, 18),
(17, 19),
(17, 20),
(15, 21),
(15, 22),
(15, 23),
(15, 24),
(16, 25),
(16, 26),
(16, 27),
(16, 28),
(16, 29),
(17, 30),
(18, 31),
(19, 32),
(20, 33),
(21, 34),
(22, 35),
(23, 36),
(24, 37),
(25, 38),
(26, 39),
(27, 40),
(28, 41),
(29, 42),
(30, 43),
(31, 44),
(32, 45),
(33, 46),
(34, 47),
(35, 48);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_filename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `original_filename`) VALUES
(1, '1_Beso_de_piquito.jpg'),
(2, '2_Besucona.jpg'),
(3, '4_Caos.jpg'),
(4, 'ciclope2.jpg'),
(5, 'depressed2.jpg'),
(6, 'esperanza.jpg'),
(7, 'esquizofrenia2.jpg'),
(8, 'juntos1.jpg'),
(9, 'juntos_siete_a_os_despues.jpg'),
(10, 'la_vision.jpg'),
(11, 'raices2.jpg'),
(12, 'reddish2.jpg'),
(13, 'union_vital2.jpg'),
(14, 'visualizacion.jpg'),
(15, 'Moon_lovers_1.jpg'),
(16, 'Moon_lovers_2.jpg'),
(17, 'Moon_lovers_3.jpg'),
(18, 'Moon_lovers_4.jpg'),
(19, 'Moon_lovers_6.jpg'),
(20, 'Moon_lovers_7.jpg'),
(21, 'emocion_jicarandosa_3.jpg'),
(22, 'emocion_jicarandosa1.jpg'),
(23, 'emocion_jicarandosa2.jpg'),
(24, 'emocion_jicarandosa4.jpg'),
(25, 'estresado_1.jpg'),
(26, 'estresado_2.jpg'),
(27, 'estresado_3.jpg'),
(28, 'estresado_4.jpg'),
(29, 'estresado_5.jpg'),
(30, 'moon_lovers_5.jpg'),
(31, 'Boca_compartida.jpg'),
(32, 'Bocotas.jpg'),
(33, 'Buho.jpg'),
(34, 'Comepecado.jpg'),
(35, 'Metamorfosis.jpg'),
(36, 'Monarca.jpg'),
(37, 'Sonriente.jpg'),
(38, 'aquamarine.jpg'),
(39, 'bluemoon.jpg'),
(40, 'dos_caras.jpg'),
(41, 'dos_sexos.jpg'),
(42, 'el_sacrificio.jpg'),
(43, 'frankenstone.jpg'),
(44, 'pareja.jpg'),
(45, 'rosa_masculino.jpg'),
(46, 'sexy_girl.jpg'),
(47, 'sin_titulo.jpg'),
(48, 'sweetheart.jpg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creation_categories`
--
ALTER TABLE `creation_categories`
  ADD CONSTRAINT `creation_categories_ibfk_1` FOREIGN KEY (`creation_id`) REFERENCES `creations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creation_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creation_images`
--
ALTER TABLE `creation_images`
  ADD CONSTRAINT `creation_images_ibfk_1` FOREIGN KEY (`creation_id`) REFERENCES `creations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `creation_images_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
