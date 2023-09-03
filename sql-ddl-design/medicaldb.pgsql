DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY, 
    doctor_name VARCHAR(20) NOT NULL, 
    speciality VARCHAR(20) NOT NULL
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    healthcare_numb INTEGER,
    address TEXT
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY, 
    condition_name TEXT, 
    summary_symptoms TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors,
    diagnosis1 INTEGER REFERENCES diagnosis,
    diagnosis2 INTEGER REFERENCES diagnosis
);

INSERT INTO doctors
(doctor_name, speciality)
VALUES
('Dr.Shah', 'Dermatologist'), 
('Dr. Johnson', 'Family-Medicine');

INSERT INTO patients
(first_name, last_name, healthcare_numb,address)
VALUES
('Joy', 'Moro', 794558, '55 Flower Avenue'),
('Felipe', 'Gonzalez', 652123, '46 Rural Street');

INSERT INTO diagnosis
(condition_name, summary_symptoms)
VALUES
('VitamD-def', 'Level of vitam D are below the healthy range'),
('FungusInf', 'Fungi infection of the epidermis');

INSERT INTO visits 
(patient_id, doctor_id, diagnosis1)
VALUES 
(1,2,1);

INSERT INTO visits 
(patient_id, doctor_id, diagnosis1, diagnosis2)
VALUES 
(2,1,2,1);