-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-05-2019 a las 03:24:24
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `shadiagram`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amistad`
--

CREATE TABLE `amistad` (
  `usuario` varchar(30) NOT NULL,
  `amistad` varchar(30) NOT NULL,
  `id_amistad` int(11) NOT NULL,
  `fecha_solicitud` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `amistad`
--

INSERT INTO `amistad` (`usuario`, `amistad`, `id_amistad`, `fecha_solicitud`) VALUES
('juanchito123', 'traquetoide123', 1, '2019-04-18'),
('traquetoide123', 'juanchito123', 2, '2019-05-02'),
('juanito', 'juanchito123', 3, '2019-05-03'),
('CIO_jampi', 'juanchito123', 5, '2019-05-03'),
('juanchito123', 'CIO_jampi', 6, '2019-05-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(10) NOT NULL,
  `fecha_comentario` date NOT NULL,
  `usuarioC` varchar(20) NOT NULL,
  `id_publicacionC` int(10) NOT NULL,
  `comentario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `fecha_comentario`, `usuarioC`, `id_publicacionC`, `comentario`) VALUES
(9, '2019-05-05', 'CIO_jampi', 21, 'hola'),
(11, '2019-05-05', 'juanchito123', 19, 'comentario a traquetoide'),
(12, '2019-05-06', 'juanchito123', 21, 'que se dice jampi'),
(13, '2019-05-06', 'juanchito123', 22, 'bello my dog'),
(14, '2019-05-06', 'traquetoide123', 22, 'blanco'),
(16, '2019-05-06', 'traquetoide123', 20, 'ok');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `id_publicacion` int(10) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `fecha_publicacion` date NOT NULL,
  `usuarioPublicacion` varchar(20) NOT NULL,
  `nombre_imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `publicacion`
--

INSERT INTO `publicacion` (`id_publicacion`, `descripcion`, `fecha_publicacion`, `usuarioPublicacion`, `nombre_imagen`) VALUES
(19, 'foto de traquetoide', '2019-04-30', 'traquetoide123', '120_c_6828.jpg'),
(20, 'foto de mamorro', '2019-05-03', 'juanchito123', 'fondo amarillo.jpg'),
(21, 'foto de jampi', '2019-05-04', 'CIO_jampi', 'original.jpg'),
(22, 'foto perrito', '2019-05-06', 'juanchito123', 'agonia.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reaccion`
--

CREATE TABLE `reaccion` (
  `id_reaccion` int(10) NOT NULL,
  `id_publicacion` int(10) NOT NULL,
  `usuario_reaccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reaccion`
--

INSERT INTO `reaccion` (`id_reaccion`, `id_publicacion`, `usuario_reaccion`) VALUES
(4, 19, 'juanchito123'),
(22, 21, 'traquetoide123'),
(23, 21, 'juanchito123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `fecha_registro` date NOT NULL,
  `imagen_perfil` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `nombre`, `apellidos`, `email`, `pass`, `fecha_registro`, `imagen_perfil`) VALUES
('carlosreneas', 'carlos rene', 'angarito', 'carlosreneas@ufps.edu.co', '12345', '2019-05-05', NULL),
('CIO_jampi', 'jean pierre', 'gómez s', 'fjiof@gmail.com', '789456123', '2019-05-03', 'iconConduc.png'),
('juanchito123', 'Juancho', 'Fuentes', 'juanchito123@gmail.com', 'perrito123', '2019-04-30', 'lolsito.jpg'),
('juanito', 'Juan', 'perez', 'lolsio@gmail.com', '1234', '2019-05-01', 'descarga.png'),
('traquetoide123', 'Gerson', 'Gomez', 'mamorro123@gmail.com', 'plomo123', '2019-04-30', 'SR4.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amistad`
--
ALTER TABLE `amistad`
  ADD PRIMARY KEY (`id_amistad`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `amistad` (`amistad`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `usuario_comentario` (`usuarioC`),
  ADD KEY `comentarios_publicacion` (`id_publicacionC`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`id_publicacion`),
  ADD KEY `usuarioPublicacion` (`usuarioPublicacion`);

--
-- Indices de la tabla `reaccion`
--
ALTER TABLE `reaccion`
  ADD PRIMARY KEY (`id_reaccion`),
  ADD KEY `id_publicacion` (`id_publicacion`),
  ADD KEY `usuario_reaccion` (`usuario_reaccion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amistad`
--
ALTER TABLE `amistad`
  MODIFY `id_amistad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `id_publicacion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `reaccion`
--
ALTER TABLE `reaccion`
  MODIFY `id_reaccion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amistad`
--
ALTER TABLE `amistad`
  ADD CONSTRAINT `amistad_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`),
  ADD CONSTRAINT `amistad_ibfk_2` FOREIGN KEY (`amistad`) REFERENCES `usuarios` (`usuario`);

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `publicacion_comentario` FOREIGN KEY (`id_publicacionC`) REFERENCES `publicacion` (`id_publicacion`),
  ADD CONSTRAINT `usuario_comentario` FOREIGN KEY (`usuarioC`) REFERENCES `usuarios` (`usuario`);

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `usuario_publicacion` FOREIGN KEY (`usuarioPublicacion`) REFERENCES `usuarios` (`usuario`);

--
-- Filtros para la tabla `reaccion`
--
ALTER TABLE `reaccion`
  ADD CONSTRAINT `publicacion_reaccion` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id_publicacion`),
  ADD CONSTRAINT `usuario_reaccion` FOREIGN KEY (`usuario_reaccion`) REFERENCES `usuarios` (`usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
