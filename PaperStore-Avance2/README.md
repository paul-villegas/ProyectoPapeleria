# PaperStore - Avance 2 (Proyecto Final: Base de Datos Relacional)

**Proyecto:** Sistema de Gestión de Almacén para Papelería "PaperStore"

**Resumen:**  
Base de datos relacional para gestionar productos, inventario, proveedores, compras, ventas y clientes de una papelería. Incluye scripts SQL, diagrama ER (Mermaid), datos de catálogo de ejemplo y consultas de validación.

## Estructura del repositorio
```
PaperStore-Avance2/
├─ README.md
├─ docs/
│  ├─ Avance2_Report.md
│  └─ DER_mermaid.md
├─ sql/
│  ├─ 00_create_database.sql
│  ├─ 01_tables.sql
│  ├─ 02_inserts_catalog.sql
│  └─ 03_indexes_and_constraints.sql
├─ examples/
│  └─ consultas_ejemplo.sql
└─ .gitignore
```

## Cómo usar
1. Ejecuta `sql/00_create_database.sql` para crear la base de datos.
2. Ejecuta `sql/01_tables.sql` para crear tablas.
3. Ejecuta `sql/02_inserts_catalog.sql` para poblar datos de ejemplo.
4. Ejecuta `sql/03_indexes_and_constraints.sql` para índices y triggers.
5. Usa `examples/consultas_ejemplo.sql` para probar consultas (SELECT, JOIN, agregados).

## Entregables
- Informe en `docs/Avance2_Report.md` (exportar a PDF para entregar).
- Scripts SQL listos para correr en MySQL/MariaDB.
- Diagrama ER en `docs/DER_mermaid.md` (renderizable en GitHub).
