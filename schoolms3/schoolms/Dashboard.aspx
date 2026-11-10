<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="schoolms.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EduManage - School Management System</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #4361ee;
                --secondary: #3a0ca3;
                --accent: #f72585;
                --light: #f8f9fa;
                --dark: #212529;
                --success: #4cc9f0;
                --warning: #f9c74f;
                --danger: #f94144;
                --sidebar-width: 250px;
                --header-height: 70px;
                --border-radius: 12px;
                --transition: all 0.3s ease;
            }

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background-color: #f5f7fb;
                color: var(--dark);
                overflow-x: hidden;
            }

            /* Layout */
            .container {
                display: flex;
                min-height: 100vh;
            }

            /* Sidebar */
            .sidebar {
                width: var(--sidebar-width);
                background: linear-gradient(to bottom, var(--primary), var(--secondary));
                color: white;
                height: 100vh;
                position: fixed;
                transition: var(--transition);
                z-index: 1000;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }

            .sidebar-header {
                padding: 20px;
                text-align: center;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            }

            .sidebar-header h2 {
                font-size: 1.5rem;
                margin-top: 10px;
                animation: fadeIn 1s ease;
            }

            .sidebar-menu {
                padding: 20px 0;
            }

            .menu-item {
                padding: 15px 20px;
                display: flex;
                align-items: center;
                transition: var(--transition);
                cursor: pointer;
                border-left: 4px solid transparent;
                color: white;
                text-decoration: none;
            }

            .menu-item:hover {
                background-color: rgba(255, 255, 255, 0.1);
                border-left: 4px solid var(--accent);
                padding-left: 25px;
            }

            .menu-item.active {
                background-color: rgba(255, 255, 255, 0.15);
                border-left: 4px solid white;
            }

            .menu-item i {
                margin-right: 15px;
                font-size: 1.2rem;
            }

            /* Fix for link styling */
            .menu-item a {
                color: inherit;
                text-decoration: none;
                display: flex;
                align-items: center;
                width: 100%;
                height: 100%;
            }

            .menu-item a:hover {
                color: inherit;
            }

            /* Main Content */
            .main-content {
                flex: 1;
                margin-left: var(--sidebar-width);
                transition: var(--transition);
            }

            /* Header */
            .header {
                height: var(--header-height);
                background-color: white;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 30px;
                position: sticky;
                top: 0;
                z-index: 100;
            }

            .search-box {
                display: flex;
                align-items: center;
                background-color: var(--light);
                border-radius: 20px;
                padding: 8px 15px;
                width: 300px;
            }

            .search-box input {
                border: none;
                background: transparent;
                outline: none;
                padding: 5px;
                width: 100%;
            }

            .user-profile {
                display: flex;
                align-items: center;
                cursor: pointer;
            }

            .user-profile img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                object-fit: cover;
                margin-right: 10px;
                border: 2px solid var(--primary);
            }

            /* Content Area */
            .content {
                padding: 30px;
            }

            .page-title {
                margin-bottom: 30px;
                animation: slideIn 0.5s ease;
            }

            .page-title h1 {
                font-size: 2rem;
                color: var(--primary);
                margin-bottom: 10px;
            }

            .breadcrumb {
                display: flex;
                list-style: none;
                color: #6c757d;
            }

            .breadcrumb li {
                margin-right: 10px;
            }

            .breadcrumb li:after {
                content: '/';
                margin-left: 10px;
            }

            .breadcrumb li:last-child:after {
                content: '';
            }

            /* Cards */
            .cards {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .card {
                background: white;
                border-radius: var(--border-radius);
                padding: 20px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                transition: var(--transition);
                animation: fadeInUp 0.5s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            }

            .card-header {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 15px;
            }

            .card-icon {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 1.5rem;
                color: white;
            }

            .bg-primary { background-color: var(--primary); }
            .bg-success { background-color: var(--success); }
            .bg-warning { background-color: var(--warning); }
            .bg-danger { background-color: var(--danger); }

            .card-value {
                font-size: 2rem;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .card-title {
                color: #6c757d;
                font-size: 0.9rem;
            }

            /* Charts and additional content */
            .chart-container {
                background: white;
                border-radius: var(--border-radius);
                padding: 20px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                margin-bottom: 30px;
                animation: fadeIn 0.8s ease;
            }

            .chart-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            /* Footer */
            .footer {
                text-align: center;
                padding: 20px;
                color: #6c757d;
                border-top: 1px solid #e9ecef;
                margin-top: 30px;
            }

            /* Animations */
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateX(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            /* Responsive */
            @media (max-width: 992px) {
                .sidebar {
                    width: 70px;
                    overflow: hidden;
                }
                
                .sidebar-header h2, .menu-item span {
                    display: none;
                }
                
                .menu-item i {
                    margin-right: 0;
                    font-size: 1.5rem;
                }
                
                .main-content {
                    margin-left: 70px;
                }
                
                .sidebar:hover {
                    width: var(--sidebar-width);
                }
                
                .sidebar:hover .sidebar-header h2,
                .sidebar:hover .menu-item span {
                    display: block;
                }
                
                .sidebar:hover .menu-item i {
                    margin-right: 15px;
                    font-size: 1.2rem;
                }
            }

            @media (max-width: 768px) {
                .cards {
                    grid-template-columns: 1fr;
                }
                
                .search-box {
                    width: 200px;
                }
            }

            /* Logout Button Styling */
            #Logout {
                background: var(--primary);
                color: white;
                border: none;
                padding: 8px 15px;
                border-radius: 5px;
                cursor: pointer;
                transition: var(--transition);
                font-weight: 500;
            }

            #Logout:hover {
                background: var(--secondary);
            }

        </style>
    </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <body>
        <div class="container">
            <!-- Sidebar -->
            <div class="sidebar">
                <div class="sidebar-header">
                    <i class="fas fa-graduation-cap fa-2x"></i>
                    <h2>EduManage</h2>
                </div>
                <div class="sidebar-menu">
                    <div class="menu-item active">
                        <i class="fas fa-home"></i><span>Dashboard</span>
                    </div>
                    <a href="Student.aspx" class="menu-item">
                        <i class="fas fa-user-friends"></i><span>Students</span>
                    </a>
                    <a href="Teacher.aspx" class="menu-item">
                        <i class="fas fa-chalkboard-teacher"></i><span>Teachers</span>
                    </a>
                   <a href="Courses.aspx"> <div class="menu-item">
                        <i class="fas fa-book"></i><span>Courses</span>
                       </a>
                    </div>
                   <a href="Schedule.aspx"> <div class="menu-item">
                        <i class="fas fa-calendar-alt"></i><span>Schedule</span>
                       </a>
                    </div>
                </div>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <!-- Header -->
                <div class="header">
                    <div class="search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" placeholder="Search...">
                    </div>
                    <div class="user-profile">
                        <img src="https://ui-avatars.com/api/?name=Admin+User&background=random" alt="Admin User">
                        <div>
                            <asp:Button ID="Logout" runat="server" Text="Logout" OnClick="Logout_Click" />
                        </div>
                    </div>
                </div>

                <!-- Content Area -->
                <div class="content">
                    <div class="page-title">
                        <h1>School Dashboard</h1>
                        <ul class="breadcrumb">
                            <li>Home</li>
                            <li>Dashboard</li>
                        </ul>
                    </div>

                    <!-- Stats Cards -->
                    <div class="cards">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon bg-primary">
                                    <i class="fas fa-users"></i>
                                </div>
                            </div>
                            <div class="card-value">1,254</div>
                            <div class="card-title">Total Students</div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon bg-success">
                                    <i class="fas fa-chalkboard-teacher"></i>
                                </div>
                            </div>
                            <div class="card-value">68</div>
                            <div class="card-title">Teaching Staff</div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon bg-warning">
                                    <i class="fas fa-book"></i>
                                </div>
                            </div>
                            <div class="card-value">42</div>
                            <div class="card-title">Courses</div>
                        </div>
                        <div class="card">
                            <div class="card-header">
                                <div class="card-icon bg-danger">
                                    <i class="fas fa-dollar-sign"></i>
                                </div>
                            </div>
                            <div class="card-value">$92,500</div>
                            <div class="card-title">Annual Budget</div>
                        </div>
                    </div>

                    <!-- Charts Section -->
                    <div class="chart-container">
                        <div class="chart-header">
                            <h2>Attendance Overview</h2>
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                        <div style="height: 300px; background-color: #f8f9fa; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                            <p>Attendance chart would be displayed here</p>
                        </div>
                    </div>

                    <!-- Upcoming Events -->
                    <div class="chart-container">
                        <div class="chart-header">
                            <h2>Upcoming Events</h2>
                            <i class="fas fa-ellipsis-h"></i>
                        </div>
                        <div style="min-height: 200px; background-color: #f8f9fa; border-radius: 10px; display: flex; align-items: center; justify-content: center;">
                            <p>Upcoming events calendar would be displayed here</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Simple animation for menu items
            document.addEventListener('DOMContentLoaded', function () {
                const menuItems = document.querySelectorAll('.menu-item');

                menuItems.forEach(item => {
                    item.addEventListener('click', function () {
                        menuItems.forEach(i => i.classList.remove('active'));
                        this.classList.add('active');
                    });
                });

                // Animate cards sequentially
                const cards = document.querySelectorAll('.card');
                cards.forEach((card, index) => {
                    card.style.animationDelay = `${index * 0.1}s`;
                });
            });
        </script>
    </body>
    </html>
</asp:Content>