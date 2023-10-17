-- Consulta para obtener el precio mínimo, precio máximo y precio promedio de todos los productos
SELECT
    MIN(precio_unitario) AS precio_minimo,
    MAX(precio_unitario) AS precio_maximo,
    ROUND(AVG(precio_unitario), 2) AS precio_promedio
FROM Producto;

-- Consulta para calcular la cantidad total de productos en stock por sucursal
SELECT
    s.nombre AS sucursal,
    SUM(st.cantidad) AS cantidad_total_productos
FROM Stock st
JOIN Sucursal s ON st.sucursal_id = s.id
GROUP BY s.nombre;

-- Consulta para obtener el total de ventas por cliente
SELECT
    c.nombre AS cliente,
    SUM(i.monto_venta) AS total_ventas
FROM Item i
JOIN Orden o ON i.orden_id = o.id
JOIN Cliente c ON o.cliente_id = c.id
GROUP BY c.nombre;