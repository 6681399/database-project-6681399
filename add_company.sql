-- auto-generated definition
create function add_company(p_name character varying, p_phone character varying, p_open_time time without time zone, p_close_time time without time zone, p_email character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Company (
        Name,
        Phone_Number,
        Open_Time,
        Close_Time,
        Company_Email,
        Company_Password_Hash
    )
    VALUES (
        p_name,
        p_phone,
        p_open_time,
        p_close_time,
        p_email,
        crypt(p_password, gen_salt('bf'))
    )
    RETURNING Company_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_company(varchar, varchar, time, time, varchar, varchar) owner to root;

