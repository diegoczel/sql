/*
create table promocao (
	promo_id int primary key identity(1, 1)
	,promo_nome varchar(10) not null
	,promo_desconto numeric(3,2) default 0
	,promo_ini date not null
	,promo_fim date not null
);
*/

-- basic insert, quando precisa inserir determinadas colunas
/*
insert into promocao (
	promo_nome
	,promo_desconto
	,promo_ini
	,promo_fim
) 
values (
	'2022-5'
	,0.25
	,'2022-05-01'
	,'2022-05-31'
);
*/

-- insert retornando valores inseridos usando output e inserted
/*
insert into promocao (
	promo_nome
	,promo_desconto
	,promo_ini
	,promo_fim
) output 
	-- colunas que ser�o retornadas ap�s o insert
	inserted.promo_id
	,inserted.promo_nome
	,inserted.promo_desconto
	,inserted.promo_ini
	,inserted.promo_fim
values (
	'2022-4'
	,0.25
	,'2022-04-01'
	,'2022-04-30'
);
*/
/* output resulta em:
2	2022-4	0.25	2022-04-01	2022-04-30
*/

-- insert um id em coluna identity.
/*
-- habilita inserir valor em colunas identity
set identity_insert promocao on;

insert into promocao (
	promo_id
	,promo_nome
	,promo_desconto
	,promo_ini
	,promo_fim
) output 	
	inserted.promo_id
	,inserted.promo_nome
	,inserted.promo_desconto
	,inserted.promo_ini
	,inserted.promo_fim
values (
	4 -- pk identity, mas ser� adicionado manualmente
	,'2022-3'
	,0.11
	,'2022-03-01'
	,'2022-03-31'
);

-- desabilita a inser��o de valor em colunas identity
set identity_insert promocao off;
*/

/* no insert acima, pulei a numera��o da pk, e neste puxou corretamente a pr�xima baseada no insert anterior.
testando tamb�m a coluna promo_desconto, pois a mesma tem um default 0, caso n�o passar ela no insert.
*/
/*
insert into promocao(
	promo_nome, 
	promo_ini, 
	promo_fim
) 
values ('2022-01', '2022-01-01', '2022-01-31');
*/

-- insert de um select
-- note que no insert de um select, pode-se inserir os comandos top value | % para limitar os registros informados.
/* neste caso, fiz insert na tabela promocao de um select na tabela promoca
insert into promocao (
	promo_nome
	,promo_desconto
	,promo_ini
	,promo_fim
) output inserted.*
-- select que monta os dados para inserir no insert
select
	promo_nome
	,promo_desconto
	,promo_ini
	,promo_fim
from promocao
order by promo_id desc
*/
select * from promocao;


