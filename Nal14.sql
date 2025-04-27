/*CREATE OR REPLACE PROCEDURE Datumi
AS
    datum VARCHAR2(8);
    idx number := 1;
    cursor cur
    is
    select to_char(datum, 'DD.MM.YY') from SSK1_TEKMOVANJA;
BEGIN
    open cur;
    LOOP
        FETCH cur into datum;
    EXIT WHEN cur%notFound;
        DBMS_OUTPUT.PUT_LINE('Datum '|| idx || '. tekmovanja je ' || datum);
        idx := idx + 1;
    END LOOP;
    close cur;
END;

EXECUTE DATUMI;

alter table SSK1_TEKMOVANJA
add DATUM_VPISA TIMESTAMP;
*/
desc SSK1_TEKMOVANJA;

insert into SSK1_TEKMOVANJA
VALUES (SSK1_TEKMOVANJA_SQ.nextval, 'Test1', sysdate, 2, to_date('10.12.2017 12:35:45', 'DD.MM.YYYY HH24:MI.SS'));

Select id_tekmovanja, naziv, to_char(datum, 'DD.MM.YYYY HH24:MI:SS'), id_skakalnice, to_char(datum_vpisa, 'DD.MM.YYYY HH24:MI:SS') from SSK1_TEKMOVANJA
where id_tekmovanja = 11;