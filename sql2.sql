--find out square and cube of the number

set serveroutput on
declare
	N number:=&N;
	S number;
	C number;
begin

	dbms_output.put_line('Your Number is : '||N);
	S := N * N ;
	dbms_output.put_line('Sqaure of Number is : '||S);
	C := N * N * N;
	dbms_output.put_line('Cube of Number is : '||C);	

end;
/
