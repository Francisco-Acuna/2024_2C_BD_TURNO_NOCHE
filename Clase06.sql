-- Clase 06- Ejercicios
use cursobd;
-- 1- Insertar 8 clientes con definición de campos desordenado
insert into clientes (nombre, apellido, cuit, direccion) values
('Martha', 'Perez', '22098763741', 'Esquina 8');
insert into clientes (direccion, nombre, cuit, apellido) values
('La Plata 253', 'Felipe', '20938274832', 'Cuello');
insert into clientes (direccion, cuit, apellido, nombre) values
('Plaza Flores 2387', '23873465342', 'Sanchez', 'Pedro');
insert into clientes (apellido, nombre, direccion, cuit) values
('Rica', 'Massita', 'Perú 1226', '29872367230');
insert into clientes (cuit, nombre, apellido, direccion) values
('25982387549', 'Pepe', 'Rossemblet', 'Av. Belgrano 2895') ;
insert into clientes (cuit, direccion, nombre, apellido) values
('23456789870', 'Bacacay 1231', 'Diego', 'Martinez');
insert into clientes (nombre, cuit, apellido, direccion) values
('Cristian', '30215665439', 'Lema', 'Yerbal 3293');
insert into clientes (cuit, nombre, direccion, apellido) values
('29390912939', 'Angela', 'Colon 221', 'Torres');


-- 2- Insertar 5 articulos sin definición de campos
insert into articulos values
(19, 'Panqueque alemán', 12180, 10),
(20, 'Canelones de verdura', 10530, 150),
(21, 'Risotto con crema de hongos', 17500, 5),
(22, 'Tira de asado', 22815, 320),
(23, 'Achuras', 5528, 25);

-- 3- Actualizar el nombre del cliente de codigo 10 a Jose
update clientes set nombre = 'Jose' where codigo = 10;

-- 4- Actualizar el nombre, apellido y cuit del cliente de codigo 3
-- a Pablo Fuentes 21053119875
update clientes set nombre='Pablo', apellido='Fuentes', cuit='21053119875' where codigo=3;

 -- 5- Actualizar la dirección del cliente de codigo 2 a vacío
update clientes set direccion='' where codigo=2;

-- 6- Actualizar las direcciones de los clientes de codigo 21, 23 y 26 a 'null'
update clientes set direccion=null where codigo in (21, 23, 26);
select * from clientes;

-- 7- Eliminar los clientes con apellido Perez
delete from clientes where apellido='Perez';

-- 8- Eliminar los clientes con cuit que termine en 0
delete from clientes where cuit like '%0';

-- 9- Eliminar los clientes cuyo nombre contenga un r y su apellido termine con z
delete from clientes where nombre like '%r%' and apellido like '%z';

-- 10- Aumentar un 20% los precios de los artículos que tengan precio
-- menor o igual a 500
update articulos set precio = precio * 1.20 where precio <= 500;

-- 11- Aumentar un 15% los precios de los artículos con precio mayor a 500
update articulos set precio=precio*1.15 where precio>500;

-- 12- Bajar un 5% los precios de los artículos con precio mayor a 2000 
-- pero menor a 100000
update articulos set precio = precio*0.95 where precio>2000 and precio<100000;

-- 13- Bajar el 50% del precio de los artìculos que tengan precio entre 2000 y 4000
update articulos set precio=precio*0.5 where precio between 2000 and 4000;

-- 14- Aumentar el stock a 200 a todos aquellos productos que tengan el 
-- stock mayor a 0 y hasta 150
update articulos set stock=200 where stock>0 and stock<=150;

-- 15- Eliminar los articulos con stock menor a 0
delete from articulos where stock<0;

-- 16- Eliminar todos los articulos cuyo precio sea mayor a 50.000
delete from articulos where precio > 50000;

-- &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

-- ALTER TABLE
-- modificar la estructura de una tabla

describe clientes;

-- agregar un campo
alter table clientes add edad smallint unsigned not null;

select * from clientes;

update clientes set edad=30 where codigo=10;
update clientes set edad=25;
update clientes set edad=35 where edad <> 30;

-- modificar campos
alter table clientes modify edad tinyint unsigned;

-- cambiar el nombre a un campo
alter table clientes change edad antiguedad tinyint unsigned;

-- eliminar un campo
alter table clientes drop antiguedad;

describe clientes;

-- eliminar la PK 
-- para poder eliminar la PK, el campo no puede ser auto_increment
alter table clientes drop primary key; -- error, el campo es autoincrementable
alter table clientes modify codigo int;
-- al eliminar el auto_increment ahora podemos eliminar la PK
alter table clientes drop primary key; 

-- agregar la PK
alter table clientes add primary key(codigo);

-- vuelvo a agregar la condición de auto_increment a la PK
alter table clientes modify codigo int auto_increment;

-- renombrar tablas
rename table clientes to auxiliar, facturas to auxilar2;
show tables;
rename table auxiliar to clientes, auxilar2 to facturas;

alter table clientes add edad smallint unsigned not null after nombre;
describe clientes;
alter table clientes drop edad;

-- ----------------------------------------------
-- ----------------------------------------------

describe facturas;

insert into facturas values
('A', 1, '2024-09-24', 15000);
select * from facturas;

insert into facturas values
('J', 2, curdate(), 20000);

drop table facturas;

create table facturas(
	letra char(1),
    numero int,
    fecha date not null,
    monto double not null,
    primary key (letra, numero),
    check (letra in('A', 'B', 'C', 'E', 'M'))
);

insert into facturas values
('B', 1, curdate(), 15000);

INSERT INTO facturas (letra, numero, fecha, monto) VALUES
('A', 11, '2023-01-01', 1500.50),
('A', 2, '2023-01-02', 2500.75),
('A', 3, '2023-01-03', 3200.00),
('A', 4, '2023-01-04', 1800.25),
('A', 5, '2023-01-05', 2100.00),
('B', 11, '2023-02-01', 3000.00),
('B', 2, '2023-02-02', 1200.50),
('B', 3, '2023-02-03', 4500.00),
('B', 4, '2023-02-04', 500.00),
('B', 5, '2023-02-05', 600.75),
('C', 1, '2023-03-01', 700.00),
('C', 2, '2023-03-02', 2200.50),
('C', 3, '2023-03-03', 3500.25),
('C', 4, '2023-03-04', 4300.00),
('C', 5, '2023-03-05', 1200.00),
('E', 1, '2023-04-01', 800.00),
('E', 2, '2023-04-02', 990.99),
('E', 3, '2023-04-03', 2100.10),
('E', 4, '2023-04-04', 3300.00),
('E', 5, '2023-04-05', 1450.00),
('M', 1, '2023-05-01', 500.00),
('M', 2, '2023-05-02', 750.25),
('M', 3, '2023-05-03', 1000.00),
('M', 4, '2023-05-04', 1250.75),
('M', 5, '2023-05-05', 2000.50),
('A', 6, '2023-06-01', 3200.00),
('A', 7, '2023-06-02', 1900.00),
('B', 6, '2023-07-01', 4500.00),
('B', 7, '2023-07-02', 2600.50),
('C', 6, '2023-08-01', 3000.00),
('C', 7, '2023-08-02', 2800.75),
('E', 6, '2023-09-01', 1900.00),
('E', 7, '2023-09-02', 3700.00),
('M', 6, '2023-10-01', 2150.25),
('M', 7, '2023-10-02', 1600.00);


-- ----------------------------------
-- FUNCIONES DE AGRUPAMIENTO
-- ----------------------------------

-- Las funciones de agrupamiento devuelven un solo registro como resultado.

-- la función MAX trabaja con números, textos y fechas
-- MAX con números:
select max(monto) from facturas;
-- trae el máximo monto facturado
select monto from facturas order by monto desc limit 1;
-- esta query realiza lo mismo
select max(monto) maximo_monto_facturado from facturas;
select max(monto) maximo_monto_facturado from facturas where letra='C';

-- MAX con texto
select max(nombre) from clientes;
-- trae el máximo nombre teniendo en cuenta el orden alfabético

-- MAX con fechas
select max(fecha) from facturas;
-- trae la fecha de mayor  orden cronológico que encuentre


-- la función MIN trabaja con números, textos y fechas
-- MIN con números:
select min(monto) from facturas;
-- trae el mínimo monto facturado
select monto from facturas order by monto limit 1;
-- esta query realiza lo mismo
select min(monto) minimo_monto_facturado from facturas;
select min(monto) minimo_monto_facturado from facturas where letra='C';

-- MIN con texto
select min(nombre) from clientes;
-- trae el mínimo nombre teniendo en cuenta el orden alfabético, o sea, el primero

-- MIN con fechas
select min(fecha) from facturas;
-- trae la fecha de menor orden cronológico que encuentre








