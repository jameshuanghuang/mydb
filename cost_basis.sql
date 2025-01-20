-- Function to calculate cost basis for a given ticker
CREATE OR REPLACE FUNCTION calc_cost_basis(ticker_input VARCHAR)
RETURNS TABLE (
    ticker VARCHAR,
    total_cost DECIMAL,
    total_quantity INT,
    cost_basis DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        ticker,
        SUM(entry_price * quantity) AS total_cost,
        SUM(quantity) AS total_quantity,
        SUM(entry_price * quantity) / SUM(quantity) AS cost_basis
    FROM
        buy_stocks
    WHERE
        ticker = ticker_input
    GROUP BY
        ticker;
END;
$$ LANGUAGE plpgsql;

-- Example usage: Calculate cost basis for a specific ticker
SELECT * FROM calc_cost_basis('AAPL');