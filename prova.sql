/*
Crie uma Stored Procedure que liste o nome dos atores em ordem de último nome, seguido de primeiro nome
*/

DROP PROCEDURE IF EXISTS nome_dos_atores;
	DELIMITER $$
	CREATE PROCEDURE nome_dos_atores ()
	BEGIN
		SELECT primeiro_nome
        FROM ator
		order by ultimo_nome desc;
	END $$
	DELIMITER ;

	CALL nome_dos_atores;


/*
Crie uma Stored Procedure que receba um parâmetro (duracao) e liste os título dos 
filmes com duração do filme maior ou igual ao parâmetro recebido
*/

DROP PROCEDURE IF EXISTS title_of_films_by_duration;
	DELIMITER $$
	CREATE PROCEDURE title_of_films_by_duration(duracao SMALLINT)
	BEGIN
		SELECT titulo
        FROM filme
		where duracao_do_filme  >= duracao ;
	END $$
	DELIMITER ;

	CALL title_of_films_by_duration(185);

/*
Crie uma Stored Procedure que recebe um parâmetro (valor_minimo) e 
liste o título dos filmes com preço de locação abaixo do valor recebido, ordenados pelo título.
*/

DROP PROCEDURE IF EXISTS title_of_films_by_price;
	DELIMITER $$
	CREATE PROCEDURE title_of_films_by_price(price DECIMAL)
	BEGIN
		SELECT titulo
        FROM filme
		where preco_da_locacao < price
        ORDER BY titulo;
	END $$
	DELIMITER ;

	CALL title_of_films_by_price(4.99);


/*
Crie uma Stored Procedure que receba um parâmetro (nome_do_filme) e 
liste quais atores trabalharam no filme
*/

/* Tentei usar a procedure com um parametro sendo varchar e não funcionou
ai opttei por inserir o id, podes mostrar depois como ficaria ?
*/

DROP PROCEDURE IF EXISTS actors_by_films;
	DELIMITER $$
	CREATE PROCEDURE actors_by_films(id_filme int)
	BEGIN
        select titulo,
        concat(primeiro_nome, " " ,ultimo_nome) as ator
        from filme
        left join filme_ator on filme.filme_id = filme_ator.filme_id 
        inner join ator on  ator.ator_id = filme_ator.ator_id
        where filme.filme_id = id_filme;

	END $$
	DELIMITER ;

	CALL actors_by_films(1);


/*
Crie uma Stored Procedure que receba um parâmetro (nome_do_ator) e liste quais filmes o ator trabalhou
*/

/*
mesmo problema da 4, ai utilizei o id do ator e na tabela inclui o nome dele 
*/

DROP PROCEDURE IF EXISTS works_actors;
	DELIMITER $$
	CREATE PROCEDURE works_actors(id_ator int)
	BEGIN
        select titulo,
        concat(primeiro_nome, " " ,ultimo_nome) as ator
        from filme
        inner join filme_ator on filme.filme_id = filme_ator.filme_id 
        left join ator on  ator.ator_id = filme_ator.ator_id
        where ator.ator_id = id_ator;
	END $$
	DELIMITER ;

	CALL works_actors(3);














