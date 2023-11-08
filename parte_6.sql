-- Calcular el promedio de los productos de cada categoria
SELECT c.nombre AS categoria, AVG(p.precio_unitario) AS precio_promedio
FROM Categoria c
LEFT JOIN Producto p ON c.id = p.categoria_id
GROUP BY c.nombre;

-- Obtener la cantidad total de productos en stock por categoria
SELECT c.nombre AS categoria, SUM(s.cantidad) AS cantidad_total
FROM Categoria c
LEFT JOIN Producto p ON c.id = p.categoria_id
LEFT JOIN Stock s ON p.id = s.producto_id
GROUP BY c.nombre;

-- Calcular el total de ventas por sucursal
SELECT s.nombre AS sucursal, SUM(o.total) AS total_ventas
FROM Sucursal s
LEFT JOIN Orden o ON s.id = o.sucursal_id
GROUP BY s.nombre;

-- Obtener el cliente que ha realizado el mayor monto de compras
SELECT c.nombre AS cliente, SUM(o.total) AS monto_total_compras
FROM Cliente c
LEFT JOIN Orden o ON c.id = o.cliente_id
GROUP BY c.nombre
ORDER BY monto_total_compras DESC
LIMIT 1;