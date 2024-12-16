-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2024 a las 19:55:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `medicina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `observacion` varchar(250) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id`, `fecha`, `hora`, `id_paciente`, `id_doctor`, `id_especialidad`, `observacion`, `estado`, `fecha_registro`) VALUES
(13, '2024-12-02', '20:00:00', 13, 6, 8, 'Ado', 2, '2024-12-02 18:59:06'),
(14, '2024-12-02', '18:00:00', 975, 7, 5, 'CANSADO', 2, '2024-12-02 19:14:01'),
(15, '2024-12-12', '18:00:00', 14, 6, 8, 'hola', 2, '2024-12-02 20:48:17'),
(17, '2024-12-02', '19:00:00', 17, 10, 9, 'CANSADO', 1, '2024-12-02 21:11:48');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `cedula` int(50) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `correo` varchar(50) NOT NULL DEFAULT current_timestamp(),
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`id`, `cedula`, `nombres`, `id_especialidad`, `sexo`, `telefono`, `fecha`, `correo`, `fecha_registro`) VALUES
(6, 101, 'Alex Castillo Cervantes', 8, 'Masculino', '99111656701', '2022-09-05', 'mugarte5672@gmail.com.mx', '2022-09-05 15:56:14'),
(7, 8, 'Emmanuel Mugarte', 5, 'Masculino', '99111656701', '2023-08-19', 'lex@hotmail.com', '2023-08-19 14:54:13'),
(9, 57, 'Kelly Castillo Cervantes', 6, 'Masculino', '99111656701', '2023-08-19', 'lex@hotmail.com', '2023-08-19 14:58:13'),
(10, 241345, 'Solano', 9, 'Masculino', '985545142', '2003-02-20', 'solano@gmail.com', '2024-12-02 21:10:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`, `fecha`) VALUES
(1, 'Odontología general', '2022-08-25 01:20:04'),
(5, 'Cirugía oral y maxilofacial 1', '2022-08-25 01:51:36'),
(6, 'Endodoncia', '2022-08-25 01:51:51'),
(7, 'Odontología estética', '2022-08-25 06:11:51'),
(8, 'Odontopediatría', '2022-08-25 16:46:32'),
(9, 'Patólogo ora', '2023-08-19 15:20:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`id`, `estado`) VALUES
(1, 'Atendido'),
(2, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL,
  `dias` varchar(50) NOT NULL,
  `id_doctor` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `dias`, `id_doctor`, `fecha`) VALUES
(1, 'Lunes, Jueves, Sabado', 6, '2022-08-25 06:02:19'),
(4, 'Domingos, Lunes, Viernes', 7, '2022-08-25 16:44:49'),
(5, 'Miercoles', 9, '2023-08-19 15:22:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `antecedentes` text DEFAULT NULL,
  `enfermedades` text DEFAULT NULL,
  `sexo` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  `estado` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `antecedentes`, `enfermedades`, `sexo`, `correo`, `telefono`, `fecha`, `estado`, `estado_id`) VALUES
(6, 'Johan', NULL, NULL, 'Masculino', 'usuario@gmail.com', '773', '2022-08-25 14:47:15', 2, NULL),
(7, 'Francisco', NULL, NULL, 'Masculino', 'yomero@gmail.com', '78637832', '2022-08-25 16:48:03', 1, NULL),
(8, 'Juan', NULL, NULL, 'Masculino', 'Usuario@gmail.com', '1654684', '2022-08-27 13:33:30', 2, NULL),
(9, 'Ernesto Cruz', NULL, NULL, 'Masculino', 'ernesto24@gmail.com', '99111656701', '2022-08-29 16:10:09', 2, NULL),
(10, 'usuario', NULL, NULL, 'Masculino', 'campos12@gmail.com', '99111656701', '2023-08-19 15:19:49', 2, NULL),
(13, 'Mario Cruz González', NULL, NULL, 'Masculino', 'mario.cruzgonzález@gmail.com', '986419945', '2024-10-18 12:08:17', 2, NULL),
(14, 'Miguel Ramírez Pérez', NULL, NULL, 'Masculino', 'miguel.ramírezpérez@yahoo.com', '910912346', '2024-10-18 12:08:17', 1, NULL),
(15, 'Mónica Hernández Cruz', NULL, NULL, 'Femenino', 'mónica.hernándezcruz@hotmail.com', '946411833', '2024-10-18 12:08:17', 1, NULL),
(16, 'Mario Sánchez Ramírez', NULL, NULL, 'Masculino', 'mario.sánchezramírez@hotmail.com', '913273270', '2024-10-18 12:08:17', 1, NULL),
(17, 'Luis Rodríguez Cruz', NULL, NULL, 'Masculino', 'luis.rodríguezcruz@gmail.com', '953711228', '2024-10-18 12:08:17', 2, NULL),
(18, 'José Pérez Pérez', NULL, NULL, 'Masculino', 'josé.pérezpérez@outlook.com', '934769525', '2024-10-18 12:08:17', 2, NULL),
(19, 'Daniel Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'daniel.rodríguezrodríguez@hotmail.com', '977706507', '2024-10-18 12:08:17', 2, NULL),
(20, 'Ana Hernández López', NULL, NULL, 'Femenino', 'ana.hernándezlópez@gmail.com', '930385284', '2024-10-18 12:08:17', 1, NULL),
(21, 'Luis González Ramírez', NULL, NULL, 'Masculino', 'luis.gonzálezramírez@outlook.com', '976270438', '2024-10-18 12:08:17', 2, NULL),
(22, 'Carmen González Ramírez', NULL, NULL, 'Femenino', 'carmen.gonzálezramírez@outlook.com', '946278116', '2024-10-18 12:08:17', 2, NULL),
(23, 'Ana Rodríguez Pérez', NULL, NULL, 'Femenino', 'ana.rodríguezpérez@yahoo.com', '911785604', '2024-10-18 12:08:18', 2, NULL),
(24, 'Daniel Sánchez Sánchez', NULL, NULL, 'Masculino', 'daniel.sánchezsánchez@yahoo.com', '938181007', '2024-10-18 12:08:18', 1, NULL),
(25, 'Daniel Sánchez González', NULL, NULL, 'Masculino', 'daniel.sánchezgonzález@gmail.com', '944598703', '2024-10-18 12:08:18', 2, NULL),
(26, 'Eduardo Cruz Cruz', NULL, NULL, 'Masculino', 'eduardo.cruzcruz@outlook.com', '930501992', '2024-10-18 12:08:18', 1, NULL),
(27, 'Carmen Cruz Cruz', NULL, NULL, 'Femenino', 'carmen.cruzcruz@hotmail.com', '917311981', '2024-10-18 12:08:18', 1, NULL),
(28, 'Mónica Sánchez Hernández', NULL, NULL, 'Femenino', 'mónica.sánchezhernández@outlook.com', '994520058', '2024-10-18 12:08:18', 1, NULL),
(29, 'Roberto Cruz Sánchez', NULL, NULL, 'Masculino', 'roberto.cruzsánchez@hotmail.com', '944715493', '2024-10-18 12:08:18', 1, NULL),
(30, 'Elena Cruz Rodríguez', NULL, NULL, 'Femenino', 'elena.cruzrodríguez@gmail.com', '943906670', '2024-10-18 12:08:18', 1, NULL),
(31, 'Rosa Cruz Ramírez', NULL, NULL, 'Femenino', 'rosa.cruzramírez@hotmail.com', '945886685', '2024-10-18 12:08:18', 1, NULL),
(32, 'Roberto Rodríguez Ramírez', NULL, NULL, 'Masculino', 'roberto.rodríguezramírez@hotmail.com', '972486323', '2024-10-18 12:08:18', 2, NULL),
(33, 'Mario Martínez Rodríguez', NULL, NULL, 'Masculino', 'mario.martínezrodríguez@outlook.com', '989359314', '2024-10-18 12:08:18', 2, NULL),
(34, 'Carmen Rodríguez Rodríguez', NULL, NULL, 'Femenino', 'carmen.rodríguezrodríguez@gmail.com', '913877170', '2024-10-18 12:08:18', 1, NULL),
(35, 'Daniel Rodríguez Pérez', NULL, NULL, 'Masculino', 'daniel.rodríguezpérez@yahoo.com', '970557697', '2024-10-18 12:08:18', 2, NULL),
(36, 'Jorge García González', NULL, NULL, 'Masculino', 'jorge.garcíagonzález@gmail.com', '943834221', '2024-10-18 12:08:18', 2, NULL),
(37, 'Patricia Martínez Cruz', NULL, NULL, 'Femenino', 'patricia.martínezcruz@hotmail.com', '913674201', '2024-10-18 12:08:18', 1, NULL),
(38, 'Eduardo Pérez Ramírez', NULL, NULL, 'Masculino', 'eduardo.pérezramírez@outlook.com', '928120248', '2024-10-18 12:08:18', 1, NULL),
(39, 'Ana Ramírez Pérez', NULL, NULL, 'Femenino', 'ana.ramírezpérez@yahoo.com', '947138524', '2024-10-18 12:08:18', 1, NULL),
(40, 'Juan Hernández García', NULL, NULL, 'Masculino', 'juan.hernándezgarcía@gmail.com', '943292502', '2024-10-18 12:08:18', 2, NULL),
(41, 'Jorge Pérez Pérez', NULL, NULL, 'Masculino', 'jorge.pérezpérez@hotmail.com', '971171869', '2024-10-18 12:08:18', 1, NULL),
(42, 'Miguel Ramírez Hernández', NULL, NULL, 'Masculino', 'miguel.ramírezhernández@hotmail.com', '984674929', '2024-10-18 12:08:18', 2, NULL),
(43, 'Eduardo González López', NULL, NULL, 'Masculino', 'eduardo.gonzálezlópez@yahoo.com', '928864270', '2024-10-18 12:08:18', 2, NULL),
(44, 'Ana Ramírez García', NULL, NULL, 'Femenino', 'ana.ramírezgarcía@outlook.com', '983784394', '2024-10-18 12:08:18', 1, NULL),
(45, 'Eduardo Sánchez López', NULL, NULL, 'Masculino', 'eduardo.sánchezlópez@outlook.com', '970761806', '2024-10-18 12:08:18', 1, NULL),
(46, 'José Cruz Rodríguez', NULL, NULL, 'Masculino', 'josé.cruzrodríguez@yahoo.com', '912013641', '2024-10-18 12:08:18', 1, NULL),
(47, 'Rosa Pérez González', NULL, NULL, 'Femenino', 'rosa.pérezgonzález@gmail.com', '919362908', '2024-10-18 12:08:18', 2, NULL),
(48, 'Carlos Martínez Pérez', NULL, NULL, 'Masculino', 'carlos.martínezpérez@yahoo.com', '996572861', '2024-10-18 12:08:18', 2, NULL),
(49, 'Roberto López Sánchez', NULL, NULL, 'Masculino', 'roberto.lópezsánchez@yahoo.com', '922970266', '2024-10-18 12:08:18', 2, NULL),
(50, 'Eduardo Martínez Pérez', NULL, NULL, 'Masculino', 'eduardo.martínezpérez@hotmail.com', '964230992', '2024-10-18 12:08:18', 1, NULL),
(51, 'Miguel Sánchez Sánchez', NULL, NULL, 'Masculino', 'miguel.sánchezsánchez@gmail.com', '958530942', '2024-10-18 12:08:18', 2, NULL),
(52, 'Mónica Ramírez García', NULL, NULL, 'Femenino', 'mónica.ramírezgarcía@hotmail.com', '914866726', '2024-10-18 12:08:18', 2, NULL),
(53, 'Laura Cruz Cruz', NULL, NULL, 'Femenino', 'laura.cruzcruz@outlook.com', '984575661', '2024-10-18 12:08:18', 2, NULL),
(54, 'Daniel Cruz Cruz', NULL, NULL, 'Masculino', 'daniel.cruzcruz@gmail.com', '997068930', '2024-10-18 12:08:18', 1, NULL),
(55, 'Elena Pérez López', NULL, NULL, 'Femenino', 'elena.pérezlópez@hotmail.com', '959971730', '2024-10-18 12:08:18', 2, NULL),
(56, 'Rosa López González', NULL, NULL, 'Femenino', 'rosa.lópezgonzález@yahoo.com', '960001073', '2024-10-18 12:08:18', 1, NULL),
(57, 'Eduardo Hernández Cruz', NULL, NULL, 'Masculino', 'eduardo.hernándezcruz@gmail.com', '913394107', '2024-10-18 12:08:18', 1, NULL),
(58, 'Patricia Cruz Pérez', NULL, NULL, 'Femenino', 'patricia.cruzpérez@yahoo.com', '965436489', '2024-10-18 12:08:18', 2, NULL),
(59, 'Luis Sánchez López', NULL, NULL, 'Masculino', 'luis.sánchezlópez@yahoo.com', '920427265', '2024-10-18 12:08:18', 1, NULL),
(60, 'Carlos Martínez Cruz', NULL, NULL, 'Masculino', 'carlos.martínezcruz@yahoo.com', '968185498', '2024-10-18 12:08:18', 2, NULL),
(61, 'Luis González Sánchez', NULL, NULL, 'Masculino', 'luis.gonzálezsánchez@yahoo.com', '934976751', '2024-10-18 12:08:18', 1, NULL),
(62, 'Mario Martínez Cruz', NULL, NULL, 'Masculino', 'mario.martínezcruz@gmail.com', '957637482', '2024-10-18 12:08:18', 1, NULL),
(63, 'Luis González Rodríguez', NULL, NULL, 'Masculino', 'luis.gonzálezrodríguez@hotmail.com', '988463480', '2024-10-18 12:08:18', 2, NULL),
(64, 'Mónica García Hernández', NULL, NULL, 'Femenino', 'mónica.garcíahernández@hotmail.com', '918747781', '2024-10-18 12:08:18', 1, NULL),
(65, 'Elena García González', NULL, NULL, 'Femenino', 'elena.garcíagonzález@outlook.com', '935192701', '2024-10-18 12:08:18', 1, NULL),
(66, 'José Sánchez Ramírez', NULL, NULL, 'Masculino', 'josé.sánchezramírez@gmail.com', '982368729', '2024-10-18 12:08:18', 1, NULL),
(67, 'Eduardo Hernández Cruz', NULL, NULL, 'Masculino', 'eduardo.hernándezcruz@yahoo.com', '972493081', '2024-10-18 12:08:18', 1, NULL),
(68, 'Patricia Rodríguez González', NULL, NULL, 'Femenino', 'patricia.rodríguezgonzález@outlook.com', '987467337', '2024-10-18 12:08:18', 2, NULL),
(69, 'Roberto Martínez García', NULL, NULL, 'Masculino', 'roberto.martínezgarcía@gmail.com', '934794556', '2024-10-18 12:08:18', 2, NULL),
(70, 'Luis Cruz Martínez', NULL, NULL, 'Masculino', 'luis.cruzmartínez@hotmail.com', '936060125', '2024-10-18 12:08:18', 1, NULL),
(71, 'Ana López Ramírez', NULL, NULL, 'Femenino', 'ana.lópezramírez@outlook.com', '974645960', '2024-10-18 12:08:18', 1, NULL),
(72, 'Daniel Hernández Ramírez', NULL, NULL, 'Masculino', 'daniel.hernándezramírez@outlook.com', '980773894', '2024-10-18 12:08:18', 2, NULL),
(73, 'Ana Rodríguez Ramírez', NULL, NULL, 'Femenino', 'ana.rodríguezramírez@yahoo.com', '969547868', '2024-10-18 12:08:18', 1, NULL),
(74, 'Daniel Cruz Cruz', NULL, NULL, 'Masculino', 'daniel.cruzcruz@yahoo.com', '914058334', '2024-10-18 12:08:18', 2, NULL),
(75, 'Mario López Ramírez', NULL, NULL, 'Masculino', 'mario.lópezramírez@outlook.com', '918808735', '2024-10-18 12:08:18', 2, NULL),
(76, 'Verónica López Hernández', NULL, NULL, 'Femenino', 'verónica.lópezhernández@outlook.com', '942389366', '2024-10-18 12:08:18', 2, NULL),
(77, 'Mónica García Hernández', NULL, NULL, 'Femenino', 'mónica.garcíahernández@outlook.com', '951815137', '2024-10-18 12:08:18', 2, NULL),
(78, 'María Rodríguez Pérez', NULL, NULL, 'Femenino', 'maría.rodríguezpérez@gmail.com', '940933416', '2024-10-18 12:08:18', 2, NULL),
(79, 'Laura Martínez López', NULL, NULL, 'Femenino', 'laura.martínezlópez@gmail.com', '982734701', '2024-10-18 12:08:18', 1, NULL),
(80, 'Mario González Pérez', NULL, NULL, 'Masculino', 'mario.gonzálezpérez@outlook.com', '986896193', '2024-10-18 12:08:18', 1, NULL),
(81, 'Juan López Hernández', NULL, NULL, 'Masculino', 'juan.lópezhernández@yahoo.com', '947425621', '2024-10-18 12:08:18', 2, NULL),
(82, 'José Cruz Ramírez', NULL, NULL, 'Masculino', 'josé.cruzramírez@hotmail.com', '943257832', '2024-10-18 12:08:18', 2, NULL),
(83, 'Roberto Pérez Hernández', NULL, NULL, 'Masculino', 'roberto.pérezhernández@hotmail.com', '928551378', '2024-10-18 12:08:18', 1, NULL),
(84, 'Carlos Ramírez Sánchez', NULL, NULL, 'Masculino', 'carlos.ramírezsánchez@yahoo.com', '988506158', '2024-10-18 12:08:18', 2, NULL),
(85, 'Patricia González López', NULL, NULL, 'Femenino', 'patricia.gonzálezlópez@hotmail.com', '911061289', '2024-10-18 12:08:18', 1, NULL),
(86, 'José López González', NULL, NULL, 'Masculino', 'josé.lópezgonzález@outlook.com', '977234370', '2024-10-18 12:08:18', 1, NULL),
(87, 'Carlos Martínez Cruz', NULL, NULL, 'Masculino', 'carlos.martínezcruz@outlook.com', '979369929', '2024-10-18 12:08:18', 1, NULL),
(88, 'Daniel Pérez Hernández', NULL, NULL, 'Masculino', 'daniel.pérezhernández@outlook.com', '926687934', '2024-10-18 12:08:18', 2, NULL),
(89, 'Juan Cruz Sánchez', NULL, NULL, 'Masculino', 'juan.cruzsánchez@hotmail.com', '967340578', '2024-10-18 12:08:18', 1, NULL),
(90, 'Juan Pérez Hernández', NULL, NULL, 'Masculino', 'juan.pérezhernández@outlook.com', '954409129', '2024-10-18 12:08:18', 2, NULL),
(91, 'Jorge Rodríguez Pérez', NULL, NULL, 'Masculino', 'jorge.rodríguezpérez@gmail.com', '928694592', '2024-10-18 12:08:18', 1, NULL),
(92, 'Claudia Cruz Ramírez', NULL, NULL, 'Femenino', 'claudia.cruzramírez@hotmail.com', '953758605', '2024-10-18 12:08:18', 2, NULL),
(93, 'Carlos Pérez Rodríguez', NULL, NULL, 'Masculino', 'carlos.pérezrodríguez@gmail.com', '960140147', '2024-10-18 12:08:18', 2, NULL),
(94, 'Carlos López Hernández', NULL, NULL, 'Masculino', 'carlos.lópezhernández@gmail.com', '956825119', '2024-10-18 12:08:18', 2, NULL),
(95, 'Eduardo Rodríguez González', NULL, NULL, 'Masculino', 'eduardo.rodríguezgonzález@hotmail.com', '928541738', '2024-10-18 12:08:18', 1, NULL),
(96, 'Claudia Martínez Rodríguez', NULL, NULL, 'Femenino', 'claudia.martínezrodríguez@outlook.com', '914286530', '2024-10-18 12:08:18', 1, NULL),
(97, 'Miguel García García', NULL, NULL, 'Masculino', 'miguel.garcíagarcía@gmail.com', '940945412', '2024-10-18 12:08:18', 1, NULL),
(98, 'Patricia Ramírez Sánchez', NULL, NULL, 'Femenino', 'patricia.ramírezsánchez@hotmail.com', '933989008', '2024-10-18 12:08:18', 1, NULL),
(99, 'José Martínez García', NULL, NULL, 'Masculino', 'josé.martínezgarcía@gmail.com', '989112939', '2024-10-18 12:08:18', 1, NULL),
(100, 'Roberto Sánchez Pérez', NULL, NULL, 'Masculino', 'roberto.sánchezpérez@outlook.com', '968421748', '2024-10-18 12:08:18', 1, NULL),
(101, 'Claudia García Hernández', NULL, NULL, 'Femenino', 'claudia.garcíahernández@yahoo.com', '977296894', '2024-10-18 12:08:18', 1, NULL),
(102, 'Mónica González Hernández', NULL, NULL, 'Femenino', 'mónica.gonzálezhernández@hotmail.com', '929637861', '2024-10-18 12:08:18', 2, NULL),
(103, 'María García Cruz', NULL, NULL, 'Femenino', 'maría.garcíacruz@outlook.com', '967172099', '2024-10-18 12:08:18', 2, NULL),
(104, 'Rosa González Cruz', NULL, NULL, 'Femenino', 'rosa.gonzálezcruz@outlook.com', '923327188', '2024-10-18 12:08:18', 2, NULL),
(105, 'Carmen García García', NULL, NULL, 'Femenino', 'carmen.garcíagarcía@hotmail.com', '934415337', '2024-10-18 12:08:18', 1, NULL),
(106, 'Daniel López López', NULL, NULL, 'Masculino', 'daniel.lópezlópez@gmail.com', '980995526', '2024-10-18 12:08:18', 1, NULL),
(107, 'Daniel Rodríguez García', NULL, NULL, 'Masculino', 'daniel.rodríguezgarcía@yahoo.com', '914304283', '2024-10-18 12:08:18', 1, NULL),
(108, 'Verónica Cruz Ramírez', NULL, NULL, 'Femenino', 'verónica.cruzramírez@yahoo.com', '924829370', '2024-10-18 12:08:18', 2, NULL),
(109, 'Miguel Cruz Martínez', NULL, NULL, 'Masculino', 'miguel.cruzmartínez@hotmail.com', '924095984', '2024-10-18 12:08:18', 2, NULL),
(110, 'Jorge Pérez Ramírez', NULL, NULL, 'Masculino', 'jorge.pérezramírez@yahoo.com', '957140660', '2024-10-18 12:08:18', 2, NULL),
(111, 'Miguel López Ramírez', NULL, NULL, 'Masculino', 'miguel.lópezramírez@outlook.com', '936454219', '2024-10-18 12:08:18', 2, NULL),
(112, 'Mario Sánchez Martínez', NULL, NULL, 'Masculino', 'mario.sánchezmartínez@outlook.com', '990379331', '2024-10-18 12:08:18', 2, NULL),
(113, 'Verónica González González', NULL, NULL, 'Femenino', 'verónica.gonzálezgonzález@gmail.com', '952353646', '2024-10-18 12:08:18', 2, NULL),
(114, 'Verónica Ramírez López', NULL, NULL, 'Femenino', 'verónica.ramírezlópez@gmail.com', '911244488', '2024-10-18 12:08:18', 1, NULL),
(115, 'Laura Hernández Hernández', NULL, NULL, 'Femenino', 'laura.hernándezhernández@yahoo.com', '933661720', '2024-10-18 12:08:18', 2, NULL),
(116, 'Mónica González García', NULL, NULL, 'Femenino', 'mónica.gonzálezgarcía@gmail.com', '970319474', '2024-10-18 12:08:18', 1, NULL),
(117, 'Laura Cruz López', NULL, NULL, 'Femenino', 'laura.cruzlópez@outlook.com', '988951351', '2024-10-18 12:08:18', 2, NULL),
(118, 'María Rodríguez Ramírez', NULL, NULL, 'Femenino', 'maría.rodríguezramírez@outlook.com', '997536220', '2024-10-18 12:08:18', 2, NULL),
(119, 'Mónica Martínez Ramírez', NULL, NULL, 'Femenino', 'mónica.martínezramírez@outlook.com', '995307648', '2024-10-18 12:08:18', 2, NULL),
(120, 'María Hernández García', NULL, NULL, 'Femenino', 'maría.hernándezgarcía@yahoo.com', '976796518', '2024-10-18 12:08:18', 2, NULL),
(121, 'Mario Hernández García', NULL, NULL, 'Masculino', 'mario.hernándezgarcía@hotmail.com', '977060651', '2024-10-18 12:08:18', 1, NULL),
(122, 'José García Cruz', NULL, NULL, 'Masculino', 'josé.garcíacruz@gmail.com', '918887036', '2024-10-18 12:08:18', 1, NULL),
(123, 'José Cruz González', NULL, NULL, 'Masculino', 'josé.cruzgonzález@hotmail.com', '922207213', '2024-10-18 12:08:18', 1, NULL),
(124, 'Laura Pérez Rodríguez', NULL, NULL, 'Femenino', 'laura.pérezrodríguez@gmail.com', '956277644', '2024-10-18 12:08:18', 2, NULL),
(125, 'Daniel López Cruz', NULL, NULL, 'Masculino', 'daniel.lópezcruz@yahoo.com', '944161783', '2024-10-18 12:08:18', 1, NULL),
(126, 'Verónica Hernández Cruz', NULL, NULL, 'Femenino', 'verónica.hernándezcruz@hotmail.com', '910598339', '2024-10-18 12:08:18', 2, NULL),
(127, 'Elena Martínez Rodríguez', NULL, NULL, 'Femenino', 'elena.martínezrodríguez@yahoo.com', '924900152', '2024-10-18 12:08:18', 2, NULL),
(128, 'Patricia Ramírez Martínez', NULL, NULL, 'Femenino', 'patricia.ramírezmartínez@yahoo.com', '976509764', '2024-10-18 12:08:18', 1, NULL),
(129, 'Jorge Hernández Ramírez', NULL, NULL, 'Masculino', 'jorge.hernándezramírez@outlook.com', '968475762', '2024-10-18 12:08:18', 2, NULL),
(130, 'Miguel López Ramírez', NULL, NULL, 'Masculino', 'miguel.lópezramírez@hotmail.com', '934734674', '2024-10-18 12:08:18', 2, NULL),
(131, 'Daniel Hernández Ramírez', NULL, NULL, 'Masculino', 'daniel.hernándezramírez@yahoo.com', '919548028', '2024-10-18 12:08:18', 2, NULL),
(132, 'Jorge Pérez García', NULL, NULL, 'Masculino', 'jorge.pérezgarcía@yahoo.com', '942389254', '2024-10-18 12:08:18', 1, NULL),
(133, 'Mónica Ramírez Sánchez', NULL, NULL, 'Femenino', 'mónica.ramírezsánchez@outlook.com', '963967514', '2024-10-18 12:08:18', 1, NULL),
(134, 'Verónica Hernández Rodríguez', NULL, NULL, 'Femenino', 'verónica.hernándezrodríguez@outlook.com', '960091418', '2024-10-18 12:08:18', 2, NULL),
(135, 'Mónica García García', NULL, NULL, 'Femenino', 'mónica.garcíagarcía@yahoo.com', '974972338', '2024-10-18 12:08:18', 2, NULL),
(136, 'Miguel Sánchez Pérez', NULL, NULL, 'Masculino', 'miguel.sánchezpérez@gmail.com', '964967371', '2024-10-18 12:08:18', 1, NULL),
(137, 'Elena Cruz Rodríguez', NULL, NULL, 'Femenino', 'elena.cruzrodríguez@gmail.com', '983019865', '2024-10-18 12:08:18', 1, NULL),
(138, 'Rosa Cruz Ramírez', NULL, NULL, 'Femenino', 'rosa.cruzramírez@gmail.com', '926279418', '2024-10-18 12:08:18', 2, NULL),
(139, 'Mario Cruz González', NULL, NULL, 'Masculino', 'mario.cruzgonzález@gmail.com', '936170378', '2024-10-18 12:08:18', 1, NULL),
(140, 'Luis Ramírez López', NULL, NULL, 'Masculino', 'luis.ramírezlópez@gmail.com', '934050123', '2024-10-18 12:08:18', 2, NULL),
(141, 'Eduardo Hernández Pérez', NULL, NULL, 'Masculino', 'eduardo.hernándezpérez@gmail.com', '988195908', '2024-10-18 12:08:18', 2, NULL),
(142, 'Miguel Martínez Sánchez', NULL, NULL, 'Masculino', 'miguel.martínezsánchez@outlook.com', '921856150', '2024-10-18 12:08:18', 1, NULL),
(143, 'María Martínez Pérez', NULL, NULL, 'Femenino', 'maría.martínezpérez@outlook.com', '927408643', '2024-10-18 12:08:18', 1, NULL),
(144, 'Rosa Hernández Cruz', NULL, NULL, 'Femenino', 'rosa.hernándezcruz@hotmail.com', '985450040', '2024-10-18 12:08:18', 2, NULL),
(145, 'Juan Cruz González', NULL, NULL, 'Masculino', 'juan.cruzgonzález@yahoo.com', '943182040', '2024-10-18 12:08:18', 1, NULL),
(146, 'María Rodríguez Martínez', NULL, NULL, 'Femenino', 'maría.rodríguezmartínez@gmail.com', '987242887', '2024-10-18 12:08:18', 1, NULL),
(147, 'Mónica Rodríguez García', NULL, NULL, 'Femenino', 'mónica.rodríguezgarcía@yahoo.com', '980697801', '2024-10-18 12:08:18', 1, NULL),
(148, 'Carlos Pérez Cruz', NULL, NULL, 'Masculino', 'carlos.pérezcruz@gmail.com', '934685653', '2024-10-18 12:08:18', 2, NULL),
(149, 'Juan Rodríguez García', NULL, NULL, 'Masculino', 'juan.rodríguezgarcía@hotmail.com', '970299002', '2024-10-18 12:08:18', 1, NULL),
(150, 'Rosa Ramírez Rodríguez', NULL, NULL, 'Femenino', 'rosa.ramírezrodríguez@gmail.com', '923853145', '2024-10-18 12:08:18', 2, NULL),
(151, 'Rosa Hernández Sánchez', NULL, NULL, 'Femenino', 'rosa.hernándezsánchez@yahoo.com', '916137097', '2024-10-18 12:08:18', 1, NULL),
(152, 'Luis Hernández Martínez', NULL, NULL, 'Masculino', 'luis.hernándezmartínez@yahoo.com', '985389208', '2024-10-18 12:08:18', 1, NULL),
(153, 'Luis Martínez López', NULL, NULL, 'Masculino', 'luis.martínezlópez@yahoo.com', '910627853', '2024-10-18 12:08:18', 1, NULL),
(154, 'Eduardo Sánchez González', NULL, NULL, 'Masculino', 'eduardo.sánchezgonzález@hotmail.com', '946186796', '2024-10-18 12:08:18', 1, NULL),
(155, 'Laura Martínez García', NULL, NULL, 'Femenino', 'laura.martínezgarcía@outlook.com', '948733133', '2024-10-18 12:08:18', 2, NULL),
(156, 'Ana Martínez Rodríguez', NULL, NULL, 'Femenino', 'ana.martínezrodríguez@hotmail.com', '936518551', '2024-10-18 12:08:18', 1, NULL),
(157, 'Juan Sánchez Ramírez', NULL, NULL, 'Masculino', 'juan.sánchezramírez@gmail.com', '973228071', '2024-10-18 12:08:18', 1, NULL),
(158, 'Laura Ramírez González', NULL, NULL, 'Femenino', 'laura.ramírezgonzález@outlook.com', '914311892', '2024-10-18 12:08:18', 2, NULL),
(159, 'Eduardo Rodríguez Cruz', NULL, NULL, 'Masculino', 'eduardo.rodríguezcruz@yahoo.com', '991144683', '2024-10-18 12:08:18', 2, NULL),
(160, 'Roberto González Cruz', NULL, NULL, 'Masculino', 'roberto.gonzálezcruz@gmail.com', '926409030', '2024-10-18 12:08:18', 1, NULL),
(161, 'Claudia García López', NULL, NULL, 'Femenino', 'claudia.garcíalópez@hotmail.com', '924222679', '2024-10-18 12:08:18', 1, NULL),
(162, 'Laura Ramírez Martínez', NULL, NULL, 'Femenino', 'laura.ramírezmartínez@outlook.com', '941181574', '2024-10-18 12:08:18', 1, NULL),
(163, 'Daniel Hernández Rodríguez', NULL, NULL, 'Masculino', 'daniel.hernándezrodríguez@gmail.com', '932680834', '2024-10-18 12:08:18', 2, NULL),
(164, 'María García Ramírez', NULL, NULL, 'Femenino', 'maría.garcíaramírez@gmail.com', '927467003', '2024-10-18 12:08:18', 1, NULL),
(165, 'Ana Sánchez Hernández', NULL, NULL, 'Femenino', 'ana.sánchezhernández@yahoo.com', '959151713', '2024-10-18 12:08:18', 2, NULL),
(166, 'Luis Hernández Rodríguez', NULL, NULL, 'Masculino', 'luis.hernándezrodríguez@yahoo.com', '966496938', '2024-10-18 12:08:18', 2, NULL),
(167, 'Luis García López', NULL, NULL, 'Masculino', 'luis.garcíalópez@outlook.com', '922753026', '2024-10-18 12:08:18', 1, NULL),
(168, 'Mónica Rodríguez Rodríguez', NULL, NULL, 'Femenino', 'mónica.rodríguezrodríguez@yahoo.com', '996616198', '2024-10-18 12:08:18', 1, NULL),
(169, 'Luis Cruz Sánchez', NULL, NULL, 'Masculino', 'luis.cruzsánchez@hotmail.com', '929220388', '2024-10-18 12:08:18', 1, NULL),
(170, 'Rosa Hernández Ramírez', NULL, NULL, 'Femenino', 'rosa.hernándezramírez@hotmail.com', '923927584', '2024-10-18 12:08:18', 2, NULL),
(171, 'Roberto Martínez González', NULL, NULL, 'Masculino', 'roberto.martínezgonzález@hotmail.com', '960656488', '2024-10-18 12:08:18', 1, NULL),
(172, 'Miguel Rodríguez Pérez', NULL, NULL, 'Masculino', 'miguel.rodríguezpérez@yahoo.com', '951438626', '2024-10-18 12:08:18', 2, NULL),
(173, 'Rosa Pérez Hernández', NULL, NULL, 'Femenino', 'rosa.pérezhernández@hotmail.com', '993991472', '2024-10-18 12:08:18', 1, NULL),
(174, 'Daniel López Sánchez', NULL, NULL, 'Masculino', 'daniel.lópezsánchez@outlook.com', '963298185', '2024-10-18 12:08:18', 2, NULL),
(175, 'Carmen Martínez García', NULL, NULL, 'Femenino', 'carmen.martínezgarcía@yahoo.com', '959890942', '2024-10-18 12:08:18', 2, NULL),
(176, 'José López Rodríguez', NULL, NULL, 'Masculino', 'josé.lópezrodríguez@yahoo.com', '912939980', '2024-10-18 12:08:18', 2, NULL),
(177, 'Luis Cruz Ramírez', NULL, NULL, 'Masculino', 'luis.cruzramírez@hotmail.com', '938234979', '2024-10-18 12:08:18', 1, NULL),
(178, 'Laura Cruz Hernández', NULL, NULL, 'Femenino', 'laura.cruzhernández@yahoo.com', '974251505', '2024-10-18 12:08:18', 2, NULL),
(179, 'Rosa Pérez González', NULL, NULL, 'Femenino', 'rosa.pérezgonzález@hotmail.com', '996687959', '2024-10-18 12:08:18', 1, NULL),
(180, 'Jorge Sánchez Sánchez', NULL, NULL, 'Masculino', 'jorge.sánchezsánchez@yahoo.com', '939434657', '2024-10-18 12:08:18', 2, NULL),
(181, 'Verónica Rodríguez Hernández', NULL, NULL, 'Femenino', 'verónica.rodríguezhernández@yahoo.com', '948725891', '2024-10-18 12:08:18', 1, NULL),
(182, 'Patricia Ramírez Martínez', NULL, NULL, 'Femenino', 'patricia.ramírezmartínez@outlook.com', '951342963', '2024-10-18 12:08:18', 1, NULL),
(183, 'Miguel González Rodríguez', NULL, NULL, 'Masculino', 'miguel.gonzálezrodríguez@hotmail.com', '985490678', '2024-10-18 12:08:18', 1, NULL),
(184, 'Rosa Pérez Sánchez', NULL, NULL, 'Femenino', 'rosa.pérezsánchez@outlook.com', '945679148', '2024-10-18 12:08:18', 2, NULL),
(185, 'Luis Martínez López', NULL, NULL, 'Masculino', 'luis.martínezlópez@hotmail.com', '993946384', '2024-10-18 12:08:18', 1, NULL),
(186, 'Jorge Ramírez Ramírez', NULL, NULL, 'Masculino', 'jorge.ramírezramírez@gmail.com', '992969028', '2024-10-18 12:08:18', 1, NULL),
(187, 'José López Hernández', NULL, NULL, 'Masculino', 'josé.lópezhernández@outlook.com', '931420790', '2024-10-18 12:08:18', 2, NULL),
(188, 'Jorge López Rodríguez', NULL, NULL, 'Masculino', 'jorge.lópezrodríguez@gmail.com', '982576815', '2024-10-18 12:08:18', 1, NULL),
(189, 'Carmen Pérez Ramírez', NULL, NULL, 'Femenino', 'carmen.pérezramírez@gmail.com', '926849123', '2024-10-18 12:08:18', 1, NULL),
(190, 'Eduardo García López', NULL, NULL, 'Masculino', 'eduardo.garcíalópez@hotmail.com', '932082126', '2024-10-18 12:08:18', 2, NULL),
(191, 'María Cruz Ramírez', NULL, NULL, 'Femenino', 'maría.cruzramírez@hotmail.com', '992343911', '2024-10-18 12:08:18', 2, NULL),
(192, 'Rosa Rodríguez Hernández', NULL, NULL, 'Femenino', 'rosa.rodríguezhernández@hotmail.com', '965393378', '2024-10-18 12:08:18', 2, NULL),
(193, 'José Hernández Rodríguez', NULL, NULL, 'Masculino', 'josé.hernándezrodríguez@hotmail.com', '916961450', '2024-10-18 12:08:18', 1, NULL),
(194, 'Claudia Sánchez Martínez', NULL, NULL, 'Femenino', 'claudia.sánchezmartínez@yahoo.com', '911144682', '2024-10-18 12:08:18', 2, NULL),
(195, 'Roberto García Pérez', NULL, NULL, 'Masculino', 'roberto.garcíapérez@gmail.com', '935856365', '2024-10-18 12:08:18', 2, NULL),
(196, 'Rosa García González', NULL, NULL, 'Femenino', 'rosa.garcíagonzález@yahoo.com', '994170730', '2024-10-18 12:08:18', 2, NULL),
(197, 'Rosa Ramírez Pérez', NULL, NULL, 'Femenino', 'rosa.ramírezpérez@yahoo.com', '986214835', '2024-10-18 12:08:18', 2, NULL),
(198, 'Eduardo Martínez García', NULL, NULL, 'Masculino', 'eduardo.martínezgarcía@outlook.com', '993467980', '2024-10-18 12:08:18', 2, NULL),
(199, 'Carmen Cruz Ramírez', NULL, NULL, 'Femenino', 'carmen.cruzramírez@outlook.com', '968095985', '2024-10-18 12:08:18', 1, NULL),
(200, 'Rosa González García', NULL, NULL, 'Femenino', 'rosa.gonzálezgarcía@outlook.com', '974085850', '2024-10-18 12:08:18', 2, NULL),
(201, 'Patricia García González', NULL, NULL, 'Femenino', 'patricia.garcíagonzález@gmail.com', '928058437', '2024-10-18 12:08:18', 1, NULL),
(202, 'Eduardo Ramírez Rodríguez', NULL, NULL, 'Masculino', 'eduardo.ramírezrodríguez@gmail.com', '937285272', '2024-10-18 12:08:18', 2, NULL),
(203, 'Roberto López Hernández', NULL, NULL, 'Masculino', 'roberto.lópezhernández@gmail.com', '996110072', '2024-10-18 12:08:18', 1, NULL),
(204, 'Elena Rodríguez Hernández', NULL, NULL, 'Femenino', 'elena.rodríguezhernández@hotmail.com', '950976247', '2024-10-18 12:08:18', 2, NULL),
(205, 'José Sánchez Hernández', NULL, NULL, 'Masculino', 'josé.sánchezhernández@hotmail.com', '961513983', '2024-10-18 12:08:18', 2, NULL),
(206, 'Elena Ramírez González', NULL, NULL, 'Femenino', 'elena.ramírezgonzález@hotmail.com', '987469645', '2024-10-18 12:08:18', 1, NULL),
(207, 'Ana Rodríguez López', NULL, NULL, 'Femenino', 'ana.rodríguezlópez@hotmail.com', '918934415', '2024-10-18 12:08:18', 2, NULL),
(208, 'Mónica García Sánchez', NULL, NULL, 'Femenino', 'mónica.garcíasánchez@gmail.com', '986534934', '2024-10-18 12:08:18', 2, NULL),
(209, 'Ana Sánchez Martínez', NULL, NULL, 'Femenino', 'ana.sánchezmartínez@gmail.com', '952007139', '2024-10-18 12:08:18', 1, NULL),
(210, 'Luis Cruz López', NULL, NULL, 'Masculino', 'luis.cruzlópez@hotmail.com', '990660776', '2024-10-18 12:08:18', 1, NULL),
(211, 'Elena García Ramírez', NULL, NULL, 'Femenino', 'elena.garcíaramírez@gmail.com', '989120693', '2024-10-18 12:08:18', 1, NULL),
(212, 'Eduardo Hernández Ramírez', NULL, NULL, 'Masculino', 'eduardo.hernándezramírez@gmail.com', '968250577', '2024-10-18 12:08:18', 2, NULL),
(213, 'Laura González Ramírez', NULL, NULL, 'Femenino', 'laura.gonzálezramírez@outlook.com', '923110527', '2024-10-18 12:08:18', 1, NULL),
(214, 'Rosa García Hernández', NULL, NULL, 'Femenino', 'rosa.garcíahernández@hotmail.com', '928876090', '2024-10-18 12:08:18', 1, NULL),
(215, 'María González Martínez', NULL, NULL, 'Femenino', 'maría.gonzálezmartínez@yahoo.com', '961337983', '2024-10-18 12:08:18', 1, NULL),
(216, 'Juan Pérez Ramírez', NULL, NULL, 'Masculino', 'juan.pérezramírez@yahoo.com', '934939959', '2024-10-18 12:08:18', 1, NULL),
(217, 'Mario Martínez Ramírez', NULL, NULL, 'Masculino', 'mario.martínezramírez@outlook.com', '933993461', '2024-10-18 12:08:18', 1, NULL),
(218, 'Ana Rodríguez González', NULL, NULL, 'Femenino', 'ana.rodríguezgonzález@gmail.com', '997082474', '2024-10-18 12:08:18', 1, NULL),
(219, 'Claudia López Martínez', NULL, NULL, 'Femenino', 'claudia.lópezmartínez@yahoo.com', '969075501', '2024-10-18 12:08:18', 2, NULL),
(220, 'Daniel Cruz Sánchez', NULL, NULL, 'Masculino', 'daniel.cruzsánchez@outlook.com', '917004709', '2024-10-18 12:08:18', 1, NULL),
(221, 'Ana Sánchez González', NULL, NULL, 'Femenino', 'ana.sánchezgonzález@outlook.com', '983415475', '2024-10-18 12:08:18', 2, NULL),
(222, 'Roberto González Martínez', NULL, NULL, 'Masculino', 'roberto.gonzálezmartínez@outlook.com', '975569291', '2024-10-18 12:08:18', 1, NULL),
(223, 'Carlos Hernández Hernández', NULL, NULL, 'Masculino', 'carlos.hernándezhernández@outlook.com', '938623762', '2024-10-18 12:08:18', 1, NULL),
(224, 'María García García', NULL, NULL, 'Femenino', 'maría.garcíagarcía@hotmail.com', '956151455', '2024-10-18 12:08:18', 2, NULL),
(225, 'Eduardo Hernández González', NULL, NULL, 'Masculino', 'eduardo.hernándezgonzález@yahoo.com', '979844161', '2024-10-18 12:08:18', 1, NULL),
(226, 'Mario López Martínez', NULL, NULL, 'Masculino', 'mario.lópezmartínez@yahoo.com', '987887458', '2024-10-18 12:08:18', 2, NULL),
(227, 'Elena Ramírez Pérez', NULL, NULL, 'Femenino', 'elena.ramírezpérez@yahoo.com', '980490675', '2024-10-18 12:08:18', 2, NULL),
(228, 'Daniel Hernández González', NULL, NULL, 'Masculino', 'daniel.hernándezgonzález@yahoo.com', '985561083', '2024-10-18 12:08:18', 1, NULL),
(229, 'Ana Pérez Rodríguez', NULL, NULL, 'Femenino', 'ana.pérezrodríguez@yahoo.com', '994443753', '2024-10-18 12:08:18', 1, NULL),
(230, 'Verónica López Martínez', NULL, NULL, 'Femenino', 'verónica.lópezmartínez@outlook.com', '931706880', '2024-10-18 12:08:18', 2, NULL),
(231, 'Carmen Rodríguez Cruz', NULL, NULL, 'Femenino', 'carmen.rodríguezcruz@gmail.com', '977284392', '2024-10-18 12:08:18', 2, NULL),
(232, 'Elena García Rodríguez', NULL, NULL, 'Femenino', 'elena.garcíarodríguez@gmail.com', '944202098', '2024-10-18 12:08:18', 2, NULL),
(233, 'Ana Sánchez Cruz', NULL, NULL, 'Femenino', 'ana.sánchezcruz@outlook.com', '941559908', '2024-10-18 12:08:18', 2, NULL),
(234, 'Carmen González Hernández', NULL, NULL, 'Femenino', 'carmen.gonzálezhernández@hotmail.com', '987667865', '2024-10-18 12:08:18', 1, NULL),
(235, 'Laura Martínez Cruz', NULL, NULL, 'Femenino', 'laura.martínezcruz@hotmail.com', '940121908', '2024-10-18 12:08:18', 2, NULL),
(236, 'Ana Pérez González', NULL, NULL, 'Femenino', 'ana.pérezgonzález@gmail.com', '988855678', '2024-10-18 12:08:18', 1, NULL),
(237, 'Luis López Martínez', NULL, NULL, 'Masculino', 'luis.lópezmartínez@hotmail.com', '964882336', '2024-10-18 12:08:18', 2, NULL),
(238, 'Daniel Cruz Rodríguez', NULL, NULL, 'Masculino', 'daniel.cruzrodríguez@outlook.com', '916680000', '2024-10-18 12:08:18', 2, NULL),
(239, 'Claudia González Hernández', NULL, NULL, 'Femenino', 'claudia.gonzálezhernández@hotmail.com', '957595325', '2024-10-18 12:08:18', 1, NULL),
(240, 'Eduardo Rodríguez Ramírez', NULL, NULL, 'Masculino', 'eduardo.rodríguezramírez@hotmail.com', '947080216', '2024-10-18 12:08:18', 2, NULL),
(241, 'Jorge González Ramírez', NULL, NULL, 'Masculino', 'jorge.gonzálezramírez@yahoo.com', '940548832', '2024-10-18 12:08:18', 1, NULL),
(242, 'Luis Ramírez Hernández', NULL, NULL, 'Masculino', 'luis.ramírezhernández@outlook.com', '987353882', '2024-10-18 12:08:18', 2, NULL),
(243, 'Luis Hernández Martínez', NULL, NULL, 'Masculino', 'luis.hernándezmartínez@outlook.com', '920832338', '2024-10-18 12:08:18', 2, NULL),
(244, 'Elena García López', NULL, NULL, 'Femenino', 'elena.garcíalópez@gmail.com', '979871780', '2024-10-18 12:08:18', 2, NULL),
(245, 'Eduardo García García', NULL, NULL, 'Masculino', 'eduardo.garcíagarcía@yahoo.com', '930180089', '2024-10-18 12:08:18', 2, NULL),
(246, 'Luis López Ramírez', NULL, NULL, 'Masculino', 'luis.lópezramírez@outlook.com', '915210307', '2024-10-18 12:08:18', 1, NULL),
(247, 'Mónica Pérez López', NULL, NULL, 'Femenino', 'mónica.pérezlópez@hotmail.com', '918508995', '2024-10-18 12:08:18', 2, NULL),
(248, 'Luis Sánchez Hernández', NULL, NULL, 'Masculino', 'luis.sánchezhernández@gmail.com', '992767794', '2024-10-18 12:08:18', 2, NULL),
(249, 'Roberto Sánchez Pérez', NULL, NULL, 'Masculino', 'roberto.sánchezpérez@gmail.com', '925177282', '2024-10-18 12:08:18', 2, NULL),
(250, 'Miguel Cruz Martínez', NULL, NULL, 'Masculino', 'miguel.cruzmartínez@gmail.com', '971932245', '2024-10-18 12:08:18', 2, NULL),
(251, 'Carmen Hernández Pérez', NULL, NULL, 'Femenino', 'carmen.hernándezpérez@yahoo.com', '965031822', '2024-10-18 12:08:18', 2, NULL),
(252, 'Mario Ramírez Pérez', NULL, NULL, 'Masculino', 'mario.ramírezpérez@outlook.com', '989193750', '2024-10-18 12:08:18', 2, NULL),
(253, 'Carlos González Cruz', NULL, NULL, 'Masculino', 'carlos.gonzálezcruz@outlook.com', '993507578', '2024-10-18 12:08:19', 1, NULL),
(254, 'Patricia López Ramírez', NULL, NULL, 'Femenino', 'patricia.lópezramírez@hotmail.com', '944358419', '2024-10-18 12:08:19', 1, NULL),
(255, 'Juan Ramírez Sánchez', NULL, NULL, 'Masculino', 'juan.ramírezsánchez@outlook.com', '925165382', '2024-10-18 12:08:19', 1, NULL),
(256, 'Daniel Cruz González', NULL, NULL, 'Masculino', 'daniel.cruzgonzález@outlook.com', '956714653', '2024-10-18 12:08:19', 1, NULL),
(257, 'Eduardo Hernández González', NULL, NULL, 'Masculino', 'eduardo.hernándezgonzález@hotmail.com', '920777643', '2024-10-18 12:08:19', 1, NULL),
(258, 'Elena Ramírez García', NULL, NULL, 'Femenino', 'elena.ramírezgarcía@hotmail.com', '958055896', '2024-10-18 12:08:19', 1, NULL),
(259, 'Ana García Cruz', NULL, NULL, 'Femenino', 'ana.garcíacruz@outlook.com', '985602191', '2024-10-18 12:08:19', 1, NULL),
(260, 'Carmen Martínez Martínez', NULL, NULL, 'Femenino', 'carmen.martínezmartínez@gmail.com', '920607043', '2024-10-18 12:08:19', 2, NULL),
(261, 'Luis Rodríguez Martínez', NULL, NULL, 'Masculino', 'luis.rodríguezmartínez@gmail.com', '941677293', '2024-10-18 12:08:19', 1, NULL),
(262, 'Claudia Hernández Pérez', NULL, NULL, 'Femenino', 'claudia.hernándezpérez@yahoo.com', '947920809', '2024-10-18 12:08:19', 1, NULL),
(263, 'Verónica González Hernández', NULL, NULL, 'Femenino', 'verónica.gonzálezhernández@outlook.com', '960363286', '2024-10-18 12:08:19', 1, NULL),
(264, 'Elena Hernández Sánchez', NULL, NULL, 'Femenino', 'elena.hernándezsánchez@gmail.com', '991527999', '2024-10-18 12:08:19', 1, NULL),
(265, 'Luis Hernández Sánchez', NULL, NULL, 'Masculino', 'luis.hernándezsánchez@hotmail.com', '931164315', '2024-10-18 12:08:19', 1, NULL),
(266, 'Eduardo García Martínez', NULL, NULL, 'Masculino', 'eduardo.garcíamartínez@gmail.com', '922828677', '2024-10-18 12:08:19', 1, NULL),
(267, 'Daniel González Rodríguez', NULL, NULL, 'Masculino', 'daniel.gonzálezrodríguez@hotmail.com', '962029022', '2024-10-18 12:08:19', 2, NULL),
(268, 'Miguel González González', NULL, NULL, 'Masculino', 'miguel.gonzálezgonzález@outlook.com', '966549304', '2024-10-18 12:08:19', 1, NULL),
(269, 'Mónica González Ramírez', NULL, NULL, 'Femenino', 'mónica.gonzálezramírez@hotmail.com', '971546218', '2024-10-18 12:08:19', 2, NULL),
(270, 'Luis Hernández Sánchez', NULL, NULL, 'Masculino', 'luis.hernándezsánchez@gmail.com', '991349266', '2024-10-18 12:08:19', 2, NULL),
(271, 'Mónica Ramírez González', NULL, NULL, 'Femenino', 'mónica.ramírezgonzález@hotmail.com', '936547002', '2024-10-18 12:08:19', 2, NULL),
(272, 'Luis Rodríguez López', NULL, NULL, 'Masculino', 'luis.rodríguezlópez@yahoo.com', '993116703', '2024-10-18 12:08:19', 1, NULL),
(273, 'Jorge García López', NULL, NULL, 'Masculino', 'jorge.garcíalópez@outlook.com', '987414642', '2024-10-18 12:08:19', 1, NULL),
(274, 'Luis Sánchez González', NULL, NULL, 'Masculino', 'luis.sánchezgonzález@yahoo.com', '985211051', '2024-10-18 12:08:19', 1, NULL),
(275, 'Eduardo Pérez Hernández', NULL, NULL, 'Masculino', 'eduardo.pérezhernández@yahoo.com', '943110381', '2024-10-18 12:08:19', 2, NULL),
(276, 'Roberto Ramírez Ramírez', NULL, NULL, 'Masculino', 'roberto.ramírezramírez@outlook.com', '967452761', '2024-10-18 12:08:19', 1, NULL),
(277, 'Verónica Rodríguez Ramírez', NULL, NULL, 'Femenino', 'verónica.rodríguezramírez@gmail.com', '947812952', '2024-10-18 12:08:19', 1, NULL),
(278, 'Carlos López García', NULL, NULL, 'Masculino', 'carlos.lópezgarcía@yahoo.com', '997646522', '2024-10-18 12:08:19', 2, NULL),
(279, 'Mónica Sánchez Ramírez', NULL, NULL, 'Femenino', 'mónica.sánchezramírez@gmail.com', '912173310', '2024-10-18 12:08:19', 1, NULL),
(280, 'Carlos Cruz López', NULL, NULL, 'Masculino', 'carlos.cruzlópez@outlook.com', '927627884', '2024-10-18 12:08:19', 1, NULL),
(281, 'Laura Hernández González', NULL, NULL, 'Femenino', 'laura.hernándezgonzález@outlook.com', '918110835', '2024-10-18 12:08:19', 1, NULL),
(282, 'Patricia Rodríguez Sánchez', NULL, NULL, 'Femenino', 'patricia.rodríguezsánchez@outlook.com', '992880344', '2024-10-18 12:08:19', 1, NULL),
(283, 'Patricia García Cruz', NULL, NULL, 'Femenino', 'patricia.garcíacruz@outlook.com', '911947933', '2024-10-18 12:08:19', 1, NULL),
(284, 'Daniel García López', NULL, NULL, 'Masculino', 'daniel.garcíalópez@outlook.com', '961962227', '2024-10-18 12:08:19', 2, NULL),
(285, 'Luis González Sánchez', NULL, NULL, 'Masculino', 'luis.gonzálezsánchez@gmail.com', '995774244', '2024-10-18 12:08:19', 1, NULL),
(286, 'Carlos Pérez Pérez', NULL, NULL, 'Masculino', 'carlos.pérezpérez@yahoo.com', '938007320', '2024-10-18 12:08:19', 1, NULL),
(287, 'Mónica López Sánchez', NULL, NULL, 'Femenino', 'mónica.lópezsánchez@yahoo.com', '997999585', '2024-10-18 12:08:19', 1, NULL),
(288, 'María García Cruz', NULL, NULL, 'Femenino', 'maría.garcíacruz@outlook.com', '960087048', '2024-10-18 12:08:19', 2, NULL),
(289, 'Luis Sánchez Martínez', NULL, NULL, 'Masculino', 'luis.sánchezmartínez@hotmail.com', '914029144', '2024-10-18 12:08:19', 1, NULL),
(290, 'Roberto Pérez González', NULL, NULL, 'Masculino', 'roberto.pérezgonzález@outlook.com', '965553022', '2024-10-18 12:08:19', 1, NULL),
(291, 'Verónica Sánchez Rodríguez', NULL, NULL, 'Femenino', 'verónica.sánchezrodríguez@outlook.com', '997841753', '2024-10-18 12:08:19', 2, NULL),
(292, 'Mónica Sánchez González', NULL, NULL, 'Femenino', 'mónica.sánchezgonzález@gmail.com', '949990498', '2024-10-18 12:08:19', 1, NULL),
(293, 'Elena Sánchez Ramírez', NULL, NULL, 'Femenino', 'elena.sánchezramírez@yahoo.com', '926453250', '2024-10-18 12:08:19', 2, NULL),
(294, 'Juan Pérez Pérez', NULL, NULL, 'Masculino', 'juan.pérezpérez@hotmail.com', '936141439', '2024-10-18 12:08:19', 2, NULL),
(295, 'Mónica García Pérez', NULL, NULL, 'Femenino', 'mónica.garcíapérez@gmail.com', '980367769', '2024-10-18 12:08:19', 2, NULL),
(296, 'Claudia Sánchez Cruz', NULL, NULL, 'Femenino', 'claudia.sánchezcruz@hotmail.com', '952698219', '2024-10-18 12:08:19', 1, NULL),
(297, 'Juan Pérez López', NULL, NULL, 'Masculino', 'juan.pérezlópez@gmail.com', '958510273', '2024-10-18 12:08:19', 1, NULL),
(298, 'Laura López González', NULL, NULL, 'Femenino', 'laura.lópezgonzález@gmail.com', '945522932', '2024-10-18 12:08:19', 2, NULL),
(299, 'Eduardo González Cruz', NULL, NULL, 'Masculino', 'eduardo.gonzálezcruz@hotmail.com', '925067482', '2024-10-18 12:08:19', 2, NULL),
(300, 'Carlos García Cruz', NULL, NULL, 'Masculino', 'carlos.garcíacruz@hotmail.com', '944912443', '2024-10-18 12:08:19', 2, NULL),
(301, 'Claudia González Ramírez', NULL, NULL, 'Femenino', 'claudia.gonzálezramírez@yahoo.com', '912359451', '2024-10-18 12:08:19', 1, NULL),
(302, 'Mónica López Sánchez', NULL, NULL, 'Femenino', 'mónica.lópezsánchez@outlook.com', '910209996', '2024-10-18 12:08:19', 1, NULL),
(303, 'Laura Ramírez Sánchez', NULL, NULL, 'Femenino', 'laura.ramírezsánchez@outlook.com', '977732474', '2024-10-18 12:08:19', 1, NULL),
(304, 'Roberto Pérez Hernández', NULL, NULL, 'Masculino', 'roberto.pérezhernández@hotmail.com', '917396284', '2024-10-18 12:08:19', 1, NULL),
(305, 'Claudia Hernández González', NULL, NULL, 'Femenino', 'claudia.hernándezgonzález@outlook.com', '918559756', '2024-10-18 12:08:19', 1, NULL),
(306, 'Elena López Rodríguez', NULL, NULL, 'Femenino', 'elena.lópezrodríguez@yahoo.com', '961070796', '2024-10-18 12:08:19', 1, NULL),
(307, 'Claudia Rodríguez García', NULL, NULL, 'Femenino', 'claudia.rodríguezgarcía@gmail.com', '938790294', '2024-10-18 12:08:19', 2, NULL),
(308, 'Verónica Rodríguez Pérez', NULL, NULL, 'Femenino', 'verónica.rodríguezpérez@gmail.com', '954618633', '2024-10-18 12:08:19', 1, NULL),
(309, 'José Cruz Cruz', NULL, NULL, 'Masculino', 'josé.cruzcruz@hotmail.com', '959116938', '2024-10-18 12:08:19', 2, NULL),
(310, 'Juan Ramírez Cruz', NULL, NULL, 'Masculino', 'juan.ramírezcruz@outlook.com', '969874812', '2024-10-18 12:08:19', 1, NULL),
(311, 'Laura González Martínez', NULL, NULL, 'Femenino', 'laura.gonzálezmartínez@yahoo.com', '977789254', '2024-10-18 12:08:19', 2, NULL),
(312, 'Carlos Hernández Cruz', NULL, NULL, 'Masculino', 'carlos.hernándezcruz@gmail.com', '983560230', '2024-10-18 12:08:19', 1, NULL),
(313, 'Miguel Martínez García', NULL, NULL, 'Masculino', 'miguel.martínezgarcía@gmail.com', '999106632', '2024-10-18 12:08:19', 2, NULL),
(314, 'Daniel González López', NULL, NULL, 'Masculino', 'daniel.gonzálezlópez@gmail.com', '935513388', '2024-10-18 12:08:19', 2, NULL),
(315, 'María López Hernández', NULL, NULL, 'Femenino', 'maría.lópezhernández@outlook.com', '929796981', '2024-10-18 12:08:19', 2, NULL),
(316, 'José Rodríguez González', NULL, NULL, 'Masculino', 'josé.rodríguezgonzález@yahoo.com', '951819969', '2024-10-18 12:08:19', 1, NULL),
(317, 'José Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'josé.rodríguezrodríguez@hotmail.com', '960837550', '2024-10-18 12:08:19', 1, NULL),
(318, 'Ana Rodríguez Cruz', NULL, NULL, 'Femenino', 'ana.rodríguezcruz@outlook.com', '962806776', '2024-10-18 12:08:19', 2, NULL),
(319, 'Carlos Hernández Ramírez', NULL, NULL, 'Masculino', 'carlos.hernándezramírez@yahoo.com', '986230415', '2024-10-18 12:08:19', 1, NULL),
(320, 'Carmen González Sánchez', NULL, NULL, 'Femenino', 'carmen.gonzálezsánchez@hotmail.com', '939471113', '2024-10-18 12:08:19', 2, NULL),
(321, 'María Sánchez García', NULL, NULL, 'Femenino', 'maría.sánchezgarcía@outlook.com', '910735240', '2024-10-18 12:08:19', 1, NULL),
(322, 'Laura González Cruz', NULL, NULL, 'Femenino', 'laura.gonzálezcruz@gmail.com', '991267478', '2024-10-18 12:08:19', 1, NULL),
(323, 'Eduardo González Ramírez', NULL, NULL, 'Masculino', 'eduardo.gonzálezramírez@hotmail.com', '969497241', '2024-10-18 12:08:19', 2, NULL),
(324, 'Elena López Rodríguez', NULL, NULL, 'Femenino', 'elena.lópezrodríguez@gmail.com', '987131977', '2024-10-18 12:08:19', 2, NULL),
(325, 'Roberto Ramírez Sánchez', NULL, NULL, 'Masculino', 'roberto.ramírezsánchez@hotmail.com', '968515383', '2024-10-18 12:08:19', 1, NULL),
(326, 'José González Cruz', NULL, NULL, 'Masculino', 'josé.gonzálezcruz@yahoo.com', '920023961', '2024-10-18 12:08:19', 2, NULL),
(327, 'Roberto Ramírez Rodríguez', NULL, NULL, 'Masculino', 'roberto.ramírezrodríguez@hotmail.com', '946605607', '2024-10-18 12:08:19', 1, NULL),
(328, 'María Martínez Pérez', NULL, NULL, 'Femenino', 'maría.martínezpérez@gmail.com', '926646060', '2024-10-18 12:08:19', 2, NULL),
(329, 'Ana Ramírez Rodríguez', NULL, NULL, 'Femenino', 'ana.ramírezrodríguez@gmail.com', '993070472', '2024-10-18 12:08:19', 1, NULL),
(330, 'Rosa Sánchez García', NULL, NULL, 'Femenino', 'rosa.sánchezgarcía@outlook.com', '958586213', '2024-10-18 12:08:19', 1, NULL),
(331, 'Carmen Martínez Hernández', NULL, NULL, 'Femenino', 'carmen.martínezhernández@hotmail.com', '980138475', '2024-10-18 12:08:19', 2, NULL),
(332, 'Laura García Sánchez', NULL, NULL, 'Femenino', 'laura.garcíasánchez@gmail.com', '998101040', '2024-10-18 12:08:19', 2, NULL),
(333, 'Claudia Pérez Hernández', NULL, NULL, 'Femenino', 'claudia.pérezhernández@outlook.com', '953789457', '2024-10-18 12:08:19', 1, NULL),
(334, 'Patricia Rodríguez Sánchez', NULL, NULL, 'Femenino', 'patricia.rodríguezsánchez@hotmail.com', '917335433', '2024-10-18 12:08:19', 2, NULL),
(335, 'Carlos Sánchez Ramírez', NULL, NULL, 'Masculino', 'carlos.sánchezramírez@yahoo.com', '919331949', '2024-10-18 12:08:19', 2, NULL),
(336, 'Jorge Sánchez López', NULL, NULL, 'Masculino', 'jorge.sánchezlópez@hotmail.com', '926329352', '2024-10-18 12:08:19', 1, NULL),
(337, 'Verónica Cruz Hernández', NULL, NULL, 'Femenino', 'verónica.cruzhernández@gmail.com', '936544103', '2024-10-18 12:08:19', 2, NULL),
(338, 'Claudia Hernández García', NULL, NULL, 'Femenino', 'claudia.hernándezgarcía@gmail.com', '959340780', '2024-10-18 12:08:19', 1, NULL),
(339, 'Carlos Rodríguez García', NULL, NULL, 'Masculino', 'carlos.rodríguezgarcía@hotmail.com', '949982173', '2024-10-18 12:08:19', 1, NULL),
(340, 'Claudia Sánchez Rodríguez', NULL, NULL, 'Femenino', 'claudia.sánchezrodríguez@outlook.com', '954932843', '2024-10-18 12:08:19', 1, NULL),
(341, 'Carmen Sánchez Pérez', NULL, NULL, 'Femenino', 'carmen.sánchezpérez@gmail.com', '913448039', '2024-10-18 12:08:19', 2, NULL),
(342, 'Luis García Rodríguez', NULL, NULL, 'Masculino', 'luis.garcíarodríguez@hotmail.com', '953004423', '2024-10-18 12:08:19', 1, NULL),
(343, 'Roberto García González', NULL, NULL, 'Masculino', 'roberto.garcíagonzález@yahoo.com', '911054710', '2024-10-18 12:08:19', 2, NULL),
(344, 'Jorge Cruz Hernández', NULL, NULL, 'Masculino', 'jorge.cruzhernández@yahoo.com', '944973821', '2024-10-18 12:08:19', 2, NULL),
(345, 'Eduardo Hernández Hernández', NULL, NULL, 'Masculino', 'eduardo.hernándezhernández@hotmail.com', '940850183', '2024-10-18 12:08:19', 2, NULL),
(346, 'Daniel Pérez Cruz', NULL, NULL, 'Masculino', 'daniel.pérezcruz@outlook.com', '975256637', '2024-10-18 12:08:19', 1, NULL),
(347, 'Elena Martínez Rodríguez', NULL, NULL, 'Femenino', 'elena.martínezrodríguez@yahoo.com', '979828760', '2024-10-18 12:08:19', 1, NULL),
(348, 'María González Pérez', NULL, NULL, 'Femenino', 'maría.gonzálezpérez@outlook.com', '972442578', '2024-10-18 12:08:19', 1, NULL),
(349, 'Luis Martínez Cruz', NULL, NULL, 'Masculino', 'luis.martínezcruz@gmail.com', '989020359', '2024-10-18 12:08:19', 2, NULL),
(350, 'Laura Sánchez Pérez', NULL, NULL, 'Femenino', 'laura.sánchezpérez@outlook.com', '966800496', '2024-10-18 12:08:19', 2, NULL),
(351, 'Mario Rodríguez González', NULL, NULL, 'Masculino', 'mario.rodríguezgonzález@gmail.com', '924109650', '2024-10-18 12:08:19', 2, NULL),
(352, 'Jorge López Martínez', NULL, NULL, 'Masculino', 'jorge.lópezmartínez@hotmail.com', '967657462', '2024-10-18 12:08:19', 2, NULL),
(353, 'Elena Rodríguez Ramírez', NULL, NULL, 'Femenino', 'elena.rodríguezramírez@hotmail.com', '932801462', '2024-10-18 12:08:19', 2, NULL),
(354, 'Patricia González Sánchez', NULL, NULL, 'Femenino', 'patricia.gonzálezsánchez@outlook.com', '984910824', '2024-10-18 12:08:19', 1, NULL),
(355, 'Miguel López Martínez', NULL, NULL, 'Masculino', 'miguel.lópezmartínez@yahoo.com', '997994542', '2024-10-18 12:08:19', 2, NULL),
(356, 'María Martínez Rodríguez', NULL, NULL, 'Femenino', 'maría.martínezrodríguez@gmail.com', '953724705', '2024-10-18 12:08:19', 1, NULL),
(357, 'Luis Sánchez Pérez', NULL, NULL, 'Masculino', 'luis.sánchezpérez@gmail.com', '911597656', '2024-10-18 12:08:19', 2, NULL),
(358, 'Juan González González', NULL, NULL, 'Masculino', 'juan.gonzálezgonzález@gmail.com', '948884623', '2024-10-18 12:08:19', 2, NULL),
(359, 'Claudia García Martínez', NULL, NULL, 'Femenino', 'claudia.garcíamartínez@yahoo.com', '954537402', '2024-10-18 12:08:19', 1, NULL),
(360, 'Miguel Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'miguel.rodríguezrodríguez@hotmail.com', '948635211', '2024-10-18 12:08:19', 2, NULL),
(361, 'Verónica González Hernández', NULL, NULL, 'Femenino', 'verónica.gonzálezhernández@yahoo.com', '940949962', '2024-10-18 12:08:19', 2, NULL),
(362, 'Mónica Rodríguez Pérez', NULL, NULL, 'Femenino', 'mónica.rodríguezpérez@yahoo.com', '966898020', '2024-10-18 12:08:19', 2, NULL),
(363, 'Rosa Sánchez Cruz', NULL, NULL, 'Femenino', 'rosa.sánchezcruz@gmail.com', '923918858', '2024-10-18 12:08:19', 1, NULL),
(364, 'Luis Pérez Pérez', NULL, NULL, 'Masculino', 'luis.pérezpérez@outlook.com', '960685704', '2024-10-18 12:08:19', 2, NULL),
(365, 'Elena López Sánchez', NULL, NULL, 'Femenino', 'elena.lópezsánchez@outlook.com', '984116611', '2024-10-18 12:08:19', 1, NULL),
(366, 'Mario López Sánchez', NULL, NULL, 'Masculino', 'mario.lópezsánchez@hotmail.com', '992437466', '2024-10-18 12:08:19', 2, NULL),
(367, 'Claudia Pérez Sánchez', NULL, NULL, 'Femenino', 'claudia.pérezsánchez@yahoo.com', '915312341', '2024-10-18 12:08:19', 1, NULL),
(368, 'Mario López López', NULL, NULL, 'Masculino', 'mario.lópezlópez@outlook.com', '937519743', '2024-10-18 12:08:19', 1, NULL),
(369, 'José Cruz Cruz', NULL, NULL, 'Masculino', 'josé.cruzcruz@yahoo.com', '993220915', '2024-10-18 12:08:19', 1, NULL),
(370, 'Luis Martínez López', NULL, NULL, 'Masculino', 'luis.martínezlópez@yahoo.com', '932538396', '2024-10-18 12:08:19', 2, NULL),
(371, 'María Martínez López', NULL, NULL, 'Femenino', 'maría.martínezlópez@outlook.com', '911317127', '2024-10-18 12:08:19', 1, NULL),
(372, 'María Pérez Cruz', NULL, NULL, 'Femenino', 'maría.pérezcruz@outlook.com', '919214395', '2024-10-18 12:08:19', 1, NULL),
(373, 'Elena Ramírez Martínez', NULL, NULL, 'Femenino', 'elena.ramírezmartínez@yahoo.com', '957752853', '2024-10-18 12:08:19', 1, NULL),
(374, 'José Hernández Ramírez', NULL, NULL, 'Masculino', 'josé.hernándezramírez@hotmail.com', '996254157', '2024-10-18 12:08:19', 2, NULL),
(375, 'Roberto García Sánchez', NULL, NULL, 'Masculino', 'roberto.garcíasánchez@outlook.com', '979504682', '2024-10-18 12:08:19', 1, NULL),
(376, 'Eduardo Pérez García', NULL, NULL, 'Masculino', 'eduardo.pérezgarcía@yahoo.com', '978180106', '2024-10-18 12:08:19', 2, NULL),
(377, 'Rosa Rodríguez Ramírez', NULL, NULL, 'Femenino', 'rosa.rodríguezramírez@gmail.com', '984879667', '2024-10-18 12:08:19', 1, NULL),
(378, 'Ana González Sánchez', NULL, NULL, 'Femenino', 'ana.gonzálezsánchez@gmail.com', '948677575', '2024-10-18 12:08:19', 2, NULL);
INSERT INTO `pacientes` (`id`, `nombre`, `antecedentes`, `enfermedades`, `sexo`, `correo`, `telefono`, `fecha`, `estado`, `estado_id`) VALUES
(379, 'Luis Cruz Hernández', NULL, NULL, 'Masculino', 'luis.cruzhernández@outlook.com', '911574619', '2024-10-18 12:08:19', 1, NULL),
(380, 'Patricia García Ramírez', NULL, NULL, 'Femenino', 'patricia.garcíaramírez@hotmail.com', '976296760', '2024-10-18 12:08:19', 2, NULL),
(381, 'Carmen Cruz Rodríguez', NULL, NULL, 'Femenino', 'carmen.cruzrodríguez@hotmail.com', '949709931', '2024-10-18 12:08:19', 1, NULL),
(382, 'Jorge Hernández García', NULL, NULL, 'Masculino', 'jorge.hernándezgarcía@yahoo.com', '932155373', '2024-10-18 12:08:19', 2, NULL),
(383, 'Eduardo Cruz Martínez', NULL, NULL, 'Masculino', 'eduardo.cruzmartínez@gmail.com', '913012211', '2024-10-18 12:08:19', 2, NULL),
(384, 'Rosa Ramírez López', NULL, NULL, 'Femenino', 'rosa.ramírezlópez@hotmail.com', '938108600', '2024-10-18 12:08:19', 2, NULL),
(385, 'Roberto González Ramírez', NULL, NULL, 'Masculino', 'roberto.gonzálezramírez@gmail.com', '964380063', '2024-10-18 12:08:19', 2, NULL),
(386, 'Eduardo García Cruz', NULL, NULL, 'Masculino', 'eduardo.garcíacruz@yahoo.com', '941795986', '2024-10-18 12:08:19', 2, NULL),
(387, 'Luis Pérez López', NULL, NULL, 'Masculino', 'luis.pérezlópez@hotmail.com', '929977729', '2024-10-18 12:08:19', 2, NULL),
(388, 'Laura Sánchez González', NULL, NULL, 'Femenino', 'laura.sánchezgonzález@hotmail.com', '964145396', '2024-10-18 12:08:19', 2, NULL),
(389, 'Rosa Cruz Ramírez', NULL, NULL, 'Femenino', 'rosa.cruzramírez@yahoo.com', '957442095', '2024-10-18 12:08:19', 1, NULL),
(390, 'Elena González Cruz', NULL, NULL, 'Femenino', 'elena.gonzálezcruz@hotmail.com', '912184808', '2024-10-18 12:08:19', 2, NULL),
(391, 'Patricia González Cruz', NULL, NULL, 'Femenino', 'patricia.gonzálezcruz@gmail.com', '913504552', '2024-10-18 12:08:19', 2, NULL),
(392, 'Ana Pérez Pérez', NULL, NULL, 'Femenino', 'ana.pérezpérez@hotmail.com', '984448979', '2024-10-18 12:08:19', 1, NULL),
(393, 'Roberto García López', NULL, NULL, 'Masculino', 'roberto.garcíalópez@yahoo.com', '974249500', '2024-10-18 12:08:19', 2, NULL),
(394, 'Jorge Hernández Sánchez', NULL, NULL, 'Masculino', 'jorge.hernándezsánchez@yahoo.com', '924942521', '2024-10-18 12:08:19', 2, NULL),
(395, 'Rosa Cruz Cruz', NULL, NULL, 'Femenino', 'rosa.cruzcruz@outlook.com', '931098344', '2024-10-18 12:08:19', 1, NULL),
(396, 'Verónica González Rodríguez', NULL, NULL, 'Femenino', 'verónica.gonzálezrodríguez@yahoo.com', '910813044', '2024-10-18 12:08:19', 2, NULL),
(397, 'Rosa Pérez Hernández', NULL, NULL, 'Femenino', 'rosa.pérezhernández@gmail.com', '930317942', '2024-10-18 12:08:19', 1, NULL),
(398, 'José Hernández López', NULL, NULL, 'Masculino', 'josé.hernándezlópez@yahoo.com', '941091301', '2024-10-18 12:08:19', 1, NULL),
(399, 'Daniel Sánchez Hernández', NULL, NULL, 'Masculino', 'daniel.sánchezhernández@yahoo.com', '927991908', '2024-10-18 12:08:19', 1, NULL),
(400, 'María Hernández Rodríguez', NULL, NULL, 'Femenino', 'maría.hernándezrodríguez@yahoo.com', '987886300', '2024-10-18 12:08:19', 1, NULL),
(401, 'Mario Ramírez Martínez', NULL, NULL, 'Masculino', 'mario.ramírezmartínez@yahoo.com', '990164467', '2024-10-18 12:08:19', 1, NULL),
(402, 'Eduardo Hernández García', NULL, NULL, 'Masculino', 'eduardo.hernándezgarcía@outlook.com', '969726686', '2024-10-18 12:08:19', 2, NULL),
(403, 'Mario Hernández González', NULL, NULL, 'Masculino', 'mario.hernándezgonzález@outlook.com', '979306671', '2024-10-18 12:08:19', 1, NULL),
(404, 'Daniel Hernández Sánchez', NULL, NULL, 'Masculino', 'daniel.hernándezsánchez@yahoo.com', '922478007', '2024-10-18 12:08:19', 2, NULL),
(405, 'José González Rodríguez', NULL, NULL, 'Masculino', 'josé.gonzálezrodríguez@outlook.com', '962139736', '2024-10-18 12:08:19', 1, NULL),
(406, 'Verónica García Martínez', NULL, NULL, 'Femenino', 'verónica.garcíamartínez@outlook.com', '994349384', '2024-10-18 12:08:19', 1, NULL),
(407, 'Roberto Rodríguez González', NULL, NULL, 'Masculino', 'roberto.rodríguezgonzález@yahoo.com', '944168353', '2024-10-18 12:08:19', 2, NULL),
(408, 'Eduardo Martínez González', NULL, NULL, 'Masculino', 'eduardo.martínezgonzález@yahoo.com', '979615838', '2024-10-18 12:08:19', 1, NULL),
(409, 'Jorge Cruz López', NULL, NULL, 'Masculino', 'jorge.cruzlópez@outlook.com', '951953742', '2024-10-18 12:08:19', 1, NULL),
(410, 'Carmen Cruz Martínez', NULL, NULL, 'Femenino', 'carmen.cruzmartínez@gmail.com', '950257430', '2024-10-18 12:08:19', 1, NULL),
(411, 'Claudia González López', NULL, NULL, 'Femenino', 'claudia.gonzálezlópez@yahoo.com', '953670871', '2024-10-18 12:08:19', 1, NULL),
(412, 'Mario Martínez López', NULL, NULL, 'Masculino', 'mario.martínezlópez@gmail.com', '916934911', '2024-10-18 12:08:19', 1, NULL),
(413, 'Daniel Pérez Pérez', NULL, NULL, 'Masculino', 'daniel.pérezpérez@gmail.com', '938724425', '2024-10-18 12:08:19', 1, NULL),
(414, 'Patricia Cruz Hernández', NULL, NULL, 'Femenino', 'patricia.cruzhernández@outlook.com', '996191590', '2024-10-18 12:08:19', 2, NULL),
(415, 'Mario Martínez López', NULL, NULL, 'Masculino', 'mario.martínezlópez@hotmail.com', '921716399', '2024-10-18 12:08:19', 2, NULL),
(416, 'Carlos López González', NULL, NULL, 'Masculino', 'carlos.lópezgonzález@hotmail.com', '963066923', '2024-10-18 12:08:19', 1, NULL),
(417, 'Daniel Pérez López', NULL, NULL, 'Masculino', 'daniel.pérezlópez@outlook.com', '941633027', '2024-10-18 12:08:19', 1, NULL),
(418, 'Luis Pérez Sánchez', NULL, NULL, 'Masculino', 'luis.pérezsánchez@gmail.com', '921246588', '2024-10-18 12:08:19', 1, NULL),
(419, 'Patricia Hernández Pérez', NULL, NULL, 'Femenino', 'patricia.hernándezpérez@hotmail.com', '974404340', '2024-10-18 12:08:19', 2, NULL),
(420, 'Rosa Ramírez González', NULL, NULL, 'Femenino', 'rosa.ramírezgonzález@outlook.com', '955642476', '2024-10-18 12:08:19', 1, NULL),
(421, 'Laura Ramírez García', NULL, NULL, 'Femenino', 'laura.ramírezgarcía@gmail.com', '923965406', '2024-10-18 12:08:19', 1, NULL),
(422, 'Roberto Hernández Rodríguez', NULL, NULL, 'Masculino', 'roberto.hernándezrodríguez@outlook.com', '934905008', '2024-10-18 12:08:19', 1, NULL),
(423, 'Elena Cruz Pérez', NULL, NULL, 'Femenino', 'elena.cruzpérez@yahoo.com', '955772448', '2024-10-18 12:08:19', 1, NULL),
(424, 'Patricia García Cruz', NULL, NULL, 'Femenino', 'patricia.garcíacruz@hotmail.com', '934746144', '2024-10-18 12:08:19', 1, NULL),
(425, 'Miguel Ramírez Pérez', NULL, NULL, 'Masculino', 'miguel.ramírezpérez@yahoo.com', '954848396', '2024-10-18 12:08:19', 2, NULL),
(426, 'Luis Cruz Rodríguez', NULL, NULL, 'Masculino', 'luis.cruzrodríguez@outlook.com', '953275507', '2024-10-18 12:08:19', 1, NULL),
(427, 'Miguel Cruz Martínez', NULL, NULL, 'Masculino', 'miguel.cruzmartínez@outlook.com', '969521539', '2024-10-18 12:08:19', 1, NULL),
(428, 'Eduardo García González', NULL, NULL, 'Masculino', 'eduardo.garcíagonzález@gmail.com', '953259610', '2024-10-18 12:08:19', 1, NULL),
(429, 'Claudia Hernández López', NULL, NULL, 'Femenino', 'claudia.hernándezlópez@hotmail.com', '971093177', '2024-10-18 12:08:19', 1, NULL),
(430, 'Roberto Pérez García', NULL, NULL, 'Masculino', 'roberto.pérezgarcía@outlook.com', '992188216', '2024-10-18 12:08:19', 1, NULL),
(431, 'Luis López González', NULL, NULL, 'Masculino', 'luis.lópezgonzález@yahoo.com', '950856762', '2024-10-18 12:08:19', 2, NULL),
(432, 'María Hernández Rodríguez', NULL, NULL, 'Femenino', 'maría.hernándezrodríguez@outlook.com', '930033567', '2024-10-18 12:08:19', 1, NULL),
(433, 'Roberto Cruz Ramírez', NULL, NULL, 'Masculino', 'roberto.cruzramírez@hotmail.com', '948188080', '2024-10-18 12:08:19', 2, NULL),
(434, 'Carlos Rodríguez Ramírez', NULL, NULL, 'Masculino', 'carlos.rodríguezramírez@hotmail.com', '921948455', '2024-10-18 12:08:19', 1, NULL),
(435, 'Ana Cruz Cruz', NULL, NULL, 'Femenino', 'ana.cruzcruz@gmail.com', '977908950', '2024-10-18 12:08:19', 2, NULL),
(436, 'Daniel Cruz Hernández', NULL, NULL, 'Masculino', 'daniel.cruzhernández@gmail.com', '936851083', '2024-10-18 12:08:19', 2, NULL),
(437, 'Laura López González', NULL, NULL, 'Femenino', 'laura.lópezgonzález@hotmail.com', '980379558', '2024-10-18 12:08:19', 1, NULL),
(438, 'Daniel Martínez García', NULL, NULL, 'Masculino', 'daniel.martínezgarcía@outlook.com', '970145916', '2024-10-18 12:08:19', 1, NULL),
(439, 'Eduardo González López', NULL, NULL, 'Masculino', 'eduardo.gonzálezlópez@hotmail.com', '911948888', '2024-10-18 12:08:19', 1, NULL),
(440, 'José Ramírez Hernández', NULL, NULL, 'Masculino', 'josé.ramírezhernández@gmail.com', '918408857', '2024-10-18 12:08:19', 2, NULL),
(441, 'Miguel Sánchez Hernández', NULL, NULL, 'Masculino', 'miguel.sánchezhernández@yahoo.com', '949228633', '2024-10-18 12:08:19', 1, NULL),
(442, 'Daniel Rodríguez González', NULL, NULL, 'Masculino', 'daniel.rodríguezgonzález@gmail.com', '947344319', '2024-10-18 12:08:19', 1, NULL),
(443, 'Rosa Cruz Sánchez', NULL, NULL, 'Femenino', 'rosa.cruzsánchez@outlook.com', '933425124', '2024-10-18 12:08:19', 1, NULL),
(444, 'Laura Cruz González', NULL, NULL, 'Femenino', 'laura.cruzgonzález@outlook.com', '968053895', '2024-10-18 12:08:19', 1, NULL),
(445, 'Roberto Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'roberto.rodríguezrodríguez@hotmail.com', '950895119', '2024-10-18 12:08:19', 2, NULL),
(446, 'Patricia Hernández Ramírez', NULL, NULL, 'Femenino', 'patricia.hernándezramírez@hotmail.com', '949280863', '2024-10-18 12:08:19', 1, NULL),
(447, 'Verónica Pérez López', NULL, NULL, 'Femenino', 'verónica.pérezlópez@gmail.com', '976854754', '2024-10-18 12:08:19', 1, NULL),
(448, 'José Rodríguez Hernández', NULL, NULL, 'Masculino', 'josé.rodríguezhernández@outlook.com', '962561028', '2024-10-18 12:08:19', 1, NULL),
(449, 'Luis García Sánchez', NULL, NULL, 'Masculino', 'luis.garcíasánchez@hotmail.com', '957625093', '2024-10-18 12:08:19', 2, NULL),
(450, 'Carlos Martínez Martínez', NULL, NULL, 'Masculino', 'carlos.martínezmartínez@outlook.com', '923171557', '2024-10-18 12:08:19', 1, NULL),
(451, 'Eduardo Sánchez González', NULL, NULL, 'Masculino', 'eduardo.sánchezgonzález@hotmail.com', '911565097', '2024-10-18 12:08:19', 1, NULL),
(452, 'Patricia Sánchez Rodríguez', NULL, NULL, 'Femenino', 'patricia.sánchezrodríguez@yahoo.com', '912043964', '2024-10-18 12:08:19', 2, NULL),
(453, 'Juan Martínez Martínez', NULL, NULL, 'Masculino', 'juan.martínezmartínez@hotmail.com', '959148657', '2024-10-18 12:08:19', 1, NULL),
(454, 'Mario Sánchez Cruz', NULL, NULL, 'Masculino', 'mario.sánchezcruz@hotmail.com', '979429349', '2024-10-18 12:08:19', 1, NULL),
(455, 'Daniel Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'daniel.rodríguezrodríguez@yahoo.com', '982538466', '2024-10-18 12:08:19', 1, NULL),
(456, 'Juan López Martínez', NULL, NULL, 'Masculino', 'juan.lópezmartínez@hotmail.com', '975048031', '2024-10-18 12:08:19', 1, NULL),
(457, 'María García Sánchez', NULL, NULL, 'Femenino', 'maría.garcíasánchez@outlook.com', '956224003', '2024-10-18 12:08:19', 1, NULL),
(458, 'Daniel Cruz Rodríguez', NULL, NULL, 'Masculino', 'daniel.cruzrodríguez@outlook.com', '988691498', '2024-10-18 12:08:19', 1, NULL),
(459, 'José González López', NULL, NULL, 'Masculino', 'josé.gonzálezlópez@hotmail.com', '920097520', '2024-10-18 12:08:19', 2, NULL),
(460, 'Roberto Ramírez Pérez', NULL, NULL, 'Masculino', 'roberto.ramírezpérez@gmail.com', '972957508', '2024-10-18 12:08:19', 2, NULL),
(461, 'Juan González Hernández', NULL, NULL, 'Masculino', 'juan.gonzálezhernández@hotmail.com', '979557725', '2024-10-18 12:08:19', 1, NULL),
(462, 'Daniel Martínez Martínez', NULL, NULL, 'Masculino', 'daniel.martínezmartínez@gmail.com', '926577424', '2024-10-18 12:08:19', 1, NULL),
(463, 'Rosa Martínez Martínez', NULL, NULL, 'Femenino', 'rosa.martínezmartínez@outlook.com', '959216595', '2024-10-18 12:08:19', 1, NULL),
(464, 'María López Martínez', NULL, NULL, 'Femenino', 'maría.lópezmartínez@yahoo.com', '976173873', '2024-10-18 12:08:19', 1, NULL),
(465, 'Claudia López Martínez', NULL, NULL, 'Femenino', 'claudia.lópezmartínez@outlook.com', '935115540', '2024-10-18 12:08:19', 2, NULL),
(466, 'José García López', NULL, NULL, 'Masculino', 'josé.garcíalópez@yahoo.com', '924264483', '2024-10-18 12:08:19', 2, NULL),
(467, 'Daniel Sánchez López', NULL, NULL, 'Masculino', 'daniel.sánchezlópez@yahoo.com', '956692761', '2024-10-18 12:08:19', 2, NULL),
(468, 'Laura Martínez González', NULL, NULL, 'Femenino', 'laura.martínezgonzález@outlook.com', '965079223', '2024-10-18 12:08:19', 2, NULL),
(469, 'Eduardo Ramírez Pérez', NULL, NULL, 'Masculino', 'eduardo.ramírezpérez@yahoo.com', '966254122', '2024-10-18 12:08:19', 2, NULL),
(470, 'Mario Rodríguez García', NULL, NULL, 'Masculino', 'mario.rodríguezgarcía@hotmail.com', '940119032', '2024-10-18 12:08:19', 1, NULL),
(471, 'Laura López Rodríguez', NULL, NULL, 'Femenino', 'laura.lópezrodríguez@outlook.com', '981156048', '2024-10-18 12:08:19', 1, NULL),
(472, 'Verónica Martínez Martínez', NULL, NULL, 'Femenino', 'verónica.martínezmartínez@gmail.com', '970639087', '2024-10-18 12:08:19', 2, NULL),
(473, 'Luis López López', NULL, NULL, 'Masculino', 'luis.lópezlópez@hotmail.com', '973095077', '2024-10-18 12:08:19', 1, NULL),
(474, 'Carlos González Rodríguez', NULL, NULL, 'Masculino', 'carlos.gonzálezrodríguez@yahoo.com', '996852724', '2024-10-18 12:08:19', 2, NULL),
(475, 'Miguel Hernández Rodríguez', NULL, NULL, 'Masculino', 'miguel.hernándezrodríguez@hotmail.com', '948880752', '2024-10-18 12:08:19', 1, NULL),
(476, 'Carlos Pérez López', NULL, NULL, 'Masculino', 'carlos.pérezlópez@yahoo.com', '938236103', '2024-10-18 12:08:19', 1, NULL),
(477, 'Patricia Martínez Pérez', NULL, NULL, 'Femenino', 'patricia.martínezpérez@gmail.com', '998587029', '2024-10-18 12:08:19', 2, NULL),
(478, 'Mónica Martínez Martínez', NULL, NULL, 'Femenino', 'mónica.martínezmartínez@hotmail.com', '922335611', '2024-10-18 12:08:19', 2, NULL),
(479, 'Laura López García', NULL, NULL, 'Femenino', 'laura.lópezgarcía@outlook.com', '931916131', '2024-10-18 12:08:19', 2, NULL),
(480, 'Luis Sánchez Pérez', NULL, NULL, 'Masculino', 'luis.sánchezpérez@yahoo.com', '938500398', '2024-10-18 12:08:19', 2, NULL),
(481, 'María Rodríguez López', NULL, NULL, 'Femenino', 'maría.rodríguezlópez@outlook.com', '955080002', '2024-10-18 12:08:19', 2, NULL),
(482, 'Rosa González Hernández', NULL, NULL, 'Femenino', 'rosa.gonzálezhernández@gmail.com', '918998920', '2024-10-18 12:08:19', 2, NULL),
(483, 'José Cruz Cruz', NULL, NULL, 'Masculino', 'josé.cruzcruz@outlook.com', '979648439', '2024-10-18 12:08:19', 2, NULL),
(484, 'Ana Rodríguez Cruz', NULL, NULL, 'Femenino', 'ana.rodríguezcruz@yahoo.com', '964956596', '2024-10-18 12:08:19', 2, NULL),
(485, 'Claudia Martínez López', NULL, NULL, 'Femenino', 'claudia.martínezlópez@gmail.com', '960161697', '2024-10-18 12:08:19', 1, NULL),
(486, 'Claudia García Rodríguez', NULL, NULL, 'Femenino', 'claudia.garcíarodríguez@gmail.com', '923011400', '2024-10-18 12:08:19', 2, NULL),
(487, 'Carlos Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'carlos.rodríguezrodríguez@gmail.com', '992148205', '2024-10-18 12:08:19', 2, NULL),
(488, 'María Pérez Sánchez', NULL, NULL, 'Femenino', 'maría.pérezsánchez@gmail.com', '959677717', '2024-10-18 12:08:19', 1, NULL),
(489, 'Elena Rodríguez Cruz', NULL, NULL, 'Femenino', 'elena.rodríguezcruz@outlook.com', '936162000', '2024-10-18 12:08:19', 1, NULL),
(490, 'Mónica González Cruz', NULL, NULL, 'Femenino', 'mónica.gonzálezcruz@gmail.com', '972830029', '2024-10-18 12:08:19', 1, NULL),
(491, 'Juan Cruz Pérez', NULL, NULL, 'Masculino', 'juan.cruzpérez@hotmail.com', '967490377', '2024-10-18 12:08:19', 1, NULL),
(492, 'Juan Cruz García', NULL, NULL, 'Masculino', 'juan.cruzgarcía@hotmail.com', '998821110', '2024-10-18 12:08:19', 2, NULL),
(493, 'Eduardo Cruz Pérez', NULL, NULL, 'Masculino', 'eduardo.cruzpérez@yahoo.com', '956195883', '2024-10-18 12:08:19', 2, NULL),
(494, 'Roberto Cruz González', NULL, NULL, 'Masculino', 'roberto.cruzgonzález@hotmail.com', '928345113', '2024-10-18 12:08:19', 2, NULL),
(495, 'José Martínez Hernández', NULL, NULL, 'Masculino', 'josé.martínezhernández@gmail.com', '937647583', '2024-10-18 12:08:19', 1, NULL),
(496, 'Rosa Martínez Rodríguez', NULL, NULL, 'Femenino', 'rosa.martínezrodríguez@outlook.com', '997936131', '2024-10-18 12:08:19', 1, NULL),
(497, 'Roberto Cruz Hernández', NULL, NULL, 'Masculino', 'roberto.cruzhernández@outlook.com', '942248548', '2024-10-18 12:08:19', 1, NULL),
(498, 'Ana Sánchez García', NULL, NULL, 'Femenino', 'ana.sánchezgarcía@hotmail.com', '973538997', '2024-10-18 12:08:19', 1, NULL),
(499, 'Ana García Ramírez', NULL, NULL, 'Femenino', 'ana.garcíaramírez@outlook.com', '934313599', '2024-10-18 12:08:19', 1, NULL),
(500, 'José López Ramírez', NULL, NULL, 'Masculino', 'josé.lópezramírez@outlook.com', '944142461', '2024-10-18 12:08:19', 1, NULL),
(501, 'Rosa García Rodríguez', NULL, NULL, 'Femenino', 'rosa.garcíarodríguez@outlook.com', '970420227', '2024-10-18 12:08:19', 2, NULL),
(502, 'Verónica Hernández Sánchez', NULL, NULL, 'Femenino', 'verónica.hernándezsánchez@outlook.com', '968393759', '2024-10-18 12:08:19', 2, NULL),
(503, 'Jorge Ramírez Sánchez', NULL, NULL, 'Masculino', 'jorge.ramírezsánchez@outlook.com', '967614446', '2024-10-18 12:08:19', 1, NULL),
(504, 'Rosa González González', NULL, NULL, 'Femenino', 'rosa.gonzálezgonzález@hotmail.com', '990226146', '2024-10-18 12:08:20', 2, NULL),
(505, 'José González Hernández', NULL, NULL, 'Masculino', 'josé.gonzálezhernández@gmail.com', '935559362', '2024-10-18 12:08:20', 2, NULL),
(506, 'Mónica Cruz González', NULL, NULL, 'Femenino', 'mónica.cruzgonzález@gmail.com', '983903021', '2024-10-18 12:08:20', 1, NULL),
(507, 'Mario Ramírez Pérez', NULL, NULL, 'Masculino', 'mario.ramírezpérez@hotmail.com', '992258324', '2024-10-18 12:08:20', 2, NULL),
(508, 'José Rodríguez Martínez', NULL, NULL, 'Masculino', 'josé.rodríguezmartínez@hotmail.com', '930655620', '2024-10-18 12:08:20', 2, NULL),
(509, 'Claudia Pérez Pérez', NULL, NULL, 'Femenino', 'claudia.pérezpérez@outlook.com', '995703477', '2024-10-18 12:08:20', 1, NULL),
(510, 'Eduardo López García', NULL, NULL, 'Masculino', 'eduardo.lópezgarcía@hotmail.com', '927568884', '2024-10-18 12:08:20', 2, NULL),
(511, 'Carlos Hernández Sánchez', NULL, NULL, 'Masculino', 'carlos.hernándezsánchez@yahoo.com', '947608542', '2024-10-18 12:08:20', 1, NULL),
(512, 'José Sánchez Sánchez', NULL, NULL, 'Masculino', 'josé.sánchezsánchez@yahoo.com', '940497700', '2024-10-18 12:08:20', 2, NULL),
(513, 'Luis Hernández Cruz', NULL, NULL, 'Masculino', 'luis.hernándezcruz@hotmail.com', '935084293', '2024-10-18 12:08:20', 2, NULL),
(514, 'Rosa Pérez González', NULL, NULL, 'Femenino', 'rosa.pérezgonzález@gmail.com', '919993170', '2024-10-18 12:08:20', 2, NULL),
(515, 'José Rodríguez García', NULL, NULL, 'Masculino', 'josé.rodríguezgarcía@hotmail.com', '965091269', '2024-10-18 12:08:20', 1, NULL),
(516, 'Eduardo González Ramírez', NULL, NULL, 'Masculino', 'eduardo.gonzálezramírez@yahoo.com', '986198118', '2024-10-18 12:08:20', 2, NULL),
(517, 'Elena García Pérez', NULL, NULL, 'Femenino', 'elena.garcíapérez@yahoo.com', '926002604', '2024-10-18 12:08:20', 1, NULL),
(518, 'Mónica García Rodríguez', NULL, NULL, 'Femenino', 'mónica.garcíarodríguez@hotmail.com', '958963121', '2024-10-18 12:08:20', 1, NULL),
(519, 'Rosa López López', NULL, NULL, 'Femenino', 'rosa.lópezlópez@gmail.com', '977128974', '2024-10-18 12:08:20', 2, NULL),
(520, 'María González Ramírez', NULL, NULL, 'Femenino', 'maría.gonzálezramírez@gmail.com', '911771465', '2024-10-18 12:08:20', 2, NULL),
(521, 'Ana Rodríguez Pérez', NULL, NULL, 'Femenino', 'ana.rodríguezpérez@outlook.com', '985745219', '2024-10-18 12:08:20', 1, NULL),
(522, 'Patricia Pérez Cruz', NULL, NULL, 'Femenino', 'patricia.pérezcruz@hotmail.com', '913534795', '2024-10-18 12:08:20', 2, NULL),
(523, 'Verónica Martínez Hernández', NULL, NULL, 'Femenino', 'verónica.martínezhernández@gmail.com', '942210230', '2024-10-18 12:08:20', 1, NULL),
(524, 'Ana Pérez García', NULL, NULL, 'Femenino', 'ana.pérezgarcía@yahoo.com', '968868929', '2024-10-18 12:08:20', 2, NULL),
(525, 'Daniel Ramírez Martínez', NULL, NULL, 'Masculino', 'daniel.ramírezmartínez@hotmail.com', '998548919', '2024-10-18 12:08:20', 2, NULL),
(526, 'Miguel Rodríguez García', NULL, NULL, 'Masculino', 'miguel.rodríguezgarcía@yahoo.com', '924194938', '2024-10-18 12:08:20', 2, NULL),
(527, 'Carlos López Martínez', NULL, NULL, 'Masculino', 'carlos.lópezmartínez@hotmail.com', '982643084', '2024-10-18 12:08:20', 1, NULL),
(528, 'Elena Martínez González', NULL, NULL, 'Femenino', 'elena.martínezgonzález@yahoo.com', '934815768', '2024-10-18 12:08:20', 2, NULL),
(529, 'Carlos Sánchez García', NULL, NULL, 'Masculino', 'carlos.sánchezgarcía@yahoo.com', '940546033', '2024-10-18 12:08:20', 2, NULL),
(530, 'Daniel García López', NULL, NULL, 'Masculino', 'daniel.garcíalópez@gmail.com', '915110967', '2024-10-18 12:08:20', 2, NULL),
(531, 'María Hernández Pérez', NULL, NULL, 'Femenino', 'maría.hernándezpérez@outlook.com', '944575312', '2024-10-18 12:08:20', 1, NULL),
(532, 'Juan López Martínez', NULL, NULL, 'Masculino', 'juan.lópezmartínez@hotmail.com', '961825432', '2024-10-18 12:08:20', 2, NULL),
(533, 'Mario García Hernández', NULL, NULL, 'Masculino', 'mario.garcíahernández@gmail.com', '928308808', '2024-10-18 12:08:20', 1, NULL),
(534, 'Carlos Sánchez Hernández', NULL, NULL, 'Masculino', 'carlos.sánchezhernández@gmail.com', '996260168', '2024-10-18 12:08:20', 2, NULL),
(535, 'María Cruz García', NULL, NULL, 'Femenino', 'maría.cruzgarcía@yahoo.com', '972236101', '2024-10-18 12:08:20', 2, NULL),
(536, 'Rosa García Ramírez', NULL, NULL, 'Femenino', 'rosa.garcíaramírez@gmail.com', '915124996', '2024-10-18 12:08:20', 1, NULL),
(537, 'Rosa Martínez Pérez', NULL, NULL, 'Femenino', 'rosa.martínezpérez@outlook.com', '911032456', '2024-10-18 12:08:20', 2, NULL),
(538, 'Elena García Sánchez', NULL, NULL, 'Femenino', 'elena.garcíasánchez@gmail.com', '932157680', '2024-10-18 12:08:20', 2, NULL),
(539, 'Carlos Martínez López', NULL, NULL, 'Masculino', 'carlos.martínezlópez@yahoo.com', '998454165', '2024-10-18 12:08:20', 2, NULL),
(540, 'Juan Pérez Pérez', NULL, NULL, 'Masculino', 'juan.pérezpérez@outlook.com', '993409817', '2024-10-18 12:08:20', 1, NULL),
(541, 'Roberto López Cruz', NULL, NULL, 'Masculino', 'roberto.lópezcruz@outlook.com', '922032307', '2024-10-18 12:08:20', 2, NULL),
(542, 'Mario Pérez Cruz', NULL, NULL, 'Masculino', 'mario.pérezcruz@yahoo.com', '929015780', '2024-10-18 12:08:20', 1, NULL),
(543, 'Luis García López', NULL, NULL, 'Masculino', 'luis.garcíalópez@outlook.com', '929829899', '2024-10-18 12:08:20', 1, NULL),
(544, 'Eduardo Pérez Sánchez', NULL, NULL, 'Masculino', 'eduardo.pérezsánchez@yahoo.com', '934145297', '2024-10-18 12:08:20', 1, NULL),
(545, 'María López Martínez', NULL, NULL, 'Femenino', 'maría.lópezmartínez@gmail.com', '945225880', '2024-10-18 12:08:20', 2, NULL),
(546, 'Patricia Cruz Rodríguez', NULL, NULL, 'Femenino', 'patricia.cruzrodríguez@hotmail.com', '945861684', '2024-10-18 12:08:20', 2, NULL),
(547, 'Eduardo García Rodríguez', NULL, NULL, 'Masculino', 'eduardo.garcíarodríguez@outlook.com', '915631584', '2024-10-18 12:08:20', 1, NULL),
(548, 'Mario López López', NULL, NULL, 'Masculino', 'mario.lópezlópez@outlook.com', '936177557', '2024-10-18 12:08:20', 1, NULL),
(549, 'Claudia Hernández Sánchez', NULL, NULL, 'Femenino', 'claudia.hernándezsánchez@gmail.com', '946377283', '2024-10-18 12:08:20', 2, NULL),
(550, 'María Martínez Pérez', NULL, NULL, 'Femenino', 'maría.martínezpérez@outlook.com', '986210037', '2024-10-18 12:08:20', 2, NULL),
(551, 'Daniel Rodríguez González', NULL, NULL, 'Masculino', 'daniel.rodríguezgonzález@yahoo.com', '982225178', '2024-10-18 12:08:20', 2, NULL),
(552, 'Rosa Rodríguez González', NULL, NULL, 'Femenino', 'rosa.rodríguezgonzález@yahoo.com', '914082889', '2024-10-18 12:08:20', 1, NULL),
(553, 'Patricia Hernández Ramírez', NULL, NULL, 'Femenino', 'patricia.hernándezramírez@outlook.com', '936189550', '2024-10-18 12:08:20', 2, NULL),
(554, 'Luis Sánchez Martínez', NULL, NULL, 'Masculino', 'luis.sánchezmartínez@gmail.com', '986994403', '2024-10-18 12:08:20', 2, NULL),
(555, 'Rosa Sánchez Rodríguez', NULL, NULL, 'Femenino', 'rosa.sánchezrodríguez@yahoo.com', '915674081', '2024-10-18 12:08:20', 1, NULL),
(556, 'Carmen Pérez Hernández', NULL, NULL, 'Femenino', 'carmen.pérezhernández@yahoo.com', '992593378', '2024-10-18 12:08:20', 1, NULL),
(557, 'María Ramírez Pérez', NULL, NULL, 'Femenino', 'maría.ramírezpérez@hotmail.com', '967770472', '2024-10-18 12:08:20', 1, NULL),
(558, 'Ana Pérez Martínez', NULL, NULL, 'Femenino', 'ana.pérezmartínez@yahoo.com', '969729547', '2024-10-18 12:08:20', 1, NULL),
(559, 'Verónica González López', NULL, NULL, 'Femenino', 'verónica.gonzálezlópez@outlook.com', '950013543', '2024-10-18 12:08:20', 2, NULL),
(560, 'Elena López López', NULL, NULL, 'Femenino', 'elena.lópezlópez@yahoo.com', '963218822', '2024-10-18 12:08:20', 1, NULL),
(561, 'Ana López García', NULL, NULL, 'Femenino', 'ana.lópezgarcía@outlook.com', '915726494', '2024-10-18 12:08:20', 2, NULL),
(562, 'Laura López Martínez', NULL, NULL, 'Femenino', 'laura.lópezmartínez@yahoo.com', '981257198', '2024-10-18 12:08:20', 1, NULL),
(563, 'Verónica Pérez Rodríguez', NULL, NULL, 'Femenino', 'verónica.pérezrodríguez@outlook.com', '977012742', '2024-10-18 12:08:20', 1, NULL),
(564, 'Ana Cruz Pérez', NULL, NULL, 'Femenino', 'ana.cruzpérez@yahoo.com', '978605108', '2024-10-18 12:08:20', 2, NULL),
(565, 'Luis Pérez López', NULL, NULL, 'Masculino', 'luis.pérezlópez@hotmail.com', '980843820', '2024-10-18 12:08:20', 2, NULL),
(566, 'Claudia Hernández López', NULL, NULL, 'Femenino', 'claudia.hernándezlópez@gmail.com', '934248600', '2024-10-18 12:08:20', 1, NULL),
(567, 'Miguel López Ramírez', NULL, NULL, 'Masculino', 'miguel.lópezramírez@outlook.com', '994986844', '2024-10-18 12:08:20', 2, NULL),
(568, 'Juan Pérez Cruz', NULL, NULL, 'Masculino', 'juan.pérezcruz@gmail.com', '980743313', '2024-10-18 12:08:20', 1, NULL),
(569, 'Carlos Ramírez Sánchez', NULL, NULL, 'Masculino', 'carlos.ramírezsánchez@hotmail.com', '942466298', '2024-10-18 12:08:20', 2, NULL),
(570, 'Juan García Hernández', NULL, NULL, 'Masculino', 'juan.garcíahernández@gmail.com', '993468469', '2024-10-18 12:08:20', 2, NULL),
(571, 'Elena Sánchez López', NULL, NULL, 'Femenino', 'elena.sánchezlópez@yahoo.com', '941184282', '2024-10-18 12:08:20', 1, NULL),
(572, 'Eduardo Ramírez Cruz', NULL, NULL, 'Masculino', 'eduardo.ramírezcruz@gmail.com', '939101856', '2024-10-18 12:08:20', 2, NULL),
(573, 'Elena Rodríguez Cruz', NULL, NULL, 'Femenino', 'elena.rodríguezcruz@gmail.com', '964081070', '2024-10-18 12:08:20', 1, NULL),
(574, 'Miguel Pérez Cruz', NULL, NULL, 'Masculino', 'miguel.pérezcruz@hotmail.com', '998293810', '2024-10-18 12:08:20', 1, NULL),
(575, 'Ana Rodríguez García', NULL, NULL, 'Femenino', 'ana.rodríguezgarcía@hotmail.com', '992436590', '2024-10-18 12:08:20', 1, NULL),
(576, 'Verónica Hernández Sánchez', NULL, NULL, 'Femenino', 'verónica.hernándezsánchez@hotmail.com', '967524936', '2024-10-18 12:08:20', 1, NULL),
(577, 'Eduardo Hernández López', NULL, NULL, 'Masculino', 'eduardo.hernándezlópez@gmail.com', '983348946', '2024-10-18 12:08:20', 1, NULL),
(578, 'Roberto García García', NULL, NULL, 'Masculino', 'roberto.garcíagarcía@yahoo.com', '916575029', '2024-10-18 12:08:20', 2, NULL),
(579, 'Daniel Pérez Sánchez', NULL, NULL, 'Masculino', 'daniel.pérezsánchez@yahoo.com', '936159146', '2024-10-18 12:08:20', 1, NULL),
(580, 'Claudia Martínez Rodríguez', NULL, NULL, 'Femenino', 'claudia.martínezrodríguez@hotmail.com', '982064572', '2024-10-18 12:08:20', 2, NULL),
(581, 'Carlos Pérez Hernández', NULL, NULL, 'Masculino', 'carlos.pérezhernández@hotmail.com', '911312332', '2024-10-18 12:08:20', 2, NULL),
(582, 'Claudia Hernández Hernández', NULL, NULL, 'Femenino', 'claudia.hernándezhernández@yahoo.com', '960316356', '2024-10-18 12:08:20', 2, NULL),
(583, 'Mónica Pérez Sánchez', NULL, NULL, 'Femenino', 'mónica.pérezsánchez@gmail.com', '937393981', '2024-10-18 12:08:20', 1, NULL),
(584, 'Miguel López Ramírez', NULL, NULL, 'Masculino', 'miguel.lópezramírez@hotmail.com', '940487076', '2024-10-18 12:08:20', 1, NULL),
(585, 'Roberto Pérez Hernández', NULL, NULL, 'Masculino', 'roberto.pérezhernández@outlook.com', '937030350', '2024-10-18 12:08:20', 2, NULL),
(586, 'Luis López Sánchez', NULL, NULL, 'Masculino', 'luis.lópezsánchez@outlook.com', '949560246', '2024-10-18 12:08:20', 1, NULL),
(587, 'María Pérez García', NULL, NULL, 'Femenino', 'maría.pérezgarcía@gmail.com', '937903043', '2024-10-18 12:08:20', 1, NULL),
(588, 'Jorge Pérez Pérez', NULL, NULL, 'Masculino', 'jorge.pérezpérez@gmail.com', '976625982', '2024-10-18 12:08:20', 2, NULL),
(589, 'Mario Martínez García', NULL, NULL, 'Masculino', 'mario.martínezgarcía@gmail.com', '960138990', '2024-10-18 12:08:20', 2, NULL),
(590, 'Miguel Ramírez Rodríguez', NULL, NULL, 'Masculino', 'miguel.ramírezrodríguez@yahoo.com', '941745867', '2024-10-18 12:08:20', 1, NULL),
(591, 'Ana Sánchez Martínez', NULL, NULL, 'Femenino', 'ana.sánchezmartínez@gmail.com', '944270130', '2024-10-18 12:08:20', 2, NULL),
(592, 'Carmen Pérez Cruz', NULL, NULL, 'Femenino', 'carmen.pérezcruz@outlook.com', '942977504', '2024-10-18 12:08:20', 1, NULL),
(593, 'Mario Pérez Sánchez', NULL, NULL, 'Masculino', 'mario.pérezsánchez@hotmail.com', '977496334', '2024-10-18 12:08:20', 2, NULL),
(594, 'Luis González López', NULL, NULL, 'Masculino', 'luis.gonzálezlópez@outlook.com', '988132976', '2024-10-18 12:08:20', 1, NULL),
(595, 'Mario Hernández García', NULL, NULL, 'Masculino', 'mario.hernándezgarcía@yahoo.com', '934174520', '2024-10-18 12:08:20', 2, NULL),
(596, 'Claudia Martínez Sánchez', NULL, NULL, 'Femenino', 'claudia.martínezsánchez@yahoo.com', '983664721', '2024-10-18 12:08:20', 2, NULL),
(597, 'Jorge Sánchez Sánchez', NULL, NULL, 'Masculino', 'jorge.sánchezsánchez@gmail.com', '925086522', '2024-10-18 12:08:20', 1, NULL),
(598, 'Jorge Cruz García', NULL, NULL, 'Masculino', 'jorge.cruzgarcía@outlook.com', '967451515', '2024-10-18 12:08:20', 1, NULL),
(599, 'Juan Hernández Rodríguez', NULL, NULL, 'Masculino', 'juan.hernándezrodríguez@hotmail.com', '969257188', '2024-10-18 12:08:20', 2, NULL),
(600, 'Patricia López González', NULL, NULL, 'Femenino', 'patricia.lópezgonzález@gmail.com', '934938918', '2024-10-18 12:08:20', 2, NULL),
(601, 'Jorge Ramírez Cruz', NULL, NULL, 'Masculino', 'jorge.ramírezcruz@yahoo.com', '954046493', '2024-10-18 12:08:20', 2, NULL),
(602, 'Roberto Sánchez González', NULL, NULL, 'Masculino', 'roberto.sánchezgonzález@gmail.com', '969395535', '2024-10-18 12:08:20', 2, NULL),
(603, 'Miguel Cruz Hernández', NULL, NULL, 'Masculino', 'miguel.cruzhernández@outlook.com', '931443678', '2024-10-18 12:08:20', 1, NULL),
(604, 'Juan López Sánchez', NULL, NULL, 'Masculino', 'juan.lópezsánchez@outlook.com', '914301399', '2024-10-18 12:08:20', 2, NULL),
(605, 'Verónica Ramírez González', NULL, NULL, 'Femenino', 'verónica.ramírezgonzález@hotmail.com', '915255718', '2024-10-18 12:08:20', 1, NULL),
(606, 'Patricia Cruz Sánchez', NULL, NULL, 'Femenino', 'patricia.cruzsánchez@hotmail.com', '912997671', '2024-10-18 12:08:20', 1, NULL),
(607, 'Rosa Sánchez López', NULL, NULL, 'Femenino', 'rosa.sánchezlópez@hotmail.com', '971821981', '2024-10-18 12:08:20', 1, NULL),
(608, 'Ana Sánchez Martínez', NULL, NULL, 'Femenino', 'ana.sánchezmartínez@hotmail.com', '923368502', '2024-10-18 12:08:20', 2, NULL),
(609, 'Patricia López Pérez', NULL, NULL, 'Femenino', 'patricia.lópezpérez@hotmail.com', '988719651', '2024-10-18 12:08:20', 2, NULL),
(610, 'Claudia Rodríguez Pérez', NULL, NULL, 'Femenino', 'claudia.rodríguezpérez@yahoo.com', '973263956', '2024-10-18 12:08:20', 1, NULL),
(611, 'Laura García Martínez', NULL, NULL, 'Femenino', 'laura.garcíamartínez@hotmail.com', '950421676', '2024-10-18 12:08:20', 1, NULL),
(612, 'Patricia García Cruz', NULL, NULL, 'Femenino', 'patricia.garcíacruz@yahoo.com', '916846142', '2024-10-18 12:08:20', 1, NULL),
(613, 'Patricia Sánchez Ramírez', NULL, NULL, 'Femenino', 'patricia.sánchezramírez@yahoo.com', '924184660', '2024-10-18 12:08:20', 2, NULL),
(614, 'Rosa Ramírez González', NULL, NULL, 'Femenino', 'rosa.ramírezgonzález@outlook.com', '942119106', '2024-10-18 12:08:20', 2, NULL),
(615, 'Claudia López Martínez', NULL, NULL, 'Femenino', 'claudia.lópezmartínez@outlook.com', '989168082', '2024-10-18 12:08:20', 2, NULL),
(616, 'Miguel Ramírez Martínez', NULL, NULL, 'Masculino', 'miguel.ramírezmartínez@yahoo.com', '950016747', '2024-10-18 12:08:20', 1, NULL),
(617, 'Juan López Martínez', NULL, NULL, 'Masculino', 'juan.lópezmartínez@gmail.com', '935832587', '2024-10-18 12:08:20', 2, NULL),
(618, 'José Cruz Ramírez', NULL, NULL, 'Masculino', 'josé.cruzramírez@outlook.com', '995311286', '2024-10-18 12:08:20', 1, NULL),
(619, 'Mario Hernández López', NULL, NULL, 'Masculino', 'mario.hernándezlópez@hotmail.com', '976002161', '2024-10-18 12:08:20', 1, NULL),
(620, 'Elena Cruz Sánchez', NULL, NULL, 'Femenino', 'elena.cruzsánchez@hotmail.com', '939165498', '2024-10-18 12:08:20', 2, NULL),
(621, 'Jorge Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'jorge.rodríguezrodríguez@yahoo.com', '986090044', '2024-10-18 12:08:20', 1, NULL),
(622, 'Jorge Pérez García', NULL, NULL, 'Masculino', 'jorge.pérezgarcía@outlook.com', '964184462', '2024-10-18 12:08:20', 1, NULL),
(623, 'Miguel Rodríguez García', NULL, NULL, 'Masculino', 'miguel.rodríguezgarcía@gmail.com', '989650406', '2024-10-18 12:08:20', 2, NULL),
(624, 'Rosa Sánchez Martínez', NULL, NULL, 'Femenino', 'rosa.sánchezmartínez@yahoo.com', '921381600', '2024-10-18 12:08:20', 2, NULL),
(625, 'Miguel Hernández Pérez', NULL, NULL, 'Masculino', 'miguel.hernándezpérez@yahoo.com', '945187943', '2024-10-18 12:08:20', 1, NULL),
(626, 'Miguel Pérez Ramírez', NULL, NULL, 'Masculino', 'miguel.pérezramírez@gmail.com', '946720206', '2024-10-18 12:08:20', 1, NULL),
(627, 'Roberto Martínez Hernández', NULL, NULL, 'Masculino', 'roberto.martínezhernández@yahoo.com', '951292047', '2024-10-18 12:08:20', 1, NULL),
(628, 'Rosa Sánchez Ramírez', NULL, NULL, 'Femenino', 'rosa.sánchezramírez@outlook.com', '994864024', '2024-10-18 12:08:20', 2, NULL),
(629, 'Laura Sánchez García', NULL, NULL, 'Femenino', 'laura.sánchezgarcía@yahoo.com', '971968128', '2024-10-18 12:08:20', 1, NULL),
(630, 'José López González', NULL, NULL, 'Masculino', 'josé.lópezgonzález@gmail.com', '997722175', '2024-10-18 12:08:20', 2, NULL),
(631, 'Luis López García', NULL, NULL, 'Masculino', 'luis.lópezgarcía@outlook.com', '946686348', '2024-10-18 12:08:20', 2, NULL),
(632, 'Jorge Hernández López', NULL, NULL, 'Masculino', 'jorge.hernándezlópez@gmail.com', '953577695', '2024-10-18 12:08:20', 2, NULL),
(633, 'Luis García Sánchez', NULL, NULL, 'Masculino', 'luis.garcíasánchez@yahoo.com', '935221457', '2024-10-18 12:08:20', 1, NULL),
(634, 'Carlos Hernández González', NULL, NULL, 'Masculino', 'carlos.hernándezgonzález@hotmail.com', '970192196', '2024-10-18 12:08:20', 1, NULL),
(635, 'Laura Ramírez García', NULL, NULL, 'Femenino', 'laura.ramírezgarcía@yahoo.com', '920821143', '2024-10-18 12:08:20', 1, NULL),
(636, 'Mónica Ramírez Sánchez', NULL, NULL, 'Femenino', 'mónica.ramírezsánchez@gmail.com', '942340882', '2024-10-18 12:08:20', 1, NULL),
(637, 'Mario Hernández Ramírez', NULL, NULL, 'Masculino', 'mario.hernándezramírez@outlook.com', '990082506', '2024-10-18 12:08:20', 2, NULL),
(638, 'Carmen Cruz Sánchez', NULL, NULL, 'Femenino', 'carmen.cruzsánchez@gmail.com', '952116789', '2024-10-18 12:08:20', 2, NULL),
(639, 'Daniel López López', NULL, NULL, 'Masculino', 'daniel.lópezlópez@outlook.com', '925118250', '2024-10-18 12:08:20', 1, NULL),
(640, 'Juan López González', NULL, NULL, 'Masculino', 'juan.lópezgonzález@outlook.com', '927558903', '2024-10-18 12:08:20', 2, NULL),
(641, 'Carmen Sánchez García', NULL, NULL, 'Femenino', 'carmen.sánchezgarcía@outlook.com', '955371845', '2024-10-18 12:08:20', 2, NULL),
(642, 'Mario García Cruz', NULL, NULL, 'Masculino', 'mario.garcíacruz@yahoo.com', '951469975', '2024-10-18 12:08:20', 1, NULL),
(643, 'Carlos Hernández Ramírez', NULL, NULL, 'Masculino', 'carlos.hernándezramírez@hotmail.com', '919138852', '2024-10-18 12:08:20', 1, NULL),
(644, 'Luis García Cruz', NULL, NULL, 'Masculino', 'luis.garcíacruz@gmail.com', '920467031', '2024-10-18 12:08:20', 2, NULL),
(645, 'Jorge Martínez García', NULL, NULL, 'Masculino', 'jorge.martínezgarcía@hotmail.com', '926802111', '2024-10-18 12:08:20', 1, NULL),
(646, 'Ana Martínez Sánchez', NULL, NULL, 'Femenino', 'ana.martínezsánchez@yahoo.com', '996591202', '2024-10-18 12:08:20', 1, NULL),
(647, 'Laura González Cruz', NULL, NULL, 'Femenino', 'laura.gonzálezcruz@yahoo.com', '978573745', '2024-10-18 12:08:20', 1, NULL),
(648, 'José García Sánchez', NULL, NULL, 'Masculino', 'josé.garcíasánchez@yahoo.com', '997455438', '2024-10-18 12:08:20', 2, NULL),
(649, 'Juan García Cruz', NULL, NULL, 'Masculino', 'juan.garcíacruz@yahoo.com', '922770493', '2024-10-18 12:08:20', 1, NULL),
(650, 'Miguel García García', NULL, NULL, 'Masculino', 'miguel.garcíagarcía@hotmail.com', '970829067', '2024-10-18 12:08:20', 1, NULL),
(651, 'Ana Ramírez Rodríguez', NULL, NULL, 'Femenino', 'ana.ramírezrodríguez@gmail.com', '913028369', '2024-10-18 12:08:20', 2, NULL),
(652, 'Roberto García Pérez', NULL, NULL, 'Masculino', 'roberto.garcíapérez@hotmail.com', '952221775', '2024-10-18 12:08:20', 1, NULL),
(653, 'Roberto Rodríguez Pérez', NULL, NULL, 'Masculino', 'roberto.rodríguezpérez@gmail.com', '917334283', '2024-10-18 12:08:20', 1, NULL),
(654, 'Carmen Rodríguez Cruz', NULL, NULL, 'Femenino', 'carmen.rodríguezcruz@yahoo.com', '960901663', '2024-10-18 12:08:20', 1, NULL),
(655, 'Mónica Hernández Martínez', NULL, NULL, 'Femenino', 'mónica.hernándezmartínez@gmail.com', '939560519', '2024-10-18 12:08:20', 2, NULL),
(656, 'Miguel Rodríguez Sánchez', NULL, NULL, 'Masculino', 'miguel.rodríguezsánchez@outlook.com', '995366989', '2024-10-18 12:08:20', 2, NULL),
(657, 'Luis Pérez Martínez', NULL, NULL, 'Masculino', 'luis.pérezmartínez@gmail.com', '937440485', '2024-10-18 12:08:20', 1, NULL),
(658, 'Rosa Cruz Sánchez', NULL, NULL, 'Femenino', 'rosa.cruzsánchez@gmail.com', '910248241', '2024-10-18 12:08:20', 2, NULL),
(659, 'Ana Sánchez Martínez', NULL, NULL, 'Femenino', 'ana.sánchezmartínez@yahoo.com', '987863749', '2024-10-18 12:08:20', 2, NULL),
(660, 'Eduardo Hernández Rodríguez', NULL, NULL, 'Masculino', 'eduardo.hernándezrodríguez@hotmail.com', '914138836', '2024-10-18 12:08:20', 2, NULL),
(661, 'Roberto Martínez García', NULL, NULL, 'Masculino', 'roberto.martínezgarcía@yahoo.com', '953478309', '2024-10-18 12:08:20', 2, NULL),
(662, 'Elena González Ramírez', NULL, NULL, 'Femenino', 'elena.gonzálezramírez@outlook.com', '984638401', '2024-10-18 12:08:20', 2, NULL),
(663, 'Carlos Hernández Ramírez', NULL, NULL, 'Masculino', 'carlos.hernándezramírez@yahoo.com', '938895031', '2024-10-18 12:08:20', 2, NULL),
(664, 'Juan Ramírez Rodríguez', NULL, NULL, 'Masculino', 'juan.ramírezrodríguez@hotmail.com', '990107052', '2024-10-18 12:08:20', 1, NULL),
(665, 'Mario Sánchez Rodríguez', NULL, NULL, 'Masculino', 'mario.sánchezrodríguez@gmail.com', '928359316', '2024-10-18 12:08:20', 2, NULL),
(666, 'Jorge Rodríguez Pérez', NULL, NULL, 'Masculino', 'jorge.rodríguezpérez@gmail.com', '910057825', '2024-10-18 12:08:20', 2, NULL),
(667, 'Juan Martínez Cruz', NULL, NULL, 'Masculino', 'juan.martínezcruz@yahoo.com', '951901477', '2024-10-18 12:08:20', 2, NULL),
(668, 'Patricia Martínez Rodríguez', NULL, NULL, 'Femenino', 'patricia.martínezrodríguez@gmail.com', '961244064', '2024-10-18 12:08:20', 1, NULL),
(669, 'Mónica González Pérez', NULL, NULL, 'Femenino', 'mónica.gonzálezpérez@hotmail.com', '935250862', '2024-10-18 12:08:20', 1, NULL),
(670, 'Jorge Ramírez Pérez', NULL, NULL, 'Masculino', 'jorge.ramírezpérez@gmail.com', '952958006', '2024-10-18 12:08:20', 1, NULL),
(671, 'Carmen Rodríguez Rodríguez', NULL, NULL, 'Femenino', 'carmen.rodríguezrodríguez@gmail.com', '972967656', '2024-10-18 12:08:20', 1, NULL),
(672, 'Verónica Martínez García', NULL, NULL, 'Femenino', 'verónica.martínezgarcía@outlook.com', '927440079', '2024-10-18 12:08:20', 1, NULL),
(673, 'Elena Hernández Rodríguez', NULL, NULL, 'Femenino', 'elena.hernándezrodríguez@hotmail.com', '966757601', '2024-10-18 12:08:20', 1, NULL),
(674, 'Carmen Pérez García', NULL, NULL, 'Femenino', 'carmen.pérezgarcía@yahoo.com', '975860071', '2024-10-18 12:08:20', 2, NULL),
(675, 'Laura Sánchez Ramírez', NULL, NULL, 'Femenino', 'laura.sánchezramírez@hotmail.com', '965732655', '2024-10-18 12:08:20', 1, NULL),
(676, 'Elena García Cruz', NULL, NULL, 'Femenino', 'elena.garcíacruz@gmail.com', '916562724', '2024-10-18 12:08:20', 2, NULL),
(677, 'Mario Sánchez Ramírez', NULL, NULL, 'Masculino', 'mario.sánchezramírez@hotmail.com', '949347696', '2024-10-18 12:08:20', 1, NULL),
(678, 'Rosa Sánchez Cruz', NULL, NULL, 'Femenino', 'rosa.sánchezcruz@yahoo.com', '988771519', '2024-10-18 12:08:20', 2, NULL),
(679, 'Luis García García', NULL, NULL, 'Masculino', 'luis.garcíagarcía@yahoo.com', '974564977', '2024-10-18 12:08:20', 2, NULL),
(680, 'Verónica Sánchez Ramírez', NULL, NULL, 'Femenino', 'verónica.sánchezramírez@outlook.com', '971457431', '2024-10-18 12:08:20', 2, NULL),
(681, 'Mario Sánchez Rodríguez', NULL, NULL, 'Masculino', 'mario.sánchezrodríguez@outlook.com', '929144280', '2024-10-18 12:08:20', 2, NULL),
(682, 'Ana Cruz García', NULL, NULL, 'Femenino', 'ana.cruzgarcía@outlook.com', '973210280', '2024-10-18 12:08:20', 1, NULL),
(683, 'Miguel Hernández Hernández', NULL, NULL, 'Masculino', 'miguel.hernándezhernández@hotmail.com', '958587796', '2024-10-18 12:08:20', 1, NULL),
(684, 'Daniel Hernández Hernández', NULL, NULL, 'Masculino', 'daniel.hernándezhernández@outlook.com', '976918695', '2024-10-18 12:08:20', 1, NULL),
(685, 'Luis Martínez Martínez', NULL, NULL, 'Masculino', 'luis.martínezmartínez@outlook.com', '994163421', '2024-10-18 12:08:20', 1, NULL),
(686, 'Carmen González Sánchez', NULL, NULL, 'Femenino', 'carmen.gonzálezsánchez@hotmail.com', '999529454', '2024-10-18 12:08:20', 1, NULL),
(687, 'Luis Rodríguez López', NULL, NULL, 'Masculino', 'luis.rodríguezlópez@gmail.com', '924622391', '2024-10-18 12:08:20', 1, NULL),
(688, 'Elena López Hernández', NULL, NULL, 'Femenino', 'elena.lópezhernández@gmail.com', '910191165', '2024-10-18 12:08:20', 2, NULL),
(689, 'Miguel Cruz González', NULL, NULL, 'Masculino', 'miguel.cruzgonzález@gmail.com', '940131545', '2024-10-18 12:08:20', 2, NULL),
(690, 'Laura Ramírez Martínez', NULL, NULL, 'Femenino', 'laura.ramírezmartínez@outlook.com', '921785258', '2024-10-18 12:08:20', 1, NULL),
(691, 'Ana García González', NULL, NULL, 'Femenino', 'ana.garcíagonzález@outlook.com', '992624816', '2024-10-18 12:08:20', 1, NULL),
(692, 'Jorge Hernández Cruz', NULL, NULL, 'Masculino', 'jorge.hernándezcruz@hotmail.com', '984939079', '2024-10-18 12:08:20', 2, NULL),
(693, 'Verónica Sánchez López', NULL, NULL, 'Femenino', 'verónica.sánchezlópez@yahoo.com', '917494007', '2024-10-18 12:08:20', 1, NULL),
(694, 'Roberto Rodríguez López', NULL, NULL, 'Masculino', 'roberto.rodríguezlópez@yahoo.com', '965923112', '2024-10-18 12:08:20', 2, NULL),
(695, 'Patricia Sánchez Ramírez', NULL, NULL, 'Femenino', 'patricia.sánchezramírez@hotmail.com', '962438300', '2024-10-18 12:08:20', 1, NULL),
(696, 'Daniel López Cruz', NULL, NULL, 'Masculino', 'daniel.lópezcruz@gmail.com', '952706413', '2024-10-18 12:08:20', 1, NULL),
(697, 'Juan González Hernández', NULL, NULL, 'Masculino', 'juan.gonzálezhernández@hotmail.com', '917661797', '2024-10-18 12:08:20', 1, NULL),
(698, 'Jorge Pérez Rodríguez', NULL, NULL, 'Masculino', 'jorge.pérezrodríguez@gmail.com', '948863557', '2024-10-18 12:08:20', 2, NULL),
(699, 'Laura Sánchez García', NULL, NULL, 'Femenino', 'laura.sánchezgarcía@gmail.com', '986293587', '2024-10-18 12:08:20', 2, NULL),
(700, 'Daniel García García', NULL, NULL, 'Masculino', 'daniel.garcíagarcía@outlook.com', '925217770', '2024-10-18 12:08:20', 2, NULL),
(701, 'Laura González Pérez', NULL, NULL, 'Femenino', 'laura.gonzálezpérez@yahoo.com', '962510527', '2024-10-18 12:08:20', 1, NULL),
(702, 'Carmen Sánchez López', NULL, NULL, 'Femenino', 'carmen.sánchezlópez@hotmail.com', '963705928', '2024-10-18 12:08:20', 2, NULL),
(703, 'Ana Cruz Martínez', NULL, NULL, 'Femenino', 'ana.cruzmartínez@gmail.com', '958642859', '2024-10-18 12:08:20', 1, NULL),
(704, 'Carmen González Ramírez', NULL, NULL, 'Femenino', 'carmen.gonzálezramírez@outlook.com', '997983702', '2024-10-18 12:08:20', 1, NULL),
(705, 'María López Rodríguez', NULL, NULL, 'Femenino', 'maría.lópezrodríguez@hotmail.com', '950260235', '2024-10-18 12:08:20', 2, NULL),
(706, 'Miguel Martínez Cruz', NULL, NULL, 'Masculino', 'miguel.martínezcruz@hotmail.com', '922694400', '2024-10-18 12:08:20', 1, NULL),
(707, 'Eduardo Ramírez Sánchez', NULL, NULL, 'Masculino', 'eduardo.ramírezsánchez@hotmail.com', '949918237', '2024-10-18 12:08:20', 2, NULL),
(708, 'Eduardo García Cruz', NULL, NULL, 'Masculino', 'eduardo.garcíacruz@hotmail.com', '965742846', '2024-10-18 12:08:20', 1, NULL),
(709, 'José Sánchez Rodríguez', NULL, NULL, 'Masculino', 'josé.sánchezrodríguez@outlook.com', '959218120', '2024-10-18 12:08:20', 1, NULL),
(710, 'Carmen López Martínez', NULL, NULL, 'Femenino', 'carmen.lópezmartínez@gmail.com', '919326112', '2024-10-18 12:08:20', 2, NULL),
(711, 'Jorge Pérez López', NULL, NULL, 'Masculino', 'jorge.pérezlópez@yahoo.com', '947485001', '2024-10-18 12:08:20', 1, NULL),
(712, 'Ana López Cruz', NULL, NULL, 'Femenino', 'ana.lópezcruz@yahoo.com', '998673792', '2024-10-18 12:08:20', 2, NULL),
(713, 'María López García', NULL, NULL, 'Femenino', 'maría.lópezgarcía@hotmail.com', '947295622', '2024-10-18 12:08:20', 2, NULL),
(714, 'Mónica González Rodríguez', NULL, NULL, 'Femenino', 'mónica.gonzálezrodríguez@outlook.com', '996515501', '2024-10-18 12:08:20', 1, NULL),
(715, 'Patricia Pérez Martínez', NULL, NULL, 'Femenino', 'patricia.pérezmartínez@yahoo.com', '927779572', '2024-10-18 12:08:20', 2, NULL),
(716, 'Carmen Sánchez Pérez', NULL, NULL, 'Femenino', 'carmen.sánchezpérez@hotmail.com', '984404961', '2024-10-18 12:08:20', 2, NULL),
(717, 'Daniel Pérez Martínez', NULL, NULL, 'Masculino', 'daniel.pérezmartínez@yahoo.com', '935971713', '2024-10-18 12:08:20', 1, NULL),
(718, 'Laura Cruz Cruz', NULL, NULL, 'Femenino', 'laura.cruzcruz@gmail.com', '911746521', '2024-10-18 12:08:20', 1, NULL),
(719, 'Roberto Martínez García', NULL, NULL, 'Masculino', 'roberto.martínezgarcía@gmail.com', '955901030', '2024-10-18 12:08:20', 2, NULL),
(720, 'Claudia González Hernández', NULL, NULL, 'Femenino', 'claudia.gonzálezhernández@hotmail.com', '987456088', '2024-10-18 12:08:21', 2, NULL),
(721, 'Luis Rodríguez García', NULL, NULL, 'Masculino', 'luis.rodríguezgarcía@yahoo.com', '917629360', '2024-10-18 12:08:21', 1, NULL),
(722, 'Elena Pérez Pérez', NULL, NULL, 'Femenino', 'elena.pérezpérez@outlook.com', '926259631', '2024-10-18 12:08:21', 1, NULL),
(723, 'Luis González García', NULL, NULL, 'Masculino', 'luis.gonzálezgarcía@gmail.com', '969653271', '2024-10-18 12:08:21', 1, NULL),
(724, 'Rosa Martínez Pérez', NULL, NULL, 'Femenino', 'rosa.martínezpérez@outlook.com', '995333700', '2024-10-18 12:08:21', 1, NULL),
(725, 'José González Martínez', NULL, NULL, 'Masculino', 'josé.gonzálezmartínez@hotmail.com', '924404855', '2024-10-18 12:08:21', 1, NULL),
(726, 'Claudia Ramírez López', NULL, NULL, 'Femenino', 'claudia.ramírezlópez@hotmail.com', '938172844', '2024-10-18 12:08:21', 1, NULL),
(727, 'Patricia López Ramírez', NULL, NULL, 'Femenino', 'patricia.lópezramírez@hotmail.com', '931760918', '2024-10-18 12:08:21', 1, NULL),
(728, 'Verónica Rodríguez Martínez', NULL, NULL, 'Femenino', 'verónica.rodríguezmartínez@outlook.com', '998552106', '2024-10-18 12:08:21', 2, NULL),
(729, 'Carlos Cruz Martínez', NULL, NULL, 'Masculino', 'carlos.cruzmartínez@hotmail.com', '993264770', '2024-10-18 12:08:21', 2, NULL),
(730, 'Mónica López Cruz', NULL, NULL, 'Femenino', 'mónica.lópezcruz@gmail.com', '953571347', '2024-10-18 12:08:21', 2, NULL),
(731, 'Rosa Ramírez Cruz', NULL, NULL, 'Femenino', 'rosa.ramírezcruz@gmail.com', '947254282', '2024-10-18 12:08:21', 2, NULL),
(732, 'Roberto Pérez Hernández', NULL, NULL, 'Masculino', 'roberto.pérezhernández@outlook.com', '974639487', '2024-10-18 12:08:21', 2, NULL),
(733, 'Verónica Ramírez Pérez', NULL, NULL, 'Femenino', 'verónica.ramírezpérez@gmail.com', '956442358', '2024-10-18 12:08:21', 2, NULL),
(734, 'Verónica García Ramírez', NULL, NULL, 'Femenino', 'verónica.garcíaramírez@gmail.com', '987651863', '2024-10-18 12:08:21', 2, NULL),
(735, 'Mónica Rodríguez Cruz', NULL, NULL, 'Femenino', 'mónica.rodríguezcruz@hotmail.com', '967602350', '2024-10-18 12:08:21', 2, NULL),
(736, 'Juan Sánchez Martínez', NULL, NULL, 'Masculino', 'juan.sánchezmartínez@outlook.com', '942735241', '2024-10-18 12:08:21', 2, NULL),
(737, 'Daniel López Martínez', NULL, NULL, 'Masculino', 'daniel.lópezmartínez@hotmail.com', '999348064', '2024-10-18 12:08:21', 2, NULL),
(738, 'Patricia Hernández Rodríguez', NULL, NULL, 'Femenino', 'patricia.hernándezrodríguez@yahoo.com', '927461493', '2024-10-18 12:08:21', 2, NULL),
(739, 'José García Pérez', NULL, NULL, 'Masculino', 'josé.garcíapérez@outlook.com', '999318798', '2024-10-18 12:08:21', 1, NULL),
(740, 'Ana Rodríguez López', NULL, NULL, 'Femenino', 'ana.rodríguezlópez@yahoo.com', '915145498', '2024-10-18 12:08:21', 2, NULL),
(741, 'Claudia Sánchez Sánchez', NULL, NULL, 'Femenino', 'claudia.sánchezsánchez@outlook.com', '935485400', '2024-10-18 12:08:21', 2, NULL),
(742, 'Mónica Sánchez Cruz', NULL, NULL, 'Femenino', 'mónica.sánchezcruz@outlook.com', '923821573', '2024-10-18 12:08:21', 2, NULL),
(743, 'Roberto Cruz Ramírez', NULL, NULL, 'Masculino', 'roberto.cruzramírez@yahoo.com', '982811663', '2024-10-18 12:08:21', 2, NULL),
(744, 'Laura Rodríguez Pérez', NULL, NULL, 'Femenino', 'laura.rodríguezpérez@outlook.com', '920964410', '2024-10-18 12:08:21', 2, NULL),
(745, 'Roberto Rodríguez Ramírez', NULL, NULL, 'Masculino', 'roberto.rodríguezramírez@yahoo.com', '920889497', '2024-10-18 12:08:21', 2, NULL),
(746, 'Claudia Martínez Martínez', NULL, NULL, 'Femenino', 'claudia.martínezmartínez@outlook.com', '991802826', '2024-10-18 12:08:21', 1, NULL),
(747, 'Daniel Cruz Martínez', NULL, NULL, 'Masculino', 'daniel.cruzmartínez@yahoo.com', '916005643', '2024-10-18 12:08:21', 1, NULL),
(748, 'Luis González López', NULL, NULL, 'Masculino', 'luis.gonzálezlópez@hotmail.com', '910489526', '2024-10-18 12:08:21', 2, NULL),
(749, 'Mario Ramírez Rodríguez', NULL, NULL, 'Masculino', 'mario.ramírezrodríguez@gmail.com', '950212855', '2024-10-18 12:08:21', 1, NULL);
INSERT INTO `pacientes` (`id`, `nombre`, `antecedentes`, `enfermedades`, `sexo`, `correo`, `telefono`, `fecha`, `estado`, `estado_id`) VALUES
(750, 'Carlos Sánchez García', NULL, NULL, 'Masculino', 'carlos.sánchezgarcía@gmail.com', '912132244', '2024-10-18 12:08:21', 1, NULL),
(751, 'Eduardo Martínez Martínez', NULL, NULL, 'Masculino', 'eduardo.martínezmartínez@gmail.com', '929157181', '2024-10-18 12:08:21', 1, NULL),
(752, 'Roberto García Sánchez', NULL, NULL, 'Masculino', 'roberto.garcíasánchez@hotmail.com', '982630804', '2024-10-18 12:08:21', 2, NULL),
(753, 'Rosa González García', NULL, NULL, 'Femenino', 'rosa.gonzálezgarcía@gmail.com', '961934933', '2024-10-18 12:08:21', 1, NULL),
(754, 'José Rodríguez Cruz', NULL, NULL, 'Masculino', 'josé.rodríguezcruz@outlook.com', '933575836', '2024-10-18 12:08:21', 1, NULL),
(755, 'Jorge Martínez Rodríguez', NULL, NULL, 'Masculino', 'jorge.martínezrodríguez@hotmail.com', '925893059', '2024-10-18 12:08:21', 1, NULL),
(756, 'José Pérez López', NULL, NULL, 'Masculino', 'josé.pérezlópez@outlook.com', '958804665', '2024-10-18 12:08:21', 1, NULL),
(757, 'Elena Pérez Pérez', NULL, NULL, 'Femenino', 'elena.pérezpérez@gmail.com', '947786797', '2024-10-18 12:08:21', 2, NULL),
(758, 'Patricia López Cruz', NULL, NULL, 'Femenino', 'patricia.lópezcruz@hotmail.com', '969243813', '2024-10-18 12:08:21', 2, NULL),
(759, 'Juan Ramírez Hernández', NULL, NULL, 'Masculino', 'juan.ramírezhernández@yahoo.com', '930772217', '2024-10-18 12:08:21', 1, NULL),
(760, 'Eduardo Sánchez García', NULL, NULL, 'Masculino', 'eduardo.sánchezgarcía@yahoo.com', '939951419', '2024-10-18 12:08:21', 2, NULL),
(761, 'Juan López Ramírez', NULL, NULL, 'Masculino', 'juan.lópezramírez@outlook.com', '944753715', '2024-10-18 12:08:21', 2, NULL),
(762, 'Carlos Cruz Martínez', NULL, NULL, 'Masculino', 'carlos.cruzmartínez@yahoo.com', '950090239', '2024-10-18 12:08:21', 1, NULL),
(763, 'Laura Cruz Sánchez', NULL, NULL, 'Femenino', 'laura.cruzsánchez@outlook.com', '939371184', '2024-10-18 12:08:21', 1, NULL),
(764, 'Eduardo Rodríguez Cruz', NULL, NULL, 'Masculino', 'eduardo.rodríguezcruz@outlook.com', '980726820', '2024-10-18 12:08:21', 1, NULL),
(765, 'Claudia Ramírez Cruz', NULL, NULL, 'Femenino', 'claudia.ramírezcruz@gmail.com', '910876590', '2024-10-18 12:08:21', 1, NULL),
(766, 'Luis González Pérez', NULL, NULL, 'Masculino', 'luis.gonzálezpérez@outlook.com', '988064389', '2024-10-18 12:08:21', 2, NULL),
(767, 'José Rodríguez Sánchez', NULL, NULL, 'Masculino', 'josé.rodríguezsánchez@gmail.com', '965573715', '2024-10-18 12:08:21', 2, NULL),
(768, 'José Pérez Sánchez', NULL, NULL, 'Masculino', 'josé.pérezsánchez@hotmail.com', '983205569', '2024-10-18 12:08:21', 1, NULL),
(769, 'Luis González Sánchez', NULL, NULL, 'Masculino', 'luis.gonzálezsánchez@gmail.com', '941040817', '2024-10-18 12:08:21', 1, NULL),
(770, 'Roberto Sánchez Cruz', NULL, NULL, 'Masculino', 'roberto.sánchezcruz@yahoo.com', '936076184', '2024-10-18 12:08:21', 1, NULL),
(771, 'Carmen López González', NULL, NULL, 'Femenino', 'carmen.lópezgonzález@gmail.com', '957544454', '2024-10-18 12:08:21', 1, NULL),
(772, 'José Pérez Cruz', NULL, NULL, 'Masculino', 'josé.pérezcruz@outlook.com', '996825401', '2024-10-18 12:08:21', 1, NULL),
(773, 'Juan Ramírez García', NULL, NULL, 'Masculino', 'juan.ramírezgarcía@gmail.com', '973417609', '2024-10-18 12:08:21', 1, NULL),
(774, 'Luis Martínez Martínez', NULL, NULL, 'Masculino', 'luis.martínezmartínez@gmail.com', '927456962', '2024-10-18 12:08:21', 1, NULL),
(775, 'Miguel López Ramírez', NULL, NULL, 'Masculino', 'miguel.lópezramírez@gmail.com', '937944463', '2024-10-18 12:08:21', 1, NULL),
(776, 'Daniel González Rodríguez', NULL, NULL, 'Masculino', 'daniel.gonzálezrodríguez@gmail.com', '979764371', '2024-10-18 12:08:21', 2, NULL),
(777, 'Luis Cruz García', NULL, NULL, 'Masculino', 'luis.cruzgarcía@gmail.com', '977522619', '2024-10-18 12:08:21', 2, NULL),
(778, 'Ana López Cruz', NULL, NULL, 'Femenino', 'ana.lópezcruz@hotmail.com', '964689072', '2024-10-18 12:08:21', 2, NULL),
(779, 'Juan Sánchez López', NULL, NULL, 'Masculino', 'juan.sánchezlópez@outlook.com', '978320847', '2024-10-18 12:08:21', 2, NULL),
(780, 'Luis Pérez González', NULL, NULL, 'Masculino', 'luis.pérezgonzález@yahoo.com', '986065706', '2024-10-18 12:08:21', 2, NULL),
(781, 'Mónica García Rodríguez', NULL, NULL, 'Femenino', 'mónica.garcíarodríguez@gmail.com', '959049676', '2024-10-18 12:08:21', 1, NULL),
(782, 'Juan Sánchez García', NULL, NULL, 'Masculino', 'juan.sánchezgarcía@outlook.com', '985230767', '2024-10-18 12:08:21', 1, NULL),
(783, 'Daniel González González', NULL, NULL, 'Masculino', 'daniel.gonzálezgonzález@hotmail.com', '940992241', '2024-10-18 12:08:21', 2, NULL),
(784, 'Jorge Ramírez González', NULL, NULL, 'Masculino', 'jorge.ramírezgonzález@outlook.com', '914928517', '2024-10-18 12:08:21', 2, NULL),
(785, 'Miguel Hernández García', NULL, NULL, 'Masculino', 'miguel.hernándezgarcía@outlook.com', '981060280', '2024-10-18 12:08:21', 1, NULL),
(786, 'Claudia Martínez Hernández', NULL, NULL, 'Femenino', 'claudia.martínezhernández@outlook.com', '928952351', '2024-10-18 12:08:21', 1, NULL),
(787, 'Mónica Martínez Hernández', NULL, NULL, 'Femenino', 'mónica.martínezhernández@hotmail.com', '961859148', '2024-10-18 12:08:21', 2, NULL),
(788, 'Claudia Hernández Cruz', NULL, NULL, 'Femenino', 'claudia.hernándezcruz@hotmail.com', '981463099', '2024-10-18 12:08:21', 2, NULL),
(789, 'Rosa García Hernández', NULL, NULL, 'Femenino', 'rosa.garcíahernández@hotmail.com', '981081353', '2024-10-18 12:08:21', 1, NULL),
(790, 'Eduardo Martínez Ramírez', NULL, NULL, 'Masculino', 'eduardo.martínezramírez@hotmail.com', '975403785', '2024-10-18 12:08:21', 2, NULL),
(791, 'Rosa González Ramírez', NULL, NULL, 'Femenino', 'rosa.gonzálezramírez@hotmail.com', '991131881', '2024-10-18 12:08:21', 1, NULL),
(792, 'Ana Martínez Rodríguez', NULL, NULL, 'Femenino', 'ana.martínezrodríguez@hotmail.com', '913910994', '2024-10-18 12:08:21', 2, NULL),
(793, 'Miguel Ramírez Hernández', NULL, NULL, 'Masculino', 'miguel.ramírezhernández@outlook.com', '928641069', '2024-10-18 12:08:21', 1, NULL),
(794, 'Miguel López López', NULL, NULL, 'Masculino', 'miguel.lópezlópez@hotmail.com', '995300846', '2024-10-18 12:08:21', 2, NULL),
(795, 'Miguel Hernández Pérez', NULL, NULL, 'Masculino', 'miguel.hernándezpérez@outlook.com', '995242628', '2024-10-18 12:08:21', 1, NULL),
(796, 'Mario Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'mario.rodríguezrodríguez@gmail.com', '920224939', '2024-10-18 12:08:21', 1, NULL),
(797, 'José Pérez López', NULL, NULL, 'Masculino', 'josé.pérezlópez@yahoo.com', '965894970', '2024-10-18 12:08:21', 1, NULL),
(798, 'Claudia Cruz Martínez', NULL, NULL, 'Femenino', 'claudia.cruzmartínez@gmail.com', '948206141', '2024-10-18 12:08:21', 2, NULL),
(799, 'José López García', NULL, NULL, 'Masculino', 'josé.lópezgarcía@hotmail.com', '995850913', '2024-10-18 12:08:21', 1, NULL),
(800, 'Ana Ramírez Rodríguez', NULL, NULL, 'Femenino', 'ana.ramírezrodríguez@hotmail.com', '982972690', '2024-10-18 12:08:21', 1, NULL),
(801, 'Claudia Rodríguez Hernández', NULL, NULL, 'Femenino', 'claudia.rodríguezhernández@hotmail.com', '999561136', '2024-10-18 12:08:21', 1, NULL),
(802, 'Eduardo López Ramírez', NULL, NULL, 'Masculino', 'eduardo.lópezramírez@hotmail.com', '934418198', '2024-10-18 12:08:21', 1, NULL),
(803, 'Verónica López Martínez', NULL, NULL, 'Femenino', 'verónica.lópezmartínez@yahoo.com', '943059107', '2024-10-18 12:08:21', 1, NULL),
(804, 'Rosa López Ramírez', NULL, NULL, 'Femenino', 'rosa.lópezramírez@yahoo.com', '977515397', '2024-10-18 12:08:21', 2, NULL),
(805, 'Mónica Ramírez Hernández', NULL, NULL, 'Femenino', 'mónica.ramírezhernández@yahoo.com', '926374762', '2024-10-18 12:08:21', 2, NULL),
(806, 'Miguel López González', NULL, NULL, 'Masculino', 'miguel.lópezgonzález@gmail.com', '980910043', '2024-10-18 12:08:21', 2, NULL),
(807, 'Laura González Ramírez', NULL, NULL, 'Femenino', 'laura.gonzálezramírez@yahoo.com', '966263228', '2024-10-18 12:08:21', 1, NULL),
(808, 'Miguel Cruz Pérez', NULL, NULL, 'Masculino', 'miguel.cruzpérez@hotmail.com', '918647658', '2024-10-18 12:08:21', 1, NULL),
(809, 'Claudia García Martínez', NULL, NULL, 'Femenino', 'claudia.garcíamartínez@hotmail.com', '932540400', '2024-10-18 12:08:21', 2, NULL),
(810, 'María Hernández González', NULL, NULL, 'Femenino', 'maría.hernándezgonzález@hotmail.com', '912125089', '2024-10-18 12:08:21', 2, NULL),
(811, 'José López López', NULL, NULL, 'Masculino', 'josé.lópezlópez@yahoo.com', '950118176', '2024-10-18 12:08:21', 2, NULL),
(812, 'María Martínez García', NULL, NULL, 'Femenino', 'maría.martínezgarcía@outlook.com', '982487752', '2024-10-18 12:08:21', 2, NULL),
(813, 'José Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'josé.rodríguezrodríguez@yahoo.com', '968912564', '2024-10-18 12:08:21', 1, NULL),
(814, 'María García Martínez', NULL, NULL, 'Femenino', 'maría.garcíamartínez@yahoo.com', '925153289', '2024-10-18 12:08:21', 1, NULL),
(815, 'José Ramírez Ramírez', NULL, NULL, 'Masculino', 'josé.ramírezramírez@hotmail.com', '910187040', '2024-10-18 12:08:21', 1, NULL),
(816, 'Miguel García Martínez', NULL, NULL, 'Masculino', 'miguel.garcíamartínez@yahoo.com', '961264907', '2024-10-18 12:08:21', 2, NULL),
(817, 'Mónica Cruz Ramírez', NULL, NULL, 'Femenino', 'mónica.cruzramírez@hotmail.com', '915672593', '2024-10-18 12:08:21', 2, NULL),
(818, 'Juan Sánchez Hernández', NULL, NULL, 'Masculino', 'juan.sánchezhernández@gmail.com', '931830284', '2024-10-18 12:08:21', 2, NULL),
(819, 'Claudia González Hernández', NULL, NULL, 'Femenino', 'claudia.gonzálezhernández@yahoo.com', '969954359', '2024-10-18 12:08:21', 1, NULL),
(820, 'Elena González López', NULL, NULL, 'Femenino', 'elena.gonzálezlópez@outlook.com', '956829168', '2024-10-18 12:08:21', 1, NULL),
(821, 'José López Ramírez', NULL, NULL, 'Masculino', 'josé.lópezramírez@gmail.com', '935774065', '2024-10-18 12:08:21', 1, NULL),
(822, 'Miguel García Sánchez', NULL, NULL, 'Masculino', 'miguel.garcíasánchez@hotmail.com', '984590009', '2024-10-18 12:08:21', 2, NULL),
(823, 'Juan Cruz Cruz', NULL, NULL, 'Masculino', 'juan.cruzcruz@yahoo.com', '979824574', '2024-10-18 12:08:21', 2, NULL),
(824, 'Verónica Cruz Ramírez', NULL, NULL, 'Femenino', 'verónica.cruzramírez@yahoo.com', '928292123', '2024-10-18 12:08:21', 1, NULL),
(825, 'Jorge Cruz García', NULL, NULL, 'Masculino', 'jorge.cruzgarcía@hotmail.com', '935789993', '2024-10-18 12:08:21', 1, NULL),
(826, 'Claudia Rodríguez Sánchez', NULL, NULL, 'Femenino', 'claudia.rodríguezsánchez@hotmail.com', '941770236', '2024-10-18 12:08:21', 2, NULL),
(827, 'Luis Rodríguez García', NULL, NULL, 'Masculino', 'luis.rodríguezgarcía@gmail.com', '920639181', '2024-10-18 12:08:21', 2, NULL),
(828, 'Patricia Hernández Sánchez', NULL, NULL, 'Femenino', 'patricia.hernándezsánchez@yahoo.com', '973145995', '2024-10-18 12:08:21', 1, NULL),
(829, 'Miguel Ramírez Pérez', NULL, NULL, 'Masculino', 'miguel.ramírezpérez@hotmail.com', '911219958', '2024-10-18 12:08:21', 1, NULL),
(830, 'Juan Pérez Pérez', NULL, NULL, 'Masculino', 'juan.pérezpérez@outlook.com', '973052291', '2024-10-18 12:08:21', 2, NULL),
(831, 'Patricia Cruz Cruz', NULL, NULL, 'Femenino', 'patricia.cruzcruz@hotmail.com', '948042497', '2024-10-18 12:08:21', 1, NULL),
(832, 'Juan Martínez González', NULL, NULL, 'Masculino', 'juan.martínezgonzález@gmail.com', '927297991', '2024-10-18 12:08:21', 1, NULL),
(833, 'Jorge García Hernández', NULL, NULL, 'Masculino', 'jorge.garcíahernández@gmail.com', '928842037', '2024-10-18 12:08:21', 2, NULL),
(834, 'Juan Martínez Martínez', NULL, NULL, 'Masculino', 'juan.martínezmartínez@gmail.com', '988757259', '2024-10-18 12:08:21', 2, NULL),
(835, 'Mónica Cruz Cruz', NULL, NULL, 'Femenino', 'mónica.cruzcruz@yahoo.com', '967259556', '2024-10-18 12:08:21', 2, NULL),
(836, 'Miguel González Martínez', NULL, NULL, 'Masculino', 'miguel.gonzálezmartínez@yahoo.com', '954855815', '2024-10-18 12:08:21', 1, NULL),
(837, 'Miguel Martínez Rodríguez', NULL, NULL, 'Masculino', 'miguel.martínezrodríguez@yahoo.com', '978742403', '2024-10-18 12:08:21', 2, NULL),
(838, 'Luis González Hernández', NULL, NULL, 'Masculino', 'luis.gonzálezhernández@outlook.com', '986361532', '2024-10-18 12:08:21', 1, NULL),
(839, 'Claudia González Ramírez', NULL, NULL, 'Femenino', 'claudia.gonzálezramírez@outlook.com', '912942366', '2024-10-18 12:08:21', 2, NULL),
(840, 'Claudia Ramírez Sánchez', NULL, NULL, 'Femenino', 'claudia.ramírezsánchez@yahoo.com', '946245787', '2024-10-18 12:08:21', 1, NULL),
(841, 'Juan Rodríguez Sánchez', NULL, NULL, 'Masculino', 'juan.rodríguezsánchez@gmail.com', '933331365', '2024-10-18 12:08:21', 1, NULL),
(842, 'Carmen Sánchez Rodríguez', NULL, NULL, 'Femenino', 'carmen.sánchezrodríguez@outlook.com', '931951068', '2024-10-18 12:08:21', 1, NULL),
(843, 'Claudia Rodríguez Pérez', NULL, NULL, 'Femenino', 'claudia.rodríguezpérez@hotmail.com', '962577646', '2024-10-18 12:08:21', 1, NULL),
(844, 'Mónica García González', NULL, NULL, 'Femenino', 'mónica.garcíagonzález@gmail.com', '973232478', '2024-10-18 12:08:21', 2, NULL),
(845, 'Claudia Ramírez Hernández', NULL, NULL, 'Femenino', 'claudia.ramírezhernández@yahoo.com', '969128091', '2024-10-18 12:08:21', 1, NULL),
(846, 'Jorge García Pérez', NULL, NULL, 'Masculino', 'jorge.garcíapérez@hotmail.com', '921542871', '2024-10-18 12:08:21', 2, NULL),
(847, 'Eduardo Hernández Rodríguez', NULL, NULL, 'Masculino', 'eduardo.hernándezrodríguez@yahoo.com', '912036274', '2024-10-18 12:08:21', 1, NULL),
(848, 'Daniel Hernández Ramírez', NULL, NULL, 'Masculino', 'daniel.hernándezramírez@gmail.com', '945906067', '2024-10-18 12:08:21', 1, NULL),
(849, 'Laura Ramírez Rodríguez', NULL, NULL, 'Femenino', 'laura.ramírezrodríguez@hotmail.com', '987310339', '2024-10-18 12:08:21', 2, NULL),
(850, 'Verónica Sánchez Hernández', NULL, NULL, 'Femenino', 'verónica.sánchezhernández@hotmail.com', '910134052', '2024-10-18 12:08:21', 1, NULL),
(851, 'Mario Cruz Rodríguez', NULL, NULL, 'Masculino', 'mario.cruzrodríguez@hotmail.com', '985904514', '2024-10-18 12:08:21', 2, NULL),
(852, 'Mónica Rodríguez Ramírez', NULL, NULL, 'Femenino', 'mónica.rodríguezramírez@outlook.com', '980335839', '2024-10-18 12:08:21', 1, NULL),
(853, 'Daniel Martínez González', NULL, NULL, 'Masculino', 'daniel.martínezgonzález@hotmail.com', '934558197', '2024-10-18 12:08:21', 1, NULL),
(854, 'Eduardo López Rodríguez', NULL, NULL, 'Masculino', 'eduardo.lópezrodríguez@hotmail.com', '918238663', '2024-10-18 12:08:21', 2, NULL),
(855, 'Laura Cruz Ramírez', NULL, NULL, 'Femenino', 'laura.cruzramírez@gmail.com', '930846071', '2024-10-18 12:08:21', 2, NULL),
(856, 'Juan Ramírez López', NULL, NULL, 'Masculino', 'juan.ramírezlópez@yahoo.com', '915260417', '2024-10-18 12:08:21', 1, NULL),
(857, 'Miguel Rodríguez Sánchez', NULL, NULL, 'Masculino', 'miguel.rodríguezsánchez@gmail.com', '993155137', '2024-10-18 12:08:21', 2, NULL),
(858, 'Patricia Rodríguez Cruz', NULL, NULL, 'Femenino', 'patricia.rodríguezcruz@hotmail.com', '935794314', '2024-10-18 12:08:21', 2, NULL),
(859, 'Carmen Rodríguez González', NULL, NULL, 'Femenino', 'carmen.rodríguezgonzález@yahoo.com', '954686453', '2024-10-18 12:08:21', 1, NULL),
(860, 'Roberto López García', NULL, NULL, 'Masculino', 'roberto.lópezgarcía@yahoo.com', '963724410', '2024-10-18 12:08:21', 1, NULL),
(861, 'Carlos Hernández López', NULL, NULL, 'Masculino', 'carlos.hernándezlópez@outlook.com', '918765468', '2024-10-18 12:08:21', 2, NULL),
(862, 'Ana Rodríguez Ramírez', NULL, NULL, 'Femenino', 'ana.rodríguezramírez@hotmail.com', '972939904', '2024-10-18 12:08:21', 2, NULL),
(863, 'Rosa Sánchez Pérez', NULL, NULL, 'Femenino', 'rosa.sánchezpérez@outlook.com', '935339066', '2024-10-18 12:08:21', 1, NULL),
(864, 'María Rodríguez Hernández', NULL, NULL, 'Femenino', 'maría.rodríguezhernández@hotmail.com', '936638000', '2024-10-18 12:08:21', 1, NULL),
(865, 'Juan Rodríguez Pérez', NULL, NULL, 'Masculino', 'juan.rodríguezpérez@hotmail.com', '971425609', '2024-10-18 12:08:21', 1, NULL),
(866, 'José Martínez García', NULL, NULL, 'Masculino', 'josé.martínezgarcía@gmail.com', '922548691', '2024-10-18 12:08:21', 1, NULL),
(867, 'Laura Sánchez Hernández', NULL, NULL, 'Femenino', 'laura.sánchezhernández@gmail.com', '995725072', '2024-10-18 12:08:21', 2, NULL),
(868, 'Carmen Hernández García', NULL, NULL, 'Femenino', 'carmen.hernándezgarcía@hotmail.com', '967588225', '2024-10-18 12:08:21', 1, NULL),
(869, 'Jorge García González', NULL, NULL, 'Masculino', 'jorge.garcíagonzález@gmail.com', '931924360', '2024-10-18 12:08:21', 2, NULL),
(870, 'Mario Cruz Martínez', NULL, NULL, 'Masculino', 'mario.cruzmartínez@hotmail.com', '919360151', '2024-10-18 12:08:21', 1, NULL),
(871, 'Mónica Martínez González', NULL, NULL, 'Femenino', 'mónica.martínezgonzález@gmail.com', '999987274', '2024-10-18 12:08:21', 2, NULL),
(872, 'Luis López Hernández', NULL, NULL, 'Masculino', 'luis.lópezhernández@hotmail.com', '924733658', '2024-10-18 12:08:21', 2, NULL),
(873, 'Carlos González Rodríguez', NULL, NULL, 'Masculino', 'carlos.gonzálezrodríguez@yahoo.com', '969522493', '2024-10-18 12:08:21', 1, NULL),
(874, 'Jorge Pérez Sánchez', NULL, NULL, 'Masculino', 'jorge.pérezsánchez@hotmail.com', '963983639', '2024-10-18 12:08:21', 1, NULL),
(875, 'Elena Rodríguez López', NULL, NULL, 'Femenino', 'elena.rodríguezlópez@hotmail.com', '948037732', '2024-10-18 12:08:21', 1, NULL),
(876, 'Juan Rodríguez Ramírez', NULL, NULL, 'Masculino', 'juan.rodríguezramírez@hotmail.com', '926245564', '2024-10-18 12:08:21', 1, NULL),
(877, 'Mario López Martínez', NULL, NULL, 'Masculino', 'mario.lópezmartínez@gmail.com', '984920831', '2024-10-18 12:08:21', 2, NULL),
(878, 'José Sánchez Sánchez', NULL, NULL, 'Masculino', 'josé.sánchezsánchez@outlook.com', '983105799', '2024-10-18 12:08:21', 2, NULL),
(879, 'Daniel García Martínez', NULL, NULL, 'Masculino', 'daniel.garcíamartínez@hotmail.com', '965643519', '2024-10-18 12:08:21', 1, NULL),
(880, 'Carlos López Rodríguez', NULL, NULL, 'Masculino', 'carlos.lópezrodríguez@yahoo.com', '997164325', '2024-10-18 12:08:21', 2, NULL),
(881, 'Eduardo Ramírez Hernández', NULL, NULL, 'Masculino', 'eduardo.ramírezhernández@outlook.com', '932766798', '2024-10-18 12:08:21', 1, NULL),
(882, 'Ana Rodríguez Cruz', NULL, NULL, 'Femenino', 'ana.rodríguezcruz@outlook.com', '933863967', '2024-10-18 12:08:21', 1, NULL),
(883, 'Laura González García', NULL, NULL, 'Femenino', 'laura.gonzálezgarcía@gmail.com', '956640073', '2024-10-18 12:08:21', 1, NULL),
(884, 'Mónica García López', NULL, NULL, 'Femenino', 'mónica.garcíalópez@yahoo.com', '990364817', '2024-10-18 12:08:21', 1, NULL),
(885, 'Jorge Sánchez Rodríguez', NULL, NULL, 'Masculino', 'jorge.sánchezrodríguez@gmail.com', '951879588', '2024-10-18 12:08:21', 1, NULL),
(886, 'Rosa Ramírez Hernández', NULL, NULL, 'Femenino', 'rosa.ramírezhernández@gmail.com', '982562989', '2024-10-18 12:08:21', 2, NULL),
(887, 'Mónica López Cruz', NULL, NULL, 'Femenino', 'mónica.lópezcruz@outlook.com', '922190419', '2024-10-18 12:08:21', 2, NULL),
(888, 'Mónica López Cruz', NULL, NULL, 'Femenino', 'mónica.lópezcruz@gmail.com', '914643902', '2024-10-18 12:08:21', 1, NULL),
(889, 'Ana Pérez González', NULL, NULL, 'Femenino', 'ana.pérezgonzález@yahoo.com', '924172369', '2024-10-18 12:08:21', 1, NULL),
(890, 'Laura García García', NULL, NULL, 'Femenino', 'laura.garcíagarcía@hotmail.com', '977630979', '2024-10-18 12:08:21', 2, NULL),
(891, 'Daniel Hernández González', NULL, NULL, 'Masculino', 'daniel.hernándezgonzález@gmail.com', '944036190', '2024-10-18 12:08:21', 2, NULL),
(892, 'Miguel Rodríguez Cruz', NULL, NULL, 'Masculino', 'miguel.rodríguezcruz@outlook.com', '960241151', '2024-10-18 12:08:21', 1, NULL),
(893, 'Roberto Pérez Rodríguez', NULL, NULL, 'Masculino', 'roberto.pérezrodríguez@hotmail.com', '960778322', '2024-10-18 12:08:21', 2, NULL),
(894, 'Rosa Ramírez Ramírez', NULL, NULL, 'Femenino', 'rosa.ramírezramírez@outlook.com', '956581918', '2024-10-18 12:08:21', 2, NULL),
(895, 'Elena López Pérez', NULL, NULL, 'Femenino', 'elena.lópezpérez@yahoo.com', '996639482', '2024-10-18 12:08:21', 2, NULL),
(896, 'José Rodríguez Rodríguez', NULL, NULL, 'Masculino', 'josé.rodríguezrodríguez@hotmail.com', '934018695', '2024-10-18 12:08:21', 1, NULL),
(897, 'Carlos Rodríguez García', NULL, NULL, 'Masculino', 'carlos.rodríguezgarcía@outlook.com', '919794644', '2024-10-18 12:08:21', 1, NULL),
(898, 'Mónica Martínez González', NULL, NULL, 'Femenino', 'mónica.martínezgonzález@outlook.com', '972155803', '2024-10-18 12:08:21', 1, NULL),
(899, 'Mario Martínez Rodríguez', NULL, NULL, 'Masculino', 'mario.martínezrodríguez@yahoo.com', '966668645', '2024-10-18 12:08:21', 2, NULL),
(900, 'Verónica Martínez García', NULL, NULL, 'Femenino', 'verónica.martínezgarcía@yahoo.com', '991826743', '2024-10-18 12:08:21', 2, NULL),
(901, 'María Pérez García', NULL, NULL, 'Femenino', 'maría.pérezgarcía@gmail.com', '961438983', '2024-10-18 12:08:21', 1, NULL),
(902, 'Carlos Ramírez López', NULL, NULL, 'Masculino', 'carlos.ramírezlópez@hotmail.com', '973295298', '2024-10-18 12:08:21', 2, NULL),
(903, 'Jorge Pérez González', NULL, NULL, 'Masculino', 'jorge.pérezgonzález@gmail.com', '983824512', '2024-10-18 12:08:21', 1, NULL),
(904, 'Daniel González García', NULL, NULL, 'Masculino', 'daniel.gonzálezgarcía@hotmail.com', '940149755', '2024-10-18 12:08:21', 1, NULL),
(905, 'Luis García Sánchez', NULL, NULL, 'Masculino', 'luis.garcíasánchez@gmail.com', '938503339', '2024-10-18 12:08:21', 1, NULL),
(906, 'María Pérez Pérez', NULL, NULL, 'Femenino', 'maría.pérezpérez@gmail.com', '975345499', '2024-10-18 12:08:21', 1, NULL),
(907, 'Daniel Ramírez Hernández', NULL, NULL, 'Masculino', 'daniel.ramírezhernández@gmail.com', '944667572', '2024-10-18 12:08:21', 1, NULL),
(908, 'Ana Ramírez Ramírez', NULL, NULL, 'Femenino', 'ana.ramírezramírez@outlook.com', '945500840', '2024-10-18 12:08:21', 1, NULL),
(909, 'Luis Cruz González', NULL, NULL, 'Masculino', 'luis.cruzgonzález@gmail.com', '946285372', '2024-10-18 12:08:21', 2, NULL),
(910, 'Ana Cruz González', NULL, NULL, 'Femenino', 'ana.cruzgonzález@yahoo.com', '931049288', '2024-10-18 12:08:21', 1, NULL),
(911, 'Laura Ramírez García', NULL, NULL, 'Femenino', 'laura.ramírezgarcía@yahoo.com', '963364673', '2024-10-18 12:08:21', 2, NULL),
(912, 'Juan Cruz García', NULL, NULL, 'Masculino', 'juan.cruzgarcía@hotmail.com', '934948202', '2024-10-18 12:08:21', 1, NULL),
(913, 'Miguel Rodríguez Hernández', NULL, NULL, 'Masculino', 'miguel.rodríguezhernández@outlook.com', '925835890', '2024-10-18 12:08:21', 1, NULL),
(914, 'Juan González López', NULL, NULL, 'Masculino', 'juan.gonzálezlópez@outlook.com', '943927892', '2024-10-18 12:08:21', 2, NULL),
(915, 'Mario Sánchez López', NULL, NULL, 'Masculino', 'mario.sánchezlópez@yahoo.com', '922581678', '2024-10-18 12:08:21', 2, NULL),
(916, 'José García Pérez', NULL, NULL, 'Masculino', 'josé.garcíapérez@outlook.com', '923989692', '2024-10-18 12:08:21', 1, NULL),
(917, 'Elena Pérez Ramírez', NULL, NULL, 'Femenino', 'elena.pérezramírez@yahoo.com', '952682111', '2024-10-18 12:08:21', 2, NULL),
(918, 'Carlos Martínez Pérez', NULL, NULL, 'Masculino', 'carlos.martínezpérez@gmail.com', '940524619', '2024-10-18 12:08:21', 2, NULL),
(919, 'Patricia Rodríguez Cruz', NULL, NULL, 'Femenino', 'patricia.rodríguezcruz@outlook.com', '964591780', '2024-10-18 12:08:21', 1, NULL),
(920, 'Miguel García Sánchez', NULL, NULL, 'Masculino', 'miguel.garcíasánchez@hotmail.com', '980559365', '2024-10-18 12:08:21', 2, NULL),
(921, 'Laura Cruz Hernández', NULL, NULL, 'Femenino', 'laura.cruzhernández@outlook.com', '944789679', '2024-10-18 12:08:21', 2, NULL),
(922, 'María Hernández Hernández', NULL, NULL, 'Femenino', 'maría.hernándezhernández@gmail.com', '976054303', '2024-10-18 12:08:21', 1, NULL),
(923, 'Daniel Hernández López', NULL, NULL, 'Masculino', 'daniel.hernándezlópez@gmail.com', '972089417', '2024-10-18 12:08:21', 2, NULL),
(924, 'Rosa González Pérez', NULL, NULL, 'Femenino', 'rosa.gonzálezpérez@hotmail.com', '993638080', '2024-10-18 12:08:21', 2, NULL),
(925, 'María González López', NULL, NULL, 'Femenino', 'maría.gonzálezlópez@yahoo.com', '934607155', '2024-10-18 12:08:21', 2, NULL),
(926, 'María Ramírez Rodríguez', NULL, NULL, 'Femenino', 'maría.ramírezrodríguez@hotmail.com', '996343356', '2024-10-18 12:08:21', 1, NULL),
(927, 'Juan Sánchez Martínez', NULL, NULL, 'Masculino', 'juan.sánchezmartínez@yahoo.com', '958027489', '2024-10-18 12:08:21', 1, NULL),
(928, 'Jorge Cruz Pérez', NULL, NULL, 'Masculino', 'jorge.cruzpérez@outlook.com', '944463971', '2024-10-18 12:08:21', 1, NULL),
(929, 'Mónica Ramírez Rodríguez', NULL, NULL, 'Femenino', 'mónica.ramírezrodríguez@hotmail.com', '966747467', '2024-10-18 12:08:21', 1, NULL),
(930, 'José García Sánchez', NULL, NULL, 'Masculino', 'josé.garcíasánchez@hotmail.com', '922724619', '2024-10-18 12:08:21', 1, NULL),
(931, 'Juan Pérez Sánchez', NULL, NULL, 'Masculino', 'juan.pérezsánchez@yahoo.com', '974951439', '2024-10-18 12:08:21', 1, NULL),
(932, 'José López González', NULL, NULL, 'Masculino', 'josé.lópezgonzález@hotmail.com', '977602355', '2024-10-18 12:08:22', 2, NULL),
(933, 'Rosa Ramírez Pérez', NULL, NULL, 'Femenino', 'rosa.ramírezpérez@yahoo.com', '916861907', '2024-10-18 12:08:22', 2, NULL),
(934, 'Verónica Cruz Ramírez', NULL, NULL, 'Femenino', 'verónica.cruzramírez@hotmail.com', '997775932', '2024-10-18 12:08:22', 2, NULL),
(935, 'Miguel Ramírez González', NULL, NULL, 'Masculino', 'miguel.ramírezgonzález@gmail.com', '960948869', '2024-10-18 12:08:22', 2, NULL),
(936, 'Rosa González Rodríguez', NULL, NULL, 'Femenino', 'rosa.gonzálezrodríguez@gmail.com', '939390286', '2024-10-18 12:08:22', 1, NULL),
(937, 'Claudia González Cruz', NULL, NULL, 'Femenino', 'claudia.gonzálezcruz@hotmail.com', '990930403', '2024-10-18 12:08:22', 2, NULL),
(938, 'Carmen Ramírez Ramírez', NULL, NULL, 'Femenino', 'carmen.ramírezramírez@gmail.com', '918657180', '2024-10-18 12:08:22', 2, NULL),
(939, 'Rosa Pérez González', NULL, NULL, 'Femenino', 'rosa.pérezgonzález@outlook.com', '964021825', '2024-10-18 12:08:22', 1, NULL),
(940, 'Patricia Rodríguez García', NULL, NULL, 'Femenino', 'patricia.rodríguezgarcía@outlook.com', '950206128', '2024-10-18 12:08:22', 2, NULL),
(941, 'José Rodríguez Cruz', NULL, NULL, 'Masculino', 'josé.rodríguezcruz@hotmail.com', '981950923', '2024-10-18 12:08:22', 2, NULL),
(942, 'Elena López Hernández', NULL, NULL, 'Femenino', 'elena.lópezhernández@gmail.com', '938183021', '2024-10-18 12:08:22', 2, NULL),
(943, 'Claudia Rodríguez Hernández', NULL, NULL, 'Femenino', 'claudia.rodríguezhernández@gmail.com', '976461640', '2024-10-18 12:08:22', 1, NULL),
(944, 'Luis Cruz Ramírez', NULL, NULL, 'Masculino', 'luis.cruzramírez@hotmail.com', '999685095', '2024-10-18 12:08:22', 1, NULL),
(945, 'Carmen Rodríguez García', NULL, NULL, 'Femenino', 'carmen.rodríguezgarcía@outlook.com', '960216614', '2024-10-18 12:08:22', 2, NULL),
(946, 'Roberto Sánchez Martínez', NULL, NULL, 'Masculino', 'roberto.sánchezmartínez@gmail.com', '953610866', '2024-10-18 12:08:22', 1, NULL),
(947, 'Verónica Hernández Rodríguez', NULL, NULL, 'Femenino', 'verónica.hernándezrodríguez@outlook.com', '935845347', '2024-10-18 12:08:22', 1, NULL),
(948, 'Daniel García García', NULL, NULL, 'Masculino', 'daniel.garcíagarcía@hotmail.com', '999277690', '2024-10-18 12:08:22', 2, NULL),
(949, 'Claudia Hernández Martínez', NULL, NULL, 'Femenino', 'claudia.hernándezmartínez@outlook.com', '961980256', '2024-10-18 12:08:22', 1, NULL),
(950, 'Laura Ramírez Martínez', NULL, NULL, 'Femenino', 'laura.ramírezmartínez@gmail.com', '916456805', '2024-10-18 12:08:22', 2, NULL),
(951, 'Eduardo García Hernández', NULL, NULL, 'Masculino', 'eduardo.garcíahernández@gmail.com', '995583253', '2024-10-18 12:08:22', 2, NULL),
(952, 'Roberto Cruz González', NULL, NULL, 'Masculino', 'roberto.cruzgonzález@yahoo.com', '931359208', '2024-10-18 12:08:22', 1, NULL),
(953, 'Ana Martínez Ramírez', NULL, NULL, 'Femenino', 'ana.martínezramírez@outlook.com', '973517100', '2024-10-18 12:08:22', 1, NULL),
(954, 'Ana González López', NULL, NULL, 'Femenino', 'ana.gonzálezlópez@yahoo.com', '957656421', '2024-10-18 12:08:22', 2, NULL),
(955, 'Rosa Pérez Hernández', NULL, NULL, 'Femenino', 'rosa.pérezhernández@outlook.com', '992151857', '2024-10-18 12:08:22', 1, NULL),
(956, 'Carmen Hernández Sánchez', NULL, NULL, 'Femenino', 'carmen.hernándezsánchez@hotmail.com', '925135257', '2024-10-18 12:08:22', 2, NULL),
(957, 'Patricia González López', NULL, NULL, 'Femenino', 'patricia.gonzálezlópez@gmail.com', '996776505', '2024-10-18 12:08:22', 1, NULL),
(958, 'Roberto Sánchez Hernández', NULL, NULL, 'Masculino', 'roberto.sánchezhernández@hotmail.com', '923243917', '2024-10-18 12:08:22', 1, NULL),
(959, 'Mario Hernández Pérez', NULL, NULL, 'Masculino', 'mario.hernándezpérez@outlook.com', '914530281', '2024-10-18 12:08:22', 2, NULL),
(960, 'José Rodríguez López', NULL, NULL, 'Masculino', 'josé.rodríguezlópez@hotmail.com', '997978510', '2024-10-18 12:08:22', 2, NULL),
(961, 'María López Rodríguez', NULL, NULL, 'Femenino', 'maría.lópezrodríguez@gmail.com', '991659484', '2024-10-18 12:08:22', 2, NULL),
(962, 'Miguel Rodríguez García', NULL, NULL, 'Masculino', 'miguel.rodríguezgarcía@gmail.com', '994482513', '2024-10-18 12:08:22', 1, NULL),
(963, 'Rosa Martínez Cruz', NULL, NULL, 'Femenino', 'rosa.martínezcruz@gmail.com', '964345494', '2024-10-18 12:08:22', 1, NULL),
(964, 'María González García', NULL, NULL, 'Femenino', 'maría.gonzálezgarcía@yahoo.com', '919827621', '2024-10-18 12:08:22', 1, NULL),
(965, 'Eduardo González Rodríguez', NULL, NULL, 'Masculino', 'eduardo.gonzálezrodríguez@gmail.com', '996716533', '2024-10-18 12:08:22', 1, NULL),
(966, 'Luis García Rodríguez', NULL, NULL, 'Masculino', 'luis.garcíarodríguez@outlook.com', '973420340', '2024-10-18 12:08:22', 1, NULL),
(967, 'Roberto López García', NULL, NULL, 'Masculino', 'roberto.lópezgarcía@yahoo.com', '968513194', '2024-10-18 12:08:22', 1, NULL),
(968, 'Verónica García Martínez', NULL, NULL, 'Femenino', 'verónica.garcíamartínez@outlook.com', '976304255', '2024-10-18 12:08:22', 2, NULL),
(969, 'Juan Ramírez Pérez', NULL, NULL, 'Masculino', 'juan.ramírezpérez@outlook.com', '969328423', '2024-10-18 12:08:22', 1, NULL),
(970, 'Mónica González García', NULL, NULL, 'Femenino', 'mónica.gonzálezgarcía@gmail.com', '981160353', '2024-10-18 12:08:22', 2, NULL),
(971, 'Jorge Hernández Rodríguez', NULL, NULL, 'Masculino', 'jorge.hernándezrodríguez@yahoo.com', '988176159', '2024-10-18 12:08:22', 1, NULL),
(972, 'Carlos Hernández Pérez', NULL, NULL, 'Masculino', 'carlos.hernándezpérez@gmail.com', '951175916', '2024-10-18 12:08:22', 2, NULL),
(973, 'Mario Martínez Sánchez', NULL, NULL, 'Masculino', 'mario.martínezsánchez@yahoo.com', '984006620', '2024-10-18 12:08:22', 2, NULL),
(974, 'Verónica Pérez Ramírez', NULL, NULL, 'Femenino', 'verónica.pérezramírez@yahoo.com', '910378738', '2024-10-18 12:08:22', 2, NULL),
(975, 'Jorge García Pérez', NULL, NULL, 'Masculino', 'jorge.garcíapérez@hotmail.com', '923547570', '2024-10-18 12:08:22', 2, NULL),
(976, 'Luis González Cruz', NULL, NULL, 'Masculino', 'luis.gonzálezcruz@yahoo.com', '965428530', '2024-10-18 12:08:22', 2, NULL),
(977, 'Rosa Pérez Pérez', NULL, NULL, 'Femenino', 'rosa.pérezpérez@yahoo.com', '916293293', '2024-10-18 12:08:22', 1, NULL),
(978, 'Daniel Hernández Cruz', NULL, NULL, 'Masculino', 'daniel.hernándezcruz@hotmail.com', '915340878', '2024-10-18 12:08:22', 1, NULL),
(979, 'Ana Martínez García', NULL, NULL, 'Femenino', 'ana.martínezgarcía@gmail.com', '953903922', '2024-10-18 12:08:22', 1, NULL),
(980, 'Carmen Sánchez López', NULL, NULL, 'Femenino', 'carmen.sánchezlópez@outlook.com', '918478517', '2024-10-18 12:08:22', 1, NULL),
(981, 'Elena González Ramírez', NULL, NULL, 'Femenino', 'elena.gonzálezramírez@hotmail.com', '910143223', '2024-10-18 12:08:22', 2, NULL),
(982, 'Eduardo López Sánchez', NULL, NULL, 'Masculino', 'eduardo.lópezsánchez@outlook.com', '911101736', '2024-10-18 12:08:22', 1, NULL),
(983, 'Mónica Ramírez Ramírez', NULL, NULL, 'Femenino', 'mónica.ramírezramírez@outlook.com', '981450684', '2024-10-18 12:08:22', 2, NULL),
(984, 'Patricia Rodríguez González', NULL, NULL, 'Femenino', 'patricia.rodríguezgonzález@yahoo.com', '949859051', '2024-10-18 12:08:22', 2, NULL),
(985, 'Laura Ramírez Martínez', NULL, NULL, 'Femenino', 'laura.ramírezmartínez@hotmail.com', '983500354', '2024-10-18 12:08:22', 1, NULL),
(986, 'Elena Pérez López', NULL, NULL, 'Femenino', 'elena.pérezlópez@gmail.com', '963569539', '2024-10-18 12:08:22', 2, NULL),
(987, 'Verónica Martínez González', NULL, NULL, 'Femenino', 'verónica.martínezgonzález@outlook.com', '956463665', '2024-10-18 12:08:22', 1, NULL),
(988, 'Rosa Pérez Sánchez', NULL, NULL, 'Femenino', 'rosa.pérezsánchez@hotmail.com', '972687824', '2024-10-18 12:08:22', 1, NULL),
(989, 'Rosa García Rodríguez', NULL, NULL, 'Femenino', 'rosa.garcíarodríguez@yahoo.com', '968868420', '2024-10-18 12:08:22', 2, NULL),
(990, 'Mónica Cruz Cruz', NULL, NULL, 'Femenino', 'mónica.cruzcruz@yahoo.com', '956455005', '2024-10-18 12:08:22', 1, NULL),
(991, 'Carmen Sánchez Rodríguez', NULL, NULL, 'Femenino', 'carmen.sánchezrodríguez@gmail.com', '947102784', '2024-10-18 12:08:22', 1, NULL),
(992, 'Patricia Ramírez Martínez', NULL, NULL, 'Femenino', 'patricia.ramírezmartínez@gmail.com', '916239388', '2024-10-18 12:08:22', 1, NULL),
(993, 'Mario Pérez López', NULL, NULL, 'Masculino', 'mario.pérezlópez@outlook.com', '955905575', '2024-10-18 12:08:22', 2, NULL),
(994, 'Carlos Rodríguez Pérez', NULL, NULL, 'Masculino', 'carlos.rodríguezpérez@yahoo.com', '937182147', '2024-10-18 12:08:22', 2, NULL),
(995, 'Carlos Cruz Rodríguez', NULL, NULL, 'Masculino', 'carlos.cruzrodríguez@hotmail.com', '941414989', '2024-10-18 12:08:22', 2, NULL),
(996, 'Miguel Pérez García', NULL, NULL, 'Masculino', 'miguel.pérezgarcía@gmail.com', '923934949', '2024-10-18 12:08:22', 2, NULL),
(997, 'Miguel López Cruz', NULL, NULL, 'Masculino', 'miguel.lópezcruz@yahoo.com', '923502395', '2024-10-18 12:08:22', 1, NULL),
(998, 'Rosa González Hernández', NULL, NULL, 'Femenino', 'rosa.gonzálezhernández@gmail.com', '977153066', '2024-10-18 12:08:22', 1, NULL),
(999, 'Jorge Sánchez Rodríguez', NULL, NULL, 'Masculino', 'jorge.sánchezrodríguez@hotmail.com', '922413697', '2024-10-18 12:08:22', 1, NULL),
(1000, 'Claudia Martínez Pérez', NULL, NULL, 'Femenino', 'claudia.martínezpérez@outlook.com', '915186408', '2024-10-18 12:08:22', 1, NULL),
(1001, 'Claudia García Martínez', NULL, NULL, 'Femenino', 'claudia.garcíamartínez@gmail.com', '930717891', '2024-10-18 12:08:22', 2, NULL),
(1002, 'Verónica González Martínez', NULL, NULL, 'Femenino', 'verónica.gonzálezmartínez@hotmail.com', '935163335', '2024-10-18 12:08:22', 2, NULL),
(1003, 'Elena Cruz Pérez', NULL, NULL, 'Femenino', 'elena.cruzpérez@gmail.com', '910600515', '2024-10-18 12:08:22', 1, NULL),
(1004, 'Jorge Sánchez López', NULL, NULL, 'Masculino', 'jorge.sánchezlópez@yahoo.com', '983592030', '2024-10-18 12:08:22', 2, NULL),
(1005, 'Mario López López', NULL, NULL, 'Masculino', 'mario.lópezlópez@yahoo.com', '926534991', '2024-10-18 12:08:22', 1, NULL),
(1006, 'Jorge Pérez Ramírez', NULL, NULL, 'Masculino', 'jorge.pérezramírez@gmail.com', '934240867', '2024-10-18 12:08:22', 2, NULL),
(1007, 'José Cruz Cruz', NULL, NULL, 'Masculino', 'josé.cruzcruz@outlook.com', '985099731', '2024-10-18 12:08:22', 2, NULL),
(1008, 'Elena Hernández Rodríguez', NULL, NULL, 'Femenino', 'elena.hernándezrodríguez@yahoo.com', '989147799', '2024-10-18 12:08:22', 1, NULL),
(1009, 'Miguel Pérez Sánchez', NULL, NULL, 'Masculino', 'miguel.pérezsánchez@gmail.com', '938637998', '2024-10-18 12:08:22', 1, NULL),
(1017, 'solano peralta', 'fumador', 'Ludopata', 'Masculino', 'diana@gmail.com', '973128932', '2024-12-02 21:01:33', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado'),
(3, 'Paciente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `correo`, `contrasena`, `fecha`, `rol`) VALUES
(12, 'empleado', 'usuario@gmail.com', '12345', '2022-08-27 16:43:37', 2),
(13, 'Administrador', 'admin@softcodepm.com', '12345', '2022-08-29 14:22:36', 1),
(14, 'Mario', 'mario.cruzgonzález@gmail.com', 'fTOSAAPY', '2024-10-18 12:48:48', 3),
(15, 'Miguel', 'miguel.ramírezpérez@yahoo.com', 'PntSHgBd', '2024-10-18 12:48:48', 3),
(16, 'Mónica', 'mónica.hernándezcruz@hotmail.com', 'KPu9fcn5', '2024-10-18 12:48:48', 3),
(17, 'Mario', 'mario.sánchezramírez@hotmail.com', 'JPkoePs6', '2024-10-18 12:48:48', 3),
(18, 'Luis', 'luis.rodríguezcruz@gmail.com', 'sTutNRXg', '2024-10-18 12:48:48', 3),
(19, 'José', 'josé.pérezpérez@outlook.com', 'afxSHhWX', '2024-10-18 12:48:48', 3),
(20, 'elias', 'elioas@gmail.com', '$2y$10$bvBQ51UQD1vkrcZ9.pQQj.DcX2e88Qy0aDrMjIgr19MQyEhoRBfOm', '2024-11-29 03:26:45', 3),
(21, 'david', 'david454@gmail.com', '$2y$10$Dmrl.Wd.0iJdbjfd3dPDd.WdUIp./EGyNeaB7fVQm9o27aAGqOPRS', '2024-11-29 03:27:56', 3),
(22, 'Admin', 'admindevelop@gmail.com', '123456789', '2024-12-02 19:08:50', 1),
(24, 'mijael', 'crishago11641@gmail.com', '$2y$10$MaLay2P6dedpWBedCFW5AeCuqeCnn.2aBdVu16uZjqzNf6Arx3Ely', '2024-12-02 20:28:42', 3),
(25, 'Diana', 'diana@gmail.com', '123456789', '2024-12-02 20:31:45', 2),
(26, 'paciente', 'pacient@gmail.com', '12345', '2024-12-02 20:44:57', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_citas_paciente` (`id_paciente`),
  ADD KEY `fk_citas_doctor` (`id_doctor`),
  ADD KEY `fk_citas_especialidad` (`id_especialidad`),
  ADD KEY `fk_citas_estado` (`estado`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_doctor_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_horario_doctor` (`id_doctor`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `permisos` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1018;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_citas_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `fk_citas_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`),
  ADD CONSTRAINT `fk_citas_estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`id`),
  ADD CONSTRAINT `fk_citas_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`);

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_doctor_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidades` (`id`);

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_doctor` FOREIGN KEY (`id_doctor`) REFERENCES `doctor` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `permisos` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
