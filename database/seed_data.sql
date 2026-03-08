INSERT INTO Admins (username, password)
VALUES ('admin', 'admin123');

INSERT INTO Teachers (username, password)
VALUES ('teacher1', 'teacher123');

INSERT INTO Students (username, password)
VALUES ('student1', 'student123');

INSERT INTO Tests (test_name, teacher_id)
VALUES ('Python Basics Test', 1);

INSERT INTO Questions (question_text, test_id)
VALUES 
('What is Python?', 1),
('Explain OOP.', 1);

INSERT INTO ExpectedAnswers (answer_text, question_id)
VALUES
('Python is a programming language.', 1),
('OOP stands for Object Oriented Programming.', 2);

INSERT INTO StudentAnswers (student_id, test_id, question_id, answer_text)
VALUES
(1, 1, 1, 'Python is a high level programming language.');