create database db_sistema;

use sistema;

create table cargos (
	idCargo int primary key not null auto_increment,
    NomeCargo varchar(155) not null,
    idPerfilPermissao int not null, foreign key (idPerfilPermissao) references perfilPermissao(idPerfilPermissao)
);

create table permissao(
	idPermissao int primary key not null auto_increment,
    NomePermissao varchar(150) not null
);

create table perfilPermissao(
	idPerfilPermissao int primary key not null auto_increment,
    NomePerfil varchar(150) not null,
    idPermissao int not null, foreign key (idPermissao) references permissao(idPermissao)
);

create table usuario(
	idUsuario int primary key not null auto_increment,
    Nome varchar(255) not null,
	idPerfilPermissao int not null, foreign key (idPerfilPermissao) references perfilPermissao(idPerfilPermissao),
    idCriador int not null
);

create table requisicao(
	idRequisicao int primary key not null auto_increment,
    idSolicitante int not null, foreign key  (idSolicitante) references usuario(idUsuario),
    idUsuarioCriador int not null, foreign key (idUsuarioCriador) references usuario(idUsuario),
    idPermissao int not null, foreign key (idPermissao) references permissao(idPermissao)
);
