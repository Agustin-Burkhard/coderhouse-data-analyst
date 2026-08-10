-- =========================================================
-- RetailPro — Módulo 5: Consultas con JOINs
-- Autor: Agustín Burkhard
-- Fecha: 06/08/2026
-- =========================================================

USE Ventas_Tech_DB;
GO

/*==========================================================
    CONSULTA 1 - VISTA BASE DEL PROYECTO
    Combina ventas, clientes, productos, categorías
    y territorios mediante INNER JOIN.
==========================================================*/

SELECT
    v.fecha_venta AS fecha,
    v.cantidad AS cantidad,
    v.precio_unitario AS precio_unit,
    v.cantidad * v.precio_unitario AS total_venta,
    v.canal,
    p.nombre_producto AS nombre_producto,
    cat.nombre_categoria AS categoria,
    t.region AS region,
    c.nombre AS nombre_cliente,
    c.segmento AS segmento
FROM ventas v

INNER JOIN clientes c
   ON v.id_cliente = c.id_cliente

INNER JOIN territorio t
   ON c.id_territorio = t.id_territorio
INNER JOIN productos p
   ON v.id_producto = p.id_producto
INNER JOIN categorias cat
   ON p.id_categoria = cat.id_categoria


/*==========================================================
    CONSULTA 2 - CLIENTES SIN VENTAS
    Identifica clientes registrados que no poseen
    ventas asociadas mediante LEFT JOIN.
==========================================================*/


SELECT
     c.nombre AS nombre_cliente,
     c.email AS email,
     c.fecha_registro AS fecha_de_registro
FROM clientes c

LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente

WHERE v.id_venta IS NULL;


/*==========================================================
    CONSULTA 3 - PRODUCTOS SIN VENTAS
    Identifica productos del catálogo que no poseen
    ventas registradas mediante LEFT JOIN.
==========================================================*/


SELECT
     p.nombre_producto AS nombre_producto,
     cat.nombre_categoria AS categoria,
     p.precio AS precio_U$D
FROM productos p

LEFT JOIN ventas v
    ON p.id_producto = v.id_producto

LEFT JOIN categorias cat
    ON p.id_categoria = cat.id_categoria

WHERE v.id_venta IS NULL;


/*==========================================================
    CONSULTA 4 - CONSOLIDADO POR CANAL
    Combina ventas Online y Presencial con UNION ALL
    y calcula el total vendido por cada canal.
==========================================================*/


SELECT
    canal,
    SUM(total_venta) AS total_por_canal
FROM
    (SELECT 
        id_venta,
        cantidad,
        precio_unitario,
        canal,
        cantidad * precio_unitario AS total_venta
    FROM ventas
    WHERE canal = 'Online'

    UNION ALL

    SELECT
        id_venta,
        cantidad,
        precio_unitario,
        canal,
        cantidad * precio_unitario AS total_venta
    FROM ventas
    WHERE canal = 'Presencial') AS ventas_consolidadas

GROUP BY canal;
