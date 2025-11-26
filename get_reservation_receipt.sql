-- auto-generated definition
create function get_reservation_receipt(p_reservation_id integer)
    returns TABLE(item_name character varying, item_price numeric)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        s.Service_Name,
        rs.Price_At_Booking -- We use the price saved at booking time, not current price
    FROM Reservation_Services rs
    JOIN Services s ON rs.Service_ID = s.Service_ID
    WHERE rs.Reservation_ID = p_reservation_id;
END; $$;

alter function get_reservation_receipt(integer) owner to root;

