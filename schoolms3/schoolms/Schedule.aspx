<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Schedule.aspx.cs" Inherits="schoolms.Schedule" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School Timetable</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            background: linear-gradient(135deg, #3498db, #2c3e50);
            color: white;
            padding: 20px 0;
            border-radius: 8px 8px 0 0;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
        }

        .school-name {
            text-align: center;
            flex-grow: 1;
        }

        .school-name h1 {
            margin: 0;
            font-size: 28px;
        }

        .school-name p {
            margin: 5px 0 0 0;
            font-size: 16px;
            opacity: 0.9;
        }

        .main-content {
            background-color: white;
            border-radius: 0 0 8px 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-top: 10px;
        }

        .section-title {
            color: #2c3e50;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-top: 30px;
        }

        .dropdown-section {
            display: flex;
            align-items: center;
            gap: 15px;
            margin: 20px 0;
        }

        #ddlClass {
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            background-color: white;
            min-width: 200px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }

        #ddlClass:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
        }

        .timetable-container {
            margin-top: 30px;
            overflow-x: auto;
        }

        .daily-timetable {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .daily-timetable th {
            background-color: #3498db;
            color: white;
            padding: 15px;
            text-align: center;
            font-weight: 600;
        }

        .daily-timetable td {
            padding: 15px;
            text-align: center;
            border: 1px solid #e1e1e1;
        }

        .daily-timetable tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .daily-timetable tr:hover {
            background-color: #e8f4fc;
        }

        .period-time {
            font-weight: bold;
            color: #2c3e50;
            width: 30%;
        }

        .subject {
            font-weight: 500;
            width: 70%;
        }

        .break-cell {
            background-color: #ffeaa7 !important;
            font-weight: bold;
        }

        .no-data {
            text-align: center;
            padding: 40px;
            color: #7f8c8d;
            font-style: italic;
        }

        .info-cards {
            display: flex;
            gap: 20px;
            margin-top: 30px;
        }

        .card {
            flex: 1;
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border-top: 4px solid #3498db;
        }

        .card h3 {
            margin-top: 0;
            color: #2c3e50;
        }

        .dashboard-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: white;
            color: #3498db;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-decoration: none;
            display: inline-block;
        }

        .dashboard-button:hover {
            background-color: #f8f9fa;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            color: #7f8c8d;
            font-size: 14px;
            border-top: 1px solid #eee;
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
            }

            .info-cards {
                flex-direction: column;
            }

            .dropdown-section {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .dashboard-button {
                position: relative;
                top: auto;
                right: auto;
                margin-top: 15px;
                align-self: center;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <div class="header-content">
                    <div class="logo">SCHOOL</div>
                    <div class="school-name">
                        <h1>Bright Future Academy</h1>
                        <p>Education for a Better Tomorrow</p>
                    </div>
                    <div class="logo">MS</div>
                </div>
                <a href="Dashboard.aspx" class="dashboard-button">← Back to Dashboard</a>
            </header>
            
            <div class="main-content">
                <h2 class="section-title">Select Class Timetable</h2>
                
                <div class="dropdown-section">
                    <label for="ddlClass"><strong>Select Class:</strong></label>
                    <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                        <asp:ListItem Text="-- Select Class --" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Class 1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Class 2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Class 3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Class 4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Class 5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Class 6" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Class 7" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Class 8" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Class 9" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Class 10" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Class 11" Value="11"></asp:ListItem>
                        <asp:ListItem Text="Class 12" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <div class="timetable-container">
                    <asp:Label ID="lblTimetable" runat="server" Font-Size="Large"></asp:Label>
                    
                    <!-- Daily timetable for Class 4 as shown in the image -->
                    <table class="daily-timetable" id="class4Timetable" style="display:none;">
                        <thead>
                            <tr>
                                <th colspan="2">Class 4 Timetable</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="period-time">09:00 – 09:45</td>
                                <td class="subject">English</td>
                            </tr>
                            <tr>
                                <td class="period-time">09:45 – 10:30</td>
                                <td class="subject">Maths</td>
                            </tr>
                            <tr>
                                <td class="period-time">10:30 – 11:15</td>
                                <td class="subject">Drawing</td>
                            </tr>
                            <tr>
                                <td class="period-time">11:15 – 11:30</td>
                                <td class="break-cell">BREAK</td>
                            </tr>
                            <tr>
                                <td class="period-time">11:30 – 12:15</td>
                                <td class="subject">EVS</td>
                            </tr>
                            <tr>
                                <td class="period-time">12:15 – 01:00</td>
                                <td class="subject">Storytelling</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="no-data" id="noTimetable">
                        Please select a class to view the timetable
                    </div>
                </div>
                
                <h2 class="section-title">School Information</h2>
                
                <div class="info-cards">
                    <div class="card">
                        <h3>School Hours</h3>
                        <p><strong>Regular Hours:</strong> 8:00 AM - 3:00 PM</p>
                        <p><strong>Office Hours:</strong> 7:30 AM - 4:30 PM</p>
                        <p><strong>Lunch Break:</strong> 12:00 PM - 1:00 PM</p>
                    </div>
                    
                    <div class="card">
                        <h3>Important Dates</h3>
                        <p><strong>Mid-term Exams:</strong> October 15-19</p>
                        <p><strong>Parent-Teacher Meetings:</strong> November 5-9</p>
                        <p><strong>Winter Break:</strong> December 23 - January 7</p>
                    </div>
                    
                    <div class="card">
                        <h3>Contact Information</h3>
                        <p><strong>Phone:</strong> 1234567890</p>
                        <p><strong>Email:</strong> info@schoolms.edu</p>
                        <p><strong>Address:</strong> Rajkot</p>
                    </div>
                </div>
            </div>
            
            <footer>
                <p>Bright Future Academy &copy; 2023 | Timetable Management System</p>
            </footer>
        </div>
    </form>
    
    <script>
        // This is a client-side simulation of the server-side functionality
        // In a real application, this would be handled by the server code
        document.addEventListener('DOMContentLoaded', function () {
            const ddlClass = document.getElementById('ddlClass');
            const class4Timetable = document.getElementById('class4Timetable');
            const noTimetable = document.getElementById('noTimetable');

            if (ddlClass) {
                ddlClass.addEventListener('change', function () {
                    if (this.value === '0') {
                        class4Timetable.style.display = 'none';
                        noTimetable.style.display = 'block';
                    } else if (this.value === '4') {
                        class4Timetable.style.display = 'table';
                        noTimetable.style.display = 'none';
                    } else {
                        class4Timetable.style.display = 'none';
                        noTimetable.style.display = 'block';
                    }
                });
            }
        });
    </script>
</body>
</html>