--------- Display all records from the Patients table.
SELECT * FROM PATIENTS;

--------- Display only patient names and their ages.
SELECT PATIENT_NAME,AGE FROM PATIENTS;

--------- Find all patients who belong to Pune.
SELECT * FROM PATIENTS
WHERE CITY ="PUNE";

--------- Display patients whose age is greater than 40.
SELECT * FROM PATIENTS
WHERE AGE > 40;

--------- Find all female patients.
SELECT * FROM PATIENTS
WHERE GENDER = "FEMALE";

--------- Display patients whose age is between 25 and 40.
SELECT * FROM PATIENTS 
WHERE AGE BETWEEN 25 AND 40;

--------- Display all doctors and their specializations.
SELECT DOCTOR_NAME,SPECIALIZATION FROM DOCTORS;

--------- Find doctors who belong to the Cardiology department.
select * from doctors 
where specialization = "cardiology";

--------- Display all departments located on the First Floor.
select * from departments 
where location = "First Floor";

--------- Find appointments with Completed status.
select * from APPOINTMENTS
WHERE STATUS = "COMPLETED";

--------- Display all appointments with Pending status.
SELECT * FROM APPOINTMENTS
WHERE STATUS = "PENDING";

--------- Find all appointments scheduled after 15 October 2026.
SELECT * FROM APPOINTMENTS
WHERE APPOINTMENT_DATE > '2026-10-15';

--------- Display payments where the payment status is Paid.
select * from payments
where payment_status = "paid";

--------- Find payments made using UPI.
select * from payments
where payment_method = "UPI";

--------- Display prescriptions for Paracetamol.
select * from prescriptions
where medicine_name = "paracetamol";

--------- Display patients in ascending order of their names.
select * from patients 
order by patient_name asc;

--------- Display patients in descending order of their ages.
select * from patients 
order by age desc;

--------- Find patients whose names start with 'A'.
select * from patients 
where patient_name regexp "^A";

--------- Display unique cities from the Patients table.
select distinct city from patients;

--------- Find the top 5 highest payment amounts.
select * from payments
order by amount desc 
limit 5;

-------- A. Aggregate Functions
-------- 21. Count the total number of patients.
select count(*) from patients;

-------- 22. Find the average age of all patients.
select avg(age) from patients;

-------- 23. Find the youngest and oldest patient.
select min(age) from patients;
select max(age) from patients;

-------- 24. Count the number of male and female patients.
select gender,count(gender) from patients
group by gender;

-------- 25. Find the total number of patients in each city.
select city,count(city) from patients
group by city;

-------- B. GROUP BY and HAVING
-------- 31. Display cities having more than 3 patients.
select city,count(*) as total_patients
from patients
group by city 
having count(*) > 3;

-------- 32. Find departments having more than 1 doctor.
select de.department_name,count(do.doctor_id) as total_doctor from doctors do
inner join departments de
on do.department_id = de.department_id
group by de.department_id,de.department_name
having count(do.doctor_id) > 1;

-------- 33. Display doctors who have handled more than 2 appointments.
select do.doctor_name,count(a.appointment_id) from doctors do
inner join appointments a
on do.doctor_id = a.doctor_id
group by do.doctor_id,do.doctor_name 
having count(a.appointment_id) > 2;

-------- 34. Find payment methods used for more than 3 transactions.
select payment_method,count(*) from payments
group by payment_method
having count(*) > 3;

----------------------------------------------- Subqueries ----------------------------------------------------------
--------- 35. Find patients whose age is greater than the average age of all patients.
select * from patients
where age > (
select avg(age) from patients);

--------- 36. Find the patient who has made the highest payment.
select p.patient_name,pa.amount  from patients p
inner join appointments a
on p.patient_id = a.patient_id
inner join payments pa
on pa.appointment_id = a.appointment_id
where amount = (
select max(amount) from payments);

--------- 37. Find payments whose amount is greater than the average payment amount.
select payment_id,amount from payments
where amount > (
select avg(amount) from payments);

--------- 38. Find patients who have never booked an appointment.
select * from patients
where patient_id not in (
select patient_id from appointments);

--------- 40. Find doctors who have never received an appointment.
select * from doctors
where doctor_id not in (
select doctor_id from appointments);

