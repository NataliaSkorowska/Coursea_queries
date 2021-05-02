select * from dbo.coursea

select count(*) from dbo.coursea

select * from dbo.coursea where course_students_enrolled like '%m'

select * from dbo.coursea where course_students_enrolled like '%k'

select * from dbo.coursea_data where course_students_enrolled like '%k' and 
course_students_enrolled like '%.%'

update dbo.coursea SET course_students_enrolled = 
REPLACE(course_students_enrolled, 'm','00000');

update dbo.coursea SET course_students_enrolled =
REPLACE(course_students_enrolled, 'k','00') where course_students_enrolled like '%k' and course_students_enrolled like '%.%'

update dbo.coursea SET course_students_enrolled =
REPLACE(course_students_enrolled, 'k','000') where course_students_enrolled like '%k'

update dbo.coursea SET course_students_enrolled =
REPLACE(course_students_enrolled, '.','') where course_students_enrolled like '%.%'

sp_rename 'dbo.coursea.column1', 'course_id'

alter table coursea alter column course_students_enrolled numeric (10)
alter table coursea alter column course_rating numeric (3,2)


