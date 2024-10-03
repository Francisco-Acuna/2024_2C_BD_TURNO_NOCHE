-- Clase 07

-- AVG average (promedio) trabaja con números
select avg(monto) from facturas;
-- trae el monto promedio de la tabla facturas

select avg(monto) promedio from facturas;
-- agregamos un alias al campo del promedio

select avg(monto) promedio from facturas where letra='A';
-- trae el promedio de las facturas cuya letra sea 'A'

select round(avg(monto),2) promedio from facturas;

-- función SUM
-- trabaja con números
select sum(monto) suma_total from facturas;
select round(sum(monto),2) suma_total from facturas;

-- COUNT
select count(*) from facturas;
-- trae la cantidad de registros de facturas;
select count(*) from clientes;
-- trae la cantidad total de registros que tiene la tabla clientes
select count(direccion) from clientes;
-- trae la cantidad de registros que hay en la tabla clientes con direccion nula
select * from clientes where direccion is null;
-- chequeamos cuáles son los clientes que tienen direccion nula


-- Agrupamiento en MySQL
select distinct(letra) from facturas;
select letra, count(*) total, sum(monto) suma_total from facturas where letra='A';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='B';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='C';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='E';
select letra, count(*) total, sum(monto) suma_total from facturas where letra='M';

-- GROUP BY
-- devuelve un registro por cada valor del campo agrupado
-- debe ir como primer campo el campo por el cual agrupamos.
select 		letra, 
			count(*) total, 
            sum(monto) suma_total 
from 		facturas 
group by 	letra;

-- uso de having, se utiliza para filtrar campos agrupados
select 		letra,
			count(*) total,
			sum(monto) suma_total
from 		facturas
group by 	letra
having 		sum(monto) > 100000;

delete from facturas where numero=222222;

-- SUBQUERIES
-- son consultas dentro de consultas
select max(monto) from facturas; -- me devuelve 15000
select * from facturas where monto = (select max(monto) from facturas);
-- trae trodos los campos, de todos los registros de la tabla facturas, cuyo monto
-- sea igual al monto máximo facturado.
select * from facturas where fecha = (select min(fecha) from facturas);
-- trae las facturas cuya fecha sea la mínima encontrada


