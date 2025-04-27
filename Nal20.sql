create or replace PACKAGE HelloForm AS
    procedure proc_1;
    /*procedure proc_2;
    procedure proc_3;*/

end HelloForm;

create or replace PACKAGE body HelloForm AS
    procedure proc_1 AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello Proc 1');
    end;
    procedure proc_2 AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello Proc 2');
    end;

    procedure proc_3 AS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello Proc 3');
    end;
end HelloForm;

drop package body HelloForm;


select * from USER_PROCEDURES;
select * from USER_SOURCE;

execute HELLOFORM.PROC_1;