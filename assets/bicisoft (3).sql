-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-10-2019 a las 19:54:14
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bicisoft`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carreras`
--

CREATE TABLE `carreras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `terminada` tinyint(1) NOT NULL DEFAULT 0,
  `empezada` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `id_tipo`, `fecha`, `terminada`, `empezada`) VALUES
(11, 'MARATON 27 ANIVERSARIO AIRE LIBRE', 3, '2019-10-03', 1, 1),
(12, 'PRUEBA', 3, '2019-10-03', 0, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `carreras_no_finalizadas_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `carreras_no_finalizadas_view` (
`id` int(11)
,`nombre` varchar(50)
,`id_tipo` int(11)
,`fecha` date
,`terminada` tinyint(1)
,`descripcion` varchar(50)
,`max_vueltas` tinyint(2)
,`salen_todos` tinyint(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `carreras_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `carreras_view` (
`id` int(11)
,`nombre` varchar(50)
,`id_tipo` int(11)
,`fecha` date
,`terminada` tinyint(1)
,`descripcion` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_corredores`
--

CREATE TABLE `carrera_corredores` (
  `id_carrera` int(11) NOT NULL,
  `id_corredor` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tiempo` time NOT NULL DEFAULT '00:00:00',
  `vueltas` int(5) NOT NULL DEFAULT 0,
  `posicion` int(5) NOT NULL DEFAULT 0,
  `global` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera_corredores`
--

INSERT INTO `carrera_corredores` (`id_carrera`, `id_corredor`, `id_categoria`, `numero`, `tiempo`, `vueltas`, `posicion`, `global`) VALUES
(11, 1123123, 2, 1, '00:00:45', 1, 1, 5),
(11, 4157855, 2, 2, '00:00:48', 1, 4, 7),
(11, 11111111, 2, 3, '00:00:47', 1, 2, 6),
(11, 22145547, 1, 4, '00:00:56', 1, 3, 10),
(11, 29457874, 3, 5, '00:00:39', 1, 3, 3),
(11, 31376213, 3, 6, '00:00:43', 1, 1, 4),
(11, 41992131, 2, 7, '00:00:53', 1, 5, 9),
(11, 43123633, 2, 8, '00:01:04', 1, 4, 12),
(11, 44998234, 3, 9, '00:00:51', 1, 2, 8),
(11, 123323123, 3, 10, '00:00:32', 1, 1, 1),
(11, 834234233, 2, 11, '00:01:00', 1, 6, 11),
(11, 2147483647, 2, 12, '00:00:36', 1, 2, 2),
(12, 1123123, 2, 140, '00:00:00', 0, 1, 2),
(12, 4157855, 2, 12, '00:00:02', 1, 1, 1),
(12, 11111111, 2, 13, '00:00:00', 0, 1, 2),
(12, 29457874, 3, 21, '00:00:00', 0, 1, 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `carrera_corredor_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `carrera_corredor_view` (
`documento` int(11)
,`numero` int(11)
,`nombre` varchar(30)
,`apellido` varchar(30)
,`categoria` varchar(50)
,`posicion` int(5)
,`tiempo` time
,`vueltas` int(5)
,`global` int(5)
,`id_carrera` int(11)
,`id_categoria` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_marcas`
--

CREATE TABLE `carrera_marcas` (
  `id_carrera` int(11) NOT NULL,
  `numero_corredor` int(11) NOT NULL,
  `marca` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera_marcas`
--

INSERT INTO `carrera_marcas` (`id_carrera`, `numero_corredor`, `marca`) VALUES
(11, 1, '2019-10-03 09:49:51'),
(11, 1, '2019-10-03 09:50:36'),
(11, 2, '2019-10-03 09:49:51'),
(11, 2, '2019-10-03 09:50:39'),
(11, 3, '2019-10-03 09:49:51'),
(11, 3, '2019-10-03 09:50:38'),
(11, 4, '2019-10-03 09:49:51'),
(11, 4, '2019-10-03 09:50:47'),
(11, 5, '2019-10-03 09:49:51'),
(11, 5, '2019-10-03 09:50:30'),
(11, 6, '2019-10-03 09:49:51'),
(11, 6, '2019-10-03 09:50:34'),
(11, 7, '2019-10-03 09:49:51'),
(11, 7, '2019-10-03 09:50:44'),
(11, 8, '2019-10-03 09:49:51'),
(11, 8, '2019-10-03 09:50:55'),
(11, 9, '2019-10-03 09:49:51'),
(11, 9, '2019-10-03 09:50:42'),
(11, 10, '2019-10-03 09:49:51'),
(11, 10, '2019-10-03 09:50:23'),
(11, 11, '2019-10-03 09:49:51'),
(11, 11, '2019-10-03 09:50:51'),
(11, 12, '2019-10-03 09:49:51'),
(11, 12, '2019-10-03 09:50:27'),
(12, 12, '2019-10-03 14:44:35'),
(12, 12, '2019-10-03 14:44:37'),
(12, 13, '2019-10-03 14:44:35'),
(12, 21, '2019-10-03 14:44:35'),
(12, 140, '2019-10-03 14:44:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `observacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `descripcion`, `observacion`) VALUES
(1, 'MAYOR', 'mayor de 15 años'),
(2, 'JUNIOR', 'menor de 15 años'),
(3, 'ELITE', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corredores`
--

CREATE TABLE `corredores` (
  `documento` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `corredores`
--

INSERT INTO `corredores` (`documento`, `nombre`, `apellido`, `categoria`) VALUES
(1123123, 'OBI-WAN', 'KENOBI', 2),
(4157855, 'PEDRO', 'VILLEGAS', 1),
(11111111, 'JUAN', 'MARTIN', 2),
(22145547, 'JUAN', 'PEREZ', 1),
(29457874, 'ROBERTO', 'TORANZA', 3),
(31376213, 'FEDERICO', 'MICHEL', 3),
(41992131, 'HARRISON', 'FORD', 2),
(43123633, 'JONNY', 'CASH', 2),
(44998234, 'RINGO', 'STAR', 3),
(123323123, 'AXEL', 'ROSE', 2),
(834234233, 'JOHN', 'Q', 2),
(2147483647, 'DANIEL', 'LARUSSO', 2);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `corredores_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `corredores_view` (
`documento` int(11)
,`nombre` varchar(30)
,`apellido` varchar(30)
,`categoria` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_carreras`
--

CREATE TABLE `tipo_carreras` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `max_vueltas` tinyint(2) NOT NULL,
  `salen_todos` tinyint(1) NOT NULL,
  `condiciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_carreras`
--

INSERT INTO `tipo_carreras` (`id`, `descripcion`, `max_vueltas`, `salen_todos`, `condiciones`) VALUES
(1, 'CONTRARRELOJ', 1, 0, 'MARCAR NUMERO CUANDO SALE Y CUANDO LLEGA. SALE 1 POR 1'),
(2, 'HORA Y VUELTA', 0, 1, 'DESPUES DE APROX. 1 HORA, CUANDO EL NRO1 PASA LA META SE CANTA ULTIMA VUELTA PARA TODOS. 		UNA VEZ QUE TERMINA EL QUE ESTE EN LA POSICION NRO 1 DESPUES DE CANTARLE ULTIMA VUELTA SE CIERRA LA CARRERA, TODOS LOS QUE PASEN LA META A PARTIR DE AHI, FINALIZAN EN LA POSICION QUE ESTEN.'),
(3, 'PUNTO A PUNTO', 1, 1, ' LARGAN TODOS AL MISMO TIEMPO, Y SE MARCA SOLO LA LLEGADA. EXCEPCION: A VECES LARGAN DE A 2 TANDAS CON DIFERENCIA DE 2 MINUTOS APROXIMADAMENTE.(NUEVA CARRERA)'),
(4, 'POR ETAPAS', 0, 1, 'MARCAR SALIDA TODOS JUNTOS Y TIEMPOS PARCIALES (ETAPAS) DEFINIR CANTIDAD DE ETAPAS');

-- --------------------------------------------------------

--
-- Estructura para la vista `carreras_no_finalizadas_view`
--
DROP TABLE IF EXISTS `carreras_no_finalizadas_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carreras_no_finalizadas_view`  AS  select `c`.`id` AS `id`,`c`.`nombre` AS `nombre`,`c`.`id_tipo` AS `id_tipo`,`c`.`fecha` AS `fecha`,`c`.`terminada` AS `terminada`,`tc`.`descripcion` AS `descripcion`,`tc`.`max_vueltas` AS `max_vueltas`,`tc`.`salen_todos` AS `salen_todos` from (`carreras` `c` join `tipo_carreras` `tc` on(`c`.`id_tipo` = `tc`.`id`)) where `c`.`terminada` = 0 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `carreras_view`
--
DROP TABLE IF EXISTS `carreras_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carreras_view`  AS  select `c`.`id` AS `id`,`c`.`nombre` AS `nombre`,`c`.`id_tipo` AS `id_tipo`,`c`.`fecha` AS `fecha`,`c`.`terminada` AS `terminada`,`tc`.`descripcion` AS `descripcion` from (`carreras` `c` join `tipo_carreras` `tc` on(`c`.`id_tipo` = `tc`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `carrera_corredor_view`
--
DROP TABLE IF EXISTS `carrera_corredor_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carrera_corredor_view`  AS  select `co`.`documento` AS `documento`,`cc`.`numero` AS `numero`,`co`.`nombre` AS `nombre`,`co`.`apellido` AS `apellido`,`cat`.`descripcion` AS `categoria`,`cc`.`posicion` AS `posicion`,`cc`.`tiempo` AS `tiempo`,`cc`.`vueltas` AS `vueltas`,`cc`.`global` AS `global`,`ca`.`id` AS `id_carrera`,`cat`.`id` AS `id_categoria` from (((`carrera_corredores` `cc` join `corredores` `co` on(`cc`.`id_corredor` = `co`.`documento`)) join `carreras` `ca` on(`cc`.`id_carrera` = `ca`.`id`)) join `categorias` `cat` on(`cc`.`id_categoria` = `cat`.`id`)) order by `cc`.`vueltas` desc,`cc`.`tiempo` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `corredores_view`
--
DROP TABLE IF EXISTS `corredores_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `corredores_view`  AS  select `c`.`documento` AS `documento`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`ca`.`descripcion` AS `categoria` from (`corredores` `c` join `categorias` `ca` on(`c`.`categoria` = `ca`.`id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carreras`
--
ALTER TABLE `carreras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `carrera_corredores`
--
ALTER TABLE `carrera_corredores`
  ADD PRIMARY KEY (`id_carrera`,`id_corredor`) USING BTREE,
  ADD UNIQUE KEY `unique` (`id_carrera`,`id_corredor`) USING BTREE,
  ADD UNIQUE KEY `numeroIndex` (`id_carrera`,`numero`);

--
-- Indices de la tabla `carrera_marcas`
--
ALTER TABLE `carrera_marcas`
  ADD PRIMARY KEY (`id_carrera`,`numero_corredor`,`marca`),
  ADD UNIQUE KEY `unique` (`id_carrera`,`numero_corredor`,`marca`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `corredores`
--
ALTER TABLE `corredores`
  ADD PRIMARY KEY (`documento`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- Indices de la tabla `tipo_carreras`
--
ALTER TABLE `tipo_carreras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carreras`
--
ALTER TABLE `carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_carreras`
--
ALTER TABLE `tipo_carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
