WITH cte AS (
    SELECT
        transaction_id,
        merchant_id,
        credit_card_id,
        amount,
        transaction_timestamp,
        LAG(transaction_timestamp) OVER (
            PARTITION BY merchant_id, credit_card_id, amount
            ORDER BY transaction_timestamp
        ) AS prev_transaction_time
    FROM transactions
)

SELECT
    COUNT(*) AS payment_count
FROM cte
WHERE transaction_timestamp - prev_transaction_time <= INTERVAL '10 minutes';