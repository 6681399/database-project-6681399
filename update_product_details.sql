-- auto-generated definition
create function update_product_details(p_product_id integer, p_new_name character varying, p_new_price numeric, p_new_stock integer) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE Shop_Products
    SET
        Product_Name = p_new_name,
        Price = p_new_price,
        stock_count = p_new_stock
    WHERE Product_ID = p_product_id;
END; $$;

alter function update_product_details(integer, varchar, numeric, integer) owner to root;

