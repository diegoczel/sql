/*
irá retornar tudo que tem no primeiro select que não tenha no segundo select
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
    t1_nome
from @t1
except
select
    t2_id,
    t2_nome
from @t2