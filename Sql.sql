-- SELECT codigo_oficina,ciudad FROM oficina; eje 1 
--SELECT ciudad,telefono from oficina
  --  WHERE pais = 'España'; eje 2 

 -- SELECT nombre,apellido1,apellido2,email from empleado
   -- WHERE codigo_jefe = 7 ; --eje 3 

 --SELECT nombre,apellido1,apellido2,email,puesto from empleado;
    --WHERE puesto = 'Jefe' ; --eje 4

 -- SELECT nombre,apellido1,apellido2,email,puesto from empleado
   -- WHERE puesto != 'Representante Ventas' ; --eje 5

 -- SELECT nombre,apellido1,apellido2,email,puesto from empleado
   -- WHERE puesto != 'Representante Ventas' ; --eje 6

   
   

  
 --SELECT codigo_cliente from pago
    -- WHERE fecha_pago != 2008 ; --eje 9
--SELECT codigo_cliente , codigo_pedido, fecha_entrega, fecha_esperada 
--FROM pedido
--WHERE julianday(fecha_entrega) - julianday(fecha_esperada) = 2;



   --SELECT codigo_pedido, codigo_cliente, fecha_entrega
--FROM pedido
--WHERE strftime('%m', fecha_entrega) = '01'; eje11

--SELECT codigo_pedido, codigo_cliente, fecha_entrega
--FROM pedido
--WHERE strftime('%m', fecha_entrega) = '01'; eje 12



--SELECT DISTINCT forma_pago
--FROM pago; eje 13


--SELECT codigo_producto, nombre, gama, cantidad_en_stock, precio_venta
--FROM producto
--WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100
--ORDER BY precio_venta; eje 14




 --SELECT nombre_cliente , codigo_empleado_rep_ventas , ciudad FROM cliente 
-- where ciudad = 'Madrid' and (codigo_empleado_rep_ventas = 11 or codigo_empleado_rep_ventas =30); eje 15


--SELECT DISTINCT c.nombre_cliente , c.codigo_cliente
--FROM cliente c
--LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
--WHERE p.codigo_cliente IS NULL; --eje 16


--SELECT c.nombre_cliente, p.codigo_cliente
--FROM cliente c
--LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
--WHERE p.codigo_cliente IS NULL; eje 17



--SELECT c.nombre_cliente
--FROM cliente c
--LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
--LEFT JOIN pedido pe ON c.codigo_cliente = pe.codigo_cliente
--WHERE p.codigo_cliente IS NULL AND pe.codigo_cliente IS NULL;eje 18 

--SELECT e.codigo_empleado
--FROM empleado e
--LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
--WHERE o.codigo_oficina IS NULL; eje 19


--SELECT DISTINCT e.nombre , e.codigo_empleado
--FROM empleado e 
--INNER JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas;eje 20


--SELECT DISTINCT e.nombre , e.codigo_empleado , e.codigo_oficina ,o.ciudad
--FROM empleado e 
--LEFT JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas
--LEFT JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
--WHERE c.codigo_empleado_rep_ventas IS NULL; 21



--SELECT DISTINCT e.nombre , e.codigo_empleado , e.codigo_oficina ,o.ciudad
--FROM empleado e 
--LEFT JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas
--LEFT JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
--WHERE c.codigo_empleado_rep_ventas IS NULL and o.codigo_oficina IS NULL; --22


--SELECT DISTINCT p.nombre
--FROM producto p
--LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
--LEFT JOIN pedido ped ON dp.codigo_pedido = ped.codigo_pedido
--WHERE dp.codigo_producto IS NULL; --23


--SELECT DISTINCT p.nombre , p.descripcion , gam.imagen
--FROM producto p
--LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
--LEFT JOIN pedido ped ON dp.codigo_pedido = ped.codigo_pedido
--LEFT JOIN gama_producto gam ON gam.gama=p.gama
--WHERE dp.codigo_producto IS NULL; --24


--SELECT DISTINCT o.*
--FROM oficina o
--LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
--LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
--LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
--LEFT JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido 
--LEFT JOIN producto pr ON dp.codigo_producto = pr.codigo_producto AND pr.gama = 'Frutales'
--WHERE pr.codigo_producto IS NULL; 25


--SELECT DISTINCT c.*
--FROM cliente c
--LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
--LEFT JOIN pago pa ON p.codigo_cliente = pa.codigo_cliente
---WHERE pa.codigo_cliente IS NULL; 26





--SELECT DISTINCT c.*
--FROM cliente c
--LEFT JOIN  pago p ON p.codigo_cliente=c.codigo_cliente
--INNER JOIN  pedido pe  ON pe.codigo_cliente=c.codigo_cliente
--WHERE p.codigo_cliente IS NULL; 27


--el 27 es casi igual lo salto paja hacerlo


--SELECT COUNT (codigo_empleado) from empleado; --28

--SELECT count(*) AS [Numero de empleados ]  , o.pais from empleado e
--INNER JOIN oficina o ON o.codigo_oficina=e.codigo_oficina
--GROUP BY o.pais; 29


SELECT AVG(total) AS pago_medio
FROM pago
WHERE strftime('%Y', fecha_pago) = '2009'; 



--SELECT estado, COUNT(*) AS numero_de_pedidos
--FROM pedido
--GROUP BY estado
--ORDER BY numero_de_pedidos DESC; eje 31

--SELECT COUNT(*) AS numero_clientes
--FROM cliente; 32

--SELECT 
  --  MAX(precio_venta) AS precio_mas_caro,
    --MIN(precio_venta) AS precio_mas_barato
--FROM producto; 33


--SELECT COUNT(*) AS clientes_madrid
--FROM cliente
--WHERE ciudad = 'Madrid'; 34

--SELECT ciudad, COUNT(*) AS numero_clientes
--FROM cliente
--WHERE ciudad LIKE 'M%'
--GROUP BY ciudad; 



--SELECT e.nombre, COUNT(c.codigo_cliente) AS numero_clientes
--FROM empleado e
--INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
--GROUP BY e.nombre; 36

--SELECT COUNT(*) AS clientes_sin_representante
--FROM cliente
--WHERE codigo_empleado_rep_ventas IS NULL; 37

--75.	Clientes
-- que hayan pedido absolutamente todos los productos (en uno o en más pedidos)




/*SELECT DISTINCT o.id_oficina
FROM oficina o
LEFT JOIN empleado e ON o.id_oficina = e.id_oficina
LEFT JOIN cliente c ON e.id_empleado = c.id_empleado
LEFT JOIN pedido p ON c.id_cliente = p.id_cliente
LEFT JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
LEFT JOIN producto pr ON dp.id_producto = pr.id_producto
WHERE pr.gama_producto = 'Flores'
  AND e.id_empleado IS NULL;*/



/*CREATE VIEW vista_intermedia_1 AS
SELECT DISTINCT pedido.codigo_cliente, detalle_pedido.codigo_producto
FROM pedido INNER JOIN detalle_pedido
ON pedido.codigo_pedido = detalle_pedido.codigo_pedido;

-- vista_intermedia_1 es mi A y tengo que hacer una proyeccion de codigo_producto en producto

CREATE VIEW codigo_producto AS
SELECT codigo_producto FROM producto;

-- vista_intermedia_1 es mi A y codigo_producto es mi B, hago el cociente

CREATE VIEW vista_intermedia_2 AS
SELECT DISTINCT codigo_cliente FROM vista_intermedia_1 AS vista_intermedia_11 WHERE NOT EXISTS(
    SELECT 1 FROM codigo_producto WHERE NOT EXISTS(
        SELECT 1 FROM vista_intermedia_1 AS vista_intermedia_12 WHERE vista_intermedia_12.codigo_cliente=vista_intermedia_11.codigo_cliente AND vista_intermedia_12.codigo_producto=codigo_producto.codigo_producto
    )
);

SELECT cliente.*
FROM cliente INNER JOIN vista_intermedia_2
ON cliente.codigo_cliente = vista_intermedia_2.codigo_cliente;*/  