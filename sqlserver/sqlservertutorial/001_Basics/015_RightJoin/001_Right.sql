/* ritht join select row da tabela da direita e então faz o match com tabela da esquerda.
irá retornar o join e
todos dados da direita com null na esquerda quando não tem join
*/
declare @l table (id_l int, nome varchar(20));
insert into @l values 
(1, 'diego'), 
(2, 'cris'), 
(3, 'tales'); -- aqui não retorna, pois não tem correspondenge na direita 

declare @r table (id_r int, descricao varchar(20));
insert into @r values 
(1, 'reg 1'), 
(2, 'reg 2'), 
(4, 'reg 4');-- aqui retorna null na esquerda, pois não tem join

select *
from @l
right join @r on id_l = id_r

--where id_l is null
-- este camarada irá pegar só o que tem na tabela da direita

/* result - note como id 3 não tem nada na table @r, log deixa null
1	diego	1	reg 1
2	cris	2	reg 2
NULL	NULL	4	reg 4
*/