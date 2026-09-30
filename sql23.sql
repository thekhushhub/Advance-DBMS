--no data found
set serveroutput on
declare
    enm varchar2(50);
    sal number(8,2);
    id number:=&id;
begin

    select ename,basicsal INTO enm,sal from employee where eid=id;
    dbms_output.put_line('Employee name:'||enm||'Salary:'||sal);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('Employee id :'||id||' not available in table');
end;
/