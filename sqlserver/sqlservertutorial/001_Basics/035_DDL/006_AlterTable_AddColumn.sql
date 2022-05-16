create table t1 (
    id int
    ,col2 int
);

insert into t1 values (1, 2), (2, 3), (3, 4);

select * from t1;

alter table t1 add 
    x varchar(2) default 'x';

select * from t1;

drop table t1;