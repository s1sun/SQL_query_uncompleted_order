# SQL_query_uncompleted_order
You are given two tables, warehouses and orders, with the following structures:

    Warehouse
|    |                 |
| ---| ----------------|
| S  | integer Not NULL|
| M  | integer Not NULL|
| L  | integer Not NULL|

   and  orders
|    |                 |
| ---| ----------------|
|order_time|timestamp Not NULL UNIQUE|
| S| integer Not NULL|
| M| integer Not NULL|
| L| integer Not NULL|

Table warehouse contains exactly one row describing the number of available shorts in the corresponding size: small(S), medium(M) and large(L).

Each row of the table orders contains information about individual orders: the unique time the order was created (order_time) and the number of ordered shirts in the corresponding sizes: small(S), medium(M) and large(L). No two rows have the same order_time.

Orders will be completed in chronological order of their appearance as long as there are enough products of each size in the warehouse.

Write an PostgreSQL query that finds the time of the first order that cannot be completed. Of all order can be completed, return NULL.

Example:
1. For the given tables warehouses:
   
|  |  |  |    
|--|--|--|
| S| M| L|
|10|15|12|

and orders:

|  |  |  |  | 
|--|--|--|--|
|order_time|  S  | M | L |
|2023-05-10 10:00:00| 1 | 1 | 1 |
|2023-05-10 11:00:00| 2 | 3 | 4 |
|2023-05-10 12:00:00| 5 | 2 | 1 |
|2023-05-12 10:00:00| 1 | 1 | 4 |
|2023-05-13 10:00:00| 1 | 2 | 3 |
|2023-05-14 10:00:00| 1 | 1 | 1 |
|2023-05-14 11:00:00| 1 | 1 | 1 |

the query should return the following table:

2023-05-13 10:00:00

After the first four orders there is one small shirt, eight medium shirts and two large shirts left in the warehouse. In the fifth order, there large shirts are required. As there are only two remaining., this order cannot be completed.
2. For the given tables warehouse:

|  |  |  |    
|--|--|--|
| S| M| L|
| 3| 4| 5|

and orders:

|  |  |  |  | 
|--|--|--|--|
|order_time|  S  | M | L |
|2023-04-10 12:50:00| 2 | 1 | 4 |
|2023-04-10 11:00:00| 1 | 3 | 1 |

the query should return the following table
NULL

There are enough shirts of each size to complete all orders.      

-- Implement your solution here:

SELECT
