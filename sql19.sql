--show the records using ORDER BY clause using cursor.
set serveroutput on
declare
Cursor s1 IS select * from product order by pro_price desc;
d product%ROWTYPE;
begin
open s1;
loop
fetch s1 INTO d;
exit when NOT s1%FOUND;
dbms_output.put_line('Product ID :'||d.pro_id||'Product Name :'||d.pro_name||'Product Price:'||d.pro_price);
end loop;
close s1;
end;
/