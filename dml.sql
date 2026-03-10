-- Insertamos en la tabla clientes , en la columnas nombre_cliente y telefono
-- para poder hacer las consultas+

INSERT INTO clientes (nombre_cliente, telefono) VALUES
('Juan Perez','3001234567'),
('Maria Gomez','3007654321'),
('Carlos Lopez','3011111111');

--Insertamos en la tabla productos , en las columnas nombre_producto , y en la 
--columna precio_producto para poder hacer las consultas 

INSERT INTO productos (nombre_producto, precio_producto) VALUES
('Laptop', 2500.00),
('Mouse', 50.00),
('Teclado', 120.00),
('Monitor', 900.00);

--Insertamos en la tabla ventas , en las columbas fecha y id_cliente 
--para poder hacer las columnas

INSERT INTO ventas (fecha, id_cliente) VALUES
('2026-03-01',1),
('2026-03-02',2),
('2026-03-03',1);

-- Insertamos en la tabla detalle_venta , insertamos en las columnas , 
-- id_venta, id_producto y cantidad, que seleccionamos el id para las llaves
-- foraneas

INSERT INTO detalle_venta (id_venta, id_producto, cantidad) VALUES
(1,1,1),
(1,2,2),
(2,3,1),
(3,4,1),
(3,2,1);

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- CONSULTA 1
-- VENTAS GENERALES

SELECT 
v.id_venta,
v.fecha,
c.nombre_cliente
FROM ventas v
JOIN clientes c 
ON v.id_cliente = c.id_cliente;

-- CONSULTA 2
-- DETALLE DE VENTA

SELECT 
v.id_venta,
c.nombre_cliente,
p.nombre_producto,
dv.cantidad,
p.precio_producto,
(dv.cantidad * p.precio_producto) AS subtotal
FROM detalle_venta dv
JOIN ventas v ON dv.id_venta = v.id_venta
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON dv.id_producto = p.id_producto;

-- CONSULTA 3
-- REPORTE DE GASTOS

SELECT 
c.nombre_cliente,
SUM(dv.cantidad * p.precio_producto) AS total_gastado
FROM detalle_venta dv
JOIN ventas v ON dv.id_venta = v.id_venta
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN productos p ON dv.id_producto = p.id_producto
GROUP BY c.nombre_cliente
ORDER BY total_gastado DESC;