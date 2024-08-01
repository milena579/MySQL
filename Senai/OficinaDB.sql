-- INSERT INTO cliente(Contato, Endereco) values
-- ('4194654564', 'Rua A, 123, Cidade X'),
-- ('4146546464', 'Av. B, 456, Cidade Y'),
-- ('1198764653', 'Rua C, 789, Cidade Z' );


-- INSERT INTO pessoafisica values
-- (14, 'Maria Oliveira,', '10987654321'),
-- (15, 'João Silva', '123456789');

-- INSERT INTO pessoajuridica values 
-- (16, 'Rimatur', '1231316500001');

-- ALTER TABLE cliente
-- add column Endereco varchar(150);

-- INSERT INTO cliente(Endereco) values 
-- ('Rua A, 123, Cidade X'),
-- ('Av. B, 456, Cidade Y'),
-- ('Rua C, 789, Cidade Z')

-- SELECT * FROM cliente

ALTER table carro 
ADD foreign key (IdDono) references cliente(IDCliente)



INSERT INTO carro(Marca, Modelo, Ano, Placa, IdDono) values
('Volkswagen', 'Gol', 2019, 'GHI9101', 14),
('Ford', 'Fiesta', 2018, 'ABC1234', 15),
('Toyota', 'Corolla', 2021, 'JKL1122', 16)

ALTER TABLE servico 
ADD column Preco float


INSERT INTO servico (Descricao, Preco) values
('Troca de óleo', 150.00),
('Troca de pneus', 300.00 ),
( 'Revisão periódica', 200.00),
( 'Reparo elétrico', 180.00)


ALTER table ordem 
ADD column Status varchar(50)



INSERT INTO ordem (IDCliente, DataEntrada, DataSaida, Status) values 
(15, '2024-07-15', '2024-07-16', 'Concluída'),
(14, '2024-07-20', '2024-07-22', 'Em andamento'),
(15, '2024-07-25', NULL, 'Em andamento'),
(16, '2024-07-28', '2024-07-30', 'Concluída')


select * from ordem


INSERT INTO ordemcarro(IDOrdem, IDCarro) values 
(1,2),
(2,1),
(4,3)

INSERT INTO ordemservico (IDOrdem, IDServico) values 
(1,1),
(2,2),
(3,3),
(4,4)

ALTER TABLE item DROP idServico

INSERT INTO item (Descricao) values 
('Óleo'),
('Pneu'),
('Revisão'),
('Horas')

INSERT INTO ordemitem (IDOrdem, IDItem, Quantidade) values
(1,1, 5.0),
(2, 2, 4.0),
(3,3, 1.0),
(4, 4, 2.0)



SELECT * FROM ordemcarro
SELECT * FROM carro
