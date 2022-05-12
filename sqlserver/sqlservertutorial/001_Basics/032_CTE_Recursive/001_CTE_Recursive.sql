/* CTE Recursive is a CTE that references itself.
CTE repetidamente execute, returns subsets of data, until it return the complete result set.
*/

/* Syntax
with cte_name(column_list) as (
    initial_query -- anchor member
    union all
    recursive_query -- recursive_member that references cte_name
        -- recursive_end
)
sql_with_use_cte
sendo:
initial_query - que é a base para as consultas recursivas, is called an anchor_member
recursive_query - references the cte, e é chamado de recursive_member.
    recursive_query is combined into initial_query using union all
recursive_end
    include into recursive_query for end the the ececute.
*/

with cte_day_name(i, nome) as (
	-- anchor
	select 0, datename(dw, 0)
	union all
	select -- recursive_query
		i + 1, datename(dw, i + 1)
	from cte_day_name
	where i < 6 --end_recursive
)
select * from cte_day_name;
/* result
0	Monday
1	Tuesday
2	Wednesday
3	Thursday
4	Friday
5	Saturday
6	Sunday
*/

declare @p table(
	id int
	,nome varchar(1)
	,gerente int
);
insert into @p values
(1, 'a', 2),
(2, 'b', null), -- this is the anchor
(3, 'c', 4),
(4, 'd', 2),
(5, 'e', 3);

with cte_pessoas as (
	select anchor.*
	from @p anchor
	where anchor.gerente is null
	union all
	select rec.*
	from @p rec
	inner join cte_pessoas cte on cte.id = rec.gerente
)
select * from cte_pessoas;
/* result
2	b	NULL
1	a	2
4	d	2
3	c	4
5	e	3
*/

-- exemplo anterior usando inner join
select * from @p p1
join @p p2 on p1.gerente = p2.id;
/* result
1	a	2	2	b	NULL
3	c	4	4	d	2
4	d	2	2	b	NULL
5	e	3	3	c	4
*/