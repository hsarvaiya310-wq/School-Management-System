<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="schoolms.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - School Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f8fafc;
            color: #334155;
            line-height: 1.6;
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
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }

        .illustration-section {
            flex: 1;
            background: linear-gradient(135deg, #4a6cf7 0%, #6a11cb 100%);
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }

        .illustration-section h2 {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .illustration-section p {
            font-size: 16px;
            opacity: 0.9;
            max-width: 300px;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        .illustration {
            margin: 40px 0;
            font-size: 120px;
        }

        .create-account-link {
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

        .create-account-link:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .form-section {
            flex: 1;
            padding: 50px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            font-weight: 700;
            font-size: 24px;
            color: #1e293b;
        }

        .logo-icon {
            background: #4a6cf7;
            color: white;
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            font-weight: 600;
            font-size: 20px;
        }

        h1 {
            font-size: 28px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 30px;
            font-size: 15px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
            color: #374151;
        }

        .textbox {
            width: 100%;
            padding: 14px 16px;
            border: 1px solid #d1d5db;
            border-radius: 8px;
            font-size: 15px;
            transition: all 0.2s ease;
            background-color: #f8fafc;
        }

        .textbox:focus {
            outline: none;
            border-color: #4a6cf7;
            box-shadow: 0 0 0 3px rgba(74, 108, 247, 0.1);
            background-color: #fff;
        }

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

        .btn-login {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #4a6cf7 0%, #6a11cb 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(74, 108, 247, 0.4);
        }

        .register-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #64748b;
        }

        .register-link a {
            color: #4a6cf7;
            text-decoration: none;
            font-weight: 600;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: #dc2626;
            font-size: 13px;
            margin-top: 5px;
            display: none;
        }

        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            font-size: 14px;
            color: #475569;
        }

        .remember-me input {
            margin-right: 8px;
        }

        /* Enhanced button styling to match reference image exactly */
        .role-buttons {
            display: flex;
            gap: 10px;
            margin-top: 15px;
            justify-content: center;
        }

        #TeacherLogin, #Student_Login {
            display: inline-block;
            background-color: #e9ecff;
            color: #4a6cf7;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        #TeacherLogin:hover, #Student_Login:hover {
            background-color: #dbe4ff;
            transform: translateY(-1px);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            
            .illustration-section {
                padding: 30px 25px;
            }
            
            .form-section {
                padding: 30px 25px;
            }
            
            .role-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            #TeacherLogin, #Student_Login {
                width: 120px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="illustration-section">
                <h2>Welcome Back</h2>
                <p>Sign in to access your school management system account and continue your work.</p>
                <div class="illustration">🔐</div>
                <a href="Register.aspx" class="create-account-link">New to SchoolMS? Create an account</a>
            </div>
            
            <div class="form-section">
                <div class="logo">
                    <div class="logo-icon">S</div>
                    SchoolMS
                </div>
                
                <h1>Sign In</h1>
                <p class="subtitle">Enter your credentials to access your account</p>
                
                <div class="form-group">
                    <label for="txteml">Email Address</label>
                    <asp:TextBox ID="txteml" runat="server" CssClass="textbox" placeholder="Enter your email address"></asp:TextBox>
                    <div class="error-message" id="emailError">Please enter a valid email address</div>
                </div>
                
                <div class="form-group">
                    <label for="txtpwd">Password</label>
                    <div class="password-container">
                        <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" CssClass="textbox" placeholder="Enter your password"></asp:TextBox>
                        <button type="button" class="toggle-password" onclick="togglePassword('txtpwd')">Show</button>
                    </div>
                    <div class="error-message" id="passwordError">Please enter your password</div>
                </div>
                
                <div class="remember-me">
                    <asp:CheckBox ID="rememberMe" runat="server" />
                    <label for="rememberMe">Remember me</label>
                </div>
                
                <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" CssClass="btn-login" />
                
                <p class="register-link">Don't have an account? <a href="Register.aspx">Register here</a></p>
                
                <div class="role-buttons">
                    <asp:Button ID="TeacherLogin" runat="server" Text="Teacher" OnClick="TeacherLogin_Click" />
                    <asp:Button ID="Student_Login" runat="server" Text="Student" OnClick="Student_Login_Click" />
                </div>
            </div>
        </div>
    </form>

    <script>
        function togglePassword(textboxId) {
            const textbox = document.getElementById(textboxId);
            const toggleButton = textbox.parentNode.querySelector('.toggle-password');

            if (textbox.type === 'password') {
                textbox.type = 'text';
                toggleButton.textContent = 'Hide';
            } else {
                textbox.type = 'password';
                toggleButton.textContent = 'Show';
            }
        }

        // Simple client-side validation
        document.getElementById('Button1').addEventListener('click', function (event) {
            let isValid = true;

            // Email validation
            const email = document.getElementById('txteml').value;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('emailError').style.display = 'none';
            }

            // Password validation
            const password = document.getElementById('txtpwd').value;
            if (password.length < 1) {
                document.getElementById('passwordError').style.display = 'block';
                isValid = false;
            } else {
                document.getElementById('passwordError').style.display = 'none';
            }

            if (!isValid) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>