CREATE TABLE Answer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	AnswerTypeId INT,
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_AnswerType_Answer
	      FOREIGN KEY(AnswerTypeId) 
		  REFERENCES AnswerType(Id)
		  ON DELETE CASCADE
);