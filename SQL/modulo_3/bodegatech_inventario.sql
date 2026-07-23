/*==========================================================
    BodegaTech - Script de Inventario
    Autor: Agustín Burkhard
    Fecha: 22/07/2026
==========================================================*/

/*==========================================================
    SECCIÓN DDL
==========================================================*/

DROP TABLE IF EXISTS inventario;


/*==========================================================
    CREATE TABLE
==========================================================*/


CREATE TABLE inventario(
    id_producto INT PRIMARY KEY, -- INT porque el identificador es un número entero único.

    nombre_producto VARCHAR(100), -- VARCHAR(100) porque el nombre puede tener longitud variable.

    categoria VARCHAR(50), -- VARCHAR(50) porque almacena texto corto.

    precio_unitario DECIMAL(10,2), -- DECIMAL(10,2) para almacenar valores monetarios con precisión.

    stock_actual INT, -- INT porque representa una cantidad de unidades.

    stock_minimo INT, -- INT porque representa una cantidad mínima de unidades.

    fecha_ingreso DATE, -- DATE porque solo se necesita almacenar la fecha.

    activo TINYINT -- TINYINT para representar 1 (activo) o 0 (inactivo).
);

/*==========================================================
    INSERT INTO
==========================================================*/

INSERT INTO inventario 
VALUES (1, 'Laptop Pro 15', 'Computación', 1200.00, 15, 3, '2024-01-10', 1);

INSERT INTO inventario
VALUES (2,	'Mouse Inalámbrico',	'Accesorios',	28.00,	80,	10,	'2024-01-10',	1);

INSERT INTO inventario
VALUES (3,	'Monitor 4K 27"',	'Computación',	450.00,	12,	2,	'2024-01-15',	1);

INSERT INTO inventario
VALUES (4,	'Teclado Mecánico',	'Accesorios',	95.00,	40,	5,	'2024-01-15',	1);

INSERT INTO inventario
VALUES (5,	'Laptop Basic 14',	'Computación',	650.00,	20,	3,	'2024-02-01',	1);

INSERT INTO inventario
VALUES (6,	'Auriculares BT Pro',	'Audio',	120.00,	35,	5,	'2024-02-01',	1);

INSERT INTO inventario
VALUES (7,	'Hub USB-C 7 puertos',	'Accesorios',	45.00,	60,	10,	'2024-02-10',	1);

INSERT INTO inventario
VALUES (8,	'Webcam HD 1080p',	'Accesorios',	85.00,	25,	5,	'2024-02-10',	1);

INSERT INTO inventario
VALUES (9,	'SSD Externo 1TB',	'Almacenamiento',	130.00,	18,	3,	'2024-03-01',	1);

INSERT INTO inventario
VALUES (10,	'Parlante Bluetooth',	'Audio',	60.00,	45,	8,	'2024-03-01',	1);



/*==========================================================
    UPDATE
==========================================================*/

UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

UPDATE inventario
SET activo = 0 
WHERE id_producto = 8;

/*==========================================================
    SELECT
==========================================================*/

SELECT * FROM inventario;
