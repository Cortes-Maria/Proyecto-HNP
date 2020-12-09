CREATE OR REPLACE PROCEDURE SP_GetPassword (pIdentifier VARCHAR(200), INOUT outPassword VARCHAR(200), INOUT status INT)
AS $BODY$

BEGIN
	
	SELECT Password INTO outPassword
	FROM UserData UD
	WHERE UD.UserName = pIdentifier OR UD.Email = pIdentifier;

	IF FOUND THEN
		status := 1; -- 1 means success
	ELSE
		status := -1; -- -1 means failure
	END IF;
	

END; $BODY$
LANGUAGE plpgsql;