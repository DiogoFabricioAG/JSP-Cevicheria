-- Creación de la Base de datos:

-- Tabla de Usuarios
CREATE TABLE usuarios (
  usuarios_id SERIAL PRIMARY KEY,
  usuarios_nombre_usuario TEXT NOT NULL UNIQUE,
  usuarios_correo TEXT NOT NULL UNIQUE,
  usuarios_contrasena_hash TEXT NOT NULL,
  usuarios_fecha_creacion TIMESTAMP DEFAULT NOW()
);

-- Tabla de Mesas
CREATE TABLE mesas (
  mesas_id SERIAL PRIMARY KEY,
  mesas_numero INT NOT NULL UNIQUE,
  mesas_capacidad INT NOT NULL
);

-- Tabla de Reservas con un campo de tiempo máximo para las reservas
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

-- Tabla de Sesiones
CREATE TABLE sesiones (
  sesiones_id SERIAL PRIMARY KEY,
  sesiones_usuario_id INT REFERENCES usuarios (usuarios_id) ON DELETE CASCADE,
  sesiones_token TEXT NOT NULL UNIQUE,
  sesiones_fecha_creacion TIMESTAMP DEFAULT NOW(),
  sesiones_fecha_expiracion TIMESTAMP NOT NULL
);

