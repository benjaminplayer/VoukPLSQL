create or REPLACE TRIGGER SSK1_TEK_TRIG
after UPDATE OF priimek on ssk1_tekmovalci
for EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('change');
end;

desc ssk1_tekmovalci;

create table SSK1_LOGTABEL(
    id number,
    uporabnik VARCHAR2(30),
    operacija VARCHAR2(30),
    imeTabele VARCHAR2(30),
    datum date,
    constraint ssk1_log_pk primary key(id)
);

CREATE SEQUENCE SSK1_LOGTABEL_SQ
    start with 1
    INCREMENT by 1
    NOCYCLE
    NOCACHE;

create or REPLACE trigger TekmovalciAfterInsert
after INSERT on SSK1_TEKMOVALCI
FOR EACH ROW
BEGIN
    insert into SSK1_LOGTABEL
    values(SSK1_LOGTABEL_SQ.NEXTVAL, user, 'INSERT','Tekmovalci',SYSDATE);
end;

CREATE OR REPLACE TRIGGER SSK1_DRZAVE_TRIGGER
BEFORE UPDATE OF drzava
    OR DELETE ON SSK1_DRZAVE
BEGIN
    -- Raise an error to prevent the update or delete operation
    RAISE_APPLICATION_ERROR(-20123, 'Update or delete is not allowed');
END;

set TRANSACTION read write;

delete from SSK1_DRZAVE;

create or replace TRIGGER SSK1_DOLZINA_SKOKA_VALIDACIJA
before insert on ssk1_skoki
for EACH row
BEGIN
    IF :new.dolzina_skoka < 0 or :new.dolzina_skoka > 260 then
        RAISE_APPLICATION_ERROR(-20124, 'Only values between 0 and 260 are premmited!');
    end if;
end;

drop trigger SSK1_DOLZINA_SKOKA_VALIDACIJA;

select * from ssk1_skoki;