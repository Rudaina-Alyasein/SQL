Create DataBase School;
CREATE TABLE Teachers (
    ID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(50) NOT NULL
);
CREATE TABLE TeachersDetails (
    ID INT PRIMARY KEY IDENTITY,
    Teachers_id INT UNIQUE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Certificates VARCHAR(50),
    Major VARCHAR(50),
    FOREIGN KEY (Teachers_id) REFERENCES Teachers(ID) ON DELETE CASCADE
);
CREATE TABLE Students (
    ID INT PRIMARY KEY IDENTITY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Address VARCHAR(50) NOT NULL
);
Create Table Courses (ID int primary key identity, TeacherID int NOT NULL, foreign key (TeacherID) references Teachers (ID)  );

Create Table StudentCourses (Student_id int NOT NULL, Courses_id int NOT NULL , primary key(Student_id,Courses_id),FOREIGN KEY(Student_id) REFERENCES Students(ID) ON DELETE CASCADE,foreign key (Courses_id) references Courses (ID) ON DELETE CASCADE);
INSERT INTO  Teachers (Name,Age,Address) values ('Rudaina',23,'irbid'),('Rahaf',26,'Ramtha'),('Sara',25,'Jerash'),('Sura',24,'irbid');
select * from Teachers;
insert into TeachersDetails (Teachers_id,Salary,Certificates,Major) values (1,500,'ICDL','Arabic'),(2,800,'QA','Math'),(3,900,'ICDL','Computer Science');
select * from TeachersDetails;
insert into Students (Name,Age,Address) values ('Rana',14,'amman'),('Reem',16,'irbid'),('Leen',18,'irbid');
select * from Students;
alter table Courses add  CourseName varchar(50) not null,Duration varchar(50),StartDate date ,EndDate Date;
Select * from Courses;
insert into Courses (TeacherID,CourseName ,Duration,StartDate,EndDate) values (1,'C#','5 Months ','2025-01-30','2025-05-30');
insert into Courses (TeacherID,CourseName ,Duration,StartDate,EndDate) values (2,'C++','4 Months ','2025-08-30','2025-12-30');
insert into Courses (TeacherID,CourseName ,Duration,StartDate,EndDate) values (3,'php','9 Months ','2025-01-30','2025-10-30');
Select * from Courses;


