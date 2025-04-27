/*
    Na podlagi povprečne dolžine skoka iz tabele SSK_SKOKI spremenila vse zapise v tabeli SSK_SKOKI po naslednjem pravilu

    Če je dolžina posameznega skoka daljša od povprečja vseh skokov v tabeli SSK_SKOKI, potem ga podaljšate za dolžino, ki je enaka 1/10 (eni desetini) seštevka vrednosti vaših inicialk. V nasprotnem primeru pa, dolžino zmanjšajte za 1/15 (eno petnajstino) seštevka vrednosti vaših inicialk.

Primer: Za dijaka Toneta Maroneta ter povprečje dolžine skokov 147,8 imajo tisti zapisi, ki imajo dolžino večjo od 147,8 novo dolžino 147,8+161/10 in tisti, ki imajo manjšo 147,8-161/15.

    npr. Tone Marone -> T=84, M=77 -> vsota ordinalnih vrednosti je 161

Po izvedbi skripte izpišite id tekmovalca in dolžine skokov iz tabele SKK_SKOKI. (Izdelajte zaslonsko sliko izpisa png/jpeg.)

Pozor: Vsak dijak ima načeloma različno rešitev.

Referenčni primer dobite v skripti (PL/SQL (Procedural Language/Structured Query Language) priročnik) na strani 47.

V priponkah imate primer za ime Boštjan in priimek Vouk. V skripti je smiselno dodati tudi dva kontrolna izpisa in sicer izpis ordinalne vsoti inicialk ter izpis povprečja. Skripto morate pognati samo enkrat. V fazi testiranja boste morali zelo verjetno tudi kdaj pobrisati podatke iz tabele ssk_skoki in tabelo nato ponovno napolniti (podatke najdete v DML skripti za PB smučarski skoki). Vsi morate imeti enak prvotni izpis (prva slika v priponki), skripto in spremenjen izpis pa vsi drugačno.
*/

select ime, priimek, sk.DOLZINA_SKOKA from SSK1_SKOKI sk
inner join SSK1_TEKMOVALCI tek on tek.ID_TEKMOVALCA = sk.ID_TEKMOVALCA;

DECLARE
    dolzina SSK1_SKOKI.DOLZINA_SKOKA%TYPE;
    avgDolzina SSK1_SKOKI.DOLZINA_SKOKA%TYPE;
    ime SSK1_TEKMOVALCI.IME%TYPE;
    priimek SSK1_TEKMOVALCI.PRIIMEK%TYPE;

    mojeIme VARCHAR2(10) :='Benjamin';
    mojPriimek VARCHAR2(10) := 'Biscak';
    inicialkeOrd number;
    idx number := 1;

    CURSOR ssk_skok IS
        select ime, priimek, sk.DOLZINA_SKOKA from SSK1_SKOKI sk
        inner join SSK1_TEKMOVALCI tek on tek.ID_TEKMOVALCA = sk.ID_TEKMOVALCA;
BEGIN
    select avg(dolzina_skoka) into avgDolzina from SSK1_SKOKI;
    inicialkeOrd := ascii(substr(mojeime,0,1)) + ascii(substr(mojPriimek,0,1));

    DBMS_OUTPUT.PUT_LINE('Avg: '|| avgDolzina);
    DBMS_OUTPUT.PUT_LINE('Ord: '|| inicialkeOrd);
    
    OPEN ssk_skok;
    LOOP
        FETCH ssk_skok into ime, priimek, dolzina;
        EXIT WHEN ssk_skok%notfound;

        IF dolzina > avgDolzina THEN
            update SSK1_SKOKI
            set DOLZINA_SKOKA = DOLZINA_SKOKA+(inicialkeOrd*0.1)
            where ID_SKOKA = idx;
        ELSE
            update SSK1_SKOKI
            set DOLZINA_SKOKA = DOLZINA_SKOKA - (inicialkeOrd * (1/15))
            where ID_SKOKA = idx;
        END IF;

        idx := idx+1;

    END LOOP;
    close ssk_skok;
END;

select ime, priimek, sk.DOLZINA_SKOKA from SSK1_SKOKI sk
inner join SSK1_TEKMOVALCI tek using(ID_TEKMOVALCA);
--inner join SSK_TEKMOVANJE_TEKMOVALEC stt on sk.TEKMOVALECID_FK = stt.TEKMOVALECID_FK;

ROLLBACK;