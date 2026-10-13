SET SERVEROUTPUT ON;

DECLARE
    CURSOR C1 IS
        SELECT *
        FROM EMP
        WHERE DEPTNO = &DEPT_NO;

    V_EMP EMP%ROWTYPE;
    V_COUNT NUMBER := 0;

    NO_DEPT_FOUND EXCEPTION;

BEGIN
    OPEN C1;

    LOOP
        FETCH C1 INTO V_EMP;
        EXIT WHEN C1%NOTFOUND;

        INSERT INTO EMP_BACKUP
        VALUES V_EMP;

        V_COUNT := V_COUNT + 1;
    END LOOP;

    CLOSE C1;

    IF V_COUNT = 0 THEN
        RAISE NO_DEPT_FOUND;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            V_COUNT || ' employee records inserted successfully.'
        );
    END IF;

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'NO_DEPT_FOUND: No employees found for the given department.'
        );
END;
/