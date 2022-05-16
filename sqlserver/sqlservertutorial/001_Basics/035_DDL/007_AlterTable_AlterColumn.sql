/* alter table alter column, modify a column of a table.
Changes permitidas:
    data type
        alter table tb_nome
        alter column col_name new_data_type(size);
        - data types devem ser compativeis, senão será gerado erro de conversão.
        create table t1 (c int);
        insert into t1 values (1), (2);
        alter table t1 alter column c varchar(2);
        insert into t1 values ('@');
        alter table t1 alter column c int;
            erro
    size
        CREATE TABLE t2 (c VARCHAR(10));
        ALTER TABLE t2 ALTER COLUMN c VARCHAR (50);
        ALTER TABLE t2 ALTER COLUMN c VARCHAR (5);
            erro
    add not null constraint
        need update col to default value
            update table set col = default where col is null;
            then add constraint
                alter table tb alter column col type not null;
*/