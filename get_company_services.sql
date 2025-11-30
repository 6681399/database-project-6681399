-- auto-generated definition
create function get_company_services(p_company_id integer)
    returns TABLE(service_id integer, service_name character varying, price numeric, duration_minutes integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        s.Service_ID,
        s.Service_Name,
        s.Price,
        s.Estimate_TimeSpend
    FROM Services s
    WHERE s.Company_ID = p_company_id
    ORDER BY s.Service_Name ASC;
END; $$;

alter function get_company_services(integer) owner to root;

