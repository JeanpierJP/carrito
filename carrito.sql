-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-07-2024 a las 09:52:21
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion_envio` varchar(255) NOT NULL,
  `num_telefono` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombres`, `apellidos`, `direccion_envio`, `num_telefono`) VALUES
(1, 'Juniors ', 'Murrugarra', 'Comas - Pascana ', '902396618'),
(28, 'Andres ', 'Abelino', 'Los Olivos Calle Los Cerezos N° 255', '968554368'),
(29, 'Guillermo', 'Rossini', 'Comas, Av. Universitaria N° 4210', '987654147'),
(30, 'Daniel ', 'Calavery', 'Comas, Urb. Huaquillay - Av. Guillermo de la Fuente N° 556', '965365258'),
(31, 'Jesus', 'Romero', 'Comas, Urb. El Pinar - Av. Trapiche N° 2345', '961478658'),
(32, 'Juan ', 'Perez', 'Los Olivos, Av. Carlos Izaguirre N° 1234', '987654321'),
(33, 'Jose ', 'Rodrigues', 'Los Olivos, Urb. Covida - Av. Universitaria N° 2450', '968566447'),
(34, 'Lucia', 'Nuñes', 'Surco, Urb. La Castellana - Calle Monte Blanco N° 890', '933210987'),
(38, 'Alberto ', 'Ramos', 'Surco, Urb. Monterrico - Calle Los Precursores N° 123', '968478932');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `cliente_id`, `fecha_compra`, `monto`, `descripcion`) VALUES
(26, 28, '2024-07-08 07:25:49', 70.00, 'Descripción de la compra'),
(27, 29, '2024-07-08 07:29:41', 160.00, 'Descripción de la compra'),
(28, 30, '2024-07-08 07:30:50', 265.00, 'Descripción de la compra'),
(29, 31, '2024-07-08 07:33:08', 455.00, 'Descripción de la compra'),
(30, 32, '2024-07-08 07:35:30', 350.00, 'Descripción de la compra'),
(31, 33, '2024-07-08 07:37:08', 230.00, 'Descripción de la compra'),
(32, 38, '2024-07-08 09:26:45', 40.00, 'Descripción de la compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalles`
--

CREATE TABLE `orden_detalles` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `orden_detalles`
--

INSERT INTO `orden_detalles` (`id`, `orden_id`, `producto_id`, `cantidad`, `precio`) VALUES
(55, 23, 2, 1, 40.00),
(56, 23, 1, 1, 40.00),
(57, 24, 1, 1, 40.00),
(58, 24, 2, 1, 40.00),
(59, 25, 2, 1, 40.00),
(60, 26, 2, 1, 40.00),
(61, 26, 3, 1, 30.00),
(62, 27, 3, 4, 30.00),
(63, 27, 2, 1, 40.00),
(64, 28, 2, 2, 40.00),
(65, 28, 3, 1, 30.00),
(66, 28, 7, 1, 70.00),
(67, 28, 10, 1, 35.00),
(68, 28, 11, 1, 50.00),
(69, 29, 8, 4, 80.00),
(70, 29, 9, 1, 90.00),
(71, 29, 19, 1, 45.00),
(72, 30, 1, 1, 40.00),
(73, 30, 10, 1, 35.00),
(74, 30, 13, 5, 55.00),
(75, 31, 12, 1, 45.00),
(76, 31, 9, 1, 90.00),
(77, 31, 11, 1, 50.00),
(78, 31, 19, 1, 45.00),
(79, 32, 2, 1, 40.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image_url`) VALUES
(1, 'Peluche Personalizado', 'Peluche suave con una camiseta personalizada con el nombre del destinatario.', 40.00, 'http://localhost/carrito/Recursos/imagenes/producto1.jpg'),
(2, 'Tazas personalizadas', 'Tazas de cerámica con la opción de agregar fotos, diseños o mensajes personalizados.', 40.00, 'http://localhost/carrito/Recursos/imagenes/producto2.jpg'),
(3, 'Llaveros grabados', 'Llaveros de metal o acrílico con nombres, fechas o mensajes grabados de forma personalizada.', 30.00, 'http://localhost/carrito/Recursos/imagenes/producto3.jpg'),
(4, 'Camisetas personalizadas', 'Camisetas de algodón con diseños únicos o estampados personalizados según las preferencias del cliente.', 40.00, 'http://localhost/carrito/Recursos/imagenes/producto4.jpg'),
(5, 'Pulseras personalizadas', 'Pulseras de cuero, tela o metal con grabados especiales o nombres', 45.00, 'http://localhost/carrito/Recursos/imagenes/producto5.jpg'),
(6, 'Calendarios personalizados', 'Calendarios de pared o de escritorio con fotos familiares o fechas importantes personalizadas.', 60.00, 'http://localhost/carrito/Recursos/imagenes/producto6.jpg'),
(7, 'Fundas para móviles personalizadas', 'Fundas de silicona o plástico con diseños exclusivos o fotos impresas a elección del cliente.', 70.00, 'http://localhost/carrito/Recursos/imagenes/producto7.jpg'),
(8, 'Cuadernos personalizados', 'Cuadernos o libretas con nombres grabados, diseños únicos o páginas personalizadas.', 80.00, 'http://localhost/carrito/Recursos/imagenes/producto8.jpg'),
(9, 'Bolsas de tela personalizadas', 'Bolsas reutilizables con estampados personalizados, mensajes especiales o nombres impresos.', 90.00, 'http://localhost/carrito/Recursos/imagenes/producto9.jpg'),
(10, 'Pulseras Grabadas', 'Pulseras de cuero, metal o silicona con grabados personalizados, como nombres, fechas especiales o citas inspiradoras. Perfectas como accesorio personalizado.', 35.00, 'http://localhost/carrito/Recursos/imagenes/producto10.jpg'),
(11, 'Álbumes de Fotos Personalizados', 'Álbumes encuadernados con fotos impresas y diseños personalizados para conmemorar momentos especiales. Un regalo emotivo y duradero', 50.00, 'http://localhost/carrito/Recursos/imagenes/producto11.jpg'),
(12, 'Cojines Personalizados', 'Cojines de tela suave con fotos impresas, diseños o mensajes personalizados. Ideales para decorar espacios personales como salas o dormitorios.', 45.00, 'http://localhost/carrito/Recursos/imagenes/producto12.jpg'),
(13, 'Libros de Firmas Personalizados:', 'Libros encuadernados para eventos como bodas o cumpleaños, con nombres y fechas grabadas en la portada y páginas internas personalizadas para mensajes.', 55.00, 'http://localhost/carrito/Recursos/imagenes/producto13.jpg'),
(14, 'Rompecabezas Personalizados', 'Rompecabezas de cartón grueso con imágenes personalizadas, ideales como regalo interactivo y divertido.', 50.00, 'http://localhost/carrito/Recursos/imagenes/producto14.jpg'),
(15, 'Cuadros Personalizados', 'Cuadros impresos con fotos familiares o diseños artísticos personalizados, montados en marcos elegantes. Un regalo decorativo y significativo.', 70.00, 'http://localhost/carrito/Recursos/imagenes/producto15.jpg'),
(16, 'Relojes de Pared Personalizados', 'Relojes de pared con fotos familiares o diseños personalizados impresos en la esfera, ideales para la decoración del hogar u oficina.', 60.00, 'http://localhost/carrito/Recursos/imagenes/producto16.jpg'),
(17, 'Velas Personalizadas', 'Velas aromáticas con etiquetas personalizadas, perfectas para crear un ambiente acogedor y como regalo decorativo.', 25.00, 'http://localhost/carrito/Recursos/imagenes/producto17.jpg'),
(18, 'Toallas de Baño Personalizadas', 'Toallas de baño de algodón con bordados o estampados personalizados, una opción práctica y elegante para regalar.', 35.00, 'http://localhost/carrito/Recursos/imagenes/producto18.jpg'),
(19, 'Sets de Té o Café Personalizados', 'Tazas, platos y cucharillas con grabados o diseños personalizados, perfectos para los amantes de las bebidas calientes.', 45.00, 'http://localhost/carrito/Recursos/imagenes/producto19.jpg'),
(20, 'Porta Documentos Personalizados', 'Carpeteras o fundas para documentos de cuero o materiales sintéticos con grabados personalizados, ideales para profesionales o estudiantes.', 30.00, 'http://localhost/carrito/Recursos/imagenes/producto20.jpg'),
(29, 'a', 'a', 2.00, 'aa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contrasena`, `nombre`, `apellido`, `email`, `creado_en`) VALUES
(1, 'admin', '$2y$10$dZmmL1Qryv52FIL7hwrRJ.tkLdZ4/6CsHsc3r3dftIUcKUpK.Xz2G', 'Usuario_01', '--', '--', '2024-06-30 23:25:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `producto_id2` (`producto_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `orden_detalles`
--
ALTER TABLE `orden_detalles`
  ADD CONSTRAINT `orden_detalles_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
