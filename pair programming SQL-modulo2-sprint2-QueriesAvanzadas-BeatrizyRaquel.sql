-- Pair programming - Queries Avanzadas
-- 1. Productos más baratos y caros de nuestra BBDD. Recibir el alias lowestPrice y highestPrice.
SELECT MIN() AS lowestPrice
		MAX() AS highestPrice
	FROM 
    
-- 2. Conociendo el numero de productos y su precio medio (en general).
SELECT COUNT
AVG(precio)
	FROM
    
-- 3. Sacad la máxima y mínima carga de los pedidos de UK. 
SELECT MAX(freight)
MIN(freight)
	FROM
    WHERE sHIPo countr = UK;
    
-- 4. Qué productos se venden por encima del precio medio, ordenador de mayor a menor DESC
SELECT
	FROM
    WHERE precio > (SELECT AVG(precio) FROM products)
    ORDER BY DESC;
    
-- 5. Qué productos se han descontinuado
SELECT COUNT(*)
FROM 
WHERE Discontinued = 1;
    
-- 6. Detalles de los productos no descontinuados, el ProductID y ProductName. Con limite a los 10 con ID más elevado.
SELECT product_id, product_name
	FROM
    WHERE Discontinued = 0
    ORDER BY product_id DESC
    LIMIT 10;
    
-- 7. Relación entre número de pedidos y máxima carga.
SELECT employee_id, COUNT(*)
	FROM
    WHERE
    GROUP BY
    
-- 8. Descartar pedidos sin fecha y ordénalos.
SELECT employee_id, COUNT(*)
	FROM
    WHERE ship_date IS NOT NULL
    GROUP BY
    ORDER BY
    
-- 9. Números de pedidos por día, mostrando de manera separada el día (DAY()), el mes (MONTH()) y el año (YEAR()).
SELECT DAY , MONTH, YEAR
	FROM
    CROUP BY
    
-- 10. Número de pedidos por mes y año
SELECT MONTH, YEAR
	FROM
    GROUP BY
    
-- 11. Seleccionad las ciudades con 4 o más empleadas
SELECT city, COUNT(*)
	FROM employee
    GROUP BY city
    HAVING count(*) >=4;
    
-- 12.Cread una nueva columna basándonos en la cantidad monetaria:
SELECT
	FROM
    