/* tables are used to store data in the database.
- Tables are unique named dentro de um database and schema.
- Each table contains one or more  columns.
- Each column is associada a um datatype.
*/

/* syntax
create table [db_name].[schema_name]table_name (
    pk_column type primary key identity(1, 1)
    ,col1 type not null
    ,col2 type null
    ,col3 int default 0
    ,...
    ,table_ constraints like pk, fk, unique, check
    -foreign key(col_desta_table) references table_da_fk (col_da_fk)
);
*/