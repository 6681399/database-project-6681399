-- auto-generated definition
create function add_service(p_company_id integer, p_name character varying, p_price numeric, p_minutes integer) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Services (Company_ID, Service_Name, Price, Estimate_TimeSpend)
    VALUES (p_company_id, p_name, p_price, p_minutes)
    RETURNING Service_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_service(integer, varchar, numeric, integer) owner to root;

