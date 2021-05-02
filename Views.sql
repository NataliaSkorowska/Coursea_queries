go
create view ViewAllCourses_Coursea as
select course_id as 'ID', course_title as 'Title',
course_organization as 'Organization', course_Certificate_type as 'Certificate type',
course_rating as 'Rating', course_difficulty as 'Difficulty',  
course_students_enrolled as 'Number of students enrolled'
from coursea
go

select * from ViewAllCourses_Coursea

----------------------------------------------

go
create view CountAllCourses_Coursea as
select count(*) as 'Number of all courses' from coursea
go

select * from  CountAllCourses_Coursea

----------------------------------------------

go
create view Top10MostPopular_Coursea as
select top 10 course_id as 'ID', course_title as 'Title', course_organization as 'Organization',
course_students_enrolled as 'Enrolled students'
from dbo.coursea order by course_students_enrolled desc
go

select * from Top10MostPopular_Coursea

----------------------------------------------

create view Top10Unpopular_Coursea as
select top 10 course_id as 'ID', course_title as 'Title', course_organization as 'Organization',
course_students_enrolled as 'Enrolled students'
from dbo.coursea order by course_students_enrolled asc
go

select * from Top10Unpopular_Coursea
 
 ----------------------------------------------

go
create view Top10BestRated_Coursea as
select top 10 course_id as 'ID', course_title as 'Title', course_organization as 'Organization',
course_rating as 'Rating'
from dbo.coursea order by course_rating desc
go

select * from Top10BestRated_Coursea

----------------------------------------------

go
create view Top10WorstRated_Coursea as
select top 10 course_id as 'ID', course_title as 'Title', course_organization as 'Organization',
course_rating as 'Rating'
from dbo.coursea order by course_rating asc
go

select * from Top10WorstRated_Coursea

----------------------------------------------

go
create view AvarageRating_Coursea as
SELECT ROUND(CAST (AVG (course_rating) AS decimal (3,2)),2) 
as 'Avarage rating' from coursea
go

select * from AvarageRating_Coursea

----------------------------------------------

go
create view AvarageRatingByOrganization_Coursea as
SELECT course_organization as 'Organization', 
ROUND(CAST (AVG (course_rating) AS decimal (3,2)),2) 
as 'Avarage rating' from coursea group by course_organization
go

select * from  AvarageRatingByOrganization_Coursea

----------------------------------------------

go
create view NumberOfCoursesByOrganization_Coursea as
SELECT course_organization as 'Organization', count(*) as 'Number of courses'
from coursea  group by course_organization 
go

select * from  NumberOfCoursesByOrganization_Coursea order by 2 desc, 1 asc

----------------------------------------------

go
create view NumberOfCoursesForCertificateType_Coursea as
SELECT course_Certificate_type as 'Type of certificate', count(*) as 'Number of courses for certyficate type'
from coursea  group by course_Certificate_type
go

select * from  NumberOfCoursesForCertificateType_Coursea order by 2 desc

----------------------------------------------

go
create view NumberOfCoursesForDifficulty_Coursea as
SELECT course_difficulty as 'Difficulty', count(*) as 'Number of courses for difficulty'
from coursea  group by course_difficulty
go

select * from  NumberOfCoursesForDifficulty_Coursea order by 2 desc

----------------------------------------------

go
create view NumberOfStudentsInOrganization_Coursea as
SELECT course_organization as 'Organization', sum(course_students_enrolled) as 'Number of students'
from coursea group by course_organization
go

select * from  NumberOfStudentsInOrganization_Coursea order by 2 desc

----------------------------------------------

go
create view AvgStudentsNumberByOrganization_Coursea as
SELECT course_organization as 'Organization', cast(avg(course_students_enrolled) as decimal(10)) as 'Average number of students by organization'
from coursea group by course_organization
go

select * from  AvgStudentsNumberByOrganization_Coursea order by 2 desc, 1 asc

----------------------------------------------

go
create view AvarageRatingByDifficulty_Coursea as
SELECT  course_difficulty as 'Difficulty',
ROUND(CAST (AVG (course_rating) AS decimal (3,2)),2) 
as 'Avarage rating' from coursea group by course_difficulty
go

select * from AvarageRatingByDifficulty_Coursea order by 2 desc

----------------------------------------------

go
create view AvarageRatingByCertificate_Coursea as
SELECT  course_Certificate_type as 'Certificate type',
ROUND(CAST (AVG (course_rating) AS decimal (3,2)),2) 
as 'Avarage rating' from coursea group by course_Certificate_type
go

select * from AvarageRatingByCertificate_Coursea order by 2 desc

----------------------------------------------

go
create view NumberOfStudentsForCertificate_Coursea as
SELECT course_Certificate_type as 'Certificate type', 
sum(course_students_enrolled) as 'Number of students'
from coursea group by course_Certificate_type
go

select * from NumberOfStudentsForCertificate_Coursea order by 2 desc

----------------------------------------------

go
create view NumberOfStudentsForDifficulty_Coursea as
SELECT course_difficulty as 'Difficulty', 
sum(course_students_enrolled) as 'Number of students'
from coursea group by course_difficulty
go

select * from NumberOfStudentsForDifficulty_Coursea order by 2 desc

----------------------------------------------

go
create view AvgStudentsNumberByDifficulty_Coursea as
SELECT course_difficulty as 'Difficulty', 
cast(avg(course_students_enrolled) as decimal(10)) as 'Average number of students by difficulty'
from coursea group by course_difficulty
go

select * from AvgStudentsNumberByDifficulty_Coursea order by 2 desc 

----------------------------------------------

go
create view AvgStudentsNumberByCertificate_Coursea as
SELECT course_Certificate_type as 'Certificate type', 
cast(avg(course_students_enrolled) as decimal(10)) as 'Average number of students by certificate type'
from coursea group by course_Certificate_type
go

select * from AvgStudentsNumberByCertificate_Coursea order by 2 desc 

----------------------------------------------

go
create view StudentsForDifficultyAndCertificate_Coursea as
SELECT course_difficulty as 'Difficulty', course_Certificate_type as 'Certificate type',
sum(course_students_enrolled) as 'Number of students'
from coursea group by course_difficulty, course_Certificate_type
go

select * from StudentsForDifficultyAndCertificate_Coursea order by 1 asc, 2 asc

----------------------------------------------

go
create view CoursesForDifficultyAndCertificate_Coursea as
SELECT course_difficulty as 'Difficulty', course_Certificate_type as 'Certificate type',
count(*) as 'Number of courses'
from coursea group by course_difficulty, course_Certificate_type
go

select * from CoursesForDifficultyAndCertificate_Coursea order by 1 asc, 2 asc

----------------------------------------------

go
create view CoursesForOrgDifCer_Coursea as
SELECT course_organization as 'Organization', course_difficulty as 'Difficulty',
course_Certificate_type as 'Certificate type',
count(*) as 'Number of courses'
from coursea group by course_organization, course_difficulty, course_Certificate_type
go

select * from CoursesForOrgDifCer_Coursea order by 1 asc, 2 asc, 3 asc

----------------------------------------------

go
create view CoursesForBeginners_Coursea as
select course_id as 'ID', course_title as 'Title',
course_organization as 'Organization', course_Certificate_type as 'Certificate type',
course_rating as 'Course rating', course_difficulty as 'Difficulty', 
course_students_enrolled as 'Number of students'
from coursea where course_difficulty = 'Beginner'
go

select * from CoursesForBeginners_Coursea


----------------------------------------------


