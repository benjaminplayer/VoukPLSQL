--Napiši proceduro, ki za vsak zapis v tabeli oseba izpiše samo prvo črko imena.
CREATE OR REPLACE PROCEDURE FIRST_LETTER_OSEBA AS
    CURSOR cur is select ime from oseba;
    ime oseba.IME%TYPE;
BEGIN
    open cur;

    LOOP
        fetch cur into ime;
        exit when cur%notfound;

        DBMS_OUTPUT.PUT_LINE(SUBSTR(ime,0 , 1));

    end loop;

    close cur;
END;

execute FIRST_LETTER_OSEBA;

SELECT * FROM OSEBA;