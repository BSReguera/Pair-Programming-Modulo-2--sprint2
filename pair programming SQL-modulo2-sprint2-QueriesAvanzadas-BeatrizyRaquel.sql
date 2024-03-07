-- Pair programming -- SQL -- Queries Avanzadas

-- 1. Productos más baratos y caros de nuestra BBDD. Recibir el alias lowestPrice y highestPrice.
SELECT MIN(`unit_price`) AS 'lowestPrice', MAX(`unit_price`) AS 'highestPrice'
	FROM `products`;
    
-- 2. Conociendo el numero de productos y su precio medio (en general).
SELECT COUNT(`product_id`), AVG(`unit_price`)
	FROM `products`;
    
-- 3. Sacad la máxima y mínima carga de los pedidos de UK. 
SELECT MIN(`freight`), MAX(`freight`), `ship_country`
	FROM `orders`
	WHERE `ship_country` = 'UK';
    
-- 4. Qué productos se venden por encima del precio medio, ordenado de mayor a menor DESC    
SELECT `product_id`, `product_name`, AVG(`unit_price`) AS 'MediumPrice'
	FROM `products`
	GROUP BY `product_id`, `product_name`
	HAVING AVG(`unit_price`) > (SELECT AVG(`unit_price`) FROM `products`)
	ORDER BY 'MediumPrice' DESC;
    
-- 5. Qué productos se han descontinuado
SELECT COUNT(*)
	FROM `products`
	WHERE Discontinued = 1;
    
-- 6. Detalles de los productos no descontinuados, el ProductID y ProductName. Con limite a los 10 con ID más elevado.
SELECT `product_id`, `product_name`
	FROM `products`
    WHERE Discontinued = 0
    ORDER BY `product_id` DESC
    LIMIT 10;
    
-- 7. Relación entre número de pedidos y máxima carga.
SELECT `employee_id`, MAX(`freight`), COUNT(`order_id`)
	FROM `orders`
    GROUP BY `employee_id`;
    
-- 8. Descartar pedidos sin fecha y ordénalos.
SELECT `employee_id`, MAX(`freight`), COUNT(`order_id`)
	FROM `orders`
    GROUP BY `employee_id`
    HAVING shipped_date IS ;
    
-- 9. Números de pedidos por día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).
SELECT COUNT(*), DAY(`order_date`) , MONTH(`order_date`), YEAR(`order_date`)
	FROM `orders`
    GROUP BY `order_date`;
    
-- 10. Número de pedidos por mes y año
SELECT COUNT(*), MONTH(`order_date`), YEAR(`order_date`)
	FROM `orders`
    GROUP BY YEAR(`order_date`), MONTH(`order_date`);
    
-- 11. Seleccionad las ciudades con 4 o más empleadas
SELECT `city`, COUNT(`employee_id`)
	FROM `employees`
    GROUP BY `city`
    HAVING COUNT(`employee_id`) >= 4;
    
-- 12.Cread una nueva columna basándonos en la cantidad monetaria:
SELECT `order_id`, SUM(`unit_price` * `quantity`) AS 'TotalAmount',
		CASE
        	WHEN SUM(`unit_price` * `quantity`) > 2000 THEN 'alto' 
        	ELSE 'bajo'
    	END AS 'TotalAmountCategory'
	FROM `order_details`
	GROUP BY `order_id`;
    