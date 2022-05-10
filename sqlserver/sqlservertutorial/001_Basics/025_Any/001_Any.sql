
declare @produto table (
    pro_id int,
    pro_nome varchar(1)
);

declare @venda table (
    ven_id int,
    ven_pro_fk int,
    ven_qtd int,
    ven_preco_uni decimal
);

insert into @produto values 
(1, 'a'), (2, 'b'), (3, 'c'), (4, 'd');

insert into @venda values
(1, 2, 5, 3),
(2, 2, 3, 3.5),
(3, 1, 2, 5.5),
(4, 3, 1, 4),
(5, 4, 10, 11);

-- se any ven_qtd > 5
select 
    *
from @produto
where
    pro_id = any (
        select 
            ven_pro_fk
        from
            @venda
        where
            ven_qtd > 5

    )