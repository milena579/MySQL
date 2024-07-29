CREATE DATABASE db_floricultura

use db_floricultura;

create table Cliente(
	id_cliente int not null primary key auto_increment,
    Rg varchar(15) not null,
    Nome varchar(255) not null,
    Telefone varchar(30) not null,
    Endereco varchar(150) not null
);

create table Compra(
	id_compra int not null primary key auto_increment,
    DataCompra datetime not null,
    ValorTotal float not null,
    idCliente int not null, foreign key(idCliente) references Cliente(id_cliente)
);

create table Produto(
	id_produto int not null primary key auto_increment,
    Nome varchar(60) not null,
    Tipo varchar(60) not null,
    Preco float not null,
    QtdEstoque int not null
);

create table ClienteProduto(
	id_clienteproduto int not null primary key auto_increment,
    idCliente int not null, foreign key(idCliente) references Cliente(id_cliente),
    idProduto int not null, foreign key(idProduto) references Produto(id_produto)
);



