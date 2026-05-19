-- 1. Crear y usar la base de datos
CREATE DATABASE IF NOT EXISTS tienda_perritos
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE tienda_perritos;

-- 2. Crear tabla de Despachos (si no la ha creado Spring Boot)
CREATE TABLE IF NOT EXISTS despacho (
    id_despacho BIGINT NOT NULL AUTO_INCREMENT,
    fecha_despacho DATE,
    patente_camion VARCHAR(255),
    intento INT NOT NULL,
    id_compra BIGINT,
    direccion_compra VARCHAR(255),
    valor_compra BIGINT,
    despachado BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_despacho)
);

-- 3. Crear tabla de Ventas (si no la ha creado Spring Boot)
CREATE TABLE IF NOT EXISTS venta (
    id_venta BIGINT NOT NULL AUTO_INCREMENT,
    direccion_compra VARCHAR(255),
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_venta)
);

-- 4. Insertar datos de prueba reales
INSERT INTO despacho (fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado) 
VALUES ('2026-05-19', 'AA-BB-12', 1, 101, 'Av. Siempre Viva 742', 25000, false);

INSERT INTO venta (direccion_compra, valor_compra, fecha_compra, despacho_generado) 
VALUES ('Av. Siempre Viva 742', 25000, '2026-05-18', true);