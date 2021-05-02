
go
create procedure FindCourseByKeyword
@keyword varchar (50)
as
begin
   select course_id as 'ID', course_title as 'Title',
   course_organization as 'Organization', course_Certificate_type as 'Certificate type',
   course_rating as 'Course rating', course_difficulty as 'Difficulty', 
   course_students_enrolled as 'Number of students'
   from coursea
   where course_title like '%' + @keyword + '%'
end
go

exec FindCourseByKeyword @keyword = 'SQL'

----------------------------------------------

go
create procedure FindOrganizationByKeyword
@keyword varchar (50)
as
begin
   select course_id as 'ID', course_title as 'Title',
   course_organization as 'Organization', course_Certificate_type as 'Certificate type',
   course_rating as 'Course rating', course_difficulty as 'Difficulty', 
   course_students_enrolled as 'Number of students'
   from coursea
   where course_organization like '%' + @keyword + '%'
end
go

exec FindOrganizationByKeyword @keyword = 'IBM'

----------------------------------------------
 
go
create procedure FindNumberOfCoursesByOrgKeyword
@keyword varchar (50)
as
begin
   select course_organization as 'Organization', course_difficulty as 'Difficulty',
   course_Certificate_type as 'Certificate type',
   count(*) as 'Number of courses' 
   from coursea where course_organization like '%' + @keyword + '%'
   group by course_organization, course_difficulty, course_Certificate_type
   order by  2 asc, 3 asc
end
go

exec FindNumberOfCoursesByOrgKeyword @keyword = 'IBM'

----------------------------------------------

go
create procedure FindCoursesRatedHigherThan
@ratingNumber numeric (3,2)
as
begin
      select course_id as 'ID', course_title as 'Title',
   course_organization as 'Organization', course_Certificate_type as 'Certificate type',
   course_rating as 'Course rating', course_difficulty as 'Difficulty', 
   course_students_enrolled as 'Number of students'
   from coursea where course_rating >= @ratingNumber
end
go

exec FindCoursesRatedHigherThan @ratingNumber = 5

----------------------------------------------


