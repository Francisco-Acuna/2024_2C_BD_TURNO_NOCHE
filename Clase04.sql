-- Clase 03

-- -------------------------
-- -------- Ejercicio 1
-- -------------------------


-- 1- Crear la tabla facturas dentro de la base de datos con el siguiente detalle:

-- letra		char y PK
-- numero		int y PK
-- fecha		date
-- monto		double

-- PK significa Primary Key
-- observar que se esta declarando una clave primaria compuesta
-- es decir (letra,codigo)
-- cada campo por si solo no es clave, ni tampoco identifica al registro
-- pero la suma de los dos forman la clave

use cursobd;


create table facturas(
	letra char(1), 
    numero int, 
    fecha date not null,
    monto double not null,
    primary key (letra, numero)
);

-- 2- Crear la tabla articulos dentro de la base de datos con el siguiente detalle:

-- codigo		integer y PK
-- nombre 		varchar (50)
-- precio		double
-- stock		int


create table articulos(
	codigo int primary key,
    nombre varchar(50) not null,
    precio double not null,
    stock int not null
);

-- inserción de registros
insert into clientes (nombre, apellido, cuit, direccion) values
('Juan', 'Gardoni', '23456897548', 'Medrano 162');

select * from clientes;

insert into clientes (nombre, apellido, cuit, direccion) values
('Cosme', 'Fulanito', '56897845632', 'Av. Siempre Viva 1234');
insert into clientes (nombre, apellido, cuit, direccion) values
('Esteban', 'Quito', '23563232654', 'Salta 234');
insert into clientes (nombre, apellido, cuit, direccion) values
('María', 'La del Barrio', '12334568754', 'Azul 234');
insert into clientes (nombre, apellido, cuit, direccion) values
('Mario', 'Barakus', '12345632323', null);
insert into clientes (nombre, apellido, cuit, direccion) values
('Francisco', 'El Grandioso', '23564874512', null),
('Marcelo', 'Gonzalez', '98658745214', 'Balcarce 235'),
('Marcela', 'Díaz', '28214356987', 'Boedo 32'),
('Juan Pablo', 'Picapiedra', '33666655221', 'Belgrano 365'),
('Juan', 'Fernandez', '32548745124', 'Díaz Velez 2'),
('Alfredo', 'Coto', '23566532326', 'Viamonte 5');

-- ----------------------------------------
-- Comando de recuperación select
-- ----------------------------------------

-- el * es un comodín
select * from clientes;
-- trae todos los campos de todos los registros de la tabla clientes

select nombre from clientes;
-- lista los nombres de todos los clientes

select distinct nombre from clientes;
-- lista los nombres omitiendo los duplicados

select nombre, apellido from clientes;
-- trae los nombres y apelllidos de todos los clientes

-- Operadores relacionales
/*
=	igual
!=	no igual
<>	distinto
>	mayor
<	menor
>=	mayor o igual
<=	menor o igual
*/

select * from clientes;
-- filtrado con where
select * from clientes where nombre = 'Juan';
-- trae todos los clientes cuyo nombre sea igual a Juan
select * from clientes where nombre = 'JUAN';
-- trae lo mismo que la query anterior
select * from clientes where codigo = 3;
-- trae al cliente de codigo = 3
select * from clientes where codigo > 5;
-- trae todos los registros cuyo codigo sea mayor a 5
select * from clientes where codigo < 3;
-- trae los clientes de codigo 1 y 2 si es que existiera
select * from clientes where codigo != 3;
select * from clientes where codigo <> 3;
-- trae todos los campos de todos los registros cuyo codigo no sea igual a 3
select * from clientes where codigo > 3 and codigo < 5;
-- trae todos los registros cuyo codigo sea mayor a 3 y menor 5
select * from clientes where codigo < 3 or codigo > 5;
-- trae todos los registros cuyo codigo sea menor a 3 o mayor a 5

-- valores nulos
-- NULL significa desconocido, ausencia de valor. No debe interpretarse como vacío
-- o como el 0. Los valores nulos no ocupan espacio. Hay que tener cuidado con 
-- los valores nulos en las operaciones, ya que un número multiplicado por un nulo
-- va a dar nulo como resultado.
select * from clientes;
select * from clientes where direccion = '';
select * from clientes where direccion is null;
-- cuando queremos buscar registros nullos lo hacemos con is null

-- parámetros between y not between
select * from clientes where codigo between 8 and 10;
-- trae todos los campos de todos los registros cuyo codigo esté entre 8 y 10
select * from clientes where codigo not between 8 and 10;
-- trae todos los campos de todos los registros cuyo codigo no esté entre 8 y 10
									
-- columnas calculadas
select 2 + 2 suma;
select nombre from clientes;
select nombre, 2+2 suma from clientes;	

-- parámetros IN y NOT IN
select * from clientes where codigo in (2, 5, 9);
-- trae todos los registros cuyo codigo esté entre los indicados entre paréntesis
select * from clientes where codigo=2 or codigo=5 or codigo=9;
-- esta query hace lo mismo que la anterior
select * from clientes where codigo not in (2, 5, 9);
-- trae todos los registros cuyo codigo no esté entre los indicados como parámetros
select * from clientes where codigo<>2 and codigo<>5 and codigo<>9;

select * from clientes;

-- parámetro like y operadores % y _
-- % significa cualquier cosa
-- _ significa un caracter cualquiera
select * from clientes where nombre = 'Juan';
select * from clientes where nombre like 'Juan';
-- trae lo mismo que con el =

select * from clientes where nombre like 'Juan%';
-- trae todos los clientes cuyo nombre comience con Juan

insert into clientes (nombre, apellido, cuit, direccion) values
('Manuel Juan', 'Pereyra', '77445588445', 'Bielorrusia 123');
select * from clientes where nombre like '%juan%';

select * from clientes where nombre like 'mar%';

select * from clientes where nombre like 'mari_';
								
select * from clientes where nombre like '_____';

select * from clientes where apellido like '___z';

-- parámetros ORDER BY asc desc
select * from clientes order by nombre asc;
-- lista los clientes ordenados por nombre en forma ascendente
select * from clientes order by nombre;
-- cuando es en forma ascendente no es necesario colocar el asc
select * from clientes order by nombre desc;
-- desc lo ordena en forma descendente
select * from clientes order by nombre, apellido;
-- lista los clientes ordenados por nombre en forma ascendente, en caso de encontrar duplicados, 
-- los ordena por apellido en forma ascendente
select * from clientes order by nombre, apellido desc;
-- lista los clientes ordenados por nombre en forma ascendente y por apellido en forma descendente

-- cláusula LIMIT
select * from clientes limit 5;
-- lista los primeros 5 registros
select * from clientes where nombre like '%Juan%' order by apellido desc limit 2;

-- inserción de registros con definición de campos
insert into articulos (codigo, nombre, precio, stock) values
(1, 'pollo con fritas', 15000, 8);
insert into articulos (codigo, nombre, precio, stock) values
(2, 'milanesa con ensalada', 7500, 10);
insert into articulos (codigo, nombre, precio, stock) values
(3, 'guiso de lentejas', 8000, 15);
insert into articulos (codigo, nombre, precio, stock) values
(4, 'escalope con puré', 7000, 12);
insert into articulos (codigo, nombre, precio, stock) values
(5, 'pechito de cerdo con fritas', 8000, 10);
insert into articulos (codigo, nombre, precio, stock) values
(6, 'entraña caprese con puré', 14000, 5);
insert into articulos (codigo, nombre, precio, stock) values
(7, 'filet a la romana', 12000, 13);
insert into articulos (codigo, nombre, precio, stock) values
(8, 'tequeyoyo', 500, 200);
insert into articulos (codigo, nombre, precio, stock) values
(9, 'vacío al horno con papas', 15000, 4);
insert into articulos (codigo, nombre, precio, stock) values
(10, 'asado', 20000, 6);
insert into articulos (codigo, nombre, precio, stock) values
(11, 'hamburguesa de vegetales con papas fritas', 12000, 50);
insert into articulos (codigo, nombre, precio, stock) values
(12, 'ñoquis a los 4 quesos', 7500, 12);
insert into articulos (codigo, nombre, precio, stock) values
(13, 'pizza de jamón y ananá', 45000, 2);
insert into articulos (codigo, nombre, precio, stock) values
(14, 'tarta de verduras', 6000, 20);
insert into articulos (codigo, nombre, precio, stock) values
(15, 'pollo a la mostaza con papas a la crema', 16000, 2);
insert into articulos (codigo, nombre, precio, stock) values
(16, 'sorrentinos de ricota', 12, 8);
insert into articulos (codigo, nombre, precio, stock) values
(17, 'flan con crema', 3350, 0);
insert into articulos (codigo, nombre, precio, stock) values
(18, 'matambre a la pizza con fritas', 17000, 6);

insert into articulos (precio, codigo, stock, nombre) values
(150000, 235, 0, 'helado de menta granizada');

-- inserción sin definición de campos
insert into articulos values
(29, 'sandwich de lomito con jyq en pan árabe', 189000, 10);
-- si se completan todos los campos y en el mismo orden ,no hace falta que se declaran al iniciar 

select * from articulos;
drop table proveedores;
drop table empleados;
