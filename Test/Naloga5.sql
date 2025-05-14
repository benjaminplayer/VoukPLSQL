create table TEST_ARTIKEL1(
    id NUMBER,
    naziv VARCHAR2(30),
    cena number,
    constraint test_art_pk primary key(id)
);

alter table TEST_ARTIKEL
add KODA_ART varchar2(6);


create or replace PROCEDURE VPIS_KODE AS
    cursor cur IS
        select id, naziv from TEST_ARTIKEL; 
    koda VARCHAR2(6);

    idA TEST_ARTIKEL.id%type;
    nazivA TEST_ARTIKEL.naziv%type;

BEGIN
    open cur;

    LOOP
        FETCH cur into ida, nazivA;
        exit WHEN cur%notfound;

        koda := substr(nazivA,0, 3);
        koda := upper(koda);
        
        koda := replace(koda, 'Č','C');
        koda := replace(koda, 'Š','S');
        koda := replace(koda, 'Ž','Z');
        koda := koda || lpad(length(nazivA), 3, '0');

        update TEST_ARTIKEL
        set KODA_ART = koda
        where ID = ida;

    end LOOP;

    close cur;
END;

EXECUTE VPIS_KODE();

select * from TEST_ARTIKEL;
