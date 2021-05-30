-- a
select count (*)
from (
	select id
	from users
	intersect
	select toid
	from relationships
)X
-- ans: 287

-- b
select count (*)
from (
	select *
	from relationships R
	join relationships R2 on R.fromid = R2.toid and R.toid = R2.fromid
	where R.fromid > R2.fromid
)X

-- ans: 46

-- c
select count (*)
from (
	select RS.fromid, RS.toid
	from relationships RS
	EXCEPT
	select R.fromid, R.toid
	from roles R
)X
-- ans: 10

-- d
DROP VIEW IF EXISTS post_comments;
CREATE VIEW post_comments as
	select P.id as post, count(C.postid) as comment_count
	from posts P
	join comments C on P.id = C.postid
	group by P.id

select post
from post_comments PC
where PC.comment_count = (select MAX(comment_count)
					   from post_comments)

-- ans: 1223

-- e
select count (*)
from (
	select *
	from post_comments
	where comment_count <= 2
	union
	select id as post, 0
	from posts P
	left join post_comments PC on P.id = PC.post
	where PC.comment_count is null
)X
-- ans: 1674

-- f

DROP VIEW IF EXISTS lovely_comments;
CREATE VIEW lovely_comments as
select distinct userid as cid
from comments C
join roles R on
	(R.fromid = C.posterid and R.toid = C.userid)
	or (R.fromid = C.userid and R.toid = C.posterid)
where R.role = 'Spouse'

select count(distinct municipalityid)
from users U
join zips Z on U.zip = Z.zip
join lovely_comments LC on U.id = LC.cid

-- ans: 33

-- g

select count(distinct toid)
from (
	select R.fromID, R.toid
	from Roles R
	group by R.fromid, R.toid
	having count(role) = (select count(distinct role) from Roles)
)X;

-- ans: 86


-- h
drop view if exists posts_with_no_comments;
create view posts_with_no_comments as
select P.id, P.posterid
from posts P
left join comments C on C.postid = P.id
where C.id is null

select count (distinct U.id)
from users U
join posts_with_no_comments PC on PC.posterid = U.id
join likes L on L.postid = PC.id

-- ans: 206