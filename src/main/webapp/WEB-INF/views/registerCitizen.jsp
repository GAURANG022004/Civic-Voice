<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Citizen Registration | CivicVoice</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #6C5CE7;
            --secondary: #A29BFE;
            --accent: #FD79A8;
            --dark: #2D3436;
            --light: #F5F6FA;
            --glass: rgba(255, 255, 255, 0.15);
            --glass-border: rgba(255, 255, 255, 0.2);
            --transition: all 0.5s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        * {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            perspective: 1000px;
            overflow: hidden;
            position: relative;
        }

        /* Floating background elements */
        .floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: -1;
            pointer-events: none;
        }

        .shape {
            position: absolute;
            background: rgba(108, 92, 231, 0.1);
            border-radius: 50%;
            animation: float 15s infinite linear;
            filter: blur(2px);
        }

        /* Registration container */
        .register-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.3);
            width: 450px;
            transform-style: preserve-3d;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            backdrop-filter: blur(10px);
            border: 1px solid var(--glass-border);
            animation: slideUp 1s cubic-bezier(0.68, -0.55, 0.265, 1.55) both;
        }

        .register-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(108, 92, 231, 0.1) 0%, transparent 70%);
            transform: rotate(30deg);
            transition: var(--transition);
            z-index: -1;
        }

        .register-container:hover {
            transform: translateY(-10px) rotateX(2deg) rotateY(2deg);
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.4);
        }

        .register-container:hover::before {
            transform: rotate(60deg);
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px) rotateX(10deg);
            }
            to {
                opacity: 1;
                transform: translateY(0) rotateX(0);
            }
        }

        h2 {
            text-align: center;
            color: var(--primary);
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(to right, var(--primary), var(--accent));
            border-radius: 2px;
        }

        .form-group {
            position: relative;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            color: #555;
            transition: var(--transition);
        }

        .input-field {
            position: relative;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #eee;
            border-radius: 10px;
            font-size: 15px;
            transition: var(--transition);
            background-color: rgba(245, 246, 250, 0.8);
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(108, 92, 231, 0.2);
            background-color: white;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            font-size: 18px;
            transition: var(--transition);
        }

        input:focus + .input-icon {
            color: var(--accent);
            transform: translateY(-50%) scale(1.2);
        }

        button {
            width: 100%;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            padding: 16px;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 600;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(108, 92, 231, 0.3);
            margin-top: 10px;
        }

        button:hover {
            background: linear-gradient(135deg, var(--secondary), var(--primary));
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(108, 92, 231, 0.4);
        }

        button:active {
            transform: translateY(0);
        }

        button::after {
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

        button:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }

        .login-link {
            margin-top: 25px;
            text-align: center;
            color: #666;
        }

        .login-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
            position: relative;
        }

        .login-link a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary);
            transition: var(--transition);
        }

        .login-link a:hover::after {
            width: 100%;
        }

        /* Animations */
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

        /* Background toggle */
        .bg-toggle {
            position: absolute;
            bottom: 20px;
            right: 20px;
            z-index: 100;
            background: var(--glass);
            backdrop-filter: blur(5px);
            border: 1px solid var(--glass-border);
            border-radius: 50px;
            padding: 10px 15px;
            color: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            transition: var(--transition);
        }

        .bg-toggle:hover {
            background: rgba(255, 255, 255, 0.25);
        }
    </style>
</head>
<body>
    <!-- Floating background elements -->
    <div class="floating-shapes">
        <div class="shape" style="width: 150px; height: 150px; top: 20%; left: 10%; animation-duration: 20s;"></div>
        <div class="shape" style="width: 100px; height: 100px; top: 60%; left: 70%; animation-duration: 25s;"></div>
        <div class="shape" style="width: 80px; height: 80px; top: 80%; left: 20%; animation-duration: 15s;"></div>
    </div>

    <!-- Background toggle -->
    <div class="bg-toggle" id="bgToggle">
        <i class="fas fa-image"></i>
        <span>Background</span>
    </div>

    <div class="register-container">
        <h2><i class="fas fa-user-plus"></i> Register as Citizen</h2>
        <form action="registerCitizen" method="post">
            <div class="form-group">
                <label for="contactId">Contact ID</label>
                <div class="input-field">
                    <i class="fas fa-id-card input-icon"></i>
                    <input type="text" id="contactId" name="contactId" placeholder="Enter your contact ID" required>
                </div>
            </div>

            <div class="form-group">
                <label for="name">Full Name</label>
                <div class="input-field">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" id="name" name="name" placeholder="Enter your full name" required>
                </div>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <div class="input-field">
                    <i class="fas fa-map-marker-alt input-icon"></i>
                    <input type="text" id="address" name="address" placeholder="Enter your address" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <div class="input-field">
                    <i class="fas fa-envelope input-icon"></i>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>
                </div>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <div class="input-field">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" id="password" name="password" placeholder="Create a password" required>
                </div>
            </div>

            <button type="submit">
                <i class="fas fa-user-plus"></i> Register Now
            </button>
        </form>

        <div class="login-link">
            Already registered? <a href="login">Login here</a>
        </div>
    </div>

    <script>
        // Background toggle functionality
        const bgToggle = document.getElementById('bgToggle');
        let bgEnabled = false;
        
        bgToggle.addEventListener('click', function() {
            bgEnabled = !bgEnabled;
            if(bgEnabled) {
                document.body.style.background = "linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://source.unsplash.com/random/1920x1080/?city,community') no-repeat center center fixed";
                document.body.style.backgroundSize = "cover";
                this.innerHTML = '<i class="fas fa-image-slash"></i><span>Plain BG</span>';
            } else {
                document.body.style.background = "linear-gradient(135deg, #1e3c72, #2a5298)";
                this.innerHTML = '<i class="fas fa-image"></i><span>Background</span>';
            }
        });

        // Add ripple effect to buttons
        document.addEventListener('DOMContentLoaded', function() {
            const buttons = document.querySelectorAll('button');
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