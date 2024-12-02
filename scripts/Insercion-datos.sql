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

INSERT INTO productos (producto_nombre, producto_precio, producto_imagen, producto_categoria)
VALUES
('Ceviche Afrodisiaco', 62.00, 'url_imagen_ceviche_afrodisiaco.jpeg', 'Ceviches'),
('Trio de Ceviche', 72.00, 'url_imagen_trio_ceviche.jpeg', 'Ceviches'),
('Ceviche clasico mixto', 62.00, 'url_imagen_ceviche_clasico.jpeg', 'Ceviches'),
('Ceviche de conchas negras', 62.00, 'url_imagen_ceviche_conchas.jpeg', 'Ceviches'),
('Piqueo frio con causa', 69.00, 'url_imagen_piqueo_frio.jpeg', 'Ceviches'),
('Ceviche lenguado', 69.00, 'url_imagen_ceviche_lenguado.jpeg', 'Ceviches'),
('Ceviche lenguado con pulpo y langostino', 71.00, 'url_imagen_lenguado_pulpo_langostino.jpeg', 'Ceviches'),
('Lenguado a la hawaiana', 69.00, 'url_imagen_lenguado_hawaiana.jpeg', 'Ceviches'),
('Lenguado en salsa de champiñones', 69.00, 'url_imagen_lenguado_champinones.jpeg', 'Ceviches'),
('Lenguado a la florentina', 69.00, 'url_imagen_lenguado_florentina.jpeg', 'Ceviches'),
('Lenguado a la oriental', 50.00, 'url_imagen_lenguado_oriental.jpeg', 'Ceviches'),
('Lenguado entero en crema al ajo o hojuela de ajos crocante', 80.00, 'url_imagen_lenguado_ajo.jpeg', 'Ceviches'),
('Leche de tigre', 25.00, 'url_imagen_leche_tigre.jpeg', 'Ceviches');


INSERT INTO productos (producto_nombre, producto_precio, producto_imagen, producto_categoria)
VALUES
('Chicha Morada', 5.00, 'url_imagen_chicha.jpg', 'Bebidas'),
('Limonada Frozen', 6.00, 'url_imagen_limonada_frozen.jpg', 'Bebidas'),
('Cerveza Artesanal', 15.00, 'url_imagen_cerveza.jpg', 'Bebidas'),
('Coca Cola Personal', 4.00, 'url_imagen_coca_cola.jpg', 'Bebidas'),
('Agua Mineral', 3.00, 'url_imagen_agua_mineral.jpg', 'Bebidas');

