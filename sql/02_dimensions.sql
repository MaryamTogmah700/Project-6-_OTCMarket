-- ==========================================
-- Project 6 - Create Dimension Tables
-- ==========================================

DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date AS
SELECT
    ROW_NUMBER() OVER (ORDER BY FullDate) AS DateKey,
    FullDate,
    YEAR(FullDate) AS Year,
    QUARTER(FullDate) AS Quarter,
    MONTH(FullDate) AS Month,
    STRFTIME(FullDate, '%B') AS MonthName,
    DAY(FullDate) AS Day
FROM (
    SELECT DISTINCT CAST(ClosingBestBidDate AS DATE) AS FullDate
    FROM raw_otc
    WHERE ClosingBestBidDate IS NOT NULL
);

DROP TABLE IF EXISTS dim_security;
CREATE TABLE dim_security AS
SELECT
    ROW_NUMBER() OVER (ORDER BY SECID) AS SecurityKey,
    SECID,
    ANY_VALUE(CompID) AS CompID,
    ANY_VALUE(Symbol) AS Symbol,
    ANY_VALUE(CUSIP) AS CUSIP,
    ANY_VALUE(Issue) AS Issue,
    ANY_VALUE(SecType) AS SecType,
    ANY_VALUE(Class) AS Class,
    ANY_VALUE(DAD_PAL) AS DAD_PAL,
    ANY_VALUE(CaveatEmptor) AS CaveatEmptor,
    ANY_VALUE(SHOFlag) AS SHOFlag,
    ANY_VALUE(Rule3210Flag) AS Rule3210Flag
FROM raw_otc
GROUP BY SECID;

DROP TABLE IF EXISTS dim_venue;
CREATE TABLE dim_venue AS
SELECT
    ROW_NUMBER() OVER (ORDER BY Venue) AS VenueKey,
    Venue
FROM (
    SELECT DISTINCT Venue
    FROM raw_otc
    WHERE Venue IS NOT NULL
);

DROP TABLE IF EXISTS dim_tier;
CREATE TABLE dim_tier AS
SELECT
    ROW_NUMBER() OVER (ORDER BY TierID) AS TierKey,
    TierID,
    TierName
FROM (
    SELECT DISTINCT TierID, TierName
    FROM raw_otc
    WHERE TierID IS NOT NULL
);

DROP TABLE IF EXISTS dim_security_status;
CREATE TABLE dim_security_status AS
SELECT
    ROW_NUMBER() OVER (ORDER BY SecurityStatus) AS StatusKey,
    SecurityStatus
FROM (
    SELECT DISTINCT SecurityStatus
    FROM raw_otc
    WHERE SecurityStatus IS NOT NULL
);

SELECT 'dim_date' AS table_name, COUNT(*) AS rows FROM dim_date
UNION ALL
SELECT 'dim_security', COUNT(*) FROM dim_security
UNION ALL
SELECT 'dim_venue', COUNT(*) FROM dim_venue
UNION ALL
SELECT 'dim_tier', COUNT(*) FROM dim_tier
UNION ALL
SELECT 'dim_security_status', COUNT(*) FROM dim_security_status;
