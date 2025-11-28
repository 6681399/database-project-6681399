-- auto-generated definition
create function add_barber(p_company_id integer, p_first_name character varying, p_last_name character varying, p_email character varying, p_phone_number character varying, p_password character varying, p_application_letter text) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Barber_Profile (
        Company_ID,
        First_Name,
        Sur_Name,
        Email,
        Mobile_Tel,
        Password_Hash,
        Application_Letter,
        Status,
        Salary
    )
    VALUES (
        p_company_id,
        p_first_name,
        p_last_name,
        p_email,
        p_phone_number,
        crypt(p_password, gen_salt('bf')),
        p_application_letter,
        'Pending',
        NULL
    )
    RETURNING Barber_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_barber(integer, varchar, varchar, varchar, varchar, varchar, text) owner to root;

