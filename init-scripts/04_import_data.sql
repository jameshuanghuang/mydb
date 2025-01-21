-- Import data from bitcoin_data.csv into bitcoin_price table
COPY bitcoin_historical_price(date, open, high, low, close, adj_close, volume)
FROM '/docker-entrypoint-initdb.d/bitcoin_data.csv'
DELIMITER ','
CSV HEADER;