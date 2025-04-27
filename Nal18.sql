select * from SSK1_TEKMOVANJA;
update SSK1_TEKMOVANJA
SET datum = next_Day(to_date('01.03.2018','dd.mm.yyyy'), 'Saturday')
where id_tekmovanja = 3;

select * from SSK1_TEKMOVANJA
where ID_TEKMOVANJA = 3;

SELECT ID_TEKMOVANJA, naziv, datum, (LAST_DAY(datum) - datum) from SSK1_TEKMOVANJA;

select naziv, to_char(datum, 'yyyy') FROM SSK1_TEKMOVANJA;
select naziv, extract(year from datum) FROM SSK1_TEKMOVANJA;

select naziv, (EXTRACT (day from datum) || '.' ||extract(MONTH from datum) || '.'||EXTRACT(YEAR from datum)) as "date" from SSK1_TEKMOVANJA
where extract(year from datum) > 2005;

desc SSK1_TEKMOVANJA;

select datum, NVL(to_char(datum_vpisa, 'MM.DD.YYYY'), 'ni podatka') from SSK1_TEKMOVANJA;