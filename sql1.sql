--find out simple intrest using principle amount, rate of intrest and number of year.

set serveroutput on
declare
	P number:=&P;
	R number:=&R;
	N number:=&N;
	SI number;
begin

	dbms_output.put_line('Your Amount is : '||P);
	dbms_output.put_line('Rate Of Intrest is : '||R);
	dbms_output.put_line('Number of Year is : '||N);
	SI := P * R * N;	
	dbms_output.put_line('Simple Intrest is : '||SI);
end;
/












