-- VIEWS

	-- View (Exibição/Visão) é uma tabela virtual (estrutura de dados) baseada no conjunto de resultados
	-- de uma consulta SQL, criada a partir de um conjunto de tabelas (ou outras views) presentes no 
	-- banco, que servem como tabelas-base.
	
	-- Mostra sempre resultados de dados atualizados, pois o motor do banco de dados recria os dados
	-- toda vez que um usuário consulta a visão.

-- APLICAÇÕES DAS VIEWS

	-- Simplificar o acesso a dados que estão armazenados em múltiplas tabelas relacionadas;
	
	-- Implementar segurança nos dados de uma tabela, por exemplo criando uma visão que limite
	-- os dados que podem ser acessados, por meio de uma cláusula WHERE;
	
	-- Prover isolamento de uma aplicação da estrutura específica de tabelas do banco acessado.
	
SELECT 
	CL.nome_cliente AS "Cliente",
	PR.nome_produto AS "Produto",
	PE.qtde_vendida AS "Vendas",
	PE.cod_pedido	AS "Pedido",
	PR.preco * PE.qtde_vendida AS "Fatura"
FROM pedidos PE
	INNER JOIN clientes CL
		ON PE.cod_cliente = CL.cod_cliente
	INNER JOIN produtos PR
		ON PE.cod_produto = PR.cod_produto;
		
-- esse código traz tabelas relacionadas utilizando inner join, se eu sempre precisar fazer essa
-- consulta, posso transformá-la numa view!
CREATE OR REPLACE VIEW vendas AS		-- or replace é opcional
	SELECT 
		CL.nome_cliente AS cliente,
		PR.nome_produto AS produto,
		PE.qtde_vendida AS vendas,
		PE.cod_pedido	AS pedido,
		PR.preco * PE.qtde_vendida AS fatura
	FROM pedidos PE
		INNER JOIN clientes CL
			ON PE.cod_cliente = CL.cod_cliente
		INNER JOIN produtos PR
			ON PE.cod_produto = PR.cod_produto;
			
-- vamos trabalhar com essa view:

SELECT * FROM vendas;

SELECT cliente, SUM(fatura) FROM vendas
GROUP BY cliente;

-- podemos alterar propriedades de uma view existente com ALTER VIEW:

ALTER VIEW vendas RENAME TO faturas;

SELECT * FROM faturas;

-- para excluir uma view:
DROP VIEW faturas;

-- ou

DROP VIEW IF EXISTS faturas CASCADE;