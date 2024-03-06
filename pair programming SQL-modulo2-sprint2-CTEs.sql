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
WITH `clientes` AS (SELECT `customer_id`, `company_name`
					FROM `customers`)
SELECT *
	FROM `clientes`;
    
-- 2. Selecciona solo los de que vengan de "Germany"
WITH `clientes_Germany` AS (SELECT `customer_id`, `company_name`
					FROM `customers`
                    WHERE `country`= 'Germany')
SELECT *
	FROM `clientes_Germany`;
	
-- 3. Extraed el id de las facturas y su fecha de cada cliente.
SELECT `customers`.`customer_id`, `customers`.`company_name`, `orders`.`order_id`, `orders`.`order_date`
	FROM `customers`
INNER JOIN `orders`
ON `customers`. `customer_id`= `orders`. `customer_id`;
	
-- 4. Contad el número de facturas por cliente
SELECT `customers`.`customer_id`, `customers`.`company_name`, COUNT(`order_id`) AS 'num_facturas'
	FROM `customers`
INNER JOIN `orders`
ON `customers`. `customer_id`= `orders`. `customer_id`
GROUP BY `customers`.`customer_id`;

-- 5. Cuál la cantidad media pedida de todos los productos ProductID.
SELECT `od`.`product_id`, AVG (`od`.`quantity`),`p`.`product_name`
	FROM `order_details` AS `od`
INNER JOIN `products` AS `p`
	ON `od`.`product_id`= `p`.`product_id`
	GROUP BY `product_id`;

    
-- 6. BONUS: Usando una CTE, extraer el nombre de las diferentes categorías de productos, con su precio medio, máximo y mínimo.
WITH `cte_category` AS (SELECT `category_id`, AVG(`unit_price`) AS `media`, MAX(`unit_price`) AS `maximo`, MIN(`unit_price`) AS `minimo`
						FROM `products`AS `p`
						GROUP BY `category_id`)
                        
SELECT `category_name`, `media`, `maximo`, `minimo`
	FROM `cte_category`
INNER JOIN `categories` AS `c`
ON `cte_category`.`category_id`= `c`. `category_id`;

-- 7. La empresa nos ha pedido que busquemos el nombre de cliente, su teléfono y el número de pedidos que ha hecho cada uno de ellos.
-- 8. Modifica la consulta anterior para obtener los mismos resultados pero con los pedidos por año que ha hecho cada cliente.
-- 9. Modifica la cte del ejercicio anterior, úsala en una subconsulta para saber el nombre del cliente y su teléfono, para aquellos clientes que hayan hecho más de 6 pedidos en el año 1998.
-- 10 Nos piden que obtengamos el importe total (teniendo en cuenta los descuentos) de cada pedido de la tabla orders y el customer_id asociado a cada pedido.