select ����, trunc(����,'mm') ���_���, LAST_DAY(����) last_day, trunc(add_months(����, 1),'mm') ��_��_���, ����-(24/24) ���_����
from(select add_months(trunc(sd, 'mm'),level-1) ����
from (SELECT sysdate sd from dual) cc
connect by add_months(sysdate, level-1)<add_months(trunc(sysdate, 'yyyy'), 12))

select day_, trunc(day_,'mm') ���_���, LAST_DAY(day_) last_day, trunc(add_months(day_, 1),'mm') ��_��_���, day_-(24/24) ���_����
from(select sd+LEVEL-1 day_
from (SELECT TRUNC(SYSDATE) sd from dual) cc
connect by SYSDATE + level-1< SYSDATE + 366)

