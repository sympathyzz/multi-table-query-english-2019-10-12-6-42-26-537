# 1.Query the existence of 1 course
select id from course where locate(1,id);
# 2.Query the presence of both 1 and 2 courses
select id from course where locate(1,id) or locate(2,id);
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select studentId,s.`name`,avg(score) from student_course sc left join student s on sc.studentId=s.id group by studentId having avg(score)>=60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in(select studentId from student_course GROUP BY studentId);
# 5.Query all SQL with grades
select * from student where id in(select studentId from student_course GROUP BY studentId);
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select * from student where id in (select studentId from student_course where courseId in (1,2) group by studentId having count(studentId)>1);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select s.*,a.score from student s right join (select studentId,score from student_course where courseId=1 and score<60 order by score desc) a on s.id=a.studentId;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select avg(score) avg_score from student_course group by courseId order by avg_score desc,courseId asc;
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select `name`,score from student a right join (select studentId,score from student_course where courseId in (select id from course where name='Math') and score<60) b on a.id=b.studentId;
