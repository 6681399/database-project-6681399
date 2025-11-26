-- auto-generated definition
create function check_barber_availability(p_barber_id integer, p_start_time timestamp without time zone, p_duration_minutes integer) returns boolean
    language plpgsql
as
$$
DECLARE
    v_end_time TIMESTAMP;
    v_day_str TEXT;
    v_is_working_hours BOOLEAN;
    v_conflict_count INT;
BEGIN
    v_end_time := p_start_time + (p_duration_minutes || ' minutes')::interval;
    v_day_str := TRIM(TO_CHAR(p_start_time, 'Dy'));

    SELECT EXISTS (
        SELECT 1 FROM Barber_Schedule
        WHERE Barber_ID = p_barber_id
        AND Day_Of_Week::text = v_day_str
        AND Is_Day_Off = FALSE
        AND p_start_time::time >= Start_Time
        AND v_end_time::time <= End_Time
    ) INTO v_is_working_hours;

    IF v_is_working_hours = FALSE THEN
        RETURN FALSE;
    END IF;

    SELECT COUNT(*) INTO v_conflict_count
    FROM (
        SELECT Reservation_ID FROM Reservation
        WHERE Barber_ID = p_barber_id
        AND Status NOT IN ('Cancelled', 'NoShow')
        AND Start_DateTime < v_end_time
        AND End_DateTime > p_start_time

        UNION ALL

        SELECT Blockout_ID FROM Schedule_Blockout
        WHERE Barber_ID = p_barber_id
        AND Start_Time < v_end_time
        AND End_Time > p_start_time
    ) as conflicts;

    IF v_conflict_count > 0 THEN
        RETURN FALSE;
    ELSE
        RETURN TRUE;
    END IF;
END; $$;

alter function check_barber_availability(integer, timestamp, integer) owner to root;

