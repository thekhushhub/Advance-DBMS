--FOR CM, multiply the number of feet by 30.48,Inches = Feet × 12,Meter = multiply your length in feet by (0.3048).
set serveroutput on
declare
	F number:=&F;
	I number;
	M number;
	CM number;
	R number;

begin

	dbms_output.put_line('Your Feet is : '||F);
	CM := F * 30.48;		
	dbms_output.put_line('Feet in CM is : '||CM);
	I := F * 12;	
	dbms_output.put_line('Feet in Inches is : '||I);
	M := F * 0.3048;	
	dbms_output.put_line('Feet in Meter is : '||M);
	
end;
/

