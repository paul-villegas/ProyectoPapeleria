-- 02_inserts_catalog.sql
USE paperstore;

-- Categorías
INSERT INTO categorias (nombre, descripcion) VALUES
('Papelería','Hojas, cuadernos, libretas, bloques'),
('Oficina','Artículos de oficina: clips, engrapadoras, marcadores'),
('Arte','Pinturas, pinceles, lienzos');

-- Productos
INSERT INTO productos (codigo,nombre,precio_unitario,id_categoria,unidad_medida) VALUES
('PAP-HOJA-A4','Hoja carta A4 80g (paquete 100)',45.00,1,'paquete'),
('PAP-CUAD-100','Cuaderno cuadro 100 hojas',70.00,1,'pieza'),
('OFI-CLIP-100','Clips 100 piezas',20.00,2,'paquete'),
('ART-PINC-01','Set pinceles 5 pzas',120.00,3,'set');

-- Proveedores
INSERT INTO proveedores (nombre,telefono,correo,direccion) VALUES
('Distribuidora Papelera SA','3312345678','ventas@dispapel.com','Av. Principal 123'),
('Suministros Oficina MX','3311122233','contacto@suministrosmx.com','Calle Secundaria 45');

-- Compras (entrada de stock)
INSERT INTO compras (fecha,id_proveedor,factura,total) VALUES
('2025-10-01',1,'F001',450.00),
('2025-10-05',2,'F002',240.00);

INSERT INTO compra_detalles (id_compra,id_producto,cantidad,precio_unitario,subtotal) VALUES
(1,1,10,40.00,400.00),
(1,3,5,10.00,50.00),
(2,4,2,120.00,240.00);

-- Clientes
INSERT INTO clientes (nombre,telefono,correo) VALUES
('Cliente A','3319988777','clientea@mail.com'),
('Cliente B','3315566778','clienteb@mail.com');

-- Ventas (salida)
INSERT INTO ventas (fecha,id_cliente,tipo_pago,total) VALUES
('2025-10-10',1,'Efectivo',115.00),
('2025-10-11',2,'Tarjeta',140.00);

INSERT INTO venta_detalles (id_venta,id_producto,cantidad,precio_unitario,subtotal) VALUES
(1,2,1,70.00,70.00),
(1,3,1,20.00,20.00),
(1,1,1,25.00,25.00),
(2,4,1,120.00,120.00),
(2,1,1,20.00,20.00);

-- Inventario inicial (se recomienda ejecutar después de las compras para ajustar stock)
INSERT INTO inventario (id_producto,stock_actual,ubicacion) VALUES
(1,9,'Anaquel A1'),
(2,10,'Anaquel A2'),
(3,4,'Anaquel B1'),
(4,1,'Anaquel C1');
