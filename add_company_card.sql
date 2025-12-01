-- auto-generated definition
create function add_company_card(p_company_id integer, p_token character varying, p_last4 character varying, p_brand character varying, p_exp_month integer, p_exp_year integer, p_secret_key text) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Company_Cards (
        Company_ID,
        Provider_Token,
        Card_Last4,
        Card_Brand,
        Expiry_Month,
        Expiry_Year,
        Is_Default
    )
    VALUES (
        p_company_id,
        pgp_sym_encrypt(p_token, p_secret_key),
        p_last4,
        p_brand,
        p_exp_month,
        p_exp_year,
        NOT EXISTS(SELECT 1 FROM Company_Cards WHERE Company_ID = p_company_id)
    )
    RETURNING Card_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_company_card(integer, varchar, varchar, varchar, integer, integer, text) owner to root;

