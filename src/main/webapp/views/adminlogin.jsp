<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Login - Diu Library Portal</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://img.icons8.com/color/48/000000/shop.png">
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
                        <li class="nav-item"><a class="nav-link" th:href="@{/}" href="#">Home</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container-fostrap">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6 col-md-8">
                        <div class="login-form">
                            <h2>Admin Login</h2>
                            <form action="loginvalidate" method="post">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" name="username" id="username" placeholder="Admin Username*" required class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" name="password" id="password" placeholder="Admin Password*" required class="form-control">
                                </div>
                                <button type="submit" class="btn btn-modern btn-block">Login</button>
                                <h3 class="error-message" th:text="${message}"></h3>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Back to Top Button -->
            <button id="back-to-top" title="Back to Top"><i class="fas fa-arrow-up"></i></button>
        </div>
    </section>

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
            text-align: center;
        }

        .wrapper {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .container-fostrap {
            flex: 1;
            padding: 40px 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Navbar */
        .navbar {
            background: linear-gradient(90deg, var(--dark-blue), #1c2f4f);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 15px 0;
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

        /* Login Form */
        .login-form {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 30px;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .login-form h2 {
            font-size: 2rem;
            color: var(--white);
            font-weight: 600;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            font-size: 1.1rem;
            color: var(--white);
            font-weight: 500;
            display: block;
            margin-bottom: 5px;
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

        .btn-modern {
            background: var(--primary-blue);
            color: var(--white);
            padding: 12px 25px;
            border-radius: 25px;
            text-transform: uppercase;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-modern:hover {
            background: #187bcd;
            transform: translateY(-2px);
        }

        .error-message {
            color: #ff4d4d;
            font-size: 1.2rem;
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
            z-index: 9999;
            transition: transform 0.1s ease;
        }

        @media (max-width: 768px) {
            .login-form {
                padding: 20px;
            }
            .login-form h2 {
                font-size: 1.8rem;
            }
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
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