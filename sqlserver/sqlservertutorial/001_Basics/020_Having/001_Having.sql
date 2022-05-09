/* having é o where do group by kkkk
nas condições, usa-se função de agregação para filtrar dados após o agrupamento ter finalizado.
*/

declare @venda table (
    id int
    ,cliente int
    ,vendedor int
    ,dt_venda date
);

insert into @venda values
(1, 1, 25, '2022-05-09'),
(2, 3, 25, '2021-03-02'),
(3, 2, 25, '2020-04-03'),
(4, 1, 20, '2021-03-02'),
(5, 10, 20, '2022-05-11'),
(6, 9, 20, '2020-02-17'),
(7, 1, 25, '2019-04-15'),
(8, 5, 30, '2022-03-13'),
(9, 6, 30, '2021-02-08'),
(10, 2, 33, '2020-01-06');

-- vendedor com vendas > 1
select
	vendedor,
	count(*) as qtd
from @venda
group by vendedor
having count(*) > 1