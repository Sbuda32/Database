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

#Creating Orders Table to hold data about orders that have to be shipped
CREATE TABLE Orders( 
  OrderID INT auto_increment, 
  OrderDate DATE NOT NULL, 
  RequiredDate DATE NOT NULL, 
  ShippedDate DATE NOT NULL, 
  Status VARCHAR(50) NOT NULL, 
  PRIMARY KEY(OrderID)
);

#Creating Payments TABLE to keep track of customers that have paid
CREATE TABLE Payment( 
  PaymentID INT auto_increment PRIMARY KEY, 
  CustomerID INT NOT NULL, 
  PaymentDate DATE, 
  Amount DECIMAL(9,2) NOT NULL, 
  FOREIGN KEY fk_customer_id(CustomerID) 
  REFERENCES Customer(CustomerID) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE
);
