/* ============================================================
   SchoolMS - full database script (SQL Server / LocalDB)
   Run this once in SSMS or Visual Studio (SQL Server Object
   Explorer -> (localdb)\MSSQLLocalDB -> New Query).
   Safe to re-run: it will not duplicate tables or seed rows.
   ============================================================ */

IF DB_ID(N'SchoolMS') IS NULL
    CREATE DATABASE SchoolMS;
GO

USE SchoolMS;
GO

/* ---------- Admin users (Login.aspx / Register.aspx) ---------- */
IF OBJECT_ID(N'dbo.Users', N'U') IS NULL
CREATE TABLE dbo.Users (
    Id        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Users PRIMARY KEY,
    Name      NVARCHAR(100) NOT NULL,
    Email     NVARCHAR(150) NOT NULL CONSTRAINT UQ_Users_Email UNIQUE,
    [Password] NVARCHAR(200) NOT NULL,          -- PBKDF2 hash, never plain text
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Users_CreatedAt DEFAULT SYSUTCDATETIME()
);
GO

/* ---------- Students (Student.aspx / Student_Login.aspx) ------- */
IF OBJECT_ID(N'dbo.Stud', N'U') IS NULL
CREATE TABLE dbo.Stud (
    Id        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Stud PRIMARY KEY,
    EnrlNo    NVARCHAR(30)  NOT NULL CONSTRAINT UQ_Stud_EnrlNo UNIQUE,
    Name      NVARCHAR(100) NOT NULL,
    Age       INT NOT NULL,
    City      NVARCHAR(100) NULL,
    [Password] NVARCHAR(200) NOT NULL,
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Stud_CreatedAt DEFAULT SYSUTCDATETIME()
);
GO

/* ---------- Teachers (Teacher.aspx / Teacher_login.aspx) ------- */
IF OBJECT_ID(N'dbo.Teacher', N'U') IS NULL
CREATE TABLE dbo.Teacher (
    Id        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Teacher PRIMARY KEY,
    Email     NVARCHAR(150) NOT NULL CONSTRAINT UQ_Teacher_Email UNIQUE,
    Name      NVARCHAR(100) NOT NULL,
    Age       INT NOT NULL,
    City      NVARCHAR(100) NULL,
    Department NVARCHAR(100) NULL,
    [Password] NVARCHAR(200) NOT NULL,
    CreatedAt DATETIME2 NOT NULL CONSTRAINT DF_Teacher_CreatedAt DEFAULT SYSUTCDATETIME()
);
GO

/* ---------- Seed data (passwords are pre-hashed) ---------------
   Admin   : admin@school.com    / Admin@123
   Teacher : teacher@school.com  / Teacher@123
   Student : ENR001              / Student@123
   Change these after first login / delete in production.        */
IF NOT EXISTS (SELECT 1 FROM dbo.Users WHERE Email = N'admin@school.com')
    INSERT INTO dbo.Users (Name, Email, [Password])
    VALUES (N'Administrator', N'admin@school.com', N'PBKDF2$10000$OhBJKDfVKtIPWZBrTZ6bcQ==$zXvwlkTnciOCNaKJdRmYqGf6w4qRBrQHDlkW809IWkw=');

IF NOT EXISTS (SELECT 1 FROM dbo.Teacher WHERE Email = N'teacher@school.com')
    INSERT INTO dbo.Teacher (Email, Name, Age, City, [Password])
    VALUES (N'teacher@school.com', N'Demo Teacher', 35, N'Mumbai', N'PBKDF2$10000$UvUCftBN9HWFE5HAOBkYqQ==$OfdpBg7UmnEUFCQAr8Pq6fwvK0AyeORkk7s5lQLPOBI=');

IF NOT EXISTS (SELECT 1 FROM dbo.Stud WHERE EnrlNo = N'ENR001')
    INSERT INTO dbo.Stud (EnrlNo, Name, Age, City, [Password])
    VALUES (N'ENR001', N'Demo Student', 15, N'Mumbai', N'PBKDF2$10000$/uLUy7WTzzE4N5iLppJtGg==$QfRoMR8SXjrjhVQUDU9AOBqryBwIo8cKPyTgg80F1hw=');
GO

/* ============================================================
   Classes / Courses / Schedule tables
   ============================================================ */

/* Upgrade: older copies of this database have no Teacher.Department */
IF COL_LENGTH(N'dbo.Teacher', N'Department') IS NULL
    ALTER TABLE dbo.Teacher ADD Department NVARCHAR(100) NULL;
GO

UPDATE dbo.Teacher SET Department = N'Mathematics'
WHERE Email = N'teacher@school.com' AND Department IS NULL;
GO

/* ---------- Courses (Courses.aspx) ---------------------------- */
IF OBJECT_ID(N'dbo.Courses', N'U') IS NULL
CREATE TABLE dbo.Courses (
    Id         INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_Courses PRIMARY KEY,
    CourseName NVARCHAR(100) NOT NULL CONSTRAINT UQ_Courses_Name UNIQUE,
    Duration   NVARCHAR(50)  NOT NULL,
    Faculty    NVARCHAR(100) NOT NULL
);
GO

IF OBJECT_ID(N'dbo.CourseModules', N'U') IS NULL
CREATE TABLE dbo.CourseModules (
    Id         INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_CourseModules PRIMARY KEY,
    CourseId   INT NOT NULL CONSTRAINT FK_CourseModules_Course REFERENCES dbo.Courses(Id) ON DELETE CASCADE,
    ModuleCode NVARCHAR(50) NOT NULL,
    SortOrder  INT NOT NULL
);
GO

/* ---------- Class timetable (Schedule.aspx / TeacherSchedule.aspx) */
IF OBJECT_ID(N'dbo.ClassTimetable', N'U') IS NULL
CREATE TABLE dbo.ClassTimetable (
    Id        INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_ClassTimetable PRIMARY KEY,
    ClassNo   INT NOT NULL,                    -- 1..12
    SortOrder INT NOT NULL,                    -- order of the slot in the day
    TimeSlot  NVARCHAR(30) NOT NULL,
    Subject   NVARCHAR(100) NOT NULL,
    IsBreak   BIT NOT NULL CONSTRAINT DF_ClassTimetable_IsBreak DEFAULT 0,
    CONSTRAINT UQ_ClassTimetable UNIQUE (ClassNo, SortOrder)
);
GO

/* ---------- Teacher weekly schedule (Classes.aspx) ------------- */
IF OBJECT_ID(N'dbo.SchedulePeriods', N'U') IS NULL
CREATE TABLE dbo.SchedulePeriods (
    SortOrder   INT NOT NULL CONSTRAINT PK_SchedulePeriods PRIMARY KEY,
    TimeSlot    NVARCHAR(30) NOT NULL,
    PeriodLabel NVARCHAR(20) NOT NULL,         -- '1'..'8' or 'Lunch'
    IsBreak     BIT NOT NULL CONSTRAINT DF_SchedulePeriods_IsBreak DEFAULT 0
);
GO

IF OBJECT_ID(N'dbo.TeacherSchedule', N'U') IS NULL
CREATE TABLE dbo.TeacherSchedule (
    Id           INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_TeacherSchedule PRIMARY KEY,
    TeacherEmail NVARCHAR(150) NOT NULL
                 CONSTRAINT FK_TeacherSchedule_Teacher REFERENCES dbo.Teacher(Email)
                 ON DELETE CASCADE ON UPDATE CASCADE,
    DayNo        TINYINT NOT NULL CONSTRAINT CK_TeacherSchedule_Day CHECK (DayNo BETWEEN 1 AND 5), -- 1=Mon .. 5=Fri
    SortOrder    INT NOT NULL CONSTRAINT FK_TeacherSchedule_Period REFERENCES dbo.SchedulePeriods(SortOrder),
    Subject      NVARCHAR(100) NOT NULL,
    Room         NVARCHAR(50)  NULL,
    Grade        NVARCHAR(30)  NULL,
    UpdatedAt    DATETIME2 NOT NULL CONSTRAINT DF_TeacherSchedule_Updated DEFAULT SYSUTCDATETIME(),
    CONSTRAINT UQ_TeacherSchedule UNIQUE (TeacherEmail, DayNo, SortOrder)   -- no row for a slot = Free period
);
GO

/* ---------- Seed: courses ------------------------------------- */
IF NOT EXISTS (SELECT 1 FROM dbo.Courses WHERE CourseName = N'English')
BEGIN
    INSERT INTO dbo.Courses (CourseName, Duration, Faculty) VALUES (N'English', N'6 Months', N'Mr. Sharma');
    DECLARE @cid_English INT = SCOPE_IDENTITY();
    INSERT INTO dbo.CourseModules (CourseId, ModuleCode, SortOrder) VALUES
        (@cid_English, N'ENG101', 1),
        (@cid_English, N'ENG102', 2),
        (@cid_English, N'ENG103', 3);
END
IF NOT EXISTS (SELECT 1 FROM dbo.Courses WHERE CourseName = N'Science')
BEGIN
    INSERT INTO dbo.Courses (CourseName, Duration, Faculty) VALUES (N'Science', N'1 Year', N'Dr. Mehta');
    DECLARE @cid_Science INT = SCOPE_IDENTITY();
    INSERT INTO dbo.CourseModules (CourseId, ModuleCode, SortOrder) VALUES
        (@cid_Science, N'SCI201', 1),
        (@cid_Science, N'SCI202', 2),
        (@cid_Science, N'SCI203', 3);
END
IF NOT EXISTS (SELECT 1 FROM dbo.Courses WHERE CourseName = N'Gujarati')
BEGIN
    INSERT INTO dbo.Courses (CourseName, Duration, Faculty) VALUES (N'Gujarati', N'4 Months', N'Ms. Joshi');
    DECLARE @cid_Gujarati INT = SCOPE_IDENTITY();
    INSERT INTO dbo.CourseModules (CourseId, ModuleCode, SortOrder) VALUES
        (@cid_Gujarati, N'GUJ301', 1),
        (@cid_Gujarati, N'GUJ302', 2),
        (@cid_Gujarati, N'GUJ303', 3);
END
IF NOT EXISTS (SELECT 1 FROM dbo.Courses WHERE CourseName = N'Computer')
BEGIN
    INSERT INTO dbo.Courses (CourseName, Duration, Faculty) VALUES (N'Computer', N'5 Months', N'Mr. Patel');
    DECLARE @cid_Computer INT = SCOPE_IDENTITY();
    INSERT INTO dbo.CourseModules (CourseId, ModuleCode, SortOrder) VALUES
        (@cid_Computer, N'COM401', 1),
        (@cid_Computer, N'COM402', 2),
        (@cid_Computer, N'COM403', 3);
END
IF NOT EXISTS (SELECT 1 FROM dbo.Courses WHERE CourseName = N'Maths')
BEGIN
    INSERT INTO dbo.Courses (CourseName, Duration, Faculty) VALUES (N'Maths', N'5 Months', N'Mr. Patel');
    DECLARE @cid_Maths INT = SCOPE_IDENTITY();
    INSERT INTO dbo.CourseModules (CourseId, ModuleCode, SortOrder) VALUES
        (@cid_Maths, N'Math01', 1),
        (@cid_Maths, N'std 1 to 10', 2),
        (@cid_Maths, N'COM403', 3);
END
GO

/* ---------- Seed: class timetable (classes 1-12) --------------- */
IF NOT EXISTS (SELECT 1 FROM dbo.ClassTimetable)
INSERT INTO dbo.ClassTimetable (ClassNo, SortOrder, TimeSlot, Subject, IsBreak) VALUES
    (1, 1, N'09:00 – 09:45', N'English', 0),
    (1, 2, N'09:45 – 10:30', N'Maths', 0),
    (1, 3, N'10:30 – 11:15', N'Drawing', 0),
    (1, 4, N'11:15 – 11:30', N'Break', 1),
    (1, 5, N'11:30 – 12:15', N'EVS', 0),
    (1, 6, N'12:15 – 01:00', N'Storytelling', 0),
    (2, 1, N'09:00 – 09:45', N'Mathematics', 0),
    (2, 2, N'09:45 – 10:30', N'English', 0),
    (2, 3, N'10:30 – 11:15', N'Science', 0),
    (2, 4, N'11:15 – 11:30', N'Break', 1),
    (2, 5, N'11:30 – 12:15', N'Hindi', 0),
    (2, 6, N'12:15 – 01:00', N'Computer', 0),
    (3, 1, N'09:00 – 09:45', N'English', 0),
    (3, 2, N'09:45 – 10:30', N'Maths', 0),
    (3, 3, N'10:30 – 11:15', N'Science', 0),
    (3, 4, N'11:15 – 11:30', N'Break', 1),
    (3, 5, N'11:30 – 12:15', N'Social Studies', 0),
    (3, 6, N'12:15 – 01:00', N'Hindi', 0),
    (4, 1, N'09:00 – 09:45', N'English', 0),
    (4, 2, N'09:45 – 10:30', N'Maths', 0),
    (4, 3, N'10:30 – 11:15', N'Drawing', 0),
    (4, 4, N'11:15 – 11:30', N'Break', 1),
    (4, 5, N'11:30 – 12:15', N'EVS', 0),
    (4, 6, N'12:15 – 01:00', N'Storytelling', 0),
    (5, 1, N'09:00 – 09:45', N'Mathematics', 0),
    (5, 2, N'09:45 – 10:30', N'English', 0),
    (5, 3, N'10:30 – 11:15', N'Science', 0),
    (5, 4, N'11:15 – 11:30', N'Break', 1),
    (5, 5, N'11:30 – 12:15', N'Hindi', 0),
    (5, 6, N'12:15 – 01:00', N'Computer', 0),
    (6, 1, N'09:00 – 09:45', N'English', 0),
    (6, 2, N'09:45 – 10:30', N'Maths', 0),
    (6, 3, N'10:30 – 11:15', N'Drawing', 0),
    (6, 4, N'11:15 – 11:30', N'Break', 1),
    (6, 5, N'11:30 – 12:15', N'EVS', 0),
    (6, 6, N'12:15 – 01:00', N'Storytelling', 0),
    (7, 1, N'09:00 – 09:45', N'Mathematics', 0),
    (7, 2, N'09:45 – 10:30', N'English', 0),
    (7, 3, N'10:30 – 11:15', N'Science', 0),
    (7, 4, N'11:15 – 11:30', N'Break', 1),
    (7, 5, N'11:30 – 12:15', N'Hindi', 0),
    (7, 6, N'12:15 – 01:00', N'Computer', 0),
    (8, 1, N'09:00 – 09:45', N'English', 0),
    (8, 2, N'09:45 – 10:30', N'Maths', 0),
    (8, 3, N'10:30 – 11:15', N'Drawing', 0),
    (8, 4, N'11:15 – 11:30', N'Break', 1),
    (8, 5, N'11:30 – 12:15', N'EVS', 0),
    (8, 6, N'12:15 – 01:00', N'Storytelling', 0),
    (9, 1, N'09:00 – 09:45', N'Mathematics', 0),
    (9, 2, N'09:45 – 10:30', N'English', 0),
    (9, 3, N'10:30 – 11:15', N'Science', 0),
    (9, 4, N'11:15 – 11:30', N'Break', 1),
    (9, 5, N'11:30 – 12:15', N'Hindi', 0),
    (9, 6, N'12:15 – 01:00', N'Computer', 0),
    (10, 1, N'09:00 – 09:45', N'Mathematics', 0),
    (10, 2, N'09:45 – 10:30', N'Science', 0),
    (10, 3, N'10:30 – 11:15', N'English', 0),
    (10, 4, N'11:15 – 11:30', N'Break', 1),
    (10, 5, N'11:30 – 12:15', N'Social Studies', 0),
    (10, 6, N'12:15 – 01:00', N'Hindi', 0),
    (11, 1, N'09:00 – 09:45', N'English', 0),
    (11, 2, N'09:45 – 10:30', N'Maths', 0),
    (11, 3, N'10:30 – 11:15', N'Drawing', 0),
    (11, 4, N'11:15 – 11:30', N'Break', 1),
    (11, 5, N'11:30 – 12:15', N'EVS', 0),
    (11, 6, N'12:15 – 01:00', N'Storytelling', 0),
    (12, 1, N'09:00 – 09:45', N'Physics', 0),
    (12, 2, N'09:45 – 10:30', N'Chemistry', 0),
    (12, 3, N'10:30 – 11:15', N'Maths', 0),
    (12, 4, N'11:15 – 11:30', N'Break', 1),
    (12, 5, N'11:30 – 12:15', N'English', 0),
    (12, 6, N'12:15 – 01:00', N'Computer Science', 0);
GO

/* ---------- Seed: school periods + demo teacher schedule ------- */
IF NOT EXISTS (SELECT 1 FROM dbo.SchedulePeriods)
INSERT INTO dbo.SchedulePeriods (SortOrder, TimeSlot, PeriodLabel, IsBreak) VALUES
    (1, N'8:00 - 8:45', N'1', 0),
    (2, N'8:50 - 9:35', N'2', 0),
    (3, N'9:40 - 10:25', N'3', 0),
    (4, N'10:30 - 11:15', N'4', 0),
    (5, N'11:20 - 12:05', N'5', 0),
    (6, N'12:05 - 12:50', N'Lunch', 1),
    (7, N'12:50 - 13:35', N'6', 0),
    (8, N'13:40 - 14:25', N'7', 0),
    (9, N'14:30 - 15:15', N'8', 0);
GO

IF EXISTS (SELECT 1 FROM dbo.Teacher WHERE Email = N'teacher@school.com')
   AND NOT EXISTS (SELECT 1 FROM dbo.TeacherSchedule WHERE TeacherEmail = N'teacher@school.com')
INSERT INTO dbo.TeacherSchedule (TeacherEmail, DayNo, SortOrder, Subject, Room, Grade) VALUES
    (N'teacher@school.com', 1, 1, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 1, 2, N'Calculus', N'Room 205', N'12th'),
    (N'teacher@school.com', 1, 3, N'Geometry', N'Room 201', N'9th'),
    (N'teacher@school.com', 1, 4, N'Algebra I', N'Room 203', N'9th'),
    (N'teacher@school.com', 1, 5, N'Pre-Calculus', N'Room 205', N'11th'),
    (N'teacher@school.com', 1, 7, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 1, 8, N'Math Lab', N'Room 207', N'All'),
    (N'teacher@school.com', 2, 1, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 2, 2, N'Calculus', N'Room 205', N'12th'),
    (N'teacher@school.com', 2, 3, N'Geometry', N'Room 201', N'9th'),
    (N'teacher@school.com', 2, 4, N'Algebra I', N'Room 203', N'9th'),
    (N'teacher@school.com', 2, 5, N'Pre-Calculus', N'Room 205', N'11th'),
    (N'teacher@school.com', 2, 7, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 2, 9, N'Math Club', N'Room 207', N'All'),
    (N'teacher@school.com', 3, 1, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 3, 2, N'Calculus', N'Room 205', N'12th'),
    (N'teacher@school.com', 3, 3, N'Geometry', N'Room 201', N'9th'),
    (N'teacher@school.com', 3, 4, N'Algebra I', N'Room 203', N'9th'),
    (N'teacher@school.com', 3, 5, N'Pre-Calculus', N'Room 205', N'11th'),
    (N'teacher@school.com', 3, 7, N'Department Meeting', N'Conference Room', N'Staff'),
    (N'teacher@school.com', 3, 8, N'Math Lab', N'Room 207', N'All'),
    (N'teacher@school.com', 4, 1, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 4, 2, N'Calculus', N'Room 205', N'12th'),
    (N'teacher@school.com', 4, 3, N'Geometry', N'Room 201', N'9th'),
    (N'teacher@school.com', 4, 4, N'Algebra I', N'Room 203', N'9th'),
    (N'teacher@school.com', 4, 5, N'Pre-Calculus', N'Room 205', N'11th'),
    (N'teacher@school.com', 4, 7, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 4, 9, N'Tutoring', N'Room 207', N'All'),
    (N'teacher@school.com', 5, 1, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 5, 2, N'Calculus', N'Room 205', N'12th'),
    (N'teacher@school.com', 5, 3, N'Geometry', N'Room 201', N'9th'),
    (N'teacher@school.com', 5, 4, N'Algebra I', N'Room 203', N'9th'),
    (N'teacher@school.com', 5, 5, N'Pre-Calculus', N'Room 205', N'11th'),
    (N'teacher@school.com', 5, 7, N'Algebra II', N'Room 201', N'10th'),
    (N'teacher@school.com', 5, 8, N'Math Lab', N'Room 207', N'All');
GO

/* ---------- Student portal data for complete navigation ---------- */
IF COL_LENGTH(N'dbo.Stud', N'ClassNo') IS NULL
    ALTER TABLE dbo.Stud ADD ClassNo INT NULL;
GO
UPDATE dbo.Stud SET ClassNo = 4 WHERE EnrlNo = N'ENR001' AND ClassNo IS NULL;
GO
IF OBJECT_ID(N'dbo.StudentFees', N'U') IS NULL
CREATE TABLE dbo.StudentFees (
    Id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_StudentFees PRIMARY KEY,
    EnrlNo NVARCHAR(30) NOT NULL CONSTRAINT FK_StudentFees_Stud REFERENCES dbo.Stud(EnrlNo) ON DELETE CASCADE,
    FeeName NVARCHAR(100) NOT NULL, Amount DECIMAL(10,2) NOT NULL, DueDate DATE NOT NULL,
    Status NVARCHAR(30) NOT NULL CONSTRAINT DF_StudentFees_Status DEFAULT N'Pending'
);
GO
IF OBJECT_ID(N'dbo.StudentExams', N'U') IS NULL
CREATE TABLE dbo.StudentExams (
    Id INT IDENTITY(1,1) NOT NULL CONSTRAINT PK_StudentExams PRIMARY KEY,
    EnrlNo NVARCHAR(30) NOT NULL CONSTRAINT FK_StudentExams_Stud REFERENCES dbo.Stud(EnrlNo) ON DELETE CASCADE,
    ExamName NVARCHAR(100) NOT NULL, Subject NVARCHAR(100) NOT NULL, ExamDate DATE NOT NULL,
    Marks DECIMAL(10,2) NULL, MaxMarks DECIMAL(10,2) NOT NULL
);
GO
IF NOT EXISTS (SELECT 1 FROM dbo.StudentFees WHERE EnrlNo=N'ENR001')
INSERT INTO dbo.StudentFees (EnrlNo,FeeName,Amount,DueDate,Status) VALUES
(N'ENR001',N'Tuition Fee',15000,'2026-10-15',N'Pending'),
(N'ENR001',N'Library Fee',1000,'2026-11-01',N'Paid');
GO
IF NOT EXISTS (SELECT 1 FROM dbo.StudentExams WHERE EnrlNo=N'ENR001')
INSERT INTO dbo.StudentExams (EnrlNo,ExamName,Subject,ExamDate,Marks,MaxMarks) VALUES
(N'ENR001',N'Unit Test 1',N'Maths','2026-09-20',42,50),
(N'ENR001',N'Unit Test 1',N'Science','2026-09-22',45,50),
(N'ENR001',N'Mid Term',N'English','2026-10-20',NULL,100);
GO

SELECT 'Users' AS TableName, COUNT(*) AS [Rows] FROM dbo.Users
UNION ALL SELECT 'Teacher', COUNT(*) FROM dbo.Teacher
UNION ALL SELECT 'Stud', COUNT(*) FROM dbo.Stud
UNION ALL SELECT 'Courses', COUNT(*) FROM dbo.Courses
UNION ALL SELECT 'CourseModules', COUNT(*) FROM dbo.CourseModules
UNION ALL SELECT 'ClassTimetable', COUNT(*) FROM dbo.ClassTimetable
UNION ALL SELECT 'SchedulePeriods', COUNT(*) FROM dbo.SchedulePeriods
UNION ALL SELECT 'TeacherSchedule', COUNT(*) FROM dbo.TeacherSchedule;
GO
