--Napiši proceduro, ki popravi vse prve črke imen na veliko črko.
create or replace procedure CORRECT_FIRST_LETTER AS
    CURSOR cur is select idoseba, ime from oseba;
    idO oseba.IDOSEBA%TYPE;
    ime oseba.ime%type;

BEGIN
    open cur;

    LOOP
        FETCH cur into ido, ime;
        EXIT when cur%notfound;

        ime := upper(substr(ime,0,1)) || substr(ime,1,length(ime) -1);

        update OSEBA
        set ime = ime
        where IDOSEBA = ido;

    end loop;

    close cur;
end;


EXECUTE CORRECT_FIRST_LETTER;

select * from OSEBA
order by idoseba;