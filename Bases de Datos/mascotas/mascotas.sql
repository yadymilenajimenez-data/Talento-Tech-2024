CREATE TABLE tb_pet(
    id int AUTO_INCREMENT primary key,
    code varchar(3) not null,
    name varchar(50) not null,
    born_year int not null,
    color varchar(20) not null,    
    healthStatus varchar(15) not null

);

CREATE TABLE tb_pet( id int AUTO_INCREMENT primary key, code varchar(3) not null, name varchar(50) not null, born_year int not null, color varchar(20) not null, healthStatus varchar(15) not null );


CREATE TABLE tb_cat(
    id_cat int AUTO_INCREMENT PRIMARY KEY,
    breed varchar(30) NOT null,
    id_pet int not null,
    foreign KEY (id_pet) REFERENCES tb_pet(id)
);

CREATE TABLE tb_cat( id_cat int AUTO_INCREMENT PRIMARY KEY, breed varchar(30) NOT null, id_pet int not null, foreign KEY (id_pet) REFERENCES tb_pet(id) );

CREATE TABLE tb_dog(
    id_dog int AUTO_INCREMENT PRIMARY KEY,
    breed varchar(30) NOT null,
    pedigree boolean NOT null default 0,
    id_pet int not null,
    foreign KEY (id_pet) REFERENCES tb_pet(id)
);

CREATE TABLE tb_dog( id_dog int AUTO_INCREMENT PRIMARY KEY, breed varchar(30) NOT null, pedigree boolean NOT null default 0, id_pet int not null, foreign KEY (id_pet) REFERENCES tb_pet(id) );

CRUD:
*Primera operación del CRUD (CREATE que en SQL es INSERT): crear un registro

Plantillas de phpMyAdmin:

INSERT INTO tb_pet(code, name, born_year, color, healthStatus) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]')

INSERT INTO `tb_pet`(`id`, `code`, `name`, `born_year`, `color`, `healthStatus`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]')

INSERT INTO `tb_dog`(`id_dog`, `breed`, `pedigree`, `id_pet`) VALUES ('[value-1]','[value-2]','[value-3]','[value-4]')

INSERT INTO `tb_cat`(`id_cat`, `breed`, `id_pet`) VALUES ('[value-1]','[value-2]','[value-3]')

Ejemplos del CRUD en Mascota:

INSERT INTO tabla_x (col1,col2,...) VALUES (val1,val2,...)

INSERT INTO tb_pet(code, name, born_year, color, healthStatus) VALUES ('001', "Firulais", 2015, "blanco", 'sano')
INSERT INTO tb_pet(code, name, born_year, color, healthStatus) VALUES ('002', "Paco", 2016, "negro", 'enefermo')
INSERT INTO tb_pet(code, name, born_year, color, healthStatus) VALUES ('003', "Violet", 2020, "black", 'In dsurgery')
INSERT INTO tb_pet(code, name, born_year, color, healthStatus) VALUES ('004', "Chepo", 2015, "brown", 'healthy')

*Segunda operación del CRUD (READ que en SQL es SELECT): buscar un registro

SELECT * FROM tabla_x WHERE criterio_busqueda

SELECT * FROM `tb_pet` WHERE name='Firulais' 
SELECT * FROM tb_pet WHERE born_year=2016 

Ejemplo en la tabla mascota:
El criterio de búsqueda que definimos en la GUI es el code:

SELECT * FROM tb_pet WHERE code='002' 




*Tercera operación del CRUD (UPDATE que es en SQL es UPDATE): actualizar un registro

UPDATE `tb_pet` SET `id`='[value-1]',`code`='[value-2]',`name`='[value-3]',`born_year`='[value-4]',`color`='[value-5]',`healthStatus`='[value-6]' WHERE 1

UPDATE tb_pet SET code=,name=,born_year=,color=,healthStatus=  WHERE 

UPDATE tabla_x SET name=,born_year=,color=,healthStatus= WHERE code=

Ejemplo en la tabla mascota:
UPDATE tb_pet SET healthStatus='ENFERMO' WHERE code='002'



*Cuarta operación del CRUD (DELETE que es en SQL es DELETE): borrar un registro

DELETE FROM `tb_pet` WHERE code='001'
DELETE FROM `tb_pet` WHERE code='002'


EJERCICIO EN CLASE: practicar haciendo CRUD con Mascotas 
1. 10 registros de mascotas (pensar de antemanon los nombres de 5 perros y 5 gatos): 
2. 5 perros específicos-raza/pedigree/id_pet 
3. 5 gatos específicos-raza/id_pet
4. Investigar cómo visualizar en una sola tabla la información completa de cada perro y cada gato
5. Presentar los resultados compartiendo pantalla (voluntarios)



COMPLEMENTEMOS CON LAS TABLAS PERRO Y GATO:
INSERT INTO `tb_dog`(`breed`, `pedigree`, `id_pet`) VALUES ("Criollo",0,3)
INSERT INTO `tb_dog`(`breed`, `pedigree`, `id_pet`) VALUES ('Pincher',1,4)
INSERT INTO `tb_cat`(`breed`, `id_pet`) VALUES ('British',6)

SELECT p.code,p.name,p.born_year,p.color,p.healthStatus,d.breed,d.pedigree
FROM tb_pet AS p
INNER JOIN tb_dog AS d on p.id=d.id_pet

SELECT p.*, d.*
FROM tb_pet AS p
INNER JOIN tb_dog AS d on p.id=d.id_pet


SELECT p.id, p.code,p.name,p.born_year,p.color,p.healthStatus,d.id_dog,d.breed,d.pedigree,d.id_pet
FROM tb_pet AS p
INNER JOIN tb_dog AS d on p.id=d.id_pet

SELECT * FROM `tb_pet` id INNER JOIN `tb_dog` id_pet on id = id_pet;
SELECT * FROM `tb_pet` id INNER JOIN `tb_cat` id_pet on id = id_pet;