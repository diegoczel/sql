/* CTE - Common Table Expression
- monta um result set que está disponivel durante o escopo de execução
- utilizado em: select, insert, update, delete, merge
*/

/* Sintaxe:
with cte_name[(col_1, col_2, col_n)] as (
    cte_definition
)
sql_with_use_cte;
sendo:
cte_name - nome para referenciar posteriormente.
list_columns - is opcional, number of columns must be the same as the number of column returned by cte_definition
cte_definition - sql que irá montar os dados do cte
sql_with_use_cte - manipulação dos dados do cte.
*/

/* CTE is used para substituir subquery, pois é mais legivel.
usado também com queries that contain analytic functions ( window fun) https://www.sqlservertutorial.net/sql-server-window-functions/
*/

with cte_qtd_vendas_ano(ano, total) as (
	select
		year(VEN_DATA) as [ano]
		,count(*) as [total]
	from venda
	group by
		year(VEN_DATA)
)
select
	*
from cte_qtd_vendas_ano;