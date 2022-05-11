/*
* é a intersecção na teoria dos conjuntos, irá pegar os dados que estão em ambos selects.
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

-- return intersect when t1_nome e t2_nome for igual
select
	t1_nome
from @t1 t1
intersect
select
	t2_nome
from @t2 t2

-- intersect multi column, no caso, return quando existir ambos registros iguais em ambos selects
select
	t1_id, t1_nome
from @t1 t1
intersect
select
	t2_id,t2_nome
from @t2 t2