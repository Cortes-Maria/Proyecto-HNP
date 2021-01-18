CREATE TABLE Question
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	Description VARCHAR(300),
	QuestionTypeId INT,
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_QuestionType_Question
	      FOREIGN KEY(QuestionTypeId) 
		  REFERENCES QuestionType(Id)
		  ON DELETE CASCADE
);