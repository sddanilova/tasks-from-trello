SELECT * From
(select a,b from ts1 union select a,b from ts2) AB
natural left join
(select a, b, count(*) ca from ts1 group by a,b) AA
natural left join
(select a, b, count(*) cb from ts2 group by a,b) BB
where ca<>cb
order by a,b
























