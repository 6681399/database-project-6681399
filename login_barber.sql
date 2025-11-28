-- auto-generated definition
create function login_barber(p_email character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INT;
    v_stored_hash VARCHAR;
    v_status barber_status_type;
BEGIN

    SELECT Barber_ID, Password_Hash, Status INTO v_id, v_stored_hash, v_status
    FROM Barber_Profile
    WHERE Email = p_email;

    IF v_id IS NULL THEN
        RETURN NULL;
    END IF;

    IF v_status != 'Active' THEN
        RETURN NULL;
    END IF;

    IF v_stored_hash = crypt(p_password, v_stored_hash) THEN
        RETURN v_id;
    ELSE
        RETURN NULL;
    END IF;
END; $$;

alter function login_barber(varchar, varchar) owner to root;

