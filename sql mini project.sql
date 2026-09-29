CREATE DATABASE PMS;

USE PMS;

CREATE TABLE Students(
    Student_id INT PRIMARY KEY,
    Student_Name VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    ph_no BIGINT UNIQUE,
    Batch_Year VARCHAR(30) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Graduation_Year INT NOT NULL
);

CREATE TABLE Skills(
    Skills_id INT PRIMARY KEY,
    Skill_Name VARCHAR(30) NOT NULL
);

CREATE TABLE student_skills(
    Student_id INT,
    Skills_id INT,
    Skills_level INT NOT NULL,
    FOREIGN KEY(Student_id) REFERENCES Students(Student_id),
    FOREIGN KEY(Skills_id) REFERENCES Skills(Skills_id)
);

CREATE TABLE Companies(
    Company_id INT PRIMARY KEY,
    Company_Name VARCHAR(30) NOT NULL,
    Location VARCHAR(30) NOT NULL
);

CREATE TABLE Jobs(
    Job_id INT PRIMARY KEY,
    Company_id INT,
    job_title VARCHAR(30) NOT NULL,
    Required_skill INT,
    salary DECIMAL(10,2) NOT NULL,
    Job_Location VARCHAR(30) NOT NULL,
    FOREIGN KEY(Company_id) REFERENCES Companies(Company_id),
    FOREIGN KEY(Required_skill) REFERENCES Skills(Skills_id)
);

CREATE TABLE applications(
    application_id INT PRIMARY KEY,
    student_id INT,
    job_id INT,
    application_date DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    FOREIGN KEY(student_id) REFERENCES Students(Student_id),
    FOREIGN KEY(job_id) REFERENCES Jobs(Job_id)
);

CREATE TABLE interviews(
    interview_id INT PRIMARY KEY,
    application_id INT,
    interview_date DATE NOT NULL,
    interview_status VARCHAR(30) NOT NULL,
    result VARCHAR(30) NOT NULL,
    FOREIGN KEY(application_id) REFERENCES applications(application_id)
);

CREATE TABLE placements(
    placement_id INT PRIMARY KEY,
    student_id INT,
    company_id INT,
    job_id INT,
    placement_date DATE NOT NULL,
    salary DECIMAL(9,2) NOT NULL,
    FOREIGN KEY(student_id) REFERENCES Students(Student_id),
    FOREIGN KEY(company_id) REFERENCES Companies(Company_id),
    FOREIGN KEY(job_id) REFERENCES Jobs(Job_id)
);

INSERT INTO Students
(Student_id, Student_Name, email, ph_no, Batch_Year, Department, Graduation_Year)
VALUES
(1, 'Bhuvi', 'bhuvi@gmail.com', 9876500001, '2024', 'CSE', 2024),
(2, 'Ravi', 'ravi@gmail.com', 9876500002, '2024', 'ECE', 2024),
(3, 'Suresh', 'suresh@gmail.com', 9876500003, '2024', 'CSE', 2024),
(4, 'Anil', 'anil@gmail.com', 9876500004, '2024', 'EEE', 2024),
(5, 'Kiran', 'kiran@gmail.com', 9876500005, '2024', 'CSE', 2024),
(6, 'Priya', 'priya@gmail.com', 9876500006, '2024', 'ECE', 2024),
(7, 'Sneha', 'sneha@gmail.com', 9876500007, '2025', 'CSE', 2025),
(8, 'Rahul', 'rahul@gmail.com', 9876500008, '2025', 'IT', 2025),
(9, 'Divya', 'divya@gmail.com', 9876500009, '2025', 'CSE', 2025),
(10, 'Arjun', 'arjun@gmail.com', 9876500010, '2025', 'ECE', 2025),
(11, 'Meena', 'meena@gmail.com', 9876500011, '2025', 'IT', 2025),
(12, 'Vijay', 'vijay@gmail.com', 9876500012, '2025', 'CSE', 2025),
(13, 'Naveen', 'naveen@gmail.com', 9876500013, '2025', 'EEE', 2025),
(14, 'Pooja', 'pooja@gmail.com', 9876500014, '2025', 'CSE', 2025),
(15, 'Harish', 'harish@gmail.com', 9876500015, '2026', 'CSE', 2026),
(16, 'Swathi', 'swathi@gmail.com', 9876500016, '2026', 'IT', 2026),
(17, 'Manoj', 'manoj@gmail.com', 9876500017, '2026', 'ECE', 2026),
(18, 'Keerthi', 'keerthi@gmail.com', 9876500018, '2026', 'CSE', 2026),
(19, 'Tarun', 'tarun@gmail.com', 9876500019, '2026', 'IT', 2026),
(20, 'Lakshmi', 'lakshmi@gmail.com', 9876500020, '2026', 'CSE', 2026);

INSERT INTO Skills
(Skills_id, Skill_Name)
VALUES
(1, 'Python'),
(2, 'Java'),
(3, 'SQL'),
(4, 'HTML'),
(5, 'CSS'),
(6, 'JavaScript'),
(7, 'React'),
(8, 'Django');

INSERT INTO student_skills
(Student_id, Skills_id, Skills_level)
VALUES
(1,1,3),(1,3,2),(1,4,2),
(2,2,2),(2,3,2),(2,6,2),
(3,1,3),(3,6,2),(3,7,3),
(4,1,2),(4,3,2),(4,6,2),
(5,1,1),(5,3,2),(5,4,2),
(6,2,2),(6,3,2),(6,6,2),
(7,1,3),(7,6,2),(7,7,3),
(8,1,2),(8,3,2),(8,4,2),
(9,1,3),(9,6,2),(9,7,3),
(10,2,2),(10,3,2),(10,6,2),
(11,1,2),(11,3,2),(11,4,2),
(12,1,3),(12,6,2),(12,7,3),
(13,2,1),(13,3,2),(13,6,2),
(14,1,2),(14,6,2),(14,7,3),
(15,1,3),(15,3,2),(15,4,2),
(16,2,2),(16,3,2),(16,6,2),
(17,1,2),(17,3,2),(17,6,2),
(18,1,3),(18,6,2),(18,7,3),
(19,2,2),(19,3,2),(19,6,2),
(20,1,3),(20,3,2),(20,4,2);

INSERT INTO Companies
(Company_id, Company_Name, Location)
VALUES
(1,'TCS','Hyderabad'),
(2,'Infosys','Bangalore'),
(3,'Wipro','Hyderabad'),
(4,'Deloitte','Pune'),
(5,'Accenture','Bangalore'),
(6,'Cognizant','Chennai'),
(7,'Tech Mahindra','Pune'),
(8,'Capgemini','Mumbai');

INSERT INTO Jobs
(Job_id, Company_id, job_title, Required_skill, salary, Job_Location)
VALUES
(1,1,'Python Developer',1,600000,'Hyderabad'),
(2,1,'Java Developer',2,550000,'Hyderabad'),
(3,2,'Data Analyst',3,700000,'Bangalore'),
(4,2,'Web Developer',6,650000,'Bangalore'),
(5,3,'Python Developer',1,500000,'Hyderabad'),
(6,3,'SQL Developer',3,480000,'Hyderabad'),
(7,4,'Data Scientist',1,900000,'Pune'),
(8,4,'Java Developer',2,750000,'Pune'),
(9,5,'Full Stack Developer',7,800000,'Bangalore'),
(10,5,'Python Developer',1,850000,'Bangalore'),
(11,6,'Software Engineer',2,720000,'Chennai'),
(12,6,'Data Analyst',3,680000,'Chennai'),
(13,7,'Frontend Developer',6,620000,'Pune'),
(14,7,'Python Developer',1,580000,'Pune'),
(15,8,'Backend Developer',2,670000,'Mumbai'),
(16,8,'SQL Developer',3,560000,'Mumbai'),
(17,1,'Django Developer',8,630000,'Hyderabad'),
(18,2,'React Developer',7,740000,'Bangalore'),
(19,4,'Python Engineer',1,950000,'Pune'),
(20,5,'Java Engineer',2,780000,'Bangalore');

INSERT INTO applications
(application_id, student_id, job_id, application_date, status)
VALUES
(1,1,1,'2026-08-01','Applied'),
(2,1,2,'2026-08-02','Rejected'),
(3,1,3,'2026-08-03','Rejected'),
(4,1,5,'2026-08-04','Applied'),
(5,1,7,'2026-08-05','Applied'),
(6,1,10,'2026-08-06','Applied'),
(7,1,17,'2026-08-07','Applied'),
(8,1,19,'2026-08-08','Selected'),
(9,2,1,'2026-08-09','Applied'),
(10,2,4,'2026-08-10','Rejected'),
(11,2,6,'2026-08-11','Applied'),
(12,2,8,'2026-08-12','Applied'),
(13,2,11,'2026-08-13','Applied'),
(14,2,18,'2026-08-14','Applied'),
(15,2,20,'2026-08-15','Selected'),
(16,3,2,'2026-08-16','Rejected'),
(17,3,3,'2026-08-17','Applied'),
(18,3,7,'2026-08-18','Selected'),
(19,3,12,'2026-08-19','Applied'),
(20,3,15,'2026-08-20','Applied'),
(21,4,5,'2026-08-21','Applied'),
(22,4,6,'2026-08-22','Rejected'),
(23,4,9,'2026-08-23','Applied'),
(24,4,13,'2026-08-24','Selected'),
(25,5,1,'2026-08-01','Rejected'),
(26,5,7,'2026-08-02','Applied'),
(27,5,10,'2026-08-03','Applied'),
(28,5,17,'2026-08-04','Applied'),
(29,5,19,'2026-08-05','Applied'),
(30,6,2,'2026-08-06','Applied'),
(31,6,4,'2026-08-07','Applied'),
(32,6,11,'2026-08-08','Applied'),
(33,6,18,'2026-08-09','Applied'),
(34,7,1,'2026-08-10','Applied'),
(35,7,5,'2026-08-11','Applied'),
(36,7,9,'2026-08-12','Selected'),
(37,7,14,'2026-08-13','Applied'),
(38,8,3,'2026-08-14','Selected'),
(39,8,6,'2026-08-15','Applied'),
(40,8,12,'2026-08-16','Applied'),
(41,8,16,'2026-08-17','Applied'),
(42,9,4,'2026-08-18','Applied'),
(43,9,9,'2026-08-19','Applied'),
(44,9,13,'2026-08-20','Applied'),
(45,9,18,'2026-08-21','Applied'),
(46,10,2,'2026-08-22','Rejected'),
(47,10,8,'2026-08-23','Selected'),
(48,10,11,'2026-08-24','Applied'),
(49,10,15,'2026-08-01','Applied'),
(50,11,1,'2026-08-02','Applied'),
(51,11,6,'2026-08-03','Applied'),
(52,11,10,'2026-08-04','Applied'),
(53,12,3,'2026-08-05','Applied'),
(54,12,7,'2026-08-06','Applied'),
(55,12,12,'2026-08-07','Applied'),
(56,12,19,'2026-08-08','Selected'),
(57,13,5,'2026-08-09','Applied'),
(58,13,14,'2026-08-10','Applied'),
(59,13,16,'2026-08-11','Applied'),
(60,14,4,'2026-08-12','Rejected'),
(61,14,9,'2026-08-13','Applied'),
(62,14,18,'2026-08-14','Applied'),
(63,15,1,'2026-08-15','Applied'),
(64,15,7,'2026-08-16','Applied'),
(65,15,17,'2026-08-17','Selected'),
(66,16,2,'2026-08-18','Rejected'),
(67,16,10,'2026-08-19','Applied'),
(68,16,15,'2026-08-20','Applied'),
(69,17,3,'2026-08-21','Rejected'),
(70,17,11,'2026-08-22','Applied'),
(71,17,16,'2026-08-23','Applied'),
(72,18,5,'2026-08-24','Applied'),
(73,18,7,'2026-08-01','Applied'),
(74,18,19,'2026-08-02','Selected'),
(75,19,4,'2026-08-03','Applied'),
(76,19,9,'2026-08-04','Applied'),
(77,19,13,'2026-08-05','Applied'),
(78,20,2,'2026-08-06','Applied'),
(79,20,12,'2026-08-07','Applied'),
(80,20,20,'2026-08-08','Selected');

INSERT INTO interviews
(interview_id, application_id, interview_date, interview_status, result)
VALUES
(1,8,'2026-08-25','Attended','Selected'),
(2,15,'2026-08-25','Attended','Selected'),
(3,18,'2026-08-25','Attended','Selected'),
(4,22,'2026-08-25','Attended','Rejected'),
(5,36,'2026-08-25','Attended','Selected'),
(6,38,'2026-08-25','Attended','Selected'),
(7,47,'2026-08-25','Attended','Selected'),
(8,56,'2026-08-25','Attended','Selected'),
(9,65,'2026-08-25','Attended','Selected'),
(10,74,'2026-08-25','Attended','Selected'),
(11,80,'2026-08-25','Attended','Selected'),
(12,5,'2026-08-26','Attended','Rejected'),
(13,9,'2026-08-26','Attended','Rejected'),
(14,17,'2026-08-26','Attended','Rejected'),
(15,26,'2026-08-26','Attended','Rejected'),
(16,30,'2026-08-27','Not Attended','Pending'),
(17,31,'2026-08-27','Not Attended','Pending'),
(18,32,'2026-08-27','Not Attended','Pending'),
(19,33,'2026-08-27','Not Attended','Pending'),
(20,44,'2026-08-27','Attended','Rejected'),
(21,67,'2026-08-27','Attended','Rejected'),
(22,70,'2026-08-27','Attended','Rejected'),
(23,57,'2026-08-28','Not Attended','Pending'),
(24,58,'2026-08-28','Not Attended','Pending'),
(25,59,'2026-08-28','Not Attended','Pending');

INSERT INTO placements
(placement_id, student_id, company_id, job_id, placement_date, salary)
VALUES
(1,1,4,19,'2026-09-02',950000),
(2,2,5,20,'2026-09-03',780000),
(3,3,4,7,'2026-09-04',900000),
(4,4,3,6,'2026-09-05',480000),
(5,7,5,9,'2026-09-06',800000),
(6,8,2,3,'2026-09-07',700000),
(7,10,4,8,'2026-09-08',750000),
(8,12,4,19,'2026-09-09',950000),
(9,15,1,17,'2026-09-10',630000),
(10,18,4,19,'2026-09-11',950000),
(11,20,5,20,'2026-09-12',780000);