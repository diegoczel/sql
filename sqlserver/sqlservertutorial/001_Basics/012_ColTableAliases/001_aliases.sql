select
	col1,
	col2 as 'col x',
	col3 'nome'
from table1 t1
join table2 t2 on t2.id = t1.id
order by
	'nome',
	col2