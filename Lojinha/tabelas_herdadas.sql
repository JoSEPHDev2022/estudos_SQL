-- TABELAS HERDADAS

-- tabela 'pai':
	CREATE TABLE publicacao (
		id SERIAL CONSTRAINT pk_id_pub PRIMARY KEY,
		nome VARCHAR(50),
		dataPub DATE,
		idioma VARCHAR(25)
	);
	
-- tabelas 'herdadas':
	CREATE TABLE livros (
		isbn13 CHAR(13) UNIQUE,
		tipo_capa VARCHAR(20),
		edicao SMALLINT
	) INHERITS(publicacao); -- 'Herda' os atributos de publicação (nome,dataPub,idioma).
	
	CREATE TABLE revistas (
		issn CHAR(8),
		numero SMALLINT,
		UNIQUE(issn, numero) -- aplicando a constraint 'UNIQUE' nas duas colunas, pois ambas tem q ser únicas.
	) INHERITS(publicacao);
	

-- inserindo dados:
	INSERT INTO publicacao(nome,dataPub,idioma)
	VALUES ('Le Monde','20220411','Francês');

	SELECT * FROM publicacao;

	INSERT INTO livros(nome,dataPub,idioma,isbn13,tipo_capa,edicao)
	VALUES ('50 ideias de Química','20220202','Português','9786555356519','Brochura',2);
	-- esses dados também aparecerão na tabela 'pai', publicacao.
	SELECT * FROM livros;

	INSERT INTO revistas (nome,dataPub,idioma,issn,numero)
	VALUES ('Saber Eletrônica','19971201','Português','01016717',299);

	INSERT INTO revistas (nome,dataPub,idioma,issn,numero)
	VALUES ('Eletrônica Total','19981101','Português','01016717',299);
	-- não dará certo pois o issn tem q ser UNIQUE.
	SELECT * FROM revistas;

-- ALTERAR DADOS DE TABELAS COM HERANÇA:

	-- fazendo a modificação na tabela pai, todas as colunas herdeiras automaticamente
	-- serão modificadas também.
	ALTER TABLE publicacao
	ADD COLUMN nPaginas SMALLINT;

	UPDATE publicacao
	SET dataPub = '20200415'
	WHERE id = 3;