-- 1) **Listar todos os livros com seus respectivos autores.
	 SELECT l.titulo, a.Nome from livros l
	 INNER JOIN autores a
	 ON a.autor_id = l.autor_id ;

-- 2) **Listar todos os livros, mesmo aqueles que não têm um autor associado.
	SELECT l.titulo, a.Nome from autores a
    LEFT JOIN livros l
    ON l.autor_id = a.autor_id;
    
-- 3) **Listar todos os autores, mesmo aqueles que não têm livros associados.
	SELECT l.titulo, a.Nome from livros l
    RIGHT JOIN autores a
    ON a.autor_id = l.autor_id;
    
-- 4) **Listar todos os clientes que fizeram pedidos, incluindo os detalhes do pedido (livro e quantidade).
	SELECT c.nome, p.quantidade, l.titulo from clientes c
    INNER JOIN pedidos p
    ON p.cliente_id = c.cliente_id
    
    INNER JOIN livros l
    ON l.livro_id = p.livro_id;

-- 5) **Listar todos os pedidos feitos em uma determinada data, incluindo os nomes dos clientes que fizeram esses pedidos.
		SELECT p.data_pedido, c.nome from clientes c
		INNER JOIN pedidos p
		ON p.cliente_id = c.cliente_id;

-- 6) **Listar todos os livros vendidos, incluindo os detalhes do pedido (cliente e quantidade), mesmo que não tenham sido pedidos.
		SELECT l.titulo, c.nome, p.quantidade from clientes c

        left join pedidos p
        ON p.cliente_id = c.cliente_id
        
        LEFT JOIN livros l
        ON l.livro_id = p.livro_id;

-- 7) **Listar todos os clientes que não fizeram nenhum pedido.
		SELECT c.nome from clientes c
        
        INNER JOIN pedidos p
		ON p.cliente_id = c.cliente_id
        
        WHERE c.cliente_id not in (select c.cliente_id from clientes c);
      
-- 8) Listar todos os autores que têm livros com preço superior a $20.
		SELECT a.nome, l.preco from autores a
        INNER JOIN livros l 
        ON l.autor_id = a.autor_id
        
        WHERE l.preco > 20;
        
-- 9) Listar todos os livros e seus autores, incluindo os livros que não têm preço definido.
		SELECT l.titulo, a.nome from autores a
        left join livros l
        ON l.autor_id = a.autor_id;
        
-- 10)**Listar todos os pedidos, incluindo os livros que não foram pedidos, e o cliente associado, se houver.
		SELECT p.pedido_id, l.titulo from pedidos p
        RIGHT JOIN livros l
        ON l.livro_id = p.livro_id;

        
-- 11)**Listar todos os autores que têm livros com preços definidos e quantidades vendidas maiores que 1.
	SELECT a.nome, l.titulo, l.preco from autores a
    
	INNER JOIN livros l
    ON l.autor_id = a.autor_id
    
    INNER JOIN pedidos p
    ON p.livro_id = l.livro_id
    
    WHERE p.quantidade > 1
    

-- 12)**Listar todos os clientes, incluindo os que não fizeram pedidos, e os livros associados a cada pedido, se houver.
		select c.nome, l.titulo
-- 12)**Listar todos os clientes, incluindo os que não fizeram pedidos, e os livros associados a cada pedido, se houver.
		select c.nome, l.titulo;


-- 13)**Listar todos os autores que têm livros associados a pedidos feitos em uma determinada data.
	select a.nome from autores a
    
    INNER JOIN livros l
    ON l.autor_id  = a.autor_id
    
	inner join pedidos p
    ON p.livro_id = l.livro_id
    
    WHERE  p.data_pedido > 2020;

-- 14)**Listar todos os pedidos feitos por clientes com nomes que começam com a letra "A", incluindo os detalhes do livro.
		select c.nome, l.titulo, p.quantidade from clientes c
        
        INNER JOIN pedidos p
        ON p.cliente_id = c.cliente_id
        
        inner join livros l
        ON l.livro_id = p.livro_id
        
        WHERE c.nome LIKE 'a%';
        
-- 15)**Listar todos os livros que não foram pedidos até o momento.
	select l.titulo from livros l
    
    LEFT JOIN pedidos p
    ON p.livro_id = l.livro_id
    
    not in (select p.livro_id from pedidos);

16)**Listar todos os pedidos feitos por clientes, incluindo os detalhes do livro, ordenados
por data de pedido.
a) Utilize INNER JOIN entre as tabelas clientes e pedidos, e outra INNER JOIN entre
as tabelas pedidos e livros, e ordene os resultados pela data do pedido.
17)**Listar todos os autores que têm livros com preços definidos, e os livros que não têm
preço definido.
a) Utilize FULL JOIN entre as tabelas autores e livros.
18)**Listar todos os pedidos com seus respectivos clientes e livros, incluindo os pedidos
sem cliente associado.
a) Utilize LEFT JOIN entre as tabelas pedidos e clientes, e outra LEFT JOIN entre as
tabelas pedidos e livros.

19)**Listar todos os clientes e os livros que eles pediram, incluindo os clientes que não
fizeram nenhum pedido.
a) Utilize RIGHT JOIN entre as tabelas clientes e pedidos, e outra RIGHT JOIN entre
as tabelas pedidos e livros.

20)**Listar todos os autores que têm livros associados a pedidos feitos por clientes com
nomes que terminam com a letra "a".
a) Utilize INNER JOIN entre as tabelas autores, livros, pedidos e clientes, com

condições apropriadas nos nomes dos clientes e autores.
