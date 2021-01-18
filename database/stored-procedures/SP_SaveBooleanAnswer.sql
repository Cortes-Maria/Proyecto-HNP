CREATE OR REPLACE PROCEDURE SP_SaveBooleanAnswer
(
	pUserId INT,
	pQuestionId INT,
	pAnswer BOOLEAN,
	status INOUT INT
)
AS $BODY$
DECLARE
VarAnswerTypeId INT;
VarLastAnswerId INT;
BEGIN
    -- Check if user exists
    IF EXISTS (SELECT Id FROM UserData UD WHERE UD.Id = pUserId)
	THEN
		-- Check if question exists
	    IF EXISTS (SELECT Id FROM Question Q WHERE Q.Id = pQuestionId)
	    THEN
	   		-- Check if answer type exists
	   		SELECT Id INTO VarAnswerTypeId FROM AnswerType AT WHERE AT.Name = 'Boolean';
	   		IF NOT FOUND
	   		THEN
	   			ROLLBACK;
	   			status := -3; -- Answer type doesn't exist
	   		ELSE
	   			INSERT INTO Answer(UserId, AnswerTypeId, LastModification)
	   			VALUES
	   			(
	   				pUserId,
	   				VarAnswerTypeId,
	   				CURRENT_DATE
	   			)
	   			RETURNING Id INTO VarLastAnswerId;

	   			INSERT INTO BooleanAnswer(AnswerId, Value)
	   			VALUES
	   			(
	   				VarLastAnswerId,
	   				pAnswer
	   			);

	   			INSERT INTO QuestionXAnswer(QuestionId, AnswerId)
	   			VALUES
	   			(
	   				pQuestionId,
	   				VarLastAnswerId
	   			);

	   			COMMIT;
	   			status := 1; -- Answer saved correctly
	   		END IF;	

	    ELSE
	   		status := -2; -- Question with given id doesn't exist
	    END IF;
	ELSE
		status := -1; -- User with given id doesn't exist.
	END IF;
END; $BODY$
LANGUAGE plpgsql;