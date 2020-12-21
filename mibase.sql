CREATE DATABASE evaluacion4;
---CREANDO TABLA suscripcion
CREATE TABLE suscripcion (
suscripcion_id BIGSERIAL,
nombre VARCHAR(50),
precio NUMERIC,
duracion DATE,
PRIMARY KEY (suscripcion_id)
);
-- CREANDO LA TABLA cliente
CREATE TABLE cliente ( 
cliente_id BIGSERIAL,
nombre VARCHAR(50),
apellido VARCHAR(50),
telefono VARCHAR(15),
email VARCHAR(50),
dia_de_pago DATE,
suscripcion_id BIGINT,
pase_id BIGINT,
PRIMARY KEY (cliente_id),
FOREIGN KEY (suscripcion_id) REFERENCES suscripcion (suscripcion_id)
);

-- CREANDO LA TABLA transaccion
CREATE TABLE transaccion (
transaccion_id BIGSERIAL,
fecha DATE,
cliente_id BIGINT,
PRIMARY KEY (transaccion_id),
FOREIGN KEY (cliente_id) REFERENCES cliente (cliente_id)
);

-- CREANDO LA TABLA pase
CREATE TABLE pase (
pase_id BIGSERIAL,
nombre VARCHAR(50),
precio NUMERIC,
fecha DATE,
PRIMARY KEY (pase_id)
);

-- CREANDO FOREIGN KEY ADICIONAL EN LA TABLA CLIENTE
ALTER TABLE cliente ADD CONSTRAINT ky_pase_id FOREIGN KEY (pase_id) REFERENCES pase (pase_id);

-- CREANDO LA TABLA transaccion_pase
CREATE TABLE transaccion_pase (
pase_id BIGINT,
transaccion_id BIGINT,
FOREIGN KEY (pase_id) REFERENCES pase(pase_id),
FOREIGN KEY (transaccion_id) REFERENCES transaccion (transaccion_id)
);

---CREANDO TABLA producto
CREATE TABLE producto (
producto_id BIGSERIAL,
nombre VARCHAR (50),
precio NUMERIC,
cantidad NUMERIC,
PRIMARY KEY (producto_id)
);


-- CREANDO TABLA transaccion_producto
CREATE TABLE transaccion_producto (
producto_id BIGINT,
transaccion_id BIGINT,
FOREIGN KEY (producto_id) REFERENCES producto (producto_id),
FOREIGN KEY (transaccion_id) REFERENCES transaccion (transaccion_id)
);



---CREANDO TABLA transaccion_suscripcion
CREATE TABLE transaccion_suscripcion (
suscripcion_id BIGINT,
transaccion_id BIGINT,
FOREIGN KEY (suscripcion_id) REFERENCES suscripcion (suscripcion_id),
FOREIGN KEY (transaccion_id) REFERENCES transaccion (transaccion_id)
);




/* PROBADO EN:
https://www.db-fiddle.com/
Equipo #2
MANUEL
JESUS MIGUEL
JEAN CARLOS
/*
