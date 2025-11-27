-- auto-generated definition
create function confirm_all_barber_reservations(p_barber_id integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE Reservation
    SET Status = 'Confirmed'
    WHERE Barber_ID = p_barber_id
    AND Status = 'Pending';
END; $$;

alter function confirm_all_barber_reservations(integer) owner to root;

