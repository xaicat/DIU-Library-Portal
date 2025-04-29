# 📚 DIU Library Portal

**A Java Spring Boot-based web application designed to manage library resources and member operations for Daffodil International University (DIU).**

---

## 🚀 Features

### 👤 User Module
- 🔐 **User Registration & Login**
- 📖 **View Available Books**
- 🛒 **Book Rent Functionality**
- 📝 **Update Profile Information**

### 🛠️ Admin Module
- 🔐 **Admin Login (with secure access)**
- 📚 **Manage Books**
  - Add, update, or delete books
- 🏷️ **Manage Categories**
  - Add, update, or delete book categories
- 👥 **View Registered Members**

### 📑 Additional Features
- 📬 **Contact Page**
- 📊 **Profile Management**
- 🧾 **Admin Dashboard**

---

## 🗂️ Project Structure
├── controller/ │ ├── AdminController.java # All admin-related operations │ └── UserController.java # User interactions & registration ├── resources/ │ ├── templates/ # Thymeleaf HTML templates │ └── application.properties # Database and app config ├── JtSpringProjectApplication.java # Main class
