CREATE OR REPLACE VIEW TEKM_STEVILO_SKOKOV AS
    select ID_TEKMOVANJA, naziv, datum, IME_SKAKALNICE, status, vsi from(
        select ID_TEKMOVANJA, naziv, datum, sk.IME_SKAKALNICE, st.STATUS, count(s.ID_SKOKA) as vsi from SSK1_TEKMOVANJA t
        inner join SSK1_SKAKALNICE sk using(ID_SKAKALNICE)
        inner join SSK1_SKOKI s using(ID_TEKMOVANJA)
        inner join SSK1_SKOK_STATUSI st using(ID_STATUSA)
        GROUP by ID_STATUSA,ID_TEKMOVANJA ,naziv, datum, sk.IME_SKAKALNICE, st.status
    )
    group by ID_TEKMOVANJA, naziv, datum, IME_SKAKALNICE, status, vsi
    order by id_tekmovanja asc;

select * from TEKM_STEVILO_SKOKOV;

DROP VIEW TEKM_STEVILO_SKOKOV;

CREATE MATERIALIZED VIEW TEKM_STEVILO_SKOKOV
BUILD IMMEDIATE
REFRESH FORCE
ON COMMIT
as
    select ID_TEKMOVANJA, naziv, datum, IME_SKAKALNICE, status, vsi from(
        select ID_TEKMOVANJA, naziv, datum, sk.IME_SKAKALNICE, st.STATUS, count(s.ID_SKOKA) as vsi from SSK1_TEKMOVANJA t
        inner join SSK1_SKAKALNICE sk using(ID_SKAKALNICE)
        inner join SSK1_SKOKI s using(ID_TEKMOVANJA)
        inner join SSK1_SKOK_STATUSI st using(ID_STATUSA)
        GROUP by ID_STATUSA,ID_TEKMOVANJA ,naziv, datum, sk.IME_SKAKALNICE, st.status
    )
    group by ID_TEKMOVANJA, naziv, datum, IME_SKAKALNICE, status, vsi
    order by id_tekmovanja asc;


--število skokov, za posamezni status skokov, za posamezno tekmovanje*