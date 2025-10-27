CREATE DATABASE HospitalDB;
USE HospitalDB;
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    gender ENUM('Male','Female','Other'),
    contact_number VARCHAR(10),
    address VARCHAR(255)
);
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(50),
    contact_number VARCHAR(15)
);
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    status ENUM('Scheduled','Completed','Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    treatment_description VARCHAR(255),
    cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
CREATE TABLE Billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2),
    payment_status ENUM('Paid','Unpaid'),
    billing_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Patients (name, age, gender, contact_number, address) VALUES
('Rahul Sharma', 30, 'Male', '9876543210', 'Mumbai'),
('Anita Singh', 25, 'Female', '9123456780', 'Pune');
INSERT INTO Patients (name, age, gender, contact_number, address) VALUES
('Rahul Verma', 25, 'Male', '9876543244', 'Uttar Pradesh'),
('Aniket Singh', 22, 'Male', '9123456321', 'Mumbai'),
('Vikram Patel', 40, 'Male', '9988776655', 'Ahmedabad'),
('Neha Joshi', 35, 'Female', '9871122330', 'Nagpur'),
('Amit Kumar', 28, 'Male', '9123344556', 'Bangalore'),
('Priya Mehta', 22, 'Female', '9988991122', 'Delhi'),
('Rohit Verma', 45, 'Male', '9112233446', 'Chennai'),
('Sonia Reddy', 38, 'Female', '9876655443', 'Hyderabad'),
('Karan Singh', 50, 'Male', '9998877665', 'Lucknow'),
('Pooja Sharma', 27, 'Female', '9123456781', 'Jaipur'),
('Manish Jain', 33, 'Male', '9988776656', 'Indore'),
('Ritika Kapoor', 29, 'Female', '9871122335', 'Chandigarh'),
('Sanjay Rao', 41, 'Male', '9123456790', 'Bhopal'),
('Shweta Singh', 36, 'Female', '9988991133', 'Patna'),
('Aditya Mehta', 24, 'Male', '9112233447', 'Kolkata'),
('Neelam Verma', 31, 'Female', '9876655444', 'Varanasi'),
('Rajesh Kumar', 37, 'Male', '9988776657', 'Mumbai'),
('Divya Joshi', 26, 'Female', '9123344557', 'Pune'),
('Ankur Singh', 43, 'Male', '9871122336', 'Delhi'),
('Sneha Patel', 32, 'Female', '9998887777', 'Ahmedabad');
INSERT INTO Doctors (name, specialization, contact_number) VALUES
('Dr. Mehta', 'Cardiologist', '9988776655'),
('Dr. Verma', 'Dermatologist', '9871122334');
INSERT INTO Doctors (name, specialization, contact_number) VALUES
('Dr. Yadav', 'Cardiologist', '777170655'),
('Dr. Shrama', 'Dermatologist', '970522334'),
('Dr. Rao', 'Orthopedic', '9123456789'),
('Dr. Singh', 'Neurologist', '9112233445'),
('Dr. Kapoor', 'Pediatrician', '9998887776');
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2025-10-26', 'Scheduled'),
(2, 2, '2025-10-27', 'Scheduled');
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(3, 3, '2025-10-27', 'Scheduled'),
(4, 4, '2025-10-27', 'Scheduled'),
(5, 5, '2025-10-28', 'Scheduled'),
(6, 1, '2025-10-28', 'Scheduled'),
(7, 2, '2025-10-29', 'Scheduled'),
(8, 3, '2025-10-29', 'Scheduled'),
(9, 4, '2025-10-30', 'Scheduled'),
(10, 5, '2025-10-30', 'Scheduled'),
(11, 1, '2025-10-31', 'Scheduled'),
(12, 2, '2025-10-31', 'Scheduled'),
(13, 3, '2025-11-01', 'Scheduled'),
(14, 4, '2025-11-01', 'Scheduled'),
(15, 5, '2025-11-02', 'Scheduled'),
(16, 1, '2025-11-02', 'Scheduled'),
(17, 2, '2025-11-03', 'Scheduled'),
(18, 3, '2025-11-03', 'Scheduled'),
(19, 4, '2025-11-04', 'Scheduled'),
(20, 5, '2025-11-04', 'Scheduled');

INSERT INTO Treatments (appointment_id, treatment_description, cost) VALUES
(1, 'Heart Checkup', 2000.00),
(2, 'Skin Allergy Treatment', 1500.00);
INSERT INTO Treatments (appointment_id, treatment_description, cost) VALUES
(3, 'Knee Pain Treatment', 2500.00),
(4, 'Migraine Consultation', 1800.00),
(5, 'Child Vaccination', 1200.00),
(6, 'Heart Surgery Follow-up', 3000.00),
(7, 'Acne Treatment', 1600.00),
(8, 'Fracture Consultation', 2200.00),
(9, 'Brain MRI', 5000.00),
(10, 'Pediatric Checkup', 1300.00),
(11, 'Cardiac Stress Test', 2800.00),
(12, 'Dermatology Checkup', 1700.00),
(13, 'Joint Pain Therapy', 2600.00),
(14, 'Neurology Consultation', 2000.00),
(15, 'Vaccination Booster', 1400.00),
(16, 'ECG Test', 1900.00),
(17, 'Skin Biopsy', 2200.00),
(18, 'Orthopedic Therapy', 2400.00),
(19, 'Neurology MRI', 5200.00),
(20, 'Pediatric Vaccination', 1250.00);

INSERT INTO Billing (patient_id, total_amount, payment_status, billing_date) VALUES
(1, 2000.00, 'Unpaid', '2025-10-26'),
(2, 1500.00, 'Paid', '2025-10-27');
INSERT INTO Billing (patient_id, total_amount, payment_status, billing_date) VALUES
(3, 2500.00, 'Unpaid', '2025-10-27'),
(4, 1800.00, 'Paid', '2025-10-27'),
(5, 1200.00, 'Paid', '2025-10-28'),
(6, 3000.00, 'Unpaid', '2025-10-28'),
(7, 1600.00, 'Paid', '2025-10-29'),
(8, 2200.00, 'Unpaid', '2025-10-29'),
(9, 5000.00, 'Unpaid', '2025-10-30'),
(10, 1300.00, 'Paid', '2025-10-30'),
(11, 2800.00, 'Paid', '2025-10-31'),
(12, 1700.00, 'Unpaid', '2025-10-31'),
(13, 2600.00, 'Paid', '2025-11-01'),
(14, 2000.00, 'Unpaid', '2025-11-01'),
(15, 1400.00, 'Paid', '2025-11-02'),
(16, 1900.00, 'Unpaid', '2025-11-02'),
(17, 2200.00, 'Paid', '2025-11-03'),
(18, 2400.00, 'Unpaid', '2025-11-03'),
(19, 5200.00, 'Paid', '2025-11-04'),
(20, 1250.00, 'Unpaid', '2025-11-04');

SELECT * FROM appointments;
SELECT * FROM billing;
SELECT * FROM doctors;
SELECT * FROM patients;
SELECT * FROM treatments;





