select дата, trunc(дата,'mm') нач_мес, LAST_DAY(дата) last_day, trunc(add_months(дата, 1),'mm') дн_сл_мес, дата-(24/24) мин_день
from(select add_months(trunc(sd, 'mm'),level-1) дата
from (SELECT sysdate sd from dual) cc
connect by add_months(sysdate, level-1)<add_months(trunc(sysdate, 'yyyy'), 12))

select day_, trunc(day_,'mm') нач_мес, LAST_DAY(day_) last_day, trunc(add_months(day_, 1),'mm') дн_сл_мес, day_-(24/24) мин_день
from(select sd+LEVEL-1 day_
from (SELECT TRUNC(SYSDATE) sd from dual) cc
connect by SYSDATE + level-1< SYSDATE + 366)

