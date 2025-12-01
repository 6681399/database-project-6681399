-- auto-generated definition
create function delete_service(p_service_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM Services
    WHERE Service_ID = p_service_id;
END; $$;

alter function delete_service(integer) owner to root;

