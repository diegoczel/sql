select
    *
from table1
where
    col1 in (1, 2, 3)
    and col2 not in (1, 2)
    and col3 in ( -- subquery
        select id
        from table2
        where
            id > 100
    )
