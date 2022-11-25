-- Chaves Estrangeiras e Tipos

CREATE DATABASE alura;

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
	primeiro_nome VARCHAR(255) NOT NULL,
	ultimo_nome VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL
);

CREATE TABLE categoria (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE curso (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	categoria_id INTEGER NOT NULL REFERENCES categoria(id)
);

CREATE TABLE aluno_curso (
	aluno_id INTEGER NOT NULL REFERENCES aluno(id),
	curso_id INTEGER NOT NULL REFERENCES curso(id),
	PRIMARY KEY (aluno_id, curso_id)
);
--------------------------------------------------------------------------------------------------------------------

-- Praticando Comandos

INSERT INTO aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
	'Vinicius', 'Dias', '1997-10-15'
), (
	'Patricia', 'Freitas', '1986-10-25'
), (
	'Diogo', 'Oliveira', '1984-08-27'
), (
	'Maria', 'Rosa', '1985-01-01'
);

INSERT INTO categoria (nome) VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');

INSERT INTO curso (nome, categoria_id) VALUES
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	('PHP', 2),
	('Java', 2),
	('C++', 2),
	('PostgreSQL', 3),
	('MySQL', 3),
	('Oracle', 3),
	('SQL Server', 3),
	('SQLite', 3),
	('Pandas', 4),
	('Machine Learning', 4),
	('Power BI', 4);
	
INSERT INTO aluno_curso VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);

  SELECT aluno.primeiro_nome AS "Nome",
	     aluno.ultimo_nome AS "Sobrenome",
	     COUNT(aluno_curso.curso_id) AS "Número de Cursos"
    FROM aluno
    JOIN aluno_curso ON aluno_curso.aluno_id = aluno.id
GROUP BY 1, 2
ORDER BY 3 DESC
   LIMIT 1;
   
  SELECT curso.nome AS "Nome do Curso",
  		 COUNT(aluno_curso.aluno_id) AS "Número de Alunos"
    FROM curso
	JOIN aluno_curso ON aluno_curso.curso_id = curso.id
GROUP BY 1
ORDER BY 2 DESC
   LIMIT 1;
--------------------------------------------------------------------------------------------------------------------

-- Usando Funções

	-- Concatenação de Strings:
	   
	SELECT * FROM aluno;
	   
	SELECT(primeiro_nome || ' ' || ultimo_nome) AS nome_completo FROM aluno;
	   
	SELECT CONCAT('Vinicius', ' ', 'Dias');
	   
	SELECT CONCAT(primeiro_nome, ' ', ultimo_nome) AS nome FROM aluno;
	   
	-- Tamanho da String:
	
	SELECT LENGTH(primeiro_nome) FROM aluno;
		
	SELECT primeiro_nome AS "Nome",
		   ultimo_nome AS "Sobrenome",
		   LENGTH(CONCAT(primeiro_nome, ultimo_nome)) AS "Núm. Caracteres"
	  FROM aluno;
		  
   -- Minúsculas e Maiúsculas:
   
   	SELECT LOWER(CONCAT(primeiro_nome, ' ', ultimo_nome))
	  FROM aluno;
		
	SELECT UPPER(CONCAT(primeiro_nome, ' ', ultimo_nome))
	  FROM aluno;
		
   -- Localização de Caracteres Específicos: 
   
   	SELECT POSITION('a' IN ultimo_nome) 
	  FROM aluno;
	 
	SELECT POSITION(UPPER('V') IN primeiro_nome) 
	  FROM aluno;
   		
  -- Extrair uma parte da String:
  	 
	SELECT SUBSTRING('Alameda' FROM 1 FOR 3);
  
 -- Cortar certas partes de uma String:
 
 	SELECT TRIM(BOTH 'xy' FROM 'xxxLuiza_souzaxyx');

SELECT(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	   data_nascimento
  FROM aluno;
  
SELECT(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	   data_nascimento,
	   NOW()
  FROM aluno;
  
SELECT(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	   data_nascimento,
	   NOW()::DATE
  FROM aluno;
  
SELECT(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	   data_nascimento,
	   (NOW()::DATE - data_nascimento) / 365 AS idade
  FROM aluno;
  
SELECT(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	   data_nascimento,
	   AGE(data_nascimento) AS idade
  FROM aluno;
  
SELECT(primeiro_nome || ' ' || ultimo_nome) AS nome_completo,
	   data_nascimento,
	   EXTRACT(YEAR FROM AGE(data_nascimento)) AS idade
  FROM aluno;
  