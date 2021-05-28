
-- (a) Calls(fromnum, tonum, timestamp)
-- (b) Calls(duration)
-- (c) Calls(fromnum, duration)
-- (d) Calls(duration, fromnum)
-- (e) Calls(timestamp)
-- (f) No index

-- Query 1 = b
-- select fromnum
-- from Calls
-- where duration = (select max(duration) from Calls);

-- Query 2 = c
-- select sum(duration)
-- from Calls
-- where fromnum = 12345678;

-- Query 3 = No index
-- select max(timestamp)
-- from Calls
-- where tonum = 87654321;

-- Query 4 = a
-- select *
-- from Calls
-- where tonum = 87654321 and fromnum = 12345678;