create sequence ssk1_drzave_sq
start with 10
INCREMENT by 1
NOCYCLE;

create sequence ssk1_skakalnice_sq
start with 10
INCREMENT by 1
NOCYCLE;

create sequence ssk1_skoki_sq
start with 10
INCREMENT by 1
NOCYCLE;

create sequence ssk1_skok_statusi_sq
start with 10
INCREMENT by 1
NOCYCLE;

create sequence ssk1_tekmovalci_sq
start with 10
INCREMENT by 1
NOCYCLE;

create sequence ssk1_tekmovanja_sq
start with 10
INCREMENT by 1
NOCYCLE;

select * from SSK1_TEKMOVALCI;

create index TEK_IME_idx
on SSK1_TEKMOVALCI(ime);

create index TEK_pri_idx
on SSK1_TEKMOVALCI(priimek);

create index TEK_dat_idx
on SSK1_TEKMOVANJA(datum);


