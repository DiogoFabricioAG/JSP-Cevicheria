-- Insercion de datos

-- Inserciones en la tabla usuarios
INSERT INTO usuarios (usuarios_nombre_usuario, usuarios_correo, usuarios_contrasena_hash) 
VALUES 
('usuario1', 'usuario1@correo.com', 'hash_contrasena_1'),
('usuario2', 'usuario2@correo.com', 'hash_contrasena_2'),
('usuario3', 'usuario3@correo.com', 'hash_contrasena_3');

-- Inserciones en la tabla mesas
INSERT INTO mesas (mesas_numero, mesas_capacidad) 
VALUES 
(1, 4),
(2, 2),
(3, 6),
(4, 8);



-- Inserciones en la tabla reservas
INSERT INTO reservas (reservas_usuario_id, reservas_fecha_reserva, reservas_numero_personas, reservas_peticiones_especiales, reservas_hora_reserva, reservas_mesa_id) 
VALUES 
(1, '2024-12-01 13:00:00', 4, 'Sin gluten', '2024-12-01 13:00:00', 1),
(2, '2024-12-01 15:00:00', 2, 'Mesa cerca de ventana', '2024-12-01 15:00:00', 2),
(3, '2024-12-01 19:00:00', 6, NULL, '2024-12-01 19:00:00', 3);

-- Inserciones en la tabla sesiones
INSERT INTO sesiones (sesiones_usuario_id, sesiones_token, sesiones_fecha_expiracion) 
VALUES 
(1, 'token_unico_1', '2024-12-02 12:00:00'),
(2, 'token_unico_2', '2024-12-02 12:00:00'),
(3, 'token_unico_3', '2024-12-02 12:00:00');

