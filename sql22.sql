--no data found
set serveroutput on
declare
    pnm varchar2(25);
    price number(8,2);
    pid number:=&id;
begin

    select pro_name,pro_price INTO pnm,price from product where pro_id=pid;
    dbms_output.put_line('Product name:'||pnm||'Price:'||price);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('Product id:'||pid||' not available in table');
end;
/