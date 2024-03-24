CREATE OR REPLACE FUNCTION update_transaction_price()
RETURNS TRIGGER AS $$
BEGIN
    NEW.price = NEW.quantity * (SELECT price FROM tool WHERE id = NEW.tool_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_transaction_price_trigger
BEFORE INSERT ON transaction
FOR EACH ROW
EXECUTE FUNCTION update_transaction_price();
