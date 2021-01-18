CREATE TABLE Answer
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	UserId INT,
	AnswerTypeId INT,
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_UserData_Answer
	      FOREIGN KEY(UserId) 
		  REFERENCES UserData(Id)
		  ON DELETE CASCADE,
	CONSTRAINT FK_AnswerType_Answer
	      FOREIGN KEY(AnswerTypeId) 
		  REFERENCES AnswerType(Id)
		  ON DELETE CASCADE
);