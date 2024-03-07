-- Pair programming -- SQL -- Queries Básicas

-- 0. Creacion del esquema
CREATE SCHEMA `northwind`;

-- 1 + 2 + 3. Descarga e instalacion de la BBDD

-- 4. Conociendo a las empleadas
SELECT `employee_id`, `last_name`, `first_name`
	FROM `employees`;

-- 5. Conociendo los productos más baratos (de menor a mayor ASC)
SELECT *
	FROM `products`
	WHERE `unit_price` BETWEEN 0 AND 5;

-- 6. Conociendo los productos que no tiene precio
SELECT *
	FROM `products`
	WHERE `unit_price` IS NULL;

-- 7. Comprando productos
SELECT *
	FROM `products`
	WHERE `unit_price` < 15 AND `product_id` < 10;

-- 8. Cambiando operadores
SELECT *
	FROM `products`
	WHERE `unit_price` > 15 AND `product_id` > 10;

-- Usando el NOT
SELECT *
	FROM `products`
	WHERE NOT `unit_price` >= 15 AND `product_id` >= 10;

-- 9. Conociendo los paises a los que vendemos
SELECT DISTINCT `ship_country`
	FROM `orders`;

-- 10. Conociendo el tipo de productos que vendemos en Northwind
SELECT `product_id`, `product_name`, `unit_price`
	FROM `products`
	LIMIT 10;

-- 11. Ordenando los resultados en orden descendente
SELECT `product_id`, `product_name`, `unit_price`
	FROM `products`
	ORDER BY `product_id` DESC
	LIMIT 10;

-- 12. Que pedidos tenemos en nuestra BBDD
SELECT DISTINCT `order_id`, `product_id`
	FROM `order_details`;

-- 13. Que pedidos han gastado más
SELECT `unit_price` * `quantity` AS 'ImporteTotal'
	FROM `order_details`
	ORDER BY `ImporteTotal` DESC
	LIMIT 3;

-- 14. Los pedidos que están entre las posiciones 5 y 10 de nuestro ranking
SELECT `order_id` * `quantity` AS 'ImporteTotal'
	FROM `order_details`
	LIMIT 10 OFFSET 5;

-- 15. Qué categorías tenemos en nuestra BBDD
SELECT DISTINCT `category_id`, `category_name` AS 'NombreDeCategoria'
	FROM `categories`;

-- 16. Selecciona envios con retraso
SELECT `order_id`, `shipped_date`, DATE_ADD(`shipped_date`, INTERVAL 5 DAY) AS 'FechaRetrasada' 
	FROM `orders`
	WHERE `shipped_date` IS NOT NULL; 

-- 17. Selecciona los productos más rentables
SELECT *
	FROM `products`
	WHERE `unit_price` BETWEEN 15 AND 50;

-- 18. Selecciona los productos con unos precios dados
SELECT *
	FROM `products`
	WHERE `unit_price` IN (18, 19, 20);


