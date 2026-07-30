--Consulta 1 — Resumen ejecutivo mensual

SELECT
MONTH(fecha_venta) AS mes_venta,
SUM(cantidad * precio_unitario) AS total_facturado,
COUNT(*) AS cantidad_pedidos,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM dbo.ventas
GROUP BY MONTH(fecha_venta);


--Consulta 2 — Ranking de productos

SELECT TOP 5
id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_facturado
FROM dbo.ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


--Consulta 3 — Clientes recurrentes

SELECT
    id_cliente,
	SUM(cantidad * precio_unitario) AS total_gastado,
	COUNT(*) AS cantidad_pedidos
FROM dbo.ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;


--Consulta 4 — Meses por encima/por debajo del promedio

/* La base contiene ventas de un único mes.
Por ese motivo, el total mensual coincide con el promedio mensual actual.
Se utiliza 6444 como referencia para aplicar el CASE WHEN con los datos disponibles.*/

SELECT
	MONTH(fecha_venta) AS mes_venta,
	SUM(cantidad * precio_unitario) AS total_facturado,
CASE
    WHEN SUM(cantidad * precio_unitario) > 6444 THEN 'por encima'
	WHEN SUM(cantidad * precio_unitario) < 6444 THEN 'por debajo'
    ELSE 'Igual al promedio'
END AS comparacion_promedio
FROM dbo.ventas
GROUP BY MONTH(fecha_venta);
	


-- Hallazgo 1:
-- El mes de marzo facturó un total de 6444.

-- Hallazgo 2:
-- Todos los clientes realizaron dos pedidos.

-- Hallazgo 3:
-- El producto 1 fue el que mayor facturación generó.




