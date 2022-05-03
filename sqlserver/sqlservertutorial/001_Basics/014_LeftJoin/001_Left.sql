/* left join, irá retornar os seguintes dados: 
join, caso tem registros nas 2 tabelas
todos dados da esquerda mais null da direita quando não tem join
*/

declare @l table (id_l int, nome varchar(20));
insert into @l values 
(1, 'diego'), 
(2, 'cris'), 
(3, 'tales');

declare @r table (id_r int, descricao varchar(20));
insert into @r values 
(1, 'reg 1'), 
(2, 'reg 2'), 
(4, 'reg 4'); -- aqui não pega no left join

select *
from @l
left join @r on id_l = id_r

--where id_r is null
-- este camarada irá pegar só o que tem na tabela da esquerda

/* result - note como id 3 não tem nada na table @r, log deixa null
1	diego	1	reg 1
2	cris	2	reg 2
3	tales	NULL	NULL
*/