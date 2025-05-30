<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin Home - Diu Library Portal</title>
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
                        <li class="nav-item"><a class="nav-link" href="/adminhome">Home Page</a></li>
                        <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container-fostrap">
            <div class="container">
                <!-- Jumbotron -->
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="admin-jumbotron">
                            <h1>Welcome Back, Admin</h1>
                            <hr>
                            <p>Manage your data from this Admin Panel</p>
                        </div>
                    </div>
                </div>

                <!-- Admin Cards -->
                <div class="row justify-content-center card-grid mt-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h4>Categories</h4>
                                <p>Manage the categories section here.</p>
                                <a href="/admin/categories" class="btn btn-modern">Manage</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h4>Books</h4>
                                <p>Manage all the Books here.</p>
                                <a href="/admin/books" class="btn btn-modern">Manage</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <h4>Members</h4>
                                <p>Manage all the Members here.</p>
                                <a href="/admin/members" class="btn btn-modern">Manage</a>
                            </div>
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

        /* Jumbotron */
        .admin-jumbotron {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 40px;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
        }

        .admin-jumbotron h1 {
            font-size: 2.5rem;
            color: var(--white);
            font-weight: 600;
            margin-bottom: 20px;
        }

        .admin-jumbotron hr {
            border-top: 1px solid var(--primary-blue);
            margin: 20px auto;
            width: 50%;
        }

        .admin-jumbotron p {
            font-size: 1.2rem;
            color: var(--text-color);
        }

        /* Card Grid */
        .card-grid {
            gap: 20px;
        }

        .card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 100%;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        .card-body {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            align-items: center;
        }

        .card-body h4 {
            font-size: 1.5rem;
            color: var(--white);
            font-weight: 600;
        }

        .card-body p {
            font-size: 1rem;
            color: var(--text-color);
            margin: 0;
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
            .admin-jumbotron h1 {
                font-size: 2rem;
            }
            .admin-jumbotron p {
                font-size: 1rem;
            }
            .card-body h4 {
                font-size: 1.3rem;
            }
            .card-grid .col-lg-3 {
                margin-bottom: 20px;
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