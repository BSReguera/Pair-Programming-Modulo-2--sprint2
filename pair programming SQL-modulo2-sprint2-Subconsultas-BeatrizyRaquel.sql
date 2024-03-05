-- Pair programming -- SQL - Subconsultas

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
SELECT `od1`.`product_id`, `od1`.`unit_price` AS "Maxunitprice"
	FROM `order_details` AS `od1`
    WHERE `od1`.`unit_price` IN (SELECT MAX(`od2`.`unit_price`)
					FROM `order_details` AS `od2`
					WHERE `od1`.`product_id` = `od2`.`product_id`)
GROUP BY `od1`.`product_id`,`od1`.`unit_price`;
  
-- 3. Extraed información de los productos "Beverages"
SELECT `product_id`, `product_name`, `category_id`
	FROM `products`
    WHERE `category_id` = 1; 
 
-- 4. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
SELECT `country`
	FROM `customers` AS `c`
    WHERE NOT EXISTS (SELECT *
						FROM `suppliers` AS `s`
						WHERE `s`.`country`= `c`.`country`)
GROUP BY `country`; 
    
-- 5. Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
SELECT `customers_id`, `product_id`
	FROM `products` AS `p`
    WHERE  `product_id`>= 20 IN (SELECT `order_id`
								FROM `order_details` AS `od`
                                WHERE `p`.`product_id` = 6)
GROUP BY `od`.`order_id`;
    
SELECT `product_id`,`customers_id` 
	FROM `products` AS `p`
    WHERE  `product_id` = 6;

-- 6. Extraed los 10 productos más caros
SELECT 
	FROM
    
-- BONUS: 7. Qué producto es más popular
SELECT 
	FROM
    