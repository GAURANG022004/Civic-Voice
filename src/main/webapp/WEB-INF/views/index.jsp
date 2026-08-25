<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CivicVoice - Welcome</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
      color: white;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
    }

    .container {
      background: rgba(255, 255, 255, 0.05);
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
      backdrop-filter: blur(10px);
      text-align: center;
      animation: slideIn 1.2s ease-in-out;
    }

    @keyframes slideIn {
      0% { transform: translateY(-100vh); opacity: 0; }
      100% { transform: translateY(0); opacity: 1; }
    }

    h1 {
      font-size: 2.5rem;
      margin-bottom: 20px;
      color: #00ffd5;
      text-shadow: 0 0 10px #00ffd5, 0 0 30px #00ffd5;
    }

    p {
      font-size: 1.2rem;
      margin-bottom: 30px;
      color: #eee;
    }

    .btn {
      padding: 12px 25px;
      font-size: 1rem;
      color: white;
      background: linear-gradient(45deg, #00d2ff, #3a47d5);
      border: none;
      border-radius: 50px;
      cursor: pointer;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .btn:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0, 210, 255, 0.7);
    }

    .glow-effect {
      position: absolute;
      width: 300px;
      height: 300px;
      background: radial-gradient(circle, #00ffd5, transparent);
      filter: blur(80px);
      animation: floatGlow 8s ease-in-out infinite;
    }

    @keyframes floatGlow {
      0%, 100% { transform: translate(0, 0); }
      50% { transform: translate(100px, 80px); }
    }
  </style>
</head>
<body>
  <div class="glow-effect"></div>
  <div class="container">
    <h1>Welcome to CivicVoice</h1>
    <p>Empowering citizens through modern digital grievance redressal</p>
    <form action="login">
      <button type="submit" class="btn">Get Started</button>
    </form>
  </div>
</body>
</html>
