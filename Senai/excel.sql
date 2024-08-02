create database db_execel;

use db_execel;


create table local (
	idLocal int primary key not null auto_increment,
    CidadeEstado varchar(255) not null
);

create table pessoa(
	idPessoa int primary key not null auto_increment,
    Nome varchar(255) not null,
    idLocal int not null, foreign key (idLocal) references local(idLocal)
);

create table telefone (
	idTelefone int primary key not null auto_increment,
    Telefone varchar(150) not null,
    idPessoa int not null, foreign key (idPessoa) references pessoa(idPessoa)
);
