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

#Creating a Product to hold product data
CREATE TABLE Product( 
  ProductID INT auto_increment PRIMARY KEY, 
  ProductName VARCHAR(100) NOT NULL, 
  Description TEXT, 
  BuyPrice DECIMAL(9,2)
);

#Inserting customer records to Customer Table
INSERT INTO Customer 
  VALUES (1, 'John', 'Hibert', 'Male', '284 chaucer st', 084789657, 'john@gmail.com', 'Johannesburg', 'South Africa');
INSERT INTO Customer 
  VALUES (2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa');
INSERT INTO Customer 
  VALUES (3, 'Leon', 'Glen', 'Male', '81 Everton Rd,Gillits', 0820832830, 'Leon@gmail.com', 'Durban', 'South Africa');
INSERT INTO Customer 
  VALUES (4, 'Charl', 'Muller', 'Male', '290A Dorset Ecke', +448568725, 'Charl.muller@yahoo.com', 'Berlin', 'Germany');
INSERT INTO Customer 
  VALUES (5, 'Julia', 'Stein', 'Female', '2 Wernerring', +448672445, 'Js234@yahoo.com', 'Frankfurt', 'Germany');

#Inserting employees records to Employee Table
INSERT INTO Employee 
  VALUES(1, 'Kani', 'Matthew', 'Kmat@gmail.com', 'Manager');
INSERT INTO Employee 
  VALUES(2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');
INSERT INTO Employee 
  VALUES(3, 'Gideon', 'Maduku', 'Gm@gmail.com', 'Accountant');
