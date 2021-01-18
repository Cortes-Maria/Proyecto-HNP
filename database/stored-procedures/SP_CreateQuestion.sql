CREATE OR REPLACE PROCEDURE SP_CreateQuestion
(
	pFormName VARCHAR(100),
	pDescription VARCHAR(300),
	pQuestionTypeName VARCHAR(100),
	status INOUT INT
)
AS $BODY$
DECLARE
VarFormId INT;
VarQuestionId INT;
VarQuestionTypeId INT;
BEGIN
    -- Check if form exists already
    SELECT Id INTO VarFormId FROM Form F WHERE F.Name = pFormName;
	IF NOT FOUND 
	THEN
	    --RAISE EXCEPTION 'TypeId % not found', pFormType;
	    ROLLBACK;
	    status := -1; -- The form with the given name doesn't exist.
	ELSE
		-- Check if question exists already
		SELECT Id INTO VarQuestionId FROM Question Q WHERE Q.Description = pDescription;
		IF NOT FOUND 
		THEN
			-- Check if Question Type exists
			SELECT Id INTO VarQuestionTypeId FROM QuestionType QT WHERE QT.Name = pQuestionTypeName;
			IF NOT FOUND 
			THEN
				ROLLBACK;
				status:= -3; -- The question type doesn't exist
			ELSE
				INSERT INTO Question(Description, QuestionTypeId, LastModification)
				VALUES
				(
					pDescription,
					VarQuestionTypeId,
					CURRENT_DATE
				);

				INSERT INTO FormXQuestion(FormId, QuestionId)
				VALUES
				(
					VarFormId,
					VarQuestionId
				);

				COMMIT;
				status := 1; -- Question saved correctly
			END IF;
		ELSE 
			ROLLBACK;
			status := -2; -- The question already exists.
		END IF;
		-- RAISE EXCEPTION 'El formulario ingresado ya existe en la base de datos';
	END IF;
END; $BODY$
LANGUAGE plpgsql;