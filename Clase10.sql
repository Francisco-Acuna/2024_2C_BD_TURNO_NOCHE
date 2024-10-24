-- Clase10

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
-- el producto relacionado es la representación de las relaciones reales entre tablas.
-- para obtener el producto relacionado, el motor tiene que hacer el cruce interno de
-- todos los registros. Porque para obtener el producto relacionado, primero tiene que 
-- obtener el producto cartesiano y luego filtrar por la relación

-- uso de alias para las tablas 
select	c.nombre, c.apellido, f.monto, f.fecha
from 	clientes c, facturas f
where 	c.codigo=f.codigoCliente;
-- los alias sirven para identificar a las tablas y que sea más cómodo poder nombrarlas.
-- por lo general el alias es la primera letra del nombre de la tabla
-- si hubieran varias tablas que comiencen con la misma letra, se agrega la letra que sigue
-- el alias nos sirve para identificar la tabla a la que pertenece el campo al cual se
-- está haciendo referencia
-- No es obligatorio poner el nombre de la tabla ni el alias antes del nombre del campo
-- si el nombre del campo no se repite en las tablas.

select	c.nombre, c.apellido, f.monto, f.fecha
from 	clientes c, facturas f
where	c.codigo=f.codigoCliente;

select 	nombre, apellido, monto, fecha
from 	clientes, facturas
where 	codigo=codigoCliente;

select 		nombre, apellido, monto, fecha
from		clientes
INNER JOIN facturas 
on			clientes.codigo=facturas.codigoCliente;
-- /// INNER JOIN ///
/*
Un JOIN es una operación que permite combinar filas de dos o más tablas basándose en una 
condición de relación.
El JOIN que utilizamos recién se lo conoce como INNER JOIN
Une las dos tablas por medio de una columna en común.
Si encuentra coincidencias, las selecciona.
No es necesario el uso de la palabra INNER 
*/
 -- cualqiera de las 3 formas que mencionamos anteriormente son similares
 -- y causan el mismo efecto. Pero se recomienda el uso del JOIN como buena práctica.
 
 -- /// LEFT JOIN ///
 /*
 Otro JOIN que se utiliza para cruzar datos de tablas es el LEFT JOIN
 Es similar al INNER JOIN, solo que en este caso, además de las coincidencias, va a traer
 todos los valores de la tabla de la izquierda. Por más que no se crucen con la tabla
 de la derecha.
 Cuando hablamos de tablas de la derecha o de la izquierda, nos referimos a la posición
 en la que hayamos escrito el nombre de las tablas con respecto al JOIN
 */
 select 	*
 from		clientes c
 left join	facturas f
 on 		c.codigo=f.codigoCliente;
 
 -- /// RIGHT JOIN ///
/*
RIGHT JOIN es igual a LEFT JOIN, solo que en este caso, trae todos los registros de la 
tabla de la derecha
*/
select 		*
from 		clientes c
RIGHT JOIN 	facturas f
on 			c.codigo=f.codigoCliente;

insert into facturas values
('B', 3, 40, curdate(), 10000);

insert into facturas values
('B', 4, 41, current_timestamp(), 100000);
select * from facturas where letra='B' and numero=4;
select current_timestamp();
-- current_timestamp() esta función devuelve la fecha y la hora actual
-- en este caso hace un truncate de los datos, porque el campo no guarda la hora.

insert into clientes (nombre, apellido, dni, direccion) values
('Rocky', 'Balboa', '1188888822', null);
select * from clientes where nombre like '%ck%';
 
 -- /// FULL OUTER JOIN ///
 /*
 Trae todas las relaciones posibles entre las tablas, si la relación no existiera, completa
 con valores nulos.
 No existe en MySQL la cláusula FULL JOIN o FULL OUTER JOIN como tal, pero la podemos
 simular de la siguiente manera:
 */
 select			c.nombre, c.apellido, f.*
 from			clientes c
 left join		facturas f
 on				c.codigo=f.codigoCliente
 UNION
 select			c.nombre, c.apellido, f.*
 from 			clientes c
 right join		facturas f
 on 			c.codigo=f.codigoCliente;
 
 
 -- /// CROSS JOIN ///
 -- CROSS JOIN trae el producto cartesiano, es decir, todas las combinaciones posibles
 select 		c.nombre, c.apellido, f.*
 from 			clientes c
 CROSS JOIN		facturas f;
 
  drop table proveedores;
 create table proveedores(
	id int not null primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    sueldo float not null default 150000
 );
 
 insert into proveedores values
 (1, 'Juan', 'Mendez', 1000000);
 
select * from proveedores;

insert into proveedores (id, nombre, apellido) values
(2, 'Felipe', 'García');
 
 -- /// FOREIGN KEY ///
 /*
 Al trabajar con bases de datos, debemos proteger los datos para que la base quede libre
 de inconsistencias.
 Con los comandos UPDATE Y DELETE podemos perder esa integridad.
 Tenemos distintas herramientas que nos permiten asegurar la integridad de los datos:
 tipos de datos, definiciones NOT NULL, DEFAULT, CHECK, PRIMARY KEY.
 Las CONSTRAINT definen reglas en base a los valores permitidos en las columnas y son
 mecanismos standard para asegurar la integridad.
 La integridad referencial preserva las relaciones definidas entre tablas. Cuando se ingresan,
 se modifican o se borran registros.
 Se implementan con las Claves Primarias y Claves Foráneas.
 Esto nos permite evitar que se agreguen registros a una tabla relacionada con otra, si no hay 
 registros asociados en la tabla correspondiente.
 También evita que se borren registros de una tabla si existen registros relacionados en la 
 otra tabla de relación.
 Una clave foránea (FOREIGN KEY) es una restricción que cuida la integridad referencial de los
 datos entra dos tablas.
 La FOREING KEY establece la relación entre un campo o conjunto de campos con otro campo o
 conjunto de campos de otra tabla.
 Garantizan que los datos de una tabla estén correctamente relacionados con los datos de la 
 otra tabla. 
 */
 
 alter table 	facturas
 add constraint FK_facturas_codigoCliente
 foreign key	(codigoCliente)
 references		clientes(codigo);
 
 describe facturas;
 
 delete from facturas where codigoCliente in (40,41);
 
 insert into facturas values
 ('B', 7, 125, curdate(), 100); -- error porque no respeta la restricción
 
 

