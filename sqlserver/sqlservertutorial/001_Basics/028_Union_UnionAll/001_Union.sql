/*
* Union 
    - irá unificar os dados distintos entre dois selects.
    - monta o result de forma pareada, ou seja, t1_1 com t2_1, t1_2 com t2_2, assim por diante.
* Union all 
    - irá unificar os dados distintos entre dois selects incluindo os registros repetidos.
    - monta o resultado com todos registros de t1, para depois incluir os registros de t2.
* Union e union all
    montam os dados no sentido |, nas colunas
* Join's   
    montam os dados no sentido -, nas linhas.
*/

declare @t1 table (
	t1_id int,
	t1_nome varchar(2)
);

declare @t2 table (
	t2_id int,
	t2_nome varchar(4)
);

insert into @t1 values (1, 'a'), (2, 'b'), (3, 'c');

insert into @t2 values (1, 'a'), (1, 'a'),/*(2, 'bb'),*/ (3, 'cc'), (4, 'dd');

select
	t1_id,
	t1_nome,
	'@t1'
from @t1 t1
union
select
	t2_id,
	t2_nome,
	'@t2'
from @t2 t2

select
	t1_id,
	t1_nome,
	'@t1'
from @t1 t1
union all
select
	t2_id,
	t2_nome,
	'@t2'
from @t2 t2

select *
from @t1 
join @t2 on t1_id = t2_id