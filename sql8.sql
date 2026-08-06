--Find Gross Salary
Set serveroutput on
declare
	id Number(5):=&id;
	sal  NUMBER(8,2);
	hra Number;	
	da number;
	medical number(3):=500;
	pf number;
	gross number;

begin
	select basicsal into sal from employee where EID=id;
	hra:=sal * 0.15;
	da:=sal * 50;
	pf:=sal * 0.10;
	gross:=(sal + da + hra + medical) - pf;
	dbms_output.put_line('Gross Salary is : '|| gross);
end;
/