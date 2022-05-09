/*
rollup normalmente é utilizado para gerar dados hierarquicos, digamos:
rollup(ano, semestre, mes)
	ano, semestre, mes
	ano, semestre
	ano
	()
order by
	grouping(ano), grouping(semestre), grouping(mes)

cube() gera todas as possibilidades de groups.
grouping set faz os grupos manuais
*/
declare @t table (
	ano int,
	semestre int,
	--quadrimestre int,
	--trimestre int,
	--bimestre int,
	mes int,
	valor decimal
);

insert into @t values
(2022, 1, 1, 1000),
(2022, 1, 2, 750),
(2022, 1, 3, 500),
(2022, 2, 7, 1250),
(2022, 2, 8, 1500),
(2022, 2, 9, 1750),
(2021, 1, 1, 200),
(2021, 1, 2, 300),
(2021, 1, 3, 400),
(2021, 2, 7, 900),
(2021, 2, 8, 800),
(2021, 2, 9, 700);

select
	grouping(ano),
	grouping(semestre),
	grouping(mes),
	ano,
	semestre,
	mes,
	sum(valor)
from @t
group by
	-- cube(ano, semestre, mes) gera todas as possibilidades
	/* rollup(ano, semestre, mes)
	ano, semestre, mes
	ano, semestre
	ano
	()
	*/
	rollup(ano, semestre, mes)
order by
	grouping(ano), grouping(semestre), grouping(mes)
