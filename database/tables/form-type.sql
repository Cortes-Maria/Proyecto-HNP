CREATE TABLE FormType
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	Name VARCHAR(100),
	LastModification DATE,
	PRIMARY KEY (Id)
);