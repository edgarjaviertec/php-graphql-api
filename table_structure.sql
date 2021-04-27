DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `opcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creado_en` timestamp NULL DEFAULT NULL,
  `actualizado_en` timestamp NULL DEFAULT NULL,
  `eliminado_en` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo_electronico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clave` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT NULL,
  `actualizado_en` timestamp NULL DEFAULT NULL,
  `eliminado_en` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_usuario_UNIQUE` (`nombre_usuario`),
  UNIQUE KEY `correo_electronico_UNIQUE` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `rfc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_razon_social` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `correo_electronico` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `telefono_celular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domicilio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_postal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creado_en` timestamp NULL DEFAULT NULL,
  `actualizado_en` timestamp NULL DEFAULT NULL,
  `eliminado_en` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio_unitario` decimal(15,2) NOT NULL,
  `creado_en` timestamp NULL DEFAULT NULL,
  `actualizado_en` timestamp NULL DEFAULT NULL,
  `eliminado_en` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_pedido` date NOT NULL,
  `validez_en_dias` int NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `tipo_descuento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descuento` decimal(15,2) DEFAULT NULL,
  `cantidad_descontada` decimal(15,2) DEFAULT NULL,
  `incluir_impuesto` tinyint(1) NOT NULL,
  `impuesto` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `saldo` decimal(15,2) NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  `creado_en` timestamp NULL DEFAULT NULL,
  `actualizado_en` timestamp NULL DEFAULT NULL,
  `eliminado_en` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_pedidos_clientes1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pedidos_productos`;
CREATE TABLE `pedidos_productos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(15,4) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `pedido_id` int unsigned NOT NULL,
  `producto_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_productos_producto_idx` (`producto_id`),
  KEY `fk_pedidos_productos_pedido_idx` (`pedido_id`),
  CONSTRAINT `fk_pedidos_has_productos_pedidos` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pedidos_has_productos_productos` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `presupuestos`;
CREATE TABLE `presupuestos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_presupuesto` date NOT NULL,
  `validez_en_dias` int NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `descuento` decimal(15,2) DEFAULT NULL,
  `tipo_descuento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad_descontada` decimal(15,2) DEFAULT NULL,
  `incluir_impuesto` tinyint(1) NOT NULL,
  `impuesto` decimal(15,2) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  `creado_en` timestamp NULL DEFAULT NULL,
  `actualizado_en` timestamp NULL DEFAULT NULL,
  `eliminado_en` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_presupuestos_cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_presupuestos_clientes1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `presupuestos_productos`;
CREATE TABLE `presupuestos_productos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(15,4) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `presupuesto_id` int unsigned NOT NULL,
  `producto_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_presupuestos_productos_producto_idx` (`producto_id`),
  KEY `fk_presupuestos_productos_presupuesto_idx` (`presupuesto_id`),
  CONSTRAINT `fk_presupuestos_has_productos_presupuestos1` FOREIGN KEY (`presupuesto_id`) REFERENCES `presupuestos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_presupuestos_has_productos_productos1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=363 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pagos`;
CREATE TABLE `pagos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fecha_pago` date NOT NULL,
  `tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `notas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `pedido_id` int unsigned NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pagos_pedido_idx` (`pedido_id`),
  KEY `fk_pagos_cliente_idx` (`cliente_id`),
  CONSTRAINT `fk_pagos_clientes1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_pagos_pedidos1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;