USE veterinaria_db;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;

START TRANSACTION;

SELECT Stock FROM Producto WHERE ID_Producto = 2;

-- SESIÓN A: finalizar transacción
COMMIT;

SELECT Stock
FROM Producto
WHERE ID_Producto = 2;

-- Paso 8.2 — Lectura no repetible
USE veterinaria_db;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

SELECT Stock FROM Producto WHERE ID_Producto = 2;

COMMIT;