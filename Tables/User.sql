CREATE TABLE UserData
(
	IdNumber INT GENERATED ALWAYS AS IDENTITY,
	UserTypeId INT,
	Name VARCHAR(100),
	LastName VARCHAR(100),
	BirthDate DATE,
	UserName VARCHAR(100),
	Email VARCHAR(200),
	Password VARCHAR(200),
	PRIMARY KEY (IdNumber),
	CONSTRAINT FK_UserType
	      FOREIGN KEY(UserTypeId) 
		  REFERENCES UserType(Id)
		  ON DELETE CASCADE
);