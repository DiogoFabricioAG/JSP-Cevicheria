-- Creación de la Base de datos:

-- Eliminar tablas si existen
DROP TABLE IF EXISTS usuarios CASCADE;
CREATE TABLE usuarios (
  usuarios_id SERIAL PRIMARY KEY,
  usuarios_nombre TEXT NOT NULL UNIQUE,
  usuarios_apellido TEXT NOT NULL UNIQUE,
  usuarios_correo TEXT NOT NULL UNIQUE,
  usuarios_contrasena_hash TEXT NOT NULL,
  usuarios_fecha_creacion TIMESTAMP DEFAULT NOW()
);

-- Eliminar y crear tabla de Mesas
DROP TABLE IF EXISTS mesas CASCADE;
CREATE TABLE mesas (
  mesas_id SERIAL PRIMARY KEY,
  mesas_numero INT NOT NULL UNIQUE,
  mesas_capacidad INT NOT NULL
);

-- Eliminar y crear tabla de Reservas
DROP TABLE IF EXISTS reservas CASCADE;
CREATE TABLE reservas (
  reservas_id SERIAL PRIMARY KEY,
  reservas_usuario_id INT REFERENCES usuarios (usuarios_id) ON DELETE CASCADE,
  reservas_fecha_reserva TIMESTAMP NOT NULL,
  reservas_numero_personas INT NOT NULL,
  reservas_peticiones_especiales TEXT,
  reservas_fecha_creacion TIMESTAMP DEFAULT NOW(),
  reservas_hora_reserva TIMESTAMP NOT NULL,
  reservas_mesa_id INT REFERENCES mesas (mesas_id) ON DELETE CASCADE,
  reservas_tiempo_maximo INTERVAL DEFAULT '2 hours'
);

-- Eliminar y crear tabla de Sesiones
DROP TABLE IF EXISTS sesiones CASCADE;
CREATE TABLE sesiones (
  sesiones_id SERIAL PRIMARY KEY,
  sesiones_usuario_id INT REFERENCES usuarios (usuarios_id) ON DELETE CASCADE,
  sesiones_token TEXT NOT NULL UNIQUE,
  sesiones_fecha_creacion TIMESTAMP DEFAULT NOW(),
  sesiones_fecha_expiracion TIMESTAMP NOT NULL
);

-- Eliminar y crear tabla carrito
DROP TABLE IF EXISTS carrito CASCADE;
CREATE TABLE carrito (
    carrito_id SERIAL PRIMARY KEY,
    sesiones_usuario_id INT REFERENCES usuarios (usuarios_id) ON DELETE CASCADE,
    fecha_creacion TIMESTAMP DEFAULT NOW()
);

-- Eliminar y crear tabla de productos
DROP TABLE IF EXISTS productos CASCADE;
CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    producto_nombre VARCHAR(100) NOT NULL,
    producto_precio DECIMAL(10, 2) NOT NULL,
    producto_imagen TEXT,
    producto_categoria VARCHAR(50) NOT NULL
);

-- Eliminar y crear tabla carrito_productos
DROP TABLE IF EXISTS carrito_productos CASCADE;
CREATE TABLE carrito_productos (
    carrito_producto_id SERIAL PRIMARY KEY,
    carrito_id INT REFERENCES carrito (carrito_id) ON DELETE CASCADE,
    producto_id INT REFERENCES productos (producto_id) ON DELETE CASCADE,
    cantidad INT NOT NULL DEFAULT 1
);





