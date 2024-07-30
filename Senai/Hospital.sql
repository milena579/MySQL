CREATE DATABASE Hospital;

use Hospital;

Create table Paciente(
	idPaciente int primary key not null auto_increment,
    Nome varchar(255) not null,
    Endereco varchar(200) not null,
    Idade int not null,
    CodRegistro varchar(100) not null
);

Create table Medico(
	IdMedico int primary key not null auto_increment,
    CRM varchar(100) not null,
    Nome varchar(255) not null,
    Especialidade varchar(100) not null
);

create table Consulta(
	IdConsulta int primary key not null auto_increment,
    IdMedico int,  foreign key (IdMedico) references Medico(IdMedico),
    IdPaciente int,  foreign key (IdPaciente) references Paciente(IdPaciente)
);

Create table Exame(
	IdExame int primary key not null auto_increment,
    NomeExame varchar(200) not null,
    IdMedico int not null,  foreign key (IdMedico) references Medico(IdMedico) ,
	IdPaciente int not null,  foreign key (IdPaciente) references Paciente(IdPaciente),
	IdConsulta int null,  foreign key (IdConsulta) references Consulta(IdConsulta)
    
);

Create table Medicamento(
	IdMedicamento int primary key not null auto_increment,
    NomeMedicamento varchar(200) not null,
    Quantidade int not null,
    IdMedico int not null,  foreign key (IdMedico) references Medico(IdMedico) ,
	IdPaciente int not null,  foreign key (IdPaciente) references Paciente(IdPaciente)
);

show tables;
