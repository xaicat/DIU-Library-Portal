from pathlib import Path

# README content
readme_content = """
# 📚 Spring Boot Book Store Management System

A full-stack **Spring Boot-based Book Store Management System** for managing users, admins, categories, and book inventories.

---

## ✨ Features

- **Authentication**: Admin and user login with session-based control.
- **Admin Functionalities**:
  - Add, update, delete book categories.
  - Add, update, delete book details.
  - View registered users.
- **User Functionalities**:
  - Register and login securely.
  - Update user profile.
  - View and rent books.
- **Error Handling**: Validations and exceptions handled with user-friendly messages.
- **MVC Structure**: Clean separation of concerns using Spring MVC.

---

## 🗂️ Project Structure

- `controller/`
  - `AdminController.java`: Admin panel and book/category management.
  - `UserController.java`: User registration, login, and book view.
- `JtSpringProjectApplication.java`: Entry point of the Spring Boot application.

---

## ⚙️ Technologies Used

- Java 17+
- Spring Boot
- Spring MVC
- JDBC with MySQL
- Thymeleaf (HTML templating)
- CSS/JS for frontend styling

---

## 🛠️ Setup Instructions

1. **Clone the project**
    ```bash
    git clone https://github.com/your-repo/JtSpringProject.git
    cd JtSpringProject
    ```

2. **Database Setup**
    - Create a database named `springproject` in MySQL.
    - Use the following tables:

    ```sql
    CREATE TABLE users (
        uid INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(255),
        password VARCHAR(255),
        email VARCHAR(255),
        address VARCHAR(255)
    );

    CREATE TABLE categories (
        categoryid INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255)
    );

    CREATE TABLE books (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255),
        image VARCHAR(255),
        categoryid INT,
        quantity INT,
        price INT,
        weight INT,
        description TEXT,
        FOREIGN KEY (categoryid) REFERENCES categories(categoryid)
    );
    ```

3. **Run the Application**
    ```bash
    ./mvnw spring-boot:run
    ```

4. **Access the Application**
    - User Login: [http://localhost:8080](http://localhost:8080)
    - Admin Login: [http://localhost:8080/admin](http://localhost:8080/admin)
      - Admin credentials: `admin` / `123`

---

## 📬 Contact

For any issues or enhancements, feel free to open an issue or contact the developer.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
"""

# Save to .txt file
output_path = Path("/mnt/data/README_for_JtSpringProject.txt")
output_path.write_text(readme_content.strip())

output_path.name  # Return the file name for user reference
