-- 01_tables.sql
USE paperstore;

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion VARCHAR(255)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(30) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario >= 0),
    id_categoria INT NOT NULL,
    unidad_medida VARCHAR(20) DEFAULT 'pieza',
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id) ON DELETE RESTRICT
);

CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    direccion VARCHAR(255)
);

CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_proveedor INT NOT NULL,
    factura VARCHAR(50),
    total DECIMAL(12,2) DEFAULT 0,
    CONSTRAINT fk_compra_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id) ON DELETE RESTRICT
);

CREATE TABLE compra_detalles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario >= 0),
    subtotal DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_compra_detalle_compra FOREIGN KEY (id_compra) REFERENCES compras(id) ON DELETE CASCADE,
    CONSTRAINT fk_compra_detalle_producto FOREIGN KEY (id_producto) REFERENCES productos(id) ON DELETE RESTRICT,
    UNIQUE (id_compra, id_producto)
);

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100)
);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    tipo_pago ENUM('Efectivo','Tarjeta','Transferencia') DEFAULT 'Efectivo',
    total DECIMAL(12,2) DEFAULT 0,
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id) ON DELETE SET NULL
);

CREATE TABLE venta_detalles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(10,2) NOT NULL CHECK (precio_unitario >= 0),
    subtotal DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_venta_detalle_venta FOREIGN KEY (id_venta) REFERENCES ventas(id) ON DELETE CASCADE,
    CONSTRAINT fk_venta_detalle_producto FOREIGN KEY (id_producto) REFERENCES productos(id) ON DELETE RESTRICT,
    UNIQUE (id_venta, id_producto)
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL UNIQUE,
    stock_actual INT NOT NULL DEFAULT 0 CHECK (stock_actual >= 0),
    ubicacion VARCHAR(100),
    CONSTRAINT fk_inventario_producto FOREIGN KEY (id_producto) REFERENCES productos(id) ON DELETE CASCADE
);
