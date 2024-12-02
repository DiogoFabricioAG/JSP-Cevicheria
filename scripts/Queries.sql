-- Querys
select * from reservas;

SELECT m.mesas_id, m.mesas_numero, m.mesas_capacidad
FROM mesas m
WHERE m.mesas_id NOT IN (
    SELECT r.reservas_mesa_id
    FROM reservas r
    WHERE r.reservas_fecha_reserva::date = '2024-12-01'
    AND r.reservas_hora_reserva BETWEEN '2024-12-01 15:31:00' AND '2024-12-01 15:37:00'
)
AND NOT EXISTS (
    SELECT 1
    FROM reservas r
    WHERE r.reservas_mesa_id = m.mesas_id
    AND r.reservas_hora_reserva + r.reservas_tiempo_maximo > '2024-12-01 15:31:00'
    AND r.reservas_hora_reserva < '2024-12-01 15:37:00'
);

Select * from productos;

INSERT INTO carrito (sesiones_usuario_id) 
VALUES (1)  -- Reemplazar con el ID de usuario activo

INSERT INTO carrito_productos (carrito_id, producto_id, cantidad)
VALUES (1, 1, 2),
(1,2,3);

select productos.producto_nombre, cantidad, productos.producto_precio as "Precio Unitario", cantidad * productos.producto_precio as "Monto a pagar" 
from carrito_productos
inner join productos ON productos.producto_id = carrito_productos.producto_id
where carrito_productos.carrito_id = 1
;

SELECT SUM(cantidad * productos.producto_precio) AS total
FROM carrito_productos
INNER JOIN productos ON productos.producto_id = carrito_productos.producto_id
WHERE carrito_productos.carrito_id = 1;
