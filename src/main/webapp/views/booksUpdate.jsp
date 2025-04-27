<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Update Books - Diu Library Portal</title>
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
        .form-section {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 110%;
            max-width: 800px;
            margin: 0 auto;
        }
        .form-section h2 {
            font-size: 2rem;
            color: var(--white);
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
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
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 5px;
            color: var(--white);
            padding: 5px;
            transition: background 0.3s ease;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            color: var(--white);
            outline: none;
            box-shadow: 0 0 5px var(--primary-blue);
        }
        .form-control[readonly] {
            background: rgba(255, 255, 255, 0.05);
            opacity: 0.7;
        }
        .form-control::placeholder {
            color: var(--text-color);
        }
        .custom-file-input ~ .custom-file-label {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 5px;
            color: var(--text-color);
            padding: 12px;
        }
        .custom-file-input:focus ~ .custom-file-label {
            background: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 5px var(--primary-blue);
        }
        .form-group label {
            color: var(--white);
            font-weight: 400;
        }
        .form-group img {
            border-radius: 5px;
            object-fit: cover;
        }
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
            .form-section {
                padding: 20px;
            }
            .form-section h2 {
                font-size: 1.8rem;
            }
            .form-control, .custom-file-label {
                padding: 10px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <section class="wrapper">
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

        <div class="container-fostrap">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="form-section">
                            <h2>Update Existing Product</h2>
                            <form action="updateData" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="id">Id</label>
                                            <input type="number" readonly="readonly" class="form-control" name="id" value="${pid}">
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" class="form-control" required name="name" value="${pname}" placeholder="Enter name">
                                        </div>
                                        <div class="form-group">
                                            <label for="categoryid">Select Category</label>
                                            <select class="form-control" name="categoryid" readonly>
                                                <option>${pcategory}</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Price</label>
                                            <input type="number" class="form-control" required name="price" value="${pprice}" min="1" placeholder="Price">
                                        </div>
                                        <div class="form-group">
                                            <label for="weight">Weight (grams)</label>
                                            <input type="number" class="form-control" required name="weight" value="${pweight}" min="1" placeholder="Weight">
                                        </div>
                                        <div class="form-group">
                                            <label for="quantity">Available Quantity</label>
                                            <input type="number" class="form-control" required name="quantity" value="${pquantity}" min="1" placeholder="Quantity">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="description">Product Description</label>
                                            <textarea class="form-control" rows="4" name="description" placeholder="Product Details">${pdescription}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <p>Product Image</p>
                                            <div class="custom-file">
                                                <input type="file" class="custom-file-input" name="productImage" accept="image/jpeg, image/png" id="productImage" onchange="loadFile(event)">
                                                <label class="custom-file-label" for="productImage">Choose file</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <img src="#" alt="Preview" id="imgPreview" height="100px" width="100px" style="margin-top: 20px;">
                                        </div>
                                        <input type="hidden" name="imgName">
                                        <input type="submit" class="btn btn-modern" value="Update Details">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <button id="back-to-top" title="Back to Top"><i class="fas fa-arrow-up"></i></button>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script>
        function loadFile(event) {
            var image = document.getElementById('imgPreview');
            image.src = URL.createObjectURL(event.target.files[0]);
        }
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
        document.addEventListener('mousemove', (e) => {
            const cursor = document.body.querySelector(':after');
            cursor.style.left = `${e.clientX}px`;
            cursor.style.top = `${e.clientY}px`;
        });
    </script>
</body>
</html>