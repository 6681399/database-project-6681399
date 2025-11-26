-- auto-generated definition
create function show_services(p_company_id integer) returns void
    language plpgsql
as
$$
    BEGIN
        SELECT services.service_name, services.price, services.estimate_timespend FROM services
        WHERE p_company_id = company_id;
    end;
    $$;

alter function show_services(integer) owner to root;

