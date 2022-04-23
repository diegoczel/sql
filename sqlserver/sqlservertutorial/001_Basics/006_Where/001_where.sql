select
    *
from table1
where
    col1 = 1 -- equality
    -- and | or
    and col2 between 0 and 10 -- between
    and col3 in (1,2,3) -- list of values
    and col4 like '%str%'