-- auto-generated definition
create function get_reservation_receipt(p_reservation_id integer)
    returns TABLE(item_type text, item_name character varying, quantity integer, unit_price numeric, total_price numeric)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        'Service'::TEXT,
        s.Service_Name,
        1 AS Quantity,
        s.Price AS Unit_Price,
        s.Price AS Total_Price
    FROM Reservation r
    JOIN Services s ON r.Service_ID = s.Service_ID
    WHERE r.Reservation_ID = p_reservation_id

    UNION ALL
    SELECT
        'Product'::TEXT,
        p.Product_Name,
        por.Amount AS Quantity,
        por.Price AS Unit_Price,
        (por.Price * por.Amount) AS Total_Price
    FROM Product_Order_Record por
    JOIN Shop_Products p ON por.Product_ID = p.Product_ID
    WHERE por.Reservation_ID = p_reservation_id;
END; $$;

alter function get_reservation_receipt(integer) owner to root;

