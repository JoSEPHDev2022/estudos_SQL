-- DELETE FROM e TRUNCATE TABLE: apagar linhas de uma tabela

-- DELETE FROM: Excluir linhas específicas de uma tabela
	 
	 -- Sintaxe: 
	 		DELETE FROM nome_tabela
			WHERE condições;

-- TRUNCATE TABLE: Limpar os registros de uma tabela

	-- Sintaxe:
			TRUNCATE TABLE nome_tabela;
------------------------------------------------------------
INSERT INTO
	produtos (cod_produto,nome_produto,descricao,preco,qtde_estoque)
VALUES
	(12,'Sabão em Pó','Caixa de sabão em pó de 1/2 kg',12.50,5),
	(13,'Biscoito','Pacote de biscoito integral 110g',3.45,16),
	(14,'Manteiga','Pote de manteiga 250g',8.70,5);
	
SELECT * FROM produtos order by cod_produto;
------------------------------------------------------------
-- DELETE

-- excluir o prod de cod num 12
DELETE FROM produtos
WHERE cod_produto = 12;

-- excluir pelo nome
DELETE FROM produtos
WHERE nome_produto = 'Manteiga';

-- excluir mais de um registro (menos de 5 unidades no estoque)
DELETE FROM produtos
WHERE qtde_estoque <= 5;
------------------------------------------------------------
-- TRUNCATE

-- excluir todos os registros da tabela pedidos
TRUNCATE TABLE pedidos;