Set serveroutput on;
DECLARE

    v_emp_id   NUMBER(5) := &EID; 
    v_emp_name VARCHAR2(50);
    v_salary   NUMBER(8,2);

BEGIN
   

 
    SELECT ENAME, BASICSAL INTO v_emp_name, v_salary FROM employee
    WHERE EID = v_emp_id;


    DBMS_OUTPUT.PUT_LINE('Employee Found: ' || v_emp_name || ', Salary: ' || v_salary);

EXCEPTION    

WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Execution handled: No employee found with ID ' || v_emp_id);
        
WHEN OTHERS THEN
DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);

END;
/

