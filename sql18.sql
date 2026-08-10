SET SERVEROUTPUT ON;

DECLARE
  CURSOR c_product IS
    SELECT pro_id, pro_name, pro_price
    FROM product
    WHERE pro_name LIKE '_E%';
BEGIN

  FOR r_prod IN c_product LOOP
    DBMS_OUTPUT.PUT_LINE(
      'ID: ' || r_prod.pro_id || 
      ' | Name: ' || r_prod.pro_name || 
      ' | Price: ' || r_prod.pro_price
    );
  END LOOP;
END;
/
