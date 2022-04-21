-- retorna somente valores distintos em uma lista de colunas.
-- similar ao group by, só que nãp usa funções de agregação.

create table t(
    id int not null primary key,
    nome varchar(25),
    cidade varchar(50)
)

insert into t values(1, 'diego', 'quedas');
insert into t values(2, 'diego', 'quedas');
insert into t values(3, 'cris', 'quedas');
insert into t values(4, 'cris', 'cascavel');

select distinct nome from t;
/*
cris
diego
*/
select distinct nome, cidade from t;
/*
cris	cascavel
cris	quedas
diego	quedas
*/