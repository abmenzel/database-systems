-- (a)  Sales(saleID)
-- (b)  Sales(prodID)
-- (c)  Sales(repID)
-- (d)  Sales(repID, price)
-- (e)  Sales(date)
-- (f)  No index

-- Query 1 = e
-- select *
-- from Sales
-- where date = ’12-12-2010’;

-- Query 2 = d
-- select sum(price)
-- from Sales
-- where repID = 100;

-- Query 3 = e
-- select avg(date)
-- from Sales;

-- Query 4 = No index
-- select avg(date)
-- from Sales
-- where quantity > 100;