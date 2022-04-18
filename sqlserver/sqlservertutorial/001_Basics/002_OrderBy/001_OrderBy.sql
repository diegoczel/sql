select
    column1,
    column2,
    column3,
    column5,
    column6
from
    table1
order by
    -- one or multiple column's
    column1 ASC, -- default
    column2 DESC,
    column3,
    column4, -- column not present in select list
    len(column5), -- sort by an expression
    5 -- sort by position of columns in select list