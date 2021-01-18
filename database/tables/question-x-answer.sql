CREATE TABLE QuestionXAnswer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	QuestionId INT,
	AnswerId INT,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Question_QuestionXAnswer
	      FOREIGN KEY(QuestionId) 
		  REFERENCES Question(Id)
		  ON DELETE CASCADE,
	CONSTRAINT FK_Answer_QuestionXAnswer
	      FOREIGN KEY(AnswerId) 
		  REFERENCES Answer(Id)
		  ON DELETE CASCADE
);