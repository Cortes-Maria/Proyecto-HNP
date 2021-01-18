CREATE OR REPLACE PROCEDURE SP_CreateForm
(
	pName VARCHAR(100),
	pType VARCHAR(100),
	status INOUT INT
)
AS $BODY$
DECLARE
TypeId INT;
BEGIN
    -- Check if form exists already
    IF NOT EXISTS(SELECT 1 FROM Form F WHERE F.Name = pName) 
    THEN 
    	SELECT Id INTO TypeId FROM FormType FT WHERE FT.Name = pType;
		IF NOT FOUND 
		THEN
		    --RAISE EXCEPTION 'TypeId % not found', pFormType;
		    status := -1; -- The usertype doesn't exist.
		ELSE
			INSERT INTO Form (Name, FormTypeId, LastModification)
	    	VALUES
	    	(
	    		pName,
	    		TypeId,
	    		CURRENT_DATE
	    	);
	    	COMMIT;
	    	status := 1; -- Form created succesfully.
		END IF;   	
    ELSE
    	-- RAISE EXCEPTION 'El formulario ingresado ya existe en la base de datos';
    	ROLLBACK;
    	status := -2; -- The form already exists in the database.
    END IF;
END; $BODY$
LANGUAGE plpgsql;