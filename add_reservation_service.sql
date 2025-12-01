-- auto-generated definition
create function add_reservation_service(p_reservation_id integer, p_service_id integer) returns void
    language plpgsql
as
$$
DECLARE
    v_current_price DECIMAL(10,2);
BEGIN
    SELECT Price INTO v_current_price FROM Services WHERE Service_ID = p_service_id; -- fetch price from service table

    INSERT INTO Reservation_Services (Reservation_ID, Service_ID, Price_At_Booking)
    VALUES (p_reservation_id, p_service_id, v_current_price);
END; $$;

alter function add_reservation_service(integer, integer) owner to root;

