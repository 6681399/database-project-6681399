-- auto-generated definition
create function get_upcoming_payments()
    returns TABLE(company_name character varying, plan_name character varying, days_left integer)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        c.Name,
        sp.Plan_Name,
        (s.Payment_Due_Date - CURRENT_DATE)::INT
    FROM Shop_Subscription s
    JOIN Company c ON s.Company_ID = c.Company_ID
    JOIN Subscription_Plan sp ON s.Plan_ID = sp.Plan_ID
    WHERE s.Payment_Due_Date BETWEEN CURRENT_DATE AND (CURRENT_DATE + 10)
    AND s.Status IN ('Active', 'Warning')
    ORDER BY s.Payment_Due_Date ASC;
END; $$;

alter function get_upcoming_payments() owner to root;

