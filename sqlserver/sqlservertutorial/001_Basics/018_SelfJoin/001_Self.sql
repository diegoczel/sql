/* Self Join
Join a table to itself.
Ajuda para efetuar consultas hierarquicas ou comparar row na mesma table.
*/

declare @pessoa table (
	id int,
	nome varchar(25),
	gerente int
);

insert into @pessoa values
(1, 'a', 0),
(2, 'b', 1),
(3, 'c', 1),
(4, 'd', 3);

select *
from @pessoa func
inner join @pessoa ger on func.gerente = ger.id

-- mostra o gerente, pai de todos
select *
from @pessoa func
left join @pessoa ger on func.gerente = ger.id