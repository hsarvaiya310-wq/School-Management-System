<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Login.aspx.cs" Inherits="schoolms.Student_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Login - SchoolMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }
        
        body {
            background-color: #f5f7fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            display: flex;
            max-width: 1000px;
            width: 100%;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        
        .left-panel {
            flex: 1;
            background: linear-gradient(135deg, #4a6cf7 0%, #6a11cb 100%);
            color: white;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            justify-content: center;
        }
        
        .logo-icon {
            font-size: 28px;
            font-weight: bold;
            margin-right: 10px;
            background: white;
            color: #4a6cf7;
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .logo-text {
            font-size: 24px;
            font-weight: 600;
        }
        
        .welcome-text {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 15px;
        }
        
        .sub-text {
            font-size: 16px;
            margin-bottom: 30px;
            opacity: 0.9;
            line-height: 1.5;
            max-width: 300px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .create-account {
            color: white;
            text-decoration: none;
            font-weight: 600;
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 6px;
            transition: all 0.3s;
        }
        
        .create-account:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .right-panel {
            flex: 1;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .signin-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 10px;
            color: #333;
        }
        
        .signin-subtitle {
            color: #666;
            margin-bottom: 30px;
        }
        
        .form-container {
            width: 100%;
        }
        
        .form-container table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .form-container tr {
            margin-bottom: 20px;
            display: block;
        }
        
        .form-container td {
            padding: 10px 0;
            vertical-align: middle;
        }
        
        .form-container td:first-child {
            width: 35%;
            font-weight: 600;
            color: #333;
            padding-right: 15px;
        }
        
        .form-container td:last-child {
            width: 65%;
        }
        
        .form-container input[type="text"], 
        .form-container input[type="password"] {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
            background-color: #f8fafc;
        }
        
        .form-container input[type="text"]:focus,
        .form-container input[type="password"]:focus {
            border-color: #4a6cf7;
            outline: none;
            box-shadow: 0 0 0 3px rgba(74, 108, 247, 0.1);
            background-color: #fff;
        }
        
        .main-login-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #4a6cf7 0%, #6a11cb 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
        }
        
        .main-login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(74, 108, 247, 0.4);
        }
        
        .role-buttons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
            justify-content: center;
        }
        
        .role-buttons input[type="submit"] {
            flex: 1;
            padding: 12px;
            background: #f8fafc;
            color: #4a6cf7;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .role-buttons input[type="submit"]:hover {
            background: #e9ecff;
            border-color: #4a6cf7;
        }
        
        .register-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }
        
        .register-link a {
            color: #4a6cf7;
            text-decoration: none;
            font-weight: 600;
        }
        
        .register-link a:hover {
            text-decoration: underline;
        }
        
        .student-tag {
            display: inline-block;
            background-color: #e9ecff;
            color: #4a6cf7;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            margin-top: 15px;
            text-align: center;
            width: 100%;
        }

        /* Password field styling */
        .password-container {
            position: relative;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #4a6cf7;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
        }

        /* Remember me checkbox */
        .remember-me {
            display: flex;
            align-items: center;
            margin: 15px 0;
        }

        .remember-me input {
            margin-right: 8px;
        }

        .remember-me label {
            font-size: 14px;
            color: #666;
            font-weight: 500;
        }
        
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .left-panel {
                padding: 30px 25px;
            }
            
            .right-panel {
                padding: 30px 25px;
            }
            
            .form-container td:first-child {
                width: 100%;
                display: block;
                padding-right: 0;
                margin-bottom: 5px;
            }
            
            .form-container td:last-child {
                width: 100%;
                display: block;
            }
            
            .role-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="left-panel">
                <div class="logo">
                    <div class="logo-icon">S</div>
                    <div class="logo-text">SchoolMS</div>
                </div>
                <h1 class="welcome-text">Welcome Back</h1>
                <p class="sub-text">Sign in to access your school management system account and continue your work.</p>
                <a href="#" class="create-account">New to SchoolMS? Create an account</a>
            </div>
            
            <div class="right-panel">
                <h2 class="signin-title">Sign In</h2>
                <p class="signin-subtitle">Enter your credentials to access your account</p>
                
                <div class="form-container">
                    <form>
                       <table>
                           <tr>
                               <td>Enrolment No</td>
                               <td>
                                   <asp:TextBox ID="txtenr" runat="server" placeholder="Enter your enrolment number"></asp:TextBox></td>
                           </tr>
                           <tr>
                               <td>Password</td>
                               <td>
                                   <div class="password-container">
                                       <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                                       <button type="button" class="toggle-password" onclick="togglePassword()">Show</button>
                                   </div>
                               </td>
                           </tr>
                            <tr>
                               <td colspan="2">
                                   <div class="remember-me">
                                       <input type="checkbox" id="rememberMe">
                                       <label for="rememberMe">Remember me</label>
                                   </div>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">
                                   <asp:Button ID="Login" runat="server" Text="Login" CssClass="main-login-btn" OnClick="Login_Click" />
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">
                                   <div class="role-buttons">
                                       <asp:Button ID="Admin_Login" runat="server" Text="Admin" OnClick="Admin_Login_Click" />
                                       <asp:Button ID="Teacher_Login" runat="server" Text="Teacher" OnClick="Teacher_Login_Click" />
                                   </div>
                               </td>
                           </tr>
                       </table>
                    </form>
                </div>
                
                <p class="register-link">Don't have an account? <a href="#">Register here</a></p>
                <div class="student-tag">Student</div>
            </div>
        </div>
    </form>

    <script>
        function togglePassword() {
            const passwordField = document.getElementById('txtpw');
            const toggleButton = document.querySelector('.toggle-password');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                toggleButton.textContent = 'Hide';
            } else {
                passwordField.type = 'password';
                toggleButton.textContent = 'Show';
            }
        }
    </script>
</body>
</html>