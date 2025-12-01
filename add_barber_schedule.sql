-- auto-generated definition
create function add_barber_schedule(p_barber_id integer, p_day day_of_week_type, p_start time without time zone, p_end time without time zone) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Barber_Schedule (Barber_ID, Day_Of_Week, Start_Time, End_Time)
    VALUES (p_barber_id, p_day, p_start, p_end)
    RETURNING Schedule_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_barber_schedule(integer, day_of_week_type, time, time) owner to root;

