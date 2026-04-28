.print "-------------------------create_grades-------------------------"

CREATE TABLE grades(
    grade_id INTEGER PRIMARY KEY NOT NULL,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    grade DECIMAL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)

);
