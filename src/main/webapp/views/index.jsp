<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Modern Shop</title>
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
                <a class="navbar-brand mx-auto" href="#">
                    <img th:src="@{/images/logo.png}" src="https://img.icons8.com/color/48/000000/shop.png" width="40" height="40" alt="Shop Logo" class="d-inline-block align-top">
                    <span>ShopNow</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <h4 class="text-white mx-auto">Welcome ${username}</h4>
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" th:href="@{/}" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="profileDisplay">Profile</a></li>
                        <li class="nav-item"><a class="nav-link" sec:authorize="isAuthenticated()" href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container-fostrap">
            <div class="container">
                <!-- Product Slider -->
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="product-slider">
                            <div class="slider-grid" id="sliderproduct">
                                <div class="slider-item active">
                                    <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Burger">
                                    <div class="slider-details">
                                        <h2>Gourmet Burger</h2>
                                        <p>Tomato, green salad, pita, ketchup, mayonnaise...</p>
                                        <div class="rating">
                                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                        </div>
                                        <p class="price">$3.55 - $5.55</p>
                                        <div class="timer">
                                            <span>2 days</span><span>20 hrs</span><span>15 min</span><span>2 sec</span>
                                        </div>
                                        <a href="/user/products" class="btn btn-modern">Buy Now</a>
                                    </div>
                                </div>
                                <div class="slider-item">
                                    <img src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Pizza">
                                    <div class="slider-details">
                                        <h2>Cheese Pizza</h2>
                                        <p>Margarita, ketchup, mayonnaise...</p>
                                        <div class="rating">
                                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                        </div>
                                        <p class="price">$3.55 - $5.55</p>
                                        <div class="timer">
                                            <span>2 days</span><span>20 hrs</span><span>15 min</span><span>2 sec</span>
                                        </div>
                                        <a href="/user/products" class="btn btn-modern">Buy Now</a>
                                    </div>
                                </div>
                                <div class="slider-item">
                                    <img src="https://images.unsplash.com/photo-1511994298241-608e3d7a6a3e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Fruits">
                                    <div class="slider-details">
                                        <h2>Fresh Fruits</h2>
                                        <p>Assorted seasonal fruits...</p>
                                        <div class="rating">
                                            <i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i>
                                        </div>
                                        <p class="price">$3.55 - $5.55</p>
                                        <div class="timer">
                                            <span>2 days</span><span>20 hrs</span><span>15 min</span><span>2 sec</span>
                                        </div>
                                        <a href="/user/products" class="btn btn-modern">Buy Now</a>
                                    </div>
                                </div>
                            </div>
                            <button class="slider-arrow prev"><i class="fas fa-chevron-left"></i></button>
                            <button class="slider-arrow next"><i class="fas fa-chevron-right"></i></button>
                        </div>
                    </div>
                </div>

                <!-- Card Section (Proportional to Slider) -->
                <div class="row justify-content-center card-grid mt-5">
                    <div class="col-lg-5">
                        <div class="card">
                            <img src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Best Deals">
                            <div class="card-content">
                                <h4>Best Deals</h4>
                                <p>Check out our latest products!</p>
                                <a href="/user/products" class="btn btn-modern">Go</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="card">
                            <img src="https://images.unsplash.com/photo-1596524430619-036920289518?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80" alt="Contact Us">
                            <div class="card-content">
                                <h4>Contact Us</h4>
                                <p>Find us anytime!</p>
                                <a href="/contact" class="btn btn-modern">Contact</a>
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

        /* Product Slider */
        .product-slider {
            position: relative;
            margin: 0 auto;
            padding: 20px 0;
        }

        .slider-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 20px;
            backdrop-filter: blur(5px);
        }

        .slider-item {
            display: none;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            transition: opacity 0.5s ease;
        }

        .slider-item.active {
            display: grid;
            opacity: 1;
        }

        .slider-item img {
            max-width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .slider-details {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            align-items: center;
        }

        .slider-details h2 {
            font-size: 2rem;
            color: var(--white);
            font-weight: 600;
        }

        .slider-details p {
            font-size: 1rem;
            line-height: 1.6;
        }

        .rating .fa-star {
            color: #ffd700;
            margin: 0 2px;
        }

        .price {
            font-size: 1.3rem;
            color: var(--primary-blue);
        }

        .timer {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            justify-content: center;
            margin-bottom: 15px;
        }

        .timer span {
            background: var(--light-blue);
            color: var(--white);
            padding: 8px 12px;
            border-radius: 5px;
            font-size: 0.9rem;
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

        .slider-arrow {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 50px;
            height: 50px;
            background: var(--primary-blue);
            border: none;
            border-radius: 50%;
            color: var(--white);
            font-size: 1.5rem;
            cursor: pointer;
            transition: background 0.3s ease;
            z-index: 10;
        }

        .slider-arrow.prev {
            left: 10px;
        }

        .slider-arrow.next {
            right: 10px;
        }

        .slider-arrow:hover {
            background: var(--light-blue);
        }

        /* Card Grid (Proportional to Slider) */
        .card-grid {
            gap: 20px;
        }

        .card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: 100%; /* Ensure full width within column */
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            align-items: center;
        }

        .card-content h4 {
            font-size: 1.5rem;
            color: var(--white);
            font-weight: 600;
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
            .slider-item {
                grid-template-columns: 1fr;
            }
            .slider-arrow.prev {
                left: 5px;
            }
            .slider-arrow.next {
                right: 5px;
            }
            .card-grid .col-lg-5 {
                width: 100%; /* Full width on smaller screens */
            }
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script>
        // Slider Functionality
        const sliderItems = document.querySelectorAll('.slider-item');
        const prevArrow = document.querySelector('.slider-arrow.prev');
        const nextArrow = document.querySelector('.slider-arrow.next');
        let currentIndex = 0;

        function showSlide(index) {
            sliderItems.forEach(item => item.classList.remove('active'));
            sliderItems[index].classList.add('active');
        }

        prevArrow.addEventListener('click', () => {
            currentIndex = (currentIndex === 0) ? sliderItems.length - 1 : currentIndex - 1;
            showSlide(currentIndex);
        });

        nextArrow.addEventListener('click', () => {
            currentIndex = (currentIndex === sliderItems.length - 1) ? 0 : currentIndex + 1;
            showSlide(currentIndex);
        });

        setInterval(() => {
            currentIndex = (currentIndex === sliderItems.length - 1) ? 0 : currentIndex + 1;
            showSlide(currentIndex);
        }, 5000);

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