-- ==========================================
-- Project 6 - Create Fact Table
-- ==========================================

DROP TABLE IF EXISTS fact_otc_market;

CREATE TABLE fact_otc_market AS
SELECT

    ROW_NUMBER() OVER () AS FactID,

    d.DateKey,
    s.SecurityKey,
    v.VenueKey,
    t.TierKey,
    ss.StatusKey,

    r.OpenPrice,
    r.HighPrice,
    r.LowPrice,
    r.LastPrice,
    r.PreviousClosePrice,

    r.ShareVolume,
    r.DollarVol,
    r.TradeCount,

    r.OTCLinkDolVol,
    r.OTCLinkShareVol,
    r.OTCLinkExecCount,

    r.ClosingBestBid,
    r.ClosingBestAsk,
    r.InsideBid_AskMidPrice,

    r.SharesOutstanding,
    r.ShortIntVol,
    r.MMIDCount,
    r.BFCMmid,

    NULL AS MACD,
    NULL AS RSI,
    NULL AS MovingAverage50,
    NULL AS MovingAverage100,
    NULL AS YearlyReturn

FROM raw_otc r

LEFT JOIN dim_date d
    ON r.ClosingBestBidDate = d.FullDate

LEFT JOIN dim_security s
    ON r.SECID = s.SECID
   

LEFT JOIN dim_venue v
    ON r.Venue = v.Venue

LEFT JOIN dim_tier t
    ON r.TierID = t.TierID

LEFT JOIN dim_security_status ss
    ON r.SecurityStatus = ss.SecurityStatus;
