-- schema world
-- create table world.warehouse
DROP TABLE world.warehouse;
CREATE TABLE world.warehouse (
    S integer NOT NULL,
    M integer NOT NULL,
    L integer NOT NULL
);
INSERT INTO world.warehouse (S, M, L) VALUES(10, 15, 12);
SELECT * from world.warehouse;

-- create table world.orders
DROP TABLE world.orders;
CREATE TABLE world.orders (
	  order_time timestamp NOT NULL,
    S integer NOT NULL,
    M INTEGER not null,
    L integer not null
);
insert into world.orders (order_time, S, M, L) values ("2023-05-10 10:00:00", 1, 1, 1),("2023-05-10 11:00:00", 2, 3, 4),("2023-05-10 12:00:00", 5, 2, 1),("2023-05-12 10:00:00", 1, 1, 4),("2023-05-13 10:00:00", 1, 2, 3),("2023-05-14 10:00:00", 1, 1, 1),("2023-05-14 11:00:00", 1, 1, 1);
select * from world.orders;

-- query first order that could not be completed
WITH temp AS (
    SELECT 
        order_time, 
        S, 
        M, 
        L,
        SUM(S) OVER (ORDER BY order_time) AS cum_s,
        SUM(M) OVER (ORDER BY order_time) AS cum_m,
        SUM(L) OVER (ORDER BY order_time) AS cum_l
    FROM world.orders
)
SELECT 
    order_time, warehouse.S, warehouse.M, warehouse.L
FROM temp, world.warehouse
WHERE
    cum_s > warehouse.S OR 
    cum_m > warehouse.M OR 
    cum_l > warehouse.L
ORDER BY order_time
LIMIT 1;

-- update table world.warehouse
update world.warehouse set S=2, M=3, L=4 where S=10;
select * from world.warehouse;
-- delete all rows from table world.orders
delete from world.orders;
insert into world.orders (order_time, S, M, L) values ("2023-04-10 12:50:00", 2, 1, 4), ("2023-04-10 11:10:00", 1, 3, 1);
select * from world.orders;

WITH temp AS (
    SELECT 
        order_time, 
        S, 
        M, 
        L,
        SUM(S) OVER (ORDER BY order_time) AS cum_s,
        SUM(M) OVER (ORDER BY order_time) AS cum_m,
        SUM(L) OVER (ORDER BY order_time) AS cum_l
    FROM world.orders
)
SELECT 
    order_time, warehouse.S, warehouse.M, warehouse.L
FROM temp, world.warehouse
WHERE
    cum_s > warehouse.S OR 
    cum_m > warehouse.M OR 
    cum_l > warehouse.L
ORDER BY order_time
LIMIT 1;
