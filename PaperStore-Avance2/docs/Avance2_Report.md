# Avance 2 — Proyecto Final: PaperStore (Almacén de Papelería)

**Resumen del proyecto**  
PaperStore es un sistema para gestionar el almacén de una papelería: controla productos, categorías, proveedores, compras (entrada de stock), ventas (salida de stock), inventario y clientes.

## Planteamiento del problema
La papelería suele llevar registros manuales o en hojas de cálculo, generando inconsistencias de stock, errores en precios y problemas al relacionar compras con proveedores. Este proyecto propone una base de datos relacional que centralice la información, garantice integridad y facilite consultas y reportes.

## Objetivo general
Diseñar e implementar una base de datos relacional normalizada (hasta 4FN) para gestionar el almacén y las operaciones básicas de una papelería.

## Objetivos específicos
1. Modelar un DER que refleje las entidades y relaciones del dominio (productos, proveedores, compras, ventas, clientes, inventario).
2. Implementar scripts SQL para la creación de la base de datos y las tablas con restricciones adecuadas.
3. Población de datos de catálogo y creación de consultas que validen la estructura y las reglas de negocio (ej. control de stock).

## Normalización
Se separan entidades (Productos, Proveedores, Compras, Ventas, Clientes, Categorías, Inventario, Detalles) para evitar redundancias y dependencias multi-valuadas. Las relaciones N:N se resuelven con tablas detalle; las multivaluadas de inventario se manejan mediante movimientos. Se cumple 1FN, 2FN, 3FN y se estructura para 4FN al separar multi-valorados en tablas independientes.

## Entregables
- DER (docs/DER_mermaid.md)
- Scripts SQL (sql/*.sql)
- Consultas de ejemplo (examples/consultas_ejemplo.sql)
- Reporte en Markdown (exportar a PDF)
