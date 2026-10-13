CREATE OR REPLACE PROCEDURE SEARCH_EMP(
    p_empno IN NUMBER,
    p_result OUT VARCHAR2
)
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM employees
    WHERE employee_id = p_empno;

    IF v_count > 0 THEN
        p_result := 'Employee is present';
    ELSE
        p_result := 'Employee is not present';
    END IF;
END;
/
