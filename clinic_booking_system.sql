-- =====================================================
-- Clinic Booking System Database (MySQL)
-- Week 8 Assignment
-- Author: Hamphrey Wafula
-- =====================================================

-- Drop database if it exists (for clean setup)
DROP DATABASE IF EXISTS clinic_booking;
CREATE DATABASE clinic_booking;
USE clinic_booking;

-- =====================================================
-- TABLE: Patients
-- Stores information about patients
-- =====================================================
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLE: Doctors
-- Stores doctor information
-- =====================================================
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLE: Appointments
-- Stores appointment bookings
-- Relationship: Many-to-One with Patients & Doctors
-- =====================================================
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Keys
    CONSTRAINT fk_patient FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_doctor FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- =====================================================
-- TABLE: Prescriptions
-- Relationship: One Appointment can have many Prescriptions
-- =====================================================
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    medication VARCHAR(255) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    instructions TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    -- Foreign Key
    CONSTRAINT fk_appointment FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- =====================================================
-- TABLE: Payments
-- Stores payment details for appointments
-- Relationship: One-to-One with Appointments
-- =====================================================
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    method ENUM('Cash', 'Card', 'M-Pesa', 'Insurance') NOT NULL,
    status ENUM('Pending', 'Paid', 'Failed') DEFAULT 'Pending',
    
    -- Foreign Key
    CONSTRAINT fk_payment_appointment FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- =====================================================
-- SAMPLE DATA INSERTS (Optional, for testing)
-- =====================================================
INSERT INTO Patients (first_name, last_name, dob, gender, phone, email)
VALUES ('John', 'Doe', '1990-05-15', 'Male', '0712345678', 'john.doe@example.com');

INSERT INTO Doctors (first_name, last_name, specialty, phone, email)
VALUES ('Alice', 'Smith', 'Cardiologist', '0723456789', 'alice.smith@example.com');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes)
VALUES (1, 1, '2025-08-20 10:00:00', 'Scheduled', 'First-time consultation');

INSERT INTO Prescriptions (appointment_id, medication, dosage, instructions)
VALUES (1, 'Paracetamol', '500mg', 'Take 1 tablet every 6 hours after meals');

INSERT INTO Payments (appointment_id, amount, method, status)
VALUES (1, 2000.00, 'M-Pesa', 'Paid');

-- =====================================================
-- END OF SCRIPT
-- =====================================================
