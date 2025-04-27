CREATE OR REPLACE VIEW ZADNJE_TEK AS
select ime, priimek, to_char(datum) as datum, serija, dolzina_skoka, ocena_skoka, sk.STARTNI_CAS, sk.DATUM_PRIJAVE from SSK1_TEKMOVALCI t
inner join SSK1_SKOKI sk using (ID_TEKMOVALCA)
inner JOIN SSK1_TEKMOVANJA tk using(ID_TEKMOVANJA)
where datum = (
    select max(datum) from SSK1_TEKMOVANJA
);

SELECT * from SSK1_SKOKI;