/*
-grouping set é a junção de varios agrupamentos dentro de um mesmo select
-situação onde tem que fazer um select de vários agrupamentos, ao invés de usar varios union all, utiliza grouping set.
-- grouping(col) diz se uma coluna é agrupada ou não
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
	-- when 1, significa que ano está sendo agrupada por mes
	grouping(ano) as 'Group year',
	-- when 1, significa que mes está sendo agrupada por ano
	grouping(mes) as 'Group month',
	ano,
	mes,
	sum(valor)
from @t
-- irá efetuar 4 agrupamentos dentro do mesmo select.
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