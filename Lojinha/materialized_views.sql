-- MATERIALIZED VIEWS

	-- É um objeto de banco de dados que armazena o resultado de uma consulta de forma
	-- persistente. É uma tabela auxiliar que permite maior performance no acesso aos dados.

	-- consulta com inner join:
	SELECT 
		CL.nome_cliente,
		PR.nome_produto,
		PE.qtde_vendida
	FROM pedidos AS PE
		INNER JOIN clientes AS CL
			ON PE.cod_cliente = CL.cod_cliente
		INNER JOIN produtos AS PR
			ON PE.cod_produto = PR.cod_produto
	ORDER BY CL.nome_cliente;
	
	-- criando a materialized view:
	CREATE MATERIALIZED VIEW view_compras AS
	SELECT 
		CL.nome_cliente,
		PR.nome_produto,
		PE.qtde_vendida
	FROM pedidos AS PE
		INNER JOIN clientes AS CL
			ON PE.cod_cliente = CL.cod_cliente
		INNER JOIN produtos AS PR
			ON PE.cod_produto = PR.cod_produto
	ORDER BY CL.nome_cliente
	WITH NO DATA;
	
	-- WITH NO DATA: o NO é opcional. Cria uma view materializada vazia, sem dados
	-- WITH DATA: Cria a view materializada com os dados
	
-- CONSULTAS NA VIEW MATERIALIZADA (lembrando que criamos a view WITH NO DATA)
	
	-- como ainda não populamos a view materializada, a query a seguir gera um erro pois
	-- essa view esta vazia
	SELECT * FROM view_compras;
	
	-- para popular a view, basta dar o comando a seguir (que deve ser executado TODA VEZ em que
	-- atualizarmos nossas tabelas com novos registros)
	REFRESH MATERIALIZED VIEW view_compras;
	
	-- agora, a view foi populada, basta darmos o select novamente para checar:
	SELECT * FROM view_compras;
	
-- ALTERAÇÕES NA VIEW

	ALTER MATERIALIZED VIEW view_compras
		RENAME COLUMN nome_produto TO produto;
		
-- EXLUINDO A VIEW

	DROP MATERIALIZED VIEW view_compras;