CREATE TABLE UniqueOptionAnswer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	AnswerId INT,
	Option VARCHAR(3),
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Answer_UniqueOptionAnswer
	      FOREIGN KEY(AnswerId) 
		  REFERENCES Answer(Id)
		  ON DELETE CASCADE
);