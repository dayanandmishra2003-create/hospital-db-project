use hospitaldb;
-- Q1. List all patients with their total billing amount
SELECT p.name AS patient_name, SUM(b.total_amount) AS total_bill
FROM Patients p
JOIN Billing b ON p.patient_id = b.patient_id
GROUP BY p.name
ORDER BY total_bill DESC;
-- 2. Find all appointments for a specific doctor
SELECT a.appointment_id, p.name AS patient_name, a.appointment_date, a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
WHERE a.doctor_id = 1
ORDER BY a.appointment_date;

-- Q3. List all unpaid bills
SELECT p.name AS patient_name, b.total_amount, b.billing_date
FROM Billing b
JOIN Patients p ON b.patient_id = p.patient_id
WHERE b.payment_status = 'Unpaid'
ORDER BY b.billing_date;

-- Q4. Find doctors with maximum appointments
SELECT d.name AS doctor_name, COUNT(a.appointment_id) AS appointment_count
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name
ORDER BY appointment_count DESC
LIMIT 1;

-- Q5. Total revenue generated per doctor
SELECT d.name AS doctor_name, SUM(t.cost) AS total_revenue
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.name
ORDER BY total_revenue DESC;

-- Q6. Patients who visited more than once
SELECT p.name AS patient_name, COUNT(a.appointment_id) AS visit_count
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.name
HAVING visit_count > 1;

-- Q7. Treatments costing more than 2500
SELECT t.treatment_description, t.cost, p.name AS patient_name
FROM Treatments t
JOIN Appointments a ON t.appointment_id = a.appointment_id
JOIN Patients p ON a.patient_id = p.patient_id
WHERE t.cost > 2500
ORDER BY t.cost DESC;

-- Q8. Daily appointment summary
SELECT a.appointment_date, COUNT(a.appointment_id) AS total_appointments
FROM Appointments a
GROUP BY a.appointment_date
ORDER BY a.appointment_date;

-- Q9. List patients with doctor specialization
SELECT p.name AS patient_name, d.name AS doctor_name, d.specialization
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
ORDER BY d.specialization;

-- Q10. Average cost of treatment per doctor
SELECT d.name AS doctor_name, AVG(t.cost) AS avg_treatment_cost
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.name
ORDER BY avg_treatment_cost DESC;