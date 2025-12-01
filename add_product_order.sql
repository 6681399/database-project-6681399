-- auto-generated definition
create function add_product_order(p_reservation_id integer, p_product_id integer, p_amount integer) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INT;
    v_current_price DECIMAL(10,2);
    v_current_stock INT;
BEGIN
    SELECT Price, stock_count INTO v_current_price, v_current_stock
    FROM Shop_Products
    WHERE Product_ID = p_product_id;

    IF v_current_price IS NULL THEN
        RAISE EXCEPTION 'Product ID % not found', p_product_id;
    END IF;

    IF v_current_stock < p_amount THEN
        RAISE EXCEPTION 'Not enough stock. Current: %, Requested: %', v_current_stock, p_amount;
    END IF;

    UPDATE Shop_Products
    SET stock_count = stock_count - p_amount
    WHERE Product_ID = p_product_id;

    INSERT INTO Product_Order_Record (
        Reservation_ID,
        Product_ID,
        Amount,
        Price
    )
    VALUES (
        p_reservation_id,
        p_product_id,
        p_amount,
        v_current_price
    )
    RETURNING Order_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_product_order(integer, integer, integer) owner to root;

