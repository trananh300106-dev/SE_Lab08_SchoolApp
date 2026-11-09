CREATE DATABASE SchoolDB;
GO
USE SchoolDB;
GO

CREATE TABLE Departments (
    DepartmentID   INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(MAX) NOT NULL,
    Budget         DECIMAL(18,2) NOT NULL,
    StartDate      DATETIME2 NOT NULL
);

CREATE TABLE Instructors (
    InstructorID INT IDENTITY(1,1) PRIMARY KEY,
    LastName     NVARCHAR(MAX) NOT NULL,
    FirstName    NVARCHAR(MAX) NOT NULL,
    HireDate     DATETIME2 NOT NULL
);

CREATE TABLE Students (
    StudentID      INT IDENTITY(1,1) PRIMARY KEY,
    LastName       NVARCHAR(MAX) NOT NULL,
    FirstName      NVARCHAR(MAX) NOT NULL,
    EnrollmentDate DATETIME2 NOT NULL
);

CREATE TABLE Courses (
    CourseID     INT IDENTITY(1,1) PRIMARY KEY,
    Title        NVARCHAR(MAX) NOT NULL,
    Credits      INT NOT NULL,
    DepartmentID INT NOT NULL,
    CONSTRAINT FK_Courses_Departments FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID) ON DELETE CASCADE
);

CREATE TABLE Enrollments (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    CourseID     INT NOT NULL,
    StudentID    INT NOT NULL,
    Grade        DECIMAL(4,2) NOT NULL,
    CONSTRAINT FK_Enrollments_Courses  FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID) ON DELETE CASCADE,
    CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID) ON DELETE CASCADE
);
GO

-- Sample data
INSERT INTO Departments (DepartmentName, Budget, StartDate) VALUES
 (N'Computer Science', 100000, '2025-04-01'),
 (N'Information Systems', 200000, '2025-04-01');

INSERT INTO Instructors (LastName, FirstName, HireDate) VALUES
 (N'Nguyen', N'An', '2020-09-01'),
 (N'Tran', N'Binh', '2021-02-15');

INSERT INTO Students (LastName, FirstName, EnrollmentDate) VALUES
 (N'Le', N'Cuong', '2025-09-01'),
 (N'Pham', N'Dung', '2025-09-01');

INSERT INTO Courses (Title, Credits, DepartmentID) VALUES
 (N'Software Engineering', 3, 1),
 (N'Database Systems', 3, 2);

INSERT INTO Enrollments (CourseID, StudentID, Grade) VALUES
 (1, 1, 8.5),
 (2, 2, 9.0);
GO