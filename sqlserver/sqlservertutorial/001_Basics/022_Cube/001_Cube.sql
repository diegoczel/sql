/*
cube(ano, mes) e um atalho para:
group by grouping sets (
	(ano, mes),
	(ano),
	(mes),
	()
)
no caso, irá gerar todas as possibilidades de group baseado nas colunas passadas para cube
*/
declare @t table (
	ano int
	,mes int
	,valor decimal
);

insert into @t values
(2022, 5, 1000),
(2022, 4, 500),
(2021, 3, 300),
(2021, 5, 1500),
(2020, 10, 100);

select
	grouping(ano),
	grouping(mes),
	ano,
	mes,
	sum(valor)
from @t
group by
	cube(ano, mes)
order by
	grouping(ano), grouping(mes)