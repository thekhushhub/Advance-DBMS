CREATE OR REPLACE PROCEDURE update_salary 
IS
BEGIN
    update emp set salary = salary * 1.10;

    DBMS_OUTPUT.PUT_LINE('Successfully updated employee in department.');
    
    COMMIT;

END;
/
