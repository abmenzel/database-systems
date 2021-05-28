-- (a)  Requests(ID)
-- (b)  Requests(userID)
-- (c)  Requests(baseURL)
-- (d)  Requests(timestamp)
-- (e)  Requests(userID, timestamp, ID)
-- (f)  No index

-- Query 1 = f (because random IO's are slow)
-- select *
-- from Requests
-- where baseURL = ’http://www.ThisURLisOneOfTheTen.com’;

-- Query 2 = a
-- select max(ID)
-- from Requests;

-- Query 3 = e
-- select max(timestamp)
-- from Requests
-- where userID = 543423;

-- Query 4 = No index (because we have to check all options)
-- select count(distinct userID)
-- from Requests
-- where options like ’%include%’;