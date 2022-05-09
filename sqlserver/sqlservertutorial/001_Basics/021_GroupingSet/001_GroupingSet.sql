/*
-grouping set � a jun��o de varios agrupamentos dentro de um mesmo select
-situa��o onde tem que fazer um select de v�rios agrupamentos, ao inv�s de usar varios union all, utiliza grouping set.
-- grouping(col) diz se uma coluna � agrupada ou n�o
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
	-- when 1, significa que ano est� sendo agrupada por mes
	grouping(ano) as 'Group year',
	-- when 1, significa que mes est� sendo agrupada por ano
	grouping(mes) as 'Group month',
	ano,
	mes,
	sum(valor)
from @t
-- ir� efetuar 4 agrupamentos dentro do mesmo select.
group by grouping sets (
	(ano, mes),
	(ano),
	(mes),
	()
)
/*having 
	grouping(ano) = 1
	or grouping(mes) = 1*/
order by
	grouping(ano), grouping(mes)
select
	ano,
	mes,
	sum(valor)
from @t
group by
	ano, mes