CREATE DATABASE IF NOT EXISTS teacher_part;
USE teacher_part;

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE teacherstudentrelationship (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    student_id INT NOT NULL,
    
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
        ON DELETE CASCADE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE,
        
    UNIQUE (teacher_id, student_id)
);

CREATE TABLE Tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    test_name VARCHAR(255) NOT NULL,
    teacher_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
        ON DELETE CASCADE
);

CREATE TABLE Questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    test_id INT NOT NULL,

    FOREIGN KEY (test_id) REFERENCES Tests(test_id)
        ON DELETE CASCADE
);

CREATE TABLE ExpectedAnswers (
    expected_id INT AUTO_INCREMENT PRIMARY KEY,
    answer_text TEXT NOT NULL,
    question_id INT NOT NULL,

    FOREIGN KEY (question_id) REFERENCES Questions(question_id)
        ON DELETE CASCADE
);

CREATE TABLE StudentAnswers (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    test_id INT NOT NULL,
    question_id INT NOT NULL,
    answer_text TEXT NOT NULL,
    score INT DEFAULT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (student_id) REFERENCES Students(student_id)
        ON DELETE CASCADE,
    FOREIGN KEY (test_id) REFERENCES Tests(test_id)
        ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES Questions(question_id)
        ON DELETE CASCADE,

    UNIQUE(student_id, test_id, question_id)
);

CREATE INDEX idx_studentanswers_student ON StudentAnswers(student_id);
CREATE INDEX idx_studentanswers_test ON StudentAnswers(test_id);
CREATE INDEX idx_tests_teacher ON Tests(teacher_id);
CREATE INDEX idx_questions_test ON Questions(test_id);
CREATE INDEX idx_expectedanswers_question ON ExpectedAnswers(question_id);
