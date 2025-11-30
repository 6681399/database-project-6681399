-- auto-generated definition
create function get_company_daily_blockouts(p_company_id integer, p_view_date date)
    returns TABLE(barber_name text, start_time timestamp without time zone, end_time timestamp without time zone, reason text)
    language plpgsql
as
$$
BEGIN
    RETURN QUERY
    SELECT
        (b.First_Name || ' ' || b.Sur_Name)::TEXT AS Barber_Name,
        sb.Start_Time,
        sb.End_Time,
        sb.Reason
    FROM Schedule_Blockout sb
    JOIN Barber_Profile b ON sb.Barber_ID = b.Barber_ID
    WHERE b.Company_ID = p_company_id
    AND DATE(sb.Start_Time) = p_view_date
    ORDER BY sb.Start_Time ASC;
END; $$;

alter function get_company_daily_blockouts(integer, date) owner to root;

