create function add_barber(p_company_id integer, p_first_name character varying, p_last_name character varying, p_commission numeric) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Barber_Profile (Company_ID, First_Name, Sur_Name, Commission_Rate)
    VALUES (p_company_id, p_first_name, p_last_name, p_commission)
    RETURNING Barber_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_barber(integer, varchar, varchar, numeric) owner to root;

