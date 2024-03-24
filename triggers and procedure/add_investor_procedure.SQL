CREATE PROCEDURE add_investor(
	IN p_type VARCHAR(50),
	IN p_name VARCHAR(50),
	IN p_experience VARCHAR(50))
AS
$$
BEGIN
    INSERT INTO investor (type, name, experience) VALUES (p_type, p_name, p_experience);
	RAISE NOTICE 'Новый инвестор успешно добавлен';
END;
$$ LANGUAGE plpgsql;
