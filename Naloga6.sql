/*
Izdelajte PL/SQL skripto, ki bo:
    Izpisala vsa soda števila iz intervala od 1 do seštevka ordinalnih vrednosti vaših inicialk (vključno za zadnjo vrednostjo; pri spodnjem primeru
    bi se preverila tudi vrednost 161)
        npr. Tone Marone -> T=84, M=77; v tem primeru imamo interval od 1-161
            Znak (črko) dobite iz imena s pomočjo funkcije substr.
            Ordinalno vrednost iz znaka dobite s funkcijo ascii.

Pozor: vsak bo imel drug interval*/

DECLARE
    ime VARCHAR2(10) := 'Benjamin';
    priimek VARCHAR2(10) := 'Biscak';
    n number;
    i number;
BEGIN
    n := ascii(substr(ime, 0,1)) + ascii(substr(priimek,0,1));
    dbms_output.put_line(n);
    
    FOR i in 1 .. n LOOP
        IF MOD(i,2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
    END LOOP;
end;


