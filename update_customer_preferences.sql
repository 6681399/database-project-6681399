-- auto-generated definition
create function update_customer_preferences(p_customer_id integer, p_allergies character varying, p_hairstyle character varying) returns void
    language plpgsql
as
$$
BEGIN
    UPDATE Customer_Profile
    SET
        Allergies = p_allergies,
        Preferred_Hairstyle = p_hairstyle
    WHERE Customer_ID = p_customer_id;
END; $$;

alter function update_customer_preferences(integer, varchar, varchar) owner to root;

