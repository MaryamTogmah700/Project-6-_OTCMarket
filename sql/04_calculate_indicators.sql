-- ==========================================
-- Project 6 - Calculate Technical Indicators
-- ==========================================

DROP TABLE IF EXISTS fact_otc_market_final;

CREATE TABLE fact_otc_market_final AS
WITH price_data AS (
    SELECT
        f.*,
        d.FullDate,
        EXTRACT(YEAR FROM d.FullDate) AS TradeYear,

        AVG(f.LastPrice) OVER (
            PARTITION BY f.SecurityKey
            ORDER BY d.FullDate
            ROWS BETWEEN 49 PRECEDING AND CURRENT ROW
        ) AS MovingAverage50,

        AVG(f.LastPrice) OVER (
            PARTITION BY f.SecurityKey
            ORDER BY d.FullDate
            ROWS BETWEEN 99 PRECEDING AND CURRENT ROW
        ) AS MovingAverage100,

        AVG(f.LastPrice) OVER (
            PARTITION BY f.SecurityKey
            ORDER BY d.FullDate
            ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
        ) AS MA12,

        AVG(f.LastPrice) OVER (
            PARTITION BY f.SecurityKey
            ORDER BY d.FullDate
            ROWS BETWEEN 25 PRECEDING AND CURRENT ROW
        ) AS MA26,

        LAG(f.LastPrice) OVER (
            PARTITION BY f.SecurityKey
            ORDER BY d.FullDate
        ) AS PreviousLastPrice,

        FIRST_VALUE(f.LastPrice) OVER (
            PARTITION BY f.SecurityKey, EXTRACT(YEAR FROM d.FullDate)
            ORDER BY d.FullDate
        ) AS FirstPriceOfYear

    FROM fact_otc_market f
    JOIN dim_date d
        ON f.DateKey = d.DateKey
),

rsi_data AS (
    SELECT
        *,
        CASE
            WHEN LastPrice - PreviousLastPrice > 0
            THEN LastPrice - PreviousLastPrice
            ELSE 0
        END AS Gain,

        CASE
            WHEN PreviousLastPrice - LastPrice > 0
            THEN PreviousLastPrice - LastPrice
            ELSE 0
        END AS Loss
    FROM price_data
),

final_calc AS (
    SELECT
        *,
        AVG(Gain) OVER (
            PARTITION BY SecurityKey
            ORDER BY FullDate
            ROWS BETWEEN 13 PRECEDING AND CURRENT ROW
        ) AS AvgGain14,

        AVG(Loss) OVER (
            PARTITION BY SecurityKey
            ORDER BY FullDate
            ROWS BETWEEN 13 PRECEDING AND CURRENT ROW
        ) AS AvgLoss14
    FROM rsi_data
)

SELECT
    FactID,
    DateKey,
    SecurityKey,
    VenueKey,
    TierKey,
    StatusKey,

    OpenPrice,
    HighPrice,
    LowPrice,
    LastPrice,
    PreviousClosePrice,
    ShareVolume,
    DollarVol,
    TradeCount,
    OTCLinkDolVol,
    OTCLinkShareVol,
    OTCLinkExecCount,
    ClosingBestBid,
    ClosingBestAsk,
    InsideBid_AskMidPrice,
    SharesOutstanding,
    ShortIntVol,
    MMIDCount,
    BFCMmid,

    MA12 - MA26 AS MACD,

    CASE
        WHEN AvgLoss14 = 0 THEN 100
        ELSE 100 - (100 / (1 + (AvgGain14 / AvgLoss14)))
    END AS RSI,

    MovingAverage50,
    MovingAverage100,

    CASE
        WHEN FirstPriceOfYear = 0 OR FirstPriceOfYear IS NULL THEN NULL
        ELSE ((LastPrice - FirstPriceOfYear) / FirstPriceOfYear) * 100
    END AS YearlyReturn

FROM final_calc;

SELECT COUNT(*) AS final_fact_rows
FROM fact_otc_market_final;
