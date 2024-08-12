CREATE database PaieFilho;

use PaieFilho;

create table Tb_pai (
	id_pai smallint(6) primary key not null auto_increment,
    nome_pai varchar(50) not null 
);

create table Tb_filho(
	id_filho smallint(6) primary key not null auto_increment,
    nome_filho varchar(50),
    id_pai smallint(6) ,
    foreign key (id_pai) references Tb_pai(id_pai) 
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

insert into Tb_pai values
	(1, 'DarthVader'),
	(2, 'Goku'),
	(3, 'Vegeta'),
	(4, 'SeuCebola'),
	(5, 'Zurg'),
	(6, 'Neymar');

insert into Tb_filho values
	(1, 'LukeSkywalker', 1),
	(2, 'Gohan', 2),
	(3, 'Trunks', 3),
	(4, 'Cebolinha', 4),
	(5, 'BuzzLigthyear', 5),
	(6, 'NeymarJr', 6);
    
SET SQL_SAFE_UPDATES = 0;    
    
DELETE from Tb_filho where nome_filho = 'Cebolinha';

DELETE FROM Tb_pai where nome_pai = 'Neymar';

Delete from Tb_pai where nome_pai = 'DarthVader';

DROP TABLE Tb_filho;
DROP TABLE Tb_pai;


select * from Tb_filho;

select * from Tb_pai;


show tables;
