/*
    2.	Predhodni PL SQL blok dopolni tako, da se bo za vsakega tekmovalca izpisalo ime in priimek, ter podatek – ali je ime daljše od priimka ali ne. Za vsakega tekmovalca naj se izpiše ena vrstica.
        a.	Za iteracijo prek zapisov v tabeli uporabi osnovno LOOP zanko.
        b.	Za iteracijo prek zapisov v tabeli uporabi zanko:   WHILE  pogoj LOOP
        c.	Za iteracijo prek zapisov v tabeli uporabi zanko:
        FOR IN  začetna vrednost .. končna vrednost LOOP
        d.	Za iteracijo prek zapisov v tabeli uporabi eksplicitni kurzor.

*/

--a


DECLARE
    b BOOLEAN;
    ime SSK1_TEKMOVALCI.IME%TYPE;
    priimek SSK1_TEKMOVALCI.PRIIMEK%TYPE;
    i number := 1;
    a number;
BEGIN

    select count(*) into a from SSK1_TEKMOVALCI;

    loop
        select ime, priimek into ime, priimek from SSK1_TEKMOVALCI
        where id_tekmovalca = 1;

        exit when a < i;
        
        if length(ime) > length(priimek) THEN
            b := true;
        else 
            b := false;
        end if;

        if b = true THEN
            PRINTLN('Ime je daljse od priimka');
        ELSE
            PRINTLN('Ime ni daljse od priimka');
        end if;

        i := i + 1;
    end loop;


end;


-- b
DECLARE
    b BOOLEAN;
    ime SSK1_TEKMOVALCI.IME%TYPE;
    priimek SSK1_TEKMOVALCI.PRIIMEK%TYPE;
    i number := 1;
    a number;
BEGIN

    select count(*) into a from SSK1_TEKMOVALCI;

    while i < a LOOP

        select ime, priimek into ime, priimek from SSK1_TEKMOVALCI
        where ID_TEKMOVALCA = i;

        if length(ime) > length(priimek) THEN
            b := true;
        else 
            b := false;
        end if;

        if b = true THEN
            PRINTLN('Ime je daljse od priimka');
        ELSE
            PRINTLN('Ime ni daljse od priimka');
        end if;

        i := i +1;
    END LOOP;
END;

-- c

DECLARE
    b BOOLEAN;
    ime SSK1_TEKMOVALCI.IME%TYPE;
    priimek SSK1_TEKMOVALCI.PRIIMEK%TYPE;
    a number;
BEGIN

    select count(*) into a from SSK1_TEKMOVALCI;

    for i in 1 .. a LOOP

        select ime, priimek into ime, priimek from SSK1_TEKMOVALCI
        where ID_TEKMOVALCA = i;

        if length(ime) > length(priimek) THEN
            b := true;
        else 
            b := false;
        end if;

        if b = true THEN
            PRINTLN('Ime je daljse od priimka');
        ELSE
            PRINTLN('Ime ni daljse od priimka');
        end if;

    END LOOP;
END;

-- d;
DECLARE
    CURSOR cur IS
    select ime, priimek from SSK1_TEKMOVALCI;
    b BOOLEAN;
    ime SSK1_TEKMOVALCI.IME%TYPE;
    priimek SSK1_TEKMOVALCI.PRIIMEK%TYPE;
BEGIN
    open cur;
    LOOP
        
        fetch cur into ime, priimek;

        exit when cur%notfound;
        
        if length(ime) > length(priimek) THEN
            b := true;
        else 
            b := false;
        end if;

        if b = true THEN
            PRINTLN('Ime je daljse od priimka');
        ELSE
            PRINTLN('Ime ni daljse od priimka');
        end if;

        i := i +1;
    end loop;

    close cur;

end;