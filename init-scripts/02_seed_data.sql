-- Insert initial data into account_detail
INSERT INTO account_detail (account_address, account_region, block_chain) VALUES
('addr1!', 'North America', 'Ethereum'),
('addr2!', 'Europe', 'Bitcoin'),
('addr3!', 'Asia', 'Solana'),
('addr4!', 'South America', 'Cardano'),
('addr5!', 'Africa', 'Polkadot');

-- Insert initial data into bought_history
INSERT INTO bought_history (date, coin, entry_price, quantity, account_address) VALUES
('2023-01-01', 'ETH', 1500.0000, 10.0000, 'addr1!'),
('2023-01-02', 'BTC', 28000.0000, 0.5000, 'addr2!'),
('2023-01-03', 'SOL', 30.0000, 100.0000, 'addr3!'),
('2023-01-04', 'ADA', 1.2000, 1000.0000, 'addr4!'),
('2023-01-05', 'DOT', 20.0000, 50.0000, 'addr5!'),
('2023-01-06', 'ETH', 1600.0000, 5.0000, 'addr1!'),
('2023-01-07', 'BTC', 29000.0000, 0.3000, 'addr2!'),
('2023-01-08', 'SOL', 35.0000, 200.0000, 'addr3!'),
('2023-01-09', 'ADA', 1.5000, 500.0000, 'addr4!'),
('2023-01-10', 'DOT', 25.0000, 30.0000, 'addr5!');