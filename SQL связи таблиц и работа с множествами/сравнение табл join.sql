SELECT * From
(select a,b from ts1 union select a,b from ts2) AB
natural left join
(select a, b, count(*) ca from ts1 group by a,b) AA
natural left join
(select a, b, count(*) cb from ts2 group by a,b) BB
where ca<>cb
order by a,b

--решение просто с left join, более правильное
SELECT AB.a, AB.b, AA.ca, BB.cb From
(select a,b from t1 union select a,b from t2) AB
left join
(select a, b, count(*) ca from t1 group by a,b) AA
on AB.a=AA.a
left join (select a, b, count(*) cb from t2 group by a,b) BB
on AB.a=BB.a
where not ca=cb or BB.a is null or AA.a is null
order by AB.a, AB.b






















