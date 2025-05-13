/*
    3.	Napiši poizvedbo, v kateri izpišeš ime, priimek, datum rojstva in opombo za vse dijake. Opomba sestavi glede na letnico rojstva v obliki, kot je navedeno spodaj. Uporabi CASE stavek.
-	Če je datum rojstva v letu 1999 – »Pred-milenijec.«
-	Če je datum rojstva v letu 2000 – »Milenijec.«
-	Če je datum rojstva v letu 2001 – »Milenijec plus ena.«
-	Za vse ostale – »Ni milenijec.«

*/

select ime, priimek,
CASE to_char(datum_rojstva,'yyyy')
    when '1999' then 'Predmilienijec'
    when '2000' then 'Milenial'
    when '2001' then 'Milenial +1'
else 'Ni milenijec' end 
from RED_DIJAKI