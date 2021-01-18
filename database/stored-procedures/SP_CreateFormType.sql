CREATE OR REPLACE PROCEDURE SP_CreateFormType
(
	pName VARCHAR(100),
	status INOUT INT
)
AS $BODY$
BEGIN
    -- Check if form type exists already
    IF NOT EXISTS(SELECT 1 FROM Form F WHERE F.Name = pName) 
    THEN 
		INSERT INTO FormType (Name, LastModification)
    	VALUES
    	(
    		pName,
    		CURRENT_DATE
    	);
    	COMMIT;
    	status := 1; -- Form type created succesfully.
    ELSE
    	-- RAISE EXCEPTION 'El tipo de formulario ingresado ya existe en la base de datos';
    	ROLLBACK;
    	status := -2; -- The form type already exists in the database.
    END IF;
END; $BODY$
LANGUAGE plpgsql;