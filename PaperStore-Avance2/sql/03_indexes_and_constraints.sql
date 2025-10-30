-- 03_indexes_and_constraints.sql
USE paperstore;

CREATE INDEX idx_productos_codigo ON productos(codigo);
CREATE INDEX idx_categorias_nombre ON categorias(nombre);
CREATE INDEX idx_proveedores_nombre ON proveedores(nombre);

CREATE INDEX idx_compras_fecha ON compras(fecha);
CREATE INDEX idx_ventas_fecha ON ventas(fecha);

-- Trigger: después de insertar compra_detalles, actualizar inventario
DELIMITER $$
CREATE TRIGGER trg_after_compra_detalle
AFTER INSERT ON compra_detalles
FOR EACH ROW
BEGIN
    INSERT INTO inventario (id_producto, stock_actual) VALUES (NEW.id_producto, NEW.cantidad)
    ON DUPLICATE KEY UPDATE stock_actual = stock_actual + NEW.cantidad;
    -- Actualizar total de compra
    UPDATE compras SET total = (SELECT SUM(subtotal) FROM compra_detalles WHERE id_compra = NEW.id_compra) WHERE id = NEW.id_compra;
END$$
DELIMITER ;

-- Trigger: después de insertar venta_detalles, validar stock y actualizar inventario
DELIMITER $$
CREATE TRIGGER trg_before_venta_detalle
BEFORE INSERT ON venta_detalles
FOR EACH ROW
BEGIN
    DECLARE s INT;
    SELECT stock_actual INTO s FROM inventario WHERE id_producto = NEW.id_producto FOR UPDATE;
    IF s IS NULL OR s < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trg_after_venta_detalle
AFTER INSERT ON venta_detalles
FOR EACH ROW
BEGIN
    UPDATE inventario SET stock_actual = stock_actual - NEW.cantidad WHERE id_producto = NEW.id_producto;
    -- Actualizar total de venta
    UPDATE ventas SET total = (SELECT SUM(subtotal) FROM venta_detalles WHERE id_venta = NEW.id_venta) WHERE id = NEW.id_venta;
END$$
DELIMITER ;
