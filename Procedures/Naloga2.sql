create or replace PROCEDURE hello2(val in VARCHAR2) AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello ' || val);
END;

EXECUTE hello2('Pinko');

