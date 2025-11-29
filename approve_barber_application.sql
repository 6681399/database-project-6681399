-- auto-generated definition
create function approve_barber_application(p_barber_id integer, p_final_salary numeric) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE Barber_Profile
    SET
        Status = 'Active',
        Salary = p_final_salary
    WHERE Barber_ID = p_barber_id
    AND Status = 'Pending';

END; $$;

alter function approve_barber_application(integer, numeric) owner to root;

