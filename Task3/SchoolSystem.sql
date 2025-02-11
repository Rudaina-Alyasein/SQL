Create Table Family_INFO (ID int identity primary key,FatherName varchar(50) ,Phone varchar(50));
Create Table Students (ID int identity primary key ,name varchar(50) ,DateOfBirth Date ,Address varchar(50),FamilyID int not null , foreign key(FamilyID) references Family_INFO(ID));
insert into Family_INFO (FatherName,Phone) values ('Abdallah',077889966);
insert into Family_INFO (FatherName,Phone) values ('Ali',077776655);
insert into Family_INFO (FatherName,Phone) values ('Ahmad',077998877);
insert into Family_INFO (FatherName,Phone) values ('Abd',077889966);
insert into Family_INFO (FatherName,Phone) values ('samer',077446655);
insert into Family_INFO (FatherName,Phone) values ('rami',077942877);
select * from Family_INFO ;

insert into Students (name,DateOfBirth,Address,FamilyID ) values ('farah','2019-09-16','irbid',4);
select * from Students;
insert into Students (name,DateOfBirth,Address,FamilyID ) values ('sara','2003-02-05','irbid',3);
insert into Students (name,DateOfBirth,Address,FamilyID ) values ('Eman','2019-06-12','Amman',2);
select * from Students;
Create table Courses (ID int identity primary key,name varchar(50),description varchar(50), resourse varchar(50));
INSERT INTO Courses (name, description, resourse)
VALUES
('Mathematics 101', 'Basic math concepts', 'Textbook'),
('Computer Science 101', 'Introduction to programming', 'Online lectures'),
('Physics 101', 'Fundamentals of physics', 'Lecture notes'),
('History 101', 'World history overview', 'Classroom sessions');
select * from Courses ;
select * from Students;
create table Enrollment 
(
StudentID int ,CourseID int ,
foreign key (StudentID ) references Students(ID)
,foreign key (CourseID) references Courses (ID)

);
insert into Enrollment values (1,3);
insert into Enrollment values (2,4);
insert into Enrollment values (3,2);
create table classes (ID int identity primary key, ClassCode Varchar(50),RoomNumber int,Course_id int  , Schedule varchar(100),foreign key (Course_id) references Courses(ID));
insert into classes values ('Math101', 1,1,'Sunday 9:00AM-11:00AM' );
insert into classes values ('CS101', 7,2,'Tuesday 11:00AM-12:00AM' );
insert into classes values ('PHY101', 9,3,'Sutarday 8:00AM-10:00AM' );
insert into classes values ('H101', 3,4,'Wednesday 11:00AM-1:30AM' );
insert into classes values ('EPE202', 5,6,'Sunday 9:00AM-11:00AM' );
insert into classes(ClassCode,RoomNumber,Schedule ) values ('EPE202', 5,'Sunday 9:00AM-11:00AM' );
select * from classes;
Create table Assignments ( ID int identity primary key,Name varchar(50),Description varchar(50),dueDate date , Status varchar(50),CourseID  int ,foreign key(CourseID) references Courses(ID));
INSERT INTO Assignments (Name, Description, dueDate, Status, CourseID)
VALUES ('Assignment 1', 'Solve the math problems', '2024-03-01', 'failed', 1),
       ('Assignment 2', 'Write a program', '2024-03-10', 'passed', 2);
	   select * from Students;
	   insert into Students values ('Rudaina','2019-09-16','Amman',3);
Create Table Attendance (ID int identity primary key,AttendanceDate Date ,TypeAbsence varchar(50), Student_ID int ,foreign key (Student_ID) references Students(ID));
insert into Attendance values 
('2025-02-11','Leaving',4),
('2025-02-12','Late',5),
('2025-02-13','Leaving',2),
('2025-02-14','Absence',3),
('2025-02-15','Leaving',6);
	   --Q 1
	   select * from Students where DateOfBirth='2019-09-16';
	   --Q 2
	   	   select * from Courses;
	   select * from Courses where name='Physics 101';
	   --Q 3
	   	   	   select * from Students;
			   alter table Students add Email varchar(50)  null;
	   --Q 4
	   insert into Students values ('Rahaf','1998-10-2','Ramtha',2,'RahafSmairat@gmail.com');
	   --Q 5
	   select * from Family_INFO;
	   	   select * from Students ;

	   insert into Family_INFO values ('Raed' ,'999888777'),('Mohammad','9988770066');
	   select Students.name ,Family_INFO .FatherName from Family_INFO join Students on Students.ID=Family_INFO.ID;

	--Q 6
	select * from Courses ;
	select * from Students;
	select * from Enrollment;
	select Students.name as StudentsName ,Courses.name as CoursesName
	from Students
	inner join Enrollment on  StudentID=Students.ID
	inner join  Courses on  CourseID=Courses.ID;
	--Q 7
	select * from Students;
	select * from Enrollment;
	select * from Courses ;
	select * from Assignments ;
	select Students.name, Assignments.Status from Students
	inner join Enrollment on Enrollment.StudentID=Students.ID
	inner join Courses on Enrollment.CourseID=Courses.ID
	inner join Assignments on Assignments.CourseID=Courses.ID;

	--Q8
select * from Attendance;
select Students.name ,Attendance.TypeAbsence from Students join Attendance on  Students.ID =Attendance.Student_ID where Attendance.AttendanceDate between('2025-02-11') and ('2025-02-15') and Attendance.TypeAbsence='Leaving' ;