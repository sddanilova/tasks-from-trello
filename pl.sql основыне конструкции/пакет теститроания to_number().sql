create or replace PACKAGE test_to_number as
FUNCTION chk_to_number return varchar;
Function xx_to_number(p_stroka IN VARCHAR) return number;
PROCEDURE check_string(p_stroka IN VARCHAR);
g_num_compiled NUMBER;
g_not_compiled VARCHAR(100);
end test_to_number;

create or replace PACKAGE body test_to_number as
    FUNCTION chk_to_number return varchar is 
        a number;
        outmessage varchar(10);      
    begin
        g_num_compiled:=0;
        check_string('100');
        check_string('100,10');
        check_string('-100');
        check_string('-100123123123123,10');
        check_string('жопа');
        check_string('100.10');
        if g_num_compiled=6 then outmessage:='S';
        else outmessage:= 'Err';
        end if;
        DBMS_OUTPUT.PUT_LINE('Пройдено тестов: ' || g_num_compiled);
        DBMS_OUTPUT.PUT_LINE('Не пройденные тесты: ' || g_not_compiled); 
        RETURN outmessage;        
    end;

    FUNCTION xx_to_number(p_stroka IN VARCHAR) return number is
        a number;
    begin
        a:= replace(p_stroka, '.', ',');
        return a;
        exception
        when VALUE_ERROR THEN
         DBMS_OUTPUT.PUT_LINE('Не возможно преоброзовать: "' || p_stroka || '" в числовой формат');
        raise;
    end;
        
    PROCEDURE check_string(p_stroka IN VARCHAR) is 
        a number;
    begin
        a:= xx_to_number(p_stroka);
        g_num_compiled:=g_num_compiled+1;
        EXCEPTION when OTHERS then
         g_not_compiled:=(g_not_compiled || ' "' || p_stroka ||'" ');
    end;

end test_to_number;