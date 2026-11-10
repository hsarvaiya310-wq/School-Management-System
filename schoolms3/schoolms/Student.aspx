<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="schoolms.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Management - EduManage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #34495e;
            --accent: #3498db;
            --light: #ecf0f1;
            --dark: #2c3e50;
            --success: #27ae60;
            --warning: #f39c12;
            --danger: #e74c3c;
            --sidebar-width: 250px;
            --header-height: 70px;
            --border-radius: 8px;
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', 'Georgia', 'Times New Roman', serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            color: var(--dark);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Classic Container */
        .classic-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            border: 1px solid #e0e0e0;
        }

        /* Classic Header */
        .classic-header {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 25px 30px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

            .classic-header h1 {
                font-size: 28px;
                font-weight: 600;
                margin-bottom: 5px;
                letter-spacing: 0.5px;
            }

            .classic-header p {
                opacity: 0.9;
                font-size: 16px;
            }

        /* Classic Form */
        .classic-form {
            padding: 30px;
        }

        .form-section {
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }

        .form-section-title {
            font-size: 20px;
            color: var(--primary);
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--accent);
            font-weight: 600;
        }

        /* Classic Table Styling */
        .classic-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

            .classic-table tr {
                border-bottom: 1px solid #f0f0f0;
                transition: var(--transition);
            }

                .classic-table tr:hover {
                    background-color: #f9f9f9;
                }

            .classic-table td {
                padding: 15px 10px;
                vertical-align: middle;
            }

                .classic-table td:first-child {
                    width: 180px;
                    font-weight: 600;
                    color: #555;
                    padding-left: 20px;
                }

                .classic-table td:last-child {
                    padding-right: 20px;
                }

        /* Classic Input Fields */
        .classic-input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: var(--transition);
            background: #fafafa;
            font-family: inherit;
        }

            .classic-input:focus {
                outline: none;
                border-color: var(--accent);
                background: white;
                box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.1);
                transform: translateY(-1px);
            }

        /* Classic Buttons */
        .classic-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin: 30px 0;
            flex-wrap: wrap;
        }

        .classic-button {
            padding: 12px 25px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            min-width: 120px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            font-family: inherit;
        }

            .classic-button.primary {
                background: var(--primary);
                color: white;
                box-shadow: 0 4px 6px rgba(44, 62, 80, 0.2);
            }

            .classic-button.success {
                background: var(--success);
                color: white;
                box-shadow: 0 4px 6px rgba(39, 174, 96, 0.2);
            }

            .classic-button.warning {
                background: var(--warning);
                color: white;
                box-shadow: 0 4px 6px rgba(243, 156, 18, 0.2);
            }

            .classic-button.danger {
                background: var(--danger);
                color: white;
                box-shadow: 0 4px 6px rgba(231, 76, 60, 0.2);
            }

            .classic-button.secondary {
                background: #95a5a6;
                color: white;
                box-shadow: 0 4px 6px rgba(149, 165, 166, 0.2);
            }

            .classic-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            }

            .classic-button:active {
                transform: translateY(0);
            }

        /* Classic GridView */
        .classic-grid-container {
            margin-top: 30px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        #GridView1 {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

            #GridView1 th {
                background: linear-gradient(135deg, var(--primary), var(--secondary));
                color: white;
                padding: 15px;
                text-align: left;
                font-weight: 600;
                border-bottom: 2px solid var(--accent);
            }

            #GridView1 td {
                padding: 12px 15px;
                border-bottom: 1px solid #eee;
            }

            #GridView1 tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            #GridView1 tr:hover {
                background-color: #f1f1f1;
            }

        /* Back Button */
        .back-section {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        /* 3D Animated Background */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .bg-cube {
            position: absolute;
            top: 80vh;
            left: 45vw;
            width: 10px;
            height: 10px;
            border: solid 1px rgba(52, 152, 219, 0.1);
            transform-origin: top left;
            transform: scale(0) rotate(0deg) translate(-50%, -50%);
            animation: cube 12s ease-in forwards infinite;
        }

            .bg-cube:nth-child(2n) {
                border-color: rgba(52, 152, 219, 0.15);
            }

            .bg-cube:nth-child(2) {
                animation-delay: 2s;
                left: 25vw;
                top: 40vh;
            }

            .bg-cube:nth-child(3) {
                animation-delay: 4s;
                left: 75vw;
                top: 50vh;
            }

            .bg-cube:nth-child(4) {
                animation-delay: 6s;
                left: 90vw;
                top: 10vh;
            }

            .bg-cube:nth-child(5) {
                animation-delay: 8s;
                left: 10vw;
                top: 85vh;
            }

            .bg-cube:nth-child(6) {
                animation-delay: 10s;
                left: 50vw;
                top: 10vh;
            }

        @keyframes cube {
            from {
                transform: scale(0) rotate(0deg) translate(-50%, -50%);
                opacity: 1;
            }

            to {
                transform: scale(20) rotate(960deg) translate(-50%, -50%);
                opacity: 0;
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .classic-container {
                margin: 20px;
                border-radius: 8px;
            }

            .classic-buttons {
                flex-direction: column;
            }

            .classic-button {
                width: 100%;
            }

            .classic-table td:first-child {
                width: 120px;
                padding-left: 10px;
            }

            .classic-table td:last-child {
                padding-right: 10px;
            }

            .classic-form {
                padding: 20px;
            }
        }

        /* Print Styles */
        @media print {
            .classic-container {
                box-shadow: none;
                border: 1px solid #000;
            }

            .classic-buttons, .back-section {
                display: none;
            }
        }
    </style>
</head>
<body>
    <!-- 3D Animated Background -->
    <div class="bg-animation">
        <div class="bg-cube"></div>
        <div class="bg-cube"></div>
        <div class="bg-cube"></div>
        <div class="bg-cube"></div>
        <div class="bg-cube"></div>
        <div class="bg-cube"></div>
    </div>

    <form id="form1" runat="server">
        <div class="classic-container">
            <!-- Classic Header -->
            <div class="classic-header">
                <h1><i class="fas fa-user-graduate"></i>Student Management</h1>
                <p>EduManage School System - Maintain student records with precision</p>
            </div>

            <!-- Classic Form -->
            <div class="classic-form">
                <div class="form-section">
                    <h2 class="form-section-title">Student Information</h2>

                    <table class="classic-table">
                        <tr>
                            <td>Enrollment No:</td>
                            <td>
                                <asp:TextBox ID="txtEnrlNo" runat="server" CssClass="classic-input" placeholder="Enter enrollment number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Full Name:</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" CssClass="classic-input" placeholder="Enter student full name"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Age:</td>
                            <td>
                                <asp:TextBox ID="txtAge" runat="server" CssClass="classic-input" placeholder="Enter age" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>City:</td>
                            <td>
                                <asp:TextBox ID="txtCity" runat="server" CssClass="classic-input" placeholder="Enter city of residence"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td>
                                <asp:TextBox ID="txtpwd" runat="server" CssClass="classic-input" placeholder="Enter Password"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- Action Buttons -->
                <div class="classic-buttons">
                    <asp:Button ID="BtnInsert" runat="server" Text="Insert" OnClick="Button1_Click" CssClass="classic-button success" />
                    <asp:Button ID="BunUpdate" runat="server" Text="Update" OnClick="BunUpdate_Click" CssClass="classic-button primary" />
                    <asp:Button ID="BunDelet" runat="server" Text="Delete" OnClick="BunDelet_Click" CssClass="classic-button danger" />
                    <asp:Button ID="BunReset" runat="server" Text="Reset" OnClick="BunReset_Click" CssClass="classic-button secondary" />
                </div>

                <!-- Student Records Grid -->
                <div class="form-section">
                    <h2 class="form-section-title">Student Records</h2>
                    <div class="classic-grid-container">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="student-grid">
                            <Columns>
                                <asp:BoundField DataField="EnrlNo" HeaderText="Enrollment No" />
                                <asp:BoundField DataField="Name" HeaderText="Full Name" />
                                <asp:BoundField DataField="Age" HeaderText="Age" />
                                <asp:BoundField DataField="City" HeaderText="City" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>

                <!-- Back Button -->
                <div class="back-section">
                    <asp:Button ID="Back" runat="server" Text="Back to Dashboard" OnClick="Back_Click" CssClass="classic-button warning" />
                </div>
            </div>
        </div>
    </form>

    <script>
        // Add subtle animations to form elements
        document.addEventListener('DOMContentLoaded', function () {
            const inputs = document.querySelectorAll('.classic-input');
            inputs.forEach((input, index) => {
                input.style.animationDelay = `${index * 0.1}s`;
            });

            // Add focus effects
            inputs.forEach(input => {
                input.addEventListener('focus', function () {
                    this.parentElement.parentElement.style.backgroundColor = '#f8f9fa';
                });

                input.addEventListener('blur', function () {
                    this.parentElement.parentElement.style.backgroundColor = '';
                });
            });
        });
    </script>
</body>
</html>
