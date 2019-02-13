#Creating Customer Table to hold customer data
CREATE TABLE Customer( 
  CustomerID INT auto_increment, 
  FirstName VARCHAR(100) NOT NULL, 
  LastName VARCHAR(100) NOT NULL, 
  Gender VARCHAR(6) NOT NULL, 
  Address TEXT, 
  Phone INT(10), 
  Email VARCHAR(100), 
  City VARCHAR(100), 
  Country VARCHAR(100), 
  PRIMARY KEY(CustomerID)
);

#Creating Table for Employees to hold Employee data
CREATE TABLE Employee( 
  EmployeeID INT auto_increment, 
  FirstName VARCHAR(50) NOT NULL, 
  LastName VARCHAR(50) NOT NULL, 
  Email VARCHAR(100) NOT NULL, 
  JobTitle VARCHAR(100) NOT NULL, 
  PRIMARY KEY (EmployeeID)
);
