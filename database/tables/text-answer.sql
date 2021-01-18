CREATE TABLE TextAnswer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	AnswerId INT,
	Value TEXT,
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Answer_TextAnswer
	      FOREIGN KEY(AnswerId) 
		  REFERENCES Answer(Id)
		  ON DELETE CASCADE
);