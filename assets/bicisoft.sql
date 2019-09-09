-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2019 a las 19:32:00
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
  `terminada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carreras`
--

INSERT INTO `carreras` (`id`, `nombre`, `id_tipo`, `fecha`, `terminada`) VALUES
(1, 'VUELTA RIO GRANDE', 1, '2019-08-17', 0),
(2, 'TRIATLON', 3, '2019-10-25', 0);

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
  `numero` int(11) NOT NULL,
  `tiempo` int(11) NOT NULL DEFAULT 0,
  `vueltas` int(5) NOT NULL DEFAULT 0,
  `posicion` int(5) NOT NULL,
  `global` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera_corredores`
--

INSERT INTO `carrera_corredores` (`id_carrera`, `id_corredor`, `numero`, `tiempo`, `vueltas`, `posicion`, `global`) VALUES
(1, 22145547, 411, 0, 0, 0, 0),
(1, 31376213, 200, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `carrera_corredor_view`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `carrera_corredor_view` (
`documento` int(11)
,`nombre` varchar(30)
,`apellido` varchar(30)
,`categoria` varchar(50)
,`posicion` int(5)
,`tiempo` int(11)
,`vueltas` int(5)
,`global` int(5)
,`id_carrera` int(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera_marcas`
--

CREATE TABLE `carrera_marcas` (
  `id_carrera` int(11) NOT NULL,
  `id_corredor` int(11) NOT NULL,
  `marca` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(2, 'JUNIOR', 'menor de 15 años');

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
(4157855, 'PEDRO', 'VILLEGAS', 2),
(22145547, 'JUAN', 'PEREZ', 1),
(31376213, 'FEDERICO', 'MICHEL', 1);

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
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_carreras`
--

INSERT INTO `tipo_carreras` (`id`, `descripcion`) VALUES
(1, 'CONTRARRELOJ'),
(2, 'HORA Y VUELTA'),
(3, 'PUNTO A PUNTO');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `carrera_corredor_view`  AS  select `co`.`documento` AS `documento`,`co`.`nombre` AS `nombre`,`co`.`apellido` AS `apellido`,`cat`.`descripcion` AS `categoria`,`cc`.`posicion` AS `posicion`,`cc`.`tiempo` AS `tiempo`,`cc`.`vueltas` AS `vueltas`,`cc`.`global` AS `global`,`ca`.`id` AS `id_carrera` from (((`carrera_corredores` `cc` join `corredores` `co` on(`cc`.`id_corredor` = `co`.`documento`)) join `carreras` `ca` on(`cc`.`id_carrera` = `ca`.`id`)) join `categorias` `cat` on(`co`.`categoria` = `cat`.`id`)) ;

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
  ADD UNIQUE KEY `unique` (`id_carrera`,`id_corredor`) USING BTREE;

--
-- Indices de la tabla `carrera_marcas`
--
ALTER TABLE `carrera_marcas`
  ADD PRIMARY KEY (`id_carrera`,`id_corredor`,`marca`),
  ADD UNIQUE KEY `unique` (`id_carrera`,`id_corredor`,`marca`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipo_carreras`
--
ALTER TABLE `tipo_carreras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
