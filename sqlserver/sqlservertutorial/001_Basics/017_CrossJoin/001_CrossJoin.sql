/* cross join resulta no produto cartesiano entre as row.
*/
declare @t1 table (t1_id int);
declare @t2 table (t2_id int, enum varchar(1));

insert into @t1 values (1), (2), (3);
insert into @t2 values (4, 'a'), (5, 'b');

select *
from @t1
cross join @t2

/* result
1	4	a
2	4	a
3	4	a
1	5	b
2	5	b
3	5	b
*/