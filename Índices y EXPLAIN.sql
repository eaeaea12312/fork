-- Paso 9.1 
USE veterinaria_db;

-- Paso 9.1: EXPLAIN antes del índice
EXPLAIN
SELECT *
FROM Producto
WHERE Nombre_Producto = 'Antiparasitario';

-- Paso 9.2: Crear índice
CREATE INDEX idx_producto_nombre
ON Producto (Nombre_Producto);

-- Paso 9.3: EXPLAIN después del índice
EXPLAIN
SELECT *
FROM Producto
WHERE Nombre_Producto = 'Antiparasitario';