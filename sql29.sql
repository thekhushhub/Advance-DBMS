SET SERVEROUTPUT ON;

DECLARE
    V_EMPNO EMP.EMPNO%TYPE := &EMPNO;
    V_COMM EMP.COMM%TYPE;

    NULL_COMMISSION EXCEPTION;

BEGIN
    SELECT COMM
    INTO V_COMM
    FROM EMP
    WHERE EMPNO = V_EMPNO;

    IF V_COMM IS NULL THEN
        RAISE NULL_COMMISSION;
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            'Commission = ' || V_COMM
        );
    END IF;

EXCEPTION
    WHEN NULL_COMMISSION THEN
        DBMS_OUTPUT.PUT_LINE(
            'NULL_COMMISSION: Commission is not available.'
        );

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Employee number not found.'
        );
END;
/