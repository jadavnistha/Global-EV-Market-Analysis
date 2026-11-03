CREATE TABLE global_ev_sales (
    region_country VARCHAR(100),
    `2010` DOUBLE,
    `2011` DOUBLE,
    `2012` DOUBLE,
    `2013` DOUBLE,
    `2014` DOUBLE,
    `2015` DOUBLE,
    `2016` DOUBLE,
    `2017` DOUBLE,
    `2018` DOUBLE,
    `2019` DOUBLE,
    `2020` DOUBLE,
    `2021` DOUBLE,
    `2022` DOUBLE,
    `2023` DOUBLE,
    `2024` DOUBLE
);
SELECT COUNT(*) FROM global_ev_sales;
SELECT * FROM global_ev_sales LIMIT 5;

CREATE TABLE makers_sales (
    Cat VARCHAR(20),
    Maker VARCHAR(150),
    `2015` INT,
    `2016` INT,
    `2017` INT,
    `2018` INT,
    `2019` INT,
    `2020` INT,
    `2021` INT,
    `2022` INT,
    `2023` INT,
    `2024` INT
);

SELECT COUNT(*) FROM makers_sales;

CREATE TABLE vehicle_category (
    Date DATE,
    `FOUR WHEELER (INVALID CARRIAGE)` INT,
    `HEAVY GOODS VEHICLE` INT,
    `HEAVY MOTOR VEHICLE` INT,
    `HEAVY PASSENGER VEHICLE` INT,
    `LIGHT GOODS VEHICLE` INT,
    `LIGHT MOTOR VEHICLE` INT,
    `LIGHT PASSENGER VEHICLE` INT,
    `MEDIUM GOODS VEHICLE` INT,
    `MEDIUM PASSENGER VEHICLE` INT,
    `MEDIUM MOTOR VEHICLE` INT,
    `OTHER THAN MENTIONED ABOVE` INT,
    `THREE WHEELER(NT)` INT,
    `TWO WHEELER (INVALID CARRIAGE)` INT,
    `THREE WHEELER(T)` INT,
    `TWO WHEELER(NT)` INT,
    `TWO WHEELER(T)` INT
);
SELECT COUNT(*) FROM vehicle_category;
CREATE TABLE charging_stations (
    State VARCHAR(100),
    `No. of Operational PCS` INT
);

SELECT COUNT(*) FROM charging_stations;
CREATE TABLE vehicle_class (
    `Vehicle Class` VARCHAR(100),
    `Total Registration` BIGINT
);
SELECT COUNT(*) FROM vehicle_class;

CREATE TABLE maker_place (
    `EV Maker` VARCHAR(150),
    Place VARCHAR(100),
    State VARCHAR(100)
);

SELECT COUNT(*) FROM maker_place;

SHOW TABLES;
SELECT COUNT(*) AS total_ev_makers
FROM maker_place;
SELECT SUM(`No. of Operational PCS`) AS total_charging_stations
FROM charging_stations;
SELECT
    State,
    `No. of Operational PCS` AS charging_stations
FROM charging_stations
ORDER BY `No. of Operational PCS` DESC
LIMIT 10;

SELECT
    Maker,
    (`2015` + `2016` + `2017` + `2018` + `2019` +
     `2020` + `2021` + `2022` + `2023` + `2024`) AS total_sales
FROM makers_sales
ORDER BY total_sales DESC
LIMIT 10;
SELECT
    `Vehicle Class`,
    `Total Registration`
FROM vehicle_class
ORDER BY `Total Registration` DESC
LIMIT 5;
SELECT
    region_country,
    `2024` AS ev_sales_2024
FROM global_ev_sales
ORDER BY `2024` DESC
LIMIT 10;

SELECT
    State,
    COUNT(`EV Maker`) AS total_makers
FROM maker_place
GROUP BY State
ORDER BY total_makers DESC
LIMIT 5;
SELECT
    ROUND(AVG(`No. of Operational PCS`), 2) AS avg_charging_stations
FROM charging_stations;
SELECT
    State,
    SUM(`No. of Operational PCS`) AS charging_stations
FROM charging_stations
GROUP BY State
HAVING charging_stations > 500
ORDER BY charging_stations DESC;

SELECT
    SUM(`2015`) AS Sales_2015,
    SUM(`2016`) AS Sales_2016,
    SUM(`2017`) AS Sales_2017,
    SUM(`2018`) AS Sales_2018,
    SUM(`2019`) AS Sales_2019,
    SUM(`2020`) AS Sales_2020,
    SUM(`2021`) AS Sales_2021,
    SUM(`2022`) AS Sales_2022,
    SUM(`2023`) AS Sales_2023,
    SUM(`2024`) AS Sales_2024
FROM global_ev_sales;
SELECT
    mp.`EV Maker`,
    mp.State
FROM maker_place mp
ORDER BY mp.State, mp.`EV Maker`;
SELECT
    mp.`EV Maker`,
    mp.State,
    cs.`No. of Operational PCS`
FROM maker_place mp
JOIN charging_stations cs
ON mp.State = cs.State
WHERE cs.`No. of Operational PCS` > 500
ORDER BY cs.`No. of Operational PCS` DESC;
SELECT `EV Maker`, State
FROM maker_place
WHERE State = (
    SELECT State
    FROM charging_stations
    ORDER BY `No. of Operational PCS` DESC
    LIMIT 1
);
CREATE VIEW top_charging_states AS
SELECT
    State,
    `No. of Operational PCS`
FROM charging_stations
ORDER BY `No. of Operational PCS` DESC;
SELECT * FROM top_charging_states;



