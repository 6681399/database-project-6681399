-- auto-generated definition
create function add_schedule_blockout(p_barber_id integer, p_start timestamp without time zone, p_end timestamp without time zone, p_reason text) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Schedule_Blockout (Barber_ID, Start_Time, End_Time, Reason)
    VALUES (p_barber_id, p_start, p_end, p_reason)
    RETURNING Blockout_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_schedule_blockout(integer, timestamp, timestamp, text) owner to root;

