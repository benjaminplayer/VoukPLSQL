CREATE OR REPLACE FUNCTION COUNT_SKOK_STATUS
(idtekmovanja in number, sts in varchar2)
RETURN number
AS
    counter number;
BEGIN
    
    SELECT count(*) 
    into counter
    from SSK1_SKOKI sk
    inner join SSK1_SKOK_STATUSI st using(ID_STATUSA)
    where status like sts and sk.ID_TEKMOVANJA = idTekmovanja;
    RETURN counter;

END;

create or replace FUNCTION COUNT_TEKMOVALCI
(idtekmovanja in number)
RETURN number
AS
    tekmovalci number;
BEGIN
    select count(*) 
    into tekmovalci
    from SSK1_SKOKI sk
    inner join SSK1_TEKMOVALCI t using(ID_TEKMOVALCA)
    where sk.ID_TEKMOVANJA = idTekmovanja;

    RETURN tekmovalci;
end;


BEGIN
    DBMS_OUTPUT.PUT_LINE(COUNT_SKOK_STATUS(1, 'Opravljen'));
    DBMS_OUTPUT.PUT_LINE(COUNT_TEKMOVALCI(1));
END;

COMMIT;