-- update com inner join
declare @vendedor table (
    ven_id int
    ,ven_nome varchar(1)
    ,ven_qtd int default 0
);
insert into @vendedor(ven_id, ven_nome) values 
(1, 'a'), (2, 'b'), (3, 'c'), (4, 'd'), (5, 'e');

declare @vendas table (
    ven_id int
    ,ven_vendedor int
    ,ven_total decimal
);
insert into @vendas values
(1, 5, 100), (2, 4, 200), (3, 3, 300), (4, 2, 400), (5, 1, 500),
(6, 5, 100), (7, 3, 200), (8, 1, 300), (9, 5, 400), (10, 3, 500);

select * from @vendedor;

declare @vendedor_qtd table (
    ven_id int
    , ven_qtd int
);
insert into @vendedor_qtd(ven_id, ven_qtd)
select
    v.ven_vendedor
    ,count(*)
from @vendas v
group by v.ven_vendedor;

select * from @vendedor_qtd;

update @vendedor
set
    ven_qtd = v2.ven_qtd
from @vendedor v1
join @vendedor_qtd v2 on v1.ven_id = v2.ven_id;

select * from @vendedor;