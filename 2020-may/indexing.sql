-- (a)  Calls(callID)
-- (b)  Calls(callerID)
-- (c)  Calls(receiverID)
-- (d)  Calls(date)
-- (e)  Calls(date, duration)
-- (f)  No index

-- Query 1 = d
-- select *
-- from Calls
-- where date = ’12-12-2010’;

-- Query 2 = e
-- select avg(duration)
-- from Calls
-- group by date;

-- Query 3 = No index
-- select callID, date
-- from Calls;

-- Query 4 = b/c
-- select avg(callID)
-- from Calls
-- where callerID = 453543 and receiverID = 1654332;