CREATE DATABASE Supermarket;

USE Supermarket;

SELECT * FROM supermarket;


-- 1. Análisis General de Ventas
-- Pregunta: ¿Cuál es el ingreso total generado por las ventas para cada sucursal?

SELECT Branch, SUM(Total) AS Total_por_sucursal FROM supermarket
GROUP BY Branch
ORDER BY Total_por_sucursal DESC;


-- 2. Comportamiento de Compra por Ciudad y Sucursal
-- Pregunta: ¿Cómo varían las ventas (en términos de ingresos totales) entre las diferentes ciudades donde se encuentran las sucursales?

SELECT City, SUM(Total) AS Ventas_total_ciudad FROM supermarket
GROUP BY City
ORDER BY Ventas_total_ciudad DESC;

-- 3. Preferencias de Producto
-- Pregunta: ¿Cuáles son las líneas de productos más vendidas?

SELECT Product_line, SUM(Quantity) AS Lineas_productos_mas_vendidas FROM supermarket
GROUP BY Product_line
ORDER BY Lineas_productos_mas_vendidas DESC;

-- 4. Preferencias de Producto
-- Pregunta: ¿Cuáles son las líneas de productos que generan más ingresos?

SELECT Product_line, SUM(Total) AS Lineas_productos_mas_ingresos FROM supermarket
GROUP BY Product_line
ORDER BY Lineas_productos_mas_ingresos DESC;

-- 5. Dinámica de Precios y Cantidad
-- Pregunta: ¿Existe alguna correlación entre el precio unitario de los productos y la cantidad vendida?

SELECT 
    AVG((Unit_price - mean_price) * (Quantity - mean_quantity)) / (STDDEV(Unit_price) * STDDEV(Quantity)) AS correlation
FROM (
    SELECT 
        AVG(Unit_price) AS mean_price,
        AVG(Quantity) AS mean_quantity
    FROM 
        supermarket
) AS averages;


-- 6. Comportamiento de los Clientes
-- Pregunta: ¿Difieren los patrones de compra entre miembros y no miembros?

SELECT Customer_type, SUM(Total) AS Ventas_por_tipo_de_cliente FROM supermarket
GROUP BY Customer_type
ORDER BY Ventas_por_tipo_de_cliente DESC;


-- 7. Comportamiento de los Clientes
-- Pregunta: ¿Difieren los patrones de compra entre géneros?

SELECT Gender, SUM(Total) AS Ventas_por_sexo FROM supermarket
GROUP BY Gender
ORDER BY Ventas_por_sexo DESC;


-- 8. Análisis Temporal de las Ventas
-- Pregunta: ¿Cómo varían las ventas a lo largo de los tres meses? ¿Hay algún patrón o tendencia visible?

SELECT Month, SUM(Total) AS Ventas_por_mes FROM supermarket
GROUP BY Month
ORDER BY Ventas_por_mes DESC;


-- 9. Métodos de Pago
-- Pregunta: ¿Qué método de pago es el más utilizado por los clientes en cada sucursal?

SELECT Payment, SUM(Total) AS Ventas_metodo_pago FROM supermarket
GROUP BY Payment
ORDER BY Ventas_metodo_pago DESC;


-- 10. Satisfacción del Cliente
-- Pregunta: ¿Cómo se relaciona la calificación de satisfacción del cliente con el volumen de ventas?

SELECT 
    AVG((Rating - mean_rating) * (Total - mean_total)) / (STDDEV(Rating) * STDDEV(Total)) AS correlation
FROM (
    SELECT 
        AVG(Rating) AS mean_rating,
        AVG(Total) AS mean_total
    FROM 
        supermarket
) AS averages;


-- 11. Satisfacción del Cliente
-- Pregunta: ¿Los productos con mayores ventas tienen mejores calificaciones?

SELECT Product_line, AVG(Rating) AS Prod_mas_rait FROM supermarket
GROUP BY Product_line
ORDER BY Prod_mas_rait DESC;

SELECT Product_line, SUM(Total) AS Prod_mas_vent FROM supermarket
GROUP BY Product_line
ORDER BY Prod_mas_vent DESC;

