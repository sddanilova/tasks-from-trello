--вывести число 123456.789 в формате (123 456.79)
declare 
a number:=123456.789;
BEGIN
 DBMS_OUTPUT.PUT_LINE(
 TO_CHAR(a,'999G999D99','NLS_NUMERIC_CHARACTERS=''. ''')
 );
END;