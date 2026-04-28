.print "-------------------------report-----------------"

.mode box

.print "1. Select all from tables students"
SELECT * FROM students;

.print "2. Show all grades for all courses for Student 7"

SELECT students.name, courses.course_name, grades.grade
FROM students
JOIN grades ON grades.student_id = students.student_id
JOIN courses ON courses.course_id = grades.course_id
WHERE students.name = 'Student 10';

.print "3. Show all grades for the course Computer Science with students name"

SELECT courses.course_name,students.name,  grades.grade 
FROM courses
JOIN grades ON grades.course_id = courses.course_id
JOIN students ON students.student_id = grades.student_id
WHERE courses.course_name = 'Computer Science';

.print "4. Find average grade among all grades"
SELECT ROUND(AVG(grade), 2) AS avg_grade
FROM grades;
