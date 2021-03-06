/*
any é um operador lógico, que compara um valor com uma lista de valores unicos vindos de um subselect.
any is similar to some
*/

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

-- return @produto caso any return true
-- any busca na @venda que tenha qtd > 5
select 
    *
from @produto
where
    -- pode usar qualquer comparação, =, <, etc
    pro_id = any (
        select 
            ven_pro_fk
        from
            @venda
        where
            ven_qtd > 5

    )