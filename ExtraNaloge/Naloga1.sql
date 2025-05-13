/*
    1.	Napiši PL SQL blok 
a.	v katerem na DBMS izhod izpišeš ime in priimek tekmovalca z ID-jem ena (iz tabele SSK_TEKMOVALCI). Ime in priimek najprej shrani v spremenljivki tipa VARCHAR2.
b.	v katerem definiraš spremenljivko tipa BOOLEAN. Spremenljivka naj dobi vrednost True, če je ime daljše od priimka, v nasprotnem primeru dobi vrednost False.
Če je vrednost spremenljivke True, se na DBMS izhod izpiše niz »Ime je daljše od priimka.«, v nasprotnem primeru se na izhod izpiše niz »Ime ni daljše od priimka.«

*/

SELECT * FROM SSK1_TEKMOVALCI;

DECLARE
    ime SSK1_TEKMOVALCI.IME%TYPE;
    priimek SSK1_TEKMOVALCI.PRIIMEK%TYPE;
BEGIN
    select ime, priimek into ime, priimek from SSK1_TEKMOVALCI
    where id_tekmovalca = 1;
    println(ime || ' ' || priimek);
end;

DECLARE
    CURSOR cur IS
    select ime, priimek from SSK1_TEKMOVALCI;
    b BOOLEAN;
    ime SSK1_TEKMOVALCI.IME%TYPE;
    priimek SSK1_TEKMOVALCI.PRIIMEK%TYPE;
    i number := 1;
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