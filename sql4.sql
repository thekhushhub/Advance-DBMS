-- converts temperature from Celsius to Fahrenheit
set serveroutput on
declare
    C number:=&C;
    F number;

begin

    dbms_output.put_line('Your Temperature is : '||C);
    F := C * 1.8 + 32;        
    dbms_output.put_line('Your Temperature in Fahrenhit  : '||F);
    
end;
/