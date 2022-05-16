-- update com left join 
/*
Neste cenário, vou atualizar o ativo da table @pessoa baseado
    se a @pessoa teve venda.
*/

declare @pessoa table (
    pes_id int
    ,pes_nome varchar(1)
    ,pes_cliente int
    ,pes_ativo int
);
insert into @pessoa values 
(1, 'a', 1, 1), (2, 'b', 1, 1), (3, 'c', 1, 1), (4, 'd', 1, 1)
,(5, 'e', 1, 1), (6, 'f', 1, 1), (7, 'g', 1, 1), (8, 'h', 1, 1);

declare @vendas table (
    ven_id int
    ,ven_cliente int
);

insert into @vendas values
(1, 8), (2, 6), (3, 4), (4, 2);

-- clientes que tiveram venda
declare @pessoa_com_venda table (id int);
insert into @pessoa_com_venda
select ven_cliente
from @vendas
group by ven_cliente
having count(*) > 0;

select * from @pessoa;
select * from @pessoa_com_venda;

-- usando left join, @pessoa_com_venda será null quando @pessoa não ter venda
update @pessoa
set
    pes_ativo = 0
from @pessoa
left join @pessoa_com_venda on pes_id = id
where id is null;

select * from @pessoa;