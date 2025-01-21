-- Function to calculate cost basis for a given coin
CREATE OR REPLACE FUNCTION calc_cost_basis(coin_input VARCHAR)
RETURNS TABLE (
    coin VARCHAR,
    total_cost DECIMAL,
    total_quantity DECIMAL,
    cost_basis DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        coin,
        SUM(entry_price * quantity) AS total_cost,
        SUM(quantity) AS total_quantity,
        SUM(entry_price * quantity) / SUM(quantity) AS cost_basis
    FROM
        bought_history
    WHERE
        coin = coin_input
    GROUP BY
        coin;
END;
$$ LANGUAGE plpgsql;

-- Function to get the number of transactions for a given blockchain
CREATE OR REPLACE FUNCTION count_trxn_by_chain(block_chain_input VARCHAR)
RETURNS INT AS $$
DECLARE
    num_trxn INT;
BEGIN
    SELECT COUNT(*) INTO num_trxn
    FROM bought_history bh
    JOIN account_detail ad ON bh.account_address = ad.account_address
    WHERE ad.block_chain = block_chain_input;
    RETURN num_trxn;
END;
$$ LANGUAGE plpgsql;

-- Function to verify if an account address meets the specified criteria
CREATE OR REPLACE FUNCTION verify_address(account_address_input VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
    is_valid BOOLEAN;
BEGIN
    -- Check if the address meets the criteria
    SELECT 
        CASE 
            WHEN account_address_input ~ '^[A-Za-z][A-Za-z0-9]*[!?\&\^%][A-Za-z0-9]*$' -- Starts with a letter, contains exactly ONE special character, and ends with letters or numbers
            AND account_address_input ~ '[0-9]' -- Contains at least one number
            AND LENGTH(account_address_input) <= 50 -- Maximum length of 50 characters
            THEN TRUE
            ELSE FALSE
        END INTO is_valid;
    
    RETURN is_valid;
END;
$$ LANGUAGE plpgsql;