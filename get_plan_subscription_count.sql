-- auto-generated definition
create function get_plan_subscription_count(p_plan_id integer) returns integer
    language plpgsql
as
$$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Shop_Subscription
    WHERE Plan_ID = p_plan_id
    AND Status = 'Active';

    RETURN v_count;
END; $$;

alter function get_plan_subscription_count(integer) owner to root;

