-- -------------------------------------------
-- Curso Base de Datos con MySQL
-- Centro de Formación Profesional Nro. 8
-- Profesor: Francisco Acuña
-- Cursada: miércoles de 18.30 a 22.20
-- -------------------------------------------

-- comentarios

-- comentarios en línea
-- es necesario dejar un espacio en blanco antes de escribir

/*
esto es
un bloque
de comentarios
*/

# comentario en línea NO ANSI
# solo sirve para MySQL

-- SQL -> Structured Query Language (Lenguaje de Consulta Estructurada)

/*
DDL: Data Definition Language (Lenguaje de Definición de Datos)
- CREATE
- ALTER
- DROP
*/

/*
DML: Data Manipulation Language (Lenguaje de Manipulación de Datos)
- SELECT
- INSERT
- DELETE
- UPDATE
*/

-- ------------------------------------
-- Tipos de datos más comunes en MySQL
-- ------------------------------------

/*
Tipos de datos de texto más utilizados.
CHAR -> este tipo de dato lo utilizamos cuando sabemos de antemano, cuántos caracteres
se van a guardar.
Ej. Si declaramos un tipo de dato CHAR de 20 posiciones
nombre CHAR(20)
siempre va a estar utilizando 20 bytes para guardar el dato
|--------------------| -> 20 bytes
|maximiliano---------| -> 20 bytes
|carlos--------------| -> 20 bytes
|ana-----------------| -> 20 bytes

VARCHAR -> este tipo de dato lo utilizamos cuando no sabemos de antemano cuántos caracteres
se van a guardar.
Ej. si declaramos un tipo VARCHAR de 20 posiciones
nombre VARCHAR(20)
|--------------------| -> 20 bytes
|maximiliano---------| -> 11 + 1 bytes
|carlos--------------| -> 6 + 1 bytes
|ana-----------------| -> 3 + 1 bytes
*/

/*
Tipos de datos numéricos

BIT o BOOL 
representa un entero que a su vez representa un valor de verdad.
Sirve para guardar valores lógicos.
El 0 representa el valor falso.
Y cualquier otro número representa el valor de verdad.

TINYINT almacena un entero de 1 byte
|--------|--------|
-128	 0 		 127

TINYINT unsigned
|--------|--------|
0				  255

SMALLINT signed
|--------|--------|
-32.768  0       32.767

SMALLINT unsigned
|--------|--------|
0				65.535

INT signed
|--------|--------|
-2.147.483.648   2.147.483.647

INT unsigned
|--------|--------|
0			4.294.967.295

BIGINT es el valor numérico más grande (64 bits)

FLOAT (son decimales de 32 bits)
almacena hasta 8 dígitos
por ejemplo si quisiera hacer 
10 / 3
3.333333 (el . se considera un dígito más)

100 / 3
33.33333 

DOUBLE (son decimales de 64 bits)
almacena 17 dígitos (esto puede variar según varios factores)

DECIMAL
representa números decimales de precisión fija. Es una precisión exacta.
La estructura es:
DECIMAL(m,n)
en donde m es la cantidad de dígitos que tendrá el número en total
y n es la cantidad de dígitos que se utilizarán para representar la parte decimal

Ej,
DECIMAL(10,2)
xxxxxxxx.xx en este caso el punto no se considera un dígito más
el mayor número que podría representar sería
99999999.99
*/

/*
Tipos de dato de fecha y hora

DATE 
ocupa 3 bytes y almacena una fecha (por defecto es YYYY-MM-DD)
por ejemplo '2024-08-14'

TIME
ocupa 3 bytes y guarda la hora
formato es HH:MM:SS

DATETIME
ocupa 8 bytes almacena la fecha y la hora
formato YYYY-MM-DD HH-MM-SS

YEAR
(no es un standard)
ocupa 1 solo byte y almacena los valores de años. Puede ser con 2 o 4 dígitos.
*/

/*
Comando select
*/
-- el comando SELECT sirve para traer registros de una tabla
-- pero también podemos utilizarlo para imprimir mensajes por pantalla
select 'Hola Mundo!';









