-- auto-generated definition
create function get_payment_methods()
    returns TABLE(method_name text)
    language plpgsql
as
$$
BEGIN
    -- This special command grabs all allowed values from the 'payment_method_type' ENUM
    RETURN QUERY
    SELECT unnest(enum_range(NULL::payment_method_type))::TEXT;
END; $$;

alter function get_payment_methods() owner to root;

