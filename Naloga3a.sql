/*
    Izdelajte PL/SQL skripto, ki bo simulirala preverjanja ali je število liho ali sodo. Za primer vzemite število 128.

    Uporabite stavek IF THEN, ter funkcijo MOD. Sintakso stavka IF THEN si oglejte v poglavju 8 (PL/SQL (Procedural Language/Structured Query Language), 
    funkcije MOD pa na povezavi.
*/

DECLARE
    a number := 128;
BEGIN
    IF MOD(a,2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Stevilo '||a||' je sodo');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Stevilo '||a||' je liho');
    END IF;
END;