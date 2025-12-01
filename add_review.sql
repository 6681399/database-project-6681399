-- auto-generated definition
create function add_review(p_reservation_id integer, p_barber_id integer, p_customer_id integer, p_rating integer, p_comment text) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Review (Reservation_ID, Barber_ID, Customer_ID, Rating, Comment)
    VALUES (p_reservation_id, p_barber_id, p_customer_id, p_rating, p_comment)
    RETURNING Review_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_review(integer, integer, integer, integer, text) owner to root;

