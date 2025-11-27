-- auto-generated definition
create function add_transaction(p_reservation_id integer, p_tip numeric, p_method payment_method_type) returns integer
    language plpgsql
as
$$
DECLARE
    v_id INT;
    v_service_price DECIMAL(10, 2);
    v_product_total DECIMAL(10, 2);
    v_grand_total DECIMAL(10, 2);
BEGIN
    SELECT s.Price INTO v_service_price
    FROM Reservation r
    JOIN Services s ON r.Service_ID = s.Service_ID
    WHERE r.Reservation_ID = p_reservation_id;

    SELECT COALESCE(SUM(Price * Amount), 0.00) INTO v_product_total
    FROM Product_Order_Record
    WHERE Reservation_ID = p_reservation_id;

    v_grand_total := v_service_price + v_product_total + COALESCE(p_tip, 0.00);

    INSERT INTO Transaction (
        Reservation_ID,
        Total_Amount,
        Tip_Amount,
        Payment_Method,
        Payment_Status
    )
    VALUES (
        p_reservation_id,
        v_grand_total,
        COALESCE(p_tip, 0.00),
        p_method,
        'Paid'
    )
    RETURNING Transaction_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_transaction(integer, numeric, payment_method_type) owner to root;

