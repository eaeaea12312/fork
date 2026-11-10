USE veterinaria_db;

START TRANSACTION;

UPDATE Producto
SET Stock = Stock + 1
WHERE ID_Producto = 2;

COMMIT;

SELECT Stock FROM Producto WHERE ID_Producto = 2;

-- Restaurar stock original
UPDATE Producto
SET Stock = Stock - 1
WHERE ID_Producto = 2;

SELECT Stock
FROM Producto
WHERE ID_Producto = 2;

-- Paso 8.2 — Lectura no repetible
USE veterinaria_db;

START TRANSACTION;

UPDATE Producto
SET Stock = Stock + 1
WHERE ID_Producto = 2;

COMMIT;

SELECT Stock FROM Producto WHERE ID_Producto = 2;

-- Restaurar el stock en la Sesión B
USE veterinaria_db;

START TRANSACTION;

UPDATE Producto
SET Stock = Stock - 1
WHERE ID_Producto = 2;

COMMIT;

SELECT Stock
FROM Producto
WHERE ID_Producto = 2;