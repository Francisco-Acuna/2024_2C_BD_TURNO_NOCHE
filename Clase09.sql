-- Clase09
use cursobd;
-- Basándose en la tabla articulos, realizar los siguientes puntos:
-- 1) Agregar a la tabla articulos, los campos stockMinimo y stockMaximo.
describe articulos;
alter table articulos add stockMinimo smallint not null, add stockMaximo smallint not null;

-- 2) Completar en los registros los valores de los campos stockMinimo y stockMaximo
-- 	teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
select * from articulos;
update articulos set stockMinimo=10, stockMaximo=100;

-- 3) Listar los articulos que se deben reponer y qué cantidad se debe reponer de cada artículo.
-- Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad
-- de articulos a reponer es stockMaximo - stock.

select 		nombre, 
			(stockMaximo-stock)  "cantidad a reponer" 
from 		articulos 
where 		stock < stockMinimo;

-- 4) Calcular el valor de venta de toda la mercaderia que hay en stock.
select sum(stock * precio) valor_venta_total from articulos;

-- 5) Calcular el valor de venta + IVA de toda la mercaderia que hay en stock.
select round(sum(stock * precio * 1.21),2) suma_IVA from articulos;

drop database if exists intro;
create database intro;
use intro;
create table autos(
    codigo int primary key,
    marca varchar(255),
    modelo varchar(255),
    color varchar(255),
    anio int,
    precio double
);

select * from autos;

rename table auto to autos;

-- 2. Cargar la tabla con 20 autos
-- los autos fueron cargados con IA

 -- 3. Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) precio_maximo from autos;

-- 	b. obtener el precio mínimo.
select min(precio) precio_minimo from autos;

-- 	c. obtener el precio mínimo entre los años 2010 y 2020.
select min(precio) precio_minimo from autos where anio between 2010 and 2020;

-- 	d. obtener el precio promedio.
select avg(precio) precio_promedio from autos;


-- 	e. obtener el precio promedio del año 2024.
select round(avg(precio),2) precio_promedio from autos where anio=2024;

-- 	f. obtener la cantidad de autos.
select count(*) from autos;

-- 	g. obtener la cantidad de autos que tienen un precio entre $30.500.000 y $40.000.000
select count(*) cantidad_de_autos from autos where precio between 30500000 and 40000000;

-- 	h. obtener la cantidad de autos que hay en cada año.
select anio, count(*) cantidad_de_autos from autos group by anio;

-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select anio, count(*) cantidad_autos, avg(precio) precio_promedio from autos group by anio;

-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca, sum(precio) suma_total, avg(precio) promedio from autos group by marca;

--  	k. informar los autos con el menor precio.
select min(precio) from autos; -- este es el precio mínimo
select * from autos where precio=(select min(precio) from autos);

--  	l. informar los autos con el menor precio entre los años 2014 y 2023
select 		* 
from 		autos 
where 		precio=(select min(precio) from autos where anio between 2014 and 2023) 
and 		anio between 2014 and 2023;

--  m. listar los autos ordenados ascendentemente por marca, modelo, y el año en forma descendente.
select * from autos order by marca, modelo, anio desc;

-- n. contar cuantos autos hay de cada marca.
select marca, count(*) from autos group by marca;

-- 	o. borrar los autos del siglo pasado.
delete from autos where anio < 2000;

-- ---------------------------------------------------------------
-- COMBINACION DE CONSULTAS
-- ---------------------------------------------------------------

/*
Para comparar los resultados de varias consultas y combinarlas en un único resultado,
existe el operador UNION.
Para que funcione correctamente, tenemos que tener en cuenta:
-- en cada resultado tiene que haber la misma cantidad de campos
-- los campos tienen que tener el mismo tipo de dato
-- las primeras consultas se escriben sin el punto y coma
-- los registros duplicados se eliminan
-- si queremos conservar los registros duplicados, debemos utilizar el operador UNION ALL
*/

-- supongamos que tenemos 2 tablas que representan hombres y mujeres
-- una tabla para hombres y otra para mujeres
-- en cada tabla guardamos el nombre, la provincia y la edad
drop table hombres;
create table hombres(
	nombre varchar(50) not null,
    provincia varchar(50) not null,
    edad int not null
);

drop table mujeres;
create table mujeres(
	nombre varchar(50) not null,
    provincia varchar(50) not null,
    edad int not null
);

insert into hombres values
('Juan', 'Buenos Aires', 32),
('Mariano', 'Córdoba', 24),
('Luis', 'Mendoza', 40),
('Cris', 'Mendoza', 20),
('Raul', 'San Juan', 35);

insert into mujeres values
('Malena', 'Catamarca', 22),
('Luisa', 'Formosa', 30),
('Cris', 'Buenos Aires', 61),
('Alejandra', 'Córdoba', 19),
('Mariela', 'Misiones', 50);

-- obtener el listado de todos 
select * from hombres
UNION
select * from mujeres;

-- obtener el listado de todos los nombres
select nombre from hombres
UNION
select nombre from mujeres;

-- obtener el listado de todos los nombres con los duplicados
select nombre from hombres
UNION ALL
select nombre from mujeres;

-- obtener todos los nombres de quienes sean de la provincia de Córdoba
select nombre from hombres where provincia='Córdoba'
UNION
select nombre from mujeres where provincia='Córdoba';

-- obtener los nombres de los hombres que sean de Córdoba y de las mujeres de Misiones
select nombre from hombres where provincia='Córdoba'
UNION
select nombre from mujeres where provincia='Misiones';

-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
Workbench permite armar gráficas sobre las bases de datos.
Trae incorporado un graficador que nos permite realizar la gráfica de la base.
Mediante un proceso que se conoce como ingeniería reversa, se analiza la base de datos existente
y se arma la representación visual de la estructura.
Esto es muy útil al momento de tener una documentación de la base de datos, un análisis de funcionamiento,
para ver posibles fallas, errores, para generar una optmización de rendimiento, incluso para realizar
mejoras, modificaciones o una nueva base que suplante la actual.

A esta diagrama se lo conoce como DER (Diagrama de Entidad Relacional) o en inglés ERD (Entity 
Relationship Diagram).
Es la representación gráfica de la estructura de la base de datos que muestra las entidades, los
atributos y las relaciones.

Hay 3 conceptos claves que figuran en un DER
1. entidades: son las representaciones de los objetos o conceptos del mundo real.
				Ej. clientes, facturas, articulos, etc. Es decir, las tablas.
2- atributos: son las características o propiedades de las entidades.
				Ej. nombre, apellido, monto, stock, etc. Es decir, los campos
3- relaciones: Son las relaciones entre tablas. Es decir, cómo se relacionan las tablas entre sí.
				Ej. una factura pertenece a un cliente.
*/

drop database negociovespertino;
drop database negocio_noche;
create database negocio_noche;
use negocio_noche;

create table clientes(
	codigo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char(8) not null,
    direccion varchar(100),
    primary key (codigo)
);

create table facturas(
	letra char(1),
    numero int,
    codigoCliente int not null,
    fecha date not null,
    monto double not null,
    check(letra in ('A','B','C', 'M')),
    primary key (letra,numero)
);

insert into clientes (nombre, apellido, dni, direccion) values
('Juan', 'Perez', '22222222', 'La Paz 2042'),
('Marcelo', 'Lopez', '33333333', 'Independencia 124'),
('Julia', 'Gonzalez', '44444444', 'Larrea 2587'),
('Violeta', 'Gutierrez', '55555555', 'Belgrano 89'),
('Victor', 'Espíndola', '66666666', 'Soler 5341'),
('Mario', 'Ramos', '77777777', 'Independencia 683'),
('Troy', 'McKlure', '88888888', 'Salta 54'),
('Cosme', 'Fulanito', '99999999', 'Navarra 44'),
('Mariana', 'Flores', '10101010', 'Italia 354'),
('Carlos', 'Ríos', '11111111', 'Medrano 162');

insert into facturas values
('A', 1, 1, '2023-11-07', 777000),
('A', 2, 2, '2023-10-12', 125000),
('B', 1, 1, '2023-11-08', 550000),
('C', 1, 5, curdate(), 25000),
('C', 2, 8, curdate(), 258000),
('A', 3, 6, '2023-05-12', 548000),
('A', 4, 10, '2022-10-25', 98000),
('B', 2, 1, curdate(), 987000),
('C', 3, 4, '1990-06-21', 12000),
('C', 4, 8, curdate(), 78000);

-- el producto cartesiano es la unión de todos los registros
-- por lo que va a traer las relaciones de todos con todos
select * from clientes; -- 10
select * from facturas; -- 10
select * from clientes, facturas; -- 100

-- para obtener el producto relacionado
select * from clientes, facturas where clientes.codigo=facturas.codigoCliente;




