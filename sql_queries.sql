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
  
#Inserting records for orders in the Orders Table
INSERT INTO Orders 
  VALUES(1, '2018-09-01', '2018-09-05', '2018-09-02', 'Not Shipped');
INSERT INTO Orders 
  VALUES(2, '2018-09-01', '2018-09-04', '2018-09-03', 'Shipped');
INSERT INTO Orders 
  VALUES(3, '2018-09-01', '2018-09-03', '2018-09-02', 'Not Shipped');

#Inserting payment records to Payment Table
INSERT INTO Payment 
  VALUES(1, 1, '2018-09-01', 100);
INSERT INTO Payment 
  VALUES(2, 2, '2018-09-01', 250.75);

#Inserting records for products in the Product Table
INSERT INTO Product 
  VALUES(1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75);
INSERT INTO Product 
  VALUES(2, 'Classic Car', 'Turnable front wheels, steering function', 550.75);
 INSERT INTO Product 
  VALUES(3, 'Sports car', 'Turnable front wheels, steering function', 700.60);

#Query to select all the records on the Customer table
SELECT * FROM Customer;

#Query to select all the names of all the customers in the Customer table
SELECT FirstName FROM Customer;

#Querying the first name of a customer with CustomerID 1 in the Customer Table
SELECT FirstName FROM Customer 
WHERE CustomerID=1;

#Updating the Customer table by changing the name and surname of the customer with CustomerID 1 in the Customer Table
UPDATE Customer 
SET 
  FirstName='Lerato', 
  LastName='Mabitso' 
WHERE 
  CustomerID=1;

#Deleting a customer with CustomerID 2 in the Customer Table
DELETE FROM Customer 
WHERE CustomerID=2;

#Selecting all the unique values from Product Table
SELECT DISTINCT * FROM Product;

#Query for selecting maximum payment in the Payment Table
SELECT MAX(Amount) AS Payment 
FROM Payment;

#Query to select all records in the Customer table sorted by the Country column
SELECT * FROM Customer ORDER BY Country;

#Query to select product prices that range between R100 and R600
SELECT * FROM Product 
WHERE BuyPrice 
BETWEEN 100 AND 600;

#Query to select all customers from Germeny in the city Berlin in the Customer Table
SELECT * FROM Customer 
WHERE Country='Germany' AND City='Berlin';

#Query to select all customers from the city of Johannesburg or Cape Town in the Customer Table
SELECT * FROM Customer 
WHERE City='Cape Town' OR City='Johannesburg';

#Query to select prices that are greater than R500 in the Product Table
SELECT * FROM Product 
WHERE BuyPrice>500;

#Query to return the sum of all the amounts in the Payment Table
SELECT SUM(Amount) AS 'Total_Amount' FROM Payment;

#Query to count the number of Orders shipped in the Orders Table
SELECT COUNT(Status) AS Num_Of_Shipped_Orders 
FROM Orders WHERE Status='Shipped';

#Query returning average price of all prodcts in Rands and Dollers in the Product Table
SELECT CONCAT('$', FORMAT(AVG(BuyPrice * 12), 2)) AS Avg_Dollars, CONCAT('R', FORMAT(AVG(BuyPrice), 2)) AS Avg_Rands 
       FROM Product;

 #Query to join to tables using the INNER JOIN, the results is two tables the Orders Table with information abput the 
 #customers from the Customer Table
 SELECT Orders.OrderID, Customer.FirstName, Customer.LastName, Customer.Email FROM Orders 
 INNER JOIN Customer 
 ON Orders.OrderID=Customer.CustomerID;
