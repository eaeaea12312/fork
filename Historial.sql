USE veterinaria_db;

-- Historial de responsables
INSERT INTO Historial_Responsable
(ID_Mascota, Rut_Cliente, Fecha_Inicio, Fecha_Fin)
VALUES
(1, '11111111-1', '2026-10-01', NULL),
(2, '22222222-2', '2026-10-01', NULL),
(3, '11111111-1', '2026-10-01', NULL);

-- Verificar historial
SELECT * FROM Historial_Responsable;