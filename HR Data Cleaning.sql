CREATE DATABASE HumanResource_Project;

USE HumanResource_Project;

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

DESCRIBE hr;
SELECT birthdate FROM hr;


SET sql_safe_updates= 0;
UPDATE hr
SET birthdate = CASE
 WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'),'%Y-%m-%d')
 WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'),'%Y-%m-%d')
 ELSE null
 END;
 ALTER TABLE hr
 MODIFY COLUMN birthdate  DATE;
 
 UPDATE hr
SET hire_date = CASE
 WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'),'%Y-%m-%d')
 WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'),'%Y-%m-%d')
 ELSE null
 END;
 
UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate != '';
 
 ALTER TABLE hr
 DROP termdate;
 
 ALTER TABLE hr ADD COLUMN  age INT;
 
 UPDATE hr
 SET age = timestampdiff(YEAR, birthdate, CURDATE());
 
 SELECT 
  min(age) AS youngest,
  max(age) AS oldest
FROM hr;

SELECT count(*) FROM hr WHERE age < 18;


 SELECT * FROM hr;


