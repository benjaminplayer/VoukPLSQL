/*
Izdelajte PL/SQL skripto, ki bo simulirala zamenjavo dveh spremenljivk. Vrednost prve je ZBP1, vrednost druge pa ZBP2. 
Spremenljivke poimenujte tako, da so imena spremenljivk sestavljena iz besedice var, številke spremenjljivke (npr. 1), znaka _ ter prve črke vašega imena in priimka. 
Primer za npr. Tone Marone var1_tm. Pred zamenjavo vrednosti najprej preverite, če je vrednost prve enaka ZBP1 in vrednost druge ZBP2 potem izvedite zamenjavo;
 v nasprotnem primeru ne izvedete zamenjave. Vrednosti izpišite pred in po zamenjavi.

Uporabite stavek IF THEN. Sintakso stavka IF THEN si oglejte v poglavju 8 (skripta PL/SQL (Procedural Language/Structured Query Language)).*/

DECLARE
    var1bb varchar2(4) := 'ZBP1';
    var2bb varchar2(4) := 'ZBP2';
    tmp VARCHAR2(4);
BEGIN
    IF var1bb = 'ZBP1' and var2bb = 'ZBP2' THEN
        DBMS_OUTPUT.PUT_LINE(var1bb || ' ' || var2bb);
        tmp := var1bb;
        var1bb := var2bb;
        var2bb := tmp;
        dbms_output.PUT_LINE(var1bb || ' ' || var2bb);
    END IF;

END;