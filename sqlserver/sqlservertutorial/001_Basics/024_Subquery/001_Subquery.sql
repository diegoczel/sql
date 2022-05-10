/* Subquery is a query inside another query like: select, insert, update, delete.
uses Subquery with:
    inplace, in, not in, any, all, exists, not exists, from, ...,
*/

declare @pessoa table (
    pes_id int,
    pes_nome varchar(20)
);

declare @venda table (
    ven_id int,
    ven_pes_fk int,
    ven_ano int,
    ven_total decimal
);

insert into @pessoa values (1, 'a'), (2, 'b');

insert into @venda values 
(1, 1, 2022, 1250),
(2, 2, 2021, 1000),
(3, 1, 2021, 250),
(4, 2, 2022, 300);

-- subquery inplace
select 
    ven_pes_fk,
    -- subquery for get name of @pessoa
    (select pes_nome from @pessoa where ven_pes_fk = pes_id),
    sum(ven_total)
from @venda
group by ven_pes_fk

-- subquery with in
select
    *
from @venda
where
    ven_pes_fk in (
        select pes_id from @pessoa
    )

-- subquery with not in
select
    *
from @venda
where
    ven_pes_fk in (
        select pes_id from @pessoa where pes_id = 1
    )

-- select de uma subquery
select
    sum(sub.Total_2) as 'Total'
from (
    select 
        ven_pes_fk,
        -- subquery for get name of @pessoa
        (select pes_nome from @pessoa where ven_pes_fk = pes_id) as 'Nome'
		,sum(ven_total) as Total_2
    from @venda
	group by
		ven_pes_fk
) sub; -- precisa nomear a subquery