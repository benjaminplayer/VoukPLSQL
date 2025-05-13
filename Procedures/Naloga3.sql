create or replace function vst(a in number, b in number)
RETURN NUMBER
AS
BEGIN
    RETURN a + b;
END;

DECLARE
BEGIN
    PRINTLN(vst(3,5));
END;