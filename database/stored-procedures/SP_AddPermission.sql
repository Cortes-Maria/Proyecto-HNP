CREATE OR REPLACE PROCEDURE SP_AddPermission(pPermissionId INT, pUserTypeId INT)
AS
$BODY$
BEGIN
	IF NOT EXISTS (SELECT Id 
			   	   FROM PermissionXUserType PXUT 
			       WHERE PXUT.UserTypeId = pUserTypeId AND PXUT.PermissionId = pPermissionId)
	THEN 
		INSERT INTO PermissionXUserType(PermissionId, UserTypeId)
		VALUES (pPermissionId, pUserTypeId);
		COMMIT;
	ELSE
		RAISE NOTICE 'Ese permiso ya esta asignado al tipo de usuario indicado';
		ROLLBACK;
	END IF;
END;
$BODY$
LANGUAGE plpgsql;