-- auto-generated definition
create function add_platform_invoice(p_company_id integer, p_amount numeric, p_due_date date) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Platform_Invoice (Company_ID, Amount, Issued_Date, Status)
    VALUES (p_company_id, p_amount, CURRENT_DATE, 'Unpaid')
    RETURNING Invoice_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_platform_invoice(integer, numeric, date) owner to root;

