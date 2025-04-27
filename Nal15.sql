Create or REPLACE FUNCTION countLeap
(firstDate in date, secondDate in date)
RETURN number
AS
    firstYear number;
    lastYear number;
    y date;
    idx number;
    counter number := 0;



BEGIN
    
    firstYear := EXTRACT(YEAR FROM least(firstDate,secondDate));
    lastYear := EXTRACT(YEAR FROM greatest(firstDate,secondDate));


    FOR idx in firstyear .. lastYear LOOP
        IF MOD(idx, 4) = 0 AND MOD(idx, 100) !=0 OR MOD(idx, 400) = 0 THEN
            counter := counter + 1;
        END IF; 
    END LOOP;

    RETURN counter;

END;

DECLARE
    x number;
BEGIN
    x := countLeap(to_date('01.01.2000', 'DD.MM.YYYY'), to_DATE('01.01.2024', 'DD,MM,YYYY'));
    DBMS_OUTPUT.PUT_LINE(x);
end;