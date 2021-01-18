CREATE TABLE ImageQuestion
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	QuestionId INT,
	ImagePath VARCHAR(300),
	LastModification DATE,
	PRIMARY KEY (Id),
	CONSTRAINT FK_Question_ImageQuestion
	      FOREIGN KEY(QuestionId) 
		  REFERENCES Question(Id)
		  ON DELETE CASCADE
);