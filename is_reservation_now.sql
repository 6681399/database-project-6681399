-- auto-generated definition
create function is_reservation_now(p_reservation_id integer) returns boolean
    language plpgsql
as
$$
DECLARE
    v_start_time TIMESTAMP;
    v_status reservation_status_type;
BEGIN
    SELECT Start_DateTime, Status INTO v_start_time, v_status
    FROM Reservation
    WHERE Reservation_ID = p_reservation_id;

    IF v_start_time IS NULL OR v_status != 'Confirmed' THEN
        RETURN FALSE;
    END IF;

    IF DATE_TRUNC('minute', CURRENT_TIMESTAMP) = DATE_TRUNC('minute', v_start_time) THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END; $$;

alter function is_reservation_now(integer) owner to root;

