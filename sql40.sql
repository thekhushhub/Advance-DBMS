CREATE OR REPLACE FUNCTION GET_BALANCE(
    p_accno IN NUMBER
)
RETURN NUMBER
IS
    v_balance NUMBER;
BEGIN
    SELECT balance
    INTO v_balance
    FROM accounts
    WHERE account_no = p_accno;

    RETURN v_balance;
END;
/