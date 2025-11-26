-- auto-generated definition
create function show_services(p_company_id integer)
    returns TABLE(service_name character varying, price numeric, estimate_time integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT s.Service_Name, s.Price, s.Estimate_TimeSpend
    FROM Services s
    WHERE s.Company_ID = p_company_id;
END; $$;

alter function show_services(integer) owner to root;

