--�������������� ������ val �� �������� � �������
select regexp_substr(t.val, '(\w*)\. (\w*)\.') ��������, regexp_substr(t.val, '\w*$') �������
from (select '�. �. ������' val from dual
union all
select '��. C. ����������' val
from dual
union all
select '�. ��. �����' val
from dual) t
