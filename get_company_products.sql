-- auto-generated definition
create function get_company_products(p_company_id integer)
    returns TABLE(product_id integer, product_name character varying, price numeric, stock_quantity integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        p.Product_ID,
        p.Product_Name,
        p.Price,
        p.stock_count
    FROM Shop_Products p
    WHERE p.Company_ID = p_company_id
    AND p.Is_Active = TRUE
    ORDER BY p.Product_Name ASC;
END; $$;

alter function get_company_products(integer) owner to root;

