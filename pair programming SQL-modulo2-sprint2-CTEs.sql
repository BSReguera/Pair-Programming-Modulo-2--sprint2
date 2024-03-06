-- Pair Programming - CTEs - Beatriz y Raquel

-- BASE DE CTE
WITH `media` AS (SELECT `product_line`, AVG (`buy_price`) AS `media_precio`
					FROM `products`
					GROUP BY `product_line`)
                    
SELECT `product_name`, `products`.`product_line`, `buy_price`, `media_precio`
	FROM `products`
    INNER JOIN `media`
    ON `products`.`product_line` = `media`.`product_line`;
    
-- 1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
-- 2. Selecciona solo los de que vengan de "Germany"
-- 3. Extraed el id de las facturas y su fecha de cada cliente.
-- 4. Contad el número de facturas por cliente
-- 5. Cuál la cantidad media pedida de todos los productos ProductID.
-- 6. BONUS: Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.
-- 7. La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos.
-- 8. Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente.
-- 9. Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono, para aquellos clientes que hayan hecho más de 6 pedidos en el año 1998.
-- 10 Nos piden que obtengamos el importe total (teniendo en cuenta los descuentos) de cada pedido de la tabla orders y el customer_id asociado a cada pedido.