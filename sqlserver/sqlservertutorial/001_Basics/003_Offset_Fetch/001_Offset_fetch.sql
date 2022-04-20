/* Exemplo pratico de uso seria a paginação, onde, retorna faixa de dados.
offset e fetch são utilizado somente com order by.
*/
select
    col1,
    col2
from
    table1
order by
    col1
offset 10 rows -- significa que irá pular 10 linhas
fetch next 10 rows only -- significa que irá pegar 10 linhas após o offset