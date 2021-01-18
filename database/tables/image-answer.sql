CREATE TABLE ImageAnswer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	AnswerId INT,
	ImagePath VARCHAR(300),
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Answer_ImageAnswer
	      FOREIGN KEY(AnswerId) 
		  REFERENCES Answer(Id)
		  ON DELETE CASCADE
);