# Clinical Booking System Database (MySQL)

## 📌 Project Title

Clinical Booking System Database

## 📖 Description

This project implements a **Clinical Booking System** using **MySQL**.\
It is designed to manage patients, doctors, appointments, treatments,
and billing efficiently.\
The system ensures data integrity using **Primary Keys, Foreign Keys,
and proper constraints**.

## ⚙️ Features

-   Manage patient records (CRUD operations).
-   Store doctor details and specializations.
-   Appointment scheduling (1-M relationship between Patients and
    Appointments).
-   Track treatments and billing records.
-   Enforces **1-1, 1-M, and M-M relationships**.

## 🛠️ Setup Instructions

### 1. Clone Repository

``` bash
git clone https://github.com/hamprecious00/clinical-booking-system.git
cd clinical-booking-system
```

### 2. Import Database

1.  Open **MySQL Workbench** or your preferred SQL client.\

2.  Create a new database:

    ``` sql
    CREATE DATABASE clinic_db;
    USE clinic_db;
    ```

3.  Import the provided `.sql` file:

    ``` sql
    SOURCE clinic_system.sql;
    ```

### 3. Verify Tables

Run:

``` sql
SHOW TABLES;
```

You should see tables like: - `patients` - `doctors` - `appointments` -
`treatments` - `billing`


## 📂 Deliverables

-   `clinic_system.sql` → Contains all `CREATE TABLE` statements with
    constraints.
-   `README.md` → Project setup instructions (this file).

## ✨ Author

Hamphrey Wafula\
📧 Contact: \[hamwafula30@gmail.com\]
