/*==========================================================
    MÓDULO 3 - PRÁCTICA 1
    Diseño de tablas
    Autor: Agustín Burkhard
==========================================================*/

/*==========================================================
    DDL
==========================================================*/

DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;

/*==========================================================
    CREATE TABLE
==========================================================*/

CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY, -- INT porque el identificador es un número entero.
    nombre VARCHAR(100),  -- VARCHAR(100) porque el nombre tiene longitud variable.
    perfil_bio VARCHAR(MAX), -- VARCHAR(MAX) porque la biografía puede ser extensa.
    fecha_registro DATE -- DATE porque solo se necesita almacenar la fecha.
);

CREATE TABLE productos(
    id_producto INT PRIMARY KEY, -- INT porque el identificador es un número entero.
    descripcion VARCHAR(255), -- VARCHAR(255) porque la descripción puede tener bastante texto.
    precio DECIMAL(10,2), -- DECIMAL(10,2) para almacenar valores monetarios con precisión.
    esta_activo TINYINT -- TINYINT para representar si el producto está activo (1) o inactivo (0).
);
