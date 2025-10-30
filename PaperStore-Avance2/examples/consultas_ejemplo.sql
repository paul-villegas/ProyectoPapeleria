-- consultas_ejemplo.sql
-- 1) Listar productos con su categoría e inventario
SELECT p.codigo, p.nombre, c.nombre AS categoria, i.stock_actual, i.ubicacion
FROM productos p
JOIN categorias c ON c.id = p.id_categoria
LEFT JOIN inventario i ON i.id_producto = p.id;

-- 2) Historial de compras por proveedor
SELECT co.id, co.fecha, prov.nombre AS proveedor, co.factura, co.total
FROM compras co
JOIN proveedores prov ON prov.id = co.id_proveedor
ORDER BY co.fecha DESC;

-- 3) Ventas por cliente y total
SELECT cl.nombre AS cliente, v.fecha, v.tipo_pago, v.total
FROM ventas v
LEFT JOIN clientes cl ON cl.id = v.id_cliente
ORDER BY v.fecha DESC;

-- 4) Productos con bajo stock (ej. menos de 5)
SELECT p.codigo, p.nombre, i.stock_actual
FROM productos p
JOIN inventario i ON i.id_producto = p.id
WHERE i.stock_actual < 5;

-- 5) Consulta de ventas con detalle
SELECT v.id AS venta_id, v.fecha, cl.nombre AS cliente, pd.nombre AS producto, vd.cantidad, vd.precio_unitario, vd.subtotal
FROM ventas v
JOIN venta_detalles vd ON vd.id_venta = v.id
JOIN productos pd ON pd.id = vd.id_producto
LEFT JOIN clientes cl ON cl.id = v.id_cliente
ORDER BY v.fecha DESC;
