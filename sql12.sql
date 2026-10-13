SET SERVEROUTPUT ON;

DECLARE
    CURSOR C_EMP IS
        SELECT EMPNO, SAL
        FROM EMP
        WHERE DEPTNO = 20
        FOR UPDATE OF SAL;

    V_EMPNO EMP.EMPNO%TYPE;
    V_OLD_SAL EMP.SAL%TYPE;
    V_COUNT NUMBER := 0;
BEGIN
    OPEN C_EMP;

    IF C_EMP%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is open.');
    END IF;

    LOOP
        FETCH C_EMP INTO V_EMPNO, V_OLD_SAL;

        EXIT WHEN C_EMP%NOTFOUND;

        UPDATE EMP
        SET SAL = V_OLD_SAL * 1.05
        WHERE CURRENT OF C_EMP;

        INSERT INTO EMP_UPDATE
            (EMPNO, OLD_SAL, NEW_SAL, UPDATE_DATE)
        VALUES
            (V_EMPNO, V_OLD_SAL,
             V_OLD_SAL * 1.05, SYSDATE);

        V_COUNT := V_COUNT + 1;
    END LOOP;

    CLOSE C_EMP;

    IF V_COUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No employees found in department 20.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            V_COUNT || ' employee(s) received a 5% raise.'
        );
        DBMS_OUTPUT.PUT_LINE(
            'Records stored in EMP_UPDATE.'
        );
    END IF;

    IF C_EMP%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is open.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursor is closed.');
    END IF;
END;
/