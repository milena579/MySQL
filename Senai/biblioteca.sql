CREATE DATABASE db_biblioteca;

use db_biblioteca;

CREATE TABLE usuario (
	IdUsuario int primary key not null auto_increment,
    Nome varchar(255) not null,
    CPF varchar(15) not null,
    DataNasc date not null
);

CREATE TABLE Cliente (
	IdCliente int primary key not null auto_increment,
    idUsuario int not null, foreign key (idUsuario) references usuario(IdUsuario)
);

CREATE TABLE Funcionario (
	IdFuncionario int primary key not null auto_increment,
	idUsuario int not null, foreign key (idUsuario) references usuario(IdUsuario),
    DataContratacao  date not null,
    Funcao varchar(150) not null
);


CREATE TABLE livro (
	IdLivro int primary key not null auto_increment,
    Nome varchar(150) not null,
    Categoria varchar(150) not null,
    QtdPaginas int not null,
    Autor varchar(250) not null
);

CREATE TABLE emprestimo(
	IdEmprestimo int primary key not null auto_increment,
    DataInicio date not null,
    DataFim date not null,
    idUsuario int not null, foreign key (idUsuario) references usuario(IdUsuario),
    idLivro int not null, foreign key (idLivro) references livro(IdLivro)
);

CREATE TABLE devolucao(
	IdDevolucao int primary key not null auto_increment,
    Status varchar(100) not null,
    DataPrevista date not null,
    DataDevolucao date not null,
    idUsuario int not null, foreign key (idUsuario) references usuario(IdUsuario),
    idLivro int not null, foreign key (idLivro) references livro(IdLivro)
);


CREATE TABLE pesquisa(
	IdPesquisa int primary key not null auto_increment,
    idLivro int not null, foreign key (idLivro) references livro(IdLivro),
    Situacao varchar(100) not null,
    DataPesquisa date not null
);





