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
									
									
