/*

    Nad tabelo SSK_TEKMOVALCI (#id_tekmovalca, ime, priimek, id_drzave, datum_rojstva) definiramo prožilec tekmovalci_priimek, ki bo izpisal sporočilo ob vsaki spremembi atributa priimek.
Kreiraj "dnevniško" tabelo logTabel z naslednjimi atributi: id (sekvenca)*, uporabnik, operacija, imeTabele, datum. Kreiraj prožilec TekmovalciAfterInsert, ki v tabelo logTabela zapiše 
podatke ob vsakem novem vnosu v tabelo SSK_Tekmovalci.
Napiši prožilec (drzave_trigger), ki onemogoča spreminjanje vrednosti atributa drzava ter brisanje podatkov iz tabele SSK_DRZAVE. Namig: prožite proceduro RAISE_APPLICATION_ERROR.
Napiši prožilec (dolzina_skoka_validacija), ki validira dolžino vnesenega ali popravljenega skoka (dolzina_skoka) iz tabele SSK_SKOKI. Dovoljene vrednosti za dolžino so vrednosti iz intervala [0,260].
*/

create or replace TRIGGER tek_pri
after update of priimek
on SSK1_TEKMOVALCI
DECLARE
BEGIN
    PRINTLN('Priimek je bil posodobljen!');
end;

update SSK1_TEKMOVALCI
set PRIIMEK = 'Test1'
where ID_TEKMOVALCA = 1;

create table logTabel1(
    id number,
    uporabnik varchar2(30),
    operacija VARCHAR2(30),
    imeTabele VARCHAR2(30),
    datum DATE,
    CONSTRAINT logtabel1_pk primary key(id)
);

CREATE SEQUENCE logTabel1_sq
start WITH 1
INCREMENT by 1
NOCYCLE
NOCACHE;

create or replace TRIGGER TekmovalciAfterInsert
after INSERT
on SSK1_TEKMOVALCI
FOR EACH row
DECLARE
    cur_usr VARCHAR2(30);
BEGIN
    select user into cur_usr from dual;
    insert into LOGTABEL1
    values(LOGTABEL1_SQ.nextval, cur_usr,'INSERT','TEKMOVALCI',sysdate);
    PRINTLN('triggered1');
end;

INSERT into SSK1_TEKMOVALCI
values(SSK1_TEKMOVALCI_SQ.nextval, 'tEST44','DAS',1,sysdate);

desc SSK1_TEKMOVALCI;