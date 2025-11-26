-- auto-generated definition
create function show_barber(p_company_id integer) returns void
    language plpgsql
as
$$
    BEGIN
        SELECT barber_profile.first_name FROM barber_profile
        WHERE p_company_id = company_id;
    end;
    $$;

alter function show_barber(integer) owner to root;

