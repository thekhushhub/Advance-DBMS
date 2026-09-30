SET SERVEROUTPUT ON;

DECLARE

    v_numerator   NUMBER := &NUMERATOR;   
    v_denominator NUMBER := &DENOMINATOR; 
    v_result      NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Attempting division: ' || v_numerator || ' / ' || v_denominator);


    v_result := v_numerator / v_denominator;


    DBMS_OUTPUT.PUT_LINE('Division successful. Result = ' || v_result);

EXCEPTION

    WHEN ZERO_DIVIDE THEN

        DBMS_OUTPUT.PUT_LINE('Execution handled: Cannot divide ' || v_numerator || ' by zero.');
        v_result := 0; 
        

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
