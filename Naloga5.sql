/*
Izdelajte PL/SQL skripto, ki bo:

    Izpisala število različnih držav iz katerih prihajajo tekmovalci npr. "Na tekmovanju so tekmovalci iz 21 različnih držav".
    Primerjala število držav (na podlagi poizvedbe) s številom 30. V primeru, da bo število držav večje od 30 naj skripta izpiše npr. 
    "Število držav v tabeli države je več kot 30", v nasprotnem primeru pa naj izpiše "Število držav v tabeli države je manj kot 30"

Namig: Najprej morate izdelati poizvedbo in rezultat poizvedbe shraniti v spremenljivko. Zatem izdelate prvi izpis. Nato dobljeno število, 
katerega že imate shranjenega v spremenljivki, primerjate s številom 30 in izdelate drugi izpis.
*/



SELECT distinct count(id_drzave) from SSK1_SKOKI s
inner JOIN SSK1_TEKMOVANJA t using(ID_Tekmovanja)
inner join SSK1_TEKMOVALCI tek using(ID_tekmovalca)
inner join SSK1_DRZAVE d using(ID_DRZAVE)
where ID_TEKMOVANJA = 1;

DECLARE
    stDrzav number(3);

BEGIN

    /*SELECT count(id_drzave) into stDrzav from SSK1_SKOKI s
    inner JOIN SSK1_TEKMOVANJA t using(ID_Tekmovanja)
    inner join SSK1_TEKMOVALCI tek using(ID_tekmovalca)
    inner join SSK1_DRZAVE d using(ID_DRZAVE)
    where ID_TEKMOVANJA = 1;*/

    SELECT count(*) into stDrzav from SSK1_DRZAVE;

    DBMS_OUTPUT.PUT_LINE('Na tekmovanju so tekmovalci iz '||stDrzav||' različnih drzav');

    if stDrzav > 30 THEN
        DBMS_OUTPUT.PUT_LINE('Število držav v tabeli države je več kot 30');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Število držav v tabeli države je manj kot 30');

    end if;    

end;