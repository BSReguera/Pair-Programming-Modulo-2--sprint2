-- Pair programming -- SQL - Union Tablas (Joins)

-- Base: 
SELECT `pd`.`product_id`, SUM(`cantidad`), `precio`, `nombre producto`, SUM(`cantidad`) * `precio` AS `total`
	FROM `pedidos` AS `pd` 
	INNER JOIN `products` AS `pr`
	ON `pd`.`product_id` = `pr`.`product_id`
	WHERE `precio` < 50
	GROUP BY `product_id`
	HAVING `total` > 250;

-- 1. Pedidos por empresa en UK
SELECT `company_name`, `customer_id`, `order_id`
	FROM `customers`
    NATURAL JOIN `orders`
    WHERE `country` = "UK";
    
SELECT `company_name`, `customer_id`, COUNT(`order_id`) AS "NumeroPedidos"
	FROM `customers`
    NATURAL JOIN `orders`
    WHERE `country` = "UK"
    GROUP BY `customer_id`;
    
-- 2. Productos pedidos por empresa en UK por año
SELECT `company_name`, YEAR(`order_date`) AS "Año" ,SUM(`quantity`) AS "NumObjetos"
	FROM `customers`
    NATURAL JOIN `orders`
    NATURAL JOIN `order_details`
    WHERE `country` = "UK"    
	GROUP BY `customer_id`, YEAR(`order_date`);
	
-- 3. Mejorad la query anterior
SELECT `company_name`, YEAR(`order_date`) AS "Año",  SUM(`quantity`) AS "NumObjetos", SUM(`quantity` * `unit_price` * (1- `discount`)) AS "DineroTotal"
	FROM `customers`
    NATURAL JOIN `orders`
    NATURAL JOIN `order_details`
    WHERE `country` = "UK"
	GROUP BY `company_name`, YEAR(`order_date`);

    
-- 4. BONUS: Pedidos que han realizado cada compañía y su fecha
SELECT `order_id`, `company_name`, `order_date`
	FROM `orders`
	NATURAL JOIN `customers`
	GROUP BY `order_id`;

-- 5. BONUS: Tipos de producto vendidos
SELECT `category_id`, `category_name`, `product_name`, `product_id`, SUM(`unit_price` * `quantity` * (1-`discount`/100))
	FROM `products`
	NATURAL JOIN `categories`
    ON `category_id`= 
    JOIN `order_details`
    ON 
    GROUP BY(`category_id`, `category_name`, `product_name`, `product_id`);

-- 6. Qué empresas tenemos en la BBDD Northwind
SELECT `order_id`, `company_name`, `order_date`
	FROM `customers`
	INNER JOIN `orders` ON `order_id`= `company_name`;

-- 7. Pedidos por cliente de UK
SELECT `company_name` AS 'NombreCliente', COUNT(`order_id`) AS "NumeroPedidos"
	FROM `customers`
    NATURAL JOIN `orders`
    WHERE `country` = "UK"
    GROUP BY `customer_id`;

-- 8. Empresas de UK y sus pedidos
SELECT `order_id`,`company_name`, `order_date`
	FROM `customers`
    NATURAL JOIN `orders`
    WHERE `country` = "UK";

-- 9. Empleadas que sean de la misma ciudad
SELECT `city`, `last_name`, `first_name`, `city`, AS "NombreJefe",AS "ApellidoJefe"
	FROM `employees`
	SELF JOIN `employees`ON ;

-- 10. BONUS: FULL OUTER JOIN Pedidos y empresas con pedidos asociados o no
SELECT `order_id`, `company_name`, `order_date`
	FROM `employees`
    FULL JOIN `orders`;


