-- ==========================================
-- Project 6 - Load Raw OTC Data
-- ==========================================

DROP TABLE IF EXISTS raw_otc;

CREATE TABLE raw_otc AS
SELECT *
FROM read_csv_auto(
    '../data/CIS4400-project06-2024-2024.csv',
    sample_size = -1,
    ignore_errors = true
);

SELECT COUNT(*) AS total_rows
FROM raw_otc;

SELECT *
FROM raw_otc
LIMIT 5;
