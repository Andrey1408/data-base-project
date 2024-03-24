create table investor (
   id serial primary key,
   type varchar(50),
   name varchar(50) NOT NULL,
   experience varchar(50)
);
create table index (
   id serial primary key,
   stock_market varchar(50),
   country varchar(50),
   value_in_points int
);
create table issuer (
   id serial primary key,
   name varchar(50) NOT NULL,
   currency char(3),
   capitalization varchar(50),
   p_e numeric,
   p_s numeric
);
create table tool (
   id serial primary key,
   name varchar(50) NOT NULL,
   type varchar(50),
   ticker varchar(6),
   price numeric,
   issuer_id int NOT NULL,
   index_id int NOT NULL,
   FOREIGN KEY(issuer_id) REFERENCES issuer(ID),
   FOREIGN KEY(index_id) REFERENCES index(ID)
);
create table strategy (
   id serial primary key,
   name varchar(50),
   description varchar(50),
   pofitability_forecast varchar(50),
);
create table investment_portfolio (
   id serial primary key,
   name varchar(50) NOT NULL,
   type varchar(50),
   balance int,
   strategy_id int NOT NULL,
   investor_id int NOT NULL,
   FOREIGN KEY(strategy_id) REFERENCES strategy(ID),
   FOREIGN KEY(investor_id) REFERENCES investor(ID)
);
create table active (
   id serial primary key,
   quantity int,
   total_price numeric,
   tool_id int NOT NULL,
   investment_portfolio_id int NOT NULL,
   FOREIGN KEY(tool_id) REFERENCES tool(ID),
   FOREIGN KEY(investment_portfolio_id) REFERENCES investment_portfolio(ID)
);
create table transaction (
   id serial primary key,
   trans_type varchar(50),
   quantity int,
   price int,
   date_t date,
   tool_id int NOT NULL,
   investment_portfolio_id int NOT NULL,
   FOREIGN KEY(tool_id) REFERENCES tool(ID)
   FOREIGN KEY(investment_portfolio_id) REFERENCES investment_portfolio(ID)

);
create table report (
   id serial primary key,
   period interval,
   income int,
   turnover int,
   deposits int,
   tax varchar(50),
   investment_portfolio_id int NOT NULL,
   FOREIGN KEY(investment_portfolio_id) REFERENCES investment_portfolio(ID)
);
create table dividends (
   id serial primary key,
   payment_date date,
   tool_id int,
   payment_amount numeric,
   FOREIGN KEY(tool_id) REFERENCES tool(ID)
);
create table tool_strategy (
   tool_id INT NOT NULL,
   strategy_id INT NOT NULL,
   PRIMARY KEY (tool_id, strategy_id),
   FOREIGN KEY (tool_id) REFERENCES tool(ID),
   FOREIGN KEY (strategy_id) REFERENCES strategy(ID)
);