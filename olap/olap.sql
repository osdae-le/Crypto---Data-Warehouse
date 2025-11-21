#1----------------
SELECT
    d.year,
    d.month,
    SUM(f.market_cap) AS total_market_cap
FROM fact_market f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.year, d.month
ORDER BY d.year, d.month;

#2----------------
SELECT
    a.symbol,
    a.name,
    SUM(f.vol_24h) AS total_volume
FROM fact_market f
JOIN dim_asset a ON f.asset_id = a.asset_id
GROUP BY a.symbol, a.name
ORDER BY total_volume DESC
LIMIT 10;

#3----------------
SELECT
    a.symbol,
    a.name,
    AVG(f.chg_7d) AS avg_change_7d
FROM fact_market f
JOIN dim_asset a ON f.asset_id = a.asset_id
GROUP BY a.symbol, a.name
ORDER BY avg_change_7d DESC
LIMIT 10;

#4----------------
SELECT
    d.day_of_week,
    d.hour,
    SUM(f.vol_24h) AS total_vol
FROM fact_market f
JOIN dim_date d ON f.date_id = d.date_id
GROUP BY d.day_of_week, d.hour
ORDER BY d.day_of_week, d.hour;

#5----------------
SELECT
    a.symbol,
    a.name,
    AVG(ABS(f.chg_24h)) AS avg_volatility_24h,
    AVG(ABS(f.chg_7d))  AS avg_volatility_7d
FROM fact_market f
JOIN dim_asset a ON f.asset_id = a.asset_id
GROUP BY a.symbol, a.name
ORDER BY avg_volatility_24h DESC;




