SELECT * FROM ALL_CONSTRAINTS
where owner like 'BISCAKB' and TABLE_NAME like 'SSK1%';

DESC SSK1_TEKMOVALCI;
desc ssk1_skoki;

select * from SSK1_SKOKI;

ALTER TABLE ssk1_skoki
drop constraint "skok_tekmv_fk";

alter table ssk1_skoki
drop constraint "skok_tekmo_fk";

insert into SSK1_SKOKI
values(SSK1_SKOKI_SQ.nextval, 1, 220, 1, 104, 16, 1, 'D', CURRENT_DATE, to_date('12.12.2024','DD.MM.YYYY'));

update SSK1_SKOKI
set ID_TEKMOVALCA = 2
where ID_SKOKA = 22;

ALTER table SSK1_SKOKI
add constraint skok_tekmo_fk foreign key (ID_TEKMOVANJA) references SSK1_TEKMOVANJA(ID_TEKMOVANJA);

select * from SSK1_TEKMOVALCI;

INSERT INTO SSK1_TEKMOVALCI
values(SSK1_TEKMOVALCI_SQ.nextval, 'Joe', 'Edwards', 2);

insert into SSK1_SKOKI
values(SSK1_SKOKI_SQ.nextval, 1, 21, 1, 106, 12, 1, 'D', CURRENT_DATE, to_date('12.12.2024','DD.MM.YYYY'));
