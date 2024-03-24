CREATE OR REPLACE FUNCTION format_capitalization()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        NEW.capitalization = TO_CHAR(NEW.capitalization::NUMERIC / 1000000000.0, 'FM999999999.0') || ' млрд.руб';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_format_capitalization
BEFORE INSERT OR UPDATE OF capitalization
ON issuer
FOR EACH ROW
EXECUTE FUNCTION format_capitalization();
