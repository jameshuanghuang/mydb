CREATE TABLE IF NOT EXISTS bought_history (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    ticker VARCHAR(10) NOT NULL,
    entry_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    account CHAR(1) NOT NULL CHECK (account IN ('A', 'B', 'C'))
);

INSERT INTO bought_history (date, ticker, entry_price, quantity, account) VALUES
('2023-01-01', 'AAPL', 150.00, 10, 'A'),
('2023-01-02', 'GOOGL', 2800.00, 5, 'B'),
('2023-01-03', 'MSFT', 300.00, 20, 'C'),
('2023-01-04', 'TSLA', 700.00, 15, 'A'),
('2023-01-05', 'AMZN', 3300.00, 8, 'B');