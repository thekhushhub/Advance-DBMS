--delete the record
set serveroutput on
declare
	eno number(5):=&eno;
begin
 delete from emp where emp_no=eno;
 dbms_output.put_line('Record'||eno || 'Deleted');
end;
/