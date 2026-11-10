<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher.Master" AutoEventWireup="true" CodeBehind="Teacher_Dashboard.aspx.cs" Inherits="schoolms.Teacher_Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <!DOCTYPE html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Faculty Portal - School Management System</title>
                    <link rel="stylesheet" href="css/style.css">
                </head>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder2">
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder3">
    <body>
    <div class="dashboard">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="sidebar-header">
                <h3>👩‍🏫 Faculty Portal</h3>
                <p style="font-size: 0.9rem; opacity: 0.8;">
                    Dr. Anjali Singh - Math Dept.</p>
            </div>
            <nav>
                <ul class="sidebar-nav">
                    <li><a href="Teacher_Dashboard.aspx" onclick="showSection('dashboard')" class="active">🏠 Dashboard</a></li>
                    <li><a href="TeacherSchedule.aspx" onclick="showSection('schedule')">🕐 Schedule</a></li>
                     <li><a href="Teacher_login.aspx">🚪 Logout</a></li>
                </ul>
            </nav>
        </aside>
        <style>
             <style>

     .section {
         display: none;
     }
     
     .section.active {
         display: block;
     }
     
     .profile-container {
         max-width: 1200px;
         margin: 0 auto;
     }
     
     .profile-card {
         background: white;
         border-radius: 10px;
         padding: 2rem;
         margin-bottom: 2rem;
         box-shadow: 0 2px 10px rgba(0,0,0,0.1);
         display: flex;
         align-items: center;
         gap: 2rem;
     }
     
     .avatar {
         width: 100px;
         height: 100px;
         border-radius: 50%;
         background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
         display: flex;
         align-items: center;
         justify-content: center;
         color: white;
         font-size: 2rem;
         font-weight: bold;
     }
     
     .profile-info h2 {
         margin: 0 0 0.5rem 0;
         color: #2c3e50;
     }
     
     .faculty-id, .department {
         margin: 0.25rem 0;
         color: #7f8c8d;
     }
     
     .info-grid {
         display: grid;
         grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
         gap: 2rem;
     }
     
     .info-card {
         background: white;
         border-radius: 10px;
         padding: 2rem;
         box-shadow: 0 2px 10px rgba(0,0,0,0.1);
     }
     
     .info-card h3 {
         margin: 0 0 1.5rem 0;
         color: #2c3e50;
         border-bottom: 2px solid #3498db;
         padding-bottom: 0.5rem;
     }
     
     .info-row {
         display: flex;
         justify-content: space-between;
         margin-bottom: 1rem;
         padding-bottom: 0.5rem;
         border-bottom: 1px solid #ecf0f1;
     }
     
     .info-row:last-child {
         border-bottom: none;
         margin-bottom: 0;
     }
     
     .label {
         font-weight: 600;
         color: #34495e;
     }
     
     .value {
         color: #2c3e50;
     }
     
     .btn-primary {
         background: #3498db;
         color: white;
         border: none;
         padding: 0.5rem 1rem;
         border-radius: 5px;
         cursor: pointer;
         font-weight: 500;
     }
     
     .btn-primary:hover {
         background: #2980b9;
     }
     
     .btn-small {
         background: #27ae60;
         color: white;
         border: none;
         padding: 0.3rem 0.6rem;
         border-radius: 3px;
         cursor: pointer;
         font-size: 0.8rem;
     }
     
     .btn-small:hover {
         background: #229954;
     }
     
     .table-header {
         display: flex;
         justify-content: space-between;
         align-items: center;
         padding: 1rem 2rem;
         background: #f8f9fa;
         border-bottom: 1px solid #dee2e6;
     }
     /* Global Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #f8f9fa;
}

/* Navigation Styles */
.navbar {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 1rem 0;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.nav-container {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 2rem;
}

.logo {
    color: white;
    font-size: 1.5rem;
    font-weight: bold;
    text-decoration: none;
}

.nav-links {
    display: flex;
    list-style: none;
    gap: 2rem;
}

.nav-links a {
    color: white;
    text-decoration: none;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.nav-links a:hover {
    background-color: rgba(255,255,255,0.2);
}

/* Hero Section */
.hero {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-align: center;
    padding: 4rem 2rem;
    min-height: 60vh;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.hero h1 {
    font-size: 3rem;
    margin-bottom: 1rem;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.hero p {
    font-size: 1.2rem;
    margin-bottom: 2rem;
    max-width: 600px;
}

.btn {
    display: inline-block;
    background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
    color: white;
    padding: 12px 30px;
    text-decoration: none;
    border-radius: 25px;
    font-weight: bold;
    transition: transform 0.3s, box-shadow 0.3s;
    border: none;
    cursor: pointer;
    font-size: 1rem;
}

.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(0,0,0,0.2);
}

/* Login Form */
.login-container {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    padding: 2rem;
}

.login-card {
    background: white;
    padding: 3rem;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0,0,0,0.1);
    width: 100%;
    max-width: 400px;
}

.login-card h2 {
    text-align: center;
    margin-bottom: 2rem;
    color: #333;
    font-size: 2rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    color: #555;
    font-weight: 500;
}

.form-group input {
    width: 100%;
    padding: 12px;
    border: 2px solid #e1e1e1;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s;
}

.form-group input:focus {
    outline: none;
    border-color: #667eea;
}

/* Dashboard Layout */
.dashboard {
    display: flex;
    min-height: 100vh;
}

.sidebar {
    width: 250px;
    background: linear-gradient(180deg, #2c3e50 0%, #34495e 100%);
    color: white;
    padding: 2rem 0;
    position: fixed;
    height: 100vh;
    overflow-y: auto;
}

.sidebar-header {
    padding: 0 2rem 2rem;
    border-bottom: 1px solid #34495e;
    margin-bottom: 2rem;
}

.sidebar-header h3 {
    font-size: 1.3rem;
}

.sidebar-nav {
    list-style: none;
}

.sidebar-nav li {
    margin-bottom: 0.5rem;
}

.sidebar-nav a {
    display: block;
    color: white;
    text-decoration: none;
    padding: 1rem 2rem;
    transition: background-color 0.3s;
}

.sidebar-nav a:hover,
.sidebar-nav a.active {
    background-color: rgba(255,255,255,0.1);
    border-left: 4px solid #3498db;
}

.main-content {
    flex: 1;
    margin-left: 250px;
    padding: 2rem;
}

/* Dashboard Cards */
.dashboard-header {
    margin-bottom: 2rem;
}

.dashboard-header h1 {
    color: #2c3e50;
    margin-bottom: 0.5rem;
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 2rem;
    margin-bottom: 3rem;
}

.stat-card {
    background: white;
    padding: 2rem;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.08);
    text-align: center;
    transition: transform 0.3s;
}

.stat-card:hover {
    transform: translateY(-5px);
}

.stat-icon {
    font-size: 3rem;
    margin-bottom: 1rem;
}

.stat-number {
    font-size: 2.5rem;
    font-weight: bold;
    color: #2c3e50;
    margin-bottom: 0.5rem;
}

.stat-label {
    color: #7f8c8d;
    font-size: 1.1rem;
}

/* Tables */
.table-container {
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 15px rgba(0,0,0,0.08);
    overflow: hidden;
}

.table-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 1.5rem 2rem;
}

.table-header h2 {
    margin: 0;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid #e1e1e1;
}

th {
    background-color: #f8f9fa;
    font-weight: 600;
    color: #2c3e50;
}

tr:hover {
    background-color: #f8f9fa;
}

/* Timetable */
.timetable {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 1rem;
    margin-top: 2rem;
}

.time-slot {
    background: white;
    padding: 1.5rem;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    text-align: center;
}

.time-slot h4 {
    color: #2c3e50;
    margin-bottom: 0.5rem;
}

.time-slot p {
    color: #7f8c8d;
    margin-bottom: 0.3rem;
}

/* Logout Page */
.logout-container {
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    text-align: center;
    color: white;
}

.logout-content h1 {
    font-size: 3rem;
    margin-bottom: 1rem;
}

.logout-content p {
    font-size: 1.2rem;
    margin-bottom: 2rem;
}

/* Responsive Design */
@media (max-width: 768px) {
    .nav-container {
        flex-direction: column;
        gap: 1rem;
    }
    
    .hero h1 {
        font-size: 2rem;
    }
    
    .sidebar {
        width: 100%;
        position: relative;
        height: auto;
    }
    
    .main-content {
        margin-left: 0;
    }
    
    .dashboard {
        flex-direction: column;
    }
    
    .stats-grid {
        grid-template-columns: 1fr;
    }
    
    .timetable {
        grid-template-columns: 1fr;
    }
    
    table {
        font-size: 0.9rem;
    }
    
    th, td {
        padding: 0.5rem;
    }
}

/* Utility Classes */
.text-center {
    text-align: center;
}

.mt-2 {
    margin-top: 2rem;
}

.mb-2 {
    margin-bottom: 2rem;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 2rem;
}

        </style>
        <!-- Main Content -->
        <main class="main-content">
            <!-- Dashboard Section -->
            <div id="dashboard" class="section active">
                <div class="dashboard-header">
                    <h1>Welcome Back, Dr. Singh! 👋</h1>
                    <p>
                        Your teaching dashboard for today - March 15, 2024</p>
                </div>

            <!-- Quick Stats -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">
                            👨‍🎓</div>
                        <div class="stat-number">
                            142</div>
                        <div class="stat-label">
                            Total Students</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📚</div>
                        <div class="stat-number">
                            5</div>
                        <div class="stat-label">
                            Classes Teaching</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📝</div>
                        <div class="stat-number">
                            23</div>
                        <div class="stat-label">
                            Pending Grades</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📅</div>
                        <div class="stat-number">
                            95%</div>
                        <div class="stat-label">
                            Class Attendance</div>
                    </div>
                </div>

            <!-- Today's Classes -->
                <div class="table-container">
                    <div class="table-header">
                        <h2>Today's Teaching Schedule</h2>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Class</th>
                                <th>Subject</th>
                                <th>Room</th>
                                <th>Topic</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>08:00 - 08:45</td>
                                <td>10th A</td>
                                <td>Mathematics</td>
                                <td>Room 101</td>
                                <td>Probability Theory</td>
                                <td style="color: #27ae60; font-weight: bold;">✓ Completed</td>
                            </tr>
                            <tr>
                                <td>09:30 - 10:15</td>
                                <td>11th B</td>
                                <td>Advanced Math</td>
                                <td>Room 102</td>
                                <td>Calculus - Derivatives</td>
                                <td style="color: #3498db; font-weight: bold;">🔄 Current</td>
                            </tr>
                            <tr>
                                <td>11:15 - 12:00</td>
                                <td>9th C</td>
                                <td>Algebra</td>
                                <td>Room 103</td>
                                <td>Quadratic Equations</td>
                                <td style="color: #f39c12; font-weight: bold;">⏳ Upcoming</td>
                            </tr>
                            <tr>
                                <td>13:30 - 14:15</td>
                                <td>12th A</td>
                                <td>Statistics</td>
                                <td>Room 101</td>
                                <td>Normal Distribution</td>
                                <td style="color: #f39c12; font-weight: bold;">⏳ Upcoming</td>
                            </tr>
                            <tr>
                                <td>14:15 - 15:00</td>
                                <td>10th B</td>
                                <td>Mathematics</td>
                                <td>Room 102</td>
                                <td>Trigonometry Review</td>
                                <td style="color: #f39c12; font-weight: bold;">⏳ Upcoming</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            <!-- Class Performance Overview -->
                <div class="table-container mt-2">
                    <div class="table-header">
                        <h2>Class Performance Summary</h2>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Class</th>
                                <th>Total Students</th>
                                <th>Average Score</th>
                                <th>Attendance Rate</th>
                                <th>Top Performer</th>
                                <th>Needs Attention</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10th A</td>
                                <td>35</td>
                                <td>87.5%</td>
                                <td>96%</td>
                                <td>Aarav Sharma (95%)</td>
                                <td>2 students</td>
                            </tr>
                            <tr>
                                <td>10th B</td>
                                <td>32</td>
                                <td>82.3%</td>
                                <td>94%</td>
                                <td>Priya Patel (92%)</td>
                                <td>3 students</td>
                            </tr>
                            <tr>
                                <td>11th B</td>
                                <td>28</td>
                                <td>79.8%</td>
                                <td>91%</td>
                                <td>Rahul Kumar (89%)</td>
                                <td>5 students</td>
                            </tr>
                            <tr>
                                <td>9th C</td>
                                <td>30</td>
                                <td>84.1%</td>
                                <td>97%</td>
                                <td>Sneha Singh (94%)</td>
                                <td>1 student</td>
                            </tr>
                            <tr>
                                <td>12th A</td>
                                <td>25</td>
                                <td>88.7%</td>
                                <td>98%</td>
                                <td>Arjun Reddy (96%)</td>
                                <td>1 student</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            <!-- Recent Assignments & Tests -->
                <div class="table-container mt-2">
                    <div class="table-header">
                        <h2>Recent Assignments & Test Results</h2>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Class</th>
                                <th>Assignment/Test</th>
                                <th>Date</th>
                                <th>Submitted</th>
                                <th>Graded</th>
                                <th>Class Average</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10th A</td>
                                <td>Unit Test 3 - Probability</td>
                                <td>March 10</td>
                                <td>35/35</td>
                                <td>35/35</td>
                                <td>87.5%</td>
                                <td style="color: #27ae60; font-weight: bold;">✓ Complete</td>
                            </tr>
                            <tr>
                                <td>11th B</td>
                                <td>Calculus Assignment</td>
                                <td>March 12</td>
                                <td>28/28</td>
                                <td>15/28</td>
                                <td>79.8%</td>
                                <td style="color: #f39c12; font-weight: bold;">⏳ Grading</td>
                            </tr>
                            <tr>
                                <td>9th C</td>
                                <td>Algebra Quiz</td>
                                <td>March 8</td>
                                <td>30/30</td>
                                <td>30/30</td>
                                <td>84.1%</td>
                                <td style="color: #27ae60; font-weight: bold;">✓ Complete</td>
                            </tr>
                            <tr>
                                <td>12th A</td>
                                <td>Statistics Project</td>
                                <td>March 14</td>
                                <td>23/25</td>
                                <td>8/23</td>
                                <td>Pending</td>
                                <td style="color: #e74c3c; font-weight: bold;">⚠ Overdue</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            <!-- Student Queries & Messages -->
                <div class="table-container mt-2">
                    <div class="table-header">
                        <h2>Recent Student Queries & Messages</h2>
                    </div>
                    <div style="padding: 2rem;">
                        <div style="display: grid; gap: 1rem;">
                            <div style="background: #fff3cd; border-left: 4px solid #ffc107; padding: 1rem; border-radius: 5px;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <h4 style="color: #856404;">📧 Aarav Sharma (10th A)</h4>
                                    <small style="color: #856404;">2 hours ago</small>
                                </div>
                                <p style="color: #856404; margin-bottom: 0.5rem;">
                                    "Ma'am, I'm having difficulty understanding the probability tree diagrams. Could you please explain it again in tomorrow's class?"</p>
                                <button style="background: #ffc107; color: #856404; border: none; padding: 0.3rem 0.8rem; border-radius: 3px; cursor: pointer;">
                                    Reply
                                </button>
                            </div>
                            <div style="background: #d1ecf1; border-left: 4px solid #17a2b8; padding: 1rem; border-radius: 5px;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <h4 style="color: #0c5460;">📧 Priya Patel (10th B)</h4>
                                    <small style="color: #0c5460;">5 hours ago</small>
                                </div>
                                <p style="color: #0c5460; margin-bottom: 0.5rem;">
                                    "Hello Dr. Singh, I'll be absent tomorrow due to a medical appointment. Could you please share the notes for the trigonometry class?"</p>
                                <button style="background: #17a2b8; color: white; border: none; padding: 0.3rem 0.8rem; border-radius: 3px; cursor: pointer;">
                                    Reply
                                </button>
                            </div>
                            <div style="background: #f8d7da; border-left: 4px solid #dc3545; padding: 1rem; border-radius: 5px;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <h4 style="color: #721c24;">⚠️ Parent - Mrs. Kumar (Rahul's Mother)</h4>
                                    <small style="color: #721c24;">1 day ago</small>
                                </div>
                                <p style="color: #721c24; margin-bottom: 0.5rem;">
                                    "Dear Dr. Singh, I noticed Rahul's performance has dropped in the recent test. Could we schedule a meeting to discuss his progress?"</p>
                                <button style="background: #dc3545; color: white; border: none; padding: 0.3rem 0.8rem; border-radius: 3px; cursor: pointer;">
                                    Schedule Meeting
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            <!-- Upcoming Events & Deadlines -->
                <div class="table-container mt-2">
                    <div class="table-header">
                        <h2>Upcoming Events & Deadlines</h2>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Event/Deadline</th>
                                <th>Class/Type</th>
                                <th>Priority</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>March 18</td>
                                <td>Submit Grade Reports</td>
                                <td>All Classes</td>
                                <td style="color: #e74c3c; font-weight: bold;">High</td>
                                <td style="color: #f39c12; font-weight: bold;">In Progress</td>
                            </tr>
                            <tr>
                                <td>March 20</td>
                                <td>Parent-Teacher Meeting</td>
                                <td>10th A & B</td>
                                <td style="color: #f39c12; font-weight: bold;">Medium</td>
                                <td style="color: #3498db; font-weight: bold;">Scheduled</td>
                            </tr>
                            <tr>
                                <td>March 22</td>
                                <td>Faculty Development Workshop</td>
                                <td>All Faculty</td>
                                <td style="color: #27ae60; font-weight: bold;">Low</td>
                                <td style="color: #3498db; font-weight: bold;">Registered</td>
                            </tr>
                            <tr>
                                <td>March 25</td>
                                <td>Final Exam Schedule Release</td>
                                <td>All Classes</td>
                                <td style="color: #e74c3c; font-weight: bold;">High</td>
                                <td style="color: #f39c12; font-weight: bold;">Pending</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            <!-- Quick Actions -->
                <div class="stats-grid mt-2">
                    <div class="stat-card" style="cursor: pointer;">
                        <div class="stat-icon">
                            📝</div>
                        <div class="stat-label">
                            Grade Assignments</div>
                    </div>
                    <div class="stat-card" style="cursor: pointer;">
                        <div class="stat-icon">
                            📅</div>
                        <div class="stat-label">
                            Mark Attendance</div>
                    </div>
                    <div class="stat-card" style="cursor: pointer;">
                        <div class="stat-icon">
                            📊</div>
                        <div class="stat-label">
                            Generate Reports</div>
                    </div>
                    <div class="stat-card" style="cursor: pointer;">
                        <div class="stat-icon">
                            💬</div>
                        <div class="stat-label">
                            Message Students</div>
                    </div>
                </div>
        </div>

            <!-- Profile Section -->
            <div id="profile" class="section">
                <div class="dashboard-header">
                    <h1>My Profile 👤</h1>
                    <p>
                        Faculty Information & Personal Details</p>
                </div>
                <div class="profile-container">
                    <div class="profile-card">
                        <div class="profile-image">
                            <div class="avatar">
                                AS</div>
                        </div>
                        <div class="profile-info">
                            <h2>Dr. Anjali Singh</h2>
                            <p class="faculty-id">
                                Faculty ID: FAC2024001</p>
                            <p class="department">
                                Mathematics Department | Senior Professor</p>
                        </div>
                    </div>
                    <div class="info-grid">
                        <div class="info-card">
                            <h3>Personal Information</h3>
                            <div class="info-row">
                                <span class="label">Date of Birth:</span> <span class="value">June 15, 1985</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Gender:</span> <span class="value">Female</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Phone:</span> <span class="value">+91 9876543220</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Email:</span> <span class="value">anjali.singh@school.edu</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Address:</span> <span class="value">456 Faculty Colony, Mumbai, Maharashtra - 400002</span>
                            </div>
                        </div>
                        <div class="info-card">
                            <h3>Professional Information</h3>
                            <div class="info-row">
                                <span class="label">Joining Date:</span> <span class="value">August 15, 2010</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Experience:</span> <span class="value">14 Years</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Qualification:</span> <span class="value">Ph.D. in Mathematics</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Specialization:</span> <span class="value">Algebra, Statistics, Calculus</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Employee ID:</span> <span class="value">EMP2010001</span>
                            </div>
                        </div>
                        <div class="info-card">
                            <h3>Teaching Load</h3>
                            <div class="info-row">
                                <span class="label">Classes Teaching:</span> <span class="value">5 Classes</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Total Students:</span> <span class="value">142 Students</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Weekly Hours:</span> <span class="value">25 Hours</span>
                            </div>
                            <div class="info-row">
                                <span class="label">Office Hours:</span> <span class="value">Mon-Fri: 2:00-4:00 PM</span>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

            <!-- Classes Section -->
            <div id="classes" class="section">
                <div class="dashboard-header">
                    <h1>My Classes 📚</h1>
                    <p>
                        Manage your classes and student information</p>
                </div>
                <div class="table-container">
                    <div class="table-header">
                        <h2>Classes Overview</h2>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Class</th>
                                <th>Subject</th>
                                <th>Students</th>
                                <th>Schedule</th>
                                <th>Room</th>
                                <th>Average Score</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10th A</td>
                                <td>Mathematics</td>
                                <td>35</td>
                                <td>Mon, Wed, Fri - 8:00 AM</td>
                                <td>Room 101</td>
                                <td style="color: #27ae60; font-weight: bold;">87.5%</td>
                                <td>
                                    <button class="btn-small">
                                        View Details
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>10th B</td>
                                <td>Mathematics</td>
                                <td>32</td>
                                <td>Tue, Thu - 2:15 PM</td>
                                <td>Room 102</td>
                                <td style="color: #27ae60; font-weight: bold;">82.3%</td>
                                <td>
                                    <button class="btn-small">
                                        View Details
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>11th B</td>
                                <td>Advanced Math</td>
                                <td>28</td>
                                <td>Mon, Wed - 9:30 AM</td>
                                <td>Room 102</td>
                                <td style="color: #f39c12; font-weight: bold;">79.8%</td>
                                <td>
                                    <button class="btn-small">
                                        View Details
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>9th C</td>
                                <td>Algebra</td>
                                <td>30</td>
                                <td>Tue, Thu - 11:15 AM</td>
                                <td>Room 103</td>
                                <td style="color: #27ae60; font-weight: bold;">84.1%</td>
                                <td>
                                    <button class="btn-small">
                                        View Details
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>12th A</td>
                                <td>Statistics</td>
                                <td>25</td>
                                <td>Mon, Wed, Fri - 1:30 PM</td>
                                <td>Room 101</td>
                                <td style="color: #27ae60; font-weight: bold;">88.7%</td>
                                <td>
                                    <button class="btn-small">
                                        View Details
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </div>

            <!-- Attendance Section -->
            <div id="attendance" class="section">
                <div class="dashboard-header">
                    <h1>Attendance Management 📅</h1>
                    <p>
                        Mark and track student attendance</p>
                </div>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">
                            📊</div>
                        <div class="stat-number">
                            95%</div>
                        <div class="stat-label">
                            Overall Attendance</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            ✅</div>
                        <div class="stat-number">
                            134</div>
                        <div class="stat-label">
                            Present Today</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            ❌</div>
                        <div class="stat-number">
                            8</div>
                        <div class="stat-label">
                            Absent Today</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📚</div>
                        <div class="stat-number">
                            142</div>
                        <div class="stat-label">
                            Total Students</div>
                    </div>
                </div>
                <div class="table-container">
                    <div class="table-header">
                        <h2>Today's Attendance - March 15, 2024</h2>
                        <button class="btn-primary">
                            Mark All Present
                        </button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Class</th>
                                <th>Time</th>
                                <th>Present</th>
                                <th>Absent</th>
                                <th>Percentage</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10th A</td>
                                <td>08:00 - 08:45</td>
                                <td>33</td>
                                <td>2</td>
                                <td style="color: #27ae60; font-weight: bold;">94.3%</td>
                                <td style="color: #27ae60;">✓ Marked</td>
                            </tr>
                            <tr>
                                <td>11th B</td>
                                <td>09:30 - 10:15</td>
                                <td>26</td>
                                <td>2</td>
                                <td style="color: #27ae60; font-weight: bold;">92.9%</td>
                                <td style="color: #3498db;">🔄 In Progress</td>
                            </tr>
                            <tr>
                                <td>9th C</td>
                                <td>11:15 - 12:00</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td style="color: #f39c12;">⏳ Pending</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </div>

            <!-- Gradebook Section -->
            <div id="gradebook" class="section">
                <div class="dashboard-header">
                    <h1>Gradebook 📊</h1>
                    <p>
                        Manage student grades and assessments</p>
                </div>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">
                            📝</div>
                        <div class="stat-number">
                            23</div>
                        <div class="stat-label">
                            Pending Grades</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            ✅</div>
                        <div class="stat-number">
                            156</div>
                        <div class="stat-label">
                            Graded Assignments</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📊</div>
                        <div class="stat-number">
                            84.2%</div>
                        <div class="stat-label">
                            Class Average</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            ⭐</div>
                        <div class="stat-number">
                            12</div>
                        <div class="stat-label">
                            A+ Students</div>
                    </div>
                </div>
                <div class="table-container">
                    <div class="table-header">
                        <h2>Recent Assessments</h2>
                        <button class="btn-primary">
                            Add New Grade
                        </button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Assessment</th>
                                <th>Class</th>
                                <th>Date</th>
                                <th>Total Students</th>
                                <th>Graded</th>
                                <th>Average</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Unit Test 3 - Probability</td>
                                <td>10th A</td>
                                <td>March 10</td>
                                <td>35</td>
                                <td>35</td>
                                <td style="color: #27ae60; font-weight: bold;">87.5%</td>
                                <td style="color: #27ae60;">✓ Complete</td>
                            </tr>
                            <tr>
                                <td>Calculus Assignment</td>
                                <td>11th B</td>
                                <td>March 12</td>
                                <td>28</td>
                                <td>15</td>
                                <td style="color: #f39c12; font-weight: bold;">79.8%</td>
                                <td style="color: #f39c12;">⏳ In Progress</td>
                            </tr>
                            <tr>
                                <td>Statistics Project</td>
                                <td>12th A</td>
                                <td>March 14</td>
                                <td>25</td>
                                <td>8</td>
                                <td>Pending</td>
                                <td style="color: #e74c3c;">⚠ Overdue</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </div>

            <!-- Assignments Section -->
            <div id="assignments" class="section">
                <div class="dashboard-header">
                    <h1>Assignments 📝</h1>
                    <p>
                        Create and manage student assignments</p>
                </div>
                <div class="table-container">
                    <div class="table-header">
                        <h2>Active Assignments</h2>
                        <button class="btn-primary">
                            Create New Assignment
                        </button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Assignment</th>
                                <th>Class</th>
                                <th>Due Date</th>
                                <th>Submitted</th>
                                <th>Pending</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Probability Problems - Chapter 12</td>
                                <td>10th A</td>
                                <td>March 18, 2024</td>
                                <td>28</td>
                                <td>7</td>
                                <td style="color: #f39c12;">⏳ Active</td>
                            </tr>
                            <tr>
                                <td>Calculus Derivatives Worksheet</td>
                                <td>11th B</td>
                                <td>March 20, 2024</td>
                                <td>15</td>
                                <td>13</td>
                                <td style="color: #f39c12;">⏳ Active</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </div>

            <!-- Schedule Section -->
            <div id="schedule" class="section">
                <div class="dashboard-header">
                    <h1>Teaching Schedule 🕐</h1>
                    <p>
                        Your weekly teaching timetable</p>
                </div>
                <div class="table-container">
                    <div class="table-header">
                        <h2>Weekly Schedule</h2>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Monday</th>
                                <th>Tuesday</th>
                                <th>Wednesday</th>
                                <th>Thursday</th>
                                <th>Friday</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>08:00-08:45</td>
                                <td>10th A - Math</td>
                                <td>Office Hours</td>
                                <td>10th A - Math</td>
                                <td>Office Hours</td>
                                <td>10th A - Math</td>
                            </tr>
                            <tr>
                                <td>09:30-10:15</td>
                                <td>11th B - Adv Math</td>
                                <td>Free Period</td>
                                <td>11th B - Adv Math</td>
                                <td>Free Period</td>
                                <td>Faculty Meeting</td>
                            </tr>
                            <tr>
                                <td>11:15-12:00</td>
                                <td>Free Period</td>
                                <td>9th C - Algebra</td>
                                <td>Free Period</td>
                                <td>9th C - Algebra</td>
                                <td>Free Period</td>
                            </tr>
                            <tr>
                                <td>13:30-14:15</td>
                                <td>12th A - Statistics</td>
                                <td>Office Hours</td>
                                <td>12th A - Statistics</td>
                                <td>Office Hours</td>
                                <td>12th A - Statistics</td>
                            </tr>
                            <tr>
                                <td>14:15-15:00</td>
                                <td>Office Hours</td>
                                <td>10th B - Math</td>
                                <td>Office Hours</td>
                                <td>10th B - Math</td>
                                <td>Office Hours</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </div>

            <!-- Resources Section -->
            <div id="resources" class="section">
                <div class="dashboard-header">
                    <h1>Teaching Resources 📁</h1>
                    <p>
                        Manage your teaching materials and resources</p>
                </div>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">
                            📄</div>
                        <div class="stat-number">
                            45</div>
                        <div class="stat-label">
                            Lesson Plans</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📊</div>
                        <div class="stat-number">
                            23</div>
                        <div class="stat-label">
                            Presentations</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📝</div>
                        <div class="stat-number">
                            67</div>
                        <div class="stat-label">
                            Worksheets</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            🎥</div>
                        <div class="stat-number">
                            12</div>
                        <div class="stat-label">
                            Video Resources</div>
                    </div>
                </div>
        </div>

            <!-- Reports Section -->
            <div id="reports" class="section">
                <div class="dashboard-header">
                    <h1>Reports & Analytics 📈</h1>
                    <p>
                        Generate and view academic reports</p>
                </div>
                <div class="table-container">
                    <div class="table-header">
                        <h2>Available Reports</h2>
                        <button class="btn-primary">
                            Generate New Report
                        </button>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th>Report Type</th>
                                <th>Class</th>
                                <th>Period</th>
                                <th>Generated</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Performance Report</td>
                                <td>10th A</td>
                                <td>March 2024</td>
                                <td>March 14, 2024</td>
                                <td>
                                    <button class="btn-small">
                                        Download
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>Attendance Summary</td>
                                <td>All Classes</td>
                                <td>February 2024</td>
                                <td>March 1, 2024</td>
                                <td>
                                    <button class="btn-small">
                                        Download
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
        </div>

            <!-- Communication Section -->
            <div id="communication" class="section">
                <div class="dashboard-header">
                    <h1>Communication 💬</h1>
                    <p>
                        Messages and communication with students and parents</p>
                </div>
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">
                            📧</div>
                        <div class="stat-number">
                            5</div>
                        <div class="stat-label">
                            Unread Messages</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            👨‍👩‍👧‍👦</div>
                        <div class="stat-number">
                            3</div>
                        <div class="stat-label">
                            Parent Meetings</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            📢</div>
                        <div class="stat-number">
                            12</div>
                        <div class="stat-label">
                            Announcements</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">
                            ⏰</div>
                        <div class="stat-number">
                            2</div>
                        <div class="stat-label">
                            Pending Replies</div>
                    </div>
                </div>
                <div class="table-container">
                    <div class="table-header">
                        <h2>Recent Messages</h2>
                        <button class="btn-primary">
                            Compose Message
                        </button>
                    </div>
                    <div style="padding: 2rem;">
                        <div style="display: grid; gap: 1rem;">
                            <div style="background: #fff3cd; border-left: 4px solid #ffc107; padding: 1rem; border-radius: 5px;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <h4 style="color: #856404;">📧 Aarav Sharma (10th A)</h4>
                                    <small style="color: #856404;">2 hours ago</small>
                                </div>
                                <p style="color: #856404; margin-bottom: 0.5rem;">
                                    "Ma'am, I'm having difficulty understanding the probability tree diagrams. Could you please explain it again in tomorrow's class?"</p>
                                <button style="background: #ffc107; color: #856404; border: none; padding: 0.3rem 0.8rem; border-radius: 3px; cursor: pointer;">
                                    Reply
                                </button>
                            </div>
                            <div style="background: #f8d7da; border-left: 4px solid #dc3545; padding: 1rem; border-radius: 5px;">
                                <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                    <h4 style="color: #721c24;">⚠️ Parent - Mrs. Kumar (Rahul's Mother)</h4>
                                    <small style="color: #721c24;">1 day ago</small>
                                </div>
                                <p style="color: #721c24; margin-bottom: 0.5rem;">
                                    "Dear Dr. Singh, I noticed Rahul's performance has dropped in the recent test. Could we schedule a meeting to discuss his progress?"</p>
                                <button style="background: #dc3545; color: white; border: none; padding: 0.3rem 0.8rem; border-radius: 3px; cursor: pointer;">
                                    Schedule Meeting
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        </main>
    </div>

    <script>
        function showSection(sectionId) {
            // Hide all sections
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => {
                section.classList.remove('active');
            });
            
            // Show selected section
            document.getElementById(sectionId).classList.add('active');
            
            // Update navigation active state
            const navLinks = document.querySelectorAll('.sidebar-nav a');
            navLinks.forEach(link => {
                link.classList.remove('active');
            });
            
            // Add active class to clicked link
            event.target.classList.add('active');
        }
    </script>

   
    <div class="footer">
        <h1>Teacher Footer</h1>
    </div>
</body>
</html>
            </asp:Content>

