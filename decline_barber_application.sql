-- auto-generated definition
create function decline_barber_application(p_barber_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM Barber_Profile
    WHERE Barber_ID = p_barber_id
    AND Status = 'Pending';
END; $$;

alter function decline_barber_application(integer) owner to root;

