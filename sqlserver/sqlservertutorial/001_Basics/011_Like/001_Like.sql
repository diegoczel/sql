/* like
syntax: 
	col | expression [not] like pattern [escape char]
pattern:
	% any str of 0 or more char
	_ any single char
	[abc] list of char
	[a-z] range of char
	[^aeiou] any char != of list
	[^a-z] any char != of range of char
escape:
	
*/

select 
	*
from table1
where
	-- começa com z e tem qualquer char depois
	col1 like 'z%'
	-- termina com z e tem qualquer char antes
	and col2 like '%z'
	-- começa com a tem qualquer char no meio e termina com e
	and col3 like 'a%e'
	-- 1° char qualquer, 2° a e o restante é any
	and col4 like '_a%'
	-- 1° char é um range entre a,e,i,o,u e termina com qualquer char
	and col5 like '[aeiou]%'
	-- 1° char é um range entre a to c e qualquer char depois
	and col6 like '[a-c]%'
	-- 1° negação range a-x, logo é y z
	and col7 like '[^a-x]%'
	and col8 not like '[12]%'
	-- escape ! for macth %
	and col9 like '%100!%%' escape '!'