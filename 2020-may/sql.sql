-- a
select count(*)
from places
where name like '%lev'

-- ans: 12

-- b
select id
from places
where population = (select MAX(population) from places)

-- ans: 34

-- c
select count(*)
from (
	select teamid
	from teamsindivisions
	group by teamid
	having count(teamid) > 1
) X

-- ans: 62

-- d
select count(distinct teamid)
from (
	select T.id as teamid, T.genderid as teamgender, TD.divisionid
	from teams T
	join teamsindivisions TD on T.id = TD.teamid
	join divisions D on TD.divisionid = D.id and T.genderid != D.genderid
)X

-- ans: 54

-- e
DROP VIEW IF EXISTS places_and_teams;
create view places_and_teams as
select P.id, count(P.id)
from places P
join clubs C on C.placeid = P.id
join teams T on T.clubid = C.id
join genders G on T.genderid = G.id
where G.gender = 'M'
group by P.id

select id from places_and_teams
where count = (select MAX(count) from places_and_teams)
-- ans: 34

-- f
drop view if exists extended_places;
create view extended_places as
select P.id as placeid, C.id as clubid, T.id as teamid, G.gender as gender
from places P
join clubs C on C.placeid = P.id
join teams T on T.clubid = C.id
join genders G on G.id = T.genderid;

select count(*)
from (
	select placeid, count(distinct gender)
	from extended_places
	group by placeid
	having count(distinct gender) = (select count(id) from genders)
)X

-- ans: 30

-- g
select *
from (
	select C.id as club, count(C.id) as count
	from clubs C
	join teams T on T.clubid = C.id
	join teamsindivisions TD on TD.teamid = T.id
	join divisions D on D.id = TD.divisionid
	join genders G on G.id = D.genderid
	where G.gender = 'M'
	group by C.id
)X
where count >= (select count(D.id)
from divisions D
join genders G on G.id = D.genderid
where G.gender = 'M')

-- ans: 1

-- h

drop view if exists team_points;
create view team_points as
select teamid, SUM(points)
from (
	select T.id as teamid, SUM(S.homepoints) as points
	from teams T
		join matches M on T.id = M.hometeamid
		join sets S on S.matchid = M.id
	group by T.id
	union
	select T.id as teamid, SUM(S.awaypoints) as points
	from teams T
		join matches M on T.id = M.awayteamid
		join sets S on S.matchid = M.id
	group by T.id
) X
group by teamid;

select MAX(sum) from team_points

-- ans: 1637


