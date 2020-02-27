--
-- List all students, who gets score > 70 and 
-- enrolled to at least two subject.
--

CREATE VIEW Multiple_Subject_score_over_70 AS
SELECT student_id
FROM exam_results
WHERE score >= 70
GROUP BY student_id
HAVING COUNT(student_id) > 1;

--
-- -----------------------------------------------
--

-- 
-- This view shows the details of students in arrears in Limerick
--

CREATE VIEW limerick_students_in_arrears AS
SELECT  first_name, last_name, eircode, city, county
FROM student NATURAL JOIN address
WHERE fees_paid < 1000
GROUP BY city
HAVING city ='Limerick';

--
-- -----------------------------------------------
--

--
-- This view will show the subject ID's and number of students 
-- where more than 5 students scored less than 40 in their exams results.
--

CREATE VIEW min5_student_failed_per_subject AS
SELECT DISTINCT subject_id, COUNT(*)
FROM Exam_Results
where score < 40
GROUP BY subject_id
HAVING COUNT(*) > 5;

--
-- -----------------------------------------------
--

--
-- Indexes necessary for the optimal performance of the queries in the views
--

CREATE INDEX scores ON exam_results(score);
CREATE INDEX fees_paid ON Student(fees_paid);

-- also all PK's are automatically indexed



