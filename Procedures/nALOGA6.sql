-- Napiši funkcijo, ki vrne število zapisov v tabeli oseba.
create or REPLACE FUNCTION COUNT_OSEBA
RETURN NUMBER
AS
    a number;
BEGIN
    SELECT count(*) into a from oseba;
    RETURN a;
end;

DECLARE
BEGIN
    PRINTLN(COUNT_OSEBA);
END;