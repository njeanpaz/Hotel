-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-03-2024 a las 23:34:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdd_hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categorias`
--

CREATE TABLE `tbl_categorias` (
  `cat_id` int(11) NOT NULL,
  `cat_nombre` varchar(100) DEFAULT NULL,
  `cat_descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_nombre` varchar(100) DEFAULT NULL,
  `cli_correo` varchar(100) DEFAULT NULL,
  `cli_telefono` varchar(20) DEFAULT NULL,
  `cli_preferencias` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comentarios`
--

CREATE TABLE `tbl_comentarios` (
  `com_id` int(11) NOT NULL,
  `res_id` int(11) DEFAULT NULL,
  `usu_id` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_comentario` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_habitaciones`
--

CREATE TABLE `tbl_habitaciones` (
  `hab_id` int(11) NOT NULL,
  `hab_tipo` varchar(50) DEFAULT NULL,
  `hab_capacidad` int(11) DEFAULT NULL,
  `hab_comodidades` text DEFAULT NULL,
  `hab_precio` decimal(10,2) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial_reservas`
--

CREATE TABLE `tbl_historial_reservas` (
  `hist_id` int(11) NOT NULL,
  `hist_cli_id` int(11) DEFAULT NULL,
  `hist_res_id` int(11) DEFAULT NULL,
  `hist_check_in` date DEFAULT NULL,
  `hist_check_out` date DEFAULT NULL,
  `hist_pago` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pagos`
--

CREATE TABLE `tbl_pagos` (
  `pago_id` int(11) NOT NULL,
  `res_id` int(11) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reservas`
--

CREATE TABLE `tbl_reservas` (
  `res_id` int(11) NOT NULL,
  `res_hab_id` int(11) DEFAULT NULL,
  `res_usu_id` int(11) DEFAULT NULL,
  `res_fecha_entrada` date DEFAULT NULL,
  `res_fecha_salida` date DEFAULT NULL,
  `res_estado` varchar(20) DEFAULT NULL,
  `res_fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `res_fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reserva_servicios`
--

CREATE TABLE `tbl_reserva_servicios` (
  `res_id` int(11) DEFAULT NULL,
  `serv_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `rol_id` int(11) NOT NULL,
  `rol_nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_servicios_adicionales`
--

CREATE TABLE `tbl_servicios_adicionales` (
  `serv_id` int(11) NOT NULL,
  `serv_nombre` varchar(100) DEFAULT NULL,
  `serv_descripcion` text DEFAULT NULL,
  `serv_precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tarifas_politicas`
--

CREATE TABLE `tbl_tarifas_politicas` (
  `tar_id` int(11) NOT NULL,
  `tar_tipo_habitacion_id` int(11) DEFAULT NULL,
  `tar_temporada` varchar(50) DEFAULT NULL,
  `tar_tarifa` decimal(10,2) DEFAULT NULL,
  `tar_politica_cancelacion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(100) DEFAULT NULL,
  `usu_correo` varchar(100) DEFAULT NULL,
  `usu_contrasena` varchar(255) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indices de la tabla `tbl_comentarios`
--
ALTER TABLE `tbl_comentarios`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `res_id` (`res_id`),
  ADD KEY `usu_id` (`usu_id`);

--
-- Indices de la tabla `tbl_habitaciones`
--
ALTER TABLE `tbl_habitaciones`
  ADD PRIMARY KEY (`hab_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indices de la tabla `tbl_historial_reservas`
--
ALTER TABLE `tbl_historial_reservas`
  ADD PRIMARY KEY (`hist_id`),
  ADD KEY `hist_cli_id` (`hist_cli_id`),
  ADD KEY `hist_res_id` (`hist_res_id`);

--
-- Indices de la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  ADD PRIMARY KEY (`pago_id`),
  ADD KEY `res_id` (`res_id`);

--
-- Indices de la tabla `tbl_reservas`
--
ALTER TABLE `tbl_reservas`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `res_hab_id` (`res_hab_id`),
  ADD KEY `res_usu_id` (`res_usu_id`);

--
-- Indices de la tabla `tbl_reserva_servicios`
--
ALTER TABLE `tbl_reserva_servicios`
  ADD KEY `res_id` (`res_id`),
  ADD KEY `serv_id` (`serv_id`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`rol_id`);

--
-- Indices de la tabla `tbl_servicios_adicionales`
--
ALTER TABLE `tbl_servicios_adicionales`
  ADD PRIMARY KEY (`serv_id`);

--
-- Indices de la tabla `tbl_tarifas_politicas`
--
ALTER TABLE `tbl_tarifas_politicas`
  ADD PRIMARY KEY (`tar_id`),
  ADD KEY `tar_tipo_habitacion_id` (`tar_tipo_habitacion_id`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`usu_id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categorias`
--
ALTER TABLE `tbl_categorias`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_comentarios`
--
ALTER TABLE `tbl_comentarios`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_habitaciones`
--
ALTER TABLE `tbl_habitaciones`
  MODIFY `hab_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_historial_reservas`
--
ALTER TABLE `tbl_historial_reservas`
  MODIFY `hist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  MODIFY `pago_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_reservas`
--
ALTER TABLE `tbl_reservas`
  MODIFY `res_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `rol_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_servicios_adicionales`
--
ALTER TABLE `tbl_servicios_adicionales`
  MODIFY `serv_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_tarifas_politicas`
--
ALTER TABLE `tbl_tarifas_politicas`
  MODIFY `tar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_comentarios`
--
ALTER TABLE `tbl_comentarios`
  ADD CONSTRAINT `tbl_comentarios_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `tbl_reservas` (`res_id`),
  ADD CONSTRAINT `tbl_comentarios_ibfk_2` FOREIGN KEY (`usu_id`) REFERENCES `tbl_usuarios` (`usu_id`);

--
-- Filtros para la tabla `tbl_habitaciones`
--
ALTER TABLE `tbl_habitaciones`
  ADD CONSTRAINT `tbl_habitaciones_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `tbl_categorias` (`cat_id`);

--
-- Filtros para la tabla `tbl_historial_reservas`
--
ALTER TABLE `tbl_historial_reservas`
  ADD CONSTRAINT `tbl_historial_reservas_ibfk_1` FOREIGN KEY (`hist_cli_id`) REFERENCES `tbl_clientes` (`cli_id`),
  ADD CONSTRAINT `tbl_historial_reservas_ibfk_2` FOREIGN KEY (`hist_res_id`) REFERENCES `tbl_reservas` (`res_id`);

--
-- Filtros para la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  ADD CONSTRAINT `tbl_pagos_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `tbl_reservas` (`res_id`);

--
-- Filtros para la tabla `tbl_reservas`
--
ALTER TABLE `tbl_reservas`
  ADD CONSTRAINT `tbl_reservas_ibfk_1` FOREIGN KEY (`res_hab_id`) REFERENCES `tbl_habitaciones` (`hab_id`),
  ADD CONSTRAINT `tbl_reservas_ibfk_2` FOREIGN KEY (`res_usu_id`) REFERENCES `tbl_usuarios` (`usu_id`);

--
-- Filtros para la tabla `tbl_reserva_servicios`
--
ALTER TABLE `tbl_reserva_servicios`
  ADD CONSTRAINT `tbl_reserva_servicios_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `tbl_reservas` (`res_id`),
  ADD CONSTRAINT `tbl_reserva_servicios_ibfk_2` FOREIGN KEY (`serv_id`) REFERENCES `tbl_servicios_adicionales` (`serv_id`);

--
-- Filtros para la tabla `tbl_tarifas_politicas`
--
ALTER TABLE `tbl_tarifas_politicas`
  ADD CONSTRAINT `tbl_tarifas_politicas_ibfk_1` FOREIGN KEY (`tar_tipo_habitacion_id`) REFERENCES `tbl_habitaciones` (`hab_id`);

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `tbl_usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `tbl_roles` (`rol_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
