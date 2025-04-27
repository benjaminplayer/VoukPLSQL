/*
Izdelajte poizvedbo, ki bo izpisala kratice držav iz tabele države (SSK_DRZAVE); ta tabela je narejena, ko poženete skripto*, ki je priloga te naloge.
 Npr. za Slovenijo - SLO, za Nemčijo - GER. Uporabite kratice po eni izmed predlaganih kategorij, vendar pa za vse enako.
Kategorizacija kratic je na tej povezavi. Uporabite stavek CASE. Demonstrativen primer si poglejte na naslednji povezavi.*/

select * from SSK1_DRZAVE;

    SELECT ID_DRZAVE,
    CASE
        WHEN upper(drzava) like 'SLOVENIJA' then 'SLO'
        WHEN upper(drzava) like 'NEMCIJA' then 'GER'
        WHEN upper(drzava) like 'AVSTRIJA' then 'AUT'
        WHEN upper(drzava) like 'KITAJSKA' then 'CHN'
        WHEN upper(drzava) like 'JAPONSKA' then 'JPN'
        WHEN upper(drzava) like 'AMERIKA' then 'USA'
        WHEN upper(drzava) like 'KANADA' then 'CAN'
        WHEN upper(drzava) like 'AVSTRALIJA' then 'AUT'
        WHEN upper(drzava) like 'ITALIJA' then 'ITA'
        WHEN upper(drzava) like 'FRANCIJA' then 'FRA'
    END as kratica
    from SSK1_DRZAVE;


/*
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('3','Avstrija');
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('4','Kitajska');
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('5','Japonska');
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('6','Amerika');
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('7','Kanada');
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('8','Avstralija');
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('9','Italija');
Insert into SSK1_DRZAVE (ID_DRZAVE,DRZAVA) values ('10','Francija');*/

end;