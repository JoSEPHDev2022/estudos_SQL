-- UPDATE: Atualizar registros em tabelas

-- SINTAXE: 
	UPDATE tabela
	SET coluna = novo_valor
	WHERE coluna = valor_índice;
--------------------------------------------
UPDATE 
	produtos
SET
	descricao = 'Pote de margarina vegetal'
WHERE
	cod_produto = 11;
--------------------------------------------
UPDATE
	produtos
SET
	preco = 3.95
WHERE
	nome_produto = 'Sabonete';
	
SELECT * FROM produtos;
--------------------------------------------
UPDATE
	produtos
SET
	qtde_estoque = qtde_estoque - 4
WHERE
	preco > 15;
--------------------------------------------
-- reajuste geral de preços:
UPDATE 
	produtos
SET
	preco = preco * 1.10;