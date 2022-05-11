/*
* exists is a logical operator that check if a subquery returns any row
* return true if subquery return one or more rows
* se subquery return null, exists return true
*/

declare @produto table (
    pro_id int,
    pro_nome varchar(1)
);

declare @venda table (
    ven_id int,
    ven_pro_fk int,
    ven_qtd int,
    ven_preco decimal
);

insert into @produto values
(1, 'a'),
(2, 'b'),
(3, 'c'),
(4, 'd');

insert into @venda values
(1, 1, 5, 10),
(2, 3, 1, 15),
(3, 2, 10, 5),
(4, 4, 8, 7);

select
    *
from @venda ven
where exists (
    select pro_id
    from @produto pro
    where
        pro.pro_id = ven.ven_pro_fk
        and ven.ven_preco = 11
)