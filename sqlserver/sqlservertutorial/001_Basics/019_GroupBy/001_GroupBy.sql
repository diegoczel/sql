/* group by is often used with aggregate functions.
aggregate function performs a calc on a group and returns
a unique value per group.
count(), sum(), avg(), min(), max()
*/

declare @produto table (
	id int
	,nome varchar(10)
	,custo decimal
	,venda decimal
);

declare @pessoa table (
	id int
	,nome varchar(1)
);

declare @venda table (
	id int
	,cliente int
);

declare @venda_produto table (
	id int
	,venda int
	,n_item int
	,produto int
	,quantidade int
);

insert into @pessoa values (1, 'a'), (2, 'b'), (3, 'c');

insert into @produto values
(1, 'prego', 1, 2),
(2, 'tabua', 2, 3.5),
(3, 'balde', 10, 15);

insert into @venda values
(1, 2), (2, 1), (3, 2), (4, 3), (5, 2);

insert into @venda_produto values
(1, 1, 1, 2, 1),
(2, 1, 2, 1, 2),
(3, 2, 1, 3, 5),
(4, 3, 1, 3, 2),
(5, 3, 2, 2, 10),
(6, 4, 1, 1, 4),
(7, 4, 2, 3, 3),
(8, 5, 1, 2, 7);

-- qtd max|min vendida em cada venda
select 
	ven.id
	,max(quantidade) as 'Qtd max em cada venda'
	,min(quantidade) as 'Qtd min em cada venda'
from @venda_produto ven_pro
join @venda ven on  ven.id = ven_pro.venda
group by ven.id