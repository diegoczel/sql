/* pivot, maneira de agrupar os dados e exibir eles em forma de linhas.
para usar, segue uma sintaxe, sendo:

select
	col_1_agrupadora, col_n_agrupadora,
	[col_1_pivot], [col_n_pivot]
from (
	select_base_pivot
) base
pivot (
	agregações for col_pivot in (
		[col_1_pivot], [col_n_pivot]
	)
) p
*/

/* syntax
SELECT <non-pivoted column>,
    [first pivoted column] AS <column name>,
    [second pivoted column] AS <column name>,
    ...
    [last pivoted column] AS <column name>
FROM
    (<SELECT query that produces the data>)
    AS <alias for the source query>
PIVOT
(
    <aggregation function>(<column being aggregated>)
FOR
[<column that contains the values that will become column headers>]
    IN ( [first pivoted column], [second pivoted column],
    ... [last pivoted column])
) AS <alias for the pivot table>
<optional ORDER BY clause>;
*/

/* Quantidade de colunas EXATA

*/
declare @t table (
	ano int
	,semestre int
	,mes int
	,valor decimal
);
insert into @t values
(2013, 1,1, 100), (2013, 1,1, 100), (2013, 1,1, 100),
(2013, 1,1, 100), (2013, 1, 2, 200), (2013, 1, 3, 300),
(2013, 1,4, 400), (2013, 1,5, 500), (2013, 1,6, 600),
(2013, 2, 7, 700), (2013, 2, 8, 800), (2013, 2, 9, 900),
(2013, 2, 10, 1000), (2013, 2, 11, 1100), (2013, 2, 12, 1200);

declare @cols nvarchar(max) = '';
select 
	@cols += quotename(mes) + ','
from @t;

set @cols = left(@cols, len(@cols) - 1);
select @cols;

select ano
	,[1] as 'col1' , [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
from (
	select ano, mes, valor from @t
) pivot_base
pivot (
	sum(valor) for mes in (
		[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
		--@cols
	)
) p;

-- exemplo usando pivot com 2 colum, ano e semestre
select
	-- agrupadores
	ano, semestre
	-- nome da coluna resultado, baseado no valor real da coluna mes do select p_base
	,[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
from (
	select ano, semestre, mes, valor from @t
) as p_base
pivot (
	-- math das agregações
	sum(valor) for mes in (
		[1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
	)
) p_1;

-- exemplo agrupando normal, sem pivot
select
	ano, semestre, mes, sum(valor)
from @t
group by ano, semestre, mes;