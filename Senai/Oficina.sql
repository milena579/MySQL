CREATE DATABASE Oficina;

use Oficina;

create table Carro (
	idCarro int primary key not null auto_increment,
    Marca varchar(100) not null,
    Modelo varchar(100) not null,
    Ano  datetime not null, 
    Placar varchar(15) not null
);

create table Cliente(
	idCliente int primary key not null auto_increment,
    Cliente varchar(250) not null,
    Telefone varchar(50) not null,
    Endereco varchar(200) not null
);

create table Ordem (
	idOrdem int primary key not null auto_increment,
    idCliente int, foreign key (idCliente) references Cliente(idCliente),
    idCarro int, foreign key (idCarro) references Carro(idCarro),
	DataEntrada datetime not null,
    DataSaida datetime not null,
    Status varchar(30) not null,
    Observacoes varchar(150)
);
