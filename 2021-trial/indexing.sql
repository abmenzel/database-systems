-- Consider the following relation with information on passenger airplanes:
-- Airplanes(id, name, year, passengers, <many long attributes>)


-- Query 1
-- select id, name
-- from Airplanes
-- where name like ’%737%’;

-- Query 2
-- select *
-- from Airplanes
-- where passengers > 0
-- order by passengers;

-- Query 3
-- select id
-- from Airplanes
-- where year = 1992;


-- a
-- Query 1: A clustered index should be used, and is preferable to a non-clustered index. (As we are looking for 737 in the middle of a string, there is not benefit on sorting on name)
-- Query 2: A clustered index may be used sorted on passengers. No need for a non-clustered index as we need the entire record.
-- Query 3: A clustered index is better than non-clustered due to sequential reads. Each query would on average return 1% of the relation, an index on (year) is better than no index.

-- b
-- Query 1: Covering index is possible on Airplanes(id, name)
-- Query 2: We need the entire record (*), so a covering non-clusterd index is not preferable.
-- Query 3: Covering index is possible on Airplanes(year, id)

-- c
-- A clustered index on Airplanes(passengers) would be preferable, as we assume passengers are always > 0, this index would improve performance on Q2.