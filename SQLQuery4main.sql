create database storeprocedure;
use storeprocedure;

create table student_details1(S_ID INT NOT NULL IDENTITY(1,1),S_NAME VARCHAR(50), S_ROLL_NO INT, S_AGE INT,S_DEPARTMENT VARCHAR(50));

drop procedure dbo.procedure2;

GO
CREATE PROCEDURE dbo.procedure2
@s_id int,
@student_name varchar(50),
@roll_no int,
@age int,
@department varchar(50)
AS
BEGIN

INSERT INTO student_details1(S_NAME, S_ROLL_NO, S_AGE, S_DEPARTMENT)
VALUES(@student_name, @roll_no, @age, @department)
SET @S_ID= SCOPE_IDENTITY()
END 

EXEC dbo.procedure2
@S_ID=1,
@student_name='SHIVALI', 
@roll_no=10, 
@age=20, 
@department='BIOMED';

SELECT *
FROM student_details1;

drop procedure dbo.procedureread;

GO
CREATE PROCEDURE dbo.procedureread
@s_id int
AS
BEGIN
SELECT S_ID,S_NAME,S_DEPARTMENT
FROM student_details1
where (S_ID=@s_id)
END

EXEC dbo.procedureread
@S_ID=4;

GO
CREATE PROCEDURE dbo.updateprocedure1
@department varchar(50),
@roll_no int
AS
BEGIN
UPDATE student_details1
SET S_DEPARTMENT=@department
WHERE (S_ROLL_NO =@roll_no)
END
 
EXECUTE dbo.updateprocedure1
@department='ECE',
@roll_no=4;

GO
CREATE PROCEDURE dbo.updateprocedure2
@department varchar(50),
@roll_no int,
@s_id int
AS
BEGIN
UPDATE student_details1
SET S_DEPARTMENT=@department
WHERE (S_ID =@s_id)
END

GO
CREATE PROCEDURE dbo.updateprocedure4
@department varchar(50),
@roll_no int,
@s_id int
AS
BEGIN
UPDATE student_details1
SET S_DEPARTMENT=@department,
 S_ROLL_NO=@roll_no
WHERE (S_ID =@s_id)
END 

EXEC dbo.updateprocedure4
@roll_no=108,
@department='MECH',
@s_id=8;


select *
from student_details1;

GO
CREATE PROCEDURE dbo.deleteprocedure
@s_id int 
AS
BEGIN
DELETE 
FROM student_details1
WHERE (S_ID =@s_id)
END 

EXEC dbo.deleteprocedure
@s_id=1;

GO
CREATE PROCEDURE dbo.deleteprocedure1
@s_id int 
AS
BEGIN
DELETE S_DEPARTMENT
FROM student_details1
WHERE (S_ID =@s_id)
END 

EXEC dbo.deleteprocedure1
@s_id=10
;
 














