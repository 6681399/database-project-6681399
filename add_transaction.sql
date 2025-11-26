-- auto-generated definition
create function add_transaction(p_reservation_id integer, p_total numeric, p_tip numeric, p_method payment_method_type) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    -- Insert with the Tip Amount
    -- We use COALESCE(p_tip, 0) to turn NULLs into 0.00 automatically
    INSERT INTO Transaction (
        Reservation_ID,
        Total_Amount,
        Tip_Amount,
        Payment_Method,
        Payment_Status
    )
    VALUES (
        p_reservation_id,
        p_total,
        COALESCE(p_tip, 0.00), -- Safety check for empty tips
        p_method,
        'Paid'
    )
    RETURNING Transaction_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_transaction(integer, numeric, numeric, payment_method_type) owner to root;

