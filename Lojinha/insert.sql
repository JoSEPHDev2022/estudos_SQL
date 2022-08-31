-- Cadastro dos clientes:

INSERT INTO 
    clientes (cod_cliente,nome_cliente,sobrenome_cliente)
VALUES
    (1,'Fábio','dos Reis'),
    (2,'Mônica','Silveira'),
    (3,'Ana','Teixera');
    
SELECT * FROM clientes;
---------------------------------------------------------------------------
-- Cadastro dos produtos

INSERT INTO
    produtos (cod_produto,nome_produto,descricao,preco,qtde_estoque)
VALUES
    (1,'Álcool Gel','Garrafa de álcool em gel de 1 litro',12.90,20),
    (2,'Luvas de Latex','Caixa de luvas de latex com 100 unidades',32.50,25),
    (3,'Pasta de Dentes','Tubo de pasta de dentes de 90 gramas',3.60,12),
    (4,'Sabonete','Sabonete antibacteriano',3.50,5),
    (5,'Enxaguante Bucal','Atisséptico bucal de 500 ml',17.00,28);
    
SELECT * FROM produtos;
--------------------------------------------------------------------------
-- Cadastro dos pedidos

INSERT INTO
    pedidos (cod_cliente,cod_produto,qtde_vendida)
VALUES
    (1,2,3),
    (2,3,2),
    (1,3,4);
    
SELECT * FROM pedidos;