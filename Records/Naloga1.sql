DECLARE
    TYPE dijak is RECORD
        (ime VARCHAR2(30), priimek VARCHAR2(30), datumRosjtva date, letRoj VARCHAR2(4), teza number(3), visina number(3));
    cursor cur is select ime, priimek, datumrojstva,to_char(datumrojstva,'yyyy') ,teza, visina from TEST1_DIJAK;
    dijaki dijak;
BEGIN

    open cur;
    LOOP
        FETCH cur into dijaki;
        exit when cur%notfound;
        PRINTLN(dijaki.ime || ' ' || dijaki.priimek || '; dat roj: '|| dijaki.datumRosjtva || ' letnica rojsvta: '||dijaki.letRoj || ' teza: '|| dijaki.teza || 'visina ' || dijaki.visina);
    END LOOP;

    close cur;

END;

select * from TEST1_DIJAK;