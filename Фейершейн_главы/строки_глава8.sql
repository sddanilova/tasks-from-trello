--преобразование строки val на инициалы и фамилии
select regexp_substr(t.val, '(\w*)\. (\w*)\.') инициалы, regexp_substr(t.val, '\w*$') фамилия
from (select 'П. Н. Наумов' val from dual
union all
select 'Ал. C. Колесников' val
from dual
union all
select 'З. Пт. Шталь' val
from dual) t
