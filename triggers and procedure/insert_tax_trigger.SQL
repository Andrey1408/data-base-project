CREATE OR REPLACE FUNCTION insert_tax()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.period < INTERVAL '1 year' OR NEW.turnover = 0 THEN
        NEW.tax := '0%';
    ELSIF NEW.period >= INTERVAL '1 year' AND NEW.turnover > 0 AND NEW.deposits > 0 THEN
        NEW.tax := '13%';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insert_tax_trigger
BEFORE INSERT ON report
FOR EACH ROW
EXECUTE FUNCTION insert_tax();
