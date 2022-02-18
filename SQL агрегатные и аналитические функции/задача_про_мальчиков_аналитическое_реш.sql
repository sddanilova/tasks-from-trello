select name, points
from(select name, year, sum(point) over (partition by name) points, decode(year, '2011', 1) vhozdenia
     from task_boys) t
where t.vhozdenia =1
