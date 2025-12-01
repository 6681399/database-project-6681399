-- auto-generated definition
create function add_customer_card(p_customer_id integer, p_token character varying, p_last4 character varying, p_brand character varying, p_exp_month integer, p_exp_year integer, p_secret_key text) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Customer_Cards (
        Customer_ID, Provider_Token, Card_Last4, Card_Brand, Expiry_Month, Expiry_Year, Is_Default
    )
    VALUES (
        p_customer_id, pgp_sym_encrypt(p_token, p_secret_key), p_last4, p_brand, p_exp_month, p_exp_year,
        NOT EXISTS(SELECT 1 FROM Customer_Cards WHERE Customer_ID = p_customer_id)
    )
    RETURNING Card_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_customer_card(integer, varchar, varchar, varchar, integer, integer, text) owner to root;

