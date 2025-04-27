/*
Izpisala imena in priimek tekmovalcev iz tabele SSK_TEKMOVALCI in sicer:

    v naraščajočem vrstnem redu (2x) - z zanko WHILE LOOP in FOR LOOP (zapisi naj bodo urejeni po priimkih)

Tekmovalec 1: Janez Novak je prijatelj od Toneta Maroneta
Tekmovalec 2: Franko Petek je prijatelj od Toneta Maroneta
Tekmovalec 3: Janko Peternel je prijatelj od Toneta Maroneta
...

    v padajočem vrstnem redu (2x) - z zanko WHILE LOOP in FOR LOOP (zapisi naj bodo urejeni po priimkih)

Tekmovalec 20: Klemen Zaletel je prijatelj od Toneta Maroneta
Tekmovalec 19: Peter Penko je prijatelj od Toneta Maroneta
Tekmovalec 18: Jurij Gagarin je prijatelj od Toneta Maroneta
...

Ime Tone Marone nadomestite z vašim imenom.

Referenčni primer dobite v skripti (PL/SQL (Procedural Language/Structured Query Language) priročnik) na strani 81.
*/

DECLARE
    ime SSK1_TEKMOVALCI.ime%type;
    priimek SSK1_TEKMOVALCI.priimek%type;
    idx number :=1;
    i number := 1;
    ttlTek number;

    CURSOR tek_cur_asc is
        select ime, priimek from SSK1_TEKMOVALCI
        order by priimek asc;
    
    CURSOR tek_cur_desc is
        select ime, priimek from SSK1_TEKMOVALCI
        order by priimek desc;

BEGIN

    select count(*) into  ttlTek from SSK1_TEKMOVALCI;

    DBMS_OUTPUT.PUT_LINE('WHILE ASC: ');
    DBMS_OUTPUT.PUT_LINE('');

    -- While loops
    OPEN tek_cur_asc;
    FETCH tek_cur_asc into ime, priimek;
    WHILE tek_cur_asc%found LOOP
        DBMS_OUTPUT.PUT_LINE('Tekmovalec '||idx||': '|| ime ||' ' || priimek || ' je prijatelj od Benjamina Biscaka');
        FETCH tek_cur_asc into ime, priimek;
        idx := idx+1;
    END LOOP;
    close tek_cur_asc;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('WHILE DESC: ');
    DBMS_OUTPUT.PUT_LINE('');

    OPEN tek_cur_desc;
    FETCH tek_cur_desc into ime, priimek;
    WHILE tek_cur_desc%found LOOP
        idx := idx-1;
        DBMS_OUTPUT.PUT_LINE('Tekmovalec '||idx||': '|| ime ||' ' || priimek || ' je prijatelj od Benjamina Biscaka');
        FETCH tek_cur_desc into ime, priimek;
    END LOOP;
    close tek_cur_desc;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('FOR ASC: ');
    DBMS_OUTPUT.PUT_LINE('');

    -- for loops
    OPEN tek_cur_asc;
    FOR i in 1 .. ttlTek LOOP
        FETCH tek_cur_asc into ime, priimek;
        DBMS_OUTPUT.PUT_LINE('Tekmovalec '||i||': '|| ime ||' ' || priimek || ' je prijatelj od Benjamina Biscaka');
    END LOOP;
    close tek_cur_asc;

    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('FOR DESC: ');
    DBMS_OUTPUT.PUT_LINE('');

    i :=1;
    OPEN tek_cur_desc;
    FOR i in reverse 1 .. ttlTek LOOP
        FETCH tek_cur_desc into ime, priimek;
        DBMS_OUTPUT.PUT_LINE('Tekmovalec '||i||': '|| ime ||' ' || priimek || ' je prijatelj od Benjamina Biscaka');
    END LOOP;
    close tek_cur_desc;
end;