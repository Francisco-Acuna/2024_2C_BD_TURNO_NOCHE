-- Clase 05

-- Ejercicios

-- Basándose en la tabla articulos, obtener:

-- 1- articulos con precio mayor a 10000
select * from articulos where precio > 10000;

-- 2- articulos con precio entre 5000 y 12000 (usar > y <)
select * from articulos where precio > 4999 and precio < 12001;

-- 3- articulos con precio entre 5000 y 12000 (usar BETWEEN)
select * from articulos where precio between 5000 and 12000;

-- 4- articulos con precio = 14000 y stock mayor a 3
select * from articulos where precio = 14000 and stock > 3;

-- 5- articulos con precio (8000, 500, 45000) no usar IN
select * from articulos where precio=8000 or precio=500 or precio=45000;

-- 6- articulos con precio (8000, 500, 45000) usar IN
select * from articulos where precio in (8000, 500, 45000);
						
-- 7- articulos cuyo precio no sea (12000, 14000, 16000)
select * from articulos where precio not in (12000, 14000, 16000);

-- 8- articulos ordenados por precio de mayor a menor, si hubiera precios iguales,
-- ordenarlos por nombre
select * from articulos order by precio desc, nombre;

-- 9- todos los articulos, incluyendo una columna denominada "precio con IVA", la cual
-- deberá tener el monto con el IVA del producto
select *, precio * 1.21 'precio con IVA' from articulos;
select *, (precio/100*21) + precio as precio_con_IVA from articulos;
select *, precio * 1.21 as precio_con_IVA from articulos;
select nombre, precio, precio * 1.21 'precio con IVA' from articulos;

-- 10- todos los articulos, incluyendo una columna denominada "cantidad de cuotas" y 
-- otra "valor de cuota", la cantidad es fija y es 3, el valor de la cuota corresponde
-- a 1/3 del monto con un 5% de interés
select *,  3 'cantidad de cuotas', precio*1.05 / 3 'valor de cuota' from articulos;

-- 11- todos los artículos cuyo nombre termine con a y tenga 21 letras
select * from articulos where nombre like '____________________a';

-- 12- todos los artículos cuyo nombre contenga al menos dos 's'
select * from articulos where nombre like '%s%s%';

-- 13- todos los artículos cuyo nombre esté compuesto con al menos cuatro palabras
select * from articulos where nombre like '% % % %';

-- 14- los primeros 5 artículos ordenados por precio en forma descendente
select * from articulos order by precio desc limit 5;

-- 15- los 2 primeros artículos luego del segundo registro ordenado por stock
select * from articulos order by stock limit 2,2;

select * from clientes;
select * from clientes limit 2,4;
select * from clientes order by apellido;
select * from clientes order by apellido limit 3,7;
-- cuando al limit le ponemos 2 parámetros, el primero indica luego de qué cantidad de registros
-- se listarán la cantidad de registros que indique el segundo parámetro


-- ##################################################################################

-- creamos una tabla con 2 campos
create table amigos(
	nombre varchar(50),
    apellido varchar(50)
);

-- cargar registros utilizando otra tabla
insert into amigos select nombre, apellido from clientes;

select * from amigos;

-- crear una tabla a partir de la información de otra tabla
create table nombres select distinct nombre from clientes;

select * from nombres;

-- copia de una tabla
create table clientes2 select * from clientes;
select * from clientes2;

-- copiamos la estructura de una tabla pero sin los registros
create table clientes3 select * from clientes limit 0;
select * from clientes3;
describe clientes3;

-- Tablas temporales
-- son tablas alojadas en RAM y desaparecen al cortar la conexión con el servidor
-- se la utiliza para obtener consultas muy veloces para datos temporarios
create temporary table copia select * from clientes;
select * from copia;
show tables;

-- -------------------------------------------------------------------------------

-- Comando de eliminación delete
select * from clientes;
delete from clientes where codigo=10;
delete from clientes where direccion like '%rusia%';
delete from clientes where codigo > 8;
delete from clientes where nombre like 'mar%';
delete from clientes;


-- el editor de mysql Workbench trae configurado por defaul una protección para evitar ejecutar
-- comandos de borrado o actualización masiva. Hay que desactivarla desde el menú preferencias
-- otra manera de desactivarla es mediante código sql:
set sql_safe_updates = 0; -- desactiva la protección de seguridad
set sql_safe_updates = 1; -- activa la protección de seguridad

select * from clientes;
insert into clientes select * from clientes2;
delete from clientes;
-- delete elimina todos los registros de la tabla uno por uno
insert into clientes (nombre, apellido, cuit, direccion) values
('Marcelo', 'Gomez', '22556655112', null);

truncate table clientes;
-- el comando truncate también elimina toda la tabla, pero de una sola vez, no registro 
-- por registro como el delete. Por lo tanto es más veloz.
-- Este comando reinicia la secuencia del auto incrementable

-- comando update 
-- el comando update se utiliza para actualizar registros
select * from clientes;
update clientes set apellido='Menganito' where codigo=7; 
update clientes set nombre='Pablo' where apellido='Picapiedra';
update clientes set nombre='Martín', apellido='Cito', direccion='Medrano 162' where codigo=12;

