INSERT INTO `usuarios` (`id`, `nombre_usuario`, `correo_electronico`, `clave`, `rol`, `avatar`, `creado_en`, `actualizado_en`, `eliminado_en`) VALUES
('1', 'admin', 'admin@email.com', '$2y$10$kLcnl1k3B5xBHyAXMZ6os.bfDagvKCjuZ5P86h8gm1N7ioWzORUGq', 'admin', NULL, '2019-12-20 14:07:09', '2021-02-23 11:04:57', NULL),
('2', 'user1', 'username@email.com', '$2y$10$HPjneawrKwYQAnKvxqeZRehXC6M9h1YF4zZM8KFaUDUn6Kx9Wm9dq', 'user', 'ca41ec102526518940c5b179bed6526a.png', '2020-03-21 10:57:46', '2020-07-20 15:06:31', NULL);

INSERT INTO `configuracion` (`id`, `opcion`, `valor`, `creado_en`, `actualizado_en`, `eliminado_en`) VALUES
('1', 'logo_empresa', '', '2020-07-20 15:57:10', '2020-09-23 16:39:42', NULL),
('2', 'nombre_empresa', 'Umbrella Corporation', '2020-07-20 16:02:32', '2020-09-23 16:39:42', NULL),
('3', 'razon_social', 'Oswell E. SpencerJames Marcus', '2020-07-20 15:59:58', '2020-09-23 16:39:42', NULL),
('4', 'domicilio_fiscal', 'Umbrella Corporation 545 S Birdneck RD STE 202B Virginia Beach, VA 23451.\r\nTEL. 757-227-4610', '2020-07-20 15:59:59', '2020-09-23 16:39:42', NULL),
('6', 'mail_is_enabled', '0', '2020-07-20 16:05:39', '2020-09-23 16:39:42', NULL),
('7', 'mail_host', '', '2020-07-20 16:05:39', NULL, NULL),
('8', 'mail_username', '', '2020-07-20 16:05:39', NULL, NULL),
('9', 'mail_password', '', '2020-07-20 16:05:39', NULL, NULL),
('10', 'mail_port', '', '2020-07-20 16:05:40', NULL, NULL),
('11', 'mail_smtp_secure', '', '2020-07-20 16:05:40', NULL, NULL),
('12', 'mail_from', '', '2020-07-20 16:06:57', NULL, NULL),
('13', 'mail_from_name', '', '2020-07-20 16:05:40', NULL, NULL);
