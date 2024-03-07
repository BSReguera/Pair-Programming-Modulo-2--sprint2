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
SELECT `c`.`company_name`, `c`.`customer_id`, COUNT(`o`.`order_id`) AS "NumeroPedidos"
	FROM `customers`AS `c`
    NATURAL JOIN `orders`AS `o`
    WHERE `c`.`country` = "UK"
    GROUP BY `c`.`customer_id`;
    
-- 2. Productos pedidos por empresa en UK por año
SELECT `c`.`company_name`AS"NombreEmpresa" , YEAR(`o`.`order_date`) AS "Año", SUM(`quantity`) AS "NumObjetos"
	FROM `customers` AS `c`
    NATURAL JOIN `orders`AS `o`
    NATURAL JOIN `order_details`AS `od`
    WHERE `c`.`country` = "UK"    
	GROUP BY `c`.`customer_id`, YEAR(`o`.`order_date`);
	
-- 3. Mejorad la query anterior
SELECT `c`.`company_name`AS"NombreEmpresa" , YEAR(`o`.`order_date`) AS "Año",  SUM(`od`.`quantity`) AS "NumObjetos", SUM(`od`.`quantity` * `od`.`unit_price` * (1- `od`.`discount`)) AS "DineroTotal"
	FROM `customers` AS `c`
    NATURAL JOIN `orders` AS `o`
    NATURAL JOIN `order_details` AS `od`
    WHERE `c`.`country` = "UK"
	GROUP BY `c`.`company_name`, YEAR(`o`.`order_date`);
    
-- 4. BONUS: Pedidos que han realizado cada compañía y su fecha
SELECT `o`.`order_id`, `c`.`company_name`, `o`.`order_date`
	FROM `orders` AS `o`
	NATURAL JOIN `customers` AS `c`
	GROUP BY `o`.`order_id`;
    
-- 5. BONUS: Tipos de producto vendidos
SELECT `c`.`category_id`, `c`.`category_name`, `pr`.`product_name`, SUM((`od`.`unit_price` - (`od`.`discount`* `od`.`unit_price`))* `od`.`quantity`) AS "ProductSales"
	FROM `categories` AS `c`
	INNER JOIN `products` AS `pr`
		ON `c`.`category_id`= `pr`.`category_id`
	INNER JOIN `order_details` AS `od`
		ON `pr`.`product_id` = `od`.`product_id`
	GROUP BY `pr`.`product_id`;

-- 6. Qué empresas tenemos en la BBDD Northwind
SELECT `o`.`order_id`, `c`.`company_name`, `o`.`order_date`
	FROM `orders` AS `o`
	NATURAL JOIN `customers` AS `c`
	GROUP BY `o`.`order_id`;
    
-- 7. Pedidos por cliente de UK
SELECT `c`.`company_name` AS 'NombreCliente', COUNT(`o`.`order_id`) AS "NumeroPedidos"
	FROM `customers` AS `c`
    NATURAL JOIN `orders`AS `o`
    WHERE `c`.`country` = "UK"
    GROUP BY `o`.`customer_id`;

-- 8. Empresas de UK y sus pedidos
SELECT `o`.`order_id`,`c`.`company_name` AS "NombreCliente" , `o`.`order_date` AS "FechaPedido"
	FROM `customers` AS `c`
    NATURAL JOIN `orders` AS `o`
    WHERE `c`.`country` = "UK";
    
-- 9. Empleadas que sean de la misma ciudad. Uso de SELF JOIN, en el Where. <>
SELECT `e`.`city`, `e`.`first_name` AS "NombreEmpleado", `e`.`last_name` AS "ApellidoEmpleado", `j`.`city`, `j`.`first_name` AS "NombreJefe" , `j`.`last_name` AS "ApellidoJefe"
	FROM `employees` AS `e`, `employees` AS `j`
    WHERE `e`.`employee_id` <> `j`.`employee_id`
	AND `e`.`reports_to` =  `j`.`employee_id`;

-- 10. BONUS: FULL OUTER JOIN Pedidos y empresas con pedidos asociados o no.
-- Primera opcion. Uso de Left join + Union + Right Join.
SELECT `o`.`order_id`, `c`.`company_name` AS "NombreCliente" ,`o`.`order_date` AS "FechaPedido"
	FROM `orders` AS `o`
	LEFT JOIN `customers` AS `c`
		ON `o`.`customer_id` = `c`.`customer_id`
UNION
SELECT `o`.`order_id`, `o`.`order_date`, `c`.`company_name`
	FROM `orders` AS `o`
	RIGHT JOIN `customers` AS `c`
		ON `o`.`customer_id` = `c`.`customer_id`;
    
-- Segunda opcion.  Uso de Join.
SELECT `o`.`order_id`, `c`.`company_name` AS "NombreCliente", `o`.`order_date` AS "FechaPedido"
FROM `orders` AS `o`
JOIN `customers` AS `c`
	ON `o`.`customer_id` = `c`.`customer_id`;

