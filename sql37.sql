CREATE OR REPLACE PROCEDURE up_salary (deptno IN NUMBER) 
IS
BEGIN
    update emp set salary = salary * 2.50 where dept_no = deptno;

    DBMS_OUTPUT.PUT_LINE('Successfully updated employee in department ' || deptno || '.');
    
    COMMIT;

END;
/
