create database db_exercito;

use db_exercito;

create table Soldado(
	idSoldado int primary key not null auto_increment,
    Nome varchar(255) not null,
    RM varchar(50) not null,
    DataNasc datetime not null
);

create table Municao(
	idMunicao int primary key not null auto_increment,
    Calibre varchar(20) not null
);

create table Arma(
	idArma int primary key not null auto_increment,
    NumSerie int not null,
    Tipo varchar(50) not null,
    Calibre varchar(50) not null,
    idMunicao int not null, foreign key(idMunicao) references Municao(idMunicao),
	idSoldado int not null, foreign key(idSoldado) references Soldado(idSoldado)
);

create table Limpeza(
	idLimpeza int primary key not null auto_increment,
    idSoldado int not null, foreign key(idSoldado) references Soldado(idSoldado),
    idArma int not null, foreign key(idArma) references Arma(idArma)

);
