--example of invalid_Cursor exception
set serveroutput on
declare
    cursor cr1 IS select * from employee where basicsal > 50000;
    b employee%ROWTYPE;
begin
--open cr1;
loop
fetch cr1 into b;
exit when cr1%NOTFOUND;
    dbms_output.put_line('employee id:'||b.eid||'department name'||b.deptname||'gender:' ||b. gender||' age:'||b. age ||' basic salary:'||b.basicsal || 'gross salary:'||b.gross_salary);
end loop;
close cr1;
    EXCEPTION
    WHEN INVALID_CURSOR THEN
    dbms_output.put_line('You forget to open cursor. open and re-execute program');
end;
/