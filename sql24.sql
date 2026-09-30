--example of invalid_Cursor exception
set serveroutput on
declare
cursor cr1 IS select * from booking where amount > 5000;
b booking%ROWTYPE;
begin
--open cr1;
loop
fetch cr1 into b;
exit when cr1%NOTFOUND;
dbms_output.put_line('Customer Name:'||b.CUSTOMER_NAME||'
DESTINATION:' ||b. DESTINATION||' Journey Date:'||b. BOOKING_DATE ||' Amount:'||
b.amount);
end loop;
close cr1;
EXCEPTION
WHEN INVALID_CURSOR THEN
dbms_output.put_line('You forget to open cursor. open and re-execute program');
end;
/