-- Inserir um novo veículo e seu proprietário (com trigger)
create table tg_new_proprietario(
	id int not null primary key auto_increment,
    data_inserido date not null
);
DELIMITER // 
	CREATE PROCEDURE inserirNovoVeiculo (marca VARCHAR(255), modelo VARCHAR(255), placa VARCHAR(7), ano INT, proprietario_id INT)
    BEGIN
		INSERT INTO Veiculos (marca, modelo, placa, ano, proprietario_id) values (marca, modelo, placa, ano, proprietario_id);
    END;    
//
DELIMITER ;

-- Deletar um veículo e suas multas associadas (com trigger)
DELIMITER // 
	CREATE PROCEDURE deletarVeiculos(idVeiculo int)
    BEGIN
		delete from multas where infracao_id in (select id from infracoes where veiculo_id = id_veiculo);
		delete from infracoes where veiculo_id =  id_veiculo;
		delete from licenciamentos where veiculo_id =  id_veiculo;
		DELETE FROM Veiculos WHERE id = idVeiculo;
    END;    
//
DELIMITER ;
Inserir uma nova infração e atualizar multas associadas (com trigger)
DELIMITER //
create procedure insert_infracao_multa(descricao VARCHAR(255), gravidade ENUM('Leve', 'Média', 'Grave', 'Gravíssima'), data_ocorrencia DATE, veiculo_id int,valor DECIMAL(10, 2), pontos INT, data_aplicacao DATE)
begin
	INSERT INTO infracoes (descricao, gravidade, data_ocorrencia, veiculo_id) VALUES (descricao, gravidade, data_ocorrencia, veiculo_id);
    INSERT INTO Multas (valor, pontos, data_aplicacao, infracao_id) VALUES (valor, pontos, data_aplicacao,
    (select id from infracoes where descricao = descricao and gravidade=gravidade and  data_ocorrencia = data_ocorrencia and  veiculo_id=veiculo_id));
end;
// DELIMITER ;

-- Atualizar pontos na carteira de um proprietário específico que levou uma multa(com trigger)
DELIMITER //
create procedure update_carteira(id_prop int)
begin
    set @points = (select sum(pontos) from multas where infracao_id in (select id from infracoes where veiculo_id IN (select id from veiculos where proprietario_id = id_pro)));
    update propietarios set  pontos_cartreira = @points where id = id_prop;
end;
// DELIMITER ;

-- Deletar um proprietário e seus veículos associados (com trigger)
DELIMITER //
create procedure delete_proprietarios(id_prop int)
begin
	delete from multas where infracao_id in (select id from infracoes where veiculo_id in (select id from veiculos where proprietario_id = id_prop));
    delete from infracoes where veiculo_id in  (select id from veiculos where proprietario_id = id_prop);
    delete from licenciamentos where veiculo_id in (select id from veiculos where proprietario_id = id_prop);
    delete from veiculos where id in (select id from veiculos where proprietario_id = id_prop);
    delete from proprietarios where id = @id_prop;
end;
// DELIMITER ;


-- Selecionar veículos com licenciamento expirado
	DELIMITER // 
	CREATE PROCEDURE licenciamento_expirado()
    BEGIN
		SELECT l.data_validade as 'Data Vencimento', v.modelo, v.placa FROM Licenciamentos l 
        
        INNER JOIN Veiculos v
        ON v.id = l.veiculo_id 
        where data_validade < now();
        
    END;
    //
    DELIMITER ;

    call licenciamento_expirado();
    
-- Selecionar veículos que possuem multas graves
	DELIMITER // 
	CREATE PROCEDURE multas_graves()
    BEGIN
		SELECT v.modelo, v.placa, i.gravidade FROM Veiculos v
        
        INNER JOIN Infracoes i
        ON v.id = i.veiculo_id 
        where i.gravidade = 'Grave';
    END;
    //
    DELIMITER ;
    call multas_graves();
    
-- Selecionar veículos acima de 2021 
	DELIMITER // 
	CREATE PROCEDURE veiculos_2021()
    BEGIN
		SELECT v.modelo, v.placa, v.ano, m.valor, i.descricao FROM Veiculos v
        where v.ano > 2021;
    END;
    //
    DELIMITER ;
    call veiculos_2021();
    
    
-- Selecionar multas de veículos abaixo de 2020
	DELIMITER // 
	CREATE PROCEDURE multas_abaixo_2020()
    BEGIN
		SELECT v.modelo, v.placa, v.ano, m.valor, i.descricao FROM Veiculos v
        
        inner join infracoes i
        on i.veiculo_id = v.id
        
        inner join multas m
        on m.infracao_id = i.id
        
        where v.ano < 2020;
    END;
    //
    DELIMITER ;
        
    call multas_abaixo_2020();

-- Selecionar todos os veículos com multas pendentes

-- Inserir um novo proprietário
	DELIMITER // 
	CREATE PROCEDURE novoProprietario(nome VARCHAR(255), cpf VARCHAR(11), endereco VARCHAR(255), telefone VARCHAR(20), pontos_carteira INT)
    BEGIN
		INSERT INTO Proprietarios (nome, cpf, endereco, telefone, pontos_cartreira) values (nome, cpf, endereco, telefone, pontos_carteira);
    END;
    //
    DELIMITER ;
    DROP procedure novoProprietario;
    CALL novoProprietario('Milena', '0817600006', 'joao', '999999999', 0);


-- Atualizar informações de um proprietário
	DELIMITER // 
	CREATE PROCEDURE atualizarProprietario (id int , nome VARCHAR(255), cpf VARCHAR(11), endereco VARCHAR(255), telefone VARCHAR(20), pontos_carteira INT)
    BEGIN
		UPDATE Proprietarios set nome = nome, cpf = cpf , endereco = endereco, telefone = telefone, pontos_cartreira = pontos_carteira 
        WHERE id = id;
    END;    
    //
    DELIMITER ;
    SET SQL_SAFE_UPDATES=0;
    SELECT * FROM Proprietarios;
    DROP procedure atualizarProprietario;
    CALL atualizarProprietario( 5, 'Milena', '00000000000', 'JOAO KRAAAA', '999999999', 1);
    
    
-- Deletar um proprietário
	DELIMITER // 
	CREATE PROCEDURE deletarProprietario (id int)
    BEGIN
		DELETE FROM Proprietarios WHERE id = id;
    END;    
    //
    DELIMITER ;
    CALL deletarProprietario(5)


-- Selecionar todos os proprietários
	DELIMITER // 
	CREATE PROCEDURE selecionarProprietarios()
    BEGIN
		select *  from proprietarios;
    END;    
    //
    DELIMITER ;
    CALL selecionarProprietarios()
    
-- Inserir uma nova infração
	DELIMITER // 
	CREATE PROCEDURE novaInfracao(descricao VARCHAR(255), gravidade ENUM('Leve', 'Média', 'Grave', 'Gravíssima'), data_ocorrencia DATE, veiculo_id INT)
    BEGIN
		INSERT INTO Infracoes (descricao, gravidade, data_ocorrencia, veiculo_id) values (descricao, gravidade, data_ocorrencia, veiculo_id);
    END;
    //
    DELIMITER ;
    DROP procedure novaInfracao;
    CALL novaInfracao('furou sinal vermelho', '2', '2024-08-20', '1');
    select * from Infracoes

-- Atualizar informações de uma infração
	DELIMITER // 
	CREATE PROCEDURE editarInfracoes(idIn int, descricao VARCHAR(255), gravidade ENUM('Leve', 'Média', 'Grave', 'Gravíssima'), data_ocorrencia DATE, veiculo_id INT)
    BEGIN
		UPDATE  Infracoes SET  descricao = descricao,  gravidade =  gravidade, data_ocorrencia = data_ocorrencia, veiculo_id = veiculo_id WHERE idIn = id;
    END;
    //
    DELIMITER ;
    CALL editarInfracoes(11, 'teste', 2, '2024-08-20', '1');
    
-- Deletar uma infração
	DELIMITER // 
	CREATE PROCEDURE deletarInfracao(id int)
    BEGIN
		DELETE FROM Infracoes WHERE id = id;
    END;
    //
    DELIMITER ;
    CALL deletarInfracao(11);
    
-- Selecionar todas as infrações
	DELIMITER // 
	CREATE PROCEDURE selecionarInfracoes()
    BEGIN
		SELECT * FROM Infracoes;
    END;
    //
    DELIMITER ;
    CALL selecionarInfracoes();
    
-- Inserir um novo licenciamento
	DELIMITER // 
	CREATE PROCEDURE novoLicenciamento(data_validade DATE, veiculo_id INT)
    BEGIN
		INSERT INTO Licenciamentos (data_validade, veiculo_id) values ( data_validade, veiculo_id);
    END;
    //
    DELIMITER ;
	CALL novoLicenciamento('2024-08-20', 2);
    
-- Atualizar informações de um licenciamento
	DELIMITER // 
	CREATE PROCEDURE atualizarLicenciamentos( idLi int, data_validade DATE, veiculo_id INT)
    BEGIN
		UPDATE Licenciamentos SET data_validade = data_validade, veiculo_id = veiculo_id WHERE idLi = id;
    END;
    //
    DELIMITER ;
	CALL atualizarLicenciamentos(1, '2024-08-20', 2);


