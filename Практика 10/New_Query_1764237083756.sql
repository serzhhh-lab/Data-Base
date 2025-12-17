-- изначальная структура  нарушает 1нф, потому что в одной ячейке хранилось несколько значений
CREATE Table projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255)
);

CREATE Table members (
    member_id INT PRIMARY KEY,
    team_member VARCHAR(1000),
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

--client_name, client_email - зависит от сlient_id; equipment_name - зависит от equipment_id; rental_date - зависит от PRIMARY KEY (client_id, equipment_id); client_name, client_email и equipment_name зависят только от части составного ключа, что нарушает требование полной функциональной зависимости от первичного ключа.
CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    client_email VARCHAR(255)
);

CREATE TABLE equipments (
    equipment_id INT PRIMARY KEY,
    equipment_name VARCHAR(255)
)

CREATE Table EquipmentRentals (
    client_id INT,
    equipment_id INT,
    rental_date DATE,
    PRIMARY KEY (client_id, equipment_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (equipment_id) REFERENCES equipments(equipment_id)
);

--Нарушение: в поле assignments_and_grades хранилось множество значений
CREATE TABLE StudentsGrades (
    student_id INT,
    course_id INT,
    student_name VARCHAR(255),
    course_professor VARCHAR(255),
    assignments_name  VARCHAR(255),
    grade INT, 
    PRIMARY KEY (student_id, course_id)
);
--приведение к 2нф
CREATE Table students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);

CREATE Table courses (
    course_id int PRIMARY KEY,
    course_professor VARCHAR(255)
);

CREATE TABLE students_courses (
    student_id int,
    course_id int,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE Table grades (
    grade_id int PRIMARY KEY,
    assignments_name  VARCHAR(255),
    grade INT, 
    student_id int,
    course_id int,
    Foreign Key (student_id, course_id) REFERENCES students_courses(student_id, course_id)
);