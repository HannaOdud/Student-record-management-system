.print "-------------------------report-----------------------------"

.mode box

.print "1. Select all from tables students"
SELECT * FROM students;

.print "2. Show all grades for all courses for Student 7"

SELECT students.name, courses.course_name, grades.grade
FROM students
JOIN grades ON grades.student_id = students.student_id
JOIN courses ON courses.course_id = grades.course_id
WHERE students.name = 'Student 7';

.print "3. Show all grades for the course Computer Science with students name"

SELECT courses.course_name,students.name,  grades.grade 
FROM courses
JOIN grades ON grades.course_id = courses.course_id
JOIN students ON students.student_id = grades.student_id
WHERE courses.course_name = 'Computer Science';

.print "4. Find average grade among all grades"
SELECT ROUND(AVG(grade), 2) AS avg_grade
FROM grades;

.print "5. Find average grade for each course"
SELECT  courses.course_name, ROUND(AVG(grades.grade),2) AS avg_grade_course
FROM grades
JOIN courses ON courses.course_id = grades.course_id
GROUP BY courses.course_id;

.print "6. Find average grade for each student"
SELECT students.name, ROUND(AVG(grades.grade),2) AS avg_grade_name
FROM grades
JOIN students ON students.student_id = grades.student_id 
GROUP BY students.student_id;

.print "7. Find top 5 students by the number of attended courses"
SELECT students.name, COUNT(courses.course_id)AS num_courses
FROM students
JOIN grades ON students.student_id = grades.student_id
JOIN courses ON courses.course_id = grades.course_id
GROUP BY students.student_id
ORDER BY num_courses DESC
LIMIT 5;

.print "8. Display top 3 courses by number of students"
SELECT courses.course_name, COUNT(grades.student_id)AS course_students
FROM grades
JOIN courses ON courses.course_id = grades.course_id
GROUP BY courses.course_id
ORDER BY course_students DESC
LIMIT 3;

.print "9.List all students with their names and emails. LIMIT 5 "
SELECT name, email
FROM students
LIMIT 5 ;

.print "10.Show each student’s name, course name, and their grade. "
SELECT students.name, grades.grade, courses.course_name
FROM grades 
JOIN courses ON courses.course_id = grades.course_id 
JOIN students ON students.student_id = grades.student_id;


.print "11. Find all students who scored above 90 in any course. "
SELECT students.name, grades.grade, courses.course_name
FROM grades 
JOIN courses ON courses.course_id = grades.course_id 
JOIN students ON students.student_id = grades.student_id
WHERE grades.grade > 90;

.print "12. Calculate the average grade for each student.  "
SELECT students.name, ROUND(AVG(grades.grade),2)AS avg_grade
FROM students
JOIN grades ON grades.student_id = students.student_id
GROUP BY students.student_id;

.print "13. How many students are enrolled in each course?"
SELECT COUNT(grades.student_id)AS stud_num, courses.course_name 
FROM grades
JOIN courses ON courses.course_id = grades.course_id
GROUP BY courses.course_id;

.print "14. Find the student(s) who got the highest grade in each course."
SELECT students.name, MAX(grades.grade)AS max_grade_of_course, courses.course_name
FROM grades
JOIN students ON students.student_id = grades.student_id
JOIN courses ON courses.course_id = grades.course_id
GROUP BY courses.course_name;

.print "15. List students who are enrolled in more than 4 courses."
SELECT students.name, COUNT(grades.course_id)AS num_courses
FROM students
JOIN grades ON grades.student_id = students.student_id
GROUP BY students.student_id
HAVING num_courses > 4;

.print "16. Find students whose average grade is above the overall average grade of all students."


.print "17. Show the teacher name and the average grade of their course(s)."