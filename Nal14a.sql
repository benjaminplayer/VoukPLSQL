-- TA ne vem ce je prou idfk reste sami if u know how -> functions so narejene v 15a ker yes
CREATE OR REPLACE PROCEDURE Zakljuceno
(idTekmovanja IN number)
AS
    uspesni NUMBER;
    razveljavljeni number;
    tekmovalci NUMBER;
BEGIN
    UPDATE SSK1_TEKMOVANJA
    set TEKM_ZAKLJUCENO = 'D'
    where ID_TEKMOVANJA = idTekmovanja;

    uspesni := COUNT_SKOK_STATUS(idTekmovanja, 'Opravljen');
    razveljavljeni := COUNT_SKOK_STATUS(IDTEKMOVANJA, 'Razveljavljen');

    tekmovalci := COUNT_TEKMOVALCI(idtekmovanja);
    INSERT into SSK1_STAT_TEKMOVANJA
    VALUES(SSK1_STAT_TEKM_SQ.nextval, idTekmovanja, uspesni, razveljavljeni, tekmovalci);

END;

EXECUTE ZAKLJUCENO(2);

select * from SSK1_TEKMOVANJA;
select * from SSK1_SKOK_STATUSI;

CREATE table SSK1_STAT_TEKMOVANJA(
    id number,
    id_tekmovanja number,
    stev_usp_skokov number,
    stev_razv_skokov number,
    stev_tekmovalcev number,
    CONSTRAINT ssk1_stat_tekm_pk primary key(id),
    CONSTRAINT SSK1_STAT_TEKM_fK FOREIGN KEY(id_tekmovanja) REFERENCES SSK1_TEKMOVANJA(id_tekmovanja)
);

alter table SSK1_TEKMOVANJA
add tekm_zakljuceno varchar2(1);

Create Sequence SSK1_STAT_TEKM_SQ
start with 1
INCREMENT BY 1
NOCYCLE;

COMMIT;