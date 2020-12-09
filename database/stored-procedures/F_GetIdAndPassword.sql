CREATE OR REPLACE FUNCTION F_GetIdAndPassword (pIdentifier VARCHAR(200))
RETURNS TABLE (id INT, password VARCHAR)
AS 
$BODY$
	
	SELECT IdNumber, Password
	FROM UserData UD
	WHERE UD.UserName = pIdentifier OR UD.Email = pIdentifier;
$BODY$
LANGUAGE sql;