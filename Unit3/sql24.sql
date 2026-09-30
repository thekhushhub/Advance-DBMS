--display the salary of that employee whose age is 50 years otherwise display appropriate messages using exception handling.

SET SERVEROUTPUT ON;

DECLARE
    -- The '&' symbol creates a runtime prompt for the user
    -- Single quotes are placed around the substitution variable for text input
    en              VARCHAR2(20) := '&Enter_Employee_Name'; 
    sal             NUMBER(10);
    a               NUMBER(10);
    
    -- Custom exception for when the employee is not exactly 50
    AGE_NOT_FIFTY   EXCEPTION;
BEGIN
    -- Fetch the details for the user-entered employee name
    SELECT salary, age INTO sal, a 
    FROM office 
    WHERE ename = en;

    -- Validate if the age is exactly 50
    IF a = 50 THEN
        DBMS_OUTPUT.PUT_LINE('Employee Found: ' || en);
        DBMS_OUTPUT.PUT_LINE('Age: ' || a || ' years old');
        DBMS_OUTPUT.PUT_LINE('Salary: Rs. ' || sal);
    ELSE
        -- Jump to the EXCEPTION section if age is not 50
        RAISE AGE_NOT_FIFTY;
    END IF;

EXCEPTION
    -- Handles the case where the employee exists but is not 50 years old
    WHEN AGE_NOT_FIFTY THEN
        DBMS_OUTPUT.PUT_LINE('Message: Employee ' || en || ' is ' || a || ' years old, not 50.');
        
    -- Handles the case where the user enters a name that does not exist
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Message: Employee "' || en || '" does not exist in the database.');
        
    -- Handles any unexpected runtime errors
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/
