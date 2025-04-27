/*
Izdelajte PL/SQL skripto, ki bo simulirala preverjanja ali je leto prestopno. Za primer vzemite leto 2022.

Uporabite stavek IF THEN, ter funkcijo MOD. Sintakso stavka IF THEN si oglejte v poglavju 8 (PL/SQL (Procedural Language/Structured Query Language),
 funkcije MOD pa na povezavi.*/

DECLARE
    a number := 2000;
BEGIN
    
    IF mod(a,4) = 0 and mod(a,100) !=0 or mod(a,400) = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Leto '||a||' je prestopno');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Leto '||a||' ni prestopno');
    end if;

END;