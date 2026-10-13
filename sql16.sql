SET SERVEROUTPUT ON;

DECLARE
    CURSOR C_EMP IS
        SELECT *
        FROM EMP
        WHERE DEPTNO = &DEPT_NO;

    V_EMP EMP%ROWTYPE;

    NO_DEPT_FOUND EXCEPTION;
    V_COUNT NUMBER := 0;

BEGIN
    OPEN C_EMP;

    LOOP
        FETCH C_EMP INTO V_EMP;
        EXIT WHEN C_EMP%NOTFOUND;

        INSERT INTO EMP_BACKUP
        VALUES V_EMP;

        V_COUNT := V_COUNT + 1;
    END LOOP;

    CLOSE C_EMP;

    IF V_COUNT = 0 THEN
        RAISE NO_DEPT_FOUND;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            V_COUNT || ' employee records inserted into EMP_BACKUP.'
        );
    END IF;

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No employees found for the given department number.'
        );
END;
/