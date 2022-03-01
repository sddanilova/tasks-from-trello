create table number_table (n1 number, n2 number,n3 number)
insert into number_table values (1, 1, 1);
insert into number_table values (2, 2, 2);
insert into number_table values (3, 3, 3);

--добавление нового поля и его заполнение
ALTER TABLE number_table
ADD n4 number;
update number_table 
set n4=4;

--спецификация пакета
create or replace package pkg_number as
v_rec number_table%ROWTYPE;
procedure perebor;
procedure plus(p_rec IN number_table%ROWTYPE);
end pkg_number;

--тело пакета
create or replace package body pkg_number as
    procedure perebor is
    cursor c1 is select * from number_table;
    begin 
    	OPEN c1;
    	FETCH c1 INTO v_rec;
    	LOOP
    		plus(v_rec);  
    		FETCH c1 INTO v_rec;
    		exit WHEN c1%notfound;
    	END LOOP;
    	CLOSE c1;
    end perebor;

    procedure plus(p_rec IN number_table%ROWTYPE) is 
    v_row number_table%ROWTYPE:=p_rec;
    suma number;
    begin
--меняется только эта строка:
    	suma:=v_row.n1+v_row.n2 + v_row.n3+v_row.n4;
    	dbms_output.put_line(suma);
    end plus;
end pkg_number;

--запуск программы
begin
pkg_number.perebor;
end;