--cursor attribute SQL%ROWCOUNT to raise the basic salary of employees by 10% that are working in department number 10 and also display the appropriate message based on the existence of the record in the EMP table. (Use Implicit Cursor)
set serveroutput on;
declare 
	n number;
begin
	update employee set basicsal = basicsal + (basicsal*0.10) where deptno = 102;
if sql%FOUND 
then
	n := sql%ROWCOUNT;
	dbms_output.put_line(n ||' Record Updated');
end if;
end;
/
	