-- auto-generated definition
create function get_monthly_reservation_count(p_company_id integer) returns integer
    language plpgsql
as
$$
DECLARE v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Reservation
    WHERE Company_ID = p_company_id
    AND Status != 'Cancelled'
    AND EXTRACT(YEAR FROM Start_DateTime) = EXTRACT(YEAR FROM CURRENT_DATE)
    AND EXTRACT(MONTH FROM Start_DateTime) = EXTRACT(MONTH FROM CURRENT_DATE);

    RETURN v_count;
END; $$;

alter function get_monthly_reservation_count(integer) owner to root;

