-- ARRAYS

	-- Também conhecidos como "Vetor", são equivalentes a uma lista de dados;
	
-- SINTAXE postgresSQL, ao criar a tabela:
-- nome_coluna tipo[]

-- SINTAXE ansi sql:
-- nome_coluna tipo ARRAY[tamanho]
-- ou
-- nome_coluna tipo ARRAY

CREATE TABLE escala_trabalho (
	cod_func SMALLINT,
	escala CHAR(3)[]
);

SELECT * FROM escala_trabalho;

-- Para inserir os dados no array definido, devemos abrir aspas simples, abrir chaves,
-- e inserir os dados dentro das chaves separados por vírgula.

-- Como definimos que o array é do tipo CHAR e suporta 3 elementos, dentro das chaves
-- abrimos aspas duplas e escrevemos nossos caracteres.
INSERT INTO 
	escala_trabalho (cod_func,escala)
VALUES
	(1,'{"SEG","TER","QUA"}'),
	(2,'{"QUI","SEX","SAB"}'),
	(3,'{"SEG","QUA","SEX"}');
	
-- Qual a escala de trabalho do funcionário número 2?
SELECT escala FROM escala_trabalho
	WHERE cod_func = 2;
	
-- Que dia da semana cada funcionário começa a trabalhar?

	-- para responder, basta inserir o índice do item da lista, do array, que queremos.
	-- Lembrando que em PostgresSQL começa a ser contato a partir de 1.
SELECT 
	cod_func, 
	escala[1]	
FROM escala_trabalho;

-- Quais funcionários vão estar na empresa em um dia específico? Por exemplo, que funcionário
-- estará na empresa de quarta-feira?

	-- aqui utilizamos a palavra reservada ANY do postgres, onde a query retornar
	-- QUALQUER funcionario que possua em sua escala o dado 'QUA'
SELECT cod_func, escala FROM escala_trabalho
	WHERE 'QUA' = ANY(escala);
	
-- ALTERAR DADOS DE UM ARRAY: (utilizando sintaxe ansi sql)
UPDATE escala_trabalho SET escala = ARRAY['TER','QUI','SAB']
WHERE cod_func = 3;