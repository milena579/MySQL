-- Quais são os estúdios cadastrados no banco de dados?
	select Nome from tb_estudio;


-- Quantos filmes foram lançados em cada ano?
	select AnoLancamento, COUNT(AnoLancamento) as 'Qtd Lancamentos' from tb_filmes GROUP BY AnoLancamento;


-- Quais são os atores estrangeiros no banco de dados e quantos são?
	select Nome, (select COUNT(IDAtor) from tb_atores) as 'Qtd estrangeiros'  from tb_atores  WHERE Nacionalidade != 'Americana';


-- Qual é o filme mais recente lançado?
	select Nome, AnoLancamento from tb_filmes ORDER BY AnoLancamento DESC LIMIT 1;


-- Quais são os estúdios que tiveram um faturamento superior a 1 milhão no ano anterior?
	select Nome, FaturamentoAnoAnterior  as 'Faturamento acima de 1M' from tb_estudio WHERE FaturamentoAnoAnterior > 1000000;


-- Quantos atores têm menos de 30 anos?
	select count(Idade) as 'Qtd atores menos que 30 anos' from tb_atores WHERE Idade < 30;
    
    
-- Qual é a média de meses de produção dos filmes?
	select avg(Meses) as 'Média meses producao de filme' from tb_filmes;


-- Qual é o filme em que um ator recebeu o maior cachê?
	select f.Nome from tb_filmes f
    INNER JOIN tb_papel p
    ON p.IDFilme = f.IDFilme
    
    WHERE p.CacheAtor in (select max(CacheAtor) from tb_papel);


-- Quais são os filmes que foram lançados nos últimos 5 anos?
	select Nome, AnoLancamento from tb_filmes ORDER BY AnoLancamento Desc LIMIT 5;


-- Qual é o estúdio com a data de fundação mais recente?
	select Nome, DataFundacao from tb_estudio order by DataFundacao DESC LIMIT 1;


-- Quais são os atores que já atuaram em mais de 5 filmes?
	select a.Nome from tb_atores a
    
    INNER JOIN tb_papel p
    ON p.IDAtor = a.IDAtor 
    
    group by a.Nome
    having count(a.Nome) > 5;


-- Qual é o custo médio total dos filmes produzidos por cada estúdio?
	select e.Nome, avg(f.CustoTotal) as 'Média total filmes' from tb_filmes f
    inner join tb_estudio e
    on  e.IDEstudio = f.IDEstudio
    group by e.Nome;
    
    
-- Quais são os atores brasileiros que têm mais de 40 anos?
	select Nome, Idade from tb_atores WHERE Idade > 40 and Nacionalidade = 'Americana';

-- Quais são os filmes e seus custos totais, ordenados pelo custo total em ordem crescente?
		select Nome, CustoTotal from tb_filmes order by CustoTotal asc ;
        
        
-- Quantos atores têm a letra inicial do seu nome entre K e W?
	select COUNT(Nome) from tb_atores WHERE Nome between 'K%' and 'W%';


-- Quantos filmes têm custo total entre $100.00 e $500.00?
	select COUNT(Nome) from tb_filmes WHERE CustoTotal between '100.00' AND '500.00';


-- Quantos estúdios têm um faturamento no ano anterior superior a $1 milhão e uma data de fundação anterior a 2000?
	SELECT COUNT(Nome) from tb_estudio WHERE FaturamentoAnoAnterior > 1000000 and YEAR(DataFundacao) < 2000;

