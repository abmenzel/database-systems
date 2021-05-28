-- (a)  No index
-- (b)  Likes(userID)
-- (c)  Likes(postID)
-- (d)  Likes(userID, postID)

-- Query 1 = b
-- select count(*)
-- from Likes
-- where userID = 25;

-- Query 2 = d
-- select max(postID)
-- from Likes
-- where userID = 25;

-- Query 3 = b
-- select distinct userID
-- from Likes
-- order by userID;

-- Query 4 = c
-- select count(distinct userID)
-- from Likes
-- where postID = (select max(postID) from Likes);