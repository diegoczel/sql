/* Merge update data in a table based on values matched from another table.
Em outras palavras, merge possibilita efetuar 3 operações ao mesmo tempo, sendo elas: update, insert e delete em uma operação envolvendo duas tabelas, target and source.

Suponha que tenhamos duas table called sourc and target.
Queremos efetuar um update em target baseado na tabela source, surge então 3 cenários.
1) source tem rows que não existe em target, logo deve-se inserir row em target.
2) target tem rows que não existem em source, logo tem que deletar estas rows.
3) the source and target has row iguais com valores diferentes, logo deve-se atualizar as rows em target baseado nos valores de source.

006_merge.png ilustra o diagrama.

Se efetuar 3 sql separadas, irá gerar sobrecarga de i/o, o que resulta em lentidão em processos longos.
Para evitar, usa-se merge, que faz este processo em uma uníca chamada.

O caso que utiliza merge é em situações como data warehouse, onde tem-se dados em um banco baseado em outro para processamento.

quando tem alguma mudança no source, deve-se mudar o target.
*/

/* cenário:
@target_vendas is table que usa a source.
    aqui tem poucos dados, um resumo para processamento de stats.
    possívelmente estaria em outro banco.
@source_vendas é a table base para target.
    aqui tem os dados completos de uma venda.
*/
declare @target_vendas table(
    t_ven_id int
    ,t_ven_total decimal
);
declare @source_vendas table(
    s_ven_id int
    ,s_ven_cliente int
    ,s_ven_vendedor int
    ,s_ven_total decimal
    -- demais colunas.
);
insert into @source_vendas values
(1, 1, 1, 100), (3, 3, 3, 300), (4, 4, 4, 400), (5, 5, 5, 500), (6, 6, 6, 600);

insert into @target_vendas values
(1, 90), (2, 200), (3, 290), (4, 390);

select * from @source_vendas;
select * from @target_vendas;

-- 006_001_EXPLICACAO.PNG ilustra a situação que tem que aplicar.

-- aplicação do merge
merge @target_vendas
using @source_vendas
on (t_ven_id = s_ven_id)
when matched 
    -- target e source tem o registro
    -- logo, tem que atualizar target baseado na base source.
    then update set
        t_ven_total = s_ven_total
when not matched by target
    -- somente tem registro na source, logo tem que criar na target
    then insert(t_ven_id, t_ven_total)
        values(s_ven_id, s_ven_total)
when not matched by source
    -- somente tem registro na target, logo tem que escluir da target, pois é a source que é a base, e target deve ser igual a source.
    then delete;

select * from @source_vendas;
select * from @target_vendas;