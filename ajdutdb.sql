-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-05-2019 a las 05:59:08
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ajdutdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria`
--

CREATE TABLE `Categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaBaja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Categoria`
--

INSERT INTO `Categoria` (`id`, `nombre`, `descripcion`, `fechaUltimaModificacion`, `fechaBaja`) VALUES
(1, 'ACEITES', '<p>Los aceites vegetales que se elaboran en el pa\\u00eds, en general no presentan problemas de Cashrut. Por lo tanto se permiten. Como en todos los casos recomendamos comprar productos de marcas reconocidas ya que esto garantiza en gran medida la calidad del art\\u00edculo y de sus ingredientes.  Cuando aparece en la etiqueta <strong>\\u201cAceite comestible mezcla\\u201d<\\/strong>, esto significa que el aceite est\\u00e1 elaborado a partir de aceites vegetales que pueden ser:  soja, girasol, ma\\u00edz, man\\u00ed, algod\\u00f3n, etc. Seg\\u00fan la opini\\u00f3n del Jatam Sofer, est\\u00e1 permitido el uso de aceite de uva. <strong> Ciertas opiniones recomiendan utilizar \\u00fanicamente aceites de girasol.<\\/strong>   <\\/p><p>Dado que el aceite es un producto de uso cotidiano y se envasa para \\u201cmarcas blancas\\u201d de supermercados y \\u201csegundas marcas\\u201d, hemos incluido aqu\\u00ed los c\\u00f3digos de la plantas de elaboraci\\u00f3n en las cuales no encontramos elementos prohibidos y se podr\\u00e1n consumir todos los aceites que all\\u00ed se elaboren: RNE o RPE  02-030.678; 02-031.588; 21- 001.794; 02-032.427; 02-032.607;  04002.089; 02-032607; 18-000735; 02-030025; 02-031512;   Recomendamos: <\\/p>', '2019-05-30 00:49:18', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Codigo`
--

CREATE TABLE `Codigo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaBaja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `Codigo`
--

INSERT INTO `Codigo` (`id`, `nombre`, `codigo`, `descripcion`, `fechaUltimaModificacion`, `fechaBaja`) VALUES
(1, 'Mehadrin', 'M', 'Mehadrin Parve', '2019-05-30 00:39:15', NULL),
(2, 'LACTEO ', 'LC', 'LECHE COMÚN', '2019-05-30 00:41:17', NULL),
(3, 'LECHE EN POLVO', 'LP', 'LECHE EN POLVO', '2019-05-30 00:41:43', NULL),
(4, 'PARVE', 'P', 'PARVE', '2019-05-30 00:42:00', NULL),
(5, 'KASHRUT ABIERTO', 'KA', 'KASHRUT ABIERTO', '2019-05-30 00:42:20', NULL),
(6, 'KELIM LÁCTEOS', 'KL', 'KELIM LÁCTEOS', '2019-05-30 00:42:47', NULL),
(7, 'NO KOSHER', 'NK', 'NO KOSHER', '2019-05-30 00:43:13', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `categoriaId` int(11) NOT NULL,
  `fechaUltimaModificacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaBaja` datetime DEFAULT NULL,
  `idCodigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `descripcion`, `marca`, `categoriaId`, `fechaUltimaModificacion`, `fechaBaja`, `idCodigo`) VALUES
(1, 'Aceite Natura', 'Natura, AGD', 1, '2019-05-30 00:57:07', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productocodigo`
--

CREATE TABLE `productocodigo` (
  `productoId` int(11) NOT NULL,
  `codigoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productocodigo`
--

INSERT INTO `productocodigo` (`productoId`, `codigoId`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`user_id`, `username`, `password`) VALUES
(1, 'dan', 'dan');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `Codigo`
--
ALTER TABLE `Codigo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `descripcion` (`descripcion`),
  ADD KEY `fk_producto_categoria` (`categoriaId`),
  ADD KEY `fk_producto_codigo` (`idCodigo`);

--
-- Indices de la tabla `productocodigo`
--
ALTER TABLE `productocodigo`
  ADD PRIMARY KEY (`productoId`,`codigoId`),
  ADD KEY `fk_productoCodigo_codigo` (`codigoId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Codigo`
--
ALTER TABLE `Codigo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`id`),
  ADD CONSTRAINT `fk_producto_codigo` FOREIGN KEY (`idCodigo`) REFERENCES `codigo` (`id`);

--
-- Filtros para la tabla `productocodigo`
--
ALTER TABLE `productocodigo`
  ADD CONSTRAINT `fk_productoCodigo_codigo` FOREIGN KEY (`codigoId`) REFERENCES `codigo` (`id`),
  ADD CONSTRAINT `fk_productoCodigo_producto` FOREIGN KEY (`productoId`) REFERENCES `producto` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
