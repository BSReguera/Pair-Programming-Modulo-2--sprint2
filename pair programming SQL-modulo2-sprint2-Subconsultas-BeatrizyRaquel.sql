-- Pair programming -- SQL -- Subconsultas

-- 0. Observamos las tablas a usar
SELECT *
	FROM `orders`;
SELECT  *
	FROM ``;
    
-- 1. Extraed los pedidos con el máximo "order_date" para cada empleado.
SELECT `order_id`, `customer_id`, `employee_id`, `order_date`, `required_date`
	FROM `orders` AS `o1`
    WHERE `order_date` IN (SELECT MAX(`order_date`)
								FROM `orders` AS `o2`
								WHERE  `o1`.`employee_id`= `o2`.`employee_id`);
-- Querie de base correlacionada
SELECT MAX(`order_date`)
	FROM `orders` AS `o2`
	WHERE  `o2`.`employee_id` = 5;

    
-- 2. Extraed el precio unitario máximo (unit_price) de cada producto vendido.
SELECT `product_id`, MAX(`unit_price`)
	FROM `order_details`
    GROUP BY `product_id`
  
-- 3. Extraed información de los productos "Beverages"
SELECT `product_id`, `product_name`, `products`.`category_id`
	FROM `products`
    INNER JOIN `categories` ON `products`.`category_id` = `categories`.`category_id`
    WHERE `category_name` = 'Beverages'
 
-- 4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
SELECT `country`
	FROM `customers` AS `c`
    WHERE NOT EXISTS (SELECT *
						FROM `suppliers` AS `s`
						WHERE `s`.`country`= `c`.`country`)
	GROUP BY `country`; 
    
-- 5. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
SELECT `order_id`, `customer_id`
	FROM `orders`
	WHERE `order_id` IN (SELECT `order_id`
							FROM `order_details`
							WHERE  `product_id` = 6 AND `quantity` > 20);
        
-- 6. Extraed los 10 productos más caros
SELECT `product_name` AS 'Ten_Most_Expensive_Products' , `unit_price`
	FROM `products`
    ORDER BY `unit_price` DESC
    LIMIT 10;
    
-- BONUS: 7. Qué producto es más popular                     
SELECT `p`.`product_name`,
    (SELECT SUM(`quantity`)
		FROM `order_details`
		WHERE `product_id` = `p`.`product_id`) AS "Total_quantity"
	FROM `products` AS `p`
	ORDER BY `total_quantity` DESC
	LIMIT 1;