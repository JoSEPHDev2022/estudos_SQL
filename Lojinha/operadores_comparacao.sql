/* OPERADORES DE COMPARAÇÃO 

Comparar dois valores e retornar um valor booleano, dependendo do
resultado da comparação.

< menor que
> maior que
<= menor ou igual a 
>= maior ou igual a 
= igual a
<> ou != diferente de (não igual a) */

SELECT nome_produto, preco FROM produtos
WHERE preco > 12;

SELECT nome_produto, qtde_estoque FROM produtos
WHERE qtde_estoque <= 20;

SELECT nome_produto, qtde_estoque FROM produtos
WHERE qtde_estoque <= 20 AND qtde_estoque > 10;

SELECT nome_produto, preco FROM produtos
WHERE nome_produto != 'Refrigerante';