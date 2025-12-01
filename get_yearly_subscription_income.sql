-- auto-generated definition
create function get_yearly_subscription_income() returns numeric
    language plpgsql
as
$$
DECLARE
    v_total DECIMAL(10, 2);
BEGIN
    SELECT COALESCE(SUM(Amount), 0.00) INTO v_total
    FROM Platform_Invoice
    WHERE Status = 'Paid'
    AND EXTRACT(YEAR FROM Paid_Date) = EXTRACT(YEAR FROM CURRENT_DATE);

    RETURN v_total;
END; $$;

alter function get_yearly_subscription_income() owner to root;

