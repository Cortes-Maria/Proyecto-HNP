CREATE OR REPLACE FUNCTION F_GetUserInfo (pId INT)
RETURNS TABLE (Name VARCHAR(100), LastName VARCHAR(100), BirthDate DATE, UserName VARCHAR(100), Email VARCHAR(200))
AS
$BODY$
BEGIN
	IF EXISTS (SELECT Id FROM UserData WHERE Id = pId)
	THEN
		RETURN QUERY SELECT UD.Name, UD.LastName, UD.BirthDate, UD.UserName, UD.Email
		FROM UserData UD 
		WHERE UD.Id = pId;
	ELSE
		RAISE NOTICE 'Ese usuario no existe';
	END IF;
END;
$BODY$
LANGUAGE plpgsql;
