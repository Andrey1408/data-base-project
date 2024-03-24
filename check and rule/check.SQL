ALTER TABLE report
ADD CONSTRAINT check_zero_turnover_if_zero_deposits
CHECK (CASE WHEN deposits = 0 THEN turnover = 0 ELSE true END);
