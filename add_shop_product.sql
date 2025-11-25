-- auto-generated definition
create function add_shop_product(p_company_id integer, p_name character varying, p_price numeric, p_stock integer) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Shop_Products (
        Company_ID, Product_Name, Price, stock_count
    )
    VALUES (
        p_company_id, p_name, p_price, p_stock
    )
    RETURNING Product_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_shop_product(integer, varchar, numeric, integer) owner to root;

