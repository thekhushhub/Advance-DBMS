--Accept a student name from a user if it exists, display his/her result from the RESULT table otherwise display appropriate message using exception handling.

set serveroutput on
declare
	sname char(15);
	res number(10);
	rl number:=&id;
begin

	select name,result INTO sname,res from Result where rollno=rl;
	dbms_output.put_line('Student name: '||sname||'Result: '||res);
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	dbms_output.put_line('Roll No:'||rl||' not available in table');
end;
/