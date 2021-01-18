CREATE TABLE MultipleOptionAnswer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	AnswerId INT,
	Options VARCHAR(100),
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Answer_MultipleOptionsAnswer
	      FOREIGN KEY(AnswerId) 
		  REFERENCES Answer(Id)
		  ON DELETE CASCADE
);