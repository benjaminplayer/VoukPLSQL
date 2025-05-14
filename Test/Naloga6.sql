declare
    st_ocen number;
    povp_ocena number := 3.2;
BEGIN
    SELECT count(*) into st_ocen from(
        select ime, priimek, avg(ocena) from RED_DIJAKI d
        inner join RED_OCENE o USING(id_dijaka)
        GROUP by ID_DIJAKA, ime, priimek
        HAVING avg(ocena) > povp_ocena
    );

    println('St ocen vecjih: '|| st_ocen);

end;