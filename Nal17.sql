DECLARE
    CURSOR dij_cur IS
    select * from TEST1_DIJAK;
    dijak_rec dij_cur%rowtype;
BEGIN

    OPEN dij_Cur;
    LOOP
        FETCH dij_Cur into dijak_rec;
        exit when dij_cur%notfound;
        DBMS_OUTPUT.PUT_LINE(dijak_rec.id);
    END LOOP;

END;




CREATE TABLE TEST1_DIJAK(
    id number,
    ime varchar2(10),
    priimek varchar2(10),
    datumRojstva date,
    teza number,
    visina number,
    constraint test1_dijak_pk primary key(id)
);


INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (1, 'Ana',    'Novak',    TO_DATE('2005-03-15', 'YYYY-MM-DD'), 55, 165);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (2, 'Marko',  'Horvat',   TO_DATE('2004-11-22', 'YYYY-MM-DD'), 68, 178);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (3, 'Luka',   'Kovač',    TO_DATE('2006-01-09', 'YYYY-MM-DD'), 72, 180);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (4, 'Eva',    'Zupan',    TO_DATE('2005-06-30', 'YYYY-MM-DD'), 50, 160);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (5, 'Nejc',   'Mlakar',   TO_DATE('2003-08-12', 'YYYY-MM-DD'), 80, 185);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (6, 'Sara',   'Kralj',    TO_DATE('2004-12-01', 'YYYY-MM-DD'), 58, 168);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (7, 'Tina',   'Bizjak',   TO_DATE('2005-09-25', 'YYYY-MM-DD'), 62, 170);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (8, 'Miha',   'Zajc',     TO_DATE('2003-04-17', 'YYYY-MM-DD'), 77, 182);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (9, 'Nina',   'Turk',     TO_DATE('2006-07-07', 'YYYY-MM-DD'), 53, 162);
INSERT INTO TEST1_DIJAK (id, ime, priimek, datumRojstva, teza, visina) VALUES (10, 'Jan',   'Vidmar',   TO_DATE('2005-02-02', 'YYYY-MM-DD'), 70, 175);

-- Don't forget to COMMIT at the end if you want to save the changes:
COMMIT;
