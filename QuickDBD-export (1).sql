-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE Customer (
    CustomerID int   NOT NULL,
    FirstName varchar(50)   NOT NULL,
    LastName varchar(50)   NOT NULL,
    FullName varchar(50)   NOT NULL,
    CONSTRAINT pk_Customer PRIMARY KEY (
        CustomerID
     )
);

CREATE TABLE Employee (
    EmployeeID int   NOT NULL,
    ManagerID int   NULL,
    FirstName varchar(50)   NOT NULL,
    LastName varchar(50)   NOT NULL,
    FullName varchar(50)   NOT NULL,
    JobTitle varchar(50)   NOT NULL,
    OrganizationLevel int   NOT NULL,
    MaritalStatus varchar(50)   NOT NULL,
    Gender varchar(50)   NOT NULL,
    Territory varchar(50)   NULL,
	Country varchar(50)   NULL,
    "Group" varchar(50)   NULL,
    CONSTRAINT pk_Employee PRIMARY KEY (
        EmployeeID
     )
);

CREATE TABLE OrderDetail (
    SalesOrderID int   NOT NULL,
    SalesOrderDetailID int   NOT NULL,
    OrderDate date   NOT NULL,
    DueDate date   NOT NULL,
    ShipDate date   NOT NULL,
    EmployeeID int   NOT NULL,
    CustomerID int   NOT NULL,
    Subtotal decimal   NOT NULL,
    TaxAmt decimal   NOT NULL,
    Freight decimal   NOT NULL,
    TotalDue decimal   NOT NULL,
    ProductID int   NOT NULL,
    OrderQty int   NOT NULL,
    UnitPrice decimal   NOT NULL,
    UnitPriceDiscount decimal   NOT NULL,
    LineTotal decimal   NOT NULL,
    CONSTRAINT pk_Order PRIMARY KEY (
        SalesOrderDetailID
     )
);

CREATE TABLE ProductCategory (
    CategoryID int   NOT NULL,
    CategoryName varchar(200)   NOT NULL,
    CONSTRAINT pk_ProductCategory PRIMARY KEY (
        CategoryID
     )
);

CREATE TABLE Product (
    ProductID int   NOT NULL,
    ProductNumber varchar(200)   NOT NULL,
    ProductName varchar(200)   NOT NULL,
    ModelName varchar(200)   NOT NULL,
    MakeFlag boolean   NOT NULL,
    StandardCost decimal   NOT NULL,
    ListPrice decimal   NOT NULL,
    SubCategoryID int   NOT NULL,
    CONSTRAINT pk_Product PRIMARY KEY (
        ProductID
     )
);

CREATE TABLE ProductSubcategory (
    SubCategoryID int   NOT NULL,
    CategoryID int   NOT NULL,
    SubCategoryName varchar(200)   NOT NULL,
    CONSTRAINT pk_ProductSubcategory PRIMARY KEY (
        SubCategoryID
     )
);

CREATE TABLE VendorProduct (
    ProductID int   NOT NULL,
    VendorID int   NOT NULL
);

CREATE TABLE Vendor (
    VendorID int   NOT NULL,
    VendorName varchar(200)   NOT NULL,
    AccountNumber varchar(200)   NOT NULL,
    CreditRating int   NOT NULL,
    ActiveFlag boolean   NOT NULL,
    CONSTRAINT pk_Vendor PRIMARY KEY (
        VendorID
     )
);

ALTER TABLE OrderDetail ADD CONSTRAINT fk_Order_EmployeeID FOREIGN KEY(EmployeeID)
REFERENCES Employee (EmployeeID);

ALTER TABLE OrderDetail ADD CONSTRAINT fk_Order_CustomerID FOREIGN KEY(CustomerID)
REFERENCES Customer (CustomerID);

ALTER TABLE OrderDetail ADD CONSTRAINT fk_Order_ProductID FOREIGN KEY(ProductID)
REFERENCES Product (ProductID);

ALTER TABLE Product ADD CONSTRAINT fk_Product_SubCategoryID FOREIGN KEY(SubCategoryID)
REFERENCES ProductSubcategory (SubCategoryID);

ALTER TABLE ProductSubcategory ADD CONSTRAINT fk_ProductSubcategory_CategoryID FOREIGN KEY(CategoryID)
REFERENCES ProductCategory (CategoryID);



