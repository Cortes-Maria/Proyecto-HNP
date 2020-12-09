CREATE TABLE Permission
(
	Id INT GENERATED ALWAYS AS IDENTITY,
	Description VARCHAR(200) NOT NULL,
	PermissionType INT NOT NULL,
	PRIMARY KEY (Id),
	CONSTRAINT FK_PermissionType_Permission
		FOREIGN KEY (PermissionType)
		REFERENCES PermissionType(Id)
		ON DELETE CASCADE
)