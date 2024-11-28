-- Clase14

-- Crear la base de datos biblioteca de acuerdo al siguiente esquema:

-- -------------    -------------------     -------------     
-- - libros    -    - prestamos       -     - socios    -    
-- -------------    -------------------     -------------     
-- - codigo PK -    - documento   PK FK -     - documento  PK -
-- - titulo    -    - codigo_libro PK FK -     - nombre    -
-- - autor     -    - fecha_prestamo   -       - domicilio -
-- -------------    - fecha_devolucion -     -------------
--                  -------------------                

drop database if exists biblioteca;
create database biblioteca;
use biblioteca;

create table libros(
	codigo int auto_increment primary key,
    titulo varchar(50) not null,
    autor varchar(50) not null
);

create table socios(
	documento char(8),
    nombre varchar(100) not null,
    domicilio varchar(150) not null,
    primary key(documento)
);

create table prestamos(
	documento char(8),
    codigo_libro int,
    fecha_prestamo date not null,
    fecha_devolucion date,
    primary key(documento, codigo_libro)
);

alter table prestamos add constraint FK_prestamos_libros
foreign key (codigo_libro) references libros(codigo);

alter table prestamos add constraint FK_prestamos_socios
foreign key (documento) references socios(documento);

insert into libros (titulo, autor) values
('Cien años de soledad', 'Gabriel García Márquez'),
('Don Quijote de la Mancha', 'Miguel de Cervantes'),
('El amor en los tiempos del cólera', 'Gabriel García Márquez'),
('1984', 'George Orwell'),
('La sombra del viento', 'Carlos Ruiz Zafón'),
('La casa de los espíritus', 'Isabel Allende'),
('Fahrenheit 451', 'Ray Bradbury'),
('Harry Potter y la piedra filosofal', 'J.K. Rowling'),
('Los juegos del hambre', 'Suzanne Collins'),
('Crónica de una muerte anunciada', 'Gabriel García Márquez'),
('El alquimista', 'Paulo Coelho'),
('Orgullo y prejuicio', 'Jane Austen'),
('La tregua', 'Mario Benedetti'),
('El viejo y el mar', 'Ernest Hemingway'),
('La metamorfosis', 'Franz Kafka');


insert into socios (documento, nombre, domicilio) values
('12345678', 'Juan Pérez', 'Av. Libertador 1000, Buenos Aires'),
('23456789', 'Ana Gómez', 'Calle Ficticia 123, Rosario'),
('34567890', 'Carlos Martínez', 'Calle del Sol 456, Córdoba'),
('45678901', 'María Rodríguez', 'Calle Luna 789, Mendoza'),
('56789012', 'Luis Fernández', 'Av. Rivadavia 321, Buenos Aires'),
('67890123', 'Sofía López', 'Calle Mármol 234, La Plata'),
('78901234', 'Pedro González', 'Av. Santa Fe 567, Santa Fe'),
('89012345', 'Claudia Díaz', 'Calle Primavera 678, Bahía Blanca'),
('90123456', 'Javier Sánchez', 'Av. 9 de Julio 123, Tucumán'),
('01234567', 'Verónica Torres', 'Calle del Río 345, Rosario'),
('23456780', 'Raúl Jiménez', 'Calle del Norte 432, Salta'),
('34567891', 'Marta Pérez', 'Calle Verde 234, San Juan'),
('45678902', 'Patricia Ruiz', 'Av. San Martín 876, Mar del Plata'),
('56789013', 'Felipe Suárez', 'Calle Azul 765, Mendoza'),
('67890124', 'Carla Martínez', 'Calle Nueva 890, Paraná');


insert into prestamos (documento, codigo_libro, fecha_prestamo, fecha_devolucion) values
('12345678', 1, '2024-11-01', '2024-11-15'),
('23456789', 2, '2024-11-05', '2024-11-20'),
('34567890', 3, '2024-11-10', '2024-11-25'),
('45678901', 4, '2024-11-12', '2024-11-26'),
('56789012', 5, '2024-11-14', '2024-11-28'),
('67890123', 6, '2024-11-15', '2024-11-29'),
('78901234', 7, '2024-11-16', '2024-11-30'),
('89012345', 8, '2024-11-18', '2024-12-02'),
('90123456', 9, '2024-11-20', '2024-12-04'),
('01234567', 10, '2024-11-22', '2024-12-06'),
('23456780', 11, '2024-11-25', '2024-12-09'),
('34567891', 12, '2024-11-26', '2024-12-10'),
('45678902', 13, '2024-11-28', '2024-12-12'),
('56789013', 14, '2024-11-29', '2024-12-13'),
('67890124', 15, '2024-11-30', '2024-12-14');


-- 1- qué libros (codigo, titulo, autor) se le prestaron a cada socio?
select 	*
from 		libros l
join		prestamos p on l.codigo=p.codigo_libro
join		socios s on s.documento=p.documento
order by	codigo;

-- 2- Listar los socios (documento, nombre, domicilio) a los que se les prestaron libros de Java
select 	s.*
from 	socios s
join	prestamos p on s.documento=p.documento
join 	libros l on l.codigo=p.codigo_libro
where	l.titulo like '%java%';

-- 3- Listar los libros (codigo,titulo,autor) que no fueron devueltos 




