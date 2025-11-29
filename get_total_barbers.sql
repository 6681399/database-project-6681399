-- auto-generated definition
create function get_total_barbers(p_company_id integer) returns integer
    language plpgsql
as
$$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Barber_Profile
    WHERE Company_ID = p_company_id
    AND Status = 'Active';

    RETURN v_count;
END; $$;

alter function get_total_barbers(integer) owner to root;

