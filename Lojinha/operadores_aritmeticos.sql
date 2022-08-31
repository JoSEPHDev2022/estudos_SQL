/* OPERADORES ARITMÉTICOS

===============================================================|
OPERADOR	 |		SIGNIFICADO		   |	SINTAXE			   |
===============================================================|		 						   
-			 |		Menos unário	   |	-valor			   |
^			 |		Exponenciação	   |	valor1 ^ valor2	   |
*			 |		Multiplicação	   |	valor1 * valor2    |
/			 |		Divisão			   |	valor1 / valor2    |
%			 |		Módulo		       |	valor1 % valor2    |
+			 |		Soma			   |	valor1 + valor2    |
-			 |		Subtração		   |	valor1 - valor2    |
|/			 |		Raiz quadrada	   |	|/ valor	       |
||/			 |		Raiz cúbica		   |	||/ valor		   |
@			 |		Valor absoluto	   |	@ valor			   |
===============================================================|		
*/

-- Cálculos:

SELECT 10 + 12 AS Resultado;

SELECT -10 + 12 AS Resultado;

SELECT 10 + 6 * 3 AS Resultado;

SELECT (10 + 6) * 3 AS Resultado;

SELECT 18 % 2 AS Resultado; -- resto da divisão

SELECT 18 % 4 AS Resultado;

SELECT 10 ^ 2 AS Resultado;

SELECT 6.02 * 10 ^ 23 AS Resultado;

SELECT 6.02e+23 * 5 AS Resultado; -- cálculos com notação científica

SELECT |/ 144 AS Resultado;

SELECT ||/ 27 AS Resultado;

-- Vamos utilizar eles em nosso banco:
SELECT * FROM produtos;

	-- Quanto custam 15 unidades de enxaguante bucal?
	SELECT ROUND(preco * 5, 2) FROM produtos
		WHERE cod_produto = 5;
		
	-- Quanto cusa a unidade da luva de latex?
	SELECT ROUND(preco / 100, 2) AS "custo de uma luva" FROM produtos
		WHERE nome_produto LIKE 'Luvas%';
	
	-- Qual o valor total das mercadorias do estoque?
	SELECT ROUND(SUM(preco * qtde_estoque),2) FROM produtos;