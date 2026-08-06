set serveroutput on
declare
	i number:=1;
	j number:=1;
begin
loop
	dbms_output.put_line(i);
	i:= i + 1;
	Exit when (i>5);
end loop;
dbms_output.put_line('---------------------------------');
for i IN 1..5 
loop
	dbms_output.put_line(i);
end loop;
dbms_output.put_line('---------------------------------');
while j<= 5
loop
	dbms_output.put_line(j);
	j:= j + 1;
end loop;
dbms_output.put_line('---------------------------------');


end;
/