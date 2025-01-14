# Advanced Database Systems Design

## Overview
This project demonstrates the development of a web-based application for managing **Customer** and **Order** data using Flask and SQLite. The application provides full CRUD (Create, Read, Update, Delete) functionality for both entities, offering a user-friendly interface for database interaction.

---

## Features
- **Customer Management**: Add, update, delete, and list customers.
- **Order Management**: Add, update, delete, and list orders.
- **Database Integration**: Uses SQLite for data storage and management.
- **Flask Framework**: Implements routing, request handling, and template rendering.
- **Dynamic UI**: Displays real-time updates on the web interface.

---

## Technologies Used
- **Programming Language**: Python
- **Framework**: Flask
- **Database**: SQLite (SQLAlchemy ORM)
- **HTML Templates**: Jinja2 for dynamic content rendering

---

## Application Structure
```
project/
├── app.py                # Main application script
├── templates/
│   ├── index.html        # Home page template
│   ├── edit_customer.html # Customer edit form
│   ├── edit_order.html   # Order edit form
├── site.db               # SQLite database (auto-created)
└── requirements.txt      # Python dependencies (generated via pip freeze)
```

---

## Setup Instructions

### Prerequisites
Ensure you have Python 3.x installed along with `pip` (Python package manager).

### Steps
1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/advanced-db-design.git
   cd advanced-db-design
   ```

2. **Install Dependencies**
   Install the required Python packages:
   ```bash
   pip install -r requirements.txt
   ```

3. **Initialize the Database**
   Run the following command to create the SQLite database:
   ```bash
   python app.py
   ```

4. **Run the Application**
   Start the Flask development server:
   ```bash
   python app.py
   ```
   Access the application at `http://127.0.0.1:5000/`.

---

## Usage
### **Homepage**
Displays all customers and orders.

### **Customer Operations**
- **Add Customer**: Enter a name and submit the form.
- **Edit Customer**: Modify a customer's name using the edit form.
- **Delete Customer**: Remove a customer from the database.

### **Order Operations**
- **Add Order**: Select a customer and submit to create an order.
- **Edit Order**: Update the associated customer for an order.
- **Delete Order**: Remove an order from the database.

---

## Future Enhancements
- Add authentication and user roles.
- Implement search and filter functionalities for customers and orders.
- Add support for bulk operations (e.g., bulk delete).
- Migrate the database to a more scalable solution like PostgreSQL.

---

## License
This project is licensed under the [MIT License](LICENSE).

---

## Contact
For any inquiries or suggestions, feel free to reach out:
- **Name**: Your Name
- **Email**: your.email@example.com
- **GitHub**: [yourusername](https://github.com/PriyaG11)
