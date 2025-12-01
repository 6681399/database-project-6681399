-- auto-generated definition
create function add_subscription_plan(p_name character varying, p_cost numeric, p_max_barbers integer) returns integer
    language plpgsql
as
$$
DECLARE v_id INT;
BEGIN
    INSERT INTO Subscription_Plan (Plan_Name, Monthly_Cost, Max_Barbers)
    VALUES (p_name, p_cost, p_max_barbers)
    RETURNING Plan_ID INTO v_id;
    RETURN v_id;
END; $$;

alter function add_subscription_plan(varchar, numeric, integer) owner to root;

