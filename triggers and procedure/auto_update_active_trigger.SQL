CREATE OR REPLACE FUNCTION update_active_info()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.trans_type = 'продажа' THEN
        UPDATE active
        SET quantity = quantity - NEW.quantity,
            total_price = total_price - NEW.price
        WHERE tool_id = NEW.tool_id AND investment_portfolio_id = NEW.investment_portfolio_id;

    ELSIF NEW.trans_type = 'покупка' THEN
        UPDATE active
        SET quantity = quantity + NEW.quantity,
            total_price = total_price + NEW.price
        WHERE tool_id = NEW.tool_id AND investment_portfolio_id = NEW.investment_portfolio_id;
    END IF;

    IF NOT FOUND THEN
        INSERT INTO active (quantity, total_price, tool_id, investment_portfolio_id)
        VALUES (
            COALESCE((SELECT SUM(t.quantity)
                      FROM transaction t
                      WHERE t.tool_id = NEW.tool_id
                        AND t.investment_portfolio_id = NEW.investment_portfolio_id), 0),
            COALESCE((SELECT SUM(t.price)
                      FROM transaction t
                      WHERE t.tool_id = NEW.tool_id
                        AND t.investment_portfolio_id = NEW.investment_portfolio_id), 0),
            NEW.tool_id, NEW.investment_portfolio_id
        );
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_active_info_trigger
AFTER INSERT ON transaction
FOR EACH ROW
EXECUTE FUNCTION update_active_info();
