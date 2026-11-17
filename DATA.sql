create database hospital_management;

use hospital_management;

create table patients(
patient_id int primary key,
patient_name varchar(100),
age int,
gender varchar(10),
phone int,
city varchar(50));

INSERT INTO Patients VALUES
(101, "Aarav Sharma", 25, "Male", "9876543210", "Pune"),
(102, "Priya Patil", 32, "Female", "9876543211", "Mumbai"),
(103, "Rahul Deshmukh", 45,"Male", "9876543212", "Pune"),
(104, "Sneha Kulkarni", 28, "Female", "9876543213", "Nashik"),
(105, "Rohan Joshi", 50, "Male", "9876543214", "Mumbai"),
(106, "Neha More", 35, "Female", "9876543215", "Pune"),
(107, "Karan Shah", 40, "Male", "9876543216", "Satara"),
(108, "Pooja Jadhav", 22, "Female" ,"9876543217", "Pune"),
(109, "Amit Pawar", 60, "Male", "9876543218", "Nashik"),
(110, "Ananya Singh", 30, "Female","9876543219", "Mumbai"),
(111, "Sahil Chavan", 29, "Male", "9876543220", "Kolhapur"),
(112, "Riya Desai", 24, "Female", "876543221", "Pune"),
(113, "Akash Shinde", 38, "Male", "9876543222", "Mumbai"),
(114, "Meera Pawar", 55, "Female", "9876543223", "Nashik"),
(115, "Varun Kulkarni", 33, "Male", "9876543224", "Satara"),
(116, "Isha More", 19, "Female", "9876543225", "Pune"),
(117, "Nikhil Patil", 42, "Male", "9876543226", "Sangli"),
(118, "Kavya Joshi", 31, "Female", "9876543227", "Mumbai"),
(119, "Omkar Jadhav", 47, "Male", "9876543228", "Kolhapur"),
(120, "Tanvi Shah", 26, "Female", "9876543229", "Pune");

alter table patients modify phone varchar(15);

create table departments(
department_id int primary key,
department_name varchar(50),
location varchar(50));

INSERT INTO Departments VALUES
(1, "Cardiology", "First Floor"),
(2, "Neurology", "Second Floor"),
(3, "Orthopedics", "Third Floor"),
(4, "Dermatology", "First Floor"),
(5, "Pediatrics", "Ground Floor"),
(6, "General Medicine", "Ground Floor"),
(7, "ENT", "Second Floor"),
(8, "Ophthalmology", "Third Floor"),
(9, "Gynecology", "Fourth Floor"),
(10, "Oncology", "Fifth Floor");

create table doctors (
doctor_id int primary key,
doctor_name varchar(50),
specialization varchar(50),
phone varchar(15),
department_id int,
foreign key (department_id)
references departments(department_id));

INSERT INTO Doctors VALUES
(201, 'Dr. Amit Mehta', 'Heart Specialist', '9123456780', 1),
(202, 'Dr. Snehal Rao', 'Neurologist', '9123456781', 2),
(203, 'Dr. Raj Malhotra', 'Bone Specialist', '9123456782', 3),
(204, 'Dr. Pooja Shah', 'Skin Specialist', '9123456783', 4),
(205, 'Dr. Neha Gupta', 'Child Specialist', '9123456784', 5),
(206, 'Dr. Kunal Joshi', 'General Physician', '9123456785', 6),
(207, 'Dr. Rahul Verma', 'ENT Specialist', '9123456786', 7),
(208, 'Dr. Anjali Deshmukh', 'Eye Specialist', '9123456787', 8),
(209, 'Dr. Kavita Rao', 'Gynecologist', '9123456788', 9),
(210, 'Dr. Suresh Patil', 'Cancer Specialist', '9123456789', 10);

create table appointments(
appointment_id int primary key,
patient_id int,
foreign key (patient_id)
references patients(patient_id),
doctor_id int,
foreign key (doctor_id)
references doctors(doctor_id),
appointment_date date,
appointment_time time,
status varchar(20));

INSERT INTO Appointments VALUES
(301, 101, 201, '2026-10-10', '10:00:00', 'Completed'),
(302, 102, 204, '2026-10-11', '11:00:00', 'Completed'),
(303, 103, 201, '2026-10-12', '12:00:00', 'Completed'),
(304, 104, 205, '2026-10-13', '10:30:00', 'Pending'),
(305, 105, 203, '2026-10-14', '09:00:00', 'Completed'),
(306, 106, 206, '2026-10-15', '11:30:00', 'Cancelled'),
(307, 107, 202, '2026-10-16', '01:00:00', 'Completed'),
(308, 108, 205, '2026-10-17', '02:00:00', 'Pending'),
(309, 109, 206, '2026-10-18', '03:00:00', 'Completed'),
(310, 110, 204, '2026-10-19', '04:00:00', 'Completed'),
(311, 101, 206, '2026-10-20', '10:00:00', 'Pending'),
(312, 103, 203, '2026-10-21', '11:00:00', 'Completed'),
(313, 111, 207, '2026-10-22', '10:00:00', 'Completed'),
(314, 112, 208, '2026-10-23', '11:00:00', 'Completed'),
(315, 113, 209, '2026-10-24', '12:00:00', 'Pending'),
(316, 114, 210, '2026-10-25', '09:30:00', 'Completed'),
(317, 115, 203, '2026-10-26', '10:30:00', 'Completed'),
(318, 116, 205, '2026-10-27', '11:30:00', 'Cancelled'),
(319, 117, 202, '2026-10-28', '12:30:00', 'Completed'),
(320, 118, 204, '2026-10-29', '01:00:00', 'Pending'),
(321, 119, 201, '2026-10-30', '02:00:00', 'Completed'),
(322, 120, 206, '2026-10-31', '03:00:00', 'Completed');

create table prescriptions(
prescriptions_id int primary key,
appointment_id int,
foreign key (appointment_id)
references appointments(appointment_id),
medicine_name varchar(50),
dosage varchar(20),
duration varchar(30));

INSERT INTO Prescriptions VALUES
(401, 301, 'Aspirin', '75 mg', '5 Days'),
(402, 302, 'Cetirizine', '10 mg', '3 Days'),
(403, 303, 'Atorvastatin', '20 mg', '30 Days'),
(404, 305, 'Calcium Tablets', '500 mg', '15 Days'),
(405, 307, 'Vitamin B12', '1000 mcg', '10 Days'),
(406, 309, 'Paracetamol', '500 mg', '5 Days'),
(407, 310, 'Skin Cream', 'Apply Twice Daily', '7 Days'),
(408, 312, 'Pain Relief Gel', 'Apply Twice Daily', '5 Days'),
(409, 313, 'Amoxicillin', '500 mg', '5 Days'),
(410, 314, 'Eye Drops', '2 Drops', '7 Days'),
(411, 315, 'Folic Acid', '5 mg', '30 Days'),
(412, 316, 'As prescribed by oncologist', 'As directed', '30 Days'),
(413, 317, 'Vitamin D3', '60000 IU', 'Weekly'),
(414, 318, 'Paracetamol', '500 mg', '3 Days'),
(415, 319, 'Vitamin B Complex', '1 Tablet', '10 Days'),
(416, 320, 'Skin Ointment', 'Apply Twice Daily', '7 Days'),
(417, 321, 'Aspirin', '75 mg', 'As directed'),
(418, 322, 'Antacid', 'As directed', '5 Days');

create table payments(
payment_id int primary key,
appointment_id int,
foreign key (appointment_id)
references appointments(appointment_id),
amount float,
payment_date date,
payment_method varchar(30),
payment_status varchar(20));

INSERT INTO Payments VALUES
(501, 301, 1500.00, '2026-10-10', 'UPI', 'Paid'),
(502, 302, 800.00, '2026-10-11', 'Cash', 'Paid'),
(503, 303, 2000.00, '2026-10-12', 'Card', 'Paid'),
(504, 304, 1000.00, '2026-10-13', 'UPI', 'Pending'),
(505, 305, 1200.00, '2026-10-14', 'Cash', 'Paid'),
(506, 306, 500.00, '2026-10-15', 'Card', 'Refunded'),
(507, 307, 1800.00, '2026-10-16', 'UPI', 'Paid'),
(508, 308, 700.00, '2026-10-17', 'Cash', 'Pending'),
(509, 309, 900.00, '2026-10-18', 'UPI', 'Paid'),
(510, 310, 1100.00, '2026-10-19', 'Card', 'Paid'),
(511, 311, 600.00, '2026-10-20', 'UPI', 'Pending'),
(512, 313, 1000.00, '2026-10-22', 'UPI', 'Paid'),
(513, 314, 850.00, '2026-10-23', 'Cash', 'Paid'),
(514, 315, 1500.00, '2026-10-24', 'Card', 'Pending'),
(515, 316, 5000.00, '2026-10-25', 'UPI', 'Paid'),
(516, 317, 1200.00, '2026-10-26', 'Cash', 'Paid'),
(517, 318, 500.00, '2026-10-27', 'Card', 'Refunded'),
(518, 319, 1800.00, '2026-10-28', 'UPI', 'Paid'),
(519, 320, 900.00, '2026-10-29', 'Cash', 'Pending'),
(520, 321, 2500.00, '2026-10-30', 'Card', 'Paid'),
(521, 322, 750.00, '2026-10-31', 'UPI', 'Paid');


