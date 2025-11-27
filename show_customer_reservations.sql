-- auto-generated definition
create function show_customer_reservations(p_customer_id integer)
    returns TABLE(service_name character varying, start_time timestamp without time zone)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        s.Service_Name,
        r.Start_DateTime
    FROM Reservation r
    JOIN Services s ON r.Service_ID = s.Service_ID
    WHERE r.Customer_ID = p_customer_id AND r.status = 'Pending'
    ORDER BY r.Start_DateTime ASC;
END; $$;

alter function show_customer_reservations(integer) owner to root;

