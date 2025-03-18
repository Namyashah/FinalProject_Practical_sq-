--(Hospital Management System)

--Tasks & Functionalities
--1. Implement CRUD Operations (Low Weightage)
--• Insert new patients, doctors, and appointments into the database.

--(Departments Table)
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

INSERT INTO Departments (department_name) VALUES
('Cardiology'),
('Neurology'),
('Dermatology'),
('Pediatrics'),
('Orthopedics'),
('ENT'),
('Oncology'),
('Psychiatry'),
('Gastroenterology'),
('Urology'),
('Endocrinology'),
('Gynecology'),
('Pulmonology'),
('Rheumatology'),
('Nephrology');

--(Patients Table)
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(100),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Patients (name, dob, gender, phone_number, email, address) VALUES
('John Doe', '1990-05-15', 'Male', "", 'john@example.com', '123 Street, City'),
('Jane Smith', '1985-08-22', 'Female', "", 'jane@example.com', '456 Avenue, City'),
('Michael Brown', '1975-01-10', 'Male', '5551112222', 'michael@example.com', '789 Road, Town'),
('Emily Davis', '1992-11-05', 'Female', '6667778888', 'emily@example.com', '321 Lane, Village'),
('David Wilson', '1980-09-25', 'Male', '9990001111', 'david@example.com', '654 Path, City'),
('Sarah Taylor', '2000-02-17', 'Female', '2223334444', 'sarah@example.com', '987 Alley, Suburb'),
('Chris Martin', '1995-07-30', 'Male', '5556667777', 'chris@example.com', '111 Boulevard, Metro'),
('Jessica White', '1988-12-22', 'Female', '8889990000', 'jessica@example.com', '543 Crescent, Downtown'),
('Matthew Lee', '1993-04-11', 'Male', '1112223333', 'matthew@example.com', '765 Avenue, City'),
('Laura Harris', '1997-06-09', 'Female', '4445556666', 'laura@example.com', '222 Street, Town'),
('Robert Hall', '1965-03-15', 'Male', '7778889999', 'robert@example.com', '333 Place, Village'),
('Olivia Clark', '1982-10-05', 'Female', '0001112222', 'olivia@example.com', '444 Square, Suburb'),
('William Allen', '1978-08-19', 'Male', '3334445555', 'william@example.com', '555 Road, Metro'),
('Sophia Young', '2001-01-23', 'Female', '6667778889', 'sophia@example.com', '666 Lane, Downtown'),
('Daniel King', '1991-09-14', 'Male', '9991113333', 'daniel@example.com', '777 Path, City');

--(Doctors Table)
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    consultation_fee DECIMAL(10,2),
    years_of_experience INT
);

INSERT INTO Doctors (name, specialization, phone_number, email, consultation_fee,years_of_experience) VALUES
('Dr. Alice Johnson', 'Cardiology', '1112223333', 'alice@example.com', 1000.00,20),
('Dr. Bob Williams', 'Neurology', '4445556666', 'bob@example.com', 1500.00,10),
('Dr. Charlie Brown', 'Dermatology', '7778889999', 'charlie@example.com', 1200.00,5),
('Dr. Diane White', 'Pediatrics', '2223334444', 'diane@example.com', 90.00,18),
('Dr. Eric Black', 'Orthopedics', '5556667777', 'eric@example.com', 1300.00,7),
('Dr. Fiona Green', 'ENT', '8889990000', 'fiona@example.com', 110.00,3),
('Dr. George Adams', 'Oncology', '1114447777', 'george@example.com', 2000.00,12),
('Dr. Hannah Scott', 'Psychiatry', '2225558888', 'hannah@example.com', 160.00,22),
('Dr. Ian Roberts', 'Gastroenterology', '3336669999', 'ian@example.com', 1400.00,9),
('Dr. Julia Moore', 'Urology', '4447770000', 'julia@example.com', 125.00,4),
('Dr. Kevin Murphy', 'Endocrinology', '5558881111', 'kevin@example.com', 135.00,16),
('Dr. Laura Jackson', 'Gynecology', '6669992222', 'laura@example.com', 145.00,6),
('Dr. Michael Thompson', 'Pulmonology', '7770003333', 'michael.t@example.com', 155.00,14),
('Dr. Nancy Lewis', 'Rheumatology', '8881114444', 'nancy@example.com', 115.00,8),
('Dr. Oliver Nelson', 'Nephrology', '9992225555', 'oliver@example.com', 170.00,25);

--(Doctor_department_table)

CREATE TABLE Doctor_Department (
    doctor_id INT,
    department_id INT,
    PRIMARY KEY (doctor_id, department_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Doctor_Department (doctor_id, department_id) VALUES
(1, 1),  -- Cardiology
(2, 2),  -- Neurology
(3, 3),  -- Dermatology
(4, 4),  -- Pediatrics
(5, 5),  -- Orthopedics
(6, 6),  -- ENT
(7, 7),  -- Oncology
(8, 8),  -- Psychiatry
(9, 9),  -- Gastroenterology
(10, 10), -- Urology
(11, 11), -- Endocrinology
(12, 12), -- Gynecology
(13, 13), -- Pulmonology
(14, 14), -- Rheumatology
(15, 15); -- Nephrology

--(Appointment Table)
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1, 1, '2025-03-20 10:00:00', 'Scheduled'),
(2, 2, '2024-05-21 14:30:00', 'Completed'),
(3, 3, '2023-03-22 11:00:00', 'Scheduled'),
(4, 4, '2024-03-23 15:00:00', 'Cancelled'),
(5, 5, '2024-03-24 09:30:00', 'Completed'),
(6, 6, '2024-03-25 13:00:00', 'Scheduled'),
(7, 7, '2025-03-26 16:45:00', 'Scheduled'),
(8, 8, '2025-03-27 12:00:00', 'Completed'),
(9, 9, '2025-03-28 08:30:00', 'Cancelled'),
(10, 10, '2024-03-29 14:15:00', 'Scheduled'),
(11, 11, '2025-03-30 10:45:00', 'Completed'),
(12, 12, '2025-03-31 17:30:00', 'Scheduled'),
(13, 13, '2024-04-01 09:00:00', 'Completed'),
(14, 14, '2025-04-02 11:15:00', 'Scheduled'),
(15, 15, '2022-04-03 13:45:00', 'Scheduled');

DELETE FROM Appointments WHERE appointment_id = 12;

--(Medical Table)
CREATE TABLE Medical_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    prescription TEXT,
    treatment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

INSERT INTO Medical_Records (patient_id, doctor_id, diagnosis, prescription, treatment_date) VALUES
(1, 1, 'Hypertension', 'Medication A', '2025-03-10'),
(2, 2, 'Migraine', 'Painkiller B', '2025-03-12'),
(3, 3, 'Eczema', 'Ointment C', '2025-03-15'),
(4, 4, 'Flu', 'Antibiotic D', '2025-03-18'),
(5, 5, 'Fracture', 'Plaster E', '2025-03-20'),
(6, 6, 'Tonsillitis', 'Antibiotic F', '2025-03-22'),
(7, 7, 'Cancer Stage 1', 'Chemotherapy G', '2025-03-25'),
(8, 8, 'Depression', 'Therapy H', '2025-03-28'),
(9, 9, 'Ulcer', 'Medicine I', '2025-04-01'),
(10, 10, 'Kidney Infection', 'Medication J', '2025-04-03'),
(11, 11, 'Diabetes', 'Insulin', '2025-04-05'),
(12, 12, 'PCOS', 'Hormonal Treatment', '2025-04-08'),
(13, 13, 'Asthma', 'Inhaler', '2025-04-10'),
(14, 14, 'Arthritis', 'Painkillers', '2025-04-12'),
(15, 15, 'Kidney Stones', 'Surgery', '2025-04-15'),
(15, 9, 'Ulcer', 'Medicine I', '2025-04-01'),
(15, 10, 'Kidney Infection', 'Medication J', '2025-04-03'),
(15, 12, 'PCOS', 'Hormonal Treatment', '2025-04-08'),
(15, 3, 'Eczema', 'Ointment C', '2025-03-15'),
(15, 14, 'Arthritis', 'Painkillers', '2025-04-12'),
(13, 8, 'Depression', 'Therapy H', '2025-03-28'),
(13, 8, 'Depression', 'Therapy H', '2025-03-28'),
(13, 12, 'PCOS', 'Hormonal Treatment', '2025-04-08');

--(Billing Table)
CREATE TABLE Billing (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20) DEFAULT 'Pending',
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Billing (patient_id, appointment_id, amount, payment_status, payment_date) VALUES
(1, 1, 1000.00, 'Paid', '2025-03-20'),
(2, 2, 1500.00, 'Pending', NULL),
(3, 3, 1200.00, 'Paid', '2025-03-22'),
(4, 4, 90.00, 'Cancelled', NULL),
(5, 5, 1300.00, 'Paid', '2025-03-24'),
(6, 6, 110.00, 'Pending', NULL),
(7, 7, 2000.00, 'Paid', '2025-03-26'),
(8, 8, 160.00, 'Pending', NULL),
(9, 9, 1400.00, 'Cancelled', NULL),
(10, 10, 125.00, 'Paid', '2025-03-29'),
(11, 11, 135.00, 'Pending', NULL),
(12, 12, 145.00, 'Paid', '2025-03-31'),
(13, 13, 155.00, 'Paid', '2025-04-01'),
(14, 14, 115.00, 'Pending', NULL),
(15, 15, 170.00, 'Paid', '2025-04-03');

--• Update patient details when they change addresses.
UPDATE Patients SET address = "583 Path Village Norway" WHERE patient_id = 3;

--• Delete cancelled appointments older than 6 months.
DELETE FROM Appointments WHERE appointment_date <= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

--2. Use SQL Clauses (WHERE, HAVING, LIMIT) (Low Weightage)
--• Find all patients registered in the last year:
SELECT * FROM Patients WHERE YEAR(registration_date) = 2024;

--• Get the top 5 highest-paying patients.
SELECT * FROM Billing ORDER BY amount DESC LIMIT 5;

--• Retrieve doctors who charge more than €1,000.
SELECT * FROM Doctors WHERE consultation_fee > 1000;

--3. Apply SQL Operators (AND, OR, NOT) (Medium Weightage)
--• Find appointments where status = 'Scheduled' AND doctor_id = 3.
SELECT * FROM Appointments WHERE status = "Scheduled" AND doctor_id = 3;

--• Retrieve doctors who specialize in Cardiology OR Neurology.
SELECT * FROM Doctors WHERE specialization = "Cardiology" OR specialization = "Neurology";

--• Get patients who have NOT visited in the past year.
SELECT * FROM Patients 
WHERE patient_id NOT IN (
    SELECT patient_id FROM Appointments 
    WHERE appointment_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
);

--4. Sorting & Grouping Data (ORDER BY, GROUP BY) (Medium Weightage)
--• List all doctors sorted by specialization.
SELECT * FROM Doctors ORDER BY specialization;

--• Display the number of patients assigned to each doctor.
SELECT doctor_id,COUNT(patient_id) AS number_Of_patients_assigned
FROM Medical_Records
GROUP BY doctor_id;

--• Show total revenue generated per department.
SELECT 
    dep.department_name,
    SUM(b.amount) AS total_revenue
FROM Billing b
JOIN Appointments a ON b.appointment_id = a.appointment_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
JOIN Doctor_Department dd ON d.doctor_id = dd.doctor_id
JOIN Departments dep ON dd.department_id = dep.department_id
GROUP BY dep.department_name;

--5. Use Aggregate Functions (SUM, AVG, MAX, MIN, COUNT) (High Weightage)
--• Find the total revenue collected.
SELECT SUM(amount) FROM Billing WHERE payment_status = "Paid";

--• Identify the most visited doctor.
SELECT doctor_id, COUNT(patient_id) AS max_patients_assigned
FROM Medical_Records
GROUP BY doctor_id
ORDER BY max_patients_assigned DESC
LIMIT 1;

--• Calculate the average consultation fee.
SELECT AVG(consultation_fee) AS average_consultation_fee
FROM Doctors;

--6. Establish Primary & Foreign Key Relationships (High Weightage)
--• Ensure medical records are linked to correct patients and doctors.
--• Establish relationships between invoices and appointments.
--7. Implement Joins (High Weightage)
--• Retrieve a list of doctors along with their department names using INNER JOIN.
SELECT Doctors.name,Doctors.specialization AS Departments FROM Doctors
INNER JOIN Doctor_Department
ON Doctors.doctor_id = Doctor_Department.doctor_id;

--• Get all patients who have completed appointments using LEFT JOIN
SELECT patients.name,Patients.gender,Appointments.status FROM Appointments
LEFT JOIN Patients
ON Appointments.patient_id = Patients.patient_id
WHERE Appointments.status = "Completed";

--• Find appointments that have no payments using RIGHT JOIN
SELECT Appointments.appointment_id,Appointments.status,Billing.payment_status FROM Appointments
RIGHT JOIN Billing
ON Appointments.appointment_id = Billing.appointment_id
WHERE Billing.payment_status = "Pending" OR  Billing.payment_status = "Cancelled";

--• Show patients who have never booked an appointment using FULL OUTER JOIN
SELECT patients.name,Patients.gender,Appointments.status FROM Appointments
LEFT JOIN Patients
ON Appointments.patient_id = Patients.patient_id
WHERE Appointments.appointment_id IS NULL
UNION
SELECT patients.name,Patients.gender,Appointments.status FROM Appointments
RIGHT JOIN Patients
ON Appointments.patient_id = Patients.patient_id
WHERE Appointments.appointment_id IS NULL;

--8. Use Subqueries (High Weightage)
--• Find doctors who have handled more than 2 patients.
SELECT 
    Medical_Records.doctor_id, 
    Doctors.name AS doctor_name, 
    COUNT(Medical_Records.patient_id) AS total_patients_handled
FROM Medical_Records
JOIN Doctors ON Medical_Records.doctor_id = Doctors.doctor_id
GROUP BY Medical_Records.doctor_id, Doctors.name
HAVING COUNT(Medical_Records.patient_id) > 2;


--• Identify the patient who has spent the most on treatments.
--• Get appointments where the doctor specializes in Dermatology.
--9. Implement Date & Time Functions (High Weightage)
--• Extract the month from appointment_date to count visits per month.
SELECT MONTH(appointment_date) AS month,COUNT(*) AS visits
FROM Appointments
GROUP BY month;

--• Calculate the total hospital stay duration by subtracting admission_date from
--discharge_date.
--• Format treatment_date as DD-MM-YYYY.
SELECT
*,
DATE_FORMAT(treatment_date,"%d-%m-%Y") AS formatted_date
FROM Medical_Records;

--10. Use String Manipulation Functions (High Weightage)
--• Convert all patient names to uppercase.
SELECT
patient_id,name,
UPPER(name) AS uppercase_name,
gender,email
FROM Patients;

--• Trim whitespace from doctor names.
SELECT
doctor_id,
name,
TRIM(name) AS Trimed_names,
specialization,email
FROM doctors;

--• Replace missing phone numbers with "Not Available"
SELECT
*,
REPLACE(phone_number,"","NOT AVAILABLE")
FROM Patients;

--11. Implement Window Functions (Very High Weightage)
--Rank doctors based on the number of patients they have treated.
SELECT 
    doctor_id, 
    COUNT(patient_id) AS patients_treated,
    DENSE_RANK() OVER (ORDER BY COUNT(patient_id) DESC) AS ranks
FROM Medical_Records
GROUP BY doctor_id;

--• Show the cumulative revenue per month.
SELECT 
    DATE_FORMAT(payment_date, "%Y-%m") AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(payment_date, "%Y-%m")) AS cumulative_revenue
FROM Billing
WHERE payment_status = "Paid"
GROUP BY month
ORDER BY month;

--• Display the running total of appointments made.
SELECT 
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date,
    SUM(1) OVER (ORDER BY appointment_date) AS running_total
FROM Appointments;

--12. Apply SQL CASE Expressions (Very High Weightage)
--• Assign a Patient_Risk_Level:
--• "High" if they have more than 5 medical records.
--• "Medium" if they have 3-5 records.
--• "Low" otherwise.
SELECT 
    patient_id,
    COUNT(patient_id) AS total_visits,
    CASE 
        WHEN COUNT(patient_id) > 5 THEN "HIGH"
        WHEN COUNT(patient_id) > 3 AND COUNT(patient_id) <= 5 THEN "MEDIUM"
        ELSE "LOW"
    END AS Patient_Risk_Level
FROM Medical_Records
GROUP BY patient_id;

--• Categorize doctors:
--"Senior" if they have more than 15 years of experience.
--• "Mid-Level" if they have 5-15 years.
--"Junior" otherwise.
SELECT
    *,
    CASE
        WHEN years_of_experience > 15 THEN "SENIOR"
        WHEN years_of_experience > 5 AND years_of_experience <=15 THEN "MID-LEVEL"
        ELSE "JUNIOR"
    END AS experience_grade
FROM Doctors;