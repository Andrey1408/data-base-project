INSERT INTO investor (type, name, experience)
VALUES ('физлицо', 'Андрей', '3 года'),
       ('юрлицо', 'Банк СПБ', '20 лет'),
	   ('физлицо', 'Пётр', '1 год'),
	   ('физлицо', 'Олег', '5 лет');

INSERT INTO index (stock_market, country, value_in_points)
VALUES ('MOEX', 'Russia', 3300),
       ('RTS', 'Russia', 3000),
	   ('SP500', 'Usa', 5000);

INSERT INTO issuer (name, currency, capitalization, p_e, p_s)
VALUES ('Gazprom', 'RUB', 3821000000000, 12.9, 0.9),
       ('Sberbank', 'RUB', 6751000000000, 4.5, 1),
	   ('VTB', 'RUB', 650000000000, 1.7, 2),
	   ('Ozon', 'RUB', 577000000000, 0, 1.76),
	   ('Yandex', 'RUB', 1370000000000, 48.7, 1.67);

INSERT INTO tool (name, type, ticker, price, issuer_id, index_id)
VALUES ('Gazprom', 'Stock', 'GAZP', 200, 1, 1),
       ('Sberbank', 'Stock', 'SBER', 300, 2, 1),
	   ('VTB', 'Stock', 'VTBR', 0.023, 3, 1),
	   ('Ozon', 'Stock', 'OZON', 3400, 4, 1),
	   ('Yandex', 'Stock', 'YNDX', 3700, 5, 1);

INSERT INTO strategy (name, description, pofitability_forecast)
VALUES ('долгосрочная', 'держать ценные бумаги сроком от года', '50% годовых'),
	   ('среднесрочная', 'держать ценные бумаги сроком от месяца', '20% годовых'),
	   ('краткосрочная', 'держать ценные бумаги сроком от недели', '30% годовых'),
	   ('спекулятивная', 'покупка/продажа бумаг в течении дня', 'не прогнозируется');

INSERT INTO tool_strategy (tool_id, strategy_id)
VALUES (2, 1),
	   (2, 2),
	   (1, 1),
	   (3, 2),
	   (3, 3),
	   (5, 4),
	   (5, 2),
	   (4, 1),
	   (4, 2),
	   (4, 4);

INSERT INTO investment_portfolio (name, strategy_id, investor_id, balance)
VALUES ('Большой портфель на год', 1, 1, 200000),
	   ('Дневной потрфель', 4, 1, 100000),
	   ('Портфель банка СПБ', 1, 2, 200000000),
	   ('Портфель Петра', 2, 3, 50000),
	   ('Олегс Портфель', 3, 4, 1000000);


INSERT INTO dividends (payment_date, tool_id, payment_amount)
VALUES ('2023-05-08', 2, 25),
	   ('2022-10-07', 1, 51),
	   ('2021-07-13', 3, 0.0014);


INSERT INTO TRANSACTION (trans_type, quantity, date_t, tool_id, investment_portfolio_id)
VALUES ('покупка', 20, '2023-01-01', 2, 1),
	   ('покупка', 100, '2023-01-02', 5, 5),
	   ('покупка', 30, '2023-01-02', 4, 5),
	   ('покупка', 1000, '2023-01-03', 1, 3),
	   ('покупка', 100000, '2023-01-03', 3, 2),
	   ('покупка', 1000000, '2023-01-03', 3, 4),
	   ('покупка', 10, '2023-01-04', 5, 1),
	   ('покупка', 100, '2023-01-04', 2, 3),
	   ('покупка', 100, '2023-01-04', 4, 3),
	   ('покупка', 1500000, '2023-01-04', 3, 3);

INSERT INTO report (period, income, deposits, turnover, investment_portfolio_id)
VALUES ('1 month', 10000, 200000, 400000, 1),
	   ('2 months', 0, 100000, 250000, 2),
	   ('1 year', 2000000, 200000000, 300000000, 3),
	   ('1 month', 1000, 50000, 200000, 4),
	   ('2 months', -10000, 1000000, 5000000, 5);