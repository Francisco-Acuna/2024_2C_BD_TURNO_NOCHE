-- Clase 02
select 'Hola Mundo!';
select 2 + 2;
select 2 + 2 as 'suma'; -- agrego alias a la consulta
select 2 + 2 suma; -- no es obligatorio el uso del as ni de las comillas
-- siempre y cuando la palabra no tenga espacios
select 2 + 2 'resultado de la suma';
select 2 + 2 resultado_de_la_suma; -- utilizamos snake_case

-- algunos ejemplos para trabajar con fecha y hora
select curdate();
-- devuelve la fecha actual

select curtime();
-- devuelve la hora actual

select sysdate();
-- devuelve la fecha y la hora actual

-- -------------------------------
-- Cómo crear una base de datos
-- -------------------------------

show databases;
-- lista las bases de datos del servidor

SHOW DATABASES;
-- se pueden escribir los comandos en mayúscula
-- el lenguaje es NO CASE SENSITIVE

-- el ; es el terminador de instrucciones

drop database cursobd;
-- elimina la base de datos cursobd
-- este comando da error si la base de datos no existiera previamente

drop database if exists cursobd;
-- elimina la base de datos cursobd si es que existe

create database cursobd;
-- crea la base de datos cursobd

create database if not exists cursobd;
-- crea la base de datos cursobd si es que no existe

/*
Los objetos creados en Windows no diferencian mayúsculas de minúsculas.
Los objetos creados en un entorno de Linux o Unix sí distinguen las
mayúsculas y minúsculas.
Ejemplo:
create database administracion;
create database ADMINISTRACION;
En windows, sería la misma base.
Pero en Linux, estaríamos hablando de 2 bases distintas.
*/

use cursobd;
-- se posiciona sobre la base de datos
-- este comando es muy importante porque nos hace entrar a la base
-- para poder luego ejecutar los comandos.

show tables;
-- lista las tablas de la base de datos

-- -----------------------------------
-- Cómo crear una tabla en MySQL
-- -----------------------------------

create table clientes(
	codigo int auto_increment,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    cuit char(11) not null,
    direccion varchar(50),
    primary key (codigo)
);

-- La anterior es una sola instrucción por más que sean varias líneas
-- primary key significa llave o clave primaria, identifica como 
-- único a un registro de la tabla.
-- La cláusula auto_increment permite que el contenido del campo sea
-- auto incrementable, se ingresa automáticamente en forma autonumerada
-- esa instrucción es solo aplicable a la PK
-- la cláusula NOT NULL indica que ese campo es de ingreso obligatorio
-- y no puede ser omitido.

show tables;

describe clientes;
-- muestra la estructura de una tabla, es decir, el detalle de sus
-- campos

drop table clientes;
-- elimina la tabla clientes

drop table if exists clientes;
-- elimina la tabla si es que existe

create table if not exists clientes(
	codigo int auto_increment,
    nombre varchar(30) not null,
    apellido varchar(30) not null,
    cuit char(11) not null,
    direccion varchar(50),
    primary key (codigo)
);
