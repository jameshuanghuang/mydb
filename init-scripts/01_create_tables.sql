-- Create account_detail table
CREATE TABLE IF NOT EXISTS account_detail (
    account_address VARCHAR(50) PRIMARY KEY,
    account_region VARCHAR(50) NOT NULL,
    block_chain VARCHAR(20) NOT NULL
);

-- Create bought_history table
CREATE TABLE IF NOT EXISTS bought_history (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    coin VARCHAR(10) NOT NULL,
    entry_price DECIMAL(10, 4) NOT NULL,
    quantity DECIMAL(10, 4) NOT NULL,
    account_address VARCHAR(50) NOT NULL,
    FOREIGN KEY (account_address) REFERENCES account_detail(account_address)
);

-- Create bitcoin_historical_price table
CREATE TABLE IF NOT EXISTS bitcoin_historical_price (
    date DATE NOT NULL,
    open DECIMAL(20, 2) NOT NULL,
    high DECIMAL(20, 2) NOT NULL,
    low DECIMAL(20, 2) NOT NULL,
    close DECIMAL(20, 2) NOT NULL,
    adj_close DECIMAL(20, 2) NOT NULL,
    volume DECIMAL(20, 2) NOT NULL
);