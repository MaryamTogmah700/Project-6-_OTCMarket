-- ==========================================
-- Project 6 - Analysis Queries
-- ==========================================

---------------------------------------------------
-- 1. Top 10 Most Traded Securities
---------------------------------------------------

SELECT
    s.Symbol,
    SUM(f.ShareVolume) AS TotalVolume
FROM fact_otc_market_final f
JOIN dim_security s
    ON f.SecurityKey = s.SecurityKey
GROUP BY s.Symbol
ORDER BY TotalVolume DESC
LIMIT 10;

---------------------------------------------------
-- 2. Top 10 Securities by Yearly Return
---------------------------------------------------

SELECT
    s.Symbol,
    MAX(f.YearlyReturn) AS MaxYearlyReturn
FROM fact_otc_market_final f
JOIN dim_security s
    ON f.SecurityKey = s.SecurityKey
GROUP BY s.Symbol
ORDER BY MaxYearlyReturn DESC
LIMIT 10;

---------------------------------------------------
-- 3. Average Daily Dollar Volume by Venue
---------------------------------------------------

SELECT
    v.Venue,
    ROUND(AVG(f.DollarVol),2) AS AvgDollarVolume
FROM fact_otc_market_final f
JOIN dim_venue v
    ON f.VenueKey = v.VenueKey
GROUP BY v.Venue
ORDER BY AvgDollarVolume DESC;

---------------------------------------------------
-- 4. Trading Volume by Security Status
---------------------------------------------------

SELECT
    ss.SecurityStatus,
    SUM(f.ShareVolume) AS TotalShares
FROM fact_otc_market_final f
JOIN dim_security_status ss
    ON f.StatusKey = ss.StatusKey
GROUP BY ss.SecurityStatus
ORDER BY TotalShares DESC;

---------------------------------------------------
-- 5. Average RSI by Tier
---------------------------------------------------

SELECT
    t.TierName,
    ROUND(AVG(f.RSI),2) AS AvgRSI
FROM fact_otc_market_final f
JOIN dim_tier t
    ON f.TierKey = t.TierKey
GROUP BY t.TierName
ORDER BY AvgRSI DESC;

---------------------------------------------------
-- 6. Top 10 Highest MACD Values
---------------------------------------------------

SELECT
    s.Symbol,
    d.FullDate,
    ROUND(f.MACD,4) AS MACD
FROM fact_otc_market_final f
JOIN dim_security s
    ON f.SecurityKey = s.SecurityKey
JOIN dim_date d
    ON f.DateKey = d.DateKey
ORDER BY f.MACD DESC
LIMIT 10;
