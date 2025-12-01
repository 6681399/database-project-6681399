-- auto-generated definition
create function process_renewals() returns integer
    language plpgsql
as
$$
DECLARE
    v_renewed_count INT := 0;
    v_sub RECORD;
    v_plan_cost DECIMAL(10, 2);
    v_total_bill DECIMAL(10, 2);
BEGIN
    FOR v_sub IN
        SELECT * FROM Shop_Subscription
        WHERE Payment_Due_Date <= CURRENT_DATE
        AND Status = 'Active'
        AND Auto_Renew = TRUE
        AND Default_Card_ID IS NOT NULL
    LOOP
        SELECT Monthly_Cost INTO v_plan_cost
        FROM Subscription_Plan
        WHERE Plan_ID = v_sub.Plan_ID;

        v_total_bill := v_plan_cost * 3;

        INSERT INTO Platform_Invoice (Company_ID, Amount, Issued_Date, Paid_Date, Status)
        VALUES (v_sub.Company_ID, v_total_bill, CURRENT_DATE, CURRENT_DATE, 'Paid');

        UPDATE Shop_Subscription
        SET Payment_Due_Date = Payment_Due_Date + INTERVAL '3 months',
            Missed_Payment_Count = 0 -- Reset strikes since they paid
        WHERE Subscription_ID = v_sub.Subscription_ID;

        v_renewed_count := v_renewed_count + 1;
    END LOOP;

    RETURN v_renewed_count;
END; $$;

alter function process_renewals() owner to root;

