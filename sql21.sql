-- zero divided exception

set serveroutput on

Declare
       n1 number:=&n1;
       n2 number:=&n2;
	d number;
begin
       dbms_output.put_line('enter number 1:'||n1);	
	dbms_output.put_line('enter number 2:'||n2);
	d:=n1/n2;
	dbms_output.put_line('result:'||d);
exception
	when zero_divide then
dbms_output.put_line('You are trying to divided no by zero');
dbms_output.put_line('NO 2 MUST BE >0 so re enter no');
end;
/