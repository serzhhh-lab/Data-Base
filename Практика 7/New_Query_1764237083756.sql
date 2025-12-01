CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY, -- Уникальный идентификатор студента
    full_name VARCHAR(255) NOT NULL, -- Полное имя студента
    email VARCHAR(255) UNIQUE NOT NULL, -- Электронная почта студента (должна быть уникальной)
    start_year INT -- Год поступления студента
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY, -- Уникальный идентификатор курса
    course_name VARCHAR(255) NOT NULL, -- Название курса
    credits INT CHECK (credits > 0) -- Количество зачетных единиц курса (должно быть больше 0)
);

CREATE TABLE Enrollments (
    student_id INT REFERENCES Students(student_id) ON DELETE CASCADE, -- Ссылка на ID студента (внешний ключ)
    course_id INT REFERENCES Courses(course_id) ON DELETE CASCADE, -- Ссылка на ID курса (внешний ключ)
    grade CHAR(1), -- Оценка студента за курс (например, 'A', 'B', 'C')
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO Students (student_id, full_name, email, start_year) VALUES (DEFAULT, 'Алексей Смирнов', 'keka@mail.ru', 2021),
(DEFAULT, 'Елена Кузнецова', 'ne_takaya@yandex.ru', 2022),
(DEFAULT, 'Дмитрий Новиков', 'lela@mail.ru', 2021),
(DEFAULT, 'Ольга Морозова', 'ice_teta@mail.ru', 2023);

INSERT INTO Courses (course_id, course_name, credits) VALUES (DEFAULT, 'Введение в прорамирование', 5),
(DEFAULT, 'Базы данных', 4),
(DEFAULT, 'Веб-технологии', 4);

INSERT INTO Enrollments (student_id, course_id, grade) VALUES (1, 2, 'A'),
(2,2,'B'),
(2,3,'A'),
(3,1, NULL),
(3,2, NULL),
(3,3, NULL);

UPDATE Students set email = 'elena.kuznetsova@newmail.com' WHERE full_name = 'Елена Кузнецова';

UPDATE Enrollments set grade = 'A' WHERE student_id = 3 AND course_id = 1;

DELETE FROM Students where email = 'morozova@mail.ru';


SELECT * FROM Students;

SELECT course_name, credits FROM Courses;

SELECT * FROM Students WHERE start_year = 2021;

SELECT * FROM Courses WHERE credits > 4;

SELECT * FROM Students WHERE email = 'elena.kuznetsova@newmail.com';

SELECT * FROM Students WHERE full_name LIKE 'Дмитрий%';

SELECT * FROM Enrollments WHERE grade IS NULL;

SELECT * FROM Courses ORDER BY course_name;

SELECT * FROM Students ORDER BY start_year ASC, full_name ASC;

SELECT * FROM Students ORDER BY start_year DESC LIMIT 2;