CREATE OR REPLACE PROCEDURE update_dept_salary (deptno IN NUMBER, per IN NUMBER) 
IS
BEGIN
    update emp set salary = salary * (1 + (per / 100)) where dept_no = deptno;

    DBMS_OUTPUT.PUT_LINE('Successfully updated employee in department ' || deptno || '.');
    
    COMMIT;

END;
/
