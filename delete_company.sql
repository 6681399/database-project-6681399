-- auto-generated definition
create function delete_company(p_company_id integer) returns void
    language plpgsql
as
$$
BEGIN
    DELETE FROM Platform_Invoice WHERE Company_ID = p_company_id;
    DELETE FROM Shop_Subscription WHERE Company_ID = p_company_id;
    DELETE FROM Company_Cards WHERE Company_ID = p_company_id;
    DELETE FROM Customer_Profile WHERE Company_ID = p_company_id;
    DELETE FROM Company
    WHERE Company_ID = p_company_id;
END; $$;

alter function delete_company(integer) owner to root;

