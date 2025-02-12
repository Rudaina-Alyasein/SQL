Create table Categories(ID int identity primary key, Name varchar(50) not null, Description varchar(50) not null);

Create table Books (ID int identity primary key,Title varchar(50) not null,Author varchar(50) not null,Genre Varchar(50) not null, PublicationYear Date not null,AvailabilityStatus varchar(50) not null, CategoryID int foreign key (CategoryID ) references Categories(ID));
Create table Members (ID int identity primary key,Name varchar(50) not null,ContactInformation varchar(50) not null,MembershipType Varchar(50) not null, RegistraionDate Date not null);
create table borrowing (ID int identity primary key,MemberID int,BookID int ,BorrowingDate Date not null ,dueDate date not null,returnDate date , foreign key (MemberID) references Members(ID), foreign key (BookID)  references Books(ID)  );
create table Reservations (ID int identity primary key, MemberID int foreign KEY (MemberID) references Members(ID),BookID int foreign KEY (BookID) references Books(ID)  ,ReservationDate date not null ,Status varchar(50) not null);
Create table LibraryStaff (ID int identity primary key,Name varchar(50) not null, ConactInfo varchar (50) not null ,AssignedSection varchar(50),EmploymentDate date not null);
Create table FinancialFines(ID int identity primary key,MemberID int ,Amount int not null,PaymentStatus nvarchar not null ,foreign key(MemberID) references Members (ID));
-- Inserting records into Categories
INSERT INTO Categories (Name, Description)
VALUES 
('Fiction', 'Books that contain fictional stories'),
('Science Fiction', 'Books based on futuristic or speculative concepts'),
('Biography', 'Books that tell the life stories of individuals'),
('Mystery', 'Books involving crime, investigations, and puzzles'),
('Romance', 'Books focusing on romantic relationships');

-- Inserting records into Books
INSERT INTO Books (Title, Author, Genre, PublicationYear, AvailabilityStatus, CategoryID)
VALUES 
('Dune', 'Frank Herbert', 'Science Fiction', '1965-08-01', 'Available', 2),
('Pride and Prejudice', 'Jane Austen', 'Romance', '1813-01-28', 'Checked Out', 5),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '1925-04-10', 'Available', 1),
('Sherlock Holmes', 'Arthur Conan Doyle', 'Mystery', '1892-01-01', 'Checked Out', 4),
('The Diary of a Young Girl', 'Anne Frank', 'Biography', '1947-06-25', 'Available', 3);

-- Inserting records into Members
INSERT INTO Members (Name, ContactInformation, MembershipType, RegistraionDate)
VALUES 
('John Doe', 'john.doe@example.com', 'Regular', '2024-02-01'),
('Jane Smith', 'jane.smith@example.com', 'Premium', '2024-01-15'),
('Mark Johnson', 'mark.johnson@example.com', 'Regular', '2023-12-20'),
('Lucy Williams', 'lucy.williams@example.com', 'Premium', '2024-01-05'),
('Michael Brown', 'michael.brown@example.com', 'Regular', '2023-11-18');

-- Inserting records into Borrowing
INSERT INTO borrowing (MemberID, BookID, BorrowingDate, dueDate, returnDate)
VALUES 
(1, 1, '2024-02-05', '2024-02-19', NULL),
(2, 2, '2024-01-18', '2024-02-01', NULL),
(3, 3, '2023-12-25', '2024-01-08', '2024-01-07'),
(4, 4, '2024-01-10', '2024-01-24', NULL),
(5, 5, '2023-11-22', '2023-12-06', '2023-12-04');

-- Inserting records into Reservations
INSERT INTO Reservations (MemberID, BookID, ReservationDate, Status)
VALUES 
(1, 3, '2024-02-10', 'Pending'),
(2, 4, '2024-01-20', 'Completed'),
(3, 5, '2024-02-01', 'Pending'),
(4, 1, '2024-01-15', 'Completed'),
(5, 2, '2024-02-08', 'Pending');
--Q1
select * from members;
select * from members where RegistraionDate='2024-02-01';
--Q2
select * from books;
select * from books where Title='Dune' ;
--Q3
alter table members add Email varchar(50) null;
select * from members;
--Q4
insert into members (Name,ContactInformation,MembershipType,RegistraionDate,Email) values ('Rudaina','9876543210',' Student','2024-03-09','Rudainaalomari@gmail.com');
insert into members (Name,ContactInformation,MembershipType,RegistraionDate,Email) values ('Omar','Rudainaalomari@gmail.com','Regular','5-6-2024','Omar@gmail.com');

select * from members;
--Q5
select * from Reservations;
select * from members join Reservations on MemberID=Reservations.ID;
--Q6
select * from books ;
select * from members ;
select * from members join borrowing on MemberID=borrowing.ID 
join books on BookID=members.ID;
--Q7
select *from borrowing;
select*from books;
select *from Reservations;
select * from  members  join Reservations on Members.ID=MemberID  
join books on BookID=books.ID where Title='Dune' and  Status='Completed';
--Q8
select * from members join borrowing on members.ID=MemberID
join Books on BookID=Books.ID where returnDate>dueDate;
--Q9
select *from borrowing;
select*from books;
--Q10
select * from members join Borrowing on  MemberID=members.ID  where BorrowingDate Between ('2024-01-10') and ('2024-01-18');
--Q11
select Count (ID) as countBooks from books;
--Q12
select * from members;
select * from Borrowing;

select Name from Members join borrowing on MemberID=members.ID
where returnDate=Null;










-- Inserting records into LibraryStaff
INSERT INTO LibraryStaff (Name, ConactInfo, AssignedSection, EmploymentDate)
VALUES 
('Alice Green', 'alice.green@library.com', 'Science Fiction', '2023-07-01'),
('Bob White', 'bob.white@library.com', 'Mystery', '2022-11-12'),
('Carol Black', 'carol.black@library.com', 'Fiction', '2021-09-18'),
('David Blue', 'david.blue@library.com', 'Romance', '2024-02-01'),
('Eva Yellow', 'eva.yellow@library.com', 'Biography', '2023-10-10');

-- Inserting records into FinancialFines
INSERT INTO FinancialFines (MemberID, Amount, PaymentStatus)
VALUES 
(1, 20, 'Unpaid'),
(2, 15, 'Paid'),
(3, 25, 'Unpaid'),
(4, 10, 'Paid'),
(5, 30, 'Unpaid');

