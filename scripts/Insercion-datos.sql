INSERT INTO usuarios (usuarios_nombre, usuarios_apellido, usuarios_correo, usuarios_contrasena_hash) 
VALUES 
('Juan', 'Perez', 'juan@gmail.com','$2a$10$7QJ1mMBz.FW7wlRxFqh6XuUxu/TVVfKf8F8QHhkVlshGFVgV94y8a'), -- Contraseña: 12345
('Maria', 'Lopez', 'maria@gmail.com','$2a$10$kTf8mgQn9HIxUvXckjFE6O9iEtGVwK0OrNrNDx5t5AYeP9DZ3QVQ2'), -- Contraseña: password
('Carlos', 'Gomez', 'carlos@gmail.com','$2a$10$3WkjomPfsTYp8J04xIWqMOsZtZMlE4x6Z/nHJe06dOqUPsM3xVszK'); -- Contraseña: admin

INSERT INTO tipo_mesa (tipo_mesa_texto) 
VALUES 
('Mesa Individual'),
('Mesa para 2'),
('Mesa para 4'),
('Mesa Familiar');

INSERT INTO mesas (mesas_codigo, tipo_mesa_id) 
VALUES 
('M101', 1),
('M102', 2),
('M201', 2),
('M301', 3),
('M302', 4);

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


INSERT INTO orden (usuario_id, orden_fecha_creacion) 
VALUES 
(1, '2024-12-01 10:00:00'),
(2, '2024-12-01 11:30:00');



INSERT INTO orden_productos (orden_id, producto_id, cantidad) 
VALUES 
(1, 1, 2),
(1, 5, 2), 
(2, 3, 1), 
(1, 2, 2), 
(2, 4, 1); 

INSERT INTO fecha_reservas (fecha_reservas_inicio, fecha_reservas_final)
VALUES
('11:00:00', '12:00:00'),
('12:00:00', '13:00:00'),
('15:00:00', '16:00:00'),
('17:00:00', '18:00:00'),
('18:00:00', '19:00:00');

INSERT INTO reservas (reservas_usuario_id, reservas_numero_personas, reservas_dia, reservas_peticiones_especiales, reservas_fecha_reserva_id, reservas_mesa_id, reservas_numero, orden_id)
VALUES
(1, 2, '2024-12-02', NULL, 1, 1, 923777800, 1),
(2, 4, '2024-12-02', 'Cumpleaños', 2, 2, 923777801, 2);





-- Este de aca copias

-- Insertar datos en la tabla usuarios
INSERT INTO usuarios (usuarios_nombre, usuarios_apellido, usuarios_correo, usuarios_contrasena_hash) 
VALUES 
('Juan', 'Perez', 'juan@gmail.com','$2a$10$7QJ1mMBz.FW7wlRxFqh6XuUxu/TVVfKf8F8QHhkVlshGFVgV94y8a'), -- Contraseña: 12345
('Maria', 'Lopez', 'maria@gmail.com','$2a$10$kTf8mgQn9HIxUvXckjFE6O9iEtGVwK0OrNrNDx5t5AYeP9DZ3QVQ2'), -- Contraseña: password
('Carlos', 'Gomez', 'carlos@gmail.com','$2a$10$3WkjomPfsTYp8J04xIWqMOsZtZMlE4x6Z/nHJe06dOqUPsM3xVszK'); -- Contraseña: admin

-- Insertar datos en la tabla tipo_mesa
INSERT INTO tipo_mesa (tipo_mesa_texto) 
VALUES 
('Mesa Individual'),
('Mesa para 2'),
('Mesa para 4'),
('Mesa Familiar');

-- Insertar datos en la tabla mesas
INSERT INTO mesas (mesas_codigo, tipo_mesa_id) 
VALUES 
('M101', 1),
('M102', 2),
('M201', 2),
('M301', 3),
('M302', 4);

-- Insertar productos en la tabla productos
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

-- Insertar productos de bebidas
INSERT INTO productos (producto_nombre, producto_precio, producto_imagen, producto_categoria)
VALUES
('Chicha Morada', 5.00, 'url_imagen_chicha.jpg', 'Bebidas'),
('Limonada Frozen', 6.00, 'url_imagen_limonada_frozen.jpg', 'Bebidas'),
('Cerveza Artesanal', 15.00, 'url_imagen_cerveza.jpg', 'Bebidas'),
('Coca Cola Personal', 4.00, 'url_imagen_coca_cola.jpg', 'Bebidas'),
('Agua Mineral', 3.00, 'url_imagen_agua_mineral.jpg', 'Bebidas');

-- Insertar datos en la tabla orden
INSERT INTO orden (usuario_id, orden_fecha_creacion) 
VALUES 
(1, '2024-12-01 10:00:00'),
(2, '2024-12-01 11:30:00');

-- Insertar productos en la tabla orden_productos
INSERT INTO orden_productos (orden_id, producto_id, cantidad) 
VALUES 
(1, 1, 2),
(1, 5, 2), 
(2, 3, 1), 
(1, 2, 2), 
(2, 4, 1);

-- Insertar datos en la tabla fecha_reservas
INSERT INTO fecha_reservas (fecha_reservas_inicio, fecha_reservas_final)
VALUES
('11:00:00', '12:00:00'),
('12:00:00', '13:00:00'),
('15:00:00', '16:00:00'),
('17:00:00', '18:00:00'),
('18:00:00', '19:00:00');

-- Insertar reservas
INSERT INTO reservas (reservas_usuario_id, reservas_numero_personas, reservas_dia, reservas_peticiones_especiales, reservas_fecha_reserva_id, reservas_mesa_id, reservas_numero, orden_id)
VALUES
(1, 2, '2024-12-02', NULL, 1, 1, 923777800, 1),
(2, 4, '2024-12-02', 'Cumpleaños', 2, 2, 923777801, 2);
