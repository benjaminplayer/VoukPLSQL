--create or REPLACE view OCENE_VIEW AS
SELECT d.ime, d.priimek, p.NAZIV_PREDMETA  ,ocena, u.ime, u.priimek from RED_DIJAKI d
inner join RED_OCENE o on o.ID_DIJAKA = d.ID_DIJAKA
inner join RED_UCITELJI u on u.ID_UCITELJA = o.ID_UCITELJA
inner join RED_PREDMETI p on p.ID_PREDMETA = o.ID_PREDMETA
where extract(year from datum) = 2010; 
select * from RED_OCENE;



/*
declare
    cursor cur is 
    select ID_OCENE, datum from RED_OCENE;
    id RED_OCENE.ID_OCENE%type;
    datum RED_OCENE.DATUM%TYPE;
    a number(2);
    b number(2);
begin
    OPEN cur;
    LOOP
        FETCH cur into id, datum;
        exit when cur%notfound;
        a := DBMS_RANDOM.VALUE(1,27);
        b := DBMS_RANDOM.VALUE(1,12);

        PRINTLN(lpad(a, 2, '0') || '/'||lpad(b, 2, '0')|| '/' ||'2010');

        update RED_OCENE
        set datum = to_date(lpad(a, 2, '0') || '/'||lpad(b, 2, '0')|| '/' ||'2010', 'DD.MM.YYYY')
        where ID_OCENE = id;

        END LOOP;

end;*/