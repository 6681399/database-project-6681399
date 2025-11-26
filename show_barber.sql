-- auto-generated definition
create function show_barber(p_company_id integer)
    returns TABLE(barber_id integer, first_name character varying, sur_name character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT b.Barber_ID, b.First_Name, b.Sur_Name
    FROM Barber_Profile b
    WHERE b.Company_ID = p_company_id;
END; $$;

alter function show_barber(integer) owner to root;

