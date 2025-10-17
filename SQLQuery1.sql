CREATE DATABASE ClaimsDB;
GO
USE ClaimsDB;
GO

CREATE TABLE Lecturers (
    LecturerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    Email NVARCHAR(100),
    TotalHours DECIMAL(10,2) DEFAULT 0,
    TotalPaid DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    LecturerID INT FOREIGN KEY REFERENCES Lecturers(LecturerID),
    Hours DECIMAL(10,2),
    Amount DECIMAL(10,2),
    SubmissionDate DATETIME,
    LastUpdated DATETIME,
    Status NVARCHAR(50) DEFAULT 'Pending'
);

CREATE TABLE Documents (
    DocumentID INT PRIMARY KEY IDENTITY(1,1),
    ClaimID INT FOREIGN KEY REFERENCES Claims(ClaimID),
    FileName NVARCHAR(100),
    FilePath NVARCHAR(255),
    UploadDate DATETIME
);

