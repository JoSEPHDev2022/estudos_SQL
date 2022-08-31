-- BETWEEN

-- Filtrar intervalos de dados (comparação)
	SELECT ... FROM...
		WHERE coluna BETWEEN valor1 AND valor2
--------------------------------
SELECT 
	nome_produto,
	preco
FROM produtos
WHERE preco
	BETWEEN 10 AND 20;
--------------------------------
SELECT 
	nome_produto,
	preco
FROM produtos
WHERE
	preco BETWEEN 3.50 AND 5 OR
	preco BETWEEN 10 AND 20;
--------------------------------
SELECT 
	nome_produto,
	preco,
	qtde_estoque
FROM produtos
WHERE
	preco BETWEEN 2 AND 6 AND
	qtde_estoque < 10;
--------------------------------
SELECT 
	nome_produto,
	preco,
	qtde_estoque
FROM produtos
WHERE 
	preco NOT BETWEEN 5 AND 12;