-- auto-generated definition
create function is_reservation_paid(p_reservation_id integer) returns boolean
    language plpgsql
as
$$
DECLARE
    v_status payment_status_type;
BEGIN
    SELECT Payment_Status INTO v_status
    FROM Transaction
    WHERE Reservation_ID = p_reservation_id;

    IF v_status = 'Paid' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; $$;

alter function is_reservation_paid(integer) owner to root;

