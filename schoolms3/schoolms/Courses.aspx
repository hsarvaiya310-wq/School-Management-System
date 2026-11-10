<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="schoolms.Courses" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Courses</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            width: 70%;
            border-collapse: collapse;
            margin: 20px auto;
            font-family: Arial, sans-serif;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th {
            background: #6a11cb;
            color: #fff;
            padding: 12px;
        }

        td {
            padding: 12px;
            text-align: center;
        }

        .btn {
            background: #2575fc;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn:hover {
            background: #1a5ed8;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content p {
            padding: 8px 12px;
            margin: 0;
            cursor: pointer;
        }

        .dropdown-content p:hover {
            background: #ddd;
        }

        .show {
            display: block;
        }

        /* 🎯 Back To Dashboard Button CSS */
        .back-btn {
            background: #28a745;
            color: #fff;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            margin: 30px auto;
            display: block; /* Center horizontally */
            transition: all 0.3s ease;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
        }

        .back-btn:hover {
            background: #218838;
            transform: scale(1.05);
            box-shadow: 0px 6px 12px rgba(0,0,0,0.25);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Available Courses</h1>

            <table>
                <tr>
                    <th>Course</th>
                    <th>Experiance</th>
                    <th>Faculty</th>
                    <th>Action</th>
                </tr>
                <asp:Repeater ID="rptCourses" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%#: Eval("CourseName") %></td>
                            <td><%#: Eval("Duration") %></td>
                            <td><%#: Eval("Faculty") %></td>
                            <td>
                                <div class="dropdown">
                                    <a class="btn" onclick="toggleDropdown('course<%# Eval("Id") %>')">View Details</a>
                                    <div id="course<%# Eval("Id") %>" class="dropdown-content">
                                        <asp:Repeater runat="server" DataSource='<%# Eval("Modules") %>'>
                                            <ItemTemplate>
                                                <p><%#: Container.DataItem %></p>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            <script>
                function toggleDropdown(id) {
                    document.querySelectorAll(".dropdown-content").forEach(el => {
                        if (el.id !== id) {
                            el.classList.remove("show");
                        }
                    });
                    document.getElementById(id).classList.toggle("show");
                }

                window.onclick = function (event) {
                    if (!event.target.matches('.btn')) {
                        document.querySelectorAll(".dropdown-content").forEach(el => {
                            el.classList.remove("show");
                        });
                    }
                }
            </script>
        </div>

        <!-- Back To Dashboard Button -->
        <asp:Button ID="Button1" runat="server" Text="Back To Dashboard" 
            CssClass="back-btn" OnClick="Button1_Click" />
    </form>
</body>
</html>
