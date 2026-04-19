select*from patient_data;
select count(*) from patient_data;


-- overall readmission
SELECT 
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = '1' THEN 1 ELSE 0 END) AS readmitted_count,
    ROUND(
        SUM(CASE WHEN readmitted = '1' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS readmission_rate
FROM patient_data;
--readmission by age group
SELECT 
    age_group,
    COUNT(*) AS total,
    SUM(CASE WHEN readmitted = '1' THEN 1 ELSE 0 END) AS readmitted
FROM patient_data
GROUP BY age_group
ORDER BY readmitted DESC;

--readmission by region
SELECT 
    region,
    COUNT(*) AS total,
    SUM(CASE WHEN readmitted = '1' THEN 1 ELSE 0 END) AS readmitted
FROM patient_data
GROUP BY region
ORDER BY readmitted DESC;

--impact of previous readmission
SELECT 
    previous_readmissions,
    COUNT(*) AS patients,
    SUM(CASE WHEN readmitted = '1' THEN 1 ELSE 0 END) AS readmitted
FROM patient_data
GROUP BY previous_readmissions
ORDER BY previous_readmissions;

--length of stay vs readmission
SELECT 
    length_of_stay,
    COUNT(*) AS total,
    SUM(CASE WHEN readmitted = '1' THEN 1 ELSE 0 END) AS readmitted
FROM patient_data
GROUP BY length_of_stay
ORDER BY length_of_stay;

--high risk patient
SELECT
    patient_id,
    age,
    diagnosis,
    readmission_risk_score
FROM patient_data
WHERE readmission_risk_score > 0.7
ORDER BY readmission_risk_score DESC;

--treatment type
SELECT 
    treatment_type,
    COUNT(*) AS total,
    SUM(readmitted) AS readmitted
FROM patient_data
GROUP BY treatment_type
ORDER BY readmitted DESC;

--discharge analysis
SELECT 
    discharge_disposition,
    COUNT(*) AS total,
    SUM(readmitted) AS readmitted
FROM patient_data
GROUP BY discharge_disposition
ORDER BY readmitted DESC;

select*from patient_data;

