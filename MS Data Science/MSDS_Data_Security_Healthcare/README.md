# Data Security and Privacy: Healthcare Database
Secured cloud-based healthcare data with AES-256 and RSA encryption and privacy-preserving queries.
# Secure Database Management System

This project is a secure database management system implemented using Python, Flask, and MySQL. It demonstrates secure data handling, user authentication, and encryption mechanisms.

## Features

- **AES Encryption**: Encrypt sensitive data (e.g., SSN) using AES (CBC mode).
- **RSA Encryption**: Securely encrypt values using RSA for asymmetric encryption.
- **User Authentication**: Register and login functionality with hashed passwords.
- **Role-based Access Control**:
  - **Group H**: Full access to view, edit, and add data.
  - **Group R**: Restricted access to view limited data.
- **Flask Web Interface**: Intuitive UI for data management.
- **Random Data Generation**: Populate the database with sample data.

## Prerequisites

1. Python 3.7+
2. MySQL Server
3. Pip dependencies:
   ```bash
   pip install pymysql cryptography flask
   ```
4. A MySQL database named `secure_db`.

## Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd secure-database-management
   ```

2. **Configure MySQL Database**
   Update the database credentials in the script if required:
   ```python
   db_host = "localhost"
   db_user = "root"
   db_password = ""
   db_name = "secure_db"
   ```

3. **Generate Encryption Keys**
   Run the script to generate AES and RSA keys:
   ```bash
   python setup.py
   ```
   - The AES key will be saved as `aes_key.txt`.
   - The RSA keys will be saved as `private_key.pem` and `public_key.pem`.

4. **Initialize the Database**
   Run the script to create tables and populate the database with random data:
   ```bash
   python setup_database.py
   ```

5. **Run the Flask App**
   Start the web application:
   ```bash
   python app.py
   ```
   Access the application at `http://127.0.0.1:5000`.

## Application Details

### AES Encryption
- Ensures secure storage of sensitive data like SSN.
- Uses a random IV for each encryption.

### RSA Encryption
- Secures sensitive data during communication.
- Public and private keys are used for encryption and decryption.

### Flask Routes
- `/`: Home page.
- `/login`: User login.
- `/register`: User registration.
- `/dashboard`: Role-based dashboard.
- `/query`: View data based on user roles.
- `/add`: Add new data (Group H only).
- `/edit/<id>`: Edit existing data (Group H only).
- `/logout`: Logout.

### User Roles
- **Group H**: Healthcare professionals with full access.
- **Group R**: Restricted access to view non-sensitive data.

## Database Schema

### `users` Table
| Column         | Type          | Description                          |
|----------------|---------------|--------------------------------------|
| `id`          | INT           | Auto-incremented user ID            |
| `username`    | VARCHAR(50)   | Unique username                     |
| `password_hash` | VARCHAR(255) | SHA-256 hashed password             |
| `group_name`  | ENUM('H', 'R') | User group: H (Full) or R (Restricted) |

### `healthcare` Table
| Column         | Type          | Description                          |
|----------------|---------------|--------------------------------------|
| `id`          | INT           | Auto-incremented record ID          |
| `first_name`  | VARCHAR(50)   | First name of the individual        |
| `last_name`   | VARCHAR(50)   | Last name of the individual         |
| `gender`      | BOOLEAN       | Gender (0: Female, 1: Male)         |
| `age`         | INT           | Age                                 |
| `weight`      | FLOAT         | Weight (kg)                         |
| `height`      | FLOAT         | Height (cm)                         |
| `health_history` | VARCHAR(255) | Health history notes               |
| `encrypted_ssn` | BLOB         | AES-encrypted SSN                   |

## Security Features

1. **Password Hashing**: Uses SHA-256 for secure password storage.
2. **AES Encryption**: Secure storage of sensitive data like SSN.
3. **RSA Encryption**: Asymmetric encryption for secure data communication.
4. **Role-based Access Control**: Limits data access based on user roles.

## Screenshots

1. **Login Page**:
   ![Login Page](screenshots/login.png)

2. **Dashboard (Group H)**:
   ![Dashboard H](screenshots/dashboard_h.png)

3. **Dashboard (Group R)**:
   ![Dashboard R](screenshots/dashboard_r.png)

## Future Enhancements

- Implement HTTPS for secure communication.
- Add email verification during registration.
- Improve UI for a better user experience.

## License

This project is licensed under the MIT License. See `LICENSE` for details.
