CREATE DATABASE db_loja_eletronicos;

USE db_loja_eletronicos;

-- Tabela `produtos`
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

-- Tabela `clientes`
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20) DEFAULT NULL,
    valor_total_compras DECIMAL(10, 2) DEFAULT 0.00
);

-- Tabela `vendas`
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_cliente INT NOT NULL,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabela `promocoes`
CREATE TABLE promocoes (
    id_promocao INT PRIMARY KEY AUTO_INCREMENT,
    nome_promocao VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    desconto DECIMAL(5, 2) NOT NULL
);

-- Tabela `notificacoes`
CREATE TABLE notificacoes (
    id_notificacao INT PRIMARY KEY AUTO_INCREMENT,
    mensagem TEXT NOT NULL,
    data_notificacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO produtos (nome_produto, categoria, preco, quantidade_estoque) VALUES
('Smartphone XYZ', 'Celulares', 799.99, 25),
('Notebook ABC', 'Computadores', 1299.00, 15),
('Fone de Ouvido Wireless', 'Acessórios', 199.90, 40),
('Televisor 4K Ultra HD', 'Televisores', 2499.50, 10),
('Câmera Digital DSLR', 'Câmeras', 1899.00, 12),
('Tablet 10.1', 'Tablets', 499.99, 30),
('Smartwatch Pro', 'Relógios Inteligentes', 299.00, 20),
('Impressora Multifuncional', 'Impressoras', 349.90, 18),
('Caixa de Som Bluetooth', 'Acessórios', 129.99, 35),
('Roteador Wi-Fi AC', 'Redes', 229.00, 22);

INSERT INTO clientes (nome, email, telefone, valor_total_compras) VALUES
('Ana Souza', 'ana.souza@example.com', '(11) 98765-4321', 1200.00),
('Carlos Oliveira', 'carlos.oliveira@example.com', '(21) 98765-1234', 650.75),
('Fernanda Lima', 'fernanda.lima@example.com', '(31) 91234-5678', 987.45),
('João Pereira', 'joao.pereira@example.com', '(41) 92345-6789', 2350.00),
('Maria Santos', 'maria.santos@example.com', '(51) 93456-7890', 450.00),
('Pedro Costa', 'pedro.costa@example.com', '(61) 94567-8901', 980.30),
('Renata Almeida', 'renata.almeida@example.com', '(71) 95678-9012', 320.00),
('Rodrigo Silva', 'rodrigo.silva@example.com', '(81) 96789-0123', 780.40),
('Tatiane Ribeiro', 'tatiane.ribeiro@example.com', '(91) 97890-1234', 540.60),
('Vinícius Martins', 'vinicius.martins@example.com', '(11) 98901-2345', 1500.00);

INSERT INTO vendas (id_produto, id_cliente, data_venda, quantidade, valor_total) VALUES
(1, 1, '2024-08-01', 1, 799.99),
(2, 2, '2024-08-02', 1, 1299.00),
(3, 3, '2024-08-03', 2, 399.80),
(4, 4, '2024-08-04', 1, 2499.50),
(5, 5, '2024-08-05', 1, 1899.00),
(6, 6, '2024-08-06', 1, 499.99),
(7, 7, '2024-08-07', 1, 299.00),
(8, 8, '2024-08-08', 1, 349.90),
(9, 9, '2024-08-09', 1, 129.99),
(10, 10, '2024-08-10', 1, 229.00);

INSERT INTO promocoes (nome_promocao, data_inicio, data_fim, desconto) VALUES
('Desconto de Verão', '2024-06-01', '2024-06-30', 10.00),
('Black Friday', '2024-11-24', '2024-11-30', 30.00),
('Natal em Grande Estilo', '2024-12-01', '2024-12-25', 20.00),
('Liquidação de Janeiro', '2024-01-02', '2024-01-31', 15.00),
('Dia das Mães', '2024-05-01', '2024-05-12', 25.00),
('Volta às Aulas', '2024-01-15', '2024-02-15', 18.00),
('Cyber Monday', '2024-11-27', '2024-11-27', 35.00),
('Aniversário da Loja', '2024-08-01', '2024-08-15', 12.00),
('Festa Junina', '2024-06-15', '2024-06-30', 22.00),
('Dia dos Pais', '2024-08-01', '2024-08-11', 17.00);

INSERT INTO notificacoes (mensagem, data_notificacao) VALUES
('Novo produto em estoque: Smartphone XYZ!', '2024-08-01 09:00:00'),
('Atenção! Black Friday começa em 3 dias!', '2024-11-22 10:30:00'),
('Desconto especial para compras acima de R$1000,00!', '2024-08-05 11:00:00'),
('Não perca a liquidação de Janeiro com até 15% de desconto!', '2024-01-10 08:00:00'),
('Aniversário da loja! Confira nossas ofertas exclusivas.', '2024-08-01 09:15:00'),
('Promoção de Natal: até 20% de desconto em vários produtos.', '2024-12-01 09:30:00'),
('Venda especial para o Dia das Mães: 25% de desconto!', '2024-05-01 10:00:00'),
('Cyber Monday: descontos imperdíveis, só hoje!', '2024-11-27 09:45:00'),
('Dia dos Pais: confira nossas promoções!', '2024-08-01 10:15:00'),
('Últimos dias da promoção de Festa Junina!', '2024-06-25 11:30:00');

-- 1.Registrar uma nova venda e atualizar o valor total de compras por cliente.
DELIMITER //
	CREATE trigger nova_venda
    AFTER INSERT ON vendas
    FOR EACH ROW
    BEGIN
        update clientes set valor_total_compras = valor_total_compras + new.valor_total
        where id_cliente = new.id_cliente;
    END;
//
DELIMITER ;
    
-- 2. Trigger para aplicar desconto de promoção em vendas
DELIMITER //
	create trigger aplicando_desconto
    BEFORE INSERT ON vendas 
    FOR EACH ROW
    BEGIN
		UPDATE vendas set valor_total = valor_total - promocoes.desconto
        where v.data_venda <= data_fim and  v.data_venda >= data_inicio;
    END;
    
//
DELIMITER ;

-- 3.Atualizar o preço médio de um produto após uma nova venda.

DELIMITER //
	CREATE TRIGGER preco_medio_produto
    AFTER INSERT ON vendas
    FOR EACH ROW
    BEGIN
		update produtos set media = (select avg(valor_total) from vendas where id_produto = new.id_produto)  where id_produto = new.id_produto ;
    END;
//
DELIMITER ;


-- 4.Rastrear alterações no estoque de produtos e registrar uma notificação dentro de um log.
DELIMITER //
	CREATE TRIGGER restrear
    BEFORE update ON produtos
	for each row
    begin
		insert into log (data_notificacao, qtdAnterior, qtdAtual, id_produto) values 
        (now(), (select quantidade_estoque from produtos), new.quantidade_estoque,  new.id_produto );
        
    end;
//
DELIMITER ;

-- 5.Registrar novos clientes e gerar uma mensagem de usuário cadastrado dentro de um log.

create table logUsuario (
    id_logUsuario int not null auto_increment primary key,
    data_cadastro date not null,
    idNewCliente int not null, foreign key(idNewCliente) references clientes(id_cliente)
);

DELIMITER //
	CREATE TRIGGER  novoUsuario
    after update on clientes
    for each row
	BEGIN
		insert into logUsuario (data_cadastro, idNewCliente) values
        (now(), new.id_cliente);
		
    END;
//
DELIMITER ;

-- 6.Monitorar vendas de produtos em promoção e registrar uma notificação.
-DELIMITER //

CREATE TRIGGER notificacao_venda_promo
AFTER UPDATE ON promocoes
FOR EACH ROW
BEGIN
    -- Atualiza o valor total das vendas dentro do período da promoção
    UPDATE vendas
    SET valor_total = valor_total - (valor_total * (NEW.desconto / 100))
    WHERE data_venda BETWEEN NEW.data_inicio AND NEW.data_fim;
    
    -- Insere uma notificação para cada venda afetada
    INSERT INTO notificacoes (mensagem, data_notificacao)
    SELECT CONCAT('Venda de um produto em promoção: ', nome_promocao), NOW()
    FROM promocoes
    WHERE data_inicio <= NOW() AND data_fim >= NOW();

END //

DELIMITER ;


-- 7.Registrar produtos em falta no estoque e gerar uma notificação.
DELIMITER //
	CREATE TRIGGER falta_estoque
    after update on produtos
    for each row 
    begin
		if new.quantidade_estoque < 1 then
			insert into notificacoes (mensagem, data_notificacao) values 
			( data_notificacao, 'O produto' + new.id_produto + 'está em falta no estoque');
		end if;
    end;
//
DELIMITER ;

-- 8.Atualizar o valor total de vendas de um produto após uma nova venda.
	DELIMITER // 
	CREATE TRIGGER atualiza_valotTotal
    after insert on vendas
    for each row
    begin
		if new.id_produto then
			update vendas 
            set vendas_total_prod = (select sum(vendas_total) from vendas where id_produto = new.id_produto)
            where id_produto = new.id_produto;
		end if;
    end;
//
DELIMITER ;

-- 9.Rastrear alterações no valor de produtos e registrar uma notificação.
DELIMITER //
CREATE TRIGGER trackPriceUpdateOnProduto
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF NEW.preco <> OLD.preco THEN
        INSERT INTO notificacoes VALUES
        (DEFAULT, CONCAT('Produto ', OLD.nome_produto, ': Preço mudado para ', NEW.preco, ' de ', OLD.preco, '.'), CURDATE());
    END IF;
END;
// DELIMITER ;




