-- auto-generated definition
create function login(p_email character varying, p_password character varying)
    returns TABLE(user_id integer, role character varying)
    language plpgsql
as
$$
DECLARE
    v_id INT;
    v_stored_hash VARCHAR;
    v_status barber_status_type;
BEGIN

    SELECT Company_ID, Company_Password_Hash INTO v_id, v_stored_hash
    FROM Company
    WHERE Company_Email = p_email;

    IF v_id IS NOT NULL THEN
        IF v_stored_hash = crypt(p_password, v_stored_hash) THEN
            RETURN QUERY SELECT v_id, 'Owner'::VARCHAR;
            RETURN;
        END IF;
    END IF;

    SELECT Barber_ID, Password_Hash, Status INTO v_id, v_stored_hash, v_status
    FROM Barber_Profile
    WHERE Email = p_email;

    IF v_id IS NOT NULL THEN
        IF v_status = 'Active' AND v_stored_hash = crypt(p_password, v_stored_hash) THEN
            RETURN QUERY SELECT v_id, 'Barber'::VARCHAR;
            RETURN;
        END IF;
    END IF;

    SELECT Customer_ID, Password_Hash INTO v_id, v_stored_hash
    FROM Customer_Profile
    WHERE Email = p_email;

    IF v_id IS NOT NULL THEN
        IF v_stored_hash = crypt(p_password, v_stored_hash) THEN
            RETURN QUERY SELECT v_id, 'Customer'::VARCHAR;
            RETURN;
        END IF;
    END IF;

    RETURN;
END; $$;

alter function login(varchar, varchar) owner to root;

