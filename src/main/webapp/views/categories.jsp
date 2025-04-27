<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Categories - Diu Library Portal</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://img.icons8.com/color/48/000000/shop.png">
    <style>
        :root {
            --primary-blue: #1e90ff;
            --dark-blue: #0a1a2e;
            --light-blue: #4da8da;
            --white: #fff;
            --text-color: #d3d3d3;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--dark-blue);
            color: var(--text-color);
            overflow-x: hidden;
        }

        .wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container-fostrap {
            flex: 1;
            padding: 40px 0;
        }

        /* Navbar */
        .navbar {
            background: linear-gradient(90deg, var(--dark-blue), #1c2f4f);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 15px 0;
            z-index: 1030; /* Below modals */
        }

        .navbar-brand {
            font-size: 1.5rem;
            color: var(--white);
            font-weight: 600;
        }

        .navbar-brand img {
            margin-right: 10px;
        }

        .navbar-brand span {
            color: var(--primary-blue);
        }

        .nav-link {
            color: var(--white);
            font-weight: 400;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: var(--primary-blue);
        }

        /* Categories Section */
        .categories-section {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .categories-section h2 {
            font-size: 2rem;
            color: var(--white);
            font-weight: 600;
            margin-bottom: 20px;
        }

        .btn-modern {
            background: var(--primary-blue);
            color: var(--white);
            padding: 10px 20px;
            border-radius: 25px;
            text-transform: uppercase;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-modern:hover {
            background: #187bcd;
            transform: translateY(-2px);
        }

        .btn-danger {
            background: #ff4d4d;
            padding: 8px 15px;
            border-radius: 25px;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-danger:hover {
            background: #e63939;
            transform: translateY(-2px);
        }

        .btn-warning {
            background: #ffcc00;
            padding: 8px 15px;
            border-radius: 25px;
            color: #333;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-warning:hover {
            background: #e6b800;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: #6c757d;
            padding: 8px 15px;
            border-radius: 25px;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-2px);
        }

        /* Table */
        .table {
            width: 100%;
            margin-bottom: 1rem;
            color: var(--text-color);
            background: transparent;
        }

        .table thead th {
            background: var(--primary-blue);
            color: var(--white);
            font-weight: 600;
            border: none;
            padding: 15px;
            text-align: center;
        }

        .table tbody tr {
            background: rgba(255, 255, 255, 0.03);
            transition: background 0.3s ease;
        }

        .table tbody tr:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .table td {
            padding: 15px;
            vertical-align: middle;
            border: none;
            text-align: center;
        }

        /* Modal */
        .modal {
            z-index: 1050; /* Above all content */
        }

        .modal-backdrop {
            z-index: 1040; /* Below modal, above content */
        }

        .modal-dialog {
            max-width: 500px; /* Consistent width */
            margin: 1.75rem auto; /* Default Bootstrap margin */
        }

        .modal-content {
            background: var(--dark-blue);
            color: var(--text-color);
            border-radius: 15px;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
        }

        .modal-header {
            background: var(--primary-blue);
            color: var(--white);
            border-bottom: none;
            padding: 15px 20px;
        }

        .modal-title {
            font-weight: 600;
        }

        .modal-body {
            padding: 20px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background: rgba(255, 255, 255, 0.1);
            color: var(--white);
            font-size: 1rem;
            transition: background 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            color: var(--white);
            outline: none;
            box-shadow: 0 0 5px var(--primary-blue);
        }

        .form-control::placeholder {
            color: var(--text-color);
        }

        .form-control[readonly] {
            background: rgba(255, 255, 255, 0.05);
            opacity: 0.7;
        }

        .modal-footer {
            border-top: none;
            justify-content: center;
            padding: 15px 20px;
        }

        .error-message {
            color: #ff4d4d;
            font-size: 1.2rem;
            text-align: center;
        }

        /* Back to Top Button */
        #back-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 50px;
            height: 50px;
            background: var(--primary-blue);
            border: none;
            border-radius: 50%;
            color: var(--white);
            font-size: 1.5rem;
            cursor: pointer;
            opacity: 0;
            transition: opacity 0.3s ease;
            z-index: 1030; /* Below modals */
        }

        #back-to-top.visible {
            opacity: 1;
        }

        /* Mouse Effects */
        body::after {
            content: '';
            position: fixed;
            width: 20px;
            height: 20px;
            background: radial-gradient(circle, rgba(30, 144, 255, 0.3), transparent);
            border-radius: 50%;
            pointer-events: none;
            transform: translate(-50%, -50%);
            z-index: 1020; /* Below modals and back-to-top */
            transition: transform 0.1s ease;
        }

        @media (max-width: 768px) {
            .categories-section {
                padding: 20px;
            }
            .categories-section h2 {
                font-size: 1.8rem;
            }
            .table td, .table th {
                padding: 10px;
                font-size: 0.9rem;
            }
            .btn {
                padding: 6px 12px;
            }
            .modal-dialog {
                margin: 1rem auto;
                max-width: 90%;
            }
        }
    </style>
</head>
<body>
    <section class="wrapper">
        <!-- Sticky Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand mx-auto" href="/adminhome">
                    <img src="https://i.imgur.com/xnfrPes.png" width="160" height="42" alt="Diu Library Portal" class="d-inline-block align-top">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="/adminhome">Home Page</a></li>
                        <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container-fostrap">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="categories-section">
                            <h2>Categories</h2>
                            <button type="button" class="btn btn-modern mb-4" data-toggle="modal" data-target="#addCategoryModal">Add Category</button>
                            
                            <!-- Add Category Modal -->
                            <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <form action="sendcategory" method="get">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="addCategoryModalLabel">Add New Category</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body text-center">
                                                <input type="text" name="categoryname" class="form-control" required placeholder="Category Name">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <input type="submit" value="Save Changes" class="btn btn-modern">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Categories Table -->
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">SN</th>
                                        <th scope="col">Category Name</th>
                                        <th scope="col">Delete</th>
                                        <th scope="col">Update</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    try {
                                        String url = "jdbc:mysql://localhost:3306/springproject";
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection(url, "root", "");
                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery("select * from categories");
                                        while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%= rs.getInt(1) %></td>
                                        <td><%= rs.getString(2) %></td>
                                        <td>
                                            <form action="categories/delete" method="get">
                                                <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
                                                <input type="submit" value="Delete" class="btn btn-danger">
                                            </form>
                                        </td>
                                        <td>
                                            <form action="categories/update" method="get">
                                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#updateCategoryModal<%= rs.getInt(1) %>">Update</button>
                                                
                                                <!-- Update Category Modal -->
                                                <div class="modal fade" id="updateCategoryModal<%= rs.getInt(1) %>" tabindex="-1" role="dialog" aria-labelledby="updateCategoryModalLabel<%= rs.getInt(1) %>" aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="updateCategoryModalLabel<%= rs.getInt(1) %>">Update Category</h5>
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                    <span aria-hidden="true">&times;</span>
                                                                </button>
                                                            </div>
                                                            <div class="modal-body text-center">
                                                                <div class="form-group">
                                                                    <input type="number" name="categoryid" class="form-control" value="<%= rs.getInt(1) %>" readonly>
                                                                </div>
                                                                <div class="form-group">
                                                                    <input type="text" name="categoryname" class="form-control" value="<%= rs.getString(2) %>" required>
                                                                </div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-modern">Update Changes</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                        rs.close();
                                        stmt.close();
                                        con.close();
                                    } catch (Exception ex) {
                                        out.println("<tr><td colspan='4' class='error-message'>Exception Occurred: " + ex.getMessage() + "</td></tr>");
                                    }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Back to Top Button -->
            <button id="back-to-top" title="Back to Top"><i class="fas fa-arrow-up"></i></button>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script>
        // Ensure modals work correctly
        $(document).ready(function() {
            // Reinitialize modals to avoid conflicts
            $('.modal').each(function() {
                $(this).modal({ show: false });
            });

            // Handle modal toggle manually if needed
            $('[data-toggle="modal"]').on('click', function(e) {
                e.preventDefault();
                var target = $(this).data('target');
                $(target).modal('show');
            });
        });

        // Back to Top
        const backToTop = document.getElementById('back-to-top');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 300) {
                backToTop.classList.add('visible');
            } else {
                backToTop.classList.remove('visible');
            }
        });

        backToTop.addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });

        // Mouse Effect
        document.addEventListener('mousemove', (e) => {
            const cursor = document.body.querySelector(':after');
            cursor.style.left = `${e.clientX}px`;
            cursor.style.top = `${e.clientY}px`;
        });
    </script>
</body>
</html>