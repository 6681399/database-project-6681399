-- auto-generated definition
create function update_service_details(p_service_id integer, p_new_name character varying, p_new_price numeric, p_new_time_minutes integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE Services
    SET
        Service_Name = p_new_name,
        Price = p_new_price,
        Estimate_TimeSpend = p_new_time_minutes
    WHERE Service_ID = p_service_id;
END; $$;

alter function update_service_details(integer, varchar, numeric, integer) owner to root;

