-- auto-generated definition
create function add_shop_subscription(p_company_id integer, p_plan_id integer) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Shop_Subscription (
        Company_ID,
        Plan_ID,
        Status,
        Payment_Due_Date,
        Missed_Payment_Count
    )
    VALUES (
        p_company_id,
        p_plan_id,
        'Active',
        CURRENT_DATE + INTERVAL '3 months',
        0
    )
    RETURNING Subscription_ID INTO v_id;

    RETURN v_id;
END; $$;

alter function add_shop_subscription(integer, integer) owner to root;

