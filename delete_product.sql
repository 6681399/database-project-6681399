-- auto-generated definition
create function delete_product(p_product_id integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE Shop_Products
    SET Is_Active = FALSE
    WHERE Product_ID = p_product_id;
END; $$;

alter function delete_product(integer) owner to root;

