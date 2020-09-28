CREATE TABLE tblm_Customer(
	CustomerID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Licenseno VARCHAR(50) NOT NULL,
	Name VARCHAR(250) NOT NULL,
	ProviderTypeCode INT,
	Username VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Password VARCHAR(50) NOT NULL,
	Description VARCHAR(max) NOT NULL,
	LogoImagePath VARCHAR(500) NOT NULL,
	FromOffice VARCHAR(5) NOT NULL,
	ToOffice VARCHAR(5) NOT NULL,

)

CREATE TABLE tblm_CustomerDocuments(
	DocumentID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT NOT NULL,
	UploadFilePath VARCHAR(500) NOT NULL,
	DocDescription VARCHAR(max) NOT NULL
	
)

ALTER TABLE tblm_CustomerDocuments ADD CONSTRAINT FK_CUSTOMER FOREIGN KEY (CustomerID)
REFERENCES tblm_Customer(CustomerID)


CREATE TABLE tblm_CustomerContacts(
	ContactID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT NOT NULL,
	ContactPerson VARCHAR(50) NOT NULL,
	Phone VARCHAR(15) NOT NULL,
	Website VARCHAR(250) NOT NULL,
)

ALTER TABLE tblm_CustomerContacts ADD CONSTRAINT FK_CONTACTS FOREIGN KEY (CustomerID)
REFERENCES tblm_Customer(CustomerID)

CREATE TABLE tblm_CustomerLocation(
	LocationID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT NOT NULL,
	GoogleLatitude numeric(18,6) NOT NULL,
	GoogleLongitude numeric(18,6) NOT NULL,
	CountryCode VARCHAR(2) NOT NULL,
	City VARCHAR(50) NOT NULL,
	Address VARCHAR(1000) NOT NULL,
)

ALTER TABLE tblm_CustomerLocation ADD CONSTRAINT FK_LOCATION FOREIGN KEY (CustomerID)
REFERENCES tblm_Customer(CustomerID)