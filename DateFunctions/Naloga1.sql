-- 1. V tabelo RED_DIJAKI dodaj polje DATUM_ROJSTVA
ALTER TABLE RED_DIJAKI
add DATUM_ROJSTVA date;

SELECT * from RED_DIJAKI;

-- 2. Vpiši datume rojstva za vse dijake v tabeli RED_DIJAKI
DECLARE
    CURSOR cur is
    SELECT ID_DIJAKA from RED_DIJAKI;
    idD RED_DIJAKI.ID_DIJAKA%TYPE;
    d number(2);
    m number(2);
    x number(4);
BEGIN
    OPEN cur;
    LOOP
        FETCH cur into idD;
        EXIT when cur%notfound;

        d := DBMS_RANDOM.value(1,27);
        m := DBMS_RANDOM.VALUE(1,12);
        x := EXTRACT(year from SYSDATE) - DBMS_RANDOM.VALUE(16,19);

        PRINTLN(lpad(d, 2, '0') || '.' ||lpad(m, 2, '0') || '.' || x);

        update RED_DIJAKI
        set DATUM_ROJSTVA = to_date(lpad(d, 2, '0') || '.' ||lpad(m, 2, '0') || '.' || x, 'dd.mm.YYYY')
        where id_dijaka = idD;


    END LOOP;

    close cur;

END;

create or replace PROCEDURE PRINTLN(val in VARCHAR2)
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE(val);
END;


-- 3. S poizvedbo izpiši tekst v obliki: 'Janez se je rodil 12.03.1994' - za vse dijake
DECLARE
    CURSOR cur is 
        SELECT ime, priimek, DATUM_ROJSTVA from RED_DIJAKI;
    ime RED_DIJAKI.IME%TYPE;
    priimek RED_DIJAKI.PRIIMEK%TYPE;
    datR RED_DIJAKI.DATUM_ROJSTVA%TYPE;
BEGIN
    open cur;

    LOOP
        FETCH cur into ime, priimek, datR;
        exit when cur%notfound;

        println(ime || 'se je rodil '||to_char(datR, 'DD.MM.YYYY'));
    END LOOP;
    CLOSE CUR;
end;

-- 4. Izpiši število dni od rojstnega datuma do konca meseca - za vse dijake
DECLARE
    cursor cur is
        select DATUM_ROJSTVA from RED_DIJAKI;
    datR RED_DIJAKI.DATUM_ROJSTVA%TYPE;
BEGIN
    open cur;
    
    LOOP
        fetch cur into datR;
        EXIT when cur%notfound;

        println(last_day(datR) - datR);

    end loop;
    close cur;
END;

-- 5. LAST_DAY( date )
-- Mojca bo praznovala svoj rojstni dan na zadnji dan v mesecu rojstva.
-- Izpiši kdaj bo Mojca praznovala rojstni dan v tem letu.

DECLARE
    CURSOR cur IS
    SELECT ime, DATUM_ROJSTVA from RED_DIJAKI;
    ime RED_DIJAKI.IME%TYPE;
    datR RED_DIJAKI.DATUM_ROJSTVA%TYPE;
BEGIN
    open cur;

    LOOP
        FETCH cur into ime, datR;
        EXIT when cur%notfound;

        --println(lpad(EXTRACT(day from datR), 2, '0') ||'.'|| lpad(EXTRACT(month from datR), 2, '0') || '.' ||trunc(EXTRACT(year from sysdate)));

        if ime like 'Mojca' THEN
            println(last_day(to_date(lpad(EXTRACT(day from datR), 2, '0') ||'.'|| lpad(EXTRACT(month from datR), 2, '0') || '.' ||trunc(EXTRACT(year from sysdate)), 'DD.MM.YYYY')));
        end if;

    END LOOP;

    close cur;
end;

-- 6. Mojca bo praznovala prvo soboto po svojem rojstnem dnevu. Izpiši datum praznovanja.

declare
    CURSOR cur IS
    SELECT ime, DATUM_ROJSTVA from RED_DIJAKI;
    ime RED_DIJAKI.IME%TYPE;
    datR RED_DIJAKI.DATUM_ROJSTVA%TYPE;
BEGIN
    open cur;

    LOOP
        FETCH cur into ime, datR;
        EXIT when cur%notfound;

        --println(lpad(EXTRACT(day from datR), 2, '0') ||'.'|| lpad(EXTRACT(month from datR), 2, '0') || '.' ||trunc(EXTRACT(year from sysdate)));

        if ime like 'Mojca' THEN
            println(to_char(next_day(to_date(lpad(EXTRACT(day from datR), 2, '0') ||'.'|| lpad(EXTRACT(month from datR), 2, '0') || '.' ||trunc(EXTRACT(year from sysdate)), 'DD.MM.YYYY')), 'Saturday'), 'DD.MM.YYYY');
        end if;

    END LOOP;

    close cur;
end;