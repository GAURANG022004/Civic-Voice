<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - CivicVoice</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4895ef;
            --light: #f8f9fa;
            --dark: #212529;
            --success: #4cc9f0;
            --warning: #f72585;
            --glass: rgba(255, 255, 255, 0.15);
            --glass-border: rgba(255, 255, 255, 0.2);
        }

        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
            transition: all 0.5s ease;
        }

        body.with-bg-image {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('https://www.freepik.com/free-ai-image/worker-protesting-working-rights_204466575.htm#fromView=keyword&page=2&position=2&uuid=92b6b865-58f5-442e-89b3-ed0f21fbce0e&query=Civic+Voice');
            background-size: cover;
        }

        .bg-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 100;
            background: var(--glass);
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            border-radius: 50px;
            padding: 8px 15px;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .bg-toggle:hover {
            background: rgba(255, 255, 255, 0.25);
        }

        .container {
            background: var(--glass);
            padding: 40px;
            border-radius: 20px;
            backdrop-filter: blur(15px);
            box-shadow: 0 25px 45px rgba(0, 0, 0, 0.2),
                        0 0 0 1px rgba(255, 255, 255, 0.1);
            width: 420px;
            animation: fadeInUp 0.8s cubic-bezier(0.36, 0.07, 0.19, 0.97) both;
            transform-style: preserve-3d;
            perspective: 1000px;
            border: 1px solid var(--glass-border);
            transition: transform 0.5s, box-shadow 0.5s;
        }

        .container:hover {
            transform: translateY(-5px) rotateX(2deg) rotateY(2deg);
            box-shadow: 0 35px 60px rgba(0, 0, 0, 0.3),
                        0 0 0 1px rgba(255, 255, 255, 0.15);
        }

        h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            letter-spacing: 1px;
        }

        .logo {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo i {
            font-size: 40px;
            color: white;
            background: var(--accent);
            padding: 15px;
            border-radius: 50%;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .tabs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            gap: 10px;
        }

        .tabs button {
            flex: 1;
            padding: 12px;
            border: none;
            background: var(--glass);
            color: #fff;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            border-radius: 8px;
            position: relative;
            overflow: hidden;
            font-size: 14px;
            letter-spacing: 0.5px;
        }

        .tabs button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }

        .tabs button:hover::before {
            left: 100%;
        }

        .tabs button.active {
            background: white;
            color: var(--primary);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .form {
            display: none;
            flex-direction: column;
            animation: fadeIn 0.5s ease-out;
        }

        .form.active {
            display: flex;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }

        input {
            padding: 15px 15px 15px 45px;
            width: 100%;
            border: none;
            border-radius: 8px;
            outline: none;
            background: rgba(255, 255, 255, 0.9);
            font-size: 14px;
            transition: all 0.3s ease;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        input:focus {
            background: white;
            box-shadow: 0 0 0 2px var(--accent), 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            font-size: 18px;
        }

        .btn {
            padding: 15px;
            background: white;
            border: none;
            color: var(--primary);
            font-weight: 600;
            cursor: pointer;
            border-radius: 8px;
            transition: all 0.4s cubic-bezier(0.68, -0.55, 0.265, 1.55);
            margin-top: 10px;
            font-size: 16px;
            letter-spacing: 0.5px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .btn:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }

        .btn:active {
            transform: translateY(0);
        }

        .btn::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%, -50%);
            transform-origin: 50% 50%;
        }

        .btn:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
        }

        .register-link a {
            color: #ffd700;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .register-link a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 1px;
            background: #ffd700;
            transition: width 0.3s ease;
        }

        .register-link a:hover::after {
            width: 100%;
        }

        .floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
        }

        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(5px);
            border-radius: 50%;
            animation: float 15s infinite linear;
        }

        .shape:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 20%;
            left: 10%;
            animation-duration: 20s;
        }

        .shape:nth-child(2) {
            width: 150px;
            height: 150px;
            top: 60%;
            left: 70%;
            animation-duration: 25s;
        }

        .shape:nth-child(3) {
            width: 80px;
            height: 80px;
            top: 80%;
            left: 20%;
            animation-duration: 15s;
        }

        .shape:nth-child(4) {
            width: 120px;
            height: 120px;
            top: 30%;
            left: 80%;
            animation-duration: 30s;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translate3d(0, 30px, 0) rotateX(10deg);
            }
            to {
                opacity: 1;
                transform: translate3d(0, 0, 0) rotateX(0);
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
            100% {
                transform: translateY(0) rotate(360deg);
            }
        }

        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 0.5;
            }
            100% {
                transform: scale(20, 20);
                opacity: 0;
            }
        }

        /* Responsive adjustments */
        @media (max-width: 480px) {
            .container {
                width: 90%;
                padding: 30px 20px;
            }
            
            .tabs {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
<div class="floating-shapes">
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
    <div class="shape"></div>
</div>

<div class="bg-toggle" id="bgToggle">
    <i class="fas fa-image"></i>
    <span>Background</span>
</div>

<div class="container">
    <div class="logo">
        <i class="fas fa-landmark"></i>
    </div>
    <h2>CivicVoice Portal</h2>

    <div class="tabs">
        <button class="tab-button active" onclick="showForm('admin')">
            <i class="fas fa-user-shield"></i> Admin
        </button>
        <button class="tab-button" onclick="showForm('citizen')">
            <i class="fas fa-user"></i> Citizen
        </button>
        <button class="tab-button" onclick="showForm('officer')">
            <i class="fas fa-user-tie"></i> Officer
        </button>
    </div>

    <!-- Admin Login -->
    <form action="AdminLogin" method="post" class="form active" id="admin-form">
        <div class="input-group">
            <i class="fas fa-id-card input-icon"></i>
            <input type="text" name="email" placeholder="email" required />
        </div>
        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" name="password" placeholder="password" required />
        </div>
        <button type="submit" class="btn">
            <i classs="fas fa-sign-in-alt"></i> Login as Admin
        </button>
    </form>

    <!-- Citizen Login -->
    <form action="CitizenLogin" method="post" class="form" id="citizen-form">
        <div class="input-group">
            <i class="fas fa-id-card input-icon"></i>
            <input type="email" name="email" placeholder="Email" required />
        </div>
        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" name="password" placeholder="Password" required />
        </div>
        <button type="submit" class="btn">
            <i class="fas fa-sign-in-alt"></i> Login as Citizen
        </button>
        <div class="register-link">
            New Citizen? <a href="registerCitizen">Register here</a>
        </div>
    </form>

    <!-- Officer Login -->
    <form action="OfficerLogin" method="post" class="form" id="officer-form">
        <div class="input-group">
            <i class="fas fa-id-card input-icon"></i>
            <input type="email" name="email" placeholder="Email" required />
        </div>
        <div class="input-group">
            <i class="fas fa-lock input-icon"></i>
            <input type="password" name="password" placeholder="Password" required />
        </div>
        <button type="submit" class="btn">
            <i class="fas fa-sign-in-alt"></i> Login as Officer
        </button>
        <div class="register-link">
            New Officer? <a href="registerOfficer">Register here</a>
        </div>
    </form>
</div>

<script>
    function showForm(userType) {
        const buttons = document.querySelectorAll('.tab-button');
        const forms = document.querySelectorAll('.form');

        buttons.forEach(btn => btn.classList.remove('active'));
        forms.forEach(form => form.classList.remove('active'));

        document.getElementById(userType + '-form').classList.add('active');
        event.currentTarget.classList.add('active');
    }

    // Background toggle functionality
    const bgToggle = document.getElementById('bgToggle');
    bgToggle.addEventListener('click', function() {
        document.body.classList.toggle('with-bg-image');
        
        // Change icon and text
        const icon = this.querySelector('i');
        const text = this.querySelector('span');
        
        if (document.body.classList.contains('with-bg-image')) {
            icon.className = 'fas fa-image-slash';
            text.textContent = 'Plain BG';
        } else {
            icon.className = 'fas fa-image';
            text.textContent = 'Background';
        }
    });

    // Add ripple effect to buttons
    document.addEventListener('DOMContentLoaded', function() {
        const buttons = document.querySelectorAll('.btn');
        buttons.forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                // Ripple effect is handled via CSS on focus
                this.focus();
                
                // Submit form after animation
                setTimeout(() => {
                    this.closest('form').submit();
                }, 500);
            });
        });
    });
</script>
</body>
</html>