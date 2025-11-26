-- auto-generated definition
create function get_available_time_slots(p_barber_id integer, p_date date, p_service_duration integer, p_interval_minutes integer DEFAULT 30)
    returns TABLE(slot_time time without time zone)
    language plpgsql
as
$$
DECLARE
    v_day_str TEXT;
    v_work_start TIME;
    v_work_end TIME;
BEGIN
    v_day_str := TRIM(TO_CHAR(p_date, 'Dy'));

    SELECT Start_Time, End_Time INTO v_work_start, v_work_end
    FROM Barber_Schedule
    WHERE Barber_ID = p_barber_id
    AND Day_Of_Week::text = v_day_str
    AND Is_Day_Off = FALSE;

    IF v_work_start IS NULL THEN
        RETURN;
    END IF;

    
    RETURN QUERY
    SELECT series_slot::time
    FROM generate_series(
        (p_date || ' ' || v_work_start)::timestamp, -- Start generating at Shift Start
        (p_date || ' ' || v_work_end)::timestamp - (p_service_duration || ' minutes')::interval, -- Stop generating before shift ends
        (p_interval_minutes || ' minutes')::interval -- Step by 30 mins
    ) AS series_slot
    WHERE check_barber_availability(p_barber_id, series_slot, p_service_duration) = TRUE;

END; $$;

alter function get_available_time_slots(integer, date, integer, integer) owner to root;

