# **Secure Database Management System for Healthcare Data**  

## **Author**  
**Swetha Yanamandhalla**  
**Date**: May 5, 2024  

---

## **Project Overview**  
This project focuses on securing sensitive **healthcare data** in a **cloud-based database** using advanced encryption techniques. It ensures **data confidentiality, secure authentication, and controlled access** through role-based permissions. The system is implemented using **Python, Flask, and MySQL** with **AES-256 and RSA encryption** for enhanced security.  

---

## **Key Features**  

- **Data Encryption**:  
  - Uses **AES-256 (CBC mode)** for encrypting sensitive records (e.g., Social Security Numbers).  
  - Implements **RSA encryption** for securely transmitting sensitive information.  

- **User Authentication & Access Control**:  
  - Secure login and registration with **SHA-256 password hashing**.  
  - **Role-based permissions**:  
    - **Group H** (Healthcare Professionals) – Full access to records.  
    - **Group R** (Restricted Users) – Limited access to non-sensitive information.  

- **Flask Web Interface**:  
  - A **user-friendly dashboard** for managing healthcare data securely.  
  - **Dynamic data visualization** for quick insights.  

- **Automated Database Population**:  
  - Generates **sample data** with encrypted fields for testing and validation.  

---

## **Requirements**  

1. **Python 3.7+**  
2. **MySQL Server**  
3. **Required Libraries** (install using pip):  
   ```bash
   pip install pymysql cryptography flask
   ```
4. A **MySQL database** named `secure_db`.  

---

## **Setup Instructions**  

### **1. Clone the Repository**  
```bash
git clone <repository-url>
cd secure-database-management
```

### **2. Configure MySQL Database**  
Ensure the database credentials are correctly set in the script:  
```python
db_host = "localhost"
db_user = "root"
db_password = ""
db_name = "secure_db"
```

### **3. Generate Encryption Keys**  
Run the script to create AES and RSA keys:  
```bash
python setup.py
```
- **AES key** is stored in `aes_key.txt`.  
- **RSA keys** (public/private) are stored in `private_key.pem` and `public_key.pem`.  

### **4. Initialize the Database**  
Create necessary tables and insert sample data:  
```bash
python setup_database.py
```

### **5. Start the Flask Web App**  
Run the application:  
```bash
python app.py
```
The application will be available at `http://127.0.0.1:5000`.  

---

## **Application Details**  

### **Encryption Methods**  

**AES-256 Encryption**  
- Used to **securely store sensitive data** such as Social Security Numbers.  
- A **unique IV (Initialization Vector)** is used for each encryption.  

**RSA Encryption**  
- Ensures **secure data transmission** between the database and frontend.  
- Uses a **public-private key pair** for encryption and decryption.  

---

## **Flask Web Routes**  

| Route         | Description |
|--------------|-------------|
| `/`         | Home Page |
| `/login`    | Secure user login |
| `/register` | User registration with hashed passwords |
| `/dashboard` | Displays user-specific data based on role |
| `/query`    | Fetches and displays relevant records |
| `/add`      | Allows authorized users to add new records |
| `/edit/<id>` | Edit an existing record (restricted to Group H) |
| `/logout`   | Securely logs out the user |

---

## **User Roles & Permissions**  

- **Group H (Healthcare Professionals)**  
  - Full access to view, edit, and manage all data.  
- **Group R (Restricted Users)**  
  - Limited access, only able to view non-sensitive records.  

---

## **Database Schema**  

### **Users Table**  

| Column        | Type         | Description |
|--------------|-------------|-------------|
| `id`        | INT          | Auto-incremented User ID |
| `username`  | VARCHAR(50)  | Unique identifier |
| `password_hash` | VARCHAR(255) | Securely hashed password (SHA-256) |
| `group_name` | ENUM('H', 'R') | User role: H (Full) or R (Restricted) |

### **Healthcare Data Table**  

| Column        | Type         | Description |
|--------------|-------------|-------------|
| `id`        | INT          | Auto-incremented Record ID |
| `first_name` | VARCHAR(50) | First name |
| `last_name` | VARCHAR(50) | Last name |
| `gender`    | BOOLEAN      | Gender (0: Female, 1: Male) |
| `age`       | INT          | Age of the patient |
| `weight`    | FLOAT        | Weight in kg |
| `height`    | FLOAT        | Height in cm |
| `health_history` | VARCHAR(255) | Medical history notes |
| `encrypted_ssn` | BLOB      | AES-encrypted SSN |

---

## **Security Measures**  

1. **Password Hashing**:  
   - User passwords are stored **securely using SHA-256 hashing** to prevent unauthorized access.  
2. **AES Encryption**:  
   - All sensitive records are **encrypted before being stored in the database**.  
3. **RSA Encryption**:  
   - Ensures **safe data transmission**, reducing risks of interception.  
4. **Role-Based Access Control**:  
   - Prevents unauthorized users from accessing restricted data.  

---

## **Screenshots**  

1. **Login Page**  
   ![Login Page](screenshots/login.png)  

2. **Dashboard (Full Access - Group H)**  
   ![Dashboard H](screenshots/dashboard_h.png)  

3. **Dashboard (Restricted Access - Group R)**  
   ![Dashboard R](screenshots/dashboard_r.png)  

---

## **Future Enhancements**  

- **Secure HTTPS Integration**: Encrypt all web traffic for enhanced security.  
- **Multi-Factor Authentication (MFA)**: Strengthen login security.  
- **Enhanced User Interface**: Improve the design for a better user experience.  
- **Audit Logging**: Track data access and modifications.  

---

## **License**  

This project is open-source and available under the **MIT License**. Check the `LICENSE` file for more details.  

---

## **Conclusion**  

This project demonstrates **secure handling of healthcare data** with **encryption, authentication, and role-based access control**. It provides a **strong foundation for building privacy-compliant healthcare systems** while maintaining ease of access for authorized users.  

For further improvements, contributions are always welcome.  

### **Stay secure, protect data, and ensure privacy!**
