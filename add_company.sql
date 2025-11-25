-- auto-generated definition
create function add_company(p_name character varying, p_phone character varying, p_open_time time without time zone, p_close_time time without time zone) returns integer
    language plpgsql
as
$$
begin
    -- missing source code
end;
$$;

alter function add_company(varchar, varchar, time, time) owner to root;

