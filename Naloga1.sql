/*
    Izdelajte PL/SQL skripto kjer deklarirate 5 različnih spremenljivk. Spremenljivkam priredite vrednosti, nato pa vsebino spremenljivk izpišite v okno DBMS output.
     V prvo spremenljivko hranite celo število (111), v drugo spremenljivko shranite en znak (X), v tretjo niz maksimalne dolžine 50 (Pozdravljeni pri predmetu ZBP2!),
      v četrto datum (današnji datum, ki ne sme biti napisan ročno) in v peto realno število (12,3).
    Izpišite vsako spremenljivko posebej (za vsak izpis uporabite DBMS_OUTPUT.PUT_LINE)
        Za vsak izpis uporabite DBMS_OUTPUT.PUT_LINE
        Za vse izpise uporabite samo enkrat DBMS_OUTPUT.PUT_LINE -> how xD
    Izpišite vse spremenljivke naenkrat (en izpis, samo enkratni klic funkcije DBMS_OUTPUT.PUT_LINE)

*/
DECLARE
    a number(3) := 111;
    chr varchar2(1) := 'X';
    str VARCHAR2(50) :='Pozdravljeni pri predmetu ZBP2!';
    today date := SYSDATE;
    dbl number(3,1) := 12.3;
BEGIN
    DBMS_OUTPUT.PUT_LINE(a);
    DBMS_OUTPUT.PUT_LINE(chr);
    DBMS_OUTPUT.PUT_LINE(str);
    DBMS_OUTPUT.PUT_LINE(today);
    DBMS_OUTPUT.PUT_LINE(dbl);
    DBMS_OUTPUT.PUT_LINE(a ||' ' || chr || ' ' || str || ' ' || today || ' ' || dbl);
end;