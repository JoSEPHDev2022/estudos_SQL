-- Crie um banco de dados com uma tabela "funcionário" com os campos:
	-- id;
	-- nome;
	-- profissão;
	-- data de nascimento.
	
-- Criar uma tabela de auditoria da tabela funcionário com os campos:
	-- id;
	-- nome;
	-- data.

-- Criar uma trigger para registrar o id, nome e a hora que um registro foi inserido na
-- tabela funcionário;

-- criando as tabelas:
	SELECT * FROM funcionario;
	SELECT * FROM log_func;

	CREATE TABLE funcionario (
		id_func SERIAL PRIMARY KEY,
		nome VARCHAR(100),
		profissao VARCHAR(100),
		data_nascimento DATE
	);

	CREATE TABLE funcionario_log (
		id_func INT,
		data_insert TIMESTAMP,
		FOREIGN KEY (id_func) REFERENCES funcionario (id_func)
	);

-- criando a função:
	CREATE OR REPLACE FUNCTION log_funcionario_func()
		RETURNS TRIGGER
			LANGUAGE plpgsql
		AS $log_trigger$
		BEGIN
			INSERT INTO 
				funcionario_log (id_func, data_insert)
			VALUES
				(NEW.id, CURRENT_TIMESTAMP);
		RETURN NEW;
		END;
		$log_trigger$
		
-- criando a trigger:
	CREATE TRIGGER log_trigger_funcionario
		AFTER INSERT ON funcionario
		FOR EACH ROW
			EXECUTE PROCEDURE
				log_funcionario_func();

-- inserindo valores na tabela:
    INSERT INTO
        funcionario (nome, profissao, data_nascimento)
    VALUES 
        ('Matheus Vinícius','Cientista de Dados','1990-09-23'),
        ('Luiz dos Santos','Analista de BI','1998-03-14'),
        ('Marisa Pereira','WebDeveloper','1996-05-12');

-- checando as tabelas:
	SELECT * FROM funcionario;
	SELECT * FROM funcionario_log;
