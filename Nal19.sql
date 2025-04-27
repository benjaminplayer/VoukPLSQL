DECLARE
    CURSOR emp_cur 
    IS 
    select BDATE from EMP_EMPLOYEE
    ORDER BY BDATE ASC;

    datum date;
    idx number := 2;
BEGIN
    OPEN emp_cur;
    fetch emp_cur into datum;
    DBMS_OUTPUT.PUT_LINE('najstarejsa oseba je rojena dne '|| to_char(datum, 'dd.mm.yyyy'));
    LOOP
        fetch emp_cur into datum;
        EXIT WHEN emp_cur%notfound;
        DBMS_OUTPUT.PUT_LINE(idx || '. najstarejsa oseba je rojena dne '|| to_char(datum, 'dd.mm.yyyy'));
        idx := idx+1;
    END LOOP;
    close emp_cur;

end;

alter table EMP_EMPLOYEE
add datum_zaposlitve date;

INSERT INTO emp_employee (
    FNAME, MINIT, LNAME, SSN, BDATE, ADDRESS, SEX, SALARY, SUPERSSN, DNO, DATUM_ZAPOSLITVE
) 
VALUES (
    'John', 'D', 'Doe', 123456789012, TO_DATE('1985-06-15', 'YYYY-MM-DD'), 
    '123 Main St, Some City', 'M', 50000, NULL, 1, (to_date(to_char(sysdate,'dd.mm.yyyy HH24'), 'dd.mm.yyyy HH24'))
);

SELECT fname, to_char(datum_zaposlitve, 'dd.mm.yyyy hh24') from EMP_EMPLOYEE;
select fname, bdate, LAST_DAY(BDATE) - BDATE from EMP_EMPLOYEE;
desc EMP_EMPLOYEE;

select * from EMP_EMPLOYEE;

UPDATE EMP_EMPLOYEE
set DATUM_ZAPOSLITVE = to_date(TRUNC(DBMS_RANDOM.value(1, 28)) || '.' ||TRUNC(DBMS_RANDOM.value(1,13)) ||'.'|| Trunc(DBMS_RANDOM.value(1979, 1999)), 'DD.MM.YYYY')
where DATUM_ZAPOSLITVE is null;

select FName, EXTRACT(year from bdate) from EMP_EMPLOYEE;
select FName, TO_CHAR(bdate, 'yyyy') from EMP_EMPLOYEE;

select * from EMP_EMPLOYEE
where EXTRACT(year from bdate) > 1996;

select * from EMP_EMPLOYEE
where to_char(bdate, 'yyyy') = 1996;

select * from EMP_EMPLOYEE
where bdate = to_date('1996','yyyy');

DECLARE
    cursor cur IS
    select fname, bdate from EMP_EMPLOYEE;
    datum date;
    name emp_employee.FNAME%TYPE;
BEGIN
    open cur;
    LOOP
        fetch cur into name, datum;
        exit when cur%notfound;

        if extract(month from datum) >= 1 and EXTRACT(month from datum) < 5 THEN
            datum := ADD_MONTHS(datum, (
                5 - EXTRACT(MONTH from datum)
            ));
        end if;

        DBMS_OUTPUT.PUT_LINE(name || ' '|| to_char(datum,'dd/mm/yyyy'));

    end loop;
end;