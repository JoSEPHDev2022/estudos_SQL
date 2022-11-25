-- Criando uma tabela utilizando os principais data types.

CREATE TABLE aluno(
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN,
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

SELECT * FROM aluno;

-- No campo NUMERIC(10,2), 10 signifca o número de caracteres (1234567890),
-- e 2 representa o número de casas decimais a ser utilizado (1.00,2.45,9.72)

------------------------------------------------------------------------
-- Inserindo registros na tabela (INSERT INTO).

INSERT INTO aluno (nome,cpf,observacao,idade,dinheiro,altura,ativo,data_nascimento,hora_aula,matriculado_em) VALUES (
	'Luiz',
 	'12345678901',
 	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ac sem congue, imperdiet velit in, efficitur sem. Duis tincidunt augue ac ante luctus, eget ultrices orci vulputate. Duis feugiat justo lorem, ac porttitor elit efficitur et. Cras tempor molestie nibh, sit amet bibendum eros blandit ornare. Cras iaculis mollis augue vitae lobortis. Nulla pharetra quam id augue blandit molestie. Donec rutrum mollis velit nec ornare. Vestibulum sagittis congue urna, eu tempor erat suscipit non. Vestibulum dignissim, magna sed posuere vehicula, ex enim vestibulum odio, vitae vulputate nibh est ut nisi. Donec in massa dapibus tellus molestie dapibus. Fusce magna arcu, gravida a lacus vitae, vulputate vestibulum sapien. Cras lacinia rhoncus elit vitae pharetra. Aliquam porttitor mauris sit amet lectus luctus rhoncus. Nam vitae mattis nulla.',
 	35,
	100.50,
	1.81,
	TRUE,
	'2001-09-12',
	'17:30:00',
	'2022-11-17 14:38:00'
);

------------------------------------------------------------------------
-- Dando update em registros na tabela (UPDATE).

UPDATE aluno
   SET observacao = 'Nenhuma fornecida'
 WHERE id = 1;
 
SELECT * FROM aluno;

------------------------------------------------------------------------
-- Excluir um registro de uma tabela (DELETE FROM).

DELETE FROM aluno
	  WHERE nome = 'Luiz';

------------------------------------------------------------------------
-- Selecionando colunas específicas da tabela.

SELECT nome "Nome do Aluno",
	   idade "Idade do Aluno",
	   matriculado_em AS "Quando o Aluno se Matriculou"
  FROM aluno;

------------------------------------------------------------------------
-- Filtrando registros de campos do tipo texto.

INSERT INTO aluno (nome) VALUES('Vinicius Dias');
INSERT INTO aluno (nome) VALUES('Nico Steppat');
INSERT INTO aluno (nome) VALUES('João Roberto');
INSERT INTO aluno (nome) VALUES('Diego');
INSERT INTO aluno (nome) VALUES('Diogo');

-- Pesquisando EXATAMENTE o texto:

SELECT *
  FROM aluno
 WHERE nome = 'Diego';
 
SELECT *
  FROM aluno
 WHERE nome != 'Diego'; -- != ou <> para diferença.
 
-- Pesquisando por registros PARECIDOS com o texto:

SELECT *
  FROM aluno
 WHERE nome LIKE 'Diogo';

SELECT *
  FROM aluno
 WHERE nome LIKE 'Di_go';
 
SELECT *
  FROM aluno
 WHERE nome LIKE 'D%';
 
SELECT *
  FROM aluno
 WHERE nome LIKE '%s';
  
SELECT *
  FROM aluno
 WHERE nome LIKE '% %'; -- qualquer nome que possua espaço.
 
SELECT *
  FROM aluno
 WHERE nome NOT LIKE 'Di_go';
 
	-- LIKE possuí dois caracteres especiais: _ e %
	-- _: Qualquer caracter naquela posição (_iego, Di_go)
	-- %: Pesquisar qualquer coisa até aquele ponto (D%) - pesquisar todo mundo que começa com D.

-- Filtrando registros de campos do tipo numérico, data e booleano.

SELECT *
  FROM aluno
 WHERE cpf IS NULL;

SELECT *
 FROM aluno
WHERE cpf IS NOT NULL;

SELECT *
 FROM aluno
WHERE idade = 35;

SELECT *
 FROM aluno
WHERE idade BETWEEN 10 AND 35;