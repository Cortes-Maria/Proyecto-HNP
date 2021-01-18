CREATE TABLE BooleanAnswer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	AnswerId INT,
	Value BOOLEAN,
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Answer_BooleanAnswer
	      FOREIGN KEY(AnswerId) 
		  REFERENCES Answer(Id)
		  ON DELETE CASCADE
);