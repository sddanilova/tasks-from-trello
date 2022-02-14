--создание таблицы
Create table Task_boys (name char(12), year char(4), point char(3))

--добавление записей
insert into Task_boys(name, year, point)
values('Серёжа', '2011', '23');

insert into Task_boys (name , Year, Point)
values('Паша', '2009', '13');

insert into Task_boys (name , Year, Point)
values('Серёжа', '2001', '10');

-- решение
Select l.name, k.points from
(select name from task_boys
where year ='2011') l
left join
(Select name, sum(point) points from task_boys group by name) k on l.name=k.name
