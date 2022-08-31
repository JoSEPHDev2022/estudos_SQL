-- FUNÇÕES DE AGREGAÇÃO

	-- funções usadas para computar um valor único a partir de um conjunto de valores de entrada.
	
-- FUNÇÕES BÁSICAS:

	-- COUNT 			(contagem de itens)
	-- MAX 				(valor máximo)
	-- MIN				(valor mínimo)
	-- AVG				(valor médio, a média)
	-- SUM 				(somatório)
	
-- COUNT:
SELECT COUNT(*) FROM clientes; 		-- com asterisco, estou indicando que quero contar tudo, 
									-- todas as linhas de uma tabela.
									
SELECT COUNT(nome) FROM clientes;   -- tenho X registros na coluna específica que passei IGNORANDO
									-- valores nulos.
									
SELECT COUNT(nome_produto) FROM produtos;

SELECT COUNT(DISTINCT nome_produto) FROM produtos;  -- DISTINCT contabiliza nomes de produtos distintos

SELECT COUNT(*) FROM produtos
WHERE preco >= 10; 

----------------------------------------------------------------------------------------------------------
-- MAX:
SELECT MAX(preco) FROM produtos;		-- retorna o produto que custa mais caro

----------------------------------------------------------------------------------------------------------
-- MIN:
SELECT MIN(preco) FROM produtos;		-- retorna o produto que custa menos

----------------------------------------------------------------------------------------------------------
-- SUM:
SELECT SUM(preco) FROM produtos;		-- retorna o somatório dos preços

----------------------------------------------------------------------------------------------------------
-- AVG:
SELECT AVG(preco) FROM produtos;		-- retorna a média de preços da tabela

SELECT ROUND(AVG(preco),2) FROM produtos; -- arrendondando o valor com 2 casas decimais 

SELECT ROUND(AVG(preco),2) FROM produtos
WHERE nome_produto = 'Refrigerante';