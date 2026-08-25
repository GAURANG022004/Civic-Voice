<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | CivicVoice</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .wrapper {
            display: flex;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background: #343a40;
            color: white;
            padding: 20px 0;
            position: fixed;
            height: 100%;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .sidebar-header {
            padding: 0 20px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .sidebar-menu {
            padding: 20px;
        }
        
        .sidebar-menu p {
            color: rgba(255,255,255,0.8);
            margin-bottom: 15px;
            font-size: 15px;
            line-height: 1.5;
        }
        
        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: 250px;
            padding: 30px;
        }
        
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }
        
        .card h3 {
            background-color: #343a40;
            color: white;
            padding: 15px 20px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            font-size: 18px;
        }
        
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            padding: 25px;
        }
        
        .stat-box {
            background: white;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        
        .stat-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .stat-box i {
            font-size: 2rem;
            margin-bottom: 10px;
            color: #6C5CE7;
        }
        
        .stat-box p {
            margin: 0;
            font-size: 15px;
            font-weight: 600;
            color: #495057;
        }
        
        .logout-btn {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h4><i class="fas fa-landmark mr-2"></i>CivicVoice</h4>
            </div>
            <div class="sidebar-menu">
                <p>Welcome to the CivicVoice Admin Portal. This dashboard provides tools for managing all aspects of the grievance system.</p>
                <p>From here you can oversee officer accounts, citizen registrations, and reported issues.</p>
                <p>Use the quick action buttons to navigate to different management sections.</p>
                <p>For assistance, please contact the system administrator.</p>
            </div>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <div class="card">
                <h3><i class="fas fa-user-shield mr-2"></i> Admin Dashboard</h3>
                <div class="stats">
                    <div class="stat-box">
                        <a href="addOfficer">
                            <i class="fas fa-user-plus"></i>
                            <p>Add Officer</p>
                        </a>
                    </div>

                    <div class="stat-box">
                        <a href="viewOfficers">
                            <i class="fas fa-users-cog"></i>
                            <p>View Officers</p>
                        </a>
                    </div>

                    <div class="stat-box">
                        <a href="viewCitizens">
                            <i class="fas fa-user-friends"></i>
                            <p>View Citizens</p>
                        </a>
                    </div>

                    <div class="stat-box">
                        <a href="myGrievances">
                            <i class="fas fa-file-alt"></i>
                            <p>View Grievances</p>
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="logout-btn">
                <a href="adminLogout" class="btn btn-danger">
                    <i class="fas fa-sign-out-alt mr-2"></i> Logout
                </a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>