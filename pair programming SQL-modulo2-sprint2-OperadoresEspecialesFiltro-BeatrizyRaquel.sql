<<<<<<< HEAD
-- Pair programming -- SQL - Operadores Especiales de Filtro

-- 0. Creacion de columna temporal. 
SELECT  'Hola!'  AS tipo_nombre
	FROM customers;

-- 0. Base, obervamos que hay en cada tabla
SELECT *
	FROM `customers`;

SELECT *
	FROM `employees`;

-- 1. Ciudades que empiezan con "A" o "B"
SELECT `city`, `company_name`, `contact_name`
	FROM `customers` 
	WHERE `city` LIKE 'A%' OR `city`LIKE 'B%'; 

-- 2. Número de pedidos que han hecho en las ciudades que empiezan con L
 SELECT `c`.`city`, `c`.`company_name`, `c`.`contact_name`, COUNT(`o`.`order_id`) AS `Numero Pedidos`
    FROM `customers` AS `c`
    INNER JOIN `orders` AS `o`
        ON `c`.`customer_id` = `o`.`customer_id`
    GROUP BY `c`.`customer_id`
    HAVING `city` LIKE 'L%';

-- 3. Todos los clientes cuyo "contact_title" no incluya "Sales"
SELECT `c`.`contact_name`,`c`.`contact_title`, `c`.`company_name` 
	FROM `customers` AS `c`
	WHERE `c`.`contact_title` NOT LIKE '%Sales%';

-- 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre
SELECT `contact_name`
	FROM `customers`
	WHERE `contact_name` NOT LIKE '_a%';

-- 5. Extraer toda la información sobre las compañias que tengamos en la BBDD
SELECT `c`.`city`, `c`.`company_name`, `c`.`contact_name`, 'Customers' AS "Relationship"
	FROM `customers` AS `c` 
UNION
	SELECT `s`.`city`, `s`.`company_name`, `s`.`contact_name`, 'Suppliers' AS "Relationship"
		FROM `suppliers` AS `s`;

-- 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet"
SELECT `description`
	FROM `categories`
		WHERE `description` LIKE '%Sweet%' AND `description` LIKE '%sweet%';

-- 7. Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD. Usando Concat. 
-- NOTA: La función CONCAT en SQL se utiliza para combinar (concatenar) dos o más cadenas de texto en una sola cadena.
SELECT `contact_name`AS "Nombre_empleado"
	FROM `customers`
UNION
	SELECT CONCAT(`first_name`,' ',`last_name`) AS "Nombre_empleado"
		FROM `employees`;

 
=======
-- EJERCICIO 1: Ciudades que empiezan con "A" o "B".
SELECT `city`, `company_name`, `contact_name`
	 FROM `customers`
     WHERE `city`LIKE 'A%' OR `city` LIKE 'B%';
     
-- EJERCICIO 2: Número de pedidos que han hecho en las ciudades que empiezan con L.
SELECT `city`, `company_name`, `contact_name`
	FROM `customers` 
	INNER JOIN `orders` 
    ON `customers`. `customer_id`= `orders`.`customer_id`
    WHERE `order_id` LIKE 'L%'
    GROUP BY `order_id`;
    
    
    SELECT `c`.`city`, `c`.`company_name`, `c`.`contact_name`, COUNT(`order_id`) AS `num_pedidos`
FROM `customers` AS `c`
JOIN `orders` AS `o`
ON `c`.`customer_id` = `o`.`customer_id`
JOIN `order_details` AS `od`
ON `o`.`order_id` = `od`.`order_id`
INNER JOIN `products` AS `p`
ON `od`.`product_id` = `p`.`product_id`
WHERE `c`.`city` LIKE 'L%'
GROUP BY `c`.`city`, `c`.`company_name`, `c`.`contact_name`;
    
    INNER JOIN `order_details` AS 'od'
    ON `o`. `order_id`= `od`.`order_id`
    INNER JOIN `products` AS 'p'
    ON `od`.`product_id`= `p`.`product_id`
	WHERE `city` LIKE 'L%' 
    GROUP BY `city`;
    
-- EJERCICIO 3: Todos los clientes cuyo "contact_title" no incluya "Sales".
SELECT `contact_name`, `contact_title`, `company_name`
	FROM `customers`
	WHERE `contact_title` NOT LIKE '%sales%' ;
    
-- EJERCICIO 4: Todos los clientes que no tengan una "A" en segunda posición en su nombre.
SELECT `contact_name`
	 FROM `customers`
     WHERE `contact_name` NOT LIKE '_a%';
     
-- EJERCICIO 5: Extraer toda la información sobre las compañias que tengamos en la BBDD
SELECT `city`, `company_name`, `contact_name`, "customers" AS "Relationships"
	FROM `customers`
    UNION 
SELECT `city`, `company_name`, `contact_name`, "suppliers" AS "Relationships"
	FROM `suppliers`;

-- EJERCICIO 6: Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".
SELECT `description`
	FROM `categories`
    WHERE `description` LIKE '%sweet%' AND `description` LIKE '%Sweet%';
    
-- EJERCICIO 7: Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD:
SELECT CONCAT(`first_name`," ", `last_name`) AS 'nombre_empleado'
	 FROM `employees`
UNION ALL
SELECT `contact_name` AS 'nombre_cliente'
	 FROM `customers`;
    
>>>>>>> f9f4ea01e6bf5382c1e8418c3834ec2f449004e6
