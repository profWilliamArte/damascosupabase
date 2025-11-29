-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-11-2025 a las 11:55:22
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `damasco`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carritos`
--

CREATE TABLE `carritos` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `carritos`
--

INSERT INTO `carritos` (`id`, `usuario_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-11-26 18:21:23', '2025-11-26 18:21:23'),
(2, 2, '2025-11-26 18:21:23', '2025-11-26 18:21:23'),
(3, 3, '2025-11-26 18:21:23', '2025-11-26 18:21:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `idestatus`, `nombre`, `descripcion`) VALUES
(1, 1, 'Tecnología', ''),
(2, 1, 'Hogar & Decoración', 'Mobiliario, Textil, Menaje y Utensilios de Cocina (No eléctricos)'),
(3, 1, 'Maquinaria & Línea Blanca', 'Equipos grandes y pequeños de funcionamiento eléctrico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dolar`
--

CREATE TABLE `dolar` (
  `id` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `dolar`
--

INSERT INTO `dolar` (`id`, `fecha`, `monto`) VALUES
(1, '2025-11-26', 243.57);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatus`
--

CREATE TABLE `estatus` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `estatus`
--

INSERT INTO `estatus` (`id`, `nombre`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items_carrito`
--

CREATE TABLE `items_carrito` (
  `id` int NOT NULL,
  `carrito_id` int DEFAULT NULL,
  `usuario_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `added_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `items_carrito`
--

INSERT INTO `items_carrito` (`id`, `carrito_id`, `usuario_id`, `producto_id`, `cantidad`, `added_at`) VALUES
(1, 1, 1, 1, 2, '2025-11-26 18:25:59'),
(2, 1, 1, 5, 1, '2025-11-26 18:25:59'),
(3, 2, 2, 3, 1, '2025-11-26 18:25:59'),
(4, 2, 2, 10, 3, '2025-11-26 18:25:59'),
(5, 3, 3, 7, 1, '2025-11-26 18:25:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items_pedido`
--

CREATE TABLE `items_pedido` (
  `id` int NOT NULL,
  `pedido_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `items_pedido`
--

INSERT INTO `items_pedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES
(2, 1, 5, 1, 5000.00),
(4, 2, 2, 1, 375.00),
(5, 3, 3, 2, 47.00),
(6, 4, 4, 1, 72.00),
(7, 4, 5, 1, 51.00),
(14, 11, 10, 1, 45.00),
(15, 12, 11, 2, 55.00),
(16, 13, 12, 1, 484.00),
(17, 14, 13, 1, 52.00),
(18, 14, 14, 1, 42.00),
(19, 15, 15, 1, 20.00),
(25, 28, 21, 1, 430.00),
(26, 29, 22, 1, 449.00),
(27, 30, 23, 1, 130.00),
(28, 32, 1, 2, 42.00),
(29, 33, 2, 1, 375.00),
(30, 34, 3, 2, 47.00),
(31, 35, 4, 1, 72.00),
(32, 35, 5, 1, 51.00),
(34, 33, 65, 1, 90.00),
(35, 34, 66, 1, 152.00),
(36, 35, 91, 1, 369.00),
(39, 42, 10, 1, 45.00),
(40, 43, 11, 2, 55.00),
(41, 44, 12, 1, 484.00),
(42, 45, 13, 1, 52.00),
(43, 45, 14, 1, 42.00),
(44, 46, 15, 1, 20.00),
(45, 44, 16, 1, 513.00),
(46, 45, 17, 1, 309.00),
(47, 46, 18, 1, 137.00),
(50, 59, 21, 1, 430.00),
(51, 60, 22, 1, 449.00),
(52, 61, 23, 1, 130.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `idestatus`, `nombre`) VALUES
(1, 1, 'Vidvie'),
(2, 1, 'HONOR'),
(3, 1, 'Lenyes'),
(4, 1, 'Damasco Technology'),
(5, 1, 'DAMASCO'),
(6, 1, 'Hewlett-Packard'),
(7, 1, 'Epson'),
(8, 1, 'SAMSUNG'),
(9, 1, 'OLAX'),
(10, 1, 'REALME'),
(11, 1, 'Tenda'),
(12, 1, 'Razer'),
(13, 1, 'TECNO'),
(14, 1, 'XIAOMI'),
(15, 1, 'XIAOMI REDMI'),
(16, 1, 'ZTE'),
(17, 1, 'ROYAL'),
(18, 1, 'OSTER'),
(19, 1, 'Damasco Home'),
(20, 1, 'GENERICO'),
(21, 1, 'PARADAYS'),
(22, 1, 'DECAKILA'),
(23, 1, 'AEGEAN'),
(24, 1, 'WELL'),
(25, 1, 'CLIPPED'),
(26, 1, 'SOHO'),
(27, 1, 'MAXIDREAMS'),
(28, 1, 'indurama'),
(29, 1, 'Midea'),
(30, 1, 'Hamilton Beach'),
(31, 1, 'Galanz'),
(32, 1, 'LG'),
(33, 1, 'Black & Decker'),
(34, 1, 'RCA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `fecha_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `total` decimal(12,2) NOT NULL,
  `estado` enum('pendiente','pagado','enviado','entregado','cancelado') DEFAULT 'pendiente',
  `direccion_envio` text,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `tasa_dolar_usada` decimal(10,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `fecha_pedido`, `total`, `estado`, `direccion_envio`, `metodo_pago`, `tasa_dolar_usada`) VALUES
(1, 1, '2025-11-26 18:18:34', 15000.00, 'pagado', 'Av. Siempre Viva 123, Caracas', 'transferencia', 243.5700),
(2, 2, '2025-11-26 18:33:42', 375.00, 'enviado', 'Calle Miranda 123, Maracay', 'zelle', 243.5700),
(3, 3, '2025-11-26 18:33:42', 94.00, 'entregado', 'Urb. Los Olivos, Valencia', 'efectivo', 243.5700),
(4, 4, '2025-11-26 18:33:42', 123.00, 'pagado', 'Av. Bolívar, Barquisimeto', 'transferencia', 243.5700),
(11, 1, '2025-11-26 18:33:43', 45.00, 'pagado', 'Caracas', 'transferencia', 243.5700),
(12, 2, '2025-11-26 18:33:43', 110.00, 'enviado', 'Maracay', 'zelle', 243.5700),
(13, 3, '2025-11-26 18:33:43', 484.00, 'entregado', 'Valencia', 'efectivo', 243.5700),
(14, 4, '2025-11-26 18:33:43', 104.00, 'pagado', 'Barquisimeto', 'transferencia', 243.5700),
(15, 5, '2025-11-26 18:33:43', 20.00, 'pendiente', 'Puerto Ordaz', 'zelle', 243.5700),
(28, 1, '2025-11-26 18:33:43', 430.00, 'pagado', 'Caracas', 'transferencia', 243.5700),
(29, 2, '2025-11-26 18:33:43', 449.00, 'enviado', 'Maracay', 'zelle', 243.5700),
(30, 3, '2025-11-26 18:33:43', 130.00, 'entregado', 'Valencia', 'efectivo', 243.5700),
(31, 4, '2025-11-26 18:33:43', 35.00, 'pagado', 'Barquisimeto', 'transferencia', 243.5700),
(32, 1, '2025-11-26 18:34:39', 84.00, 'pagado', 'Av. Libertador, Caracas', 'transferencia', 243.5700),
(33, 2, '2025-11-26 18:34:39', 375.00, 'enviado', 'Calle Miranda 123, Maracay', 'zelle', 243.5700),
(34, 3, '2025-11-26 18:34:39', 94.00, 'entregado', 'Urb. Los Olivos, Valencia', 'efectivo', 243.5700),
(35, 4, '2025-11-26 18:34:39', 123.00, 'pagado', 'Av. Bolívar, Barquisimeto', 'transferencia', 243.5700),
(42, 1, '2025-11-26 18:34:39', 45.00, 'pagado', 'Caracas', 'transferencia', 243.5700),
(43, 2, '2025-11-26 18:34:39', 110.00, 'enviado', 'Maracay', 'zelle', 243.5700),
(44, 3, '2025-11-26 18:34:39', 484.00, 'entregado', 'Valencia', 'efectivo', 243.5700),
(45, 4, '2025-11-26 18:34:39', 104.00, 'pagado', 'Barquisimeto', 'transferencia', 243.5700),
(46, 5, '2025-11-26 18:34:39', 20.00, 'pendiente', 'Puerto Ordaz', 'zelle', 243.5700),
(59, 1, '2025-11-26 18:34:39', 430.00, 'pagado', 'Caracas', 'transferencia', 243.5700),
(60, 2, '2025-11-26 18:34:39', 449.00, 'enviado', 'Maracay', 'zelle', 243.5700),
(61, 3, '2025-11-26 18:34:39', 130.00, 'entregado', 'Valencia', 'efectivo', 243.5700),
(62, 4, '2025-11-26 18:34:39', 35.00, 'pagado', 'Barquisimeto', 'transferencia', 243.5700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int NOT NULL,
  `idestatus` int NOT NULL,
  `idcategoria` int DEFAULT NULL,
  `idsubcategoria` int NOT NULL,
  `idmarca` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tipo` varchar(9) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `estrellas` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `precio` int NOT NULL,
  `preciofull` int NOT NULL,
  `stock` int NOT NULL,
  `imagen` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `idestatus`, `idcategoria`, `idsubcategoria`, `idmarca`, `nombre`, `tipo`, `estrellas`, `precio`, `preciofull`, `stock`, `imagen`) VALUES
(1, 1, 1, 2, 1, 'Audífono Gamer BBH2109', NULL, '2', 42, 45, 97, '157435-300-300.png'),
(2, 1, 1, 1, 2, 'Honor X8c 256+8 Purpura', NULL, '3', 375, 395, 221, '157338-300-300.png'),
(3, 1, 1, 2, 1, 'Audífonos Inalámbricos BBH2112', NULL, '3', 47, 50, 136, '157417-300-300.png'),
(4, 1, 1, 2, 3, 'Audífonos Bluetooth  AIR 101', NULL, '3', 72, 76, 325, '157445-300-300.png'),
(5, 1, 1, 2, 3, 'Audífonos Bluetooth  AIR 203', NULL, '2', 51, 54, 206, '157447-300-300.png'),
(6, 1, 1, 1, 2, 'Honor X8c 256+8  Verde', NULL, '3', 375, 395, 36, '157339-300-300.png'),
(7, 1, 1, 2, 1, 'Audífonos Bluetooth BT886', NULL, '3', 30, 32, 206, '157432-300-300.png'),
(8, 1, 1, 1, 2, 'HONOR X8C 512+8 VERDE', NULL, '5', 418, 440, 240, '157099-300-300.png'),
(9, 1, 1, 1, 2, 'Honor 200 Lite 256+12 Verde', NULL, '5', 380, 400, 231, '157342-300-300.png'),
(10, 1, 1, 3, 4, 'Cámara de Seguridad interior U8Q/D', 'Nuevo', '5', 45, 48, 82, '157381-300-300.png'),
(11, 1, 1, 3, 4, 'Cámara de Seguridad exterior  D25X', 'Nuevo', '2', 55, 58, 32, '157385-300-300.png'),
(12, 1, 1, 1, 2, 'Honor H400 Lite 256+12 Gris', 'Nuevo', '2', 484, 510, 222, '158528-300-300.png'),
(13, 1, 1, 3, 4, 'Cámara de Seguridad Exterior D7P', 'Nuevo', '4', 52, 55, 335, '157527-300-300.png'),
(14, 1, 1, 3, 4, 'Cámara de Seguridad interior U11Q/D', 'Nuevo', '4', 42, 45, 328, '157383-300-300.png'),
(15, 1, 1, 4, 1, 'Cargador Blanco Vidvie C-C PLM361', NULL, '4', 20, 22, 285, '157394-300-300.png'),
(16, 1, 1, 1, 2, 'Honor Magic 7 Lite 5G 256+8GB Purpura', NULL, '2', 513, 540, 88, '157351-300-300.png'),
(17, 1, 3, 30, 5, 'COCINA DA+CO 4 HORNILLAS FS204P007B', NULL, '5', 309, 325, 229, '157038-300-300.png'),
(18, 1, 1, 1, 2, 'Honor X5b 128+4 Azul', NULL, '3', 137, 145, 200, '156914-300-300.png'),
(19, 1, 1, 1, 2, 'Honor X5b Plus 256+4 Purpura', NULL, '4', 194, 205, 291, '156917-300-300.png'),
(20, 1, 1, 1, 2, 'Honor X6B 256GB + 6GB Azul', NULL, '3', 199, 209, 176, '156852-300-300.png'),
(21, 1, 1, 5, 6, 'Impresora HP OfficeJet Pro 9130 404K5C', 'Nuevo', '5', 430, 453, 316, '158538-300-300.png'),
(22, 1, 1, 5, 7, 'Impresora Mfp Epson Color Ecotank L3250 C11CJ67301', 'Nuevo', '5', 449, 473, 43, '158523-300-300.png'),
(23, 1, 1, 6, 5, 'CORNETA DA+CO DMCLY-S80A', NULL, '5', 130, 137, 237, '157106-300-300.png'),
(24, 1, 1, 6, 5, 'CORNETA DA+CO DMCLY-SB20A', NULL, '2', 35, 37, 46, '157037-300-300.png'),
(25, 1, 1, 1, 4, 'Damasco Technology M300 12+256GB  Azul', 'Nuevo', '5', 232, 245, 159, '157548-300-300.png'),
(26, 1, 1, 1, 4, 'Damasco Technology M300 12+256GB Dorado', 'Nuevo', '5', 232, 245, 307, '157545-300-300.png'),
(27, 1, 1, 1, 4, 'Damasco Technology M100 4+128GB BLANCO', 'Nuevo', '2', 142, 150, 47, '157631-300-300.png'),
(28, 1, 1, 1, 4, 'Damasco Technology M100 4+128GB VERDE', 'Nuevo', '3', 142, 150, 287, '157632-300-300.png'),
(29, 1, 1, 5, 7, 'Impresora Mfp Epson Color Ecotank L4260 C11CJ6330', 'Nuevo', '3', 549, 578, 282, '158524-300-300.png'),
(30, 1, 1, 5, 7, 'Impresora Epson M1120 Aio C11Cg96301', NULL, '2', 378, 398, 199, '156475-300-300.png'),
(31, 1, 1, 1, 4, 'Damasco Technology M200 8+256GB NEGRO', 'Nuevo', '4', 182, 192, 129, '157633-300-300.png'),
(32, 1, 1, 5, 6, 'Impresora HP Laserjet Pro 3003DW 3G654A', 'Nuevo', '2', 399, 421, 29, '158536-300-300.png'),
(33, 1, 1, 1, 2, 'Honor 200 512+12 Rosado', 'Nuevo', '3', 734, 773, 69, '158485-300-300.png'),
(34, 1, 1, 5, 6, 'IMPRESORA HP COLOR LASERJET PRO MFP 4303DW 5HH65A/BGJ', 'Nuevo', '2', 846, 891, 239, '158464-300-300.png'),
(35, 1, 1, 1, 2, 'Honor Magic 7 Lite 5G 256+8GB Celeste', NULL, '4', 513, 540, 308, '157355-300-300.png'),
(36, 1, 1, 5, 6, 'Impresora Hp Smart Tank 580 W 1F3Y2A', NULL, '4', 356, 375, 140, '156485-300-300.png'),
(37, 1, 1, 1, 2, 'Honor Magic 7 Lite 5G 256+8GB Negro', NULL, '3', 513, 540, 87, '157353-300-300.png'),
(38, 1, 1, 5, 6, 'IMPRESORA MULTIFUNCIONAL HP 6UU46A', NULL, '5', 504, 531, 327, '157207-300-300.png'),
(39, 1, 1, 9, 2, 'Tablet Honor Pad X9A LTE 128+8 Gris', 'Nuevo', '4', 351, 370, 31, '158444-300-300.png'),
(40, 1, 1, 1, 2, 'Honor Play 10 128+4 Negro', 'Nuevo', '2', 120, 127, 146, '158440-300-300.png'),
(41, 1, 1, 1, 2, 'Honor Play 10 128+4 Azul', 'Nuevo', '4', 120, 127, 285, '158439-300-300.png'),
(42, 1, 1, 7, 4, 'Laptop Damasco 15.6\" i7 16+512GB DN21C-156H2-SCD', 'Nuevo', '4', 853, 898, 309, '157506-300-300.png'),
(43, 1, 1, 7, 4, 'Laptop Damasco 15.6\" I3 16+512GB DN21C-156H2-SCD', 'Nuevo', '2', 637, 671, 337, '157504-300-300.png'),
(44, 1, 1, 7, 4, 'Laptop Damasco 15.6\" LP-N150-8 8+512GB DNN21S-156H2-SCD', 'Nuevo', '2', 504, 531, 78, '157502-300-300.png'),
(45, 1, 1, 7, 6, 'Laptop HP Pavilion 16\'\' 8+512GB Plateado', 'Nuevo', '3', 953, 1, 20, '157484-300-300.png'),
(46, 1, 1, 8, 4, 'Mini Pc Damasco Technology D5-13-16', 'Nuevo', '5', 593, 625, 179, '157596-300-300.png'),
(47, 1, 1, 1, 2, 'Honor Play 10 64+3 Purpura', 'Nuevo', '4', 99, 105, 152, '158441-300-300.png'),
(48, 1, 1, 8, 4, 'Mini Pc Damasco Technology N150-16', 'Nuevo', '2', 368, 388, 206, '157595-300-300.png'),
(49, 1, 1, 1, 2, 'HONOR PLAY 9A 128+4 AZUL', NULL, '3', 131, 138, 222, '157089-300-300.png'),
(50, 1, 1, 1, 2, 'Honor Play 9A 256+4  Morado', 'Nuevo', '2', 156, 165, 142, '158448-300-300.png'),
(51, 1, 1, 1, 2, 'Honor Play 9A 256+4  Azul', 'Nuevo', '5', 156, 165, 26, '158449-300-300.png'),
(52, 1, 1, 1, 2, 'Honor Play 10 64+3 Negro', 'Nuevo', '4', 99, 105, 344, '158442-300-300.png'),
(53, 1, 1, 1, 2, 'Honor X6C 256+6 Blanco', 'Nuevo', '3', 218, 230, 300, '158447-300-300.png'),
(54, 1, 1, 10, 8, 'Monitor Samsung 27\' Bg402 Ls27Bg402Enxgo', NULL, '4', 399, 420, 118, '156520-300-300.png'),
(55, 1, 1, 1, 2, 'Honor  X6C 256+6 Negro', 'Nuevo', '3', 218, 230, 334, '158446-300-300.png'),
(56, 1, 1, 10, 8, 'Monitor Samsung 32\' Dm801Ls32Dm801Unxza', NULL, '4', 735, 774, 300, '156512-300-300.png'),
(57, 1, 1, 1, 2, 'Honor  X6C 256+6 Azul', 'Nuevo', '5', 218, 230, 151, '158445-300-300.png'),
(58, 1, 1, 10, 8, 'Monitor Samsung M5 Smart 32\'\' LS32DM500ENXGO', 'Nuevo', '3', 399, 420, 165, '158540-300-300.png'),
(59, 1, 1, 1, 2, 'Honor X7D 256+8  Azul', 'Nuevo', '2', 285, 300, 22, '158436-300-300.png'),
(60, 1, 1, 10, 8, 'MONITOR SMART SAMSUNG 32\' LS32CM701UNXZA', NULL, '4', 532, 560, 255, '157210-300-300.png'),
(61, 1, 1, 1, 2, 'Honor  X7D 256+8 Plata', 'Nuevo', '2', 285, 300, 198, '158437-300-300.png'),
(62, 1, 1, 12, 1, 'Mouse Transparente KB07', NULL, '4', 21, 23, 206, '157422-300-300.png'),
(63, 1, 1, 1, 2, 'Honor X7D 256+8  Negro', 'Nuevo', '3', 285, 300, 85, '158435-300-300.png'),
(64, 1, 1, 12, 1, 'Multipuerto Usb 6 en 1 HUB03', NULL, '2', 26, 28, 118, '157438-300-300.png'),
(65, 1, 1, 11, 9, 'OLAX ROUTER AX6 PRO V 4G', NULL, '2', 90, 95, 317, '156994-300-300.png'),
(66, 1, 1, 1, 10, 'Realme Note 50 128+4 Negro', NULL, '5', 152, 160, 216, '157336-300-300.png'),
(67, 1, 1, 11, 4, 'Repetidor Wi-Fi Damasco CF-WR762AC', 'Nuevo', '2', 66, 69, 112, '157389-300-300.png'),
(68, 1, 1, 11, 4, 'Router Damasco CF-WR613N V1', 'Nuevo', '3', 34, 35, 221, '157386-300-300.png'),
(69, 1, 1, 11, 4, 'Router Damasco CF-WR616AC', 'Nuevo', '3', 61, 64, 89, '157388-300-300.png'),
(70, 1, 1, 11, 11, 'Router Tenda AC8', NULL, '3', 60, 64, 94, '156913-300-300.png'),
(71, 1, 1, 1, 8, 'Samsung a26 5G 256+8  Negro', 'Nuevo', '3', 370, 390, 185, '158594-300-300.png'),
(72, 1, 1, 1, 8, 'Sasmung A36 5G 256+8 Negro', 'Nuevo', '4', 513, 540, 289, '158557-300-300.png'),
(73, 1, 1, 1, 8, 'Samsung A06 128+4 Verde Claro', NULL, '4', 154, 163, 211, '156909-300-300.png'),
(74, 1, 1, 1, 8, 'Samsung A16 256+8 Negro', NULL, '3', 285, 300, 169, '157039-300-300.png'),
(75, 1, 1, 1, 8, 'Samsung a26 5G 256+8  Verde', 'Nuevo', '4', 370, 390, 192, '158595-300-300.png'),
(76, 1, 1, 13, 12, 'Silla Gamer Razer Enki X-ESSENTIAL RZ38-03880100-R3U1', 'Nuevo', '2', 643, 677, 102, '158515-300-300.png'),
(77, 1, 1, 13, 12, 'Silla Gamer Razer Iskur V2 X Black RZ38-05310100-R3UA', 'Nuevo', '5', 642, 676, 248, '158516-300-300.png'),
(78, 1, 1, 14, 1, 'Smart Watch SW1615', NULL, '2', 47, 50, 250, '157434-300-300.png'),
(79, 1, 1, 9, 4, 'Tablet Damasco 10.1 PULGADAS T101-4', 'Nuevo', '3', 137, 145, 155, '157501-300-300.png'),
(80, 1, 1, 9, 4, 'Tablet Damasco T863-3 32+3', 'Nuevo', '3', 115, 122, 337, '157500-300-300.png'),
(81, 1, 1, 15, 2, 'Teclado Honor Pad X9A Gris', 'Nuevo', '2', 19, 21, 209, '158443-300-300.png'),
(82, 1, 1, 15, 3, 'Teclado Inalámbrico WK106', NULL, '2', 39, 42, 344, '157439-300-300.png'),
(83, 1, 1, 15, 1, 'Teclado Transparente KB05', NULL, '4', 26, 28, 82, '157426-300-300.png'),
(84, 1, 1, 1, 13, 'Tecno Caamon 30s Pro 256+8 GB Verde', 'Nuevo', '5', 406, 428, 349, '158585-300-300.png'),
(85, 1, 1, 1, 13, 'Tecno Caamon 30s Pro 256+8 GB Gris', 'Nuevo', '3', 370, 390, 158, '158581-300-300.png'),
(86, 1, 1, 1, 13, 'Tecno Caamon 40 PRO 256+8 Negro', 'Nuevo', '4', 399, 420, 54, '158583-300-300.png'),
(87, 1, 1, 1, 13, 'Tecno Caamon 40 PRO 256+8 Verde', 'Nuevo', '2', 399, 420, 109, '158582-300-300.png'),
(88, 1, 1, 1, 13, 'TECNO SPARK 30 256+8 BLANCO', NULL, '5', 218, 230, 32, '157004-300-300.png'),
(89, 1, 1, 1, 13, 'TECNO SPARK 30 256+8 NEGRO', NULL, '3', 218, 230, 145, '157005-300-300.png'),
(90, 1, 1, 1, 13, 'TECNO SPARK 30 PRO 256+8 NEGRO', NULL, '3', 280, 295, 277, '157014-300-300.png'),
(91, 1, 1, 16, 5, 'TELEVISOR DA+CO 50\' 50GF6U', NULL, '2', 369, 388, 268, '157035-300-300.png'),
(92, 1, 1, 16, 5, 'TELEVISOR DA+CO 55\' 55GF6U', NULL, '4', 458, 483, 159, '157036-300-300.png'),
(93, 1, 1, 1, 14, 'XIAOMI REDMI 14C 128+4 AZUL', NULL, '5', 274, 289, 301, '157024-300-300.png'),
(94, 1, 1, 1, 15, 'XIAOMI REDMI 14C 256+4 VERDE', NULL, '4', 194, 205, 349, '157028-300-300.png'),
(95, 1, 1, 1, 15, 'Xiaomi Redmi Note 14 128GB+6GB Negro', 'Destacado', '4', 247, 261, 158, '157359-300-300.png'),
(96, 1, 1, 1, 16, 'ZTE Nubia Neo 2 5G 256GB+8GB Amarillo', NULL, '2', 259, 272, 55, '156880-300-300.png'),
(99, 1, 2, 17, 5, 'Olla de presión Damasco Exclusive DMSSEP6L 6L', NULL, '4', 80, 75, 114, '157541-300-300.png'),
(100, 1, 2, 17, 5, 'Cepillo secador Damasco Exclusive HS-8005', NULL, '3', 30, 40, 52, '157572-300-300.png'),
(101, 1, 2, 18, 5, 'Ventilador de Torre 36\'\' Damasco YF-TO3608', NULL, '3', 50, 35, 231, '157552-300-300.png'),
(102, 1, 2, 18, 5, 'VENTILADOR DE TORRE DA+CO 29\' TF-2908R', NULL, '5', 37, 5, 318, '157552-300-300.png'),
(103, 1, 2, 20, 5, 'Protector De Voltaje Da+Co Bx-V009-N- Be-3M', NULL, '5', 12, 35, 214, '156190-300-300.png'),
(104, 1, 2, 17, 5, 'Olla De Presión DA+CO APC24C 7LTS', NULL, '5', 39, 90, 96, '156899-300-300.png'),
(105, 1, 2, 17, 17, 'FREIDORA DE AIRE ROYAL RAF45L 4.5L', NULL, '2', 76, 95, 150, '157575-300-300.png'),
(106, 1, 2, 17, 5, 'CAFETERA DA+CO 12 TAZAS 09107', NULL, '5', 27, 55, 113, '157151-300-300.png'),
(107, 1, 2, 18, 5, 'Ventilador 40\' Torre Tf-K4007R', NULL, '2', 57, 95, 96, '156756-300-300.png'),
(108, 1, 2, 18, 5, 'VENTILADOR DE PEDESTAL DA+CO 18\' 80665AB', NULL, '3', 35, 15, 119, '157061-300-300.png'),
(109, 1, 2, 18, 5, 'Ventilador 18\' Base De Plastico Kyt-45', NULL, '4', 45, 60, 290, '156522-300-300.png'),
(110, 1, 2, 18, 5, 'Ventilador Recargable Da+Co 18\' Kl-138', NULL, '4', 69, 35, 77, '156866-300-300.png'),
(111, 1, 2, 17, 18, 'OLLA ARROCERA OSTER CKSTRC1700B NEGRA', NULL, '4', 48, 46, 161, '157057-300-300.png'),
(112, 1, 2, 17, 18, 'Plancha A Vapor Oster Gcstbs6004', NULL, '3', 30, 40, 222, '156186-300-300.png'),
(113, 1, 2, 23, 19, 'Set de Almohadas Standard Da+Co', NULL, '4', 28, 50, 277, '157520-300-300.png'),
(114, 1, 2, 22, 5, 'Plancha De Cabello Zy725T', NULL, '3', 11, 39, 39, '156189-300-300.png'),
(115, 1, 2, 24, 5, 'Sarten Damasco 24 Cm Dac24', NULL, '5', 13, 30, 338, '156197-300-300.png'),
(116, 1, 2, 20, 5, 'Protector De Voltaje Da+Co Bxv010', NULL, '2', 14, 25, 228, '156283-300-300.png'),
(117, 1, 2, 23, 12, 'Silla Gamer Razer Iskur V2 X Black RZ38-05310100-R3UA', NULL, '4', 642, 20, 109, '158516-300-300.png'),
(118, 1, 2, 20, 5, 'Protector De Voltaje Da+Co Bx-V162- 10A-3M- Wt-Etl', NULL, '2', 11, 39, 169, '156191-300-300.png'),
(119, 1, 2, 23, 12, 'Silla Gamer Razer Enki X-ESSENTIAL RZ38-03880100-R3U1', NULL, '5', 643, 15, 171, 'https://www.damascovzla.com/silla-gamer-rz38-03880100-r3u1/p.png'),
(120, 1, 2, 17, 5, 'Cafetera DA+CO CM-2097 Rosada', NULL, '4', 29, 45, 325, 'https://www.damascovzla.com/cafetera-da-co-cm-2097-rosada/p.png'),
(121, 1, 2, 22, 5, 'Plancha de Cabello Damasco Exclusive TA-2864', NULL, '2', 90, 25, 102, 'https://www.damascovzla.com/plancha-de-cabello-damasco-d0008940/p.png'),
(122, 1, 2, 17, 5, 'Plancha a Vapor Damasco HJ-8055', NULL, '3', 18, 5, 176, 'https://www.damascovzla.com/plancha-damasco-hj-8055/p.png'),
(123, 1, 2, 18, 5, 'Ventilador de Mesa Damasco 12\'\' YF-DE1206', NULL, '3', 29, 45, 222, 'https://www.damascovzla.com/ventilador-damasco-12-yf-de1206/p.png'),
(124, 1, 2, 17, 5, 'Cafetera DA+CO CM-2097 Verde', NULL, '3', 29, 45, 235, 'https://www.damascovzla.com/cafetera-cm2097-verde/p.png'),
(125, 1, 2, 22, 5, 'Secador de Cabello Damasco Exclusive TC-2825', NULL, '2', 75, 5, 155, 'https://www.damascovzla.com/secador-damasco-exclisive-tc-2825/p.png'),
(126, 1, 2, 22, 5, 'Maquina de Afeitar Damasco Exclusive PR-3265', NULL, '4', 45, 60, 52, 'https://www.damascovzla.com/maquina-afeitar-pr-3265/p.png'),
(127, 1, 2, 17, 5, 'Cafetera DA+CO CM-2097 Blanca', NULL, '4', 29, 45, 108, 'https://www.damascovzla.com/cafetera-da-co-cm-2097-blanca/p.png'),
(128, 1, 2, 18, 5, 'Ventilador de Torre 18\'\' Damasco HS-188', NULL, '3', 55, 10, 32, 'https://www.damascovzla.com/ventilador-torre-hs-188/p.png'),
(129, 1, 2, 18, 5, 'Ventilador de piso Damasco  14\'\' YF-BO1411', NULL, '3', 35, 15, 146, 'https://www.damascovzla.com/ventilador-damasco-yf-bo1411/p.png'),
(130, 1, 2, 18, 5, 'Ventilador Recargable Da+Co 14\' Kl-S014', NULL, '5', 45, 60, 284, 'https://www.damascovzla.com/ventilador14-kls014/p.png'),
(131, 1, 2, 28, 5, 'CONGELADOR HOR. 150L BESTANDING BD-142', NULL, '2', 274, 55, 301, 'https://www.damascovzla.com/congelador-hor--150l-bestanding-bd-142/p.png'),
(132, 1, 2, 17, 5, 'MICROONDAS DA+CO MO-70T20L 20L NEGRO', NULL, '5', 84, 55, 301, 'https://www.damascovzla.com/microondas-da-co-mo-70t20l-20l-negro/p.png'),
(133, 1, 2, 25, 20, 'Cobija Full 180X200 Zcfu180X200', NULL, '2', 6, 0, 251, 'https://www.damascovzla.com/cobija-full-180x200-zcfu180x200-h0000753/p.png'),
(134, 1, 2, 25, 20, 'Toalla De Baño 73X150 Tpmh230', NULL, '2', 6, 0, 335, 'https://www.damascovzla.com/toalla-de-bano-73x150-tpmh230-h0000750/p.png'),
(135, 1, 2, 28, 5, 'NEVERA DAMASCO C/DISPENSADOR 310L DCRB31WXW', NULL, '2', 908, 20, 240, 'https://www.damascovzla.com/nevera-damasco-c-dispensador-310l-dcrb31wxw/p.png'),
(136, 1, 2, 17, 5, 'Olla De Presión DA+CO APC26C 9LTS', NULL, '3', 53, 20, 173, 'https://www.damascovzla.com/olla-damasco-apc26c-/p.png'),
(137, 1, 2, 17, 5, 'Calentador De Agua Da+Co Dsf85u', NULL, '5', 120, 65, 128, 'https://www.damascovzla.com/calentador-daco--dsf85u/p.png'),
(138, 1, 2, 17, 5, 'BATIDORA DE INMERSION DA+CO HB510', NULL, '4', 19, 95, 99, 'https://www.damascovzla.com/batidora-de-inmersion-da-co-hb510/p.png'),
(139, 1, 2, 23, 21, 'Colchon Individual Paradays 100X190', NULL, '2', 180, 50, 91, 'https://www.damascovzla.com/colchon-individual-paradays-100x190-d0003324/p.png'),
(140, 1, 2, 18, 5, 'Ventilador Recargable Da+Co 18\' Kl-300b', NULL, '3', 80, 75, 142, 'https://www.damascovzla.com/ventilador18-kl300b/p.png'),
(141, 1, 2, 18, 5, 'Ventilador 18\' Base De Metal Fe-45', NULL, '3', 62, 70, 84, 'https://www.damascovzla.com/ventilador-18-base-de-metal-fe-45-d0006431/p.png'),
(142, 1, 2, 18, 5, 'Ventilador De Torre Tf-3605R', NULL, '5', 63, 65, 307, 'https://www.damascovzla.com/ventilador-de-torre-tf-3605r-d0006531/p.png'),
(143, 1, 2, 23, 19, 'Colchon Venus 140X190', NULL, '5', 448, 40, 271, 'https://www.damascovzla.com/colchon-venus-140x190/p.png'),
(144, 1, 2, 22, 20, 'Plancha De Cabello Zy727', NULL, '3', 14, 25, 84, 'https://www.damascovzla.com/plancha-de-cabello-zy727-d0006083/p.png'),
(145, 1, 2, 18, 5, 'Ventilador 12\' Base De Metal Fe-30', NULL, '4', 37, 5, 249, 'https://www.damascovzla.com/ventilador-12-base-de-metal-fe-30-d0006430/p.png'),
(146, 1, 2, 17, 18, 'Plancha A Vapor Oster Gcstbs3802', NULL, '3', 22, 80, 310, 'https://www.damascovzla.com/plancha-a-vapor-oster-gcstbs3802-d0005857/p.png'),
(147, 1, 2, 24, 5, 'JUEGO DE VAJILLAS DA+CO 12 PIEZAS', NULL, '3', 19, 95, 121, 'https://www.damascovzla.com/juego-de-vajillas-da-co-12-piezas/p.png'),
(148, 1, 2, 17, 18, 'FREIDORA DE AIRE MANUAL 4L CKSTAF401MDF', NULL, '2', 114, 95, 317, 'https://www.damascovzla.com/freidora-de-aire-manual-4l-ckstaf401mdf/p.png'),
(149, 1, 2, 17, 5, 'LICUADORA DA+CO PN-802', NULL, '3', 45, 60, 209, 'https://www.damascovzla.com/licuadora-da-co-pn-802/p.png'),
(150, 1, 2, 24, 5, 'Utensilio De Cocina 6Pcs Da+Co Da-Kt6', NULL, '3', 11, 40, 77, 'https://www.damascovzla.com/utensilio-de-cocina-6pcs-da-co-da-kt6-h0001934/p.png'),
(151, 1, 2, 18, 5, 'VENTILADOR DE TORRE DA+CO 30\' TF-2902R', NULL, '4', 48, 46, 68, 'https://www.damascovzla.com/ventilador-de-torre-da-co-30--tf-2902r/p.png'),
(152, 1, 2, 18, 22, 'Ventilador Torre Decakila Kufc001B', NULL, '2', 38, 0, 91, 'https://www.damascovzla.com/ventilador-torre-decakila-kufc001b-d0006837/p.png'),
(153, 1, 2, 17, 18, 'LICUADORA OSTER BLSTKAG-WRD- BLANCA', NULL, '2', 53, 20, 232, 'https://www.damascovzla.com/licuadora-oster-blstkag-wrd--blanca/p.png'),
(154, 1, 2, 23, 19, 'Colchon Aegean 160X190', NULL, '2', 598, 50, 204, 'https://www.damascovzla.com/colchon-aegean-160x190/p.png'),
(155, 1, 2, 26, 5, 'Base Movible Tv 32-70 1041B', NULL, '5', 34, 19, 307, 'https://www.damascovzla.com/base-movible-tv-32-70-1041b-d0006037/p.png'),
(156, 1, 2, 26, 5, 'Base Movible Tv 26-52 Cp304', NULL, '4', 17, 10, 240, 'https://www.damascovzla.com/base-movible-tv-26-52-cp304-d0006036/p.png'),
(157, 1, 2, 18, 5, 'Ventilador 18\' Fs-K45B', NULL, '2', 61, 74, 260, 'https://www.damascovzla.com/ventilador-18-fs-k45b-d0006432/p.png'),
(158, 1, 2, 26, 5, 'Base De Tv Fija 32 -80 B64', NULL, '2', 11, 39, 229, 'https://www.damascovzla.com/base-de-tv-fija-32-80-b64-d0006035/p.png'),
(159, 1, 2, 24, 5, 'JGO/VAJILLA DA+CO 18 PCS ESMALTADA', NULL, '2', 28, 50, 344, 'https://www.damascovzla.com/jgo-vajilla-da-co-18-pcs-esmaltada/p.png'),
(160, 1, 2, 17, 5, 'LICUADORA DA+CO PN-825', NULL, '3', 98, 81, 20, 'https://www.damascovzla.com/licuadora-da-co-pn-825/p.png'),
(161, 1, 2, 17, 18, 'Licuadora oster blstkagwpb', NULL, '3', 69, 35, 44, 'https://www.damascovzla.com/licuadora-oster-blstkagwpb/p.png'),
(162, 1, 2, 24, 5, 'SARTEN ANTIADHERENTE DA-JC18', NULL, '2', 17, 10, 141, 'https://www.damascovzla.com/sarten-antiadherente-da-jc18/p.png'),
(163, 1, 2, 20, 5, 'Protector De Voltaje Da+Co Bx-V236- 120V-30A', NULL, '5', 14, 26, 223, 'https://www.damascovzla.com/protector-de-voltaje-da-co-bx-v236-120v-30a-d0002890/p.png'),
(164, 1, 2, 23, 23, 'Colchon Aegean 140X190', NULL, '3', 516, 81, 338, 'https://www.damascovzla.com/colchon-aegean-140x190-h0000734/p.png'),
(165, 1, 2, 23, 19, 'Colchon Venus 160X190', NULL, '3', 528, 20, 343, 'https://www.damascovzla.com/colchon-venus-160x190/p.png'),
(166, 1, 2, 17, 5, 'LICUADORA DA+CO PN-4633', NULL, '3', 38, 94, 350, 'https://www.damascovzla.com/licuadora-da-co-pn-4633/p.png'),
(167, 1, 2, 24, 5, 'JGO VAJILLA DE LUJO DA+CO 26 PCS', NULL, '5', 76, 0, 41, 'https://www.damascovzla.com/jgo-vajilla-de-lujo-da-co-26-pcs/p.png'),
(168, 1, 2, 17, 5, 'BATIDORA DA+CO 500W 6V MK-36', NULL, '3', 170, 5, 126, 'https://www.damascovzla.com/batidora-da-co-500w-6v-mk-36/p.png'),
(169, 1, 2, 22, 5, 'Secador De Cabello Ion 1900W Rls-101', NULL, '3', 33, 25, 157, 'https://www.damascovzla.com/secador-de-cabello-ion-1900w-rls-101-d0001023/p.png'),
(170, 1, 2, 22, 5, 'Rizador De Cabello Zy600B', NULL, '5', 9, 50, 58, 'https://www.damascovzla.com/rizador-de-cabello-zy600b-d0006084/p.png'),
(171, 1, 2, 17, 5, 'LICUADORA DA+CO PN-803', NULL, '2', 38, 94, 130, 'https://www.damascovzla.com/licuadora-da-co-pn-803/p.png'),
(172, 1, 2, 17, 5, 'PLANCHA A VAPOR OSTER GCSTBS5004', NULL, '2', 25, 65, 125, 'https://www.damascovzla.com/plancha-a-vapor-oster-gcstbs5004/p.png'),
(173, 1, 2, 24, 5, 'JGO/VAJILLA DA+CO 30PCS', NULL, '4', 38, 0, 218, 'https://www.damascovzla.com/jgo-vajilla-da-co-30pcs/p.png'),
(174, 1, 2, 24, 5, 'SARTEN ANTIADHERENTE DA-BF19', NULL, '2', 17, 10, 30, 'https://www.damascovzla.com/sarten-antiadherente-da-bf19/p.png'),
(175, 1, 2, 25, 20, 'Juego De Sábanas 4Pcs Esq44288Pa Queen', NULL, '5', 17, 10, 140, 'https://www.damascovzla.com/juego-de-sabanas-4pcs-esq44288pa-queen-h0002166/p.png'),
(176, 1, 2, 20, 17, 'Protector De Voltaje Royal 220V', NULL, '3', 16, 15, 261, 'https://www.damascovzla.com/protector-de-voltaje-royal-220v-d0006767/p.png'),
(177, 1, 2, 17, 5, 'FREIDORA/AIRE DA+CO 4L AF3506-D', NULL, '2', 73, 15, 203, 'https://www.damascovzla.com/freidora-aire-da-co-4l-af3506-d/p.png'),
(178, 1, 2, 17, 18, 'Plancha Clasica Oster Gcstbv4119', NULL, '2', 39, 90, 211, 'https://www.damascovzla.com/plancha-clasica-oster-gcstbv4119-d0003708/p.png'),
(179, 1, 2, 24, 5, 'SARTÉN DE CERÁMICA ROYAL 26 CM RST26CR', NULL, '3', 11, 39, 95, 'https://www.damascovzla.com/sarten-de-ceramica-royal-26-cm-rst26cr/p.png'),
(180, 1, 2, 26, 5, 'Repisa De 2 Niveles Para Tv Ht-008', NULL, '2', 76, 0, 156, 'https://www.damascovzla.com/repisa-de-2-niveles-para-tv-ht-008-d0002025/p.png'),
(181, 1, 2, 26, 5, 'Base De Tv Fija 26 -55 B41', NULL, '3', 12, 35, 143, 'https://www.damascovzla.com/base-de-tv-fija-26-55-b41-d0006034/p.png'),
(182, 1, 2, 24, 5, 'Sarten Damasco 20 Cm Dac20', NULL, '3', 13, 30, 228, 'https://www.damascovzla.com/sarten-damasco-20-cm-dac20-d0003001/p.png'),
(183, 1, 2, 24, 5, 'Sarten Damasco 28 Cm Daa28', NULL, '5', 16, 16, 29, 'https://www.damascovzla.com/sarten-damasco-28-cm-daa28-d0003000/p.png'),
(184, 1, 2, 20, 24, 'Protector De Voltaje Well Wp-220V', NULL, '3', 23, 75, 104, 'https://www.damascovzla.com/protector-de-voltaje-well-wp-220v-d0001009/p.png'),
(185, 1, 2, 24, 5, 'JGO VAJILLA DE LUJO DA+CO 43 PCS', NULL, '3', 118, 75, 84, 'https://www.damascovzla.com/jgo-vajilla-de-lujo-da-co-43-pcs/p.png'),
(186, 1, 2, 23, 19, 'Silla Comedor 1152', NULL, '4', 169, 10, 86, 'https://www.damascovzla.com/silla-comedor-1152/p.png'),
(187, 1, 2, 25, 20, 'Juego De Sábanas 4Pcs King Esk3706', NULL, '4', 26, 60, 161, 'https://www.damascovzla.com/juego-de-sabanas-4pcs-king-esk3706-h0002647/p.png'),
(188, 1, 2, 24, 5, 'Cacerola Da+Co 20X9.6 Dacw002C20', NULL, '5', 42, 75, 194, 'https://www.damascovzla.com/cacerola-da-co-20x9-6-dacw002c20-d0005907/p.png'),
(189, 1, 2, 23, 25, 'Juego De Cama Clipped 3Pc Queen Bcsq4429', NULL, '4', 57, 0, 139, 'https://www.damascovzla.com/juego-de-cama-clipped-3pc-queen-bcsq4429-h0002366/p.png'),
(190, 1, 2, 25, 20, 'Cortinda De Ventana 1X55X90 Wpsg405', NULL, '3', 15, 20, 94, 'https://www.damascovzla.com/cortinda-de-ventana-1x55x90-wpsg405-h0002019/p.png'),
(191, 1, 2, 23, 20, 'Set De Cama 6 Pcs Queen Bcsq4606', NULL, '5', 72, 20, 33, 'https://www.damascovzla.com/set-de-cama-6-pcs-queen-bcsq4606-h0002641/p.png'),
(192, 1, 2, 24, 5, 'Sarten Damasco 24 Cm Daa24', NULL, '3', 13, 30, 193, 'https://www.damascovzla.com/sarten-damasco-24-cm-daa24-d0003008/p.png'),
(193, 1, 2, 23, 26, 'Edredon Bordado Soho 12Pcs Bcsf4120 Full', NULL, '2', 76, 1, 186, 'https://www.damascovzla.com/edredon-bordado-soho-12pcs-bcsf4120-full-h0002171/p.png'),
(194, 1, 2, 23, 20, 'Edredon De Terciopelo 12Pcs Bcsq4121 Queen', NULL, '5', 78, 85, 333, 'https://www.damascovzla.com/edredon-de-terciopelo-12pcs-bcsq4121-queen-h0002180/p.png'),
(195, 1, 2, 25, 20, 'Cortinda De Ventana 1X55X90 Wpsg407', NULL, '2', 15, 20, 92, 'https://www.damascovzla.com/cortinda-de-ventana-1x55x90-wpsg407-h0002020/p.png'),
(196, 1, 2, 26, 5, 'Repisa De 1 Nivel Para Tv Ht-007', NULL, '5', 47, 50, 102, 'https://www.damascovzla.com/repisa-de-1-nivel-para-tv-ht-007-d0002024/p.png'),
(197, 1, 2, 25, 20, 'Cortinda De Ventana 1X55X90 Wpsg40', NULL, '3', 11, 39, 217, 'https://www.damascovzla.com/cortinda-de-ventana-1x55x90-wpsg40-h0002018/p.png'),
(198, 1, 2, 23, 19, 'Silla Comedor 11154', NULL, '5', 197, 60, 98, 'https://www.damascovzla.com/silla-comedor-11154/p.png'),
(199, 1, 2, 23, 20, 'Edredon 9Pc Queen Bcsq4', NULL, '4', 54, 15, 148, 'https://www.damascovzla.com/edredon-9pc-queen-bcsq4-h0001996/p.png'),
(200, 1, 2, 23, 19, 'Silla Comedor 1129c', NULL, '3', 169, 10, 96, 'https://www.damascovzla.com/silla-comedor-1129c/p.png'),
(201, 1, 2, 23, 20, 'Set De Cama 8 Pcs Queen Bcsq4606', NULL, '2', 60, 80, 347, 'https://www.damascovzla.com/set-de-cama-8-pcs-queen-bcsq4606-h0002643/p.png'),
(202, 1, 2, 23, 19, 'Silla Comedor 11145', NULL, '4', 211, 85, 102, 'https://www.damascovzla.com/silla-comedor--11145/p.png'),
(203, 1, 2, 23, 20, 'Set De Cama 6 Pcs King Bcsk4606', NULL, '3', 72, 20, 114, 'https://www.damascovzla.com/set-de-cama-6-pcs-king-bcsk4606-h0002640/p.png'),
(204, 1, 2, 23, 20, 'Juego De Cama Clipped 3Pc King Bcsk4429', NULL, '4', 61, 74, 245, 'https://www.damascovzla.com/juego-de-cama-clipped-3pc-king-bcsk4429-h0002365/p.png'),
(205, 1, 2, 23, 20, 'Set De Cama 8 Pcs King Bcsk4606', NULL, '3', 60, 80, 201, 'https://www.damascovzla.com/set-de-cama-8-pcs-king-bcsk4606-h0002642/p.png'),
(206, 1, 2, 23, 20, 'Set De Cama 3Pcs Full Bcsf414/Bcsf415', NULL, '3', 26, 60, 249, 'https://www.damascovzla.com/set-de-cama-3pcs-full-bcsf414-bcsf415-h0002638/p.png'),
(207, 1, 2, 23, 19, 'Silla Comedor 1172', NULL, '5', 151, 5, 292, 'https://www.damascovzla.com/silla-comedor-1172/p.png'),
(208, 1, 2, 23, 19, 'Silla Comedor 1140', NULL, '5', 186, 21, 31, 'https://www.damascovzla.com/silla-omedor-1140/p.png'),
(209, 1, 2, 23, 20, 'Jgo Cama Crinkle King Bcsk4173/421 10Pcs', NULL, '4', 85, 50, 254, 'https://www.damascovzla.com/jgo-cama-crinkle-king-bcsk4173-421-10pcs-h0002359/p.png'),
(210, 1, 2, 23, 20, 'Set De Cama 3Pcs Twin Bcst41452/Bcst41452', NULL, '5', 23, 75, 164, 'https://www.damascovzla.com/set-de-cama-3pcs-twin-bcst41452-bcst41452-h0002639/p.png'),
(211, 1, 2, 23, 19, 'Silla Comedor 11138D', NULL, '3', 151, 5, 40, 'https://www.damascovzla.com/silla-comedor-11138d/p.png'),
(212, 1, 2, 23, 19, 'Silla Comedor 11121', NULL, '3', 213, 76, 347, 'https://www.damascovzla.com/silla-comedor-11121/p.png'),
(213, 1, 2, 23, 19, 'Silla Comedor 11143', NULL, '3', 267, 90, 275, 'https://www.damascovzla.com/silla-comedor-11143/p.png'),
(214, 1, 2, 24, 5, 'BOTELLA DEPORTIVA KEDERA 042086', NULL, '3', 16, 15, 314, 'https://www.damascovzla.com/botella-deportiva-kedera-042086/p.png'),
(215, 1, 2, 24, 5, 'Cacerola Da+Co 20X11 Dacw003C20', NULL, '4', 57, 0, 64, 'https://www.damascovzla.com/cacerola-da-co-20x11-dacw003c20-d0005910/p.png'),
(216, 1, 2, 23, 19, 'Silla Comedor 1176C', NULL, '4', 288, 80, 349, 'https://www.damascovzla.com/silla-comedor-1176c/p.png'),
(217, 1, 2, 23, 19, 'Silla Comedor 1153', NULL, '2', 172, 90, 211, 'https://www.damascovzla.com/silla-comedor-1153/p.png'),
(218, 1, 2, 23, 20, 'Jgo Cama Crinkle Queen Bcsq4173/421 10Pcs', NULL, '3', 71, 26, 318, 'https://www.damascovzla.com/jgo-cama-crinkle-queen-bcsq4173-421-10pcs-h0002361/p.png'),
(219, 1, 2, 23, 19, 'Silla Comedor 1121b', NULL, '3', 251, 75, 276, 'https://www.damascovzla.com/silla-comedor-1121b/p.png'),
(220, 1, 2, 23, 19, 'Silla Comedor 11146', NULL, '4', 156, 75, 74, 'https://www.damascovzla.com/silla-comedor-11146/p.png'),
(221, 1, 2, 23, 19, 'Silla Comedor 1175D', NULL, '4', 164, 35, 186, 'https://www.damascovzla.com/silla-comedor-1175d/p.png'),
(222, 1, 2, 23, 19, 'Silla Comedor 11124', NULL, '3', 276, 45, 25, 'https://www.damascovzla.com/silla-comedor-11124/p.png'),
(223, 1, 2, 23, 19, 'Silla Comedor 1138', NULL, '4', 222, 30, 212, 'https://www.damascovzla.com/silla-comedor-1138/p.png'),
(224, 1, 2, 23, 20, 'Kmc055 Silla W56*D61 Marron', NULL, '5', 118, 75, 302, 'https://www.damascovzla.com/kmc055-silla-w56d61-marron-h0001605/p.png'),
(225, 1, 2, 23, 19, 'Silla Comedor 1140d', NULL, '2', 128, 25, 193, 'https://www.damascovzla.com/silla-comedor-1140d/p.png'),
(226, 1, 2, 23, 27, 'Almohada Maxidreams Antialergica Standar', NULL, '5', 6, 0, 37, 'https://www.damascovzla.com/almohada-maxidreams-antialergica-standar-d0002218/p.png'),
(227, 1, 2, 24, 5, 'Sarten Damasco 20 Cm Daa20', NULL, '4', 9, 0, 251, 'https://www.damascovzla.com/sarten-damasco-20-cm-daa20-d0002998/p.png'),
(229, 1, 3, 27, 5, 'Lavadora Semiautomática Da+Co 7Kg', NULL, '2', 180, 50, 131, '155723-300-300.png'),
(230, 1, 3, 28, 5, 'Nevera Da+Co 207 Lts 2 Puertas Dcrt21', NULL, '5', 380, 0, 213, '156386-300-300.png'),
(231, 1, 3, 29, 5, 'AIRE DE VENTANA DA+CO 12K BTU 110V CYW-12AC1', NULL, '2', 266, 0, 320, '157242-300-300.png'),
(232, 1, 3, 29, 5, 'AIRE SPLIT DA+CO 12000 BTU CS-12AC CTG', NULL, '3', 280, 25, 280, '155997-300-300.png'),
(233, 1, 3, 28, 5, 'Nevera Da+Co C/Dispensador Dcrt25Wxw 236L', NULL, '4', 559, 55, 91, '156054-300-300.png'),
(234, 1, 3, 29, 5, 'AIRE DE VENTANA DA+CO 12K BTU 220V CYW-12AC', NULL, '2', 249, 85, 258, '157271-300-300.png'),
(235, 1, 3, 31, 5, 'Freidora de Aire Damasco Exclusive 9L AF9021', 'Nuevo', '4', 85, 50, 336, '157542-300-300.png'),
(236, 1, 3, 29, 5, 'Aire Portatil Da+Co 12000Btu A016A', NULL, '2', 270, 75, 222, '155995-300-300.png'),
(237, 1, 3, 31, 5, 'Cafetera Damasco 12 Tazas YD-1813', 'Nuevo', '2', 25, 65, 86, '157601-300-300.png'),
(238, 1, 3, 27, 5, 'Lavadora Semiautomática Da+Co 9Kg', NULL, '4', 240, 35, 72, '155726-300-300.png'),
(239, 1, 3, 29, 5, 'Aire Split Da+Co 12000 Btu 110V CS-12AC1', NULL, '5', 359, 10, 84, '155582-300-300.png'),
(240, 1, 3, 27, 8, 'Lavadora Samsung 9Kg WA90CG4240BYAP', 'Nuevo', '2', 474, 99, 184, '158568-300-300.png'),
(241, 1, 3, 32, 5, 'Microonda Da+Co Dacoem020Cr1', NULL, '3', 90, 25, 318, '156075-300-300.png'),
(242, 1, 3, 27, 5, 'Lavadora Auto Da+Co 9Kg Gris Tl-9Kggs', NULL, '2', 349, 60, 26, '156041-300-300.png'),
(243, 1, 3, 27, 5, 'Lavadora Semiautomática Da+Co 11Kg', NULL, '3', 299, 25, 148, '155714-300-300.png'),
(244, 1, 3, 27, 5, 'Secadora Da+Co 7Kg Mds70', NULL, '4', 435, 10, 312, '156146-300-300.png'),
(245, 1, 3, 30, 28, 'Cocina Ind Dublin Plus Gris C20 S01', NULL, '3', 299, 25, 106, '156451-300-300.png'),
(246, 1, 3, 29, 5, 'Aire De Ventana Da+Co Mw12crn8 Ii 110v', NULL, '5', 285, 0, 234, '156947-300-300.png'),
(247, 1, 3, 28, 5, 'Congelador Da+Co 200 Lts Dcfa20', NULL, '2', 299, 25, 170, '156449-300-300.png'),
(248, 1, 3, 28, 5, 'NEVERA 187L DA+CO DC187', NULL, '2', 336, 30, 130, '157240-300-300.png'),
(249, 1, 3, 27, 29, 'Lavadora Semiautomática Midea Gris 11Kg  MT100W110/WG-VE', NULL, '2', 299, 25, 118, '157291-300-300.png'),
(250, 1, 3, 28, 5, 'Nevera Da+Co Ejecutiva Dcra05', NULL, '5', 150, 10, 182, '155769-300-300.png'),
(251, 1, 3, 32, 5, 'Microondas Damasco 25L DACOEM9P022PE', 'Nuevo', '2', 102, 60, 204, '157558-300-300.png'),
(252, 1, 3, 27, 5, 'Lavadora Auto. Da+Co 13Kg Gris Tl-13Kggs', NULL, '2', 449, 35, 125, '156043-300-300.png'),
(253, 1, 3, 31, 5, 'Cafetera Espresso ECM-160', NULL, '4', 59, 85, 323, '157414-300-300.png'),
(254, 1, 3, 28, 5, 'Nevera Ejecutiva Da+Co Dcra09 93 Lts Gri', NULL, '2', 221, 35, 226, '156077-300-300.png'),
(255, 1, 3, 30, 5, 'TOPE DA+CO JK581G5ACCD', NULL, '3', 114, 95, 145, '157280-300-300.png'),
(256, 1, 3, 28, 5, 'Nevera Da+Co French 518L Dcrs52Ws', NULL, '4', 1, 60, 27, '155772-300-300.png'),
(257, 1, 3, 31, 5, 'Cafetera Da+Co 5 Tazas', NULL, '3', 18, 5, 341, '156160-300-300.png'),
(258, 1, 3, 31, 17, 'FREIDORA DE AIRE ROYAL RAF45L 4.5L', NULL, '4', 76, 95, 280, '157575-300-300.png'),
(259, 1, 3, 29, 5, 'Aire Split Da+Co 12k Btu Daco12CB Negro  CTG', NULL, '5', 308, 75, 28, '156953-300-300.png'),
(260, 1, 3, 31, 5, 'CAFETERA DA+CO 12 TAZAS 09107', NULL, '3', 27, 55, 273, '157151-300-300.png'),
(261, 1, 3, 31, 5, 'Freidora/Aire Da+Co 4L Af4001-M', NULL, '3', 51, 30, 269, '156281-300-300.png'),
(262, 1, 3, 31, 18, 'Cafetera Oster Ocho Tazas  Bvstdc4404', NULL, '3', 95, 0, 176, '156427-300-300.png'),
(263, 1, 3, 31, 5, 'Licuadora Da+Co Cromada Pn4655 3V 850W', NULL, '3', 45, 60, 53, '156170-300-300.png'),
(264, 1, 3, 31, 30, 'Cafetera Hamilton Beach 12 Tazas HB49630-MX', 'Nuevo', '5', 51, 30, 47, '157496-300-300.png'),
(265, 1, 3, 31, 5, 'Batidora Da+Co 500W 10V Mk-1201', NULL, '3', 105, 45, 56, '156270-300-300.png'),
(266, 1, 3, 27, 5, 'Lavadora Automatica Da+Co 16Kg Tl-16Kggs', NULL, '5', 568, 10, 120, '155692-300-300.png'),
(267, 1, 3, 28, 5, 'CONGELADOR DA+CO DCFA50 510 LTS', NULL, '2', 882, 55, 80, '157189-300-300.png'),
(268, 1, 3, 31, 5, 'Licuadora Da+Co Pny66 3Vel', NULL, '5', 35, 15, 22, '156175-300-300.png'),
(269, 1, 3, 30, 5, 'Horno Electrico Da+Co Big37Nm30E0 60 Cm', NULL, '5', 475, 0, 182, '156027-300-300.png'),
(270, 1, 3, 31, 18, 'OLLA ARROCERA OSTER CKSTRC1700B NEGRA', NULL, '3', 48, 46, 161, '157057-300-300.png'),
(271, 1, 3, 32, 29, 'Microondas Midea 30L 1.0 EM9P032MOG', 'Nuevo', '4', 136, 80, 239, '157512-300-300.png'),
(272, 1, 3, 32, 29, 'Microondas Midea 30L 1.0 EM9P032MOB', 'Nuevo', '3', 132, 5, 30, '157514-300-300.png'),
(273, 1, 3, 31, 18, 'Licuadora Oster 2 Velc Blstkapwpb', NULL, '3', 65, 55, 76, '155903-300-300.png'),
(274, 1, 3, 30, 5, 'Tope Da+Co A Gas Ghs090 90Cm 5 Hornillas', NULL, '3', 220, 40, 270, '156257-300-300.png'),
(275, 1, 3, 29, 5, 'Aire Split Da+Co 18k Btu DACO18C Blanco', 'Nuevo', '4', 584, 25, 111, '157461-300-300.png'),
(276, 1, 3, 28, 5, 'Nevera Vertical Da+Co 359L Fl1-47 - Dcrg388', NULL, '2', 798, 95, 54, '155763-300-300.png'),
(277, 1, 3, 30, 5, 'Tope Da+Co A Gas Ghg084 60Cm 4 Hornillas', NULL, '2', 133, 95, 249, '155790-300-300.png'),
(278, 1, 3, 27, 29, 'Lavadora Midea 16Kg MA512W16/T-VE  Titanium', NULL, '3', 588, 5, 72, '157287-300-300.png'),
(279, 1, 3, 31, 18, 'Cafetera Oster 12 Tzs Bvstdc4403', NULL, '3', 65, 55, 254, '155888-300-300.png'),
(280, 1, 3, 30, 29, 'Cocina 6H Midea 30TMG6G108S', 'Nuevo', '5', 474, 99, 41, '158574-300-300.png'),
(281, 1, 3, 28, 29, 'Nevera 2Ptas Midea 204L MDRT294FGG50', 'Nuevo', '3', 441, 75, 87, '158572-300-300.png'),
(282, 1, 3, 33, 5, 'Campana Da+Co Rhm60 60Cm Negra', NULL, '3', 170, 5, 290, '155614-300-300.png'),
(283, 1, 3, 27, 29, 'Lavadora Semiautomática Midea Gris 15Kg MT100W150/WG-VE', 'Nuevo', '3', 409, 45, 179, '158578-300-300.png'),
(284, 1, 3, 30, 18, 'Horno Tostador Oster Tssttvvg01', NULL, '4', 55, 10, 334, '156031-300-300.png'),
(285, 1, 3, 28, 29, 'Nevera Midea C/Dispensador 230L  MDRT346MTR28WD-INV', 'Nuevo', '2', 587, 10, 121, '158571-300-300.png'),
(286, 1, 3, 28, 29, 'Nevera Midea C/Dispensador 264L MDRT385MTR28WD-INV', 'Nuevo', '4', 638, 40, 248, '158570-300-300.png'),
(287, 1, 3, 29, 5, 'Aire Split DA+CO 12000 220v BTU DMTL-MS12-S2 SILVER', 'Nuevo', '2', 304, 0, 193, '158597-300-300.png'),
(288, 1, 3, 27, 29, 'Lavadora Automática Midea 13Kg Gris MA200W130/G-PE', 'Nuevo', '3', 500, 65, 204, '158580-300-300.png'),
(289, 1, 3, 27, 5, 'Lavadora Damasco Exclusive  22KG TOUCH DFTWM220', 'Nuevo', '4', 722, 94, 90, '158593-300-300.png'),
(290, 1, 3, 29, 5, 'Aire Split Da+Co 24000 Cs-24AC', NULL, '2', 674, 50, 150, '155596-300-300.png'),
(291, 1, 3, 27, 5, 'Lavadora Damasco Exclusive 14KG TOUCH DFTWM140', 'Nuevo', '5', 607, 5, 128, '158592-300-300.png'),
(292, 1, 3, 32, 8, 'Microondas Samsung 28L ME21DB670012AA', 'Nuevo', '2', 427, 50, 171, '158567-300-300.png'),
(293, 1, 3, 31, 5, 'Tetera Damasco Exclusive WK8359NT', NULL, '5', 35, 15, 120, '157625-300-300.png'),
(294, 1, 3, 30, 8, 'Cocina Samsung a Gas  4 hornillas NX24BG35411VAP', 'Nuevo', '3', 522, 50, 68, '158566-300-300.png'),
(295, 1, 3, 28, 29, 'Nevera Midea 400L SBS  MDRS619FGR28-INV', 'Nuevo', '2', 1, 16, 293, '158506-300-300.png'),
(296, 1, 3, 29, 5, 'Aire Split DA+CO 24000 BTU 220v DMTL-MS12-S2 SILVER', 'Nuevo', '4', 712, 50, 247, '158599-300-300.png'),
(297, 1, 3, 28, 8, 'NEVERA SAMSUNG RF22A4010S9', 'Nuevo', '5', 1, 95, 338, '158552-300-300.png'),
(298, 1, 3, 30, 8, 'HORNO ELECT SMART 30 SAMSUNG NV51T5511SS', 'Nuevo', '4', 1, 35, 266, '158563-300-300.png'),
(299, 1, 3, 28, 29, 'Nevera Midea C/Dispensador MDRT645MTR28WD-INV 465L', 'Nuevo', '3', 1, 60, 297, '158493-300-300.png'),
(300, 1, 3, 29, 5, 'Aire Split DA+CO 18000 BTU 220v DMTL-MS12-S2 SILVER', 'Nuevo', '2', 608, 0, 334, '158598-300-300.png'),
(301, 1, 3, 27, 5, 'Lavadora Damasco Exclusive  12Kg TOUCH DFTWM120', 'Nuevo', '5', 593, 75, 101, '158591-300-300.png'),
(302, 1, 3, 28, 8, 'Nevera Samsung SBS 700L RS23T5B00S9', 'Nuevo', '5', 1, 50, 144, '158502-300-300.png'),
(303, 1, 3, 27, 8, 'Lavadora Samsung Carga Sup 20Kg WA21CG6746BWAP', 'Nuevo', '2', 1, 35, 65, '158500-300-300.png'),
(304, 1, 3, 28, 31, 'Enfriador de Vino Galanz AMAW36S', 'Nuevo', '5', 638, 40, 207, '158569-300-300.png'),
(305, 1, 3, 27, 32, 'Lavadora Lg 13KG WT13WPBPK', 'Nuevo', '4', 748, 60, 157, '158488-300-300.png'),
(306, 1, 3, 28, 29, 'Congelador Horizontal Midea 418L MDRC564FZR01', 'Nuevo', '3', 758, 10, 144, '158489-300-300.png'),
(307, 1, 3, 27, 8, 'Secadora Samsung  22KG DVE22A5370W/AP', 'Nuevo', '2', 1, 50, 228, '158508-300-300.png'),
(308, 1, 3, 28, 5, 'Congelador Horizontal 420L BESTANDING BD-419', 'Nuevo', '2', 738, 15, 29, '158486-300-300.png'),
(309, 1, 3, 27, 8, 'Lavadora Samsung 17KG WA17CG6441BWAP', 'Nuevo', '2', 798, 95, 103, '158469-300-300.png'),
(310, 1, 3, 29, 32, 'Aire Split LG 12000 BTU VR122C7', 'Nuevo', '3', 1, 55, 79, '158454-300-300.png'),
(311, 1, 3, 28, 29, 'Nevera Midea C/Dispensador  MDRT489MTR28WD-INV 388L', 'Nuevo', '3', 778, 4, 66, '158491-300-300.png'),
(312, 1, 3, 28, 8, 'NEVERA SAMSUNG 22 PIES RF22A4220S9', 'Nuevo', '5', 2, 0, 72, '158547-300-300.png'),
(313, 1, 3, 27, 8, 'SECADORA SAMSUNG DVE24A5370V/AP', 'Nuevo', '3', 1, 0, 143, '158564-300-300.png'),
(314, 1, 3, 28, 5, 'NEVERA DA+CO 165L 2 PUERTAS DCRT16', NULL, '3', 389, 50, 150, '157238-300-300.png'),
(315, 1, 3, 30, 8, 'Horno Samsung NV51CB700S12AA', 'Nuevo', '2', 2, 0, 302, '158513-300-300.png'),
(316, 1, 3, 31, 5, 'Licuadora Damasco Exclusive CTB635', 'Nuevo', '4', 95, 0, 45, '157634-300-300.png'),
(317, 1, 3, 28, 29, 'Congelador Horizontal Midea MDRC698FZG01', 'Nuevo', '2', 926, 25, 296, '158484-300-300.png'),
(318, 1, 3, 27, 8, 'LAVASECA SAMSUNG 11KG WD11FG6B34BBED', 'Nuevo', '2', 1, 50, 329, '158460-300-300.png'),
(319, 1, 3, 31, 5, 'Procesador de alimentos Damasco Exclusive CH1110QT', 'Nuevo', '4', 33, 25, 78, '157626-300-300.png'),
(320, 1, 3, 31, 5, 'Cafetera DA+CO CM-2097 Rosada', NULL, '3', 29, 45, 45, '157378-300-300.png'),
(321, 1, 3, 31, 5, 'Cafetera Digital Damasco Exlcusive DMS1429BDL', 'Nuevo', '4', 57, 0, 303, '157636-300-300.png'),
(322, 1, 3, 31, 5, 'Cafetera Damasco Exclusive DMS9431DL', 'Nuevo', '2', 55, 10, 34, '157637-300-300.png'),
(323, 1, 3, 31, 5, 'Cafetera Damasco Exclusive DMS9430DL', 'Nuevo', '2', 70, 30, 236, '157638-300-300.png'),
(324, 1, 3, 31, 5, 'Freidora de Aire Damasco Exclusive AF-255EL 25L', 'Nuevo', '2', 150, 10, 65, '157611-300-300.png'),
(325, 1, 3, 27, 5, 'Secadora Da+Co 11KG SECA-11KGGS', 'Nuevo', '3', 836, 0, 259, '157629-300-300.png'),
(326, 1, 3, 30, 5, 'Horno Damasco Exclusive 40L TO-407CL', 'Nuevo', '4', 254, 59, 88, '157615-300-300.png'),
(327, 1, 3, 31, 5, 'Freidora de Aire Damasco Exclusive 11.6L AF1601', 'Nuevo', '5', 110, 20, 305, '157598-300-300.png'),
(328, 1, 3, 31, 18, 'Licuadora Oster 2 Velocidades  46515', 'Nuevo', '2', 100, 70, 247, '157603-300-300.png'),
(329, 1, 3, 31, 5, 'Licuadora Damasco PN-686G', 'Nuevo', '3', 30, 40, 302, '157593-300-300.png'),
(330, 1, 3, 31, 5, 'Batidora  Damasco Exclusive DMS833DL', 'Nuevo', '3', 25, 65, 87, '157608-300-300.png'),
(331, 1, 3, 31, 5, 'Cafetera Damasco Exclusive 12 Tazas CM2088CW', 'Nuevo', '4', 37, 5, 171, '157607-300-300.png'),
(332, 1, 3, 31, 5, 'Freidora de Aire Damasco Exclusive AF-251EL 25L', 'Nuevo', '5', 150, 10, 245, '157609-300-300.png'),
(333, 1, 3, 31, 18, 'Licuadora clásica Oster BLST4655-013', 'Nuevo', '3', 100, 70, 32, '157594-300-300.png'),
(334, 1, 3, 31, 5, 'Licuadora Damasco Exclusive 3.0L DM-305A', 'Nuevo', '4', 105, 45, 66, '157536-300-300.png'),
(335, 1, 3, 31, 18, 'Cafetera Oster 5 Tazas BVSTDCS51B-013', 'Nuevo', '4', 30, 40, 213, '157606-300-300.png'),
(336, 1, 3, 31, 5, 'Cafetera DA+CO CM-2097 Verde', NULL, '5', 29, 45, 187, '157376-300-300.png'),
(337, 1, 3, 28, 5, 'Dispensador de Agua Damasco YL1634S', 'Nuevo', '4', 245, 10, 275, '157551-300-300.png'),
(338, 1, 3, 31, 5, 'Licuadora Damasco Exclusive TB508', 'Nuevo', '2', 39, 90, 134, '157597-300-300.png'),
(339, 1, 3, 31, 5, 'Extractor de Jugo Damasco JE966', 'Nuevo', '4', 105, 45, 157, '157588-300-300.png'),
(340, 1, 3, 31, 5, 'Cafetera DA+CO CM-2097 Blanca', NULL, '3', 29, 45, 32, '157380-300-300.png'),
(341, 1, 3, 27, 5, 'Lavadora Semiautomática Da+Co 15Kg', NULL, '5', 429, 41, 330, '155717-300-300.png'),
(342, 1, 3, 30, 5, 'Cocina Electrica Da+Co 1 Hornilla Es001', NULL, '4', 9, 0, 214, '155638-300-300.png'),
(343, 1, 3, 31, 5, 'Licuadora Damasco BL827', 'Nuevo', '2', 38, 0, 57, '157585-300-300.png'),
(344, 1, 3, 31, 5, 'Freidora de Aire Damasco Exclusive 9L AF7912', 'Nuevo', '2', 90, 25, 286, '157538-300-300.png'),
(345, 1, 3, 32, 5, 'Microondas Damasco 30L DACOEM025E', 'Nuevo', '3', 130, 15, 247, '157559-300-300.png'),
(346, 1, 3, 30, 5, 'Tope Da+Co A Gas Ghg403 60Cm 4 Hornillas', NULL, '2', 117, 80, 25, '158588-300-300.png'),
(347, 1, 3, 31, 5, 'Batidora Da+Co 350W 12V Mk-3059', NULL, '5', 130, 15, 26, '156269-300-300.png'),
(348, 1, 3, 31, 5, 'Batidora De Pedestal Da+Co Dmc209', NULL, '2', 95, 0, 38, '156142-300-300.png'),
(349, 1, 3, 31, 5, 'Licuadora Damasco Exclusive 2.0L DM-305', 'Nuevo', '3', 105, 45, 92, '157532-300-300.png'),
(350, 1, 3, 31, 5, 'Licuadora Damasco Exclusive 2.0L DM-009TV', 'Nuevo', '5', 72, 20, 326, '157529-300-300.png'),
(351, 1, 3, 28, 5, 'Congelador Da+Co 100 Lts Dccsw10', NULL, '2', 287, 85, 341, '156009-300-300.png'),
(352, 1, 3, 30, 5, 'COCINA DA+CO 4 HORNILLAS FS204P007B', NULL, '2', 309, 69, 47, '157038-300-300.png'),
(353, 1, 3, 28, 5, 'Nevera Ejecutiva Da+Co Dcra12 124 Lts', NULL, '4', 266, 0, 184, '156080-300-300.png'),
(354, 1, 3, 28, 5, 'Nevera Da+Co Dcrs46Ws', NULL, '2', 1, 85, 100, '155766-300-300.png'),
(355, 1, 3, 31, 33, 'Licuadora Black+Decker Celeste BL0877-1ADLA', 'Nuevo', '2', 51, 30, 258, '157525-300-300.png'),
(356, 1, 3, 33, 5, 'Campana Da+Co Compacta Rhf60 60Cm', NULL, '2', 59, 85, 310, '155608-300-300.png'),
(357, 1, 3, 31, 5, 'Batidora Da+Co 600W 8V Mk-3051', NULL, '3', 168, 15, 94, '156271-300-300.png'),
(358, 1, 3, 28, 5, 'Nevera Damasco C/Dispensador 416L DCRT42WXW', NULL, '2', 860, 69, 182, '157309-300-300.png'),
(359, 1, 3, 31, 33, 'Licuadora Black+Decker  12V BL1120SGM', 'Nuevo', '2', 78, 85, 276, '157526-300-300.png'),
(360, 1, 3, 28, 5, 'CONGELADOR HOR. 150L BESTANDING BD-142', NULL, '5', 274, 55, 155, '157184-300-300.png'),
(361, 1, 3, 30, 5, 'Tope A Gas Da+Co 5 Hornillas GHG075 75CM', NULL, '5', 199, 49, 256, '157320-300-300.png'),
(362, 1, 3, 31, 17, 'Licuadora Con Procesador Royal Rl315', NULL, '5', 36, 10, 136, '156495-300-300.png'),
(363, 1, 3, 32, 5, 'MICROONDAS DA+CO MO-70T20L 20L NEGRO', NULL, '3', 84, 55, 224, '157167-300-300.png'),
(364, 1, 3, 32, 29, 'Microondas Midea 30L 0.7  EM720C2MOW', 'Nuevo', '3', 95, 0, 28, '157518-300-300.png'),
(365, 1, 3, 27, 5, 'Lavadora Auto Da+Co 11Kg Gris Tl-11Kggs', NULL, '3', 438, 90, 113, '156035-300-300.png'),
(366, 1, 3, 28, 31, 'Nevera Galanz Glr16Fwee16', NULL, '2', 1, 10, 129, '156490-300-300.png'),
(367, 1, 3, 32, 29, 'Microondas Midea 30L 1.0 ES9P032NA', 'Nuevo', '5', 184, 30, 288, '157516-300-300.png'),
(368, 1, 3, 29, 5, 'AIRE DE VENTANA DA+CO 18K BTU 220V CYW-18AC', NULL, '5', 598, 50, 39, '157273-300-300.png'),
(369, 1, 3, 28, 5, 'NEVERA DAMASCO C/DISPENSADOR 310L DCRB31WXW', NULL, '4', 908, 20, 304, '157166-300-300.png'),
(370, 1, 3, 31, 18, 'Licuadora Oster Blstkapwrd', NULL, '5', 59, 85, 61, '156179-300-300.png'),
(371, 1, 3, 31, 5, 'Batidora Damasco Cx-6670Dmc', NULL, '5', 35, 15, 34, '156277-300-300.png'),
(372, 1, 3, 30, 5, 'Tope Da+Co A Gas Ghg090 90Cm 5Hornillas', NULL, '2', 221, 35, 300, '156147-300-300.png'),
(373, 1, 3, 30, 5, 'Tope Da+Co A Gas Ghs087 60Cm 4 Hornillas', NULL, '4', 128, 25, 54, '156150-300-300.png'),
(374, 1, 3, 28, 5, 'Congelador Vertical Da+Co 150Lts Dcfv16', NULL, '3', 437, 0, 342, '155644-300-300.png'),
(375, 1, 3, 28, 5, 'Nevera Sbs Da+Co 439L Ff2-55D/ Dcsbs469', NULL, '2', 1, 75, 207, '156457-300-300.png'),
(376, 1, 3, 27, 5, 'Lavadora Semiautomática Da+Co 22Kg', NULL, '5', 509, 20, 319, '155720-300-300.png'),
(377, 1, 3, 32, 32, 'Microondas LG Slim 0.7L  MS2032GAS', 'Nuevo', '4', 179, 55, 295, '157498-300-300.png'),
(378, 1, 3, 27, 5, 'Lavaseca Da+Co 15Kg Fl-15Kgds', NULL, '2', 733, 40, 164, '155729-300-300.png'),
(379, 1, 3, 28, 5, 'Congelador Horizontal Da+Co DCFA70', NULL, '2', 1, 55, 248, '157333-300-300.png'),
(380, 1, 3, 31, 5, 'Freidora/Aire Da+Co 5L Af5507', NULL, '3', 58, 90, 68, '156282-300-300.png'),
(381, 1, 3, 30, 5, 'Horno Electrico Da+Co Bigd70M30D0', NULL, '3', 617, 50, 239, '156252-300-300.png'),
(382, 1, 3, 29, 5, 'Aire Split Da+Co 12K Btu Daco12Cs Silver Ctg', NULL, '4', 308, 75, 308, '155585-300-300.png'),
(383, 1, 3, 33, 5, 'Campana Da+Co Rhg60 60cm Negra', NULL, '3', 184, 30, 142, '157322-300-300.png'),
(384, 1, 3, 30, 28, 'Cocina Ind Ferrara Zfo Negra C24 S01', NULL, '3', 519, 65, 99, '156453-300-300.png'),
(385, 1, 3, 33, 5, 'Campana Da+Co Rhp60 60cm Acero Inox', NULL, '5', 183, 35, 49, '157321-300-300.png'),
(386, 1, 3, 31, 34, 'Cafetera RCA 5 Tazas RCCM20', NULL, '4', 25, 65, 260, '157495-300-300.png'),
(387, 1, 3, 28, 5, 'Congelador Da+Co Dcfa30 300 Lts Blanco', NULL, '2', 458, 85, 141, '156408-300-300.png'),
(388, 1, 3, 30, 5, 'Horno Electrico Da+Co Big37Nm30T0', NULL, '5', 532, 0, 235, '155674-300-300.png'),
(389, 1, 3, 30, 5, 'Horno Freidora Negro 12L Af1201', NULL, '5', 106, 40, 71, '156168-300-300.png'),
(390, 1, 3, 31, 5, 'Freidora/Aire Da+Co 7L Digital Af7503-Di', NULL, '4', 85, 50, 291, '155977-300-300.png'),
(391, 1, 3, 27, 5, 'Lavadora Carga Frontal Da+Co 11Kg Fl-11Kg', NULL, '4', 578, 55, 229, '156432-300-300.png'),
(392, 1, 3, 28, 5, 'CONGELADOR DA+CO 290L DCCG290', 'Nuevo', '2', 458, 85, 255, '157258-300-300.png'),
(393, 1, 3, 28, 5, 'Nevera Da+Co Gris 493Lts Dcrs48Wss', NULL, '5', 1, 59, 237, '155775-300-300.png'),
(394, 1, 3, 29, 5, 'Aire Split Da+Co Negro 18Kd6 18000 Btu', NULL, '5', 648, 85, 71, '156506-300-300.png'),
(395, 1, 3, 28, 5, 'Nevera Sbs Da+Co 595L Ff2-80 / Dcsbs631', NULL, '5', 1, 0, 284, '156460-300-300.png'),
(396, 1, 3, 27, 5, 'Lavadora Auto Da+Co 22Kg Gris Tl-22Kggs', NULL, '3', 682, 11, 195, '156039-300-300.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int NOT NULL,
  `idcategoria` int NOT NULL,
  `idestatus` int NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `idcategoria`, `idestatus`, `nombre`) VALUES
(1, 1, 1, 'Teléfonos y Smartphones'),
(2, 1, 1, 'Audífonos'),
(3, 1, 1, 'Cámaras de Seguridad'),
(4, 1, 1, 'Cargadores y Cables'),
(5, 1, 1, 'Impresoras'),
(6, 1, 1, 'Parlantes y Cornetas'),
(7, 1, 1, 'Laptops'),
(8, 1, 1, 'Mini PC'),
(9, 1, 1, 'Tablets'),
(10, 1, 1, 'Monitores'),
(11, 1, 1, 'Redes (Routers/Repetidores)'),
(12, 1, 1, 'Periféricos (Mouse y Hubs)'),
(13, 1, 1, 'Gaming (Sillas y Accesorios)'),
(14, 1, 1, 'Smartwatches/Wearables'),
(15, 1, 1, 'Teclados'),
(16, 1, 1, 'Televisores'),
(17, 3, 1, 'Planchado, Limpieza y Utensilios Eléctricos'),
(18, 2, 1, 'Ventiladores'),
(20, 3, 1, 'Protección Eléctrica'),
(22, 2, 1, 'Cuidado Personal y Estética'),
(23, 2, 1, 'Mobiliario y Dormitorio'),
(24, 2, 1, 'Menaje y Utensilios de Cocina'),
(25, 2, 1, 'Textiles (Toallas, Cobijas)'),
(26, 2, 1, 'Soportes y Bases (TV)'),
(27, 3, 1, 'Línea de Lavado (Lavadoras/Secadoras)'),
(28, 3, 1, 'Refrigeración y Congelación'),
(29, 3, 1, 'Aires Acondicionados'),
(30, 3, 1, 'Cocción y Hornos (Topes, Cocinas)'),
(31, 3, 1, 'Electrodomésticos de Cocina'),
(32, 3, 1, 'Microondas'),
(33, 3, 1, 'Campanas Extractoras');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `telefono`, `created_at`) VALUES
(1, 'Ana Pérez', 'ana@example.com', '555-1111', '2025-11-26 18:14:52'),
(2, 'Luis Gómez', 'luis@example.com', '555-2222', '2025-11-26 18:14:52'),
(3, 'Carla Díaz', 'carla@example.com', '555-3333', '2025-11-26 18:14:52'),
(4, 'Miguel Rojas', 'miguel@example.com', '555-4444', '2025-11-26 18:14:52'),
(5, 'Sofía Martínez', 'sofia@example.com', '555-5555', '2025-11-26 18:14:52');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `dolar`
--
ALTER TABLE `dolar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatus`
--
ALTER TABLE `estatus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `items_carrito`
--
ALTER TABLE `items_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `items_pedido`
--
ALTER TABLE `items_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carritos`
--
ALTER TABLE `carritos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `dolar`
--
ALTER TABLE `dolar`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estatus`
--
ALTER TABLE `estatus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `items_carrito`
--
ALTER TABLE `items_carrito`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `items_pedido`
--
ALTER TABLE `items_pedido`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carritos`
--
ALTER TABLE `carritos`
  ADD CONSTRAINT `carritos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `items_carrito`
--
ALTER TABLE `items_carrito`
  ADD CONSTRAINT `items_carrito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_carrito_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `items_pedido`
--
ALTER TABLE `items_pedido`
  ADD CONSTRAINT `items_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_pedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
