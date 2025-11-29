-- auto-generated definition
create function get_monthly_income(p_company_id integer) returns numeric
    language plpgsql
as
$$
DECLARE
    v_total DECIMAL(10, 2);
BEGIN
    SELECT COALESCE(SUM(t.Total_Amount), 0.00) INTO v_total
    FROM Transaction t
    JOIN Reservation r ON t.Reservation_ID = r.Reservation_ID
    WHERE r.Company_ID = p_company_id
    AND t.Payment_Status = 'Paid'
    AND EXTRACT(YEAR FROM t.Transaction_Date) = EXTRACT(YEAR FROM CURRENT_DATE)
    AND EXTRACT(MONTH FROM t.Transaction_Date) = EXTRACT(MONTH FROM CURRENT_DATE);

    RETURN v_total;
END; $$;

alter function get_monthly_income(integer) owner to root;

