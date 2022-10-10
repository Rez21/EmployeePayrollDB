-----------UC1 create database -------------
create database PayrollService

---------- choose database ------------
use PayrollService

----------- UC2 Create table --------------
CREATE TABLE EmployeePayRoll
(
EmployeeID int IDENTITY(1,1) primary key,
Name varchar(255),
Salary float,
StartDate date
);


----------UC 3 Add employee to table -----------
INSERT INTO EmployeePayRoll (Salary, Name, StartDate)
VALUES(23000.0, 'Raghav', getDate());

INSERT INTO EmployeePayRoll (Salary, Name, StartDate)
VALUES (23000, 'Pravin', '2022-04-03'),
	   (24000, 'Prasoon', '2022-04-28'),
	   (25000, 'Preeti', '2022-05-08'),
	   (26000, 'Sandeep', '2022-01-01'),
	   (23500, 'Darshan', '2022-02-01');

------------UC 4 retrive all data from table ----------
SELECT * FROM EmployeePayRoll


---------UC 5 select recoed based on date range---------
SELECT * FROM EmployeePayRoll
WHERE StartDate BETWEEN CAST('2022-04-01' As Date) AND getDate();

---- select based on id range-------
SELECT * FROM EmployeePayRoll
WHERE EmployeeID BETWEEN 4 AND 6;

------------ UC 6 Add gender column and update the table ------------
ALTER TABLE EmployeePayRoll
ADD Gender char(1);

--------- Update query --------
UPDATE EmployeePayRoll
SET Gender = 'M' WHERE EmployeeID = 7;

------------UC 7 Sum AVG MIN MAX -------------
SELECT SUM(Salary) as TotalSalary from EmployeePayRoll
SELECT SUM(Salary) as TotalSalary, Gender from EmployeePayRoll GROUP BY Gender
SELECT AVG(Salary) as AvgSalary, Gender from EmployeePayRoll GROUP BY Gender
SELECT COUNT(EmployeeID) as NumOfEmp from EmployeePayRoll
SELECT COUNT(EmployeeID) as NumOfEmp,Gender from EmployeePayRoll GROUP BY Gender
--------get min salary --------
SELECT MIN(Salary) as MinumumSalary,Gender from EmployeePayRoll GROUP BY Gender
----------get records with max salary-------------
SELECT * FROM EmployeePayRoll where Salary = (SELECT MAX(Salary) from EmployeePayRoll)



----------------------UC8 Alter table to add more attributes--------
ALTER TABLE EmployeePayRoll
ADD Phone bigint;

ALTER TABLE EmployeePayRoll
ADD Department varchar(200) NOT NULL DEFAULT 'IT';

ALTER TABLE EmployeePayRoll
ADD Address varchar(200) DEFAULT 'Maharashtra';