-- auto-generated definition
create function login_customer(p_email character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INT;
    v_stored_hash VARCHAR;
BEGIN
    SELECT Customer_ID, Password_Hash INTO v_id, v_stored_hash
    FROM Customer_Profile
    WHERE Email = p_email;

    IF v_id IS NULL THEN
        RETURN NULL;
    END IF;

    IF v_stored_hash = crypt(p_password, v_stored_hash) THEN
        RETURN v_id;
    ELSE
        RETURN NULL;
    END IF;
END; $$;

alter function login_customer(varchar, varchar) owner to root;

