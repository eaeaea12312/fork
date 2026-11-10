-- Paso 7 — Transacciones en MySQL
-- Haremos una venta de 2 unidades del producto Antiparasitario, que tiene un precio de $8.000 cada una.

-- 7.1 — BEGIN, SAVEPOINT y COMMIT
-- Este código registra una venta, crea su detalle y descuenta las unidades del stock. También demuestra cómo deshacer parcialmente una operación con SAVEPOINT

USE veterinaria_db;

-- 7.1: Transaccion de venta con COMMIT y SAVEPOINT

-- Verificar stock inicial
SELECT ID_Producto, Nombre_Producto, Stock
FROM Producto WHERE ID_Producto = 2;

START TRANSACTION;

-- Bloquear el producto durante la transaccion
SELECT Stock FROM Producto
WHERE ID_Producto = 2 FOR UPDATE;

-- Registrar venta
INSERT INTO Venta
(Fecha_Pago, Monto_Venta, Forma_Pago, Rut_Cliente, Rut_Cajero)
VALUES
(CURDATE(), 16000, 'Efectivo', '22222222-2', '16111111-1');

SET @venta_nueva = LAST_INSERT_ID();

SAVEPOINT antes_detalle;

-- Registrar detalle y descontar stock
INSERT INTO Detalle_Venta
(ID_Venta, ID_Producto, Cantidad, Subtotal)
VALUES (@venta_nueva, 2, 2, 16000);

UPDATE Producto
SET Stock = Stock - 2
WHERE ID_Producto = 2 AND Stock >= 2;

-- Deshacer solo lo realizado despues del SAVEPOINT
ROLLBACK TO SAVEPOINT antes_detalle;

-- Registrar correctamente el detalle y descuento
INSERT INTO Detalle_Venta
(ID_Venta, ID_Producto, Cantidad, Subtotal)
VALUES (@venta_nueva, 2, 2, 16000);

UPDATE Producto
SET Stock = Stock - 2
WHERE ID_Producto = 2 AND Stock >= 2;

COMMIT;

-- Verificar resultados
SELECT * FROM Venta WHERE ID_Venta = @venta_nueva;
SELECT * FROM Detalle_Venta WHERE ID_Venta = @venta_nueva;
SELECT ID_Producto, Stock FROM Producto WHERE ID_Producto = 2;

-- 7.2 ROLLBACK completo
-- En la 7.2 vamos a demostrar que ROLLBACK deshace una modificación. Mi stock actual es 28. Lo bajaremos temporalmente a 25 y después volverá a 28, sin perder ninguna información.
START TRANSACTION;

UPDATE Producto
SET Stock = Stock - 3
WHERE ID_Producto = 2;

-- Stock temporal
SELECT Stock FROM Producto WHERE ID_Producto = 2;

ROLLBACK;

-- Stock después del ROLLBACK
SELECT Stock FROM Producto WHERE ID_Producto = 2;

