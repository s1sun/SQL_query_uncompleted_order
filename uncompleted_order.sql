CREATE TABLE world.warehouse (
    S integer NOT NULL,
    M integer NOT NULL,
    L integer NOT NULL
);
INSERT INTO world.warehouse (S, M, L) VALUES(10, 15, 12);
SELECT * from world.warehouse;
DROP TABLE world.orders;
CREATE TABLE world.orders (
	  order_time timestamp NOT NULL,
    S integer NOT NULL,
    M INTEGER not null,
    L integer not null
);
insert into world.orders (order_time, S, M, L) values ("2023-05-10 10:00:00", 1, 1, 1),("2023-05-10 11:00:00", 2, 3, 4),("2023-05-10 12:00:00", 5, 2, 1),("2023-05-12 10:00:00", 1, 1, 4),("2023-05-13 10:00:00", 1, 2, 3),("2023-05-14 10:00:00", 1, 1, 1),("2023-05-14 11:00:00", 1, 1, 1);
select * from world.orders;

