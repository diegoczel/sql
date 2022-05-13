declare @categoria table (
	cat_id int
	,cat_nome varchar(5)
);

insert into @categoria values 
(1, 'cat_a'), (2, 'cat_b'), (3, 'cat_c'), (4, 'cat_d');

declare @produto table (
	pro_id int
	,pro_nome varchar(5)
	,pro_cat_fk int
);

insert into @produto values
(1, 'pro_a', 4), (2, 'pro_b', 3), (3, 'pro_c', 2), (4, 'pro_d', 1),
(5, 'pro_e', 1), (6, 'pro_f', 2), (7, 'pro_g', 3), (8, 'pro_h', 4);

declare @vendas table (
	ven_id int
	,ven_nitem int
	,ven_pro_fk int
	,ven_qtd int
	,ven_ano int
);

insert into @vendas values
(1, 1, 8, 5, 2019), (1, 2, 5, 7, 2019),
(1, 3, 4, 2, 2019), (1, 4, 2, 1, 2019),
(2, 1, 7, 3, 2019),
(3, 1, 6, 7, 2020), (4, 1, 5, 4, 2020),
(5, 1, 4, 8, 2021), (5, 2, 3, 2, 2021),
(6, 1, 2, 5, 2022), (7, 1, 1, 3, 2022);

select
	cat_id
	,count(*) as [Total a]
from @vendas
inner join @produto on ven_pro_fk = pro_id
inner join @categoria on cat_id = pro_cat_fk
group by cat_id;

/*
with cte_cat_count as (
	select
		cat_id
		,count(*) as [a]
	from @vendas
	inner join @produto on ven_pro_fk = pro_id
	inner join @categoria on cat_id = pro_cat_fk
	group by cat_id
)
select * from cte_cat_count
pivot (
	count(a)
	for cat_id in (
		[1], [2], [3], [4]
	)
) as pivo*/

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
	,mes int
	,valor decimal
);
insert into @t values
(2013, 1, 100), (2013, 1, 100), (2013, 1, 100),
(2013, 1, 100), (2013, 2, 200), (2013, 3, 300),
(2013, 4, 400), (2013, 5, 500), (2013, 6, 600),
(2013, 7, 700), (2013, 8, 800), (2013, 9, 900),
(2013, 10, 1000), (2013, 11, 1100), (2013, 12, 1200);

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
) p