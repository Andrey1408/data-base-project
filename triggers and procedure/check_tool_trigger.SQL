CREATE OR REPLACE FUNCTION check_tool_existence()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM tool WHERE issuer_id = OLD.id) THEN
        RAISE EXCEPTION 'Cannot delete issuer because associated tools exist';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_tool_trigger
BEFORE DELETE ON issuer
FOR EACH ROW
EXECUTE FUNCTION check_tool_existence();
