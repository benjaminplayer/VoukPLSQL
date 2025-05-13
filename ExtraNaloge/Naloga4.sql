/*
    4.	V tabelo TRG_ARTIKEL dodaj novo polje CENA_PREDLOG ustreznega podatkovnega tipa.
Napiši PL SQL blok, ki v polje CENA_PREDLOG vpiše novo – predlagano - ceno artikla.
Artiklom se predlagana cena oblikuje na podlagi prometa, ki ga je ustvaril posamezen artikel v letu 2017.
Artiklom, ki imajo promet:
-	v zgornji tretjini se cena zviša za eno osmino, 
-	v drugi tretjini se cena zviša za eno desetino,
-	v spodnji tretjini se cena zniža za eno desetino
Nova cena se vpiše v polje CENA_PREDLOG.
PL SQL blok naj na DBMS izhod izpiše ID, naziv, ceno, ter predlagano ceno za vsak artikel iz tabele TRG_ARTIKEL. 
Poleg navedenega izpiše še promet, ki ga je ustvaril posamezen artikel v letu 2017. 


*/

desc TRG_ARTIKEL;


alter table TRG_ARTIKEL
add CENA_PREDLOG number;

select * from TRG_ARTIKEL;

/*
DECLARE
    cursor cur
BEGIN
END;
*/