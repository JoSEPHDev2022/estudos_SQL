/* LIMIT e OFFSET

   Permitem obter uma parte especificada das linhas retornadas por uma
   query.
   
   SINTAXE: 
   		   SELECT colunas
		   FROM tabela
		   [ORDER BY coluna]
		   [LIMIT {contagem | ALL}]
		   [OFFSET deslocamento] 
		   
		   contagem = quantidade de linhas a exibir
		   ALL = mostrar todas as linhas
		   deslocamento = quantas linhas devem ser puladas antes de iniciar
		   				  a contagem do LIMIT */ 
						  
SELECT * FROM produtos
ORDER BY preco;

SELECT * FROM produtos
ORDER BY preco
LIMIT 4;

SELECT * FROM produtos
ORDER BY preco DESC
LIMIT 3 OFFSET 2;

SELECT * FROM produtos
ORDER BY preco DESC
OFFSET 5;