create database Transportadora;

use Transportadora;

create table Caminhao(
	idCaminhao int primary key not null auto_increment,
    CapacidadeVol int not null,
    CapacidadePeso varchar(50) not null,
    NumeroViagens int not null
);

create table Viagem(
	idViagem int primary key not null auto_increment,
    idCaminhao int not null, foreign key(idCaminhao) references Caminhao(idCaminhao),
    idEcomenda int not null, foreign key(idEcomenda) references Encomenda(idEcomenda),
    idLoja int not null, foreign key(idLoja) references Loja(idLoja)
);

create table Loja(
	idLoja int primary key not null auto_increment,
    Nome varchar(50) not null,
    Lugar varchar(50) not null
);

create table Encomenda(
	idEcomenda int primary key not null auto_increment,
    DataEncomenda datetime not null,
    Peso varchar(15),
    Destino varchar(150) not null,
	idLoja int not null, foreign key(idLoja) references Loja(idLoja)
);
