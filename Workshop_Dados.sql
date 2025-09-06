CREATE SCHEMA DESAFIO;

USE DESAFIO;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
	Idade INT NOT NULL,
	Sexo VARCHAR(10) NOT NULL
);

CREATE TABLE receita (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_usuario INT NOT NULL,
	Titulo VARCHAR(45) NOT NULL,
	Categoria VARCHAR(45) NOT NULL,
	MododePreparo TEXT,
	Descricao TEXT,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id)
); 

CREATE TABLE ingredientes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_receita INT NOT NULL,
	Nome VARCHAR(45) NOT NULL,
	Quant INT NOT NULL,
	FOREIGN KEY (id_receita) REFERENCES receita(id)
);

INSERT INTO usuario (Nome, Idade, Sexo)
VALUES
	('Jacan', 39, 'Masculino'),
	('Matheus', 20, 'Masculino'),
	('Ada', 30, 'Feminino'),
	('Murilo', 19, 'Masculino');



INSERT INTO receita (id_usuario, Titulo, Categoria, MododePreparo, Descricao) VALUES
	(1, 'Bolo de Chocolate', 'Doce', 'Misture os ingredientes e asse por 40 minutos', 'Bolo fofinho de chocolate'),
	(2, 'Salada de Frutas', 'Saudável', 'Corte as frutas e misture', 'Refrescante e nutritiva');


INSERT INTO ingredientes (id_receita, Nome, Quant) VALUES
	(1, 'Chocolate', 200),
	(1, 'Farinha', 300),
	(1, 'Ovos', 3),
	(2, 'Maçã', 2),
	(2, 'Banana', 3),
    (2, 'Manga', 3),
    (2, 'Laranja',2);

UPDATE usuario
SET idade = 50
WHERE nome = 'Leon';

SELECT * FROM receita
WHERE categoria = 'Doce';

SELECT * FROM usuario
WHERE Nome LIKE 'M%';

SELECT * FROM ingredientes
WHERE id_receita BETWEEN 1 AND 4
ORDER BY id ASC;

SELECT COUNT(*)
FROM usuario;

SELECT MAX(id) AS max_id, MAX(Quant) AS max_quant
FROM ingredientes
GROUP BY id, Quant;

SELECT Titulo, COUNT(*)
FROM receita
GROUP BY Titulo;

SELECT u.Nome, r.id
FROM usuario u
INNER JOIN receita r ON u.id = r.id_usuario;
