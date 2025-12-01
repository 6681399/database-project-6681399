-- auto-generated definition
create function get_pending_barber_applications(p_company_id integer)
    returns TABLE(barber_id integer, first_name character varying, sur_name character varying, application_letter text, email character varying)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        b.Barber_ID,
        b.First_Name,
        b.Sur_Name,
        b.Application_Letter,
        b.Email
    FROM Barber_Profile b
    WHERE b.Company_ID = p_company_id
    AND b.Status = 'Pending';
END; $$;

alter function get_pending_barber_applications(integer) owner to root;

