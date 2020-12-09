CREATE OR REPLACE FUNCTION F_GetUserTypePermissions (pUserTypeId INT)
RETURNS TABLE (IdPermission INT)
AS
$BODY$
BEGIN
	IF EXISTS (SELECT UT.Id FROM UserType UT WHERE Ut.Id = pUserTypeId)
	THEN
		RETURN QUERY SELECT PXUT.IdPermission
		FROM PermissionXUserType PXUT
		WHERE PXUT.IdUserType = pUserTypeId;
	ELSE
		RAISE NOTICE 'Ese tipo de usuario no existe';
	END IF;
END;
$BODY$
LANGUAGE plpgsql;