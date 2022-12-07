create view v_generated_dates as
    select generate_series('2022-01-01', '2022-01-31', '1 day'::interval)::date as generated_date