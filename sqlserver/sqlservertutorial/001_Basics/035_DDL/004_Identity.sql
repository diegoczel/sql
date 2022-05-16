/* Identity is property that is aplly into a column, que tem a seguinte função:
Generate values automáticamente durante o insert de um novo registro.
O controle dos valores gerados é efetuado pela engine do sql.

Syntax:
    identity(seed, inc)
    identity(10, 100) -- begin 10 and inc de 100 em 100.
    identity(1, 1) -- comum

Por padrão, não pode-se inserir valor em colunas Identity, mas
    existe este comando que habilita:
    set identity_insert table = on;
    insert ...
    set identity_insert table = off;

Caso falhe a inserção de um dado, um valor identity gerado será perdido, quando iniciar a
próxima inserção, tal valor será o próximo...

*/