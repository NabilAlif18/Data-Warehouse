CREATE DATABASE OLAP_Electronic

USE OLAP_Electronic

CREATE TABLE CustomerDimension(
CustomerCode INT PRIMARY KEY IDENTITY,
CustomerID CHAR(10),
CustomerName VARCHAR(150),
CustomerGender VARCHAR(150),
CustomerEmail VARCHAR(150)
)



CREATE TABLE StaffDimension(
StaffCode INT PRIMARY KEY IDENTITY,
StaffID CHAR(10),
StaffName VARCHAR (150),
StaffGender VARCHAR (150)
)

CREATE TABLE ElectronicDimension(
ElectronicCode INT PRIMARY KEY IDENTITY,
ElectronicID CHAR(10),
ElectronicName VARCHAR(300),
ElectronicPrice INT,
ElectronicTypeName VARCHAR (250),
ValidFrom DATE,
ValidTo DATE
)

CREATE TABLE SalesFact(
CustomerCode INT,
StaffCode INT,
ElectronicCode INT,
totalSales BIGINT,
AVGSalesTransaction BIGINT 
)

CREATE TABLE TimeDimension(
TimeCode INT PRIMARY KEY IDENTITY,
[Date] Date,
[Day] INT,
[MONTH] INT,
[Quarter] INT,
[Year] INT
)

CREATE TABLE FilterTimeStamp(
TableName VARCHAR(100) PRIMARY KEY,
LastETL datetime)



SELECT * FROM CustomerDimension
SELECT * FROM StaffDimension
SELECT * FROM ElectronicDimension
SELECT * FROM FilterTimeStamp


