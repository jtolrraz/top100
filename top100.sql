-- Desafio Top100
--1. Crear una base de datos llamada películas. (1 Punto)
CREATE DATABASE peliculas_bd
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
CREATE TABLE peliculas(
   id BIGINT NOT NULL PRIMARY KEY,
   pelicula VARCHAR(100) NOT NULL,
   anio_estreno INT NOT NULL,
   director VARCHAR(100) NOT NULL
);

CREATE TABLE reparto(
   peliculas_fk BIGINT NOT NULL,
   actor VARCHAR(100) NOT NULL,
   FOREIGN KEY (peliculas_fk) REFERENCES peliculas(id)
);

--2. Cargar ambos archivos a su tabla correspondiente. (1 Punto)

copy peliculas
FROM
   'D:\Downloads\Top_100\peliculas.csv' csv header;

copy reparto
FROM
   'D:\Downloads\Top_100\reparto.csv' csv;

-- mostrar tabla peliculas
SELECT * FROM peliculas;
-- mostrar tabla reparto
SELECT * FROM reparto;
   
--3. Obtener el ID de la película “Titanic”. (1 Punto)
SELECT id FROM peliculas WHERE pelicula='Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic". (1 Puntos)
-- del punto 3 sabemos que el id de Titanic es 2, por lo que buscamos el FK 2
SELECT * FROM reparto WHERE peliculas_fk = 2;

--5. Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)
SELECT COUNT (actor) FROM reparto WHERE actor='Harrison Ford';

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente. (1 punto)
SELECT * FROM peliculas WHERE anio_estreno BETWEEN 1990 AND 1999 ORDER BY anio_estreno ASC;

--7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”. (1 punto)
SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.(2 punto)
SELECT MAX(LENGTH(pelicula)) AS longitud_titulo_max FROM peliculas;
