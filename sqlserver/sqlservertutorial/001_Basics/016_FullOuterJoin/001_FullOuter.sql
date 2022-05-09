/* full outer join
irá retornar o join, left join e right join
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
(4, 'reg 4');

select *
from @l
full outer join @r on id_l = id_r
/* result
1	diego	1	reg 1
2	cris	2	reg 2
3	tales	NULL	NULL
NULL	NULL	4	reg 4
*/

-- nesse caso, retorna só o que não tem um join
-- digamos, só o que tem na table l
-- e só o que tem na table r
select *
from @l
full outer join @r on id_l = id_r
where 
	id_l is null
	or id_r is null
/* result
3	tales	NULL	NULL
NULL	NULL	4	reg 4
*/
