-- auto-generated definition
create function add_customer(p_company_id integer, p_first_name character varying, p_last_name character varying, p_email character varying, p_phone character varying, p_password character varying) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Customer_Profile (Company_ID, First_Name, Sur_Name, Email, Phone_Number, Password_hash)
    VALUES (p_company_id,
            p_first_name,
            p_last_name,
            p_email,
            p_phone,
            crypt(p_password, gen_salt('bf')))
    RETURNING Customer_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_customer(integer, varchar, varchar, varchar, varchar, varchar) owner to root;

