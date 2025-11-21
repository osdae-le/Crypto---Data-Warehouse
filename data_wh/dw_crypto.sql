CREATE DATABASE dw_crypto;
USE dw_crypto;

CREATE TABLE dim_date (
    date_id INT PRIMARY KEY AUTO_INCREMENT,
    full_timestamp DATETIME,
    date INT,
    day INT,
    month INT,
    quarter INT,
    year INT,
    hour INT,
    day_of_week VARCHAR(20)
);

CREATE TABLE dim_asset (
    asset_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    symbol VARCHAR(50),
    asset_type VARCHAR(50),
    label_code INT,
    launch_year INT,
    category VARCHAR(255)
);

CREATE TABLE dim_marketsegment (
    segment_id INT PRIMARY KEY AUTO_INCREMENT,
    segment_name VARCHAR(100),
    description VARCHAR(255)
);

CREATE TABLE fact_market (
    fact_id INT PRIMARY KEY AUTO_INCREMENT,
    date_id INT,
    asset_id INT,
    segment_id INT,
    price_usd FLOAT,
    vol_24h FLOAT,
    total_vol FLOAT,
    chg_24h DOUBLE,
    chg_7d DOUBLE,
    market_cap FLOAT,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (asset_id) REFERENCES dim_asset(asset_id),
    FOREIGN KEY (segment_id) REFERENCES dim_marketsegment(segment_id)
);

#DROP DATABASE dw_crypto;





