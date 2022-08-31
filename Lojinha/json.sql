/* JSON

Acrônimo de 'JavaScrip Object Notation';

Formato aberto e popular para representação e troca de dados, assim como XML e YAML
(porém mais leve e simples);

É fácil para humanos lerem e editarem esse formato, e simples para os computadores
processarem e gerarem dados JSON;

É independente de linguagem de programação.
=====================================================================================

Um documento (objeto) JSON é um conjunto não-ordenado de dados armazenados em um par
"nome":valor (campo), que inicia e termina com chaves {};

Todos os nomes-chave são englobados em aspas duplas, e são separados de seus valores por
dois-pontos : ;

Os pares (campos) são separados um do outro por vírgulas.

"chave":valor

EXEMPLO:
	{
	"chave": "string",
	"chave": 12,
	"chave": ["string", 21.50, "string"],
	"chave": true,
	"chave": {"chave": "valor"}
	}
===================================================================================== */

-- Criar tabela com campo JSON:
	CREATE TABLE peds (
		id SERIAL NOT NULL PRIMARY KEY,
		pedido JSON NOT NULL
	);
	
-- Inserir registros para testes:
	INSERT INTO peds (pedido)
	VALUES
		('{"comprador": "Fábio", "produtos": {"bebida": "Suco de Caju", "comida": "Pizza de Atum"}}'),
		('{"comprador": "Mônica", "produtos": {"bebida": "Água Tônica", "comida": "Beirute"}}'),
		('{"comprador": "Lauro", "produtos": {"bebida": "Campari", "comida": "Espaguete"}}'),
		('{"comprador": "Henrique", "produtos": {"bebida": "Coca-cola", "comida": "Feijoada"}}');
		
-- Consultas:
	SELECT * FROM peds;
	
-- Operadores JSON:

	-- Retornar nomes dos compradores em formato JSON:
	SELECT pedido -> 'comprador' AS comprador FROM peds; -- retorna os valores associados as chaves 'comprador'
	
	-- Idem anterior, mas em formato de texto:
	SELECT pedido ->> 'comprador' AS comprador FROM peds;
	
	-- Retornar as bebidas vendidas
	SELECT pedido -> 'produtos' ->> 'bebida' AS "bebidas vendidas" FROM peds;
	
-- JSON na cláusula WHERE: Filtros

	-- Quem comprou Coca-cola?
	SELECT pedido ->> 'comprador' AS comprador FROM peds
		WHERE pedido -> 'produtos' ->> 'bebida' = 'Coca-cola';
		
-- Funções JSON

	SELECT JSON_EACH(pedido) FROM peds; -- retorna cada par chave:valor em uma linha separada;

	SELECT JSON_EACH_TEXT(pedido) FROM peds; -- msm coisa, retornando no formato de texto;
	
	SELECT JSON_OBJECT_KEYS(pedido -> 'produtos') FROM peds; -- retorna as chaves;