<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Products - Modern Shop</title>
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

        th:nth-child(4), td:nth-child(4) {
        display: none;
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
            z-index: 1030;
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

        /* Products Section */
        .products-section {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
        }

        .products-section h2 {
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

        /* Table */
        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }

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
            white-space: nowrap;
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
            white-space: nowrap;
        }

        .table img {
            border-radius: 5px;
            object-fit: cover;
        }

        .error-message {
            color: #ff4d4d;
            font-size: 1.2rem;
            text-align: center;
            margin-top: 20px;
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
            z-index: 1030;
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
            z-index: 1020;
            transition: transform 0.1s ease;
        }

        @media (max-width: 768px) {
            .products-section {
                padding: 20px;
            }
            .table td, .table th {
                padding: 10px;
                font-size: 0.9rem;
            }
            .btn {
                padding: 6px 12px;
            }
        }
    </style>
</head>
<body>
    <section class="wrapper">
        <!-- Sticky Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand mx-auto" href="#">
                    <img src="https://i.imgur.com/xnfrPes.png" width="160" height="42" alt="Shop Logo" class="d-inline-block align-top">
    
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
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="products-section">
                            <h2>Available Products</h2>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Serial No.</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Preview</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Weight</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Buy</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        try {
                                            String url = "jdbc:mysql://localhost:3306/springproject";
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            Connection con = DriverManager.getConnection(url, "root", "");
                                            Statement stmt = con.createStatement();
                                            Statement stmt2 = con.createStatement();
                                            ResultSet rs = stmt.executeQuery("SELECT * FROM products");
                                            while (rs.next()) {
                                        %>
                                        <tr>
                                            <td><%= rs.getInt(1) %></td>
                                            <td><%= rs.getString(2) %></td>
                                            <td>
                                                <%
                                                int categoryid = rs.getInt(4);
                                                ResultSet rs2 = stmt2.executeQuery("SELECT * FROM categories WHERE categoryid = " + categoryid + ";");
                                                if (rs2.next()) {
                                                    out.print(rs2.getString(2));
                                                }
                                                rs2.close();
                                                %>
                                            </td>
                                            <td>
                                                <img src="https://th.bing.com/th/id/R.fd048601910e87d09c670b696ed153a0?rik=MCuRFnBGgWZPjA&riu=http%3a%2f%2fimages2.fanpop.com%2fimages%2fphotos%2f7300000%2fSlice-of-Pizza-pizza-7383219-1600-1200.jpg&ehk=Nr%2f8Tpc4Z3p5bgSOdOEWHlN1XJS1y7jol5%2bkS6qXCpE%3d&risl=&pid=ImgRaw&r=0"
                                                     height="100px" width="100px" alt="<%= rs.getString(2) %>">
                                            </td>
                                            <td><%= rs.getInt(5) %></td>
                                            <td>$<%= String.format("%.2f", rs.getFloat(6)) %></td>
                                            <td><%= rs.getInt(7) %> kg</td>
                                            <td><%= rs.getString(8) %></td>
                                            <td>
                                                <form action="/buy" method="get">
                                                    <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
                                                    <button type="submit" class="btn btn-modern">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                                        </svg> Buy
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                        <%
                                            }
                                            rs.close();
                                            stmt.close();
                                            stmt2.close();
                                            con.close();
                                        } catch (Exception ex) {
                                            out.println("<div class='error-message'>Exception Occurred: " + ex.getMessage() + "</div>");
                                        }
                                        %>
                                    </tbody>
                                </table>
                            </div>
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