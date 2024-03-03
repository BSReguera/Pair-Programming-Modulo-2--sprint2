-- Pair programming -- SQL - Operadores Especiales de Filtro

-- 0. Creacion de columna temporal. 
SELECT  'Hola!'  AS tipo_nombre
FROM customers;

-- 0. Base, obervamos que hay en cada tabla
SELECT *
FROM `customers`;

SELECT *
FROM ``;

-- 1. Ciudades que empiezan con "A" o "B"
SELECT `city`, `company_name`, `contact_name`
FROM `customers` 
WHERE `city` LIKE 'A%' OR `city`LIKE 'B%'; 

-- 2. Número de pedidos que han hecho en las ciudades que empiezan con L
SELECT `c`.`city`, `c`.`company_name`, `c`.`contact_name`, `o`.`order_id`
FROM `customers` AS `c`
JOIN `orders` AS `o`
ON `c`.`customer_id` = `o`.`customer_id`
WHERE `c`.`city` LIKE 'L%'
GROUP BY `c`.`city`, `c`.`company_name`, `c`.`contact_name`, `o`.`order_id`; 

-- 3. Todos los clientes cuyo "contact_title" no incluya "Sales"
SELECT `c`.`contact_name`,`c`.`contact_title`, `c`.`company_name` 
FROM `customers` AS `c`
WHERE `c`.`contact_title` NOT LIKE '%Sales%';

-- 4. Todos los clientes que no tengan una "A" en segunda posición en su nombre
SELECT `contact_name`
FROM `customers`
WHERE `contact_name` NOT LIKE '_a%';

-- 5. Extraer toda la información sobre las compañias que tengamos en la BBDD
-- Crear columna temporal, llamada Relationship - TERMINAR, ESTA MAL HECHA MIRAR OUTPUT 
SELECT  "customers"  AS "Relationship"
FROM `customers`;

-- Extraccion de informacion
SELECT `c`.`city`, `c`.`company_name`, `c`.`contact_name`, 'Suppliers' AS "Relationship"
FROM `customers` AS `c` 
UNION
SELECT `c`.`city`, `c`.`company_name`, `c`.`contact_name`, 'Customers' AS "Relationship"
FROM `suppliers` AS `s`;

-- 6. Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet"
SELECT `description` -- O TODA LA TABLA??
FROM `categories`
WHERE `description` LIKE '%Sweet%' AND `description` LIKE '%sweet%';

-- 7. Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la BBDD. Usando Concat. 
-- NOTA: La función CONCAT en SQL se utiliza para combinar (concatenar) dos o más cadenas de texto en una sola cadena.
SELECT CONCAT(`contact_name`)
FROM `customers`
UNION
SELECT CONCAT(`first_name`,' ',`last_name`)
FROM `employees`;

 