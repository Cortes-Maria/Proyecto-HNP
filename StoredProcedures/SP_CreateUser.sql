CREATE OR REPLACE PROCEDURE SP_CreateUser 
(
	pUserType VARCHAR,
	pName VARCHAR(100),
	pLastName VARCHAR(100),
	pBirthDate DATE,
	pUserName VARCHAR(100),
	pEmail VARCHAR(200),
	pPassword VARCHAR(200),
	status INOUT INT
)
AS $BODY$
DECLARE
TypeId INT;
BEGIN
    -- Check if user exists already
    IF NOT EXISTS(SELECT 1 FROM UserData UD WHERE UD.UserName = pUserName OR UD.Email = pEmail) 
    THEN 
    	SELECT Id INTO TypeId FROM UserType UT WHERE UT.Type = pUserType;
		IF NOT FOUND 
		THEN
		    --RAISE EXCEPTION 'TypeId % not found', pUserType;
		    status := -1; -- status -1 means failure.
		ELSE
			INSERT INTO UserData (UserTypeId, Name, LastName, BirthDate, UserName, Email, Password)
	    	VALUES
	    	(
	    		TypeId,
	    		pName,
	    		pLastName,
	    		pBirthDate,
	    		pUserName,
	    		pEmail,
	    		pPassword
	    	);
	    	COMMIT;
	    	status := 1; -- status 1 means success.
		END IF;   	
    ELSE
    	--RAISE EXCEPTION 'El usuario ingresado ya existe en la base de datos';
    	ROLLBACK;
    	status := -1; -- status -1 means failure.
    END IF;
END; $BODY$
LANGUAGE plpgsql;