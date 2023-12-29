
#QUESTIONS
#1-- what is the gender breakdown of employees in the company

SELECT gender ,count(*) AS count
FROM HR
WHERE age >= 18 
GROUP BY gender;

#2 what is the race/ethnicity breakdown of all employees

SELECT race, count(*) AS count
FROM hr
WHERE age >=18 
GROUP BY race
ORDER BY count(*) DESC;

#3 what is the age distrubution of employees in the company

SELECT
 min(age) AS youngest,
 max(age) AS oldest
FROM hr
WHERE age>=18;

SELECT 
 CASE 
  WHEN age >=18 AND age <=24 THEN '18-24'
  WHEN age >=25 AND age <=34 THEN '25-34'
  WHEN age >=35 AND age <=44 THEN '35-44'
  WHEN age >=45 AND age <=54 THEN '44-54'
  WHEN age >=55 AND age <=64 THEN '55-64'
  ELSE '65+'
  END AS age_group,
  COUNT(*) AS count
  FROM hr
  WHERE AGE >=18
  GROUP BY age_group
  ORDER BY age_group;
  
  
  SELECT 
 CASE 
  WHEN age >=18 AND age <=24 THEN '18-24'
  WHEN age >=25 AND age <=34 THEN '25-34'
  WHEN age >=35 AND age <=44 THEN '35-44'
  WHEN age >=45 AND age <=54 THEN '44-54'
  WHEN age >=55 AND age <=64 THEN '55-64'
  ELSE '65+'
  END AS age_group,gender,
  COUNT(*) AS count
  FROM hr
  WHERE AGE >=18
  GROUP BY age_group,gender
  ORDER BY age_group,gender;
  
  #4. How many employees work at headquarters versus remote locations?
  
  SELECT location , count(*) AS count
  FROM hr
  WHERE age>=18 
  GROUP BY location;

#6. How does the gender distribution vary across departments and job titles?

SELECT department, gender, COUNT(*) AS count
FROM hr
WHERE age>=18 
GROUP BY department, gender
ORDER BY department;


-- 7. What is the distribution of job titles across the company?

SELECT jobtitle, COUNT(*) AS count
FROM HR
WHERE age >=18
GROUP BY jobtitle
ORDER BY jobtitle DESC;

#9. What is the distribution of employees across locations by city and state?


SELECT location_state, COUNT(*) AS count
FROM hr
WHERE age>= 18 
GROUP BY location_state
ORDER BY count DESC;


#11. What is the tenure distribution for each department?
SELECT department, round(avg(datediff(CURRENT_DATE, hire_date)/365),0) AS avg_tenure
FROM hr
WHERE hire_date <= current_date() AND age >=18
GROUP BY department;

SELECT emp_id, first_name, last_name, gender, hire_date,location, location_state, department, jobtitle, race, age
FROM hr
ORDER BY emp_id;
  