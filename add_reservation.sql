-- auto-generated definition
create function add_reservation(p_company_id integer, p_barber_id integer, p_customer_id integer, p_service_id integer, p_start_time timestamp without time zone) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INT;
    v_duration INT;
    v_end_time TIMESTAMP;
BEGIN
    SELECT Estimate_TimeSpend INTO v_duration
    FROM Services
    WHERE Service_ID = p_service_id;

    IF v_duration IS NULL THEN
        RAISE EXCEPTION 'Error: Service ID % not found.', p_service_id;
    END IF;

    v_end_time := p_start_time + (v_duration || ' minutes')::interval;

    INSERT INTO Reservation (
        Company_ID,
        Barber_ID,
        Customer_ID,
        Service_ID,
        Start_DateTime,
        End_DateTime,
        Status
    )
    VALUES (
        p_company_id,
        p_barber_id,
        p_customer_id,
        p_service_id,
        p_start_time,
        v_end_time,
        'Pending'
    )
    RETURNING Reservation_ID INTO v_id;

    RETURN v_id;

EXCEPTION
    WHEN exclusion_violation THEN
        RAISE EXCEPTION 'Booking Failed: The barber is busy at this time.';
END; $$;

alter function add_reservation(integer, integer, integer, integer, timestamp) owner to root;

