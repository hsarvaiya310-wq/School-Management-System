<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Classes.aspx.cs" Inherits="schoolms.Classes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teacher's Weekly Schedule</title>
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-color: #ecf0f1;
            --border-color: #bdc3c7;
            --text-color: #333;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: var(--text-color);
            line-height: 1.6;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            border-radius: 10px;
            box-shadow: var(--shadow);
            overflow: hidden;
        }

        header {
            background-color: var(--primary-color);
            color: white;
            padding: 20px;
            text-align: center;
        }

        .teacher-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: var(--light-color);
            border-bottom: 1px solid var(--border-color);
        }

        .teacher-details {
            display: flex;
            gap: 20px;
        }

        .teacher-details div {
            display: flex;
            flex-direction: column;
        }

        .teacher-details span:first-child {
            font-weight: bold;
            color: var(--primary-color);
        }

        .week-navigation {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .week-navigation button {
            background-color: var(--secondary-color);
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .week-navigation button:hover {
            background-color: #2980b9;
        }

        .schedule-container {
            padding: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 800px;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border: 1px solid var(--border-color);
        }

        th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
        }

        td {
            background-color: white;
            height: 80px;
            vertical-align: top;
            position: relative;
        }

        .time-header {
            background-color: var(--secondary-color);
            color: white;
            font-weight: 600;
        }

        .period {
            font-weight: bold;
            margin-bottom: 5px;
            color: var(--primary-color);
        }

        .subject {
            font-weight: 600;
            margin-bottom: 3px;
        }

        .room {
            font-size: 0.85em;
            color: #666;
        }

        .break {
            background-color: var(--light-color);
            font-weight: bold;
        }

        .free-period {
            background-color: #e8f6f3;
            color: #27ae60;
            font-style: italic;
        }

        .current-day {
            background-color: #fff9e6;
        }

        .current-period {
            border: 2px solid var(--accent-color);
        }

        .legend {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
            flex-wrap: wrap;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .legend-color {
            width: 15px;
            height: 15px;
            border-radius: 3px;
        }

        footer {
            text-align: center;
            padding: 15px;
            background-color: var(--light-color);
            border-top: 1px solid var(--border-color);
            color: #666;
            font-size: 0.9em;
        }

        @media (max-width: 768px) {
            .teacher-info {
                flex-direction: column;
                gap: 15px;
            }
            
            .teacher-details {
                flex-direction: column;
                gap: 10px;
            }
            
            th, td {
                padding: 8px 10px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header>
                <h1>Teacher's Weekly Schedule</h1>
            </header>
            
            <div class="teacher-info">
                <div class="teacher-details">
                    <div>
                        <span>Teacher:</span>
                        <span><asp:Label ID="lblTeacherName" runat="server" Text="Dr. Sarah Johnson"></asp:Label></span>
                    </div>
                    <div>
                        <span>Department:</span>
                        <span><asp:Label ID="lblDepartment" runat="server" Text="Mathematics"></asp:Label></span>
                    </div>
                    <div>
                        <span>Academic Year:</span>
                        <span><asp:Label ID="lblAcademicYear" runat="server" Text="2023-2024"></asp:Label></span>
                    </div>
                </div>
                
                <div class="week-navigation">
                    <asp:Button ID="btnPrevWeek" runat="server" Text="Previous Week" OnClientClick="return navigateWeek(-1);" />
                    <span id="week-display">Week of October 16, 2023</span>
                    <asp:Button ID="btnNextWeek" runat="server" Text="Next Week" OnClientClick="return navigateWeek(1);" />
                </div>
            </div>
            
            <div class="schedule-container">
                <table id="schedule-table">
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
                    <tbody runat="server" id="scheduleBody">
                        <!-- Schedule rows will be populated by server-side code or JavaScript -->
                    </tbody>
                </table>
                
                <div class="legend">
                    <div class="legend-item">
                        <div class="legend-color" style="background-color: #e8f6f3;"></div>
                        <span>Free Period</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-color" style="background-color: #fff9e6;"></div>
                        <span>Current Day</span>
                    </div>
                    <div class="legend-item">
                        <div class="legend-color" style="background-color: #ecf0f1;"></div>
                        <span>Break</span>
                    </div>
                </div>
            </div>
            
            <footer>
                <p><asp:Label ID="lblSchoolName" runat="server" Text="School Name"></asp:Label> • Last updated: <asp:Label ID="lblLastUpdated" runat="server" Text="October 15, 2023"></asp:Label></p>
            </footer>
        </div>
    </form>

    <script>
        // Schedule rows are rendered on the server from the database;
        // this only highlights today's column.
        function populateSchedule() {
            // Highlight current day
            const today = new Date().getDay(); // 0 = Sunday, 1 = Monday, etc.
            if (today >= 1 && today <= 5) {
                const headerCells = document.querySelectorAll('#schedule-table thead th');
                const bodyCells = document.querySelectorAll('#schedule-table tbody td');
                
                // Add current-day class to header
                headerCells[today].classList.add('current-day');
                
                // Add current-day class to body cells for this day
                for (let i = 0; i < bodyCells.length; i++) {
                    if ((i % 6) === today) { // Every 6th cell starting from today index
                        bodyCells[i].classList.add('current-day');
                    }
                }
            }
        }

        // Week navigation functionality
        let currentWeekOffset = 0;
        
        function updateWeekDisplay() {
            const today = new Date();
            const startOfWeek = new Date(today);
            startOfWeek.setDate(today.getDate() - today.getDay() + 1 + (currentWeekOffset * 7)); // Monday
            
            const options = { month: 'long', day: 'numeric', year: 'numeric' };
            document.getElementById('week-display').textContent = `Week of ${startOfWeek.toLocaleDateString('en-US', options)}`;
        }
        
        function navigateWeek(direction) {
            currentWeekOffset += direction;
            updateWeekDisplay();
            return false; // Prevent postback
        }
        
        // Initialize the page
        document.addEventListener('DOMContentLoaded', function() {
            populateSchedule();
            updateWeekDisplay();
        });
    </script>
</body>
</html>