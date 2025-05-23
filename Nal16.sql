DECLARE
    c_id customers.id%type;
    c_name customerS.No.ame%type;
    c_addr customers.address%type;
    CURSOR c_customers is
    SELECT id, name, address FROM customers;
BEGIN
    OPEN c_customers;
    LOOP FETCH c_customers into c_id, c_name, c_addr;
    EXIT WHEN c_customers%notfound;
    dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_addr);
    END LOOP;
    CLOSE c_customers;

    EXCEPTION
    WHEN TOO_MANY_ROWS then
        DBMS_OUTPUT.PUT_LINE('Napaka v poizvedbi - poizvedba ne vrne enee vrstice');
    END;
END;
