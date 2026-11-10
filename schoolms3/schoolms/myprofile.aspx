<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="schoolms.myprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* Global Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }
        
        .container {
            display: flex;
            min-height: 100vh;
        }
        
        /* Side Panel Styles */
        .side-panel {
            width: 280px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 25px;
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        }
        
        .welcome-header h1 {
            font-size: 24px;
            margin-bottom: 10px;
            font-weight: 600;
        }
        
        .date-display {
            font-size: 14px;
            opacity: 0.9;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }
        
        .profile-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .profile-menu li {
            margin-bottom: 12px;
        }
        
        .profile-menu a {
            color: white;
            text-decoration: none;
            padding: 12px 15px;
            display: block;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .profile-menu a:hover,
        .profile-menu a.active {
            background-color: rgba(255,255,255,0.2);
            transform: translateX(5px);
        }
        
        /* Main Content Styles */
        .main-content {
            flex: 1;
            padding: 30px;
            background-color: white;
            margin: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        
        .content-header h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            font-weight: 600;
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 10px;
        }
        
        /* Schedule Table Styles */
        .schedule-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        
        .schedule-table th {
            background-color: #34495e;
            color: white;
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            font-size: 14px;
        }
        
        .schedule-table td {
            padding: 15px 12px;
            border-bottom: 1px solid #ecf0f1;
            font-size: 14px;
        }
        
        .schedule-table tr:hover {
            background-color: #f8f9fa;
        }
        
        /* Status Styles */
        .status-completed {
            color: #27ae60;
            font-weight: 600;
            background-color: #d5f4e6;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            display: inline-block;
        }
        
        .status-current {
            color: #e67e22;
            font-weight: 600;
            background-color: #fdebd0;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            display: inline-block;
        }
        
        .status-upcoming {
            color: #3498db;
            font-weight: 600;
            background-color: #d6eaf8;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            display: inline-block;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .side-panel {
                width: 100%;
                padding: 20px;
            }
            
            .main-content {
                margin: 10px;
                padding: 20px;
            }
            
            .schedule-table {
                font-size: 12px;
            }
            
            .schedule-table th,
            .schedule-table td {
                padding: 10px 8px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            @model TeacherPortal.Models.ProfileViewModel

<!DOCTYPE html>
<html>
<head>
    <title>My Profile - Teacher Portal</title>
</head>
<body>
    <div class="container">
        <!-- Side Panel -->
        <div class="side-panel">
            <div class="welcome-header">
                <h1>Welcome Back, Dr. Singh!</h1>
                <div class="date-display">@DateTime.Now.ToString("dddd, MMMM dd, yyyy")</div>
            </div>
            
            <h3 style="margin-bottom: 15px; font-weight: 600;">My Profile</h3>
            <ul class="profile-menu">
                <li><a href="@Url.Action("MyClasses", "Profile")" class="active">My Classes</a></li>
                <li><a href="@Url.Action("Assignments", "Profile")">Assignments</a></li>
                <li><a href="@Url.Action("Schedule", "Profile")">Schedule</a></li>
                <li><a href="@Url.Action("Communication", "Profile")">Communication</a></li>
                <li><a href="@Url.Action("Logout", "Account")">Logout</a></li>
            </ul>
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
            <div class="content-header">
                <h2>Today's Teaching Schedule</h2>
            </div>
            
            <table class="schedule-table">
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
                    @foreach (var schedule in Model.TodaysSchedule)
                    {
                        <tr>
                            <td>@schedule.Time</td>
                            <td>@schedule.Class</td>
                            <td>@schedule.Subject</td>
                            <td>@schedule.Room</td>
                            <td>@schedule.Topic</td>
                            <td class="@GetStatusCssClass(schedule.Status)">@schedule.Status</td>
                        </tr>
                    }
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>

@functions {
    public string GetStatusCssClass(string status)
    {
        switch (status?.ToLower())
        {
            case "✓ completed":
                return "status-completed";
            case "current":
                return "status-current";
            case "upcoming":
                return "status-upcoming";
            default:
                return "";
        }
    }
}
        </div>
    </form>
</body>
</html>