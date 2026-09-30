set serveroutput on
declare
bk_id number(5):=&bk_id;
b varchar2(10);
d varchar2(15);
j date;
a number(8,2);
begin
    select booking_id,customer_name,destination,booking_date,amount INTO bk_id,b,d,j,a from booking where booking_id=bk_id;
    dbms_output.put_line('booking_id'||bk_id||'Customer Name:'||b||'DESTINATION:' ||d||' Journey Date:'||j||' Amount:'||a);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line(bk_id||' is not found');
    WHEN TOO_MANY_ROWS THEN
    dbms_output.put_line(bk_id||' is found more than 1 times in table');
end;
/