-- Selecionar os nomes dos clientes que realizaram mais de 2 pedidos.
SELECT COUNT(id_pedido) AS pedidos, nome FROM
	(SELECT 
		tb_cliente.nome, 
		tb_pedido.id_pedido
	FROM
		tb_pedido
		INNER JOIN tb_cliente
			ON tb_pedido.id_cliente = tb_cliente.id_cliente)
AS tabela
GROUP BY nome
	HAVING COUNT(id_pedido) > 2;

-- Retornar a quantidade de pedidos de cada pizza.
SELECT COUNT(id_pedido) AS pedido, nome FROM
	(SELECT tb_pizza.nome, tb_pedido.id_pedido FROM tb_pedido_pizza
		INNER JOIN tb_pizza
			ON tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
		INNER JOIN tb_pedido
			ON tb_pedido_pizza.id_pedido = tb_pedido.id_pedido)
AS tabela
GROUP BY nome
ORDER BY COUNT(id_pedido) DESC;

-- Retornar a quantidade de pedidos de cada categoria de pizza.
SELECT COUNT(id_pedido) AS pedido, categoria FROM 
	 (SELECT tb_pizza.categoria, tb_pedido.id_pedido FROM tb_pedido_pizza
	 	INNER JOIN tb_pizza
	 		ON tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
	 	INNER JOIN tb_pedido
	 		ON tb_pedido_pizza.id_pedido = tb_pedido.id_pedido)
AS tabela
GROUP BY categoria
ORDER BY COUNT(id_pedido) DESC;

-- Retornar a soma dos preços dos pedidos agrupados pelo nome da pizza.
SELECT SUM(preco), nome FROM
	(SELECT tb_pizza.nome, tb_pedido.preco FROM tb_pedido_pizza
		INNER JOIN tb_pizza
			ON tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
		INNER JOIN tb_pedido
			ON tb_pedido_pizza.id_pedido = tb_pedido.id_pedido)
AS tabela
GROUP BY nome
ORDER BY SUM(preco) DESC;

-- Retornar a soma dos preços dos pedidos agrupados pelo nome da pizza, filtrando pelas
-- pizzas de categoria 'Zero Lactose'.
SELECT SUM(preco), nome, categoria FROM
	(SELECT tb_pizza.nome, tb_pedido.preco, tb_pizza.categoria FROM tb_pedido_pizza
		INNER JOIN tb_pizza
			ON tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
		INNER JOIN tb_pedido
			ON tb_pedido_pizza.id_pedido = tb_pedido.id_pedido)
AS tabela
GROUP BY nome, categoria
	HAVING categoria = 'Zero Lactose'
ORDER BY SUM(preco) DESC;

----------------------------------------------------------------------------------------------------
-- Selecione o nome dos clientes e o preço dos pedidos com o tipo de entrega Delivery;
SELECT tb_cliente.nome, tb_pedido.preco, tb_pedido.tipo_entrega FROM tb_pedido
	INNER JOIN tb_cliente
		ON tb_pedido.id_cliente = tb_cliente.id_cliente
	WHERE tipo_entrega = 'Delivery';
    
-- Selecione o nome dos clientes e o nome das pizas pedidas por eles;
SELECT
	tb_cliente.nome AS cliente,
	tb_pizza.nome AS pizza
FROM tb_cliente
	LEFT JOIN tb_pedido
		ON tb_cliente.id_cliente = tb_pedido.id_cliente
	LEFT JOIN tb_pedido_pizza
	 	ON tb_pedido_pizza.id_pedido = tb_pedido.id_pedido
	LEFT JOIN tb_pizza
		ON tb_pizza.id_pizza = tb_pedido_pizza.id_pizza
ORDER BY pizza NULLS FIRST;

-- Selecione o nome dos clientes e o nome das pizzas pedidas por eles filtrando pelas pizzas
-- que são Zero Lactose;
SELECT 
	cl.nome AS cliente,
	pz.nome AS pizza,
	pz.categoria 
FROM tb_cliente AS cl
	LEFT JOIN tb_pedido AS tbp
		ON cl.id_cliente = tbp.id_cliente
	LEFT JOIN tb_pedido_pizza AS tbpp
		ON tbpp.id_pedido = tbp.id_pedido
	LEFT JOIN tb_pizza AS pz
		ON pz.id_pizza = tbpp.id_pizza
GROUP BY 
	cliente,
	pizza,
	categoria
	HAVING
		pz.categoria = 'Zero Lactose';

-- Selecione o total de preço dos pedidos, agrupado pelas nomes dos clientes e ordenados
-- pelos que mais gastaram;
SELECT
	tb_cliente.nome,
	SUM(tb_pedido.preco) AS valor_gasto
FROM tb_cliente
	LEFT JOIN tb_pedido
		ON tb_pedido.id_cliente = tb_cliente.id_cliente
GROUP BY tb_cliente.nome
ORDER BY SUM(tb_pedido.preco) DESC NULLS LAST;

-- Selecionar todos os clientes (tb_cliente), os pedidos associados a eles (tb_pedidos),
-- e verificar os clientes que já realizaram pedidos;
SELECT 
	tb_cliente.nome,
	tb_pedido.id_pedido
FROM tb_cliente
	LEFT JOIN tb_pedido
		ON tb_cliente.id_cliente = tb_pedido.id_cliente
GROUP BY
	tb_cliente.nome,
	tb_pedido.id_pedido
ORDER BY
	tb_pedido.id_pedido NULLS LAST;

-- Apresentar o número de pedidos (tb_pedido) feitos por cada cliente (tb_cliente).
SELECT
	tb_cliente.nome,
	COUNT(tb_pedido.id_pedido)
FROM tb_cliente
	LEFT JOIN tb_pedido
		ON tb_cliente.id_cliente = tb_pedido.id_cliente
GROUP BY tb_cliente.nome
ORDER BY COUNT(tb_pedido.id_pedido) DESC;

-- Apresentar o número de vezes que uma pizza (tb_pizza) foi pedida (tb_pedido);
SELECT 
	tb_pizza.nome,
	COUNT(tb_pedido.id_pedido)
FROM tb_pizza
	LEFT JOIN tb_pedido_pizza
		ON tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
	LEFT JOIN tb_pedido
		ON tb_pedido.id_pedido = tb_pedido_pizza.id_pedido
GROUP BY tb_pizza.nome
ORDER BY COUNT(tb_pedido.id_pedido) DESC NULLS LAST;

-- Apresentar qual a pizza favorita (mais pedida - tb_pedido) do cliente 1 (tb_cliente);
SELECT cliente, pizza, COUNT(id_pizza)
	FROM
	(SELECT
		tb_cliente.id_cliente AS cliente,
		tb_pedido.id_pedido AS pedidos,
		tb_pizza.nome AS pizza,
	 	tb_pizza.id_pizza
		FROM tb_cliente
			LEFT JOIN
				tb_pedido 
				ON tb_pedido.id_cliente = tb_cliente.id_cliente
	    	LEFT JOIN
				tb_pedido_pizza 
				ON tb_pedido_pizza.id_pedido = tb_pedido.id_pedido
	   		LEFT JOIN 
				tb_pizza 
				ON tb_pizza.id_pizza = tb_pedido_pizza.id_pizza)
AS tabela
WHERE cliente = 1
GROUP BY cliente, pizza
ORDER BY COUNT(id_pizza) DESC;

-- Apresentar uma lista das pizzas (tb_pizza) que são menos pedidas (tb_pedido);
SELECT 
	tb_pizza.nome pizza,
	COUNT(tb_pedido.id_pedido)
FROM tb_pizza
	LEFT JOIN tb_pedido_pizza
		ON tb_pizza.id_pizza = tb_pedido_pizza.id_pizza
	LEFT JOIN tb_pedido
		ON tb_pedido.id_pedido = tb_pedido_pizza.id_pedido
GROUP BY 
	pizza
	HAVING COUNT(tb_pedido.id_pedido) < 5
ORDER BY
	COUNT(tb_pedido.id_pedido);

-- Apresentar o acumulado de valor de pedido (tb_pedido) por endereço (tb_cliente);
SELECT
	tb_cliente.endereco,
	SUM(tb_pedido.preco)
FROM tb_cliente
	LEFT JOIN tb_pedido
		ON tb_cliente.id_cliente = tb_pedido.id_cliente
GROUP BY tb_cliente.endereco
ORDER BY SUM(tb_pedido.preco) DESC NULLS LAST;

-- Selecionar os pedidos e exibir a quantidade de pizzas em cada pedido (tb_pedido);
SELECT
	tb_pedido.id_pedido num_pedido,
	COUNT(tb_pizza.id_pizza) qtde_pizzas
FROM tb_pedido
	LEFT JOIN tb_pedido_pizza
		ON tb_pedido.id_pedido = tb_pedido_pizza.id_pedido
	LEFT JOIN tb_pizza
		ON tb_pedido_pizza.id_pizza = tb_pizza.id_pizza
GROUP BY tb_pedido.id_pedido
ORDER BY COUNT(tb_pizza.id_pizza) DESC;

-- Apresentar os clientes (tb_cliente) e exibir a soma de valor dos pedidos realizados
-- (tb_pedido);
SELECT
	tb_cliente.nome,
	SUM(tb_pedido.preco)
FROM tb_cliente
	LEFT JOIN tb_pedido
		ON tb_pedido.id_cliente = tb_cliente.id_cliente
GROUP BY tb_cliente.nome
ORDER BY SUM(tb_pedido.preco) DESC NULLS LAST;

-- Dentro do banco de dados da pizzaria, criar uma view que retorne a data do último
-- pedido de cada pizza;
-- Essa view deverá retornar além da data, o id da pizza, nome da pizza, a categoria e o
-- preço;
CREATE VIEW ultimos_pedidos AS
	SELECT
		MAX(tb_pedido.data_pedido) AS ultimo_pedido,
		tb_pizza.id_pizza,
		tb_pizza.nome AS sabor_pizza,
		tb_pizza.categoria,
		tb_pizza.preco
	FROM tb_pizza
		LEFT JOIN tb_pedido_pizza AS ped_piz
			ON ped_piz.id_pizza = tb_pizza.id_pizza
		LEFT JOIN tb_pedido
			ON ped_piz.id_pedido = tb_pedido.id_pedido
	GROUP BY
		2, 3, 4, 5
	ORDER BY 2;
	
SELECT * FROM ultimos_pedidos;