-- auto-generated definition
create function add_barber_schedule(p_barber_id integer, p_day day_of_week_type, p_start time without time zone, p_end time without time zone) returns integer
    language plpgsql
as
$$
begin
    -- missing source code
end;
$$;

alter function add_barber_schedule(integer, day_of_week_type, time, time) owner to root;

